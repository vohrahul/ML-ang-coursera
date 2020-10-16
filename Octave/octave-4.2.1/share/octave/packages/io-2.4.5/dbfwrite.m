## Copyright (C) 2015-2016 Philip Nienhuis
## 
## This program is free software; you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <http://www.gnu.org/licenses/>.

## -*- texinfo -*- 
## @deftypefn  {Function File} [@var{status}] = dbfwrite (@var{fname}, @var{data})
## Write data in a cell array to a dbf (xBase) file, provisionally dBase III+.
##
## @var{fname} must be a valid file name, optionally with '.dbf' suffix.
## @var{data} should be a cell array of which the top row contains column
## names (character strings). Each column must contain only one class of data,
## except of course the top entry (the column header).
## Value type that can be written are character (text sring), numeric
## (integer and float, the latter with 6 decimal places), and logical.
## 
## Ouput argument @var{status} is 1 if the file was written successfully, 0
## otherwise.
##
## Provisionally only dBase v. III+ files can be written without memos.
##
## @seealso{dbfread}
## @end deftypefn

## Author: Philip Nienhuis <prnienhuis@users.sf.net>
## Created: 2014-12-24

function [status] = dbfwrite (fname, data)

  status = 0;
  ## Input validation
  if (! ischar (fname))
    error ("dbfwrite: file name expected for argument #1\n");
  elseif (! iscell (data))
    error ("dbfwrite: cell array expected for argument #2\n");
  elseif (! iscellstr (data (1, :)))
    error ("dbfwrite: column header titles (text) expected on first row of data\n");
  endif
  ## Column headers length cannot exceed 10 characters
  toolong = [];
  for ii=1:size (data, 2)
    title = data{1, ii};
    if (length (title) > 10)
      toolong = [ toolong, ii ];
      data(1, ii) = title(1:10);
    endif
  endfor
  if (! isempty (toolong))
    ## Truncate headers if required and check for uniqueness
    warning ("dbfwrite: one or more column header(s) > 10 characters - truncated\n");
    fmt = [repmat(sprintf ("%d "), 1, numel (toolong))(:)];
    printf ("Applies to columns %s\n", sprintf (fmt, toolong));
    if (numel (unique (data(1, :))) < numel (data(1, :)))
      error ("dbfwrite: column headers aren't unique - please fix data\n");
    endif
  endif

  ## Assess nr of records
  ## Data contains header row. Data toprow = 2
  nrecs = size (data, 1) - 1;
  tr = 2;

  ## Check file name
  [pth, fnm, ext] = fileparts (fname);
  if (isempty (ext))
    fname = [fname ".dbf"];
  elseif (! strcmpi (ext, ".dbf"))
    error ("dbfwrite: file name should have a '.dbf' suffix\n");
  endif
  ## Try to open file
  fid = fopen (fname, "w+");
  if (fid < 0)
    error ("dbfwrite: could not open file %s\n", fname);
  endif

  ## Start writing header
  ## Provisionally assume dbase III+ w/o memos
  fwrite (fid, 3, "uint8");
  upd = datevec (date);
  fwrite (fid, upd(1) - 1900, "uint8");
  fwrite (fid, upd(2), "uint8");
  fwrite (fid, upd(3), "uint8");
  fwrite (fid, nrecs, "uint32");
  ## The next two uint16 fields are to be written later, just fill temporarily
  pos_lhdr = ftell (fid);
  fwrite (fid, 0, "uint32");
  ## Another place holder, write enough to allow next fseek to succeed
  fwrite (fid, uint32 (zeros (1, 7)), "uint32");

  ## Write record descriptors
  nfields  = size (data, 2);
  fldtyp   = "";
  fldlngs  = {};
  reclen   = 1;                                             ## "Erased" byte first
  fseek (fid, 32, "bof");
  for ii=1:nfields
    decpl = 0;
    recdesc = sprintf ("%d", uint32 (zeros (1, 8)));
    recdesc(1:10) = strjust (sprintf ("%10s", data{1, ii}), "left"); ## Field name
    if (isnumeric ([data{tr:end, ii}]))
      if (isinteger ([data{tr:end, ii}]) ||
        all ([data{tr:end, ii}] - floor([data{tr:end, ii}]) < eps))
        ftype = "N";
        decpl = 0;
      else
        ftype = "F";
        ## ML compatibility for .dbf/.shp file: 6 decimal places
        decpl = 6;
      endif
      fldlng = 20;
    elseif (ischar ([data{tr:end, ii}]))
      ftype = "C";
      fldlng = max (cellfun (@(x) length(x), data(tr:end))) + 1;
    elseif (islogical ([data{tr:end, ii}]))
      ftype = "L";
      fldlng = 1;
    endif
    recdesc(12) = ftype;                                    ## Field type
    fldtyp      = [ fldtyp ftype ];
    recdesc(17) = uint8 (fldlng);                           ## Field length
    recdesc(18) = uint8 (decpl);                            ## Decimal places
    recdesc(32) = "\0";                                     ## Fill to byte# 32
    fwrite (fid, recdesc, "char");
    reclen += fldlng;
    fldlngs = [ fldlngs; sprintf("%d", fldlng) ];
  endfor
  ## Write header record terminator
  fwrite (fid, 13, "uint8");
  ## Remember position
  fpos_data = ftell (fid);
  ## Write missing data in header
  fseek (fid, pos_lhdr, "bof");
  fwrite (fid, fpos_data, "uint16");
  fwrite (fid, reclen, "uint16");

  ## Write data2
  fseek (fid, fpos_data, "bof");
  ## FIXME replace by vectorized code (num2str etc) & concatenating columns
  ##       for speeding up
  for ii=tr:nrecs+tr-1
    ## Write "erased" byte
    fwrite (fid, "\0", "uint8");
    for jj=1:nfields
      switch fldtyp(jj)
        case "C"
          txt = sprintf (["%" fldlngs{jj} "s"], data{ii, jj});
        case "N"
          txt = sprintf (["%" fldlngs{jj} "d"], data{ii, jj});
        case "L"
          if (data{ii, jj})
            txt = "Y";
          else
            txt = "N";
          endif
        case "F"
          txt = sprintf (["%" fldlngs{jj} "f"], data{ii, jj});
        case "D"
          % txt = sprintf (["%" fldlngs{jj} "s"], data{ii, jj});
        otherwise
      endswitch
      fwrite (fid, txt, "char");
    endfor
  endfor
  
  ## Close file
  fclose (fid);
  status = 1;

endfunction
