## DO NOT EDIT!  Generated automatically from test/c-xsc.itl
## by the Interval Testing Framework for IEEE 1788.
## https://github.com/nehmeier/ITF1788/tree/92558f7e942665a78f2e883dbe7af52320100fba
##
## Copyright 1990-2000 Institut fuer Angewandte Mathematik,
##                     Universitaet Karlsruhe, Germany
##           2000-2014 Wiss. Rechnen/Softwaretechnologie
##                     Universitaet Wuppertal, Germany   
## Copyright 2015-2016 Oliver Heimlich
## 
## Origin: unit tests in C-XSC version 2.5.4, Original license: LGPLv2+
## Converted into portable ITL format by Oliver Heimlich.
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
## along with this program; if not, see <http://www.gnu.org/licenses/>.
##
%!#Test library imports

%!#Arithmetic library imports
pkg load interval

%!#Preamble

try; error ("__FILE__"); catch
    test (lasterror.stack.file, "quiet", stdout);
end_try_catch;

%!function assert_warn (observed_value, expected_value)
%!    if (not (isequal (observed_value, expected_value)))
%!        observed_expression = regexprep (argn(1, :), '\s+$', '');
%!        expected_expression = regexprep (argn(2, :), '\s+$', '');
%!        observed_as_char = disp (observed_value)(1 : end - 1);
%!        expected_as_char = disp(expected_value)(1 : end - 1);
%!        warning ([observed_expression, " != ", expected_expression, ...
%!                 "\n         ", observed_as_char, " != ", expected_as_char]);
%!    endif
%!endfunction

## cxsc.intervaladdsub
%!# Tests A+B, B+A, A-B, B-A, -A, +A
%!test
%! assert (isequal (infsup (10.0, 20.0) + infsup (13.0, 17.0), infsup (23.0, 37.0)));
%! assert (isequal (plus (infsup (10.0, 20.0), infsup (13.0, 17.0)), infsup (23.0, 37.0)));
%!test
%! assert (isequal (infsup (13.0, 17.0) + infsup (10.0, 20.0), infsup (23.0, 37.0)));
%! assert (isequal (plus (infsup (13.0, 17.0), infsup (10.0, 20.0)), infsup (23.0, 37.0)));
%!test
%! assert (isequal (infsup (10.0, 20.0) - infsup (13.0, 16.0), infsup (-6.0, 7.0)));
%! assert (isequal (minus (infsup (10.0, 20.0), infsup (13.0, 16.0)), infsup (-6.0, 7.0)));
%!test
%! assert (isequal (infsup (13.0, 16.0) - infsup (10.0, 20.0), infsup (-7.0, 6.0)));
%! assert (isequal (minus (infsup (13.0, 16.0), infsup (10.0, 20.0)), infsup (-7.0, 6.0)));
%!test
%! assert (isequal (-infsup (10.0, 20.0), infsup (-20.0, -10.0)));
%! assert (isequal (uminus (infsup (10.0, 20.0)), infsup (-20.0, -10.0)));
%!test
%! assert (isequal (+infsup (10.0, 20.0), infsup (10.0, 20.0)));
%! assert (isequal (uplus (infsup (10.0, 20.0)), infsup (10.0, 20.0)));

## cxsc.intervalmuldiv
%!# Tests A*B, B*A, A/B, B/A
%!test
%! assert (isequal (infsup (1.0, 2.0) .* infsup (3.0, 4.0), infsup (3.0, 8.0)));
%! assert (isequal (times (infsup (1.0, 2.0), infsup (3.0, 4.0)), infsup (3.0, 8.0)));
%!test
%! assert (isequal (infsup (-1.0, 2.0) .* infsup (3.0, 4.0), infsup (-4.0, 8.0)));
%! assert (isequal (times (infsup (-1.0, 2.0), infsup (3.0, 4.0)), infsup (-4.0, 8.0)));
%!test
%! assert (isequal (infsup (-2.0, 1.0) .* infsup (3.0, 4.0), infsup (-8.0, 4.0)));
%! assert (isequal (times (infsup (-2.0, 1.0), infsup (3.0, 4.0)), infsup (-8.0, 4.0)));
%!test
%! assert (isequal (infsup (-2.0, -1.0) .* infsup (3.0, 4.0), infsup (-8.0, -3.0)));
%! assert (isequal (times (infsup (-2.0, -1.0), infsup (3.0, 4.0)), infsup (-8.0, -3.0)));
%!test
%! assert (isequal (infsup (1.0, 2.0) .* infsup (-3.0, 4.0), infsup (-6.0, 8.0)));
%! assert (isequal (times (infsup (1.0, 2.0), infsup (-3.0, 4.0)), infsup (-6.0, 8.0)));
%!test
%! assert (isequal (infsup (-1.0, 2.0) .* infsup (-3.0, 4.0), infsup (-6.0, 8.0)));
%! assert (isequal (times (infsup (-1.0, 2.0), infsup (-3.0, 4.0)), infsup (-6.0, 8.0)));
%!test
%! assert (isequal (infsup (-2.0, 1.0) .* infsup (-3.0, 4.0), infsup (-8.0, 6.0)));
%! assert (isequal (times (infsup (-2.0, 1.0), infsup (-3.0, 4.0)), infsup (-8.0, 6.0)));
%!test
%! assert (isequal (infsup (-2.0, -1.0) .* infsup (-3.0, 4.0), infsup (-8.0, 6.0)));
%! assert (isequal (times (infsup (-2.0, -1.0), infsup (-3.0, 4.0)), infsup (-8.0, 6.0)));
%!test
%! assert (isequal (infsup (1.0, 2.0) .* infsup (-4.0, 3.0), infsup (-8.0, 6.0)));
%! assert (isequal (times (infsup (1.0, 2.0), infsup (-4.0, 3.0)), infsup (-8.0, 6.0)));
%!test
%! assert (isequal (infsup (-1.0, 2.0) .* infsup (-4.0, 3.0), infsup (-8.0, 6.0)));
%! assert (isequal (times (infsup (-1.0, 2.0), infsup (-4.0, 3.0)), infsup (-8.0, 6.0)));
%!test
%! assert (isequal (infsup (-2.0, 1.0) .* infsup (-4.0, 3.0), infsup (-6.0, 8.0)));
%! assert (isequal (times (infsup (-2.0, 1.0), infsup (-4.0, 3.0)), infsup (-6.0, 8.0)));
%!test
%! assert (isequal (infsup (-2.0, -1.0) .* infsup (-4.0, 3.0), infsup (-6.0, 8.0)));
%! assert (isequal (times (infsup (-2.0, -1.0), infsup (-4.0, 3.0)), infsup (-6.0, 8.0)));
%!test
%! assert (isequal (infsup (1.0, 2.0) .* infsup (-4.0, -3.0), infsup (-8.0, -3.0)));
%! assert (isequal (times (infsup (1.0, 2.0), infsup (-4.0, -3.0)), infsup (-8.0, -3.0)));
%!test
%! assert (isequal (infsup (-1.0, 2.0) .* infsup (-4.0, -3.0), infsup (-8.0, 4.0)));
%! assert (isequal (times (infsup (-1.0, 2.0), infsup (-4.0, -3.0)), infsup (-8.0, 4.0)));
%!test
%! assert (isequal (infsup (-2.0, -1.0) .* infsup (-4.0, -3.0), infsup (3.0, 8.0)));
%! assert (isequal (times (infsup (-2.0, -1.0), infsup (-4.0, -3.0)), infsup (3.0, 8.0)));
%!test
%! assert (isequal (infsup (1.0, 2.0) ./ infsup (4.0, 8.0), infsup (0.125, 0.5)));
%! assert (isequal (rdivide (infsup (1.0, 2.0), infsup (4.0, 8.0)), infsup (0.125, 0.5)));
%!test
%! assert (isequal (infsup (-1.0, 2.0) ./ infsup (4.0, 8.0), infsup (-0.25, 0.5)));
%! assert (isequal (rdivide (infsup (-1.0, 2.0), infsup (4.0, 8.0)), infsup (-0.25, 0.5)));
%!test
%! assert (isequal (infsup (-2.0, 1.0) ./ infsup (4.0, 8.0), infsup (-0.5, 0.25)));
%! assert (isequal (rdivide (infsup (-2.0, 1.0), infsup (4.0, 8.0)), infsup (-0.5, 0.25)));
%!test
%! assert (isequal (infsup (-2.0, -1.0) ./ infsup (4.0, 8.0), infsup (-0.5, -0.125)));
%! assert (isequal (rdivide (infsup (-2.0, -1.0), infsup (4.0, 8.0)), infsup (-0.5, -0.125)));
%!test
%! assert (isequal (infsup (1.0, 2.0) ./ infsup (-4.0, 8.0), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (1.0, 2.0), infsup (-4.0, 8.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-1.0, 2.0) ./ infsup (-4.0, 8.0), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (-1.0, 2.0), infsup (-4.0, 8.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-2.0, 1.0) ./ infsup (-4.0, 8.0), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (-2.0, 1.0), infsup (-4.0, 8.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-2.0, -1.0) ./ infsup (-4.0, 8.0), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (-2.0, -1.0), infsup (-4.0, 8.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (1.0, 2.0) ./ infsup (-8.0, 4.0), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (1.0, 2.0), infsup (-8.0, 4.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-1.0, 2.0) ./ infsup (-8.0, 4.0), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (-1.0, 2.0), infsup (-8.0, 4.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-2.0, 1.0) ./ infsup (-8.0, 4.0), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (-2.0, 1.0), infsup (-8.0, 4.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-2.0, -1.0) ./ infsup (-8.0, 4.0), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (-2.0, -1.0), infsup (-8.0, 4.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (1.0, 2.0) ./ infsup (-8.0, -4.0), infsup (-0.5, -0.125)));
%! assert (isequal (rdivide (infsup (1.0, 2.0), infsup (-8.0, -4.0)), infsup (-0.5, -0.125)));
%!test
%! assert (isequal (infsup (-1.0, 2.0) ./ infsup (-8.0, -4.0), infsup (-0.5, 0.25)));
%! assert (isequal (rdivide (infsup (-1.0, 2.0), infsup (-8.0, -4.0)), infsup (-0.5, 0.25)));
%!test
%! assert (isequal (infsup (-2.0, 1.0) ./ infsup (-8.0, -4.0), infsup (-0.25, 0.5)));
%! assert (isequal (rdivide (infsup (-2.0, 1.0), infsup (-8.0, -4.0)), infsup (-0.25, 0.5)));
%!test
%! assert (isequal (infsup (-2.0, -1.0) ./ infsup (-8.0, -4.0), infsup (0.125, 0.5)));
%! assert (isequal (rdivide (infsup (-2.0, -1.0), infsup (-8.0, -4.0)), infsup (0.125, 0.5)));

## cxsc.intervalsetops
%!# Tests A|B, B|A, A&B, B&A
%!test
%! assert (isequal (union (infsup (-2.0, 2.0), infsup (-4.0, -3.0)), infsup (-4.0, 2.0)));
%!test
%! assert (isequal (union (infsup (-2.0, 2.0), infsup (-4.0, -1.0)), infsup (-4.0, 2.0)));
%!test
%! assert (isequal (union (infsup (-2.0, 2.0), infsup (-4.0, 4.0)), infsup (-4.0, 4.0)));
%!test
%! assert (isequal (union (infsup (-2.0, 2.0), infsup (-1.0, 1.0)), infsup (-2.0, 2.0)));
%!test
%! assert (isequal (union (infsup (-2.0, 2.0), infsup (1.0, 4.0)), infsup (-2.0, 4.0)));
%!test
%! assert (isequal (union (infsup (-2.0, 2.0), infsup (3.0, 4.0)), infsup (-2.0, 4.0)));
%!test
%! assert (isequal (union (infsup (-4.0, -3.0), infsup (-2.0, 2.0)), infsup (-4.0, 2.0)));
%!test
%! assert (isequal (union (infsup (-4.0, -1.0), infsup (-2.0, 2.0)), infsup (-4.0, 2.0)));
%!test
%! assert (isequal (union (infsup (-4.0, 4.0), infsup (-2.0, 2.0)), infsup (-4.0, 4.0)));
%!test
%! assert (isequal (union (infsup (-1.0, 1.0), infsup (-2.0, 2.0)), infsup (-2.0, 2.0)));
%!test
%! assert (isequal (union (infsup (1.0, 4.0), infsup (-2.0, 2.0)), infsup (-2.0, 4.0)));
%!test
%! assert (isequal (union (infsup (3.0, 4.0), infsup (-2.0, 2.0)), infsup (-2.0, 4.0)));
%!test
%! assert (isequal (intersect (infsup (-2.0, 2.0), infsup (-4.0, -3.0)), infsup));
%!test
%! assert (isequal (intersect (infsup (-2.0, 2.0), infsup (-4.0, -1.0)), infsup (-2.0, -1.0)));
%!test
%! assert (isequal (intersect (infsup (-2.0, 2.0), infsup (-4.0, 4.0)), infsup (-2.0, 2.0)));
%!test
%! assert (isequal (intersect (infsup (-2.0, 2.0), infsup (-1.0, 1.0)), infsup (-1.0, 1.0)));
%!test
%! assert (isequal (intersect (infsup (-2.0, 2.0), infsup (1.0, 4.0)), infsup (1.0, 2.0)));
%!test
%! assert (isequal (intersect (infsup (-2.0, 2.0), infsup (3.0, 4.0)), infsup));
%!test
%! assert (isequal (intersect (infsup (-4.0, -3.0), infsup (-2.0, 2.0)), infsup));
%!test
%! assert (isequal (intersect (infsup (-4.0, -1.0), infsup (-2.0, 2.0)), infsup (-2.0, -1.0)));
%!test
%! assert (isequal (intersect (infsup (-4.0, 4.0), infsup (-2.0, 2.0)), infsup (-2.0, 2.0)));
%!test
%! assert (isequal (intersect (infsup (-1.0, 1.0), infsup (-2.0, 2.0)), infsup (-1.0, 1.0)));
%!test
%! assert (isequal (intersect (infsup (1.0, 4.0), infsup (-2.0, 2.0)), infsup (1.0, 2.0)));
%!test
%! assert (isequal (intersect (infsup (3.0, 4.0), infsup (-2.0, 2.0)), infsup));

## cxsc.intervalmixsetops
%!# Tests A|B, B|A, A&B, B&A, B is scalar-type
%!test
%! assert (isequal (union (infsup (-2.0, 2.0), infsup (-4.0, -4.0)), infsup (-4.0, 2.0)));
%!test
%! assert (isequal (union (infsup (-2.0, 2.0), infsup (1.0, 1.0)), infsup (-2.0, 2.0)));
%!test
%! assert (isequal (union (infsup (-2.0, 2.0), infsup (4.0, 4.0)), infsup (-2.0, 4.0)));
%!test
%! assert (isequal (union (infsup (-4.0, -4.0), infsup (-2.0, 2.0)), infsup (-4.0, 2.0)));
%!test
%! assert (isequal (union (infsup (1.0, 1.0), infsup (-2.0, 2.0)), infsup (-2.0, 2.0)));
%!test
%! assert (isequal (union (infsup (4.0, 4.0), infsup (-2.0, 2.0)), infsup (-2.0, 4.0)));
%!test
%! assert (isequal (intersect (infsup (-2.0, 2.0), infsup (-4.0, -4.0)), infsup));
%!test
%! assert (isequal (intersect (infsup (-2.0, 2.0), infsup (1.0, 1.0)), infsup (1.0, 1.0)));
%!test
%! assert (isequal (intersect (infsup (-2.0, 2.0), infsup (4.0, 4.0)), infsup));
%!test
%! assert (isequal (intersect (infsup (-4.0, -4.0), infsup (-2.0, 2.0)), infsup));
%!test
%! assert (isequal (intersect (infsup (1.0, 1.0), infsup (-2.0, 2.0)), infsup (1.0, 1.0)));
%!test
%! assert (isequal (intersect (infsup (4.0, 4.0), infsup (-2.0, 2.0)), infsup));

## cxsc.scalarmixsetops
%!# Tests A|B, B|A, A and B are scalar-type
%!test
%! assert (isequal (union (infsup (-2.0, -2.0), infsup (-4.0, -4.0)), infsup (-4.0, -2.0)));
%!test
%! assert (isequal (union (infsup (-2.0, -2.0), infsup (-2.0, -2.0)), infsup (-2.0, -2.0)));
%!test
%! assert (isequal (union (infsup (-2.0, -2.0), infsup (2.0, 2.0)), infsup (-2.0, 2.0)));
%!test
%! assert (isequal (union (infsup (-4.0, -4.0), infsup (-2.0, -2.0)), infsup (-4.0, -2.0)));
%!test
%! assert (isequal (union (infsup (-2.0, -2.0), infsup (-2.0, -2.0)), infsup (-2.0, -2.0)));
%!test
%! assert (isequal (union (infsup (2.0, 2.0), infsup (-2.0, -2.0)), infsup (-2.0, 2.0)));

## cxsc.intervalsetcompops
%!# Tests A<B, A>B, A<=B, A>=B, A==B
%!test
%! assert (isequal (interior (infsup (-1.0, 2.0), infsup (-1.0, 2.0)), false));
%!test
%! assert (interior (infsup (-2.0, 1.0), infsup (-3.0, 2.0)));
%!test
%! assert (isequal (interior (infsup (-2.0, 2.0), infsup (-1.0, 1.0)), false));
%!test
%! assert (isequal (interior (infsup (-2.0, 2.0), infsup (-1.0, 2.0)), false));
%!test
%! assert (isequal (interior (infsup (-2.0, 2.0), infsup (-2.0, 1.0)), false));
%!test
%! assert (isequal (interior (infsup (-2.0, 2.0), infsup (-2.0, 3.0)), false));
%!test
%! assert (isequal (interior (infsup (-2.0, 2.0), infsup (-3.0, 2.0)), false));
%!test
%! assert (isequal (interior (infsup (-1.0, 2.0), infsup (-1.0, 2.0)), false));
%!test
%! assert (isequal (interior (infsup (-3.0, 2.0), infsup (-2.0, 1.0)), false));
%!test
%! assert (interior (infsup (-1.0, 1.0), infsup (-2.0, 2.0)));
%!test
%! assert (isequal (interior (infsup (-1.0, 2.0), infsup (-2.0, 2.0)), false));
%!test
%! assert (isequal (interior (infsup (-2.0, 1.0), infsup (-2.0, 2.0)), false));
%!test
%! assert (isequal (interior (infsup (-2.0, 3.0), infsup (-2.0, 2.0)), false));
%!test
%! assert (isequal (interior (infsup (-3.0, 2.0), infsup (-2.0, 2.0)), false));
%!test
%! assert (subset (infsup (-1.0, 2.0), infsup (-1.0, 2.0)));
%!test
%! assert (subset (infsup (-2.0, 1.0), infsup (-3.0, 2.0)));
%!test
%! assert (isequal (subset (infsup (-2.0, 2.0), infsup (-1.0, 1.0)), false));
%!test
%! assert (isequal (subset (infsup (-2.0, 2.0), infsup (-1.0, 2.0)), false));
%!test
%! assert (isequal (subset (infsup (-2.0, 2.0), infsup (-2.0, 1.0)), false));
%!test
%! assert (subset (infsup (-2.0, 2.0), infsup (-2.0, 3.0)));
%!test
%! assert (subset (infsup (-2.0, 2.0), infsup (-3.0, 2.0)));
%!test
%! assert (isequal (subset (infsup (-3.0, 2.0), infsup (-2.0, 1.0)), false));
%!test
%! assert (subset (infsup (-1.0, 1.0), infsup (-2.0, 2.0)));
%!test
%! assert (subset (infsup (-1.0, 2.0), infsup (-2.0, 2.0)));
%!test
%! assert (subset (infsup (-2.0, 1.0), infsup (-2.0, 2.0)));
%!test
%! assert (isequal (subset (infsup (-2.0, 3.0), infsup (-2.0, 2.0)), false));
%!test
%! assert (isequal (subset (infsup (-3.0, 2.0), infsup (-2.0, 2.0)), false));
%!test
%! assert (eq (infsup (-1.0, 2.0), infsup (-1.0, 2.0)));
%! assert (infsup (-1.0, 2.0) == infsup (-1.0, 2.0));
%!test
%! assert (isequal (eq (infsup (-2.0, 1.0), infsup (-3.0, 2.0)), false));
%! assert (isequal (infsup (-2.0, 1.0) == infsup (-3.0, 2.0), false));
%!test
%! assert (isequal (eq (infsup (-2.0, 2.0), infsup (-1.0, 1.0)), false));
%! assert (isequal (infsup (-2.0, 2.0) == infsup (-1.0, 1.0), false));
%!test
%! assert (isequal (eq (infsup (-2.0, 2.0), infsup (-1.0, 2.0)), false));
%! assert (isequal (infsup (-2.0, 2.0) == infsup (-1.0, 2.0), false));
%!test
%! assert (isequal (eq (infsup (-2.0, 2.0), infsup (-2.0, 1.0)), false));
%! assert (isequal (infsup (-2.0, 2.0) == infsup (-2.0, 1.0), false));
%!test
%! assert (isequal (eq (infsup (-2.0, 2.0), infsup (-2.0, 3.0)), false));
%! assert (isequal (infsup (-2.0, 2.0) == infsup (-2.0, 3.0), false));
%!test
%! assert (isequal (eq (infsup (-2.0, 2.0), infsup (-3.0, 2.0)), false));
%! assert (isequal (infsup (-2.0, 2.0) == infsup (-3.0, 2.0), false));

## cxsc.intervalscalarsetcompops
%!# Tests A<B, A>B, A<=B, A>=B, A==B, B<A, B>A, B<=A, B>=A, B==A, where B is scalar
%!test
%! assert (isequal (interior (infsup (-1.0, 2.0), infsup (-2.0, -2.0)), false));
%!test
%! assert (isequal (interior (infsup (-2.0, 2.0), infsup (-2.0, -2.0)), false));
%!test
%! assert (isequal (interior (infsup (-2.0, 2.0), infsup (0.0, 0.0)), false));
%!test
%! assert (isequal (interior (infsup (-2.0, 2.0), infsup (2.0, 2.0)), false));
%!test
%! assert (isequal (interior (infsup (-2.0, 2.0), infsup (3.0, 3.0)), false));
%!test
%! assert (isequal (interior (infsup (-1.0, -1.0), infsup (1.0, 1.0)), false));
%!test
%! assert (isequal (interior (infsup (-1.0, -1.0), infsup (-1.0, -1.0)), false));
%!test
%! assert (isequal (interior (infsup (-2.0, -2.0), infsup (-1.0, 2.0)), false));
%!test
%! assert (isequal (interior (infsup (-2.0, -2.0), infsup (-2.0, 2.0)), false));
%!test
%! assert (interior (infsup (0.0, 0.0), infsup (-2.0, 2.0)));
%!test
%! assert (isequal (interior (infsup (2.0, 2.0), infsup (-2.0, 2.0)), false));
%!test
%! assert (isequal (interior (infsup (3.0, 3.0), infsup (-2.0, 2.0)), false));
%!test
%! assert (isequal (interior (infsup (1.0, 1.0), infsup (-1.0, -1.0)), false));
%!test
%! assert (isequal (interior (infsup (-1.0, -1.0), infsup (-1.0, -1.0)), false));
%!test
%! assert (isequal (subset (infsup (-1.0, 2.0), infsup (-2.0, -2.0)), false));
%!test
%! assert (isequal (subset (infsup (-2.0, 2.0), infsup (-2.0, -2.0)), false));
%!test
%! assert (isequal (subset (infsup (-2.0, 2.0), infsup (0.0, 0.0)), false));
%!test
%! assert (isequal (subset (infsup (-2.0, 2.0), infsup (2.0, 2.0)), false));
%!test
%! assert (isequal (subset (infsup (-2.0, 2.0), infsup (3.0, 3.0)), false));
%!test
%! assert (isequal (subset (infsup (-1.0, -1.0), infsup (1.0, 1.0)), false));
%!test
%! assert (subset (infsup (-1.0, -1.0), infsup (-1.0, -1.0)));
%!test
%! assert (isequal (subset (infsup (-2.0, -2.0), infsup (-1.0, 2.0)), false));
%!test
%! assert (subset (infsup (-2.0, -2.0), infsup (-2.0, 2.0)));
%!test
%! assert (subset (infsup (0.0, 0.0), infsup (-2.0, 2.0)));
%!test
%! assert (subset (infsup (2.0, 2.0), infsup (-2.0, 2.0)));
%!test
%! assert (isequal (subset (infsup (3.0, 3.0), infsup (-2.0, 2.0)), false));
%!test
%! assert (isequal (subset (infsup (1.0, 1.0), infsup (-1.0, -1.0)), false));
%!test
%! assert (subset (infsup (-1.0, -1.0), infsup (-1.0, -1.0)));
%!test
%! assert (isequal (eq (infsup (-1.0, 2.0), infsup (-2.0, -2.0)), false));
%! assert (isequal (infsup (-1.0, 2.0) == infsup (-2.0, -2.0), false));
%!test
%! assert (isequal (eq (infsup (-2.0, 2.0), infsup (-2.0, -2.0)), false));
%! assert (isequal (infsup (-2.0, 2.0) == infsup (-2.0, -2.0), false));
%!test
%! assert (isequal (eq (infsup (-2.0, 2.0), infsup (0.0, 0.0)), false));
%! assert (isequal (infsup (-2.0, 2.0) == infsup (0.0, 0.0), false));
%!test
%! assert (isequal (eq (infsup (-2.0, 2.0), infsup (2.0, 2.0)), false));
%! assert (isequal (infsup (-2.0, 2.0) == infsup (2.0, 2.0), false));
%!test
%! assert (isequal (eq (infsup (-2.0, 2.0), infsup (3.0, 3.0)), false));
%! assert (isequal (infsup (-2.0, 2.0) == infsup (3.0, 3.0), false));
%!test
%! assert (isequal (eq (infsup (-1.0, -1.0), infsup (1.0, 1.0)), false));
%! assert (isequal (infsup (-1.0, -1.0) == infsup (1.0, 1.0), false));
%!test
%! assert (eq (infsup (-1.0, -1.0), infsup (-1.0, -1.0)));
%! assert (infsup (-1.0, -1.0) == infsup (-1.0, -1.0));

## cxsc.intervalstdfunc

%!test
%! assert (isequal (pown (infsup (11.0, 11.0), 2), infsup (121.0, 121.0)));
%! assert (isequal (infsup (11.0, 11.0) .^ 2, infsup (121.0, 121.0)));
%! assert (isequal (power (infsup (11.0, 11.0), 2), infsup (121.0, 121.0)));
%! assert (isequal (infsup (11.0, 11.0) ^ 2, infsup (121.0, 121.0)));
%! assert (isequal (mpower (infsup (11.0, 11.0), 2), infsup (121.0, 121.0)));
%!test
%! assert (isequal (pown (infsup (0.0, 0.0), 2), infsup (0.0, 0.0)));
%! assert (isequal (infsup (0.0, 0.0) .^ 2, infsup (0.0, 0.0)));
%! assert (isequal (power (infsup (0.0, 0.0), 2), infsup (0.0, 0.0)));
%! assert (isequal (infsup (0.0, 0.0) ^ 2, infsup (0.0, 0.0)));
%! assert (isequal (mpower (infsup (0.0, 0.0), 2), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pown (infsup (-9.0, -9.0), 2), infsup (81.0, 81.0)));
%! assert (isequal (infsup (-9.0, -9.0) .^ 2, infsup (81.0, 81.0)));
%! assert (isequal (power (infsup (-9.0, -9.0), 2), infsup (81.0, 81.0)));
%! assert (isequal (infsup (-9.0, -9.0) ^ 2, infsup (81.0, 81.0)));
%! assert (isequal (mpower (infsup (-9.0, -9.0), 2), infsup (81.0, 81.0)));
%!test
%! assert (isequal (realsqrt (infsup (121.0, 121.0)), infsup (11.0, 11.0)));
%!test
%! assert (isequal (realsqrt (infsup (0.0, 0.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (realsqrt (infsup (81.0, 81.0)), infsup (9.0, 9.0)));
%!test
%! assert (isequal (nthroot (infsup (27.0, 27.0), 3), infsup (3.0, 3.0)));
%!test
%! assert (isequal (nthroot (infsup (0.0, 0.0), 4), infsup (0.0, 0.0)));
%!test
%! assert (isequal (nthroot (infsup (1024.0, 1024.0), 10), infsup (2.0, 2.0)));
%!test
%! assert (isequal (pow (infsup (2.0, 2.0), infsup (2.0, 2.0)), infsup (4.0, 4.0)));
%!test
%! assert (isequal (pow (infsup (4.0, 4.0), infsup (5.0, 5.0)), infsup (1024.0, 1024.0)));
%!# Negativ geht noch nicht
%!test
%! assert (isequal (pow (infsup (2.0, 2.0), infsup (3.0, 3.0)), infsup (8.0, 8.0)));
