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
## @deftypefn {Function File} [@var{filetype}] = odsfinfo (@var{filename} [, @var{reqintf}])
## @deftypefnx {Function File} [@var{filetype}, @var{sh_names}] = odsfinfo (@var{filename} [, @var{reqintf}])
## @deftypefnx {Function File} [@var{filetype}, @var{sh_names}, @var{nmranges}] = odsfinfo (@var{filename} [, @var{reqintf}])
## @deftypefnx {Function File} [@var{filetype}, @var{sh_names}, @var{fformat}, @var{nmranges}] = odsfinfo (@var{filename} [, @var{reqintf}])
## Query an OpenOffice_org or Gnumeric spreadsheet file @var{filename}
## (with ods or gnumeric suffix) for some info about its contents.
##
## If @var{filename} is a recognizable OpenOffice.org or Gnumeric spreadsheet
## file, @var{filetype} returns the string "OpenOffice.org Calc spreadsheet"
## (or "Gnumeric spreadsheet"), or @'' (empty string) otherwise.
## 
## If @var{filename} is a recognizable OpenOffice.org Calc or Gnumeric
## spreadsheet file, optional argument @var{sh_names} contains a Nx2 list
## (cell array) of sheet names contained in @var{filename} and total used
## data ranges for each sheet, in the order (from left to right) in which
## they occur in the sheet stack.
##
## Optional output argument @var{fformat} is a string describing the file
## contents. 
##
## Optional return argument @var{nmranges} returns a list of Named ranges
## defined in the spreadsheet, if any.
##
## If you omit return arguments @var{filetype} and @var{sh_names} altogether,
## odsfinfo returns the sheet names and for each sheet the actual occupied
## data ranges to the screen.  The occupied cell range will have to be
## determined behind the scenes first; this can take some time.  If any
## Named ranges are defined in the spreadsheet file, they will be listed
## on the screen as well.  Named ranges work only for the OCT interface,
## with the UNO interface it doesn't work for .ods files.
## 
## odsfinfo execution can take its time for large spreadsheets as the entire
## spreadsheet has to be parsed to get the sheet names, let alone exploring
## used data ranges.
##
## By specifying a value of 'jod', 'otk', 'uno' or 'oct' for @var{reqintf} the
## automatic selection of the Java interface is bypassed and the specified
## interface will be used (if at all present).
##
## Examples:
##
## @example
##   exist = odsfinfo ('test4.ods');
##   (Just checks if file test4.ods is a readable Calc file) 
## @end example
##
## @example
##   [exist, names] = odsfinfo ('test4.ods');
##   (Checks if file test4.ods is a readable Calc file and return a 
##    list of sheet names) 
## @end example
##
## @seealso {odsread, odsopen, ods2oct, odsclose}
##
## @end deftypefn

## Author: Philip Nienhuis <pr.nienhuis at users.sf.net>
## Created: 2009-12-17

function [ filetype, sh_names, fformat, nmranges ] = odsfinfo (filename, reqintf=[])

  persistent str2; str2 = "                                 "; # 33 spaces
  persistent lstr2; lstr2 = length (str2);

  toscreen = nargout < 1;

  ods = odsopen (filename, 0, reqintf);
  ## If no ods support was found, odsopen will have complained. Just return here
  if (isempty (ods)), return; endif
  
  ## If any valid xls-pointer struct has been returned, it must be a valid
  ## spreadsheet. Find out what format
  [~, ~, ext] = fileparts (ods.filename); 
  switch ext
    case {".ods", "ods", ".sxc", "sxc"}
      filetype = "OpenOffice.org Calc Document";
    case {"gnumeric", ".gnumeric"}
      filetype = "Gnumeric spreadsheet";
    case {"xls", "xlsx", "xlsm", ".xlsb", ".xls", ".xlsx", ".xlsm", ".xlsb"}
      ## UNO (LO/OOo) and OCT also accept Excel spreadsheet files
      filetype = "Microsoft Excel Spreadsheet";
    otherwise
      filetype = "";
  endswitch

  ## To save execution time, only proceed if sheet names are wanted
  if ~(nargout == 1)

    if (strcmp (ods.xtype, "OTK"))
      [sh_names] = __OTK_spsh_info__ (ods);

    elseif (strcmp (ods.xtype, "JOD"))
      [sh_names] = __JOD_spsh_info__ (ods);
      
    elseif (strcmp (ods.xtype, "UNO"))
      [sh_names] = __UNO_spsh_info__ (ods);

    elseif (strcmp (ods.xtype, "OCT"))
      [sh_names] = __OCT_spsh_info__ (ods);

    else
      ## Below error will have been catched in odsopen() above
      ##error (sprintf ("odsfinfo: unknown OpenOffice.org .ods interface - %s.",...
      ##                ods.xtype));

    endif
  endif

  sh_cnt = size (sh_names, 1);
  if (toscreen)
    # Echo sheet names to screen
    for ii=1:sh_cnt
      str1 = sprintf ("%3d: %s", ii, sh_names{ii, 1});
      if (index (sh_names{ii, 2}, ":"))
        str3 = ["(Used range ~ " sh_names{ii, 2} ")"];
      else
        str3 = sh_names{ii, 2};
      endif
      printf ("%s%s%s\n", str1, str2(1:lstr2-length (sh_names{ii, 1})), str3);
    endfor
    ## Echo named ranges
    nmranges = getnmranges (ods);
    snmr = size (nmranges, 1);
    if (snmr > 0)
      ## Find max length of entries
      nmrl = min (35, max ([cellfun("length", nmranges(:, 1)); 10]));
      shtl = min (31, max ([cellfun("length", nmranges(:, 2)); 6]));
      rnml = max ([cellfun("length", nmranges(:, 3)); 5]);
      frmt = sprintf ("%%%ds  %%%ds  %%%ds\n" , nmrl, shtl, rnml);
      printf (["\n" frmt], "Range name", "Sheet", "Range");
      printf (frmt, "----------", "-----", "-----" );
      for ii=1:size (nmranges, 1)
        printf (frmt, nmranges(ii, 1:3){:});
      endfor
    endif

  elseif (sh_cnt > 0 && nargout > 2)
    ## Echo file format & named ranges
    if (strcmpi (ods.filename(end-2:end), "ods"))
      fformat = "ODSWorkbook";
    elseif (strcmpi (ods.filename(end-2:end), "sxc"))
      fformat = "StarOfficeWorkbook";
    elseif (strcmpi (ods.filename(end-7:end), "gnumeric"))
      fformat = "GnumericWorkbook";
    ## Below options exist because Open?LibreOffice also swallow Excel files
    elseif (strcmpi (ods.filename(end-2:end), "xls"))
      fformat = "xlWorkbookNormal";
    elseif (strcmpi (ods.filename(end-2:end), "csv"))
      fformat = "xlCSV";        ## Works only with COM
    elseif (strcmpi (ods.filename(end-3:end-1), "xls"))
      fformat = "xlOpenXMLWorkbook";
    else
      fformat = "";
    endif
    nmranges = getnmranges (ods);
 
  endif

  ods = odsclose (ods);
  
endfunction
