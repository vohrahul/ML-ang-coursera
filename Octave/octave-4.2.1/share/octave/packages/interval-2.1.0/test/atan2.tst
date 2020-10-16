## DO NOT EDIT!  Generated automatically from test/atan2.itl
## by the Interval Testing Framework for IEEE 1788.
## https://github.com/nehmeier/ITF1788/tree/92558f7e942665a78f2e883dbe7af52320100fba
##
## Copyright 2015-2016 Oliver Heimlich
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

## minimal.atan2_test

%!test
%! assert (isequal (atan2 (infsup, infsup), infsup));
%!test
%! assert (isequal (atan2 (infsup, infsup (-inf, inf)), infsup));
%!test
%! assert (isequal (atan2 (infsup (-inf, inf), infsup), infsup));
%!test
%! assert (isequal (atan2 (infsup (0.0, 0.0), infsup (0.0, 0.0)), infsup));
%!test
%! assert (isequal (atan2 (infsup (-inf, inf), infsup (-inf, inf)), infsup (-3.141592653589793560e+00, 3.141592653589793560e+00)));
%!test
%! assert (isequal (atan2 (infsup (0.0, 0.0), infsup (-inf, 0.0)), infsup (3.141592653589793116e+00, 3.141592653589793560e+00)));
%!test
%! assert (isequal (atan2 (infsup (0.0, 0.0), infsup (0.0, inf)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (atan2 (infsup (0.0, inf), infsup (0.0, 0.0)), infsup (1.570796326794896558e+00, 1.570796326794896780e+00)));
%!test
%! assert (isequal (atan2 (infsup (-inf, 0.0), infsup (0.0, 0.0)), infsup (-1.570796326794896780e+00, -1.570796326794896558e+00)));
%!test
%! assert (isequal (atan2 (infsup (-2.225073858507201383e-308, 0.0), infsup (-2.225073858507201383e-308, -2.225073858507201383e-308)), infsup (-3.141592653589793560e+00, 3.141592653589793560e+00)));
%!test
%! assert (isequal (atan2 (infsup (1.0, 1.0), infsup (-1.0, -1.0)), infsup (2.356194490192344837e+00, 2.356194490192345281e+00)));
%!test
%! assert (isequal (atan2 (infsup (1.0, 1.0), infsup (1.0, 1.0)), infsup (7.853981633974482790e-01, 7.853981633974483900e-01)));
%!test
%! assert (isequal (atan2 (infsup (-1.0, -1.0), infsup (1.0, 1.0)), infsup (-7.853981633974483900e-01, -7.853981633974482790e-01)));
%!test
%! assert (isequal (atan2 (infsup (-1.0, -1.0), infsup (-1.0, -1.0)), infsup (-2.356194490192345281e+00, -2.356194490192344837e+00)));
%!test
%! assert (isequal (atan2 (infsup (-2.225073858507201383e-308, 2.225073858507201383e-308), infsup (-2.225073858507201383e-308, -2.225073858507201383e-308)), infsup (-3.141592653589793560e+00, 3.141592653589793560e+00)));
%!test
%! assert (isequal (atan2 (infsup (-2.225073858507201383e-308, 2.225073858507201383e-308), infsup (2.225073858507201383e-308, 2.225073858507201383e-308)), infsup (-7.853981633974483900e-01, 7.853981633974483900e-01)));
%!test
%! assert (isequal (atan2 (infsup (-2.225073858507201383e-308, -2.225073858507201383e-308), infsup (-2.225073858507201383e-308, 2.225073858507201383e-308)), infsup (-2.356194490192345281e+00, -7.853981633974482790e-01)));
%!test
%! assert (isequal (atan2 (infsup (2.225073858507201383e-308, 2.225073858507201383e-308), infsup (-2.225073858507201383e-308, 2.225073858507201383e-308)), infsup (7.853981633974482790e-01, 2.356194490192345281e+00)));
%!test
%! assert (isequal (atan2 (infsup (-2.0, 2.0), infsup (-3.0, -1.0)), infsup (-3.141592653589793560e+00, 3.141592653589793560e+00)));
%!test
%! assert (isequal (atan2 (infsup (0.0, 2.0), infsup (-3.0, -1.0)), infsup (2.034443935795702707e+00, 3.141592653589793560e+00)));
%!test
%! assert (isequal (atan2 (infsup (1.0, 3.0), infsup (-3.0, -1.0)), infsup (1.892546881191538688e+00, 2.819842099193151430e+00)));
%!test
%! assert (isequal (atan2 (infsup (1.0, 3.0), infsup (-2.0, 0.0)), infsup (1.570796326794896558e+00, 2.677945044588987411e+00)));
%!test
%! assert (isequal (atan2 (infsup (1.0, 3.0), infsup (-2.0, 2.0)), infsup (4.636476090008060935e-01, 2.677945044588987411e+00)));
%!test
%! assert (isequal (atan2 (infsup (1.0, 3.0), infsup (0.0, 2.0)), infsup (4.636476090008060935e-01, 1.570796326794896780e+00)));
%!test
%! assert (isequal (atan2 (infsup (1.0, 3.0), infsup (1.0, 3.0)), infsup (3.217505543966421855e-01, 1.249045772398254428e+00)));
%!test
%! assert (isequal (atan2 (infsup (0.0, 2.0), infsup (1.0, 3.0)), infsup (0.000000000000000000e+00, 1.107148717794090631e+00)));
%!test
%! assert (isequal (atan2 (infsup (-2.0, 2.0), infsup (1.0, 3.0)), infsup (-1.107148717794090631e+00, 1.107148717794090631e+00)));
%!test
%! assert (isequal (atan2 (infsup (-2.0, 0.0), infsup (1.0, 3.0)), infsup (-1.107148717794090631e+00, 0.000000000000000000e+00)));
%!test
%! assert (isequal (atan2 (infsup (-3.0, -1.0), infsup (1.0, 3.0)), infsup (-1.249045772398254428e+00, -3.217505543966421855e-01)));
%!test
%! assert (isequal (atan2 (infsup (-3.0, -1.0), infsup (0.0, 2.0)), infsup (-1.570796326794896780e+00, -4.636476090008060935e-01)));
%!test
%! assert (isequal (atan2 (infsup (-3.0, -1.0), infsup (-2.0, 2.0)), infsup (-2.677945044588987411e+00, -4.636476090008060935e-01)));
%!test
%! assert (isequal (atan2 (infsup (-3.0, -1.0), infsup (-2.0, 0.0)), infsup (-2.677945044588987411e+00, -1.570796326794896558e+00)));
%!test
%! assert (isequal (atan2 (infsup (-3.0, -1.0), infsup (-3.0, -1.0)), infsup (-2.819842099193151430e+00, -1.892546881191538688e+00)));
%!test
%! assert (isequal (atan2 (infsup (-2.0, 0.0), infsup (-3.0, -1.0)), infsup (-3.141592653589793560e+00, 3.141592653589793560e+00)));
%!test
%! assert (isequal (atan2 (infsup (-5.0, 0.0), infsup (-5.0, 0.0)), infsup (-3.141592653589793560e+00, 3.141592653589793560e+00)));
%!test
%! assert (isequal (atan2 (infsup (0.0, 5.0), infsup (-5.0, 0.0)), infsup (1.570796326794896558e+00, 3.141592653589793560e+00)));
%!test
%! assert (isequal (atan2 (infsup (0.0, 5.0), infsup (0.0, 5.0)), infsup (0.000000000000000000e+00, 1.570796326794896780e+00)));
%!test
%! assert (isequal (atan2 (infsup (-5.0, 0.0), infsup (0.0, 5.0)), infsup (-1.570796326794896780e+00, 0.000000000000000000e+00)));
