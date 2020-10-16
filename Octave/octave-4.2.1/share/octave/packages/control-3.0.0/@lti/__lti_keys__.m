## Copyright (C) 2009-2015   Lukas F. Reichlin
##
## This file is part of LTI Syncope.
##
## LTI Syncope is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## LTI Syncope is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with LTI Syncope.  If not, see <http://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn {Function File} {[@var{keys}, @var{vals}] =} __lti_keys__ (@var{sys})
## Return the list of keys as well as the assignable values for an LTI object sys.
## @end deftypefn

## Author: Lukas Reichlin <lukas.reichlin@gmail.com>
## Created: September 2009
## Version: 0.3

function [keys, vals] = __lti_keys__ (sys, aliases = false, subclasses = true)

  ## cell vector of lti-specific keys
  keys = {"tsam";
          "inname";
          "outname";
          "ingroup";
          "outgroup";
          "name";
          "notes";
          "userdata"};

  ## cell vector of lti-specific assignable values
  vals = {"scalar (sample time in seconds)";
          "m-by-1 cell vector of strings";
          "p-by-1 cell vector of strings";
          "struct with indices as fields";
          "struct with indices as fields";
          "string";
          "string or cell of strings";
          "any data type"};

  if (aliases)
    ka = {"inputname";
          "outputname";
          "inputgroup";
          "outputgroup";
          "lti"};
    keys = [keys; ka];
  endif

  if (subclasses)
    [syskeys, sysvals] = __sys_keys__ (sys, aliases);
    keys = [syskeys; keys];
    vals = [sysvals; vals];
  endif

endfunction
