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
## @deftypefn {Function File} @var{odsinterfaces} = getodsinterfaces (@var{odsinterfaces})
## Get supported OpenOffice.org .ods file read/write interfaces from
## the system.
## Each interface for which the corresponding field is set to empty
## will be checked. So by manipulating the fields of input argument
## @var{odsinterfaces} it is possible to specify which
## interface(s) should be checked.
##
## Currently implemented interfaces comprise:
## - Java & ODFtoolkit (www.apache.org)
## - Java & jOpenDocument (www.jopendocument.org)
## - Java & UNO bridge (OpenOffice.org)
##
## Examples:
##
## @example
##   odsinterfaces = getodsinterfaces (odsinterfaces);
## @end example

## Author: Philip Nienhuis <prnienhuis at users.sf.net>
## Created: 2009-12-27

function [odsinterfaces] = getodsinterfaces (odsinterfaces)

  ## tmp1 = [] (not initialized), 0 (No Java detected), or 1 (Working Java found)
  persistent tmp1 = []; 
  persistent jcp={};                                  ## Java class path
  persistent has_java = [];                           ## Built-in Java support
  persistent uno_1st_time = 0;

  if (isempty (has_java))
    has_java = __have_feature__ ("JAVA");
  endif

  if (isempty (odsinterfaces.OTK) && isempty (odsinterfaces.JOD) ...
                                  && isempty (odsinterfaces.UNO))
    ## Assume no interface detection has happened yet
    printf ("Detected ODS interfaces: ");
    tmp1 = [];
  elseif (isempty (odsinterfaces.OTK) || isempty (odsinterfaces.JOD) ...
                                      || isempty (odsinterfaces.UNO))
    ## Can't be first call. Here one of the Java interfaces is requested
    if (tmp1)
      # Check Java support again
      tmp1 = [];
    elseif (has_java)
      ## Renew jcp (javaclasspath) as it may have been updated since last call
      jcp = javaclasspath ("-all");                   ## For java pkg >= 1.2.8
      if (isempty (jcp))                              ##   & Octave   >= 3.7.2
        jcp = javaclasspath;
      endif                                           ## For java pkg <  1.2.8
      if (isunix && ! iscell (jcp));
        jcp = strsplit (char (jcp), pathsep ()); 
      endif
    endif
  endif
  ## deflt signals that some default interface has been selected. Just used
  ## for cosmetic purposes
  deflt = 0;

  if (has_java)
    if (isempty (tmp1))
    ## Check Java support
      [tmp1, jcp] = __chk_java_sprt__ ();
      if (! tmp1)
        ## No Java support found
        if (isempty (odsinterfaces.OTK) || isempty (odsinterfaces.JOD) ...
                                        || isempty (odsinterfaces.UNO))
          ## Some or all Java-based interface explicitly requested; but no Java support
          warning ...
            (" No Java support found (no Java JRE or JDK?)\n");
        endif
        ## Set Java-based interfaces to 0 anyway as there's no Java support
        odsinterfaces.OTK = 0;
        odsinterfaces.JOD = 0;
        odsinterfaces.UNO = 0;
        printf ("\n");
        ## No more need to try any Java interface
        return;
      endif
    endif

    ## Try Java & ODF toolkit
    if (isempty (odsinterfaces.OTK))
      odsinterfaces.OTK = 0;
      [chk, missing5] = __OTK_chk_sprt__ (jcp);
      ## Beware of unsupported odfdom jar versions
      if (chk >= 1)
        odsinterfaces.OTK = 1;
        printf ("OTK");
        if (deflt)
          printf ("; ");
        else 
          printf ("*; ");
          deflt = 1;
        endif
      endif
    endif

    ## Try Java & jOpenDocument
    if (isempty (odsinterfaces.JOD))
      odsinterfaces.JOD = 0;
      chk = __JOD_chk_sprt__ (jcp);
      if (chk)
        odsinterfaces.JOD = 1;
        printf ("JOD");
        if (deflt)
          printf ("; ");
        else
          printf ("*; ");
          deflt = 1;
        endif
      endif
    endif

    ## Try Java & UNO
    if (isempty (odsinterfaces.UNO))
      odsinterfaces.UNO = 0;
      [chk, missing0] = __UNO_chk_sprt__ (jcp);
      if (isempty (missing0) && chk)
        odsinterfaces.UNO = 1;
        printf ("UNO");
        if (deflt)
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
    odsinterfaces.OTK = 0;
    odsinterfaces.JOD = 0;
    odsinterfaces.UNO = 0;

  ## End of has_java block
  endif

  ## Native Octave (OCT). Can be zeroed when requesting specific interface
  if (isempty (odsinterfaces.OCT))
    ## Nothing to check, always supported
    odsinterfaces.OCT = 1;
    printf ("OCT");
    if (deflt)
      printf ("; ");
    else
      printf ("*; ");
      deflt = 1;
    endif
  endif
  
  ## ---- Other interfaces here, similar to the ones above

  if (deflt)
    printf ("(* = default interface)\n");
  endif

  ## FIXME the below stanza should be dropped once UNO is stable.
  ## Echo a suitable warning about experimental status:
  if (uno_1st_time == 1)
    ++uno_1st_time;
    printf ("\nPLEASE NOTE: UNO (=OpenOffice.org-behind-the-scenes) is EXPERIMENTAL\n");
    printf ("After you've opened a spreadsheet file using the UNO interface,\n");
    printf ("odsclose on that file will kill ALL OpenOffice.org invocations,\n");
    printf ("also those that were started outside and/or before Octave!\n");
    printf ("Trying to quit Octave w/o invoking odsclose will only hang Octave.\n\n");
  endif
  
endfunction
