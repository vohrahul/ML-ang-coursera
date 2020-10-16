## DO NOT EDIT!  Generated automatically from test/libieeep1788_tests_mul_rev.itl
## by the Interval Testing Framework for IEEE 1788.
## https://github.com/nehmeier/ITF1788/tree/92558f7e942665a78f2e883dbe7af52320100fba
##
## Copyright 2013-2015 Marco Nehmeier (nehmeier@informatik.uni-wuerzburg.de)
## Copyright 2015-2016 Oliver Heimlich
## 
## Original author: Marco Nehmeier (unit tests in libieeep1788,
##                  original license: Apache License 2.0)
## Converted into portable ITL format by Oliver Heimlich with minor corrections.
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

## minimal_mulRevToPair_test

%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup, infsup (1.0, 2.0)), infsup));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup, infsup (1.0, 2.0)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (1.0, 2.0), infsup), infsup));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (1.0, 2.0), infsup), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup, infsup), infsup));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup, infsup), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (-2.0, -0.1), infsup (-2.1, -0.4)), infsup (2.000000000000000111e-01, 2.100000000000000000e+01)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (-2.0, -0.1), infsup (-2.1, -0.4)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (-2.0, 0.0), infsup (-2.1, -0.4)), infsup (2.000000000000000111e-01, inf)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (-2.0, 0.0), infsup (-2.1, -0.4)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (-2.0, 1.1), infsup (-2.1, -0.4)), infsup (-inf, -3.636363636363635909e-01)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (-2.0, 1.1), infsup (-2.1, -0.4)), infsup (2.000000000000000111e-01, inf)));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (0.0, 1.1), infsup (-2.1, -0.4)), infsup (-inf, -3.636363636363635909e-01)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (0.0, 1.1), infsup (-2.1, -0.4)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (0.01, 1.1), infsup (-2.1, -0.4)), infsup (-2.100000000000000284e+02, -3.636363636363635909e-01)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (0.01, 1.1), infsup (-2.1, -0.4)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (0.0, 0.0), infsup (-2.1, -0.4)), infsup));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (0.0, 0.0), infsup (-2.1, -0.4)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (-inf, -0.1), infsup (-2.1, -0.4)), infsup (0.0, 2.100000000000000000e+01)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (-inf, -0.1), infsup (-2.1, -0.4)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (-inf, 0.0), infsup (-2.1, -0.4)), infsup (0.0, inf)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (-inf, 0.0), infsup (-2.1, -0.4)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (-inf, 1.1), infsup (-2.1, -0.4)), infsup (-inf, -3.636363636363635909e-01)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (-inf, 1.1), infsup (-2.1, -0.4)), infsup (0.0, inf)));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (-2.0, inf), infsup (-2.1, -0.4)), infsup (-inf, 0.0)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (-2.0, inf), infsup (-2.1, -0.4)), infsup (2.000000000000000111e-01, inf)));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (0.0, inf), infsup (-2.1, -0.4)), infsup (-inf, 0.0)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (0.0, inf), infsup (-2.1, -0.4)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (0.01, inf), infsup (-2.1, -0.4)), infsup (-2.100000000000000284e+02, 0.0)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (0.01, inf), infsup (-2.1, -0.4)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (-inf, inf), infsup (-2.1, -0.4)), infsup (-inf, 0.0)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (-inf, inf), infsup (-2.1, -0.4)), infsup (0.0, inf)));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (-2.0, -0.1), infsup (-2.1, 0.0)), infsup (0.0, 2.100000000000000000e+01)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (-2.0, -0.1), infsup (-2.1, 0.0)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (-2.0, 0.0), infsup (-2.1, 0.0)), infsup (-inf, inf)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (-2.0, 0.0), infsup (-2.1, 0.0)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (-2.0, 1.1), infsup (-2.1, 0.0)), infsup (-inf, inf)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (-2.0, 1.1), infsup (-2.1, 0.0)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (0.0, 1.1), infsup (-2.1, 0.0)), infsup (-inf, inf)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (0.0, 1.1), infsup (-2.1, 0.0)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (0.01, 1.1), infsup (-2.1, 0.0)), infsup (-2.100000000000000284e+02, 0.0)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (0.01, 1.1), infsup (-2.1, 0.0)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (0.0, 0.0), infsup (-2.1, 0.0)), infsup (-inf, inf)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (0.0, 0.0), infsup (-2.1, 0.0)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (-inf, -0.1), infsup (-2.1, 0.0)), infsup (0.0, 2.100000000000000000e+01)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (-inf, -0.1), infsup (-2.1, 0.0)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (-inf, 0.0), infsup (-2.1, 0.0)), infsup (-inf, inf)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (-inf, 0.0), infsup (-2.1, 0.0)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (-inf, 1.1), infsup (-2.1, 0.0)), infsup (-inf, inf)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (-inf, 1.1), infsup (-2.1, 0.0)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (-2.0, inf), infsup (-2.1, 0.0)), infsup (-inf, inf)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (-2.0, inf), infsup (-2.1, 0.0)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (0.0, inf), infsup (-2.1, 0.0)), infsup (-inf, inf)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (0.0, inf), infsup (-2.1, 0.0)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (0.01, inf), infsup (-2.1, 0.0)), infsup (-2.100000000000000284e+02, 0.0)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (0.01, inf), infsup (-2.1, 0.0)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (-inf, inf), infsup (-2.1, 0.0)), infsup (-inf, inf)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (-inf, inf), infsup (-2.1, 0.0)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (-2.0, -0.1), infsup (-2.1, 0.12)), infsup (-1.199999999999999956e+00, 2.100000000000000000e+01)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (-2.0, -0.1), infsup (-2.1, 0.12)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (-2.0, 0.0), infsup (-2.1, 0.12)), infsup (-inf, inf)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (-2.0, 0.0), infsup (-2.1, 0.12)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (-2.0, 1.1), infsup (-2.1, 0.12)), infsup (-inf, inf)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (-2.0, 1.1), infsup (-2.1, 0.12)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (0.0, 1.1), infsup (-2.1, 0.12)), infsup (-inf, inf)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (0.0, 1.1), infsup (-2.1, 0.12)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (0.01, 1.1), infsup (-2.1, 0.12)), infsup (-2.100000000000000284e+02, 1.200000000000000000e+01)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (0.01, 1.1), infsup (-2.1, 0.12)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (0.0, 0.0), infsup (-2.1, 0.12)), infsup (-inf, inf)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (0.0, 0.0), infsup (-2.1, 0.12)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (-inf, -0.1), infsup (-2.1, 0.12)), infsup (-1.199999999999999956e+00, 2.100000000000000000e+01)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (-inf, -0.1), infsup (-2.1, 0.12)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (-inf, 0.0), infsup (-2.1, 0.12)), infsup (-inf, inf)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (-inf, 0.0), infsup (-2.1, 0.12)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (-inf, 1.1), infsup (-2.1, 0.12)), infsup (-inf, inf)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (-inf, 1.1), infsup (-2.1, 0.12)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (-2.0, inf), infsup (-2.1, 0.12)), infsup (-inf, inf)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (-2.0, inf), infsup (-2.1, 0.12)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (0.0, inf), infsup (-2.1, 0.12)), infsup (-inf, inf)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (0.0, inf), infsup (-2.1, 0.12)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (0.01, inf), infsup (-2.1, 0.12)), infsup (-2.100000000000000284e+02, 1.200000000000000000e+01)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (0.01, inf), infsup (-2.1, 0.12)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (-inf, inf), infsup (-2.1, 0.12)), infsup (-inf, inf)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (-inf, inf), infsup (-2.1, 0.12)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (-2.0, -0.1), infsup (0.0, 0.12)), infsup (-1.199999999999999956e+00, 0.0)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (-2.0, -0.1), infsup (0.0, 0.12)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (-2.0, 0.0), infsup (0.0, 0.12)), infsup (-inf, inf)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (-2.0, 0.0), infsup (0.0, 0.12)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (-2.0, 1.1), infsup (0.0, 0.12)), infsup (-inf, inf)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (-2.0, 1.1), infsup (0.0, 0.12)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (0.0, 1.1), infsup (0.0, 0.12)), infsup (-inf, inf)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (0.0, 1.1), infsup (0.0, 0.12)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (0.01, 1.1), infsup (0.0, 0.12)), infsup (0.0, 1.200000000000000000e+01)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (0.01, 1.1), infsup (0.0, 0.12)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (0.0, 0.0), infsup (0.0, 0.12)), infsup (-inf, inf)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (0.0, 0.0), infsup (0.0, 0.12)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (-inf, -0.1), infsup (0.0, 0.12)), infsup (-1.199999999999999956e+00, 0.0)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (-inf, -0.1), infsup (0.0, 0.12)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (-inf, 0.0), infsup (0.0, 0.12)), infsup (-inf, inf)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (-inf, 0.0), infsup (0.0, 0.12)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (-inf, 1.1), infsup (0.0, 0.12)), infsup (-inf, inf)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (-inf, 1.1), infsup (0.0, 0.12)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (-2.0, inf), infsup (0.0, 0.12)), infsup (-inf, inf)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (-2.0, inf), infsup (0.0, 0.12)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (0.0, inf), infsup (0.0, 0.12)), infsup (-inf, inf)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (0.0, inf), infsup (0.0, 0.12)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (0.01, inf), infsup (0.0, 0.12)), infsup (0.0, 1.200000000000000000e+01)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (0.01, inf), infsup (0.0, 0.12)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (-inf, inf), infsup (0.0, 0.12)), infsup (-inf, inf)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (-inf, inf), infsup (0.0, 0.12)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (-2.0, -0.1), infsup (0.01, 0.12)), infsup (-1.199999999999999956e+00, -5.000000000000000104e-03)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (-2.0, -0.1), infsup (0.01, 0.12)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (-2.0, 0.0), infsup (0.01, 0.12)), infsup (-inf, -5.000000000000000104e-03)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (-2.0, 0.0), infsup (0.01, 0.12)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (-2.0, 1.1), infsup (0.01, 0.12)), infsup (-inf, -5.000000000000000104e-03)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (-2.0, 1.1), infsup (0.01, 0.12)), infsup (9.090909090909088733e-03, inf)));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (0.0, 1.1), infsup (0.01, 0.12)), infsup (9.090909090909088733e-03, inf)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (0.0, 1.1), infsup (0.01, 0.12)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (0.01, 1.1), infsup (0.01, 0.12)), infsup (9.090909090909088733e-03, 1.200000000000000000e+01)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (0.01, 1.1), infsup (0.01, 0.12)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (0.0, 0.0), infsup (0.01, 0.12)), infsup));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (0.0, 0.0), infsup (0.01, 0.12)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (-inf, -0.1), infsup (0.01, 0.12)), infsup (-1.199999999999999956e+00, 0.0)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (-inf, -0.1), infsup (0.01, 0.12)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (-inf, 0.0), infsup (0.01, 0.12)), infsup (-inf, 0.0)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (-inf, 0.0), infsup (0.01, 0.12)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (-inf, 1.1), infsup (0.01, 0.12)), infsup (-inf, 0.0)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (-inf, 1.1), infsup (0.01, 0.12)), infsup (9.090909090909088733e-03, inf)));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (-2.0, inf), infsup (0.01, 0.12)), infsup (-inf, -5.000000000000000104e-03)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (-2.0, inf), infsup (0.01, 0.12)), infsup (0.0, inf)));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (0.0, inf), infsup (0.01, 0.12)), infsup (0.0, inf)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (0.0, inf), infsup (0.01, 0.12)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (0.01, inf), infsup (0.01, 0.12)), infsup (0.0, 1.200000000000000000e+01)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (0.01, inf), infsup (0.01, 0.12)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (-inf, inf), infsup (0.01, 0.12)), infsup (-inf, 0.0)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (-inf, inf), infsup (0.01, 0.12)), infsup (0.0, inf)));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (-2.0, -0.1), infsup (0.0, 0.0)), infsup (0.0, 0.0)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (-2.0, -0.1), infsup (0.0, 0.0)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (-2.0, 0.0), infsup (0.0, 0.0)), infsup (-inf, inf)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (-2.0, 0.0), infsup (0.0, 0.0)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (-2.0, 1.1), infsup (0.0, 0.0)), infsup (-inf, inf)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (-2.0, 1.1), infsup (0.0, 0.0)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (0.0, 1.1), infsup (0.0, 0.0)), infsup (-inf, inf)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (0.0, 1.1), infsup (0.0, 0.0)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (0.01, 1.1), infsup (0.0, 0.0)), infsup (0.0, 0.0)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (0.01, 1.1), infsup (0.0, 0.0)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (0.0, 0.0), infsup (0.0, 0.0)), infsup (-inf, inf)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (0.0, 0.0), infsup (0.0, 0.0)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (-inf, -0.1), infsup (0.0, 0.0)), infsup (0.0, 0.0)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (-inf, -0.1), infsup (0.0, 0.0)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (-inf, 0.0), infsup (0.0, 0.0)), infsup (-inf, inf)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (-inf, 0.0), infsup (0.0, 0.0)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (-inf, 1.1), infsup (0.0, 0.0)), infsup (-inf, inf)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (-inf, 1.1), infsup (0.0, 0.0)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (-2.0, inf), infsup (0.0, 0.0)), infsup (-inf, inf)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (-2.0, inf), infsup (0.0, 0.0)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (0.0, inf), infsup (0.0, 0.0)), infsup (-inf, inf)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (0.0, inf), infsup (0.0, 0.0)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (0.01, inf), infsup (0.0, 0.0)), infsup (0.0, 0.0)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (0.01, inf), infsup (0.0, 0.0)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (-inf, inf), infsup (0.0, 0.0)), infsup (-inf, inf)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (-inf, inf), infsup (0.0, 0.0)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (-2.0, -0.1), infsup (-inf, -0.1)), infsup (5.000000000000000278e-02, inf)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (-2.0, -0.1), infsup (-inf, -0.1)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (-2.0, 0.0), infsup (-inf, -0.1)), infsup (5.000000000000000278e-02, inf)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (-2.0, 0.0), infsup (-inf, -0.1)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (-2.0, 1.1), infsup (-inf, -0.1)), infsup (-inf, -9.090909090909089774e-02)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (-2.0, 1.1), infsup (-inf, -0.1)), infsup (5.000000000000000278e-02, inf)));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (0.0, 1.1), infsup (-inf, -0.1)), infsup (-inf, -9.090909090909089774e-02)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (0.0, 1.1), infsup (-inf, -0.1)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (0.01, 1.1), infsup (-inf, -0.1)), infsup (-inf, -9.090909090909089774e-02)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (0.01, 1.1), infsup (-inf, -0.1)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (0.0, 0.0), infsup (-inf, -0.1)), infsup));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (0.0, 0.0), infsup (-inf, -0.1)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (-inf, -0.1), infsup (-inf, -0.1)), infsup (0.0, inf)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (-inf, -0.1), infsup (-inf, -0.1)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (-inf, 0.0), infsup (-inf, -0.1)), infsup (0.0, inf)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (-inf, 0.0), infsup (-inf, -0.1)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (-inf, 1.1), infsup (-inf, -0.1)), infsup (-inf, -9.090909090909089774e-02)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (-inf, 1.1), infsup (-inf, -0.1)), infsup (0.0, inf)));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (-2.0, inf), infsup (-inf, -0.1)), infsup (-inf, 0.0)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (-2.0, inf), infsup (-inf, -0.1)), infsup (5.000000000000000278e-02, inf)));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (0.0, inf), infsup (-inf, -0.1)), infsup (-inf, 0.0)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (0.0, inf), infsup (-inf, -0.1)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (0.01, inf), infsup (-inf, -0.1)), infsup (-inf, 0.0)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (0.01, inf), infsup (-inf, -0.1)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (-inf, inf), infsup (-inf, -0.1)), infsup (-inf, 0.0)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (-inf, inf), infsup (-inf, -0.1)), infsup (0.0, inf)));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (-2.0, -0.1), infsup (-inf, 0.0)), infsup (0.0, inf)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (-2.0, -0.1), infsup (-inf, 0.0)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (-2.0, 0.0), infsup (-inf, 0.0)), infsup (-inf, inf)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (-2.0, 0.0), infsup (-inf, 0.0)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (-2.0, 1.1), infsup (-inf, 0.0)), infsup (-inf, inf)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (-2.0, 1.1), infsup (-inf, 0.0)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (0.0, 1.1), infsup (-inf, 0.0)), infsup (-inf, inf)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (0.0, 1.1), infsup (-inf, 0.0)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (0.01, 1.1), infsup (-inf, 0.0)), infsup (-inf, 0.0)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (0.01, 1.1), infsup (-inf, 0.0)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (0.0, 0.0), infsup (-inf, 0.0)), infsup (-inf, inf)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (0.0, 0.0), infsup (-inf, 0.0)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (-inf, -0.1), infsup (-inf, 0.0)), infsup (0.0, inf)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (-inf, -0.1), infsup (-inf, 0.0)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (-inf, 0.0), infsup (-inf, 0.0)), infsup (-inf, inf)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (-inf, 0.0), infsup (-inf, 0.0)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (-inf, 1.1), infsup (-inf, 0.0)), infsup (-inf, inf)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (-inf, 1.1), infsup (-inf, 0.0)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (-2.0, inf), infsup (-inf, 0.0)), infsup (-inf, inf)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (-2.0, inf), infsup (-inf, 0.0)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (0.0, inf), infsup (-inf, 0.0)), infsup (-inf, inf)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (0.0, inf), infsup (-inf, 0.0)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (0.01, inf), infsup (-inf, 0.0)), infsup (-inf, 0.0)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (0.01, inf), infsup (-inf, 0.0)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (-inf, inf), infsup (-inf, 0.0)), infsup (-inf, inf)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (-inf, inf), infsup (-inf, 0.0)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (-2.0, -0.1), infsup (-inf, 0.3)), infsup (-3.000000000000000000e+00, inf)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (-2.0, -0.1), infsup (-inf, 0.3)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (-2.0, 0.0), infsup (-inf, 0.3)), infsup (-inf, inf)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (-2.0, 0.0), infsup (-inf, 0.3)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (-2.0, 1.1), infsup (-inf, 0.3)), infsup (-inf, inf)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (-2.0, 1.1), infsup (-inf, 0.3)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (0.0, 1.1), infsup (-inf, 0.3)), infsup (-inf, inf)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (0.0, 1.1), infsup (-inf, 0.3)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (0.01, 1.1), infsup (-inf, 0.3)), infsup (-inf, 3.000000000000000000e+01)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (0.01, 1.1), infsup (-inf, 0.3)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (0.0, 0.0), infsup (-inf, 0.3)), infsup (-inf, inf)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (0.0, 0.0), infsup (-inf, 0.3)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (-inf, -0.1), infsup (-inf, 0.3)), infsup (-3.000000000000000000e+00, inf)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (-inf, -0.1), infsup (-inf, 0.3)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (-inf, 0.0), infsup (-inf, 0.3)), infsup (-inf, inf)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (-inf, 0.0), infsup (-inf, 0.3)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (-inf, 1.1), infsup (-inf, 0.3)), infsup (-inf, inf)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (-inf, 1.1), infsup (-inf, 0.3)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (-2.0, inf), infsup (-inf, 0.3)), infsup (-inf, inf)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (-2.0, inf), infsup (-inf, 0.3)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (0.0, inf), infsup (-inf, 0.3)), infsup (-inf, inf)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (0.0, inf), infsup (-inf, 0.3)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (0.01, inf), infsup (-inf, 0.3)), infsup (-inf, 3.000000000000000000e+01)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (0.01, inf), infsup (-inf, 0.3)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (-inf, inf), infsup (-inf, 0.3)), infsup (-inf, inf)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (-inf, inf), infsup (-inf, 0.3)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (-2.0, -0.1), infsup (-0.21, inf)), infsup (-inf, 2.100000000000000089e+00)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (-2.0, -0.1), infsup (-0.21, inf)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (-2.0, 0.0), infsup (-0.21, inf)), infsup (-inf, inf)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (-2.0, 0.0), infsup (-0.21, inf)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (-2.0, 1.1), infsup (-0.21, inf)), infsup (-inf, inf)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (-2.0, 1.1), infsup (-0.21, inf)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (0.0, 1.1), infsup (-0.21, inf)), infsup (-inf, inf)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (0.0, 1.1), infsup (-0.21, inf)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (0.01, 1.1), infsup (-0.21, inf)), infsup (-2.100000000000000000e+01, inf)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (0.01, 1.1), infsup (-0.21, inf)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (0.0, 0.0), infsup (-0.21, inf)), infsup (-inf, inf)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (0.0, 0.0), infsup (-0.21, inf)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (-inf, -0.1), infsup (-0.21, inf)), infsup (-inf, 2.100000000000000089e+00)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (-inf, -0.1), infsup (-0.21, inf)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (-inf, 0.0), infsup (-0.21, inf)), infsup (-inf, inf)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (-inf, 0.0), infsup (-0.21, inf)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (-inf, 1.1), infsup (-0.21, inf)), infsup (-inf, inf)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (-inf, 1.1), infsup (-0.21, inf)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (-2.0, inf), infsup (-0.21, inf)), infsup (-inf, inf)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (-2.0, inf), infsup (-0.21, inf)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (0.0, inf), infsup (-0.21, inf)), infsup (-inf, inf)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (0.0, inf), infsup (-0.21, inf)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (0.01, inf), infsup (-0.21, inf)), infsup (-2.100000000000000000e+01, inf)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (0.01, inf), infsup (-0.21, inf)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (-inf, inf), infsup (-0.21, inf)), infsup (-inf, inf)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (-inf, inf), infsup (-0.21, inf)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (-2.0, -0.1), infsup (0.0, inf)), infsup (-inf, 0.0)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (-2.0, -0.1), infsup (0.0, inf)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (-2.0, 0.0), infsup (0.0, inf)), infsup (-inf, inf)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (-2.0, 0.0), infsup (0.0, inf)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (-2.0, 1.1), infsup (0.0, inf)), infsup (-inf, inf)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (-2.0, 1.1), infsup (0.0, inf)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (0.0, 1.1), infsup (0.0, inf)), infsup (-inf, inf)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (0.0, 1.1), infsup (0.0, inf)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (0.01, 1.1), infsup (0.0, inf)), infsup (0.0, inf)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (0.01, 1.1), infsup (0.0, inf)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (0.0, 0.0), infsup (0.0, inf)), infsup (-inf, inf)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (0.0, 0.0), infsup (0.0, inf)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (-inf, -0.1), infsup (0.0, inf)), infsup (-inf, 0.0)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (-inf, -0.1), infsup (0.0, inf)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (-inf, 0.0), infsup (0.0, inf)), infsup (-inf, inf)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (-inf, 0.0), infsup (0.0, inf)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (-inf, 1.1), infsup (0.0, inf)), infsup (-inf, inf)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (-inf, 1.1), infsup (0.0, inf)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (-2.0, inf), infsup (0.0, inf)), infsup (-inf, inf)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (-2.0, inf), infsup (0.0, inf)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (0.0, inf), infsup (0.0, inf)), infsup (-inf, inf)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (0.0, inf), infsup (0.0, inf)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (0.01, inf), infsup (0.0, inf)), infsup (0.0, inf)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (0.01, inf), infsup (0.0, inf)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (-inf, inf), infsup (0.0, inf)), infsup (-inf, inf)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (-inf, inf), infsup (0.0, inf)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (-2.0, -0.1), infsup (0.04, inf)), infsup (-inf, -2.000000000000000042e-02)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (-2.0, -0.1), infsup (0.04, inf)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (-2.0, 0.0), infsup (0.04, inf)), infsup (-inf, -2.000000000000000042e-02)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (-2.0, 0.0), infsup (0.04, inf)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (-2.0, 1.1), infsup (0.04, inf)), infsup (-inf, -2.000000000000000042e-02)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (-2.0, 1.1), infsup (0.04, inf)), infsup (3.636363636363635493e-02, inf)));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (0.0, 1.1), infsup (0.04, inf)), infsup (3.636363636363635493e-02, inf)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (0.0, 1.1), infsup (0.04, inf)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (0.01, 1.1), infsup (0.04, inf)), infsup (3.636363636363635493e-02, inf)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (0.01, 1.1), infsup (0.04, inf)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (0.0, 0.0), infsup (0.04, inf)), infsup));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (0.0, 0.0), infsup (0.04, inf)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (-inf, -0.1), infsup (0.04, inf)), infsup (-inf, 0.0)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (-inf, -0.1), infsup (0.04, inf)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (-inf, 0.0), infsup (0.04, inf)), infsup (-inf, 0.0)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (-inf, 0.0), infsup (0.04, inf)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (-inf, 1.1), infsup (0.04, inf)), infsup (-inf, 0.0)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (-inf, 1.1), infsup (0.04, inf)), infsup (3.636363636363635493e-02, inf)));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (-2.0, inf), infsup (0.04, inf)), infsup (-inf, -2.000000000000000042e-02)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (-2.0, inf), infsup (0.04, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (0.0, inf), infsup (0.04, inf)), infsup (0.0, inf)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (0.0, inf), infsup (0.04, inf)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (0.01, inf), infsup (0.04, inf)), infsup (0.0, inf)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (0.01, inf), infsup (0.04, inf)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (-inf, inf), infsup (0.04, inf)), infsup (-inf, 0.0)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (-inf, inf), infsup (0.04, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (-2.0, -0.1), infsup (-inf, inf)), infsup (-inf, inf)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (-2.0, -0.1), infsup (-inf, inf)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (-2.0, 0.0), infsup (-inf, inf)), infsup (-inf, inf)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (-2.0, 0.0), infsup (-inf, inf)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (-2.0, 1.1), infsup (-inf, inf)), infsup (-inf, inf)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (-2.0, 1.1), infsup (-inf, inf)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (0.0, 1.1), infsup (-inf, inf)), infsup (-inf, inf)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (0.0, 1.1), infsup (-inf, inf)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (0.01, 1.1), infsup (-inf, inf)), infsup (-inf, inf)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (0.01, 1.1), infsup (-inf, inf)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (0.0, 0.0), infsup (-inf, inf)), infsup (-inf, inf)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (0.0, 0.0), infsup (-inf, inf)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (-inf, -0.1), infsup (-inf, inf)), infsup (-inf, inf)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (-inf, -0.1), infsup (-inf, inf)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (-inf, 0.0), infsup (-inf, inf)), infsup (-inf, inf)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (-inf, 0.0), infsup (-inf, inf)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (-inf, 1.1), infsup (-inf, inf)), infsup (-inf, inf)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (-inf, 1.1), infsup (-inf, inf)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (-2.0, inf), infsup (-inf, inf)), infsup (-inf, inf)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (-2.0, inf), infsup (-inf, inf)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (0.0, inf), infsup (-inf, inf)), infsup (-inf, inf)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (0.0, inf), infsup (-inf, inf)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (0.01, inf), infsup (-inf, inf)), infsup (-inf, inf)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (0.01, inf), infsup (-inf, inf)), infsup));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsup (-inf, inf), infsup (-inf, inf)), infsup (-inf, inf)));
%! assert (isequal (nthargout(2, 2, @mulrev, infsup (-inf, inf), infsup (-inf, inf)), infsup));

## minimal_mulRevToPair_dec_test

%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (empty, "trv"), infsupdec (1.0, 2.0, "def")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (empty, "trv"), infsupdec (1.0, 2.0, "def"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (empty, "trv"), infsupdec (1.0, 2.0, "def")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (empty, "trv"), infsupdec (1.0, 2.0, "def"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (1.0, 2.0, "com"), infsupdec (empty, "trv")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (1.0, 2.0, "com"), infsupdec (empty, "trv"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (1.0, 2.0, "com"), infsupdec (empty, "trv")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (1.0, 2.0, "com"), infsupdec (empty, "trv"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (empty, "trv"), infsupdec (empty, "trv")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (empty, "trv"), infsupdec (empty, "trv"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (empty, "trv"), infsupdec (empty, "trv")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (empty, "trv"), infsupdec (empty, "trv"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (-2.0, -0.1, "com"), infsupdec (-2.1, -0.4, "com")), infsupdec (2.000000000000000111e-01, 2.100000000000000000e+01, "com")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (-2.0, -0.1, "com"), infsupdec (-2.1, -0.4, "com"))){1}, decorationpart (infsupdec (2.000000000000000111e-01, 2.100000000000000000e+01, "com")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (-2.0, -0.1, "com"), infsupdec (-2.1, -0.4, "com")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (-2.0, -0.1, "com"), infsupdec (-2.1, -0.4, "com"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (-2.0, 0.0, "dac"), infsupdec (-2.1, -0.4, "com")), infsupdec (2.000000000000000111e-01, inf, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (-2.0, 0.0, "dac"), infsupdec (-2.1, -0.4, "com"))){1}, decorationpart (infsupdec (2.000000000000000111e-01, inf, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (-2.0, 0.0, "dac"), infsupdec (-2.1, -0.4, "com")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (-2.0, 0.0, "dac"), infsupdec (-2.1, -0.4, "com"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (-2.0, 1.1, "com"), infsupdec (-2.1, -0.4, "dac")), infsupdec (-inf, -3.636363636363635909e-01, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (-2.0, 1.1, "com"), infsupdec (-2.1, -0.4, "dac"))){1}, decorationpart (infsupdec (-inf, -3.636363636363635909e-01, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (-2.0, 1.1, "com"), infsupdec (-2.1, -0.4, "dac")), infsupdec (2.000000000000000111e-01, inf, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (-2.0, 1.1, "com"), infsupdec (-2.1, -0.4, "dac"))){1}, decorationpart (infsupdec (2.000000000000000111e-01, inf, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (0.0, 1.1, "trv"), infsupdec (-2.1, -0.4, "def")), infsupdec (-inf, -3.636363636363635909e-01, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (0.0, 1.1, "trv"), infsupdec (-2.1, -0.4, "def"))){1}, decorationpart (infsupdec (-inf, -3.636363636363635909e-01, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (0.0, 1.1, "trv"), infsupdec (-2.1, -0.4, "def")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (0.0, 1.1, "trv"), infsupdec (-2.1, -0.4, "def"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (0.01, 1.1, "com"), infsupdec (-2.1, -0.4, "com")), infsupdec (-2.100000000000000284e+02, -3.636363636363635909e-01, "com")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (0.01, 1.1, "com"), infsupdec (-2.1, -0.4, "com"))){1}, decorationpart (infsupdec (-2.100000000000000284e+02, -3.636363636363635909e-01, "com")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (0.01, 1.1, "com"), infsupdec (-2.1, -0.4, "com")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (0.01, 1.1, "com"), infsupdec (-2.1, -0.4, "com"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (0.0, 0.0, "dac"), infsupdec (-2.1, -0.4, "def")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (0.0, 0.0, "dac"), infsupdec (-2.1, -0.4, "def"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (0.0, 0.0, "dac"), infsupdec (-2.1, -0.4, "def")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (0.0, 0.0, "dac"), infsupdec (-2.1, -0.4, "def"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (-inf, -0.1, "dac"), infsupdec (-2.1, -0.4, "dac")), infsupdec (0.0, 2.100000000000000000e+01, "dac")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (-inf, -0.1, "dac"), infsupdec (-2.1, -0.4, "dac"))){1}, decorationpart (infsupdec (0.0, 2.100000000000000000e+01, "dac")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (-inf, -0.1, "dac"), infsupdec (-2.1, -0.4, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (-inf, -0.1, "dac"), infsupdec (-2.1, -0.4, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (-inf, 0.0, "def"), infsupdec (-2.1, -0.4, "com")), infsupdec (0.0, inf, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (-inf, 0.0, "def"), infsupdec (-2.1, -0.4, "com"))){1}, decorationpart (infsupdec (0.0, inf, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (-inf, 0.0, "def"), infsupdec (-2.1, -0.4, "com")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (-inf, 0.0, "def"), infsupdec (-2.1, -0.4, "com"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (-inf, 1.1, "trv"), infsupdec (-2.1, -0.4, "def")), infsupdec (-inf, -3.636363636363635909e-01, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (-inf, 1.1, "trv"), infsupdec (-2.1, -0.4, "def"))){1}, decorationpart (infsupdec (-inf, -3.636363636363635909e-01, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (-inf, 1.1, "trv"), infsupdec (-2.1, -0.4, "def")), infsupdec (0.0, inf, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (-inf, 1.1, "trv"), infsupdec (-2.1, -0.4, "def"))){1}, decorationpart (infsupdec (0.0, inf, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (-2.0, inf, "dac"), infsupdec (-2.1, -0.4, "dac")), infsupdec (-inf, 0.0, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (-2.0, inf, "dac"), infsupdec (-2.1, -0.4, "dac"))){1}, decorationpart (infsupdec (-inf, 0.0, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (-2.0, inf, "dac"), infsupdec (-2.1, -0.4, "dac")), infsupdec (2.000000000000000111e-01, inf, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (-2.0, inf, "dac"), infsupdec (-2.1, -0.4, "dac"))){1}, decorationpart (infsupdec (2.000000000000000111e-01, inf, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (0.0, inf, "def"), infsupdec (-2.1, -0.4, "com")), infsupdec (-inf, 0.0, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (0.0, inf, "def"), infsupdec (-2.1, -0.4, "com"))){1}, decorationpart (infsupdec (-inf, 0.0, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (0.0, inf, "def"), infsupdec (-2.1, -0.4, "com")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (0.0, inf, "def"), infsupdec (-2.1, -0.4, "com"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (0.01, inf, "def"), infsupdec (-2.1, -0.4, "def")), infsupdec (-2.100000000000000284e+02, 0.0, "def")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (0.01, inf, "def"), infsupdec (-2.1, -0.4, "def"))){1}, decorationpart (infsupdec (-2.100000000000000284e+02, 0.0, "def")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (0.01, inf, "def"), infsupdec (-2.1, -0.4, "def")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (0.01, inf, "def"), infsupdec (-2.1, -0.4, "def"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (entire, "dac"), infsupdec (-2.1, -0.4, "dac")), infsupdec (-inf, 0.0, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (entire, "dac"), infsupdec (-2.1, -0.4, "dac"))){1}, decorationpart (infsupdec (-inf, 0.0, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (entire, "dac"), infsupdec (-2.1, -0.4, "dac")), infsupdec (0.0, inf, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (entire, "dac"), infsupdec (-2.1, -0.4, "dac"))){1}, decorationpart (infsupdec (0.0, inf, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (-2.0, -0.1, "dac"), infsupdec (-2.1, 0.0, "com")), infsupdec (0.0, 2.100000000000000000e+01, "dac")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (-2.0, -0.1, "dac"), infsupdec (-2.1, 0.0, "com"))){1}, decorationpart (infsupdec (0.0, 2.100000000000000000e+01, "dac")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (-2.0, -0.1, "dac"), infsupdec (-2.1, 0.0, "com")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (-2.0, -0.1, "dac"), infsupdec (-2.1, 0.0, "com"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (-2.0, 0.0, "dac"), infsupdec (-2.1, 0.0, "com")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (-2.0, 0.0, "dac"), infsupdec (-2.1, 0.0, "com"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (-2.0, 0.0, "dac"), infsupdec (-2.1, 0.0, "com")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (-2.0, 0.0, "dac"), infsupdec (-2.1, 0.0, "com"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (-2.0, 1.1, "dac"), infsupdec (-2.1, 0.0, "com")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (-2.0, 1.1, "dac"), infsupdec (-2.1, 0.0, "com"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (-2.0, 1.1, "dac"), infsupdec (-2.1, 0.0, "com")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (-2.0, 1.1, "dac"), infsupdec (-2.1, 0.0, "com"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (0.0, 1.1, "dac"), infsupdec (-2.1, 0.0, "com")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (0.0, 1.1, "dac"), infsupdec (-2.1, 0.0, "com"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (0.0, 1.1, "dac"), infsupdec (-2.1, 0.0, "com")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (0.0, 1.1, "dac"), infsupdec (-2.1, 0.0, "com"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (0.01, 1.1, "dac"), infsupdec (-2.1, 0.0, "com")), infsupdec (-2.100000000000000284e+02, 0.0, "dac")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (0.01, 1.1, "dac"), infsupdec (-2.1, 0.0, "com"))){1}, decorationpart (infsupdec (-2.100000000000000284e+02, 0.0, "dac")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (0.01, 1.1, "dac"), infsupdec (-2.1, 0.0, "com")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (0.01, 1.1, "dac"), infsupdec (-2.1, 0.0, "com"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (0.0, 0.0, "dac"), infsupdec (-2.1, 0.0, "com")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (0.0, 0.0, "dac"), infsupdec (-2.1, 0.0, "com"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (0.0, 0.0, "dac"), infsupdec (-2.1, 0.0, "com")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (0.0, 0.0, "dac"), infsupdec (-2.1, 0.0, "com"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (-inf, -0.1, "dac"), infsupdec (-2.1, 0.0, "com")), infsupdec (0.0, 2.100000000000000000e+01, "dac")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (-inf, -0.1, "dac"), infsupdec (-2.1, 0.0, "com"))){1}, decorationpart (infsupdec (0.0, 2.100000000000000000e+01, "dac")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (-inf, -0.1, "dac"), infsupdec (-2.1, 0.0, "com")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (-inf, -0.1, "dac"), infsupdec (-2.1, 0.0, "com"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (-inf, 0.0, "dac"), infsupdec (-2.1, 0.0, "com")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (-inf, 0.0, "dac"), infsupdec (-2.1, 0.0, "com"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (-inf, 0.0, "dac"), infsupdec (-2.1, 0.0, "com")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (-inf, 0.0, "dac"), infsupdec (-2.1, 0.0, "com"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (-inf, 1.1, "dac"), infsupdec (-2.1, 0.0, "com")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (-inf, 1.1, "dac"), infsupdec (-2.1, 0.0, "com"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (-inf, 1.1, "dac"), infsupdec (-2.1, 0.0, "com")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (-inf, 1.1, "dac"), infsupdec (-2.1, 0.0, "com"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (-2.0, inf, "dac"), infsupdec (-2.1, 0.0, "com")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (-2.0, inf, "dac"), infsupdec (-2.1, 0.0, "com"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (-2.0, inf, "dac"), infsupdec (-2.1, 0.0, "com")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (-2.0, inf, "dac"), infsupdec (-2.1, 0.0, "com"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (0.0, inf, "dac"), infsupdec (-2.1, 0.0, "com")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (0.0, inf, "dac"), infsupdec (-2.1, 0.0, "com"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (0.0, inf, "dac"), infsupdec (-2.1, 0.0, "com")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (0.0, inf, "dac"), infsupdec (-2.1, 0.0, "com"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (0.01, inf, "dac"), infsupdec (-2.1, 0.0, "com")), infsupdec (-2.100000000000000284e+02, 0.0, "dac")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (0.01, inf, "dac"), infsupdec (-2.1, 0.0, "com"))){1}, decorationpart (infsupdec (-2.100000000000000284e+02, 0.0, "dac")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (0.01, inf, "dac"), infsupdec (-2.1, 0.0, "com")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (0.01, inf, "dac"), infsupdec (-2.1, 0.0, "com"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (entire, "dac"), infsupdec (-2.1, 0.0, "com")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (entire, "dac"), infsupdec (-2.1, 0.0, "com"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (entire, "dac"), infsupdec (-2.1, 0.0, "com")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (entire, "dac"), infsupdec (-2.1, 0.0, "com"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (-2.0, -0.1, "def"), infsupdec (-2.1, 0.12, "dac")), infsupdec (-1.199999999999999956e+00, 2.100000000000000000e+01, "def")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (-2.0, -0.1, "def"), infsupdec (-2.1, 0.12, "dac"))){1}, decorationpart (infsupdec (-1.199999999999999956e+00, 2.100000000000000000e+01, "def")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (-2.0, -0.1, "def"), infsupdec (-2.1, 0.12, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (-2.0, -0.1, "def"), infsupdec (-2.1, 0.12, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (-2.0, 0.0, "def"), infsupdec (-2.1, 0.12, "dac")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (-2.0, 0.0, "def"), infsupdec (-2.1, 0.12, "dac"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (-2.0, 0.0, "def"), infsupdec (-2.1, 0.12, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (-2.0, 0.0, "def"), infsupdec (-2.1, 0.12, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (-2.0, 1.1, "def"), infsupdec (-2.1, 0.12, "dac")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (-2.0, 1.1, "def"), infsupdec (-2.1, 0.12, "dac"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (-2.0, 1.1, "def"), infsupdec (-2.1, 0.12, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (-2.0, 1.1, "def"), infsupdec (-2.1, 0.12, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (0.0, 1.1, "def"), infsupdec (-2.1, 0.12, "dac")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (0.0, 1.1, "def"), infsupdec (-2.1, 0.12, "dac"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (0.0, 1.1, "def"), infsupdec (-2.1, 0.12, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (0.0, 1.1, "def"), infsupdec (-2.1, 0.12, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (0.01, 1.1, "def"), infsupdec (-2.1, 0.12, "dac")), infsupdec (-2.100000000000000284e+02, 1.200000000000000000e+01, "def")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (0.01, 1.1, "def"), infsupdec (-2.1, 0.12, "dac"))){1}, decorationpart (infsupdec (-2.100000000000000284e+02, 1.200000000000000000e+01, "def")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (0.01, 1.1, "def"), infsupdec (-2.1, 0.12, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (0.01, 1.1, "def"), infsupdec (-2.1, 0.12, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (0.0, 0.0, "def"), infsupdec (-2.1, 0.12, "dac")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (0.0, 0.0, "def"), infsupdec (-2.1, 0.12, "dac"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (0.0, 0.0, "def"), infsupdec (-2.1, 0.12, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (0.0, 0.0, "def"), infsupdec (-2.1, 0.12, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (-inf, -0.1, "def"), infsupdec (-2.1, 0.12, "dac")), infsupdec (-1.199999999999999956e+00, 2.100000000000000000e+01, "def")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (-inf, -0.1, "def"), infsupdec (-2.1, 0.12, "dac"))){1}, decorationpart (infsupdec (-1.199999999999999956e+00, 2.100000000000000000e+01, "def")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (-inf, -0.1, "def"), infsupdec (-2.1, 0.12, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (-inf, -0.1, "def"), infsupdec (-2.1, 0.12, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (-inf, 0.0, "def"), infsupdec (-2.1, 0.12, "dac")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (-inf, 0.0, "def"), infsupdec (-2.1, 0.12, "dac"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (-inf, 0.0, "def"), infsupdec (-2.1, 0.12, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (-inf, 0.0, "def"), infsupdec (-2.1, 0.12, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (-inf, 1.1, "def"), infsupdec (-2.1, 0.12, "dac")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (-inf, 1.1, "def"), infsupdec (-2.1, 0.12, "dac"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (-inf, 1.1, "def"), infsupdec (-2.1, 0.12, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (-inf, 1.1, "def"), infsupdec (-2.1, 0.12, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (-2.0, inf, "def"), infsupdec (-2.1, 0.12, "dac")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (-2.0, inf, "def"), infsupdec (-2.1, 0.12, "dac"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (-2.0, inf, "def"), infsupdec (-2.1, 0.12, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (-2.0, inf, "def"), infsupdec (-2.1, 0.12, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (0.0, inf, "def"), infsupdec (-2.1, 0.12, "dac")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (0.0, inf, "def"), infsupdec (-2.1, 0.12, "dac"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (0.0, inf, "def"), infsupdec (-2.1, 0.12, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (0.0, inf, "def"), infsupdec (-2.1, 0.12, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (0.01, inf, "def"), infsupdec (-2.1, 0.12, "dac")), infsupdec (-2.100000000000000284e+02, 1.200000000000000000e+01, "def")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (0.01, inf, "def"), infsupdec (-2.1, 0.12, "dac"))){1}, decorationpart (infsupdec (-2.100000000000000284e+02, 1.200000000000000000e+01, "def")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (0.01, inf, "def"), infsupdec (-2.1, 0.12, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (0.01, inf, "def"), infsupdec (-2.1, 0.12, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (entire, "def"), infsupdec (-2.1, 0.12, "dac")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (entire, "def"), infsupdec (-2.1, 0.12, "dac"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (entire, "def"), infsupdec (-2.1, 0.12, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (entire, "def"), infsupdec (-2.1, 0.12, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (-2.0, -0.1, "com"), infsupdec (0.0, 0.12, "com")), infsupdec (-1.199999999999999956e+00, 0.0, "com")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (-2.0, -0.1, "com"), infsupdec (0.0, 0.12, "com"))){1}, decorationpart (infsupdec (-1.199999999999999956e+00, 0.0, "com")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (-2.0, -0.1, "com"), infsupdec (0.0, 0.12, "com")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (-2.0, -0.1, "com"), infsupdec (0.0, 0.12, "com"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (-2.0, 0.0, "com"), infsupdec (0.0, 0.12, "com")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (-2.0, 0.0, "com"), infsupdec (0.0, 0.12, "com"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (-2.0, 0.0, "com"), infsupdec (0.0, 0.12, "com")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (-2.0, 0.0, "com"), infsupdec (0.0, 0.12, "com"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (-2.0, 1.1, "com"), infsupdec (0.0, 0.12, "com")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (-2.0, 1.1, "com"), infsupdec (0.0, 0.12, "com"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (-2.0, 1.1, "com"), infsupdec (0.0, 0.12, "com")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (-2.0, 1.1, "com"), infsupdec (0.0, 0.12, "com"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (0.0, 1.1, "com"), infsupdec (0.0, 0.12, "com")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (0.0, 1.1, "com"), infsupdec (0.0, 0.12, "com"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (0.0, 1.1, "com"), infsupdec (0.0, 0.12, "com")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (0.0, 1.1, "com"), infsupdec (0.0, 0.12, "com"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (0.01, 1.1, "com"), infsupdec (0.0, 0.12, "com")), infsupdec (0.0, 1.200000000000000000e+01, "com")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (0.01, 1.1, "com"), infsupdec (0.0, 0.12, "com"))){1}, decorationpart (infsupdec (0.0, 1.200000000000000000e+01, "com")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (0.01, 1.1, "com"), infsupdec (0.0, 0.12, "com")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (0.01, 1.1, "com"), infsupdec (0.0, 0.12, "com"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (0.0, 0.0, "com"), infsupdec (0.0, 0.12, "com")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (0.0, 0.0, "com"), infsupdec (0.0, 0.12, "com"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (0.0, 0.0, "com"), infsupdec (0.0, 0.12, "com")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (0.0, 0.0, "com"), infsupdec (0.0, 0.12, "com"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (-inf, -0.1, "dac"), infsupdec (0.0, 0.12, "com")), infsupdec (-1.199999999999999956e+00, 0.0, "dac")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (-inf, -0.1, "dac"), infsupdec (0.0, 0.12, "com"))){1}, decorationpart (infsupdec (-1.199999999999999956e+00, 0.0, "dac")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (-inf, -0.1, "dac"), infsupdec (0.0, 0.12, "com")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (-inf, -0.1, "dac"), infsupdec (0.0, 0.12, "com"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (-inf, 0.0, "dac"), infsupdec (0.0, 0.12, "com")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (-inf, 0.0, "dac"), infsupdec (0.0, 0.12, "com"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (-inf, 0.0, "dac"), infsupdec (0.0, 0.12, "com")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (-inf, 0.0, "dac"), infsupdec (0.0, 0.12, "com"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (-inf, 1.1, "dac"), infsupdec (0.0, 0.12, "com")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (-inf, 1.1, "dac"), infsupdec (0.0, 0.12, "com"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (-inf, 1.1, "dac"), infsupdec (0.0, 0.12, "com")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (-inf, 1.1, "dac"), infsupdec (0.0, 0.12, "com"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (-2.0, inf, "dac"), infsupdec (0.0, 0.12, "com")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (-2.0, inf, "dac"), infsupdec (0.0, 0.12, "com"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (-2.0, inf, "dac"), infsupdec (0.0, 0.12, "com")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (-2.0, inf, "dac"), infsupdec (0.0, 0.12, "com"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (0.0, inf, "dac"), infsupdec (0.0, 0.12, "com")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (0.0, inf, "dac"), infsupdec (0.0, 0.12, "com"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (0.0, inf, "dac"), infsupdec (0.0, 0.12, "com")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (0.0, inf, "dac"), infsupdec (0.0, 0.12, "com"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (0.01, inf, "dac"), infsupdec (0.0, 0.12, "com")), infsupdec (0.0, 1.200000000000000000e+01, "dac")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (0.01, inf, "dac"), infsupdec (0.0, 0.12, "com"))){1}, decorationpart (infsupdec (0.0, 1.200000000000000000e+01, "dac")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (0.01, inf, "dac"), infsupdec (0.0, 0.12, "com")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (0.01, inf, "dac"), infsupdec (0.0, 0.12, "com"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (entire, "dac"), infsupdec (0.0, 0.12, "com")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (entire, "dac"), infsupdec (0.0, 0.12, "com"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (entire, "dac"), infsupdec (0.0, 0.12, "com")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (entire, "dac"), infsupdec (0.0, 0.12, "com"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (-2.0, -0.1, "dac"), infsupdec (0.01, 0.12, "dac")), infsupdec (-1.199999999999999956e+00, -5.000000000000000104e-03, "dac")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (-2.0, -0.1, "dac"), infsupdec (0.01, 0.12, "dac"))){1}, decorationpart (infsupdec (-1.199999999999999956e+00, -5.000000000000000104e-03, "dac")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (-2.0, -0.1, "dac"), infsupdec (0.01, 0.12, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (-2.0, -0.1, "dac"), infsupdec (0.01, 0.12, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (-2.0, 0.0, "dac"), infsupdec (0.01, 0.12, "dac")), infsupdec (-inf, -5.000000000000000104e-03, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (-2.0, 0.0, "dac"), infsupdec (0.01, 0.12, "dac"))){1}, decorationpart (infsupdec (-inf, -5.000000000000000104e-03, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (-2.0, 0.0, "dac"), infsupdec (0.01, 0.12, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (-2.0, 0.0, "dac"), infsupdec (0.01, 0.12, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (-2.0, 1.1, "dac"), infsupdec (0.01, 0.12, "dac")), infsupdec (-inf, -5.000000000000000104e-03, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (-2.0, 1.1, "dac"), infsupdec (0.01, 0.12, "dac"))){1}, decorationpart (infsupdec (-inf, -5.000000000000000104e-03, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (-2.0, 1.1, "dac"), infsupdec (0.01, 0.12, "dac")), infsupdec (9.090909090909088733e-03, inf, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (-2.0, 1.1, "dac"), infsupdec (0.01, 0.12, "dac"))){1}, decorationpart (infsupdec (9.090909090909088733e-03, inf, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (0.0, 1.1, "dac"), infsupdec (0.01, 0.12, "dac")), infsupdec (9.090909090909088733e-03, inf, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (0.0, 1.1, "dac"), infsupdec (0.01, 0.12, "dac"))){1}, decorationpart (infsupdec (9.090909090909088733e-03, inf, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (0.0, 1.1, "dac"), infsupdec (0.01, 0.12, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (0.0, 1.1, "dac"), infsupdec (0.01, 0.12, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (0.01, 1.1, "dac"), infsupdec (0.01, 0.12, "dac")), infsupdec (9.090909090909088733e-03, 1.200000000000000000e+01, "dac")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (0.01, 1.1, "dac"), infsupdec (0.01, 0.12, "dac"))){1}, decorationpart (infsupdec (9.090909090909088733e-03, 1.200000000000000000e+01, "dac")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (0.01, 1.1, "dac"), infsupdec (0.01, 0.12, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (0.01, 1.1, "dac"), infsupdec (0.01, 0.12, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (0.0, 0.0, "dac"), infsupdec (0.01, 0.12, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (0.0, 0.0, "dac"), infsupdec (0.01, 0.12, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (0.0, 0.0, "dac"), infsupdec (0.01, 0.12, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (0.0, 0.0, "dac"), infsupdec (0.01, 0.12, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (-inf, -0.1, "dac"), infsupdec (0.01, 0.12, "dac")), infsupdec (-1.199999999999999956e+00, 0.0, "dac")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (-inf, -0.1, "dac"), infsupdec (0.01, 0.12, "dac"))){1}, decorationpart (infsupdec (-1.199999999999999956e+00, 0.0, "dac")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (-inf, -0.1, "dac"), infsupdec (0.01, 0.12, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (-inf, -0.1, "dac"), infsupdec (0.01, 0.12, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (-inf, 0.0, "dac"), infsupdec (0.01, 0.12, "dac")), infsupdec (-inf, 0.0, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (-inf, 0.0, "dac"), infsupdec (0.01, 0.12, "dac"))){1}, decorationpart (infsupdec (-inf, 0.0, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (-inf, 0.0, "dac"), infsupdec (0.01, 0.12, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (-inf, 0.0, "dac"), infsupdec (0.01, 0.12, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (-inf, 1.1, "dac"), infsupdec (0.01, 0.12, "dac")), infsupdec (-inf, 0.0, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (-inf, 1.1, "dac"), infsupdec (0.01, 0.12, "dac"))){1}, decorationpart (infsupdec (-inf, 0.0, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (-inf, 1.1, "dac"), infsupdec (0.01, 0.12, "dac")), infsupdec (9.090909090909088733e-03, inf, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (-inf, 1.1, "dac"), infsupdec (0.01, 0.12, "dac"))){1}, decorationpart (infsupdec (9.090909090909088733e-03, inf, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (-2.0, inf, "dac"), infsupdec (0.01, 0.12, "dac")), infsupdec (-inf, -5.000000000000000104e-03, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (-2.0, inf, "dac"), infsupdec (0.01, 0.12, "dac"))){1}, decorationpart (infsupdec (-inf, -5.000000000000000104e-03, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (-2.0, inf, "dac"), infsupdec (0.01, 0.12, "dac")), infsupdec (0.0, inf, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (-2.0, inf, "dac"), infsupdec (0.01, 0.12, "dac"))){1}, decorationpart (infsupdec (0.0, inf, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (0.0, inf, "dac"), infsupdec (0.01, 0.12, "dac")), infsupdec (0.0, inf, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (0.0, inf, "dac"), infsupdec (0.01, 0.12, "dac"))){1}, decorationpart (infsupdec (0.0, inf, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (0.0, inf, "dac"), infsupdec (0.01, 0.12, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (0.0, inf, "dac"), infsupdec (0.01, 0.12, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (0.01, inf, "dac"), infsupdec (0.01, 0.12, "dac")), infsupdec (0.0, 1.200000000000000000e+01, "dac")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (0.01, inf, "dac"), infsupdec (0.01, 0.12, "dac"))){1}, decorationpart (infsupdec (0.0, 1.200000000000000000e+01, "dac")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (0.01, inf, "dac"), infsupdec (0.01, 0.12, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (0.01, inf, "dac"), infsupdec (0.01, 0.12, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (entire, "dac"), infsupdec (0.01, 0.12, "dac")), infsupdec (-inf, 0.0, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (entire, "dac"), infsupdec (0.01, 0.12, "dac"))){1}, decorationpart (infsupdec (-inf, 0.0, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (entire, "dac"), infsupdec (0.01, 0.12, "dac")), infsupdec (0.0, inf, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (entire, "dac"), infsupdec (0.01, 0.12, "dac"))){1}, decorationpart (infsupdec (0.0, inf, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (-2.0, -0.1, "com"), infsupdec (0.0, 0.0, "com")), infsupdec (0.0, 0.0, "com")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (-2.0, -0.1, "com"), infsupdec (0.0, 0.0, "com"))){1}, decorationpart (infsupdec (0.0, 0.0, "com")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (-2.0, -0.1, "com"), infsupdec (0.0, 0.0, "com")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (-2.0, -0.1, "com"), infsupdec (0.0, 0.0, "com"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (-2.0, 0.0, "com"), infsupdec (0.0, 0.0, "com")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (-2.0, 0.0, "com"), infsupdec (0.0, 0.0, "com"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (-2.0, 0.0, "com"), infsupdec (0.0, 0.0, "com")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (-2.0, 0.0, "com"), infsupdec (0.0, 0.0, "com"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (-2.0, 1.1, "com"), infsupdec (0.0, 0.0, "com")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (-2.0, 1.1, "com"), infsupdec (0.0, 0.0, "com"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (-2.0, 1.1, "com"), infsupdec (0.0, 0.0, "com")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (-2.0, 1.1, "com"), infsupdec (0.0, 0.0, "com"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (0.0, 1.1, "com"), infsupdec (0.0, 0.0, "com")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (0.0, 1.1, "com"), infsupdec (0.0, 0.0, "com"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (0.0, 1.1, "com"), infsupdec (0.0, 0.0, "com")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (0.0, 1.1, "com"), infsupdec (0.0, 0.0, "com"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (0.01, 1.1, "com"), infsupdec (0.0, 0.0, "com")), infsupdec (0.0, 0.0, "com")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (0.01, 1.1, "com"), infsupdec (0.0, 0.0, "com"))){1}, decorationpart (infsupdec (0.0, 0.0, "com")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (0.01, 1.1, "com"), infsupdec (0.0, 0.0, "com")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (0.01, 1.1, "com"), infsupdec (0.0, 0.0, "com"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (0.0, 0.0, "com"), infsupdec (0.0, 0.0, "com")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (0.0, 0.0, "com"), infsupdec (0.0, 0.0, "com"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (0.0, 0.0, "com"), infsupdec (0.0, 0.0, "com")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (0.0, 0.0, "com"), infsupdec (0.0, 0.0, "com"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (-inf, -0.1, "dac"), infsupdec (0.0, 0.0, "com")), infsupdec (0.0, 0.0, "dac")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (-inf, -0.1, "dac"), infsupdec (0.0, 0.0, "com"))){1}, decorationpart (infsupdec (0.0, 0.0, "dac")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (-inf, -0.1, "dac"), infsupdec (0.0, 0.0, "com")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (-inf, -0.1, "dac"), infsupdec (0.0, 0.0, "com"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (-inf, 0.0, "dac"), infsupdec (0.0, 0.0, "com")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (-inf, 0.0, "dac"), infsupdec (0.0, 0.0, "com"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (-inf, 0.0, "dac"), infsupdec (0.0, 0.0, "com")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (-inf, 0.0, "dac"), infsupdec (0.0, 0.0, "com"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (-inf, 1.1, "dac"), infsupdec (0.0, 0.0, "com")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (-inf, 1.1, "dac"), infsupdec (0.0, 0.0, "com"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (-inf, 1.1, "dac"), infsupdec (0.0, 0.0, "com")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (-inf, 1.1, "dac"), infsupdec (0.0, 0.0, "com"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (-2.0, inf, "dac"), infsupdec (0.0, 0.0, "com")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (-2.0, inf, "dac"), infsupdec (0.0, 0.0, "com"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (-2.0, inf, "dac"), infsupdec (0.0, 0.0, "com")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (-2.0, inf, "dac"), infsupdec (0.0, 0.0, "com"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (0.0, inf, "dac"), infsupdec (0.0, 0.0, "com")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (0.0, inf, "dac"), infsupdec (0.0, 0.0, "com"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (0.0, inf, "dac"), infsupdec (0.0, 0.0, "com")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (0.0, inf, "dac"), infsupdec (0.0, 0.0, "com"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (0.01, inf, "dac"), infsupdec (0.0, 0.0, "com")), infsupdec (0.0, 0.0, "dac")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (0.01, inf, "dac"), infsupdec (0.0, 0.0, "com"))){1}, decorationpart (infsupdec (0.0, 0.0, "dac")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (0.01, inf, "dac"), infsupdec (0.0, 0.0, "com")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (0.01, inf, "dac"), infsupdec (0.0, 0.0, "com"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (entire, "dac"), infsupdec (0.0, 0.0, "com")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (entire, "dac"), infsupdec (0.0, 0.0, "com"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (entire, "dac"), infsupdec (0.0, 0.0, "com")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (entire, "dac"), infsupdec (0.0, 0.0, "com"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (-2.0, -0.1, "dac"), infsupdec (-inf, -0.1, "dac")), infsupdec (5.000000000000000278e-02, inf, "dac")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (-2.0, -0.1, "dac"), infsupdec (-inf, -0.1, "dac"))){1}, decorationpart (infsupdec (5.000000000000000278e-02, inf, "dac")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (-2.0, -0.1, "dac"), infsupdec (-inf, -0.1, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (-2.0, -0.1, "dac"), infsupdec (-inf, -0.1, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (-2.0, 0.0, "dac"), infsupdec (-inf, -0.1, "dac")), infsupdec (5.000000000000000278e-02, inf, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (-2.0, 0.0, "dac"), infsupdec (-inf, -0.1, "dac"))){1}, decorationpart (infsupdec (5.000000000000000278e-02, inf, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (-2.0, 0.0, "dac"), infsupdec (-inf, -0.1, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (-2.0, 0.0, "dac"), infsupdec (-inf, -0.1, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (-2.0, 1.1, "dac"), infsupdec (-inf, -0.1, "dac")), infsupdec (-inf, -9.090909090909089774e-02, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (-2.0, 1.1, "dac"), infsupdec (-inf, -0.1, "dac"))){1}, decorationpart (infsupdec (-inf, -9.090909090909089774e-02, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (-2.0, 1.1, "dac"), infsupdec (-inf, -0.1, "dac")), infsupdec (5.000000000000000278e-02, inf, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (-2.0, 1.1, "dac"), infsupdec (-inf, -0.1, "dac"))){1}, decorationpart (infsupdec (5.000000000000000278e-02, inf, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (0.0, 1.1, "dac"), infsupdec (-inf, -0.1, "dac")), infsupdec (-inf, -9.090909090909089774e-02, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (0.0, 1.1, "dac"), infsupdec (-inf, -0.1, "dac"))){1}, decorationpart (infsupdec (-inf, -9.090909090909089774e-02, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (0.0, 1.1, "dac"), infsupdec (-inf, -0.1, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (0.0, 1.1, "dac"), infsupdec (-inf, -0.1, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (0.01, 1.1, "dac"), infsupdec (-inf, -0.1, "dac")), infsupdec (-inf, -9.090909090909089774e-02, "dac")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (0.01, 1.1, "dac"), infsupdec (-inf, -0.1, "dac"))){1}, decorationpart (infsupdec (-inf, -9.090909090909089774e-02, "dac")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (0.01, 1.1, "dac"), infsupdec (-inf, -0.1, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (0.01, 1.1, "dac"), infsupdec (-inf, -0.1, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (0.0, 0.0, "dac"), infsupdec (-inf, -0.1, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (0.0, 0.0, "dac"), infsupdec (-inf, -0.1, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (0.0, 0.0, "dac"), infsupdec (-inf, -0.1, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (0.0, 0.0, "dac"), infsupdec (-inf, -0.1, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (-inf, -0.1, "dac"), infsupdec (-inf, -0.1, "dac")), infsupdec (0.0, inf, "dac")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (-inf, -0.1, "dac"), infsupdec (-inf, -0.1, "dac"))){1}, decorationpart (infsupdec (0.0, inf, "dac")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (-inf, -0.1, "dac"), infsupdec (-inf, -0.1, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (-inf, -0.1, "dac"), infsupdec (-inf, -0.1, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (-inf, 0.0, "dac"), infsupdec (-inf, -0.1, "dac")), infsupdec (0.0, inf, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (-inf, 0.0, "dac"), infsupdec (-inf, -0.1, "dac"))){1}, decorationpart (infsupdec (0.0, inf, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (-inf, 0.0, "dac"), infsupdec (-inf, -0.1, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (-inf, 0.0, "dac"), infsupdec (-inf, -0.1, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (-inf, 1.1, "dac"), infsupdec (-inf, -0.1, "dac")), infsupdec (-inf, -9.090909090909089774e-02, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (-inf, 1.1, "dac"), infsupdec (-inf, -0.1, "dac"))){1}, decorationpart (infsupdec (-inf, -9.090909090909089774e-02, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (-inf, 1.1, "dac"), infsupdec (-inf, -0.1, "dac")), infsupdec (0.0, inf, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (-inf, 1.1, "dac"), infsupdec (-inf, -0.1, "dac"))){1}, decorationpart (infsupdec (0.0, inf, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (-2.0, inf, "dac"), infsupdec (-inf, -0.1, "dac")), infsupdec (-inf, 0.0, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (-2.0, inf, "dac"), infsupdec (-inf, -0.1, "dac"))){1}, decorationpart (infsupdec (-inf, 0.0, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (-2.0, inf, "dac"), infsupdec (-inf, -0.1, "dac")), infsupdec (5.000000000000000278e-02, inf, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (-2.0, inf, "dac"), infsupdec (-inf, -0.1, "dac"))){1}, decorationpart (infsupdec (5.000000000000000278e-02, inf, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (0.0, inf, "dac"), infsupdec (-inf, -0.1, "dac")), infsupdec (-inf, 0.0, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (0.0, inf, "dac"), infsupdec (-inf, -0.1, "dac"))){1}, decorationpart (infsupdec (-inf, 0.0, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (0.0, inf, "dac"), infsupdec (-inf, -0.1, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (0.0, inf, "dac"), infsupdec (-inf, -0.1, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (0.01, inf, "dac"), infsupdec (-inf, -0.1, "dac")), infsupdec (-inf, 0.0, "dac")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (0.01, inf, "dac"), infsupdec (-inf, -0.1, "dac"))){1}, decorationpart (infsupdec (-inf, 0.0, "dac")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (0.01, inf, "dac"), infsupdec (-inf, -0.1, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (0.01, inf, "dac"), infsupdec (-inf, -0.1, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (entire, "dac"), infsupdec (-inf, -0.1, "dac")), infsupdec (-inf, 0.0, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (entire, "dac"), infsupdec (-inf, -0.1, "dac"))){1}, decorationpart (infsupdec (-inf, 0.0, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (entire, "dac"), infsupdec (-inf, -0.1, "dac")), infsupdec (0.0, inf, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (entire, "dac"), infsupdec (-inf, -0.1, "dac"))){1}, decorationpart (infsupdec (0.0, inf, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (-2.0, -0.1, "dac"), infsupdec (-inf, 0.0, "dac")), infsupdec (0.0, inf, "dac")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (-2.0, -0.1, "dac"), infsupdec (-inf, 0.0, "dac"))){1}, decorationpart (infsupdec (0.0, inf, "dac")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (-2.0, -0.1, "dac"), infsupdec (-inf, 0.0, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (-2.0, -0.1, "dac"), infsupdec (-inf, 0.0, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (-2.0, 0.0, "dac"), infsupdec (-inf, 0.0, "dac")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (-2.0, 0.0, "dac"), infsupdec (-inf, 0.0, "dac"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (-2.0, 0.0, "dac"), infsupdec (-inf, 0.0, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (-2.0, 0.0, "dac"), infsupdec (-inf, 0.0, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (-2.0, 1.1, "dac"), infsupdec (-inf, 0.0, "dac")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (-2.0, 1.1, "dac"), infsupdec (-inf, 0.0, "dac"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (-2.0, 1.1, "dac"), infsupdec (-inf, 0.0, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (-2.0, 1.1, "dac"), infsupdec (-inf, 0.0, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (0.0, 1.1, "dac"), infsupdec (-inf, 0.0, "dac")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (0.0, 1.1, "dac"), infsupdec (-inf, 0.0, "dac"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (0.0, 1.1, "dac"), infsupdec (-inf, 0.0, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (0.0, 1.1, "dac"), infsupdec (-inf, 0.0, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (0.01, 1.1, "dac"), infsupdec (-inf, 0.0, "dac")), infsupdec (-inf, 0.0, "dac")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (0.01, 1.1, "dac"), infsupdec (-inf, 0.0, "dac"))){1}, decorationpart (infsupdec (-inf, 0.0, "dac")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (0.01, 1.1, "dac"), infsupdec (-inf, 0.0, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (0.01, 1.1, "dac"), infsupdec (-inf, 0.0, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (0.0, 0.0, "dac"), infsupdec (-inf, 0.0, "dac")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (0.0, 0.0, "dac"), infsupdec (-inf, 0.0, "dac"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (0.0, 0.0, "dac"), infsupdec (-inf, 0.0, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (0.0, 0.0, "dac"), infsupdec (-inf, 0.0, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (-inf, -0.1, "dac"), infsupdec (-inf, 0.0, "dac")), infsupdec (0.0, inf, "dac")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (-inf, -0.1, "dac"), infsupdec (-inf, 0.0, "dac"))){1}, decorationpart (infsupdec (0.0, inf, "dac")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (-inf, -0.1, "dac"), infsupdec (-inf, 0.0, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (-inf, -0.1, "dac"), infsupdec (-inf, 0.0, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (-inf, 0.0, "dac"), infsupdec (-inf, 0.0, "dac")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (-inf, 0.0, "dac"), infsupdec (-inf, 0.0, "dac"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (-inf, 0.0, "dac"), infsupdec (-inf, 0.0, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (-inf, 0.0, "dac"), infsupdec (-inf, 0.0, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (-inf, 1.1, "dac"), infsupdec (-inf, 0.0, "dac")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (-inf, 1.1, "dac"), infsupdec (-inf, 0.0, "dac"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (-inf, 1.1, "dac"), infsupdec (-inf, 0.0, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (-inf, 1.1, "dac"), infsupdec (-inf, 0.0, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (-2.0, inf, "dac"), infsupdec (-inf, 0.0, "dac")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (-2.0, inf, "dac"), infsupdec (-inf, 0.0, "dac"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (-2.0, inf, "dac"), infsupdec (-inf, 0.0, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (-2.0, inf, "dac"), infsupdec (-inf, 0.0, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (0.0, inf, "dac"), infsupdec (-inf, 0.0, "dac")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (0.0, inf, "dac"), infsupdec (-inf, 0.0, "dac"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (0.0, inf, "dac"), infsupdec (-inf, 0.0, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (0.0, inf, "dac"), infsupdec (-inf, 0.0, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (0.01, inf, "dac"), infsupdec (-inf, 0.0, "dac")), infsupdec (-inf, 0.0, "dac")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (0.01, inf, "dac"), infsupdec (-inf, 0.0, "dac"))){1}, decorationpart (infsupdec (-inf, 0.0, "dac")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (0.01, inf, "dac"), infsupdec (-inf, 0.0, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (0.01, inf, "dac"), infsupdec (-inf, 0.0, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (entire, "dac"), infsupdec (-inf, 0.0, "dac")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (entire, "dac"), infsupdec (-inf, 0.0, "dac"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (entire, "dac"), infsupdec (-inf, 0.0, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (entire, "dac"), infsupdec (-inf, 0.0, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (-2.0, -0.1, "dac"), infsupdec (-inf, 0.3, "dac")), infsupdec (-3.000000000000000000e+00, inf, "dac")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (-2.0, -0.1, "dac"), infsupdec (-inf, 0.3, "dac"))){1}, decorationpart (infsupdec (-3.000000000000000000e+00, inf, "dac")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (-2.0, -0.1, "dac"), infsupdec (-inf, 0.3, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (-2.0, -0.1, "dac"), infsupdec (-inf, 0.3, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (-2.0, 0.0, "dac"), infsupdec (-inf, 0.3, "dac")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (-2.0, 0.0, "dac"), infsupdec (-inf, 0.3, "dac"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (-2.0, 0.0, "dac"), infsupdec (-inf, 0.3, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (-2.0, 0.0, "dac"), infsupdec (-inf, 0.3, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (-2.0, 1.1, "dac"), infsupdec (-inf, 0.3, "dac")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (-2.0, 1.1, "dac"), infsupdec (-inf, 0.3, "dac"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (-2.0, 1.1, "dac"), infsupdec (-inf, 0.3, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (-2.0, 1.1, "dac"), infsupdec (-inf, 0.3, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (0.0, 1.1, "dac"), infsupdec (-inf, 0.3, "dac")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (0.0, 1.1, "dac"), infsupdec (-inf, 0.3, "dac"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (0.0, 1.1, "dac"), infsupdec (-inf, 0.3, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (0.0, 1.1, "dac"), infsupdec (-inf, 0.3, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (0.01, 1.1, "dac"), infsupdec (-inf, 0.3, "dac")), infsupdec (-inf, 3.000000000000000000e+01, "dac")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (0.01, 1.1, "dac"), infsupdec (-inf, 0.3, "dac"))){1}, decorationpart (infsupdec (-inf, 3.000000000000000000e+01, "dac")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (0.01, 1.1, "dac"), infsupdec (-inf, 0.3, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (0.01, 1.1, "dac"), infsupdec (-inf, 0.3, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (0.0, 0.0, "dac"), infsupdec (-inf, 0.3, "dac")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (0.0, 0.0, "dac"), infsupdec (-inf, 0.3, "dac"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (0.0, 0.0, "dac"), infsupdec (-inf, 0.3, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (0.0, 0.0, "dac"), infsupdec (-inf, 0.3, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (-inf, -0.1, "dac"), infsupdec (-inf, 0.3, "dac")), infsupdec (-3.000000000000000000e+00, inf, "dac")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (-inf, -0.1, "dac"), infsupdec (-inf, 0.3, "dac"))){1}, decorationpart (infsupdec (-3.000000000000000000e+00, inf, "dac")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (-inf, -0.1, "dac"), infsupdec (-inf, 0.3, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (-inf, -0.1, "dac"), infsupdec (-inf, 0.3, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (-inf, 0.0, "dac"), infsupdec (-inf, 0.3, "dac")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (-inf, 0.0, "dac"), infsupdec (-inf, 0.3, "dac"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (-inf, 0.0, "dac"), infsupdec (-inf, 0.3, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (-inf, 0.0, "dac"), infsupdec (-inf, 0.3, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (-inf, 1.1, "dac"), infsupdec (-inf, 0.3, "dac")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (-inf, 1.1, "dac"), infsupdec (-inf, 0.3, "dac"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (-inf, 1.1, "dac"), infsupdec (-inf, 0.3, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (-inf, 1.1, "dac"), infsupdec (-inf, 0.3, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (-2.0, inf, "dac"), infsupdec (-inf, 0.3, "dac")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (-2.0, inf, "dac"), infsupdec (-inf, 0.3, "dac"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (-2.0, inf, "dac"), infsupdec (-inf, 0.3, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (-2.0, inf, "dac"), infsupdec (-inf, 0.3, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (0.0, inf, "dac"), infsupdec (-inf, 0.3, "dac")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (0.0, inf, "dac"), infsupdec (-inf, 0.3, "dac"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (0.0, inf, "dac"), infsupdec (-inf, 0.3, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (0.0, inf, "dac"), infsupdec (-inf, 0.3, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (0.01, inf, "dac"), infsupdec (-inf, 0.3, "dac")), infsupdec (-inf, 3.000000000000000000e+01, "dac")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (0.01, inf, "dac"), infsupdec (-inf, 0.3, "dac"))){1}, decorationpart (infsupdec (-inf, 3.000000000000000000e+01, "dac")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (0.01, inf, "dac"), infsupdec (-inf, 0.3, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (0.01, inf, "dac"), infsupdec (-inf, 0.3, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (entire, "dac"), infsupdec (-inf, 0.3, "dac")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (entire, "dac"), infsupdec (-inf, 0.3, "dac"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (entire, "dac"), infsupdec (-inf, 0.3, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (entire, "dac"), infsupdec (-inf, 0.3, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (-2.0, -0.1, "dac"), infsupdec (-0.21, inf, "dac")), infsupdec (-inf, 2.100000000000000089e+00, "dac")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (-2.0, -0.1, "dac"), infsupdec (-0.21, inf, "dac"))){1}, decorationpart (infsupdec (-inf, 2.100000000000000089e+00, "dac")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (-2.0, -0.1, "dac"), infsupdec (-0.21, inf, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (-2.0, -0.1, "dac"), infsupdec (-0.21, inf, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (-2.0, 0.0, "dac"), infsupdec (-0.21, inf, "dac")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (-2.0, 0.0, "dac"), infsupdec (-0.21, inf, "dac"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (-2.0, 0.0, "dac"), infsupdec (-0.21, inf, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (-2.0, 0.0, "dac"), infsupdec (-0.21, inf, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (-2.0, 1.1, "dac"), infsupdec (-0.21, inf, "dac")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (-2.0, 1.1, "dac"), infsupdec (-0.21, inf, "dac"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (-2.0, 1.1, "dac"), infsupdec (-0.21, inf, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (-2.0, 1.1, "dac"), infsupdec (-0.21, inf, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (0.0, 1.1, "dac"), infsupdec (-0.21, inf, "dac")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (0.0, 1.1, "dac"), infsupdec (-0.21, inf, "dac"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (0.0, 1.1, "dac"), infsupdec (-0.21, inf, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (0.0, 1.1, "dac"), infsupdec (-0.21, inf, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (0.01, 1.1, "dac"), infsupdec (-0.21, inf, "dac")), infsupdec (-2.100000000000000000e+01, inf, "dac")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (0.01, 1.1, "dac"), infsupdec (-0.21, inf, "dac"))){1}, decorationpart (infsupdec (-2.100000000000000000e+01, inf, "dac")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (0.01, 1.1, "dac"), infsupdec (-0.21, inf, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (0.01, 1.1, "dac"), infsupdec (-0.21, inf, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (0.0, 0.0, "dac"), infsupdec (-0.21, inf, "dac")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (0.0, 0.0, "dac"), infsupdec (-0.21, inf, "dac"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (0.0, 0.0, "dac"), infsupdec (-0.21, inf, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (0.0, 0.0, "dac"), infsupdec (-0.21, inf, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (-inf, -0.1, "dac"), infsupdec (-0.21, inf, "dac")), infsupdec (-inf, 2.100000000000000089e+00, "dac")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (-inf, -0.1, "dac"), infsupdec (-0.21, inf, "dac"))){1}, decorationpart (infsupdec (-inf, 2.100000000000000089e+00, "dac")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (-inf, -0.1, "dac"), infsupdec (-0.21, inf, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (-inf, -0.1, "dac"), infsupdec (-0.21, inf, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (-inf, 0.0, "dac"), infsupdec (-0.21, inf, "dac")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (-inf, 0.0, "dac"), infsupdec (-0.21, inf, "dac"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (-inf, 0.0, "dac"), infsupdec (-0.21, inf, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (-inf, 0.0, "dac"), infsupdec (-0.21, inf, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (-inf, 1.1, "dac"), infsupdec (-0.21, inf, "dac")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (-inf, 1.1, "dac"), infsupdec (-0.21, inf, "dac"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (-inf, 1.1, "dac"), infsupdec (-0.21, inf, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (-inf, 1.1, "dac"), infsupdec (-0.21, inf, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (-2.0, inf, "dac"), infsupdec (-0.21, inf, "dac")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (-2.0, inf, "dac"), infsupdec (-0.21, inf, "dac"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (-2.0, inf, "dac"), infsupdec (-0.21, inf, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (-2.0, inf, "dac"), infsupdec (-0.21, inf, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (0.0, inf, "dac"), infsupdec (-0.21, inf, "dac")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (0.0, inf, "dac"), infsupdec (-0.21, inf, "dac"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (0.0, inf, "dac"), infsupdec (-0.21, inf, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (0.0, inf, "dac"), infsupdec (-0.21, inf, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (0.01, inf, "dac"), infsupdec (-0.21, inf, "dac")), infsupdec (-2.100000000000000000e+01, inf, "dac")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (0.01, inf, "dac"), infsupdec (-0.21, inf, "dac"))){1}, decorationpart (infsupdec (-2.100000000000000000e+01, inf, "dac")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (0.01, inf, "dac"), infsupdec (-0.21, inf, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (0.01, inf, "dac"), infsupdec (-0.21, inf, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (entire, "dac"), infsupdec (-0.21, inf, "dac")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (entire, "dac"), infsupdec (-0.21, inf, "dac"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (entire, "dac"), infsupdec (-0.21, inf, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (entire, "dac"), infsupdec (-0.21, inf, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (-2.0, -0.1, "dac"), infsupdec (0.0, inf, "dac")), infsupdec (-inf, 0.0, "dac")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (-2.0, -0.1, "dac"), infsupdec (0.0, inf, "dac"))){1}, decorationpart (infsupdec (-inf, 0.0, "dac")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (-2.0, -0.1, "dac"), infsupdec (0.0, inf, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (-2.0, -0.1, "dac"), infsupdec (0.0, inf, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (-2.0, 0.0, "dac"), infsupdec (0.0, inf, "dac")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (-2.0, 0.0, "dac"), infsupdec (0.0, inf, "dac"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (-2.0, 0.0, "dac"), infsupdec (0.0, inf, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (-2.0, 0.0, "dac"), infsupdec (0.0, inf, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (-2.0, 1.1, "dac"), infsupdec (0.0, inf, "dac")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (-2.0, 1.1, "dac"), infsupdec (0.0, inf, "dac"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (-2.0, 1.1, "dac"), infsupdec (0.0, inf, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (-2.0, 1.1, "dac"), infsupdec (0.0, inf, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (0.0, 1.1, "dac"), infsupdec (0.0, inf, "dac")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (0.0, 1.1, "dac"), infsupdec (0.0, inf, "dac"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (0.0, 1.1, "dac"), infsupdec (0.0, inf, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (0.0, 1.1, "dac"), infsupdec (0.0, inf, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (0.01, 1.1, "dac"), infsupdec (0.0, inf, "dac")), infsupdec (0.0, inf, "dac")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (0.01, 1.1, "dac"), infsupdec (0.0, inf, "dac"))){1}, decorationpart (infsupdec (0.0, inf, "dac")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (0.01, 1.1, "dac"), infsupdec (0.0, inf, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (0.01, 1.1, "dac"), infsupdec (0.0, inf, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (0.0, 0.0, "dac"), infsupdec (0.0, inf, "dac")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (0.0, 0.0, "dac"), infsupdec (0.0, inf, "dac"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (0.0, 0.0, "dac"), infsupdec (0.0, inf, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (0.0, 0.0, "dac"), infsupdec (0.0, inf, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (-inf, -0.1, "dac"), infsupdec (0.0, inf, "dac")), infsupdec (-inf, 0.0, "dac")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (-inf, -0.1, "dac"), infsupdec (0.0, inf, "dac"))){1}, decorationpart (infsupdec (-inf, 0.0, "dac")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (-inf, -0.1, "dac"), infsupdec (0.0, inf, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (-inf, -0.1, "dac"), infsupdec (0.0, inf, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (-inf, 0.0, "dac"), infsupdec (0.0, inf, "dac")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (-inf, 0.0, "dac"), infsupdec (0.0, inf, "dac"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (-inf, 0.0, "dac"), infsupdec (0.0, inf, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (-inf, 0.0, "dac"), infsupdec (0.0, inf, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (-inf, 1.1, "dac"), infsupdec (0.0, inf, "dac")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (-inf, 1.1, "dac"), infsupdec (0.0, inf, "dac"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (-inf, 1.1, "dac"), infsupdec (0.0, inf, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (-inf, 1.1, "dac"), infsupdec (0.0, inf, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (-2.0, inf, "dac"), infsupdec (0.0, inf, "dac")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (-2.0, inf, "dac"), infsupdec (0.0, inf, "dac"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (-2.0, inf, "dac"), infsupdec (0.0, inf, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (-2.0, inf, "dac"), infsupdec (0.0, inf, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (0.0, inf, "dac"), infsupdec (0.0, inf, "dac")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (0.0, inf, "dac"), infsupdec (0.0, inf, "dac"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (0.0, inf, "dac"), infsupdec (0.0, inf, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (0.0, inf, "dac"), infsupdec (0.0, inf, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (0.01, inf, "dac"), infsupdec (0.0, inf, "dac")), infsupdec (0.0, inf, "dac")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (0.01, inf, "dac"), infsupdec (0.0, inf, "dac"))){1}, decorationpart (infsupdec (0.0, inf, "dac")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (0.01, inf, "dac"), infsupdec (0.0, inf, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (0.01, inf, "dac"), infsupdec (0.0, inf, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (entire, "dac"), infsupdec (0.0, inf, "dac")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (entire, "dac"), infsupdec (0.0, inf, "dac"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (entire, "dac"), infsupdec (0.0, inf, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (entire, "dac"), infsupdec (0.0, inf, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (-2.0, -0.1, "dac"), infsupdec (0.04, inf, "dac")), infsupdec (-inf, -2.000000000000000042e-02, "dac")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (-2.0, -0.1, "dac"), infsupdec (0.04, inf, "dac"))){1}, decorationpart (infsupdec (-inf, -2.000000000000000042e-02, "dac")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (-2.0, -0.1, "dac"), infsupdec (0.04, inf, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (-2.0, -0.1, "dac"), infsupdec (0.04, inf, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (-2.0, 0.0, "dac"), infsupdec (0.04, inf, "dac")), infsupdec (-inf, -2.000000000000000042e-02, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (-2.0, 0.0, "dac"), infsupdec (0.04, inf, "dac"))){1}, decorationpart (infsupdec (-inf, -2.000000000000000042e-02, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (-2.0, 0.0, "dac"), infsupdec (0.04, inf, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (-2.0, 0.0, "dac"), infsupdec (0.04, inf, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (-2.0, 1.1, "dac"), infsupdec (0.04, inf, "dac")), infsupdec (-inf, -2.000000000000000042e-02, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (-2.0, 1.1, "dac"), infsupdec (0.04, inf, "dac"))){1}, decorationpart (infsupdec (-inf, -2.000000000000000042e-02, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (-2.0, 1.1, "dac"), infsupdec (0.04, inf, "dac")), infsupdec (3.636363636363635493e-02, inf, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (-2.0, 1.1, "dac"), infsupdec (0.04, inf, "dac"))){1}, decorationpart (infsupdec (3.636363636363635493e-02, inf, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (0.0, 1.1, "dac"), infsupdec (0.04, inf, "dac")), infsupdec (3.636363636363635493e-02, inf, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (0.0, 1.1, "dac"), infsupdec (0.04, inf, "dac"))){1}, decorationpart (infsupdec (3.636363636363635493e-02, inf, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (0.0, 1.1, "dac"), infsupdec (0.04, inf, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (0.0, 1.1, "dac"), infsupdec (0.04, inf, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (0.01, 1.1, "dac"), infsupdec (0.04, inf, "dac")), infsupdec (3.636363636363635493e-02, inf, "dac")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (0.01, 1.1, "dac"), infsupdec (0.04, inf, "dac"))){1}, decorationpart (infsupdec (3.636363636363635493e-02, inf, "dac")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (0.01, 1.1, "dac"), infsupdec (0.04, inf, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (0.01, 1.1, "dac"), infsupdec (0.04, inf, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (0.0, 0.0, "dac"), infsupdec (0.04, inf, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (0.0, 0.0, "dac"), infsupdec (0.04, inf, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (0.0, 0.0, "dac"), infsupdec (0.04, inf, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (0.0, 0.0, "dac"), infsupdec (0.04, inf, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (-inf, -0.1, "dac"), infsupdec (0.04, inf, "dac")), infsupdec (-inf, 0.0, "dac")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (-inf, -0.1, "dac"), infsupdec (0.04, inf, "dac"))){1}, decorationpart (infsupdec (-inf, 0.0, "dac")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (-inf, -0.1, "dac"), infsupdec (0.04, inf, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (-inf, -0.1, "dac"), infsupdec (0.04, inf, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (-inf, 0.0, "dac"), infsupdec (0.04, inf, "dac")), infsupdec (-inf, 0.0, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (-inf, 0.0, "dac"), infsupdec (0.04, inf, "dac"))){1}, decorationpart (infsupdec (-inf, 0.0, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (-inf, 0.0, "dac"), infsupdec (0.04, inf, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (-inf, 0.0, "dac"), infsupdec (0.04, inf, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (-inf, 1.1, "dac"), infsupdec (0.04, inf, "dac")), infsupdec (-inf, 0.0, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (-inf, 1.1, "dac"), infsupdec (0.04, inf, "dac"))){1}, decorationpart (infsupdec (-inf, 0.0, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (-inf, 1.1, "dac"), infsupdec (0.04, inf, "dac")), infsupdec (3.636363636363635493e-02, inf, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (-inf, 1.1, "dac"), infsupdec (0.04, inf, "dac"))){1}, decorationpart (infsupdec (3.636363636363635493e-02, inf, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (-2.0, inf, "dac"), infsupdec (0.04, inf, "dac")), infsupdec (-inf, -2.000000000000000042e-02, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (-2.0, inf, "dac"), infsupdec (0.04, inf, "dac"))){1}, decorationpart (infsupdec (-inf, -2.000000000000000042e-02, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (-2.0, inf, "dac"), infsupdec (0.04, inf, "dac")), infsupdec (0.0, inf, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (-2.0, inf, "dac"), infsupdec (0.04, inf, "dac"))){1}, decorationpart (infsupdec (0.0, inf, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (0.0, inf, "dac"), infsupdec (0.04, inf, "dac")), infsupdec (0.0, inf, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (0.0, inf, "dac"), infsupdec (0.04, inf, "dac"))){1}, decorationpart (infsupdec (0.0, inf, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (0.0, inf, "dac"), infsupdec (0.04, inf, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (0.0, inf, "dac"), infsupdec (0.04, inf, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (0.01, inf, "dac"), infsupdec (0.04, inf, "dac")), infsupdec (0.0, inf, "dac")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (0.01, inf, "dac"), infsupdec (0.04, inf, "dac"))){1}, decorationpart (infsupdec (0.0, inf, "dac")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (0.01, inf, "dac"), infsupdec (0.04, inf, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (0.01, inf, "dac"), infsupdec (0.04, inf, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (entire, "dac"), infsupdec (0.04, inf, "dac")), infsupdec (-inf, 0.0, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (entire, "dac"), infsupdec (0.04, inf, "dac"))){1}, decorationpart (infsupdec (-inf, 0.0, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (entire, "dac"), infsupdec (0.04, inf, "dac")), infsupdec (0.0, inf, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (entire, "dac"), infsupdec (0.04, inf, "dac"))){1}, decorationpart (infsupdec (0.0, inf, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (-2.0, -0.1, "dac"), infsupdec (entire, "dac")), infsupdec (entire, "dac")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (-2.0, -0.1, "dac"), infsupdec (entire, "dac"))){1}, decorationpart (infsupdec (entire, "dac")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (-2.0, -0.1, "dac"), infsupdec (entire, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (-2.0, -0.1, "dac"), infsupdec (entire, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (-2.0, 0.0, "dac"), infsupdec (entire, "dac")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (-2.0, 0.0, "dac"), infsupdec (entire, "dac"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (-2.0, 0.0, "dac"), infsupdec (entire, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (-2.0, 0.0, "dac"), infsupdec (entire, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (-2.0, 1.1, "dac"), infsupdec (entire, "dac")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (-2.0, 1.1, "dac"), infsupdec (entire, "dac"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (-2.0, 1.1, "dac"), infsupdec (entire, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (-2.0, 1.1, "dac"), infsupdec (entire, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (0.0, 1.1, "dac"), infsupdec (entire, "dac")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (0.0, 1.1, "dac"), infsupdec (entire, "dac"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (0.0, 1.1, "dac"), infsupdec (entire, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (0.0, 1.1, "dac"), infsupdec (entire, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (0.01, 1.1, "dac"), infsupdec (entire, "dac")), infsupdec (entire, "dac")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (0.01, 1.1, "dac"), infsupdec (entire, "dac"))){1}, decorationpart (infsupdec (entire, "dac")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (0.01, 1.1, "dac"), infsupdec (entire, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (0.01, 1.1, "dac"), infsupdec (entire, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (0.0, 0.0, "dac"), infsupdec (entire, "dac")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (0.0, 0.0, "dac"), infsupdec (entire, "dac"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (0.0, 0.0, "dac"), infsupdec (entire, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (0.0, 0.0, "dac"), infsupdec (entire, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (-inf, -0.1, "dac"), infsupdec (entire, "dac")), infsupdec (entire, "dac")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (-inf, -0.1, "dac"), infsupdec (entire, "dac"))){1}, decorationpart (infsupdec (entire, "dac")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (-inf, -0.1, "dac"), infsupdec (entire, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (-inf, -0.1, "dac"), infsupdec (entire, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (-inf, 0.0, "dac"), infsupdec (entire, "dac")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (-inf, 0.0, "dac"), infsupdec (entire, "dac"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (-inf, 0.0, "dac"), infsupdec (entire, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (-inf, 0.0, "dac"), infsupdec (entire, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (-inf, 1.1, "dac"), infsupdec (entire, "dac")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (-inf, 1.1, "dac"), infsupdec (entire, "dac"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (-inf, 1.1, "dac"), infsupdec (entire, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (-inf, 1.1, "dac"), infsupdec (entire, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (-2.0, inf, "dac"), infsupdec (entire, "dac")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (-2.0, inf, "dac"), infsupdec (entire, "dac"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (-2.0, inf, "dac"), infsupdec (entire, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (-2.0, inf, "dac"), infsupdec (entire, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (0.0, inf, "dac"), infsupdec (entire, "dac")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (0.0, inf, "dac"), infsupdec (entire, "dac"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (0.0, inf, "dac"), infsupdec (entire, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (0.0, inf, "dac"), infsupdec (entire, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (0.01, inf, "dac"), infsupdec (entire, "dac")), infsupdec (entire, "dac")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (0.01, inf, "dac"), infsupdec (entire, "dac"))){1}, decorationpart (infsupdec (entire, "dac")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (0.01, inf, "dac"), infsupdec (entire, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (0.01, inf, "dac"), infsupdec (entire, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (nthargout(1, 2, @mulrev, infsupdec (entire, "dac"), infsupdec (entire, "dac")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (nthargout(1, 2, @mulrev, infsupdec (entire, "dac"), infsupdec (entire, "dac"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%! assert (isequal (nthargout(2, 2, @mulrev, infsupdec (entire, "dac"), infsupdec (entire, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (nthargout(2, 2, @mulrev, infsupdec (entire, "dac"), infsupdec (entire, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
