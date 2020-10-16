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
## @deftypefn {Function File} [@var{filetype}] = xlsfinfo (@var{filename} [, @var{reqintf}])
## @deftypefnx {Function File} [@var{filetype}, @var{sh_names}] = xlsfinfo (@var{filename} [, @var{reqintf}])
## @deftypefnx {Function File} [@var{filetype}, @var{sh_names}, @var{fformat}] = xlsfinfo (@var{filename} [, @var{reqintf}])
## @deftypefnx {Function File} [@var{filetype}, @var{sh_names}, @var{fformat}, @var{nmranges}] = xlsfinfo (@var{filename} [, @var{reqintf}])
## Query Excel spreadsheet file @var{filename} for some info about its
## contents.
##
## If @var{filename} is a recognizable Excel spreadsheet file,
## @var{filetype} returns the string "Microsoft Excel Spreadsheet", or
## @'' (empty string) otherwise.
## 
## If @var{filename} is a recognizable Excel spreadsheet file, optional
## argument @var{sh_names} contains a Nx2 list (cell array) of sheet
## names (and in case Excel is installed: sheet types) and total used data
## range for each worksheet contained in @var{filename}, in the order
## (from left to right) in which they occur in the worksheet stack.
##
## Optional return value @var{fformat} currently returns @'' (empty
## string) unless @var{filename} is a readable Excel 97-2003 .xls file or
## an Excel 2007 .xlsx / .xlsb file in which case @var{fformat} is set to
## "xlWorkbookNormal".  Excel 95 .xls files can only be read through the JXL
## (JExcelAPI) or UNO (OpenOffice.org) Java-based interfaces.
##
## Optional return argument @var{nmranges} is a cell array containing all
## named data ranges in the file in the first column, the relevant sheet and
## the cell range in the second and third column and if appropriate the
## scope of the range in the fourth column. For named ranges defined for
## the entire workbook the fourth column entry is empty.
## Named ranges only work for the COM, POI, OXS, UNO and OCT interfaces.
##
## If no return arguments are specified the sheet names are echoed to the 
## terminal screen; in case of Java interfaces for each sheet the actual
## occupied data range is echoed as well.  The occupied cell range will have
## to be determined behind the scenes first; this can take some time for the
## Java-based interfaces.  Any Named ranges defined in the spreadsheet file
## will be listed on screen as well.
##
## If multiple xls interfaces have been installed, @var{reqintf} can be
## specified.  This can sometimes be handy, e.g. to get an idea of occupied
## cell ranges in each worksheet using different interfaces (due to cached
## info and/or different treatment of empty but formatted cells, each
## interfaces may give different results).
##
## For OOXML spreadsheets no external SW is required but full POI and/or
## UNO support (see xlsopen) may work better or faster; to use those specify
## 'poi' or 'uno' for @var{reqintf}.  For Excel 95 files use 'com' (windows
## only), 'jxl' or 'uno'.  Gnumeric files can be explored with the built-in
## OCT interface (no need to specify @var{reqintf} then).
##
## Examples:
##
## @example
##   exist = xlsfinfo ('test4.xls');
##   (Just checks if file test4.xls is a readable Excel file) 
## @end example
##
## @example
##   [exist, names] = xlsfinfo ('test4.xls');
##   (Checks if file test4.xls is a readable Excel file and return a 
##    list of sheet names and -types) 
## @end example
##
## @seealso {oct2xls, xlsread, xls2oct, xlswrite}
##
## @end deftypefn

## Author: Philip Nienhuis <prnienhuis at users.sourceforge.net>
## Created: 2009-10-27

function [ filetype, sh_names, fformat, nmranges ] = xlsfinfo (filename, reqintf=[])

  persistent str2; str2 = "                                 "; ## 33 spaces
  persistent lstr2; lstr2 = length (str2);

  xls = xlsopen (filename, 0, reqintf);
  if (isempty (xls))
    return; 
  endif

  toscreen = nargout < 1;

  ## If any valid xls-pointer struct has been returned, it must be a valid
  ## spreadsheet. Find out what format
  [~, ~, ext] = fileparts (xls.filename); 
  switch ext
    case {"xls", "xlsx", "xlsm", ".xlsb", ".xls", ".xlsx", ".xlsm", ".xlsb"}
      filetype = "Microsoft Excel Spreadsheet";
    case {"ods", ".ods"}
      filetype = "OpenOffice.org Calc spreadsheet";
    case {"gnumeric", ".gnumeric"}
      filetype = "Gnumeric spreadsheet";
    otherwise
  endswitch
  fformat = "";

  if (strcmp (xls.xtype, "COM"))
    [sh_names] = __COM_spsh_info__ (xls);

  elseif (strcmp (xls.xtype, "POI"))
    [sh_names] = __POI_spsh_info__ (xls);

  elseif (strcmp (xls.xtype, "JXL"))
    [sh_names] = __JXL_spsh_info__ (xls);

  elseif (strcmp (xls.xtype, "OXS"))
    [sh_names] = __OXS_spsh_info__ (xls);

  elseif (strcmp (xls.xtype, "UNO"))
    [sh_names] = __UNO_spsh_info__ (xls);

  elseif (strcmp (xls.xtype, "OCT"))
    [sh_names] = __OCT_spsh_info__ (xls);

##elseif   <Other Excel interfaces below>

  else
    error (sprintf ("xlsfinfo: unknown Excel .xls interface - %s.\n", xls.xtype));

  endif

  sh_cnt = size (sh_names, 1);
  if (toscreen)
    ## Echo sheet names to screen
    for ii=1:sh_cnt
      str1 = sprintf ("%3d: %s", ii, sh_names{ii, 1});
      if (index (sh_names{ii, 2}, ":"))
        str3 = [ "(Used range ~ " sh_names{ii, 2} ")" ];
      else
        str3 = sh_names{ii, 2};
      endif
      printf ("%s%s%s\n", str1, str2(1:lstr2-length (sh_names{ii, 1})), str3);
    endfor
    ## Echo named ranges
    nmranges = getnmranges (xls);
    snmr = size (nmranges, 1);
    if(snmr > 0)
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
  else
    if (sh_cnt > 0 && nargout > 2)
      if (strcmpi (xls.filename(end-2:end), "xls"))
        fformat = "xlWorkbookNormal";
        ## FIXME could nowadays be "xlExcel8"
      elseif (strcmpi (xls.filename(end-2:end), "csv"))
        fformat = "xlCSV";        ## Works only with COM
      elseif (strcmpi (xls.filename(end-3:end-1), "xls"))
        fformat = "xlOpenXMLWorkbook";
      elseif (strfind (lower (xls.filename(end-3:end)), 'htm'))
        fformat = "xlHtml";       ##  Works only with COM
      else
        fformat = "";
      endif
    endif
    if (nargout > 3)
      ## Echo named ranges
      nmranges = getnmranges (xls);
    endif
  endif

  xlsclose (xls);

endfunction
