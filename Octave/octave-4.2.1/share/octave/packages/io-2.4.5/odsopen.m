## Copyright (C) 2009-2016 Philip Nienhuis
## 
## This program is free software; you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 2 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with Octave; see the file COPYING.  If not, see
## <http://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn {Function File} @var{ods} = odsopen (@var{filename})
## @deftypefnx {Function File} @var{ods} = odsopen (@var{filename}, @var{readwrite})
## @deftypefnx {Function File} @var{ods} = odsopen (@var{filename}, @var{readwrite}, @var{reqintf})
## Get a pointer to an OpenOffice_org spreadsheet in the form of return
## argument @var{ods}.
##
## Calling odsopen without specifying a return argument is fairly useless!
##
## Octave links to external software for read/write support of spreadsheets;
## these links are "interfaces".  For I/O from/to ODS 1.2 and Gnumeric
## XML, in principle no external SW is required, this "interface" is called
## 'OCT'.  For more flexibility and better performance, you need a Java JRE
## or JDK plus one or more of (ODFtoolkit (version 0.7.5 or 0.8.6 - 0.8.8) &
## xercesImpl v.2.9.1), jOpenDocument, or OpenOffice.org (or clones) installed
## on your computer + proper javaclasspath set.  These interfaces are referred
## to as OTK, JOD, and UNO resp., and are preferred in that order by default
## (depending on their presence; the OCT interface has lowest priority).
## The relevant Java class libs for spreadsheet I/O had best be added to the
## javaclasspath by utility function chk_spreadsheet_support().
## For the OTK, JOD and UNO interfaces in Octave older than 3.8.0, the
## octave-forge Java package >=1.2.9 is required.  Newer Octave versions
## should have Java support built-in.
##
## @var{filename} must be a valid .ods OpenOffice.org Calc, or Gnumeric, file
## name including .ods or .gnumeric suffix.  If @var{filename} does not contain
## any directory path, the file is saved in the current directory.  For UNO
## bridge, filenames need to be in the form "file:///<path_to_file>/filename";
## a URL will also work. If a plain file name is given (absolute or relative),
## odsopen() will try to transform it into a proper form.
##
## @var{readwrite} must be set to true or numerical 1 if writing to spreadsheet
## is desired immediately after calling odsopen().  It merely serves proper
## handling of file errors (e.g., "file not found" or "new file created").
##
## Optional input argument @var{reqintf} can be used to override the ODS
## interface automatically selected by odsopen.  Currently implemented
## interfaces are 'OTK' (Java/ODF Toolkit), 'JOD' (Java/jOpenDocument), 'UNO'
## (Java/OpenOffice.org UNO bridge), and 'OCT' (native Octave, for Gnumeric.
## In most situations this parameter is unneeded as odsopen
## automatically selects the most useful interface present ("default
## interface").  Depending on file type, odsopen.m can invoke other detected
## interfaces than the default one.
##
## Beware:
## The UNO interface is still experimental.  While in itself reliable, it may
## have undesired side effects on Open-/LibreOffice windows outside Octave.
##
## Examples:
##
## @example
##   ods = odsopen ('test1.ods');
##   (get a pointer for reading from spreadsheet test1.ods)
##
##   ods = odsopen ('test2.ods', [], 'JOD');
##   (as above, indicate test2.ods will be read from; in this case using
##    the jOpenDocument interface is requested)
## @end example
##
## @seealso {odsclose, odsread, oct2ods, ods2oct, odsfinfo, chk_spreadsheet_support}
##
## @end deftypefn

## Author: Philip Nienhuis <prnienhuis at users.sf.net>
## Created: 2009-12-13

function [ ods ] = odsopen (filename, rw=0, reqinterface=[])

  persistent odsinterfaces; persistent chkintf; persistent lastintf;
  if (isempty (chkintf))
    odsinterfaces = struct ( "OTK", [], "JOD", [], "UNO", [] , "OCT", []);
    chkintf = 1;
  endif
  if (isempty (lastintf));
    lastintf = "---";
  endif
  odsintf_cnt = 1;
  
  if (nargout < 1)
    error ("No return argument specified!\n usage: ODS = odsopen (ODSfile, [Rw]).\n");
  endif

  if (! (islogical (rw) || isnumeric (rw)))
      error ("odsopen.m: numerical or logical value expected for arg ## 2 (readwrite)\n")
  endif

  if (ischar (filename))
    [pth, fnam, ext] = fileparts (filename);
    if (isempty (fnam))
      error ("odsopen.m: no filename or empty filename specified");
    endif
    if (rw && ! isempty (pth))
      apth = make_absolute_filename (pth);
      if (exist (apth) != 7)
        error ("odsopen.m: cannot write into non-existent directory:\n'%s'\n", ...
               apth);
      endif
    endif
  else
    error ("odsopen.m: filename expected for argument #1");
  endif

  if (! isempty (reqinterface))
    intfmsg = "requested";
    if (! (ischar (reqinterface) || iscell (reqinterface)))
      error ("odsopen.m: arg # 3 (interface) not recognized\n");
    endif
    ## Turn arg3 into cell array if needed
    if (! iscell (reqinterface))
      reqinterface = {reqinterface};
    endif
    ## Check if previously used interface matches a requested interface
    if (isempty (regexpi (reqinterface, lastintf, "once"){1}))
      ## New interface requested. OCT is always supported but it must be
      ## possible to disable it
      odsinterfaces.OTK = 0; odsinterfaces.JOD = 0; odsinterfaces.UNO = 0;
      odsinterfaces.OCT = 0;
      for ii=1:numel (reqinterface)
        reqintf = toupper (reqinterface {ii});
        ## Try to invoke requested interface(s) for this call. Check if it
        ## is supported anyway by emptying the corresponding var.
        if     (strcmpi (reqintf, "OTK"))
          odsinterfaces.OTK = [];
        elseif (strcmpi (reqintf, "JOD"))
          odsinterfaces.JOD = [];
        elseif (strcmpi (reqintf, "UNO"))
          odsinterfaces.UNO = [];
        elseif (strcmpi (reqintf, "OCT"))
          odsinterfaces.OCT = [];
        else 
          error (sprintf (["odsopen.m: unknown .ods interface \"%s\" requested.\n" ...
                  "Only OTK, JOD, UNO and OCT supported\n"], reqinterface{}));
        endif
      endfor

      printf ("Checking requested interface(s):\n");
      odsinterfaces = getodsinterfaces (odsinterfaces);
      ## Well, is/are the requested interface(s) supported on the system?
      for ii=1:numel (reqinterface)
        if (! odsinterfaces.(toupper (reqinterface{ii})))
          ## No it aint
          printf ("%s is not supported.\n", toupper (reqinterface{ii}));
        else
          ++odsintf_cnt;
        endif
      endfor
      ## Reset interface check indicator if no requested support found
      if (! odsintf_cnt)
        chkintf = [];
        ods = [];
        return
      endif
    endif
  else
    intfmsg = "available";
  endif
  
  ## Var rw is really used to avoid creating files when wanting to read, or
  ## not finding not-yet-existing files when wanting to write a new one.
  ## Be sure it's either 0 or 1 initially
  if (rw)
    [~, ~, ext] = fileparts (filename);
    ## .ods write support is supported
    rw = 1;
  endif

  ## Check if file exists. Set open mode based on rw argument
  if (rw)
    fmode = "r+b";
  else
    fmode = "rb";
  endif
  fid = fopen (filename, fmode);
  if (fid < 0)
    if (! rw)                 ## Read mode requested but file doesn't exist
      err_str = sprintf ("odsopen.m: file %s not found\n", filename);
      error (err_str)
    else        
      ## For writing we need more info:
      fid = fopen (filename, "rb");  
      ## Check if it can be opened for reading
      if (fid < 0)            ## Not found => create it
##      printf ("Creating file %s\n", filename);
        rw = 3;
      else                    ## Found but not writable = error
        fclose (fid);         ## Do not forget to close the handle neatly
        error (sprintf ("odsopen.m: write mode requested but file %s is not writable\n",...
                        filename))
      endif
    endif
  else
    ## Close file anyway to avoid Java errors
    fclose (fid);
  endif

  ## Check for the various ODS interfaces. No problem if they've already
  ## been checked, getodsinterfaces (far below) just returns immediately then.

  [odsinterfaces] = getodsinterfaces (odsinterfaces);

  ## Supported interfaces determined; now check ODS file type.
  ftype = 0;
  [~, ~, ext] = fileparts (filename);
  switch ext
    case {"xls", ".xls"}
      ## Because LibreOffice/OpenOffice.org accept Excel as well
      ftype = 1;
    case {"xlsx", "xlsm", ".xlsb", ".xlsx", ".xlsm", ".xlsb"}
      ## Because LibreOffice/OpenOffice.org accept Excel as well
      ftype = 2;
    case ".ods"               ## ODS 1.2
      ftype = 3;
    case ".sxc"               ## jOpenDocument (JOD) can read from .sxc files,
      ftype = 4;               ## but only if odfvsn = 2
    case ".gnumeric"          ## Zipped XML / gnumeric
      ftype = 5;
    case ".csv"               ## ODS 1.2
      ftype = 6;
    otherwise
  endswitch

  ods = struct ("xtype",    [], 
                "app",      [], 
                "filename", [], 
                "workbook", [], 
                "changed",  0, 
                "limits",   [], 
                "odfvsn",   []);

  ## Preferred interface = OTK (ODS toolkit & xerces), so it comes first. 
  ## Keep track of which interface is selected. Can be used (later) for
  ## fallback to other interface
  odssupport = 0;

  if (odsinterfaces.OTK && ! odssupport && ftype == 3)
    [ ods, odssupport, lastintf ] = ...
              __OTK_spsh_open__ (ods, rw, filename, odssupport);
  endif

  if (odsinterfaces.JOD && ! odssupport && (ftype == 3 || ftype == 4))
    [ ods, odssupport, lastintf ] = ...
              __JOD_spsh_open__ (ods, rw, filename, odssupport);
  endif

  if (odsinterfaces.UNO && ! odssupport && ismember (ftype, [1:3, 6]))
    [ ods, odssupport, lastintf ] = ...
              __UNO_spsh_open__ (ods, rw, filename, odssupport);
  endif

  if (odsinterfaces.OCT && ! odssupport && ismember (ftype, [2, 3, 5]))
    [ ods, odssupport, lastintf ] = ...
              __OCT_spsh_open__ (ods, rw, filename, odssupport, ftype);
  endif

  ## if 
  ##   <other interfaces here>

  if (! odssupport)
    ## Below message follows after getodsinterfaces
    printf ("None.\n");
    warning ("odsopen.m: no %s spreadsheet I/O support with %s interface(s).\n", ...
             ext, intfmsg);
    ods = [];
    chkintf = [];
  else
    # From here on rw is tracked via ods.changed in the various lower
    # level r/w routines and it is only used to determine if an informative
    # message is to be given when saving a newly created ods file.
    ods.changed = rw;

    # ods.changed = 0 (existing/only read from), 1 (existing/data added), 2 (new,
    # data added) or 3 (pristine, no data added).
    # Until something was written to existing files we keep status "unchanged".
    if (ods.changed == 1);
      ods.changed = 0;
    endif
  endif

endfunction
