## Copyright (C) 2009-2016 Philip Nienhuis
##
## This program is free software; you can redistribute it and/or modify it under
## the terms of the GNU General Public License as published by the Free Software
## Foundation; either version 3 of the License, or (at your option) any later
## version.
##
## This program is distributed in the hope that it will be useful, but WITHOUT
## ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
## FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more
## details.
##
## You should have received a copy of the GNU General Public License along with
## this program; if not, see <http://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn {Function File} [ @var{ods}, @var{rstatus} ] = oct2ods (@var{arr}, @var{ods})
## @deftypefnx {Function File} [ @var{ods}, @var{rstatus} ] = oct2ods (@var{arr}, @var{ods}, @var{wsh})
## @deftypefnx {Function File} [ @var{ods}, @var{rstatus} ] = oct2ods (@var{arr}, @var{ods}, @var{wsh}, @var{range})
## @deftypefnx {Function File} [ @var{ods}, @var{rstatus} ] = oct2ods (@var{arr}, @var{ods}, @var{wsh}, @var{range}, @var{options})
##
## Transfer data to an OpenOffice_org Calc (or gnumeric) spreadsheet
## previously opened by odsopen().
##
## Data in 1D/2D array @var{arr} are transferred into a cell range
## @var{range} in sheet @var{wsh}.  @var{ods} must have been made earlier
## by odsopen().  Return argument @var{ods} should be the same as supplied
## argument @var{ods} and is updated by oct2ods.  A subsequent call to
## odsclose is needed to write the updated spreadsheet to disk (and
## -if needed- close the Java invocation holding the file pointer).
##
## @var{arr} can be any 1D or 2D array containing numerical or character
## data (cellstr) except complex.  Mixed numeric/text arrays can only be
## cell arrays.
##
## @var{ods} must be a valid pointer struct created earlier by odsopen.
##
## @var{wsh} can be a number (sheet name) or string (sheet number).
## In case of a yet non-existing Calc file, the first sheet will be
## used & named according to @var{wsh}.
## In case of existing files, some checks are made for existing sheet
## names or numbers.
## When new sheets are to be added to the Calc file, they are
## inserted to the right of all existing sheets.  The pointer to the
## "active" sheet (shown when Calc opens the file) remains untouched.
##
## If @var{range} is omitted, the top left cell where the data will be
## put is supposed to be 'A1'; only a top left cell address can be
## specified as well.  In these cases the actual range to be used is
## determined by the size of @var{arr}.  If defined in the spreadsheet
## file, a "Named range" can also be specified.  In that case @var{wsh}
## will be ignored and the worksheet associated with the specified
## Named range will be used.
## Be aware that large data array sizes may exhaust the java shared
## memory space.  For larger arrays, appropriate memory settings are
## needed in the file java.opts; then the maximum array size for the
## java-based spreadsheet options can be in the order of perhaps 10^6
## elements.
##
## Optional argument @var{options}, a structure, can be used to specify
## various write modes.
## @table @asis
## @item "formulas_as_text"
## If set to 1 or TRUE formula strings ( i.e., text strings (assumed to
## start with "=" and end in a ")" ) are to be written as litteral
## text strings rather than as spreadsheet formulas (the latter is the
## default).  As jOpenDocument doesn't support formula I/O at all yet,
## this option is ignored for the JOD interface.
##
## @item 'convert_utf'
## If set to 1 or TRUE, oct2ods converts one-byte characters outside the
## range [32:127] to UTF-8 so that they are properly entered as UTF-8
## encoded text in spreadsheets.  The default value is 0.
## @end table
##
## Data are added to the sheet, ignoring other data already present;
## existing data in the range to be used will be overwritten.
##
## If @var{range} contains merged cells, also the elements of @var{arr}
## not corresponding to the top or left Calc cells of those merged cells
## will be written, however they won't be shown until in Calc the merge is
## undone.
##
## Examples:
##
## @example
##   [ods, status] = oct2ods (arr, ods, 'Newsheet1', 'AA31:GH165');
##   Write array arr into sheet Newsheet1 with upperleft cell at AA31
## @end example
##
## @example
##   [ods, status] = oct2ods (@{'String'@}, ods, 'Oldsheet3', 'B15:B15');
##   Put a character string into cell B15 in sheet Oldsheet3
## @end example
##
## @seealso {ods2oct, odsopen, odsclose, odsread, odswrite, odsfinfo}
##
## @end deftypefn

## Author: Philip Nienhuis <pr.nienhuis at users.sf.net>
## Created: 2009-12-13

function [ ods, rstatus ] = oct2ods (c_arr, ods, wsh=1, crange="", spsh_opts=[])

  if (nargin < 2)
    error ("oct2xls needs a minimum of 2 arguments.");
  endif
  
  ## Check if input array is cell
  if (isempty (c_arr))
    warning ("oct2ods: request to write empty matrix - ignored.\n"); 
    rstatus = 1;
    return;
  elseif (isnumeric (c_arr))
    c_arr = num2cell (c_arr);
  elseif (ischar(c_arr))
    c_arr = {c_arr};
    printf ("(oct2ods: input character array converted to 1x1 cell)\n");
  elseif (! iscell (c_arr))
    error ("oct2ods: input array neither cell nor numeric array.\n");
  endif
  if (ndims (c_arr) > 2)
    error ("oct2ods: only 2-dimensional arrays can be written to spreadsheet.\n");
  endif

  ## Check ods file pointer struct
  test1 = ! isfield (ods, "xtype");
  test1 = test1 || ! isfield (ods, "workbook");
  test1 = test1 || isempty (ods.workbook);
  test1 = test1 || isempty (ods.app);
  if test1
    error ("oct2ods: arg #2: Invalid ods file pointer struct.\n");
  endif

  ## Check worksheet ptr
  if (! (ischar (wsh) || isnumeric (wsh)))
    error ("oct2ods: integer (index) or text (wsh name) expected for arg # 3\n");
  endif

  ## Check range
  if (! isempty (crange) && ! ischar (crange))
    error ("oct2ods: character string (range) expected for arg # 4\n");
  elseif (isempty (crange))
    crange = "";
  elseif (! isempty (crange))
    ## Check for range name and convert it to range & optionally sheet
    ## 1. Check if it matches a range
    [crange, wsh, ods] = chknmrange (ods, crange, wsh);
  endif

  ## Various options 
  if (isempty (spsh_opts))
    spsh_opts.formulas_as_text = 0;
    spsh_opts.convert_utf = 0;
    ## other options to be implemented here
  elseif (isstruct (spsh_opts))
    if (! isfield (spsh_opts, "formulas_as_text"))
      spsh_opts.formulas_as_text = 0; 
    endif
    if (! isfield (spsh_opts, "convert_utf"))
      spsh_opts.convert_utf = 0;
    endif
    ## other options to be implemented here:
 
  else
    error ("oct2ods: structure expected for arg # 5\n" (options));
  endif
  
  if (nargout < 1)
    printf ("oct2ods: warning: no output spreadsheet file pointer specified.\n");
  endif

  ## Convert to UTF-8
  ## FIXME: Replace with the following when unicode2native is available:
  ##        obj = tidyxml (obj, @(str) unicode2native (str, "UTF-8"));
  if (spsh_opts.convert_utf)
    c_arr = tidyxml (c_arr, @unicode2utf8);
  endif

  if (strcmp (ods.xtype, "OTK"))
    ## Write ods file tru Java & ODF toolkit.
    switch ods.odfvsn
      case "0.7.5"
        [ ods, rstatus ] = __OTK_oct2ods__ (c_arr, ods, wsh, crange, spsh_opts);
      case {"0.8.6", "0.8.7", "0.8.8"}
        [ ods, rstatus ] = __OTK_oct2spsh__ (c_arr, ods, wsh, crange, spsh_opts);
      otherwise
        error ("oct2ods: unsupported odfdom version\n");
    endswitch

  elseif (strcmp (ods.xtype, "JOD"))
    ## Write ods file tru Java & jOpenDocument. API still leaves lots to be wished...
    [ ods, rstatus ] = __JOD_oct2spsh__ (c_arr, ods, wsh, crange);

  elseif (strcmp (ods.xtype, "UNO"))
    ## Write ods file tru UNO
    [ ods, rstatus ] = __UNO_oct2spsh__ (c_arr, ods, wsh, crange, spsh_opts);

  elseif (strcmp (ods.xtype, "OCT"))
    ## Replace illegal XML characters by XML escape sequences
    idx = cellfun (@ischar, c_arr);
    c_arr(idx) = strrep (c_arr(idx), "&", "&amp;" );
    c_arr(idx) = strrep (c_arr(idx), "<", "&lt;"  );
    c_arr(idx) = strrep (c_arr(idx), ">", "&gt;"  );
    c_arr(idx) = strrep (c_arr(idx), "'", "&apos;");
    c_arr(idx) = strrep (c_arr(idx), '"', "&quot" );
    ## Write ods or gnumeric file tru native Octave
    [ ods, rstatus ] = __OCT_oct2spsh__ (c_arr, ods, wsh, crange, spsh_opts);

  ##elseif 
    ##---- < Other interfaces here >

  else
    error (sprintf ("ods2oct: unknown OpenOffice.org .ods interface - %s.\n",...
                    ods.xtype));
  endif

  if (rstatus)
    ods.limits = [];
  endif

endfunction
