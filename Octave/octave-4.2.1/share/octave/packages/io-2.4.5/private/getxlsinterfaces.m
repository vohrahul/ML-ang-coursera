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
## @deftypefn {Function File} @var{xlsinterfaces} = getxlsinterfaces (@var{xlsinterfaces})
## Get supported Excel .xls file read/write interfaces from the system.
## Each interface for which the corresponding field is set to empty
## will be checked. So by manipulating the fields of input argument
## @var{xlsinterfaces} it is possible to specify which
## interface(s) should be checked.
##
## Currently implemented interfaces comprise:
## - ActiveX / COM (native Excel in the background)
## - Java & Apache POI
## - Java & JExcelAPI
## - Java & OpenXLS (only JRE >= 1.4 needed)
## - Java & UNO bridge (native OpenOffice.org in background) - EXPERIMENTAL!!
## - native Octave, only for .xlsx (OOXML), .ODS1.2, . gnumeric
##
## Examples:
##
## @example
##   xlsinterfaces = getxlsinterfaces (xlsinterfaces);
## @end example

## Author: Philip Nienhuis <prnienhuis at users.sf.net>
## Created: 2009-11-29

function [xlsinterfaces] = getxlsinterfaces (xlsinterfaces)

  ## tmp1 = [] (not initialized), 0 (No Java detected), or 1 (Working Java found)
  persistent tmp1 = []; 
  persistent tmp2 = []; 
  persistent has_java = [];                           ## Built-in Java support
  persistent jcp;                                     ## Java class path
  persistent uno_1st_time = 0;

  if (isempty (has_java))
    has_java = __have_feature__ ("JAVA");
  endif

  if  (isempty (xlsinterfaces.COM) && isempty (xlsinterfaces.POI) ...
    && isempty (xlsinterfaces.JXL) && isempty (xlsinterfaces.OXS) ...
    && isempty (xlsinterfaces.UNO))
    ## Looks like first call to xlsopen. Check Java support
    printf ("Detected XLS interfaces: ");
    tmp1 = [];
  elseif (isempty (xlsinterfaces.COM) || isempty (xlsinterfaces.POI) ... 
       || isempty (xlsinterfaces.JXL) || isempty (xlsinterfaces.OXS) ...
       || isempty (xlsinterfaces.UNO))
    ## Can't be first call. Here one of the Java interfaces may be requested
    if (! tmp1)
      ## Check Java support again
      tmp1 = [];
    elseif (has_java)
      ## Renew jcp (javaclasspath) as it may have been updated since last call
      jcp = javaclasspath ("-all");                   ## For java pkg >= 1.2.8
      if (isempty (jcp))
        ## For java pkg <  1.2.8
        jcp = javaclasspath;
      endif
      if (isunix && ! iscell (jcp));
        jcp = strsplit (char (jcp), pathsep ()); 
      endif
    endif
  endif
  ## deflt signals that some default interface has been selected. Just used
  ## for cosmetic purposes
  deflt = 0;

  ## Check if MS-Excel COM ActiveX server runs (only on Windows!)
  if (ispc && isempty (xlsinterfaces.COM))
    xlsinterfaces.COM = 0;
    try
      app = actxserver ("Excel.application");
      ## Close Excel. Yep this is inefficient when we need only one r/w action,
      ## but it quickly pays off when we need to do more with the same file
      ## (+, MS-Excel code is in OS cache anyway after this call so no big deal)
      app.Quit();
      delete (app);
      printf ("COM");
      if (deflt)
        printf ("; ");
      else
        printf ("*; ");
        deflt = 1;
      endif
      ## If we get here, the call succeeded & COM works.
      xlsinterfaces.COM = 1;
    catch
      ## COM non-existent. Only print message if COM is explicitly requested (tmp1==[])
      if (! isempty (tmp1))
        printf ("ActiveX not working; no Excel installed?\n"); 
      endif
    end_try_catch
  endif

  if (has_java)
    if (isempty (tmp1))
    ## Check Java support
      [tmp1, jcp] = __chk_java_sprt__ ();
      if (! tmp1)
        ## No Java support found
        tmp1 = 0;
        if (isempty (xlsinterfaces.POI) || isempty (xlsinterfaces.JXL)...
          || isempty (xlsinterfaces.OXS) || isempty (xlsinterfaces.UNO))
          ## Some or all Java-based interface(s) explicitly requested but no Java support
          warning ...
            (" No Java support found (no Java JRE? no Java pkg installed AND loaded?)");
        endif
        ## Set Java-based interfaces to 0 anyway as there's no Java support
        xlsinterfaces.POI = 0;
        xlsinterfaces.JXL = 0;
        xlsinterfaces.OXS = 0;
        xlsinterfaces.UNO = 0;
        printf ("\n");
        ## No more need to try any Java interface
        return
      endif
    endif

    ## Try Java & Apache POI
    if (isempty (xlsinterfaces.POI))
      xlsinterfaces.POI = 0;
      ## Check basic .xls (BIFF8) support
      [chk, ~, missing2] = __POI_chk_sprt__ (jcp);
      if (chk)
        xlsinterfaces.POI = 1;
        printf ("POI");
        if (isempty (missing2))
          printf (" (& OOXML)");
        endif
        if (deflt)
          printf ("; ");
        else
          printf ("*; ");
          deflt = 1; 
        endif
      endif
    endif

    ## Try Java & JExcelAPI
    if (isempty (xlsinterfaces.JXL))
      xlsinterfaces.JXL = 0;
      chk = __JXL_chk_sprt__ (jcp);
      if (chk)
        xlsinterfaces.JXL = 1;
        printf ("JXL");
        if (deflt)
          printf ("; "); 
        else
          printf ("*; "); 
          deflt = 1; 
        endif
      endif
    endif

    ## Try Java & OpenXLS
    if (isempty (xlsinterfaces.OXS))
      xlsinterfaces.OXS = 0;
      chk = __OXS_chk_sprt__ (jcp);
      ## Beware of unsupported openxls jar versions (chk must be > 0)
      if (chk >= 1)
        xlsinterfaces.OXS = 1;
        printf ("OXS");
        if (deflt)
          printf ("; "); 
        else 
          printf ("*; "); 
          deflt = 1; 
        endif
      endif
    endif

    ## Try Java & UNO
    if (isempty (xlsinterfaces.UNO))
      xlsinterfaces.UNO = 0;
      chk = __UNO_chk_sprt__ (jcp);
      if (chk)
        xlsinterfaces.UNO = 1;
        printf ("UNO");
        if (deflt);
          printf ("; "); 
        else
          printf ("*; ");
          deflt = 1; 
          uno_1st_time = min (++uno_1st_time, 2);
        endif
      endif
    endif

  else
    ## Set Java-based interfaces to 0 anyway as there's no Java support
    xlsinterfaces.POI = 0;
    xlsinterfaces.JXL = 0;
    xlsinterfaces.OXS = 0;
    xlsinterfaces.UNO = 0;

  ## End of has_java block
  endif

  ## Native Octave
  if (isempty (xlsinterfaces.OCT))
    ## Nothing to check, always supported
    xlsinterfaces.OCT = 1;
    printf ("OCT");
    if (deflt)
      printf ("; ");
    else
      printf ("*; ");
      deflt = 1;
    endif
  endif

  ## ---- Other interfaces here, similar to the ones above.
  ##      Java interfaces should be in the has-java if-block

  if (deflt)
    printf ("(* = default interface)\n");
  endif

  ## FIXME the below stanza should be dropped once UNO is stable.
  # Echo a suitable warning about experimental status:
  if (uno_1st_time == 1)
    ++uno_1st_time;
    printf ("\nPLEASE NOTE: UNO (=OpenOffice.org-behind-the-scenes) is EXPERIMENTAL\n");
    printf ("After you've opened a spreadsheet file using the UNO interface,\n");
    printf ("xlsclose on that file will kill ALL OpenOffice.org invocations,\n");
    printf ("also those that were started outside and/or before Octave!\n");
    printf ("Trying to quit Octave w/o invoking xlsclose will only hang Octave.\n\n");
  endif

endfunction
