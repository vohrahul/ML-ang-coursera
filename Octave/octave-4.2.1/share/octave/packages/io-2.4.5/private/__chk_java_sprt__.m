## Copyright (C) 2013-2016 Philip Nienhuis
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

## __chk_java_sprt__ Internal io package function

## Author: Philip Nienhuis <prnienhuis@users.sf.net>
## Created: 2013-03-01

function [ tmp1, jcp ] = __chk_java_sprt__ (dbug=0)

  jcp = {};
  tmp1 = 0;
  has_java = __have_feature__ ("JAVA");
  if (! has_java)
    ## No Java support built in => any further checks are moot
    return
  endif

  try
    jcp = javaclasspath ("-all");         # For java pkg >= 1.2.8
    if (isempty (jcp))                    #   & Octave   >= 3.7.2
      jcp = javaclasspath;                # For java pkg <  1.2.8 
    endif
    ## If we get here, at least Java works. 
    if (dbug > 1)
      printf ("  Java seems to work OK.\n");
    endif
    ## Now check for proper version (>= 1.6)
    jver = ...
      char (javaMethod ("getProperty", "java.lang.System", "java.version"));
    cjver = strsplit (jver, ".");
    if (sscanf (cjver{2}, "%d") < 6)
      warning ...
        ("\nJava version too old - you need at least Java 6 (v. 1.6.x.x)\n");
      if (dbug)
        printf ('    At Octave prompt, try "!system ("java -version")"');
      endif
      return
    else
      if (dbug > 2)
        printf ("  Java (version %s) seems OK.\n", jver);
      endif
    endif
    ## Now check for proper entries in class path. Under *nix the classpath
    ## must first be split up. In java 1.2.8+ javaclasspath is already a cell array
    if (isunix && ! iscell (jcp));
      jcp = strsplit (char (jcp), pathsep ()); 
    endif
    tmp1 = 1;
  catch
    ## No Java support
    if (dbug)
      printf ("No Java support found.\n");
    endif
  end_try_catch

endfunction
