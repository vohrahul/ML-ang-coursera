## Copyright (C) 2012-2016 Philip Nienhuis <prnienhuis@users.sf.net>
## 
## This program is free software; you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 3 of the License, or
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

## __OXS_spsh_close__ - internal function: close a spreadsheet file using JXL

## Author: Philip Nienhuis <prnienhuis@users.sf.net>
## Created: 2012-10-12

function [ xls ] = __OXS_spsh_close__ (xls)

  ofile = 1.5;
  if (xls.changed > 0 && xls.changed < 3)
    if (isfield (xls, "nfilename"))
      fname = xls.nfilename;
    else
      fname = xls.filename;
    endif
    try
      xlsout = javaObject ("java.io.FileOutputStream", fname);
      xls.workbook.write (xlsout);
      xlsout.close ();
      xls.changed = 0;
    catch
      if (! strcmp (class (ofile), "double"))
        ofile.close ();
      endif
      warning ("__OXS_spsh_close__: error trying to close OXS file ptr");
    end_try_catch
  endif
  xls.workbook.close ();

endfunction
