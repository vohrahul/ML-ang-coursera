## DO NOT EDIT!  Generated automatically from test/abs_rev.itl
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

## minimal.absRevBin_test

%!test
%! assert (isequal (absrev (infsup, infsup (-inf, inf)), infsup));
%!test
%! assert (isequal (absrev (infsup (0.0, 1.0), infsup), infsup));
%!test
%! assert (isequal (absrev (infsup (0.0, 1.0), infsup (7.0, 9.0)), infsup));
%!test
%! assert (isequal (absrev (infsup, infsup (0.0, 1.0)), infsup));
%!test
%! assert (isequal (absrev (infsup (-2.0, -1.0), infsup (-inf, inf)), infsup));
%!test
%! assert (isequal (absrev (infsup (1.0, 1.0), infsup (-inf, inf)), infsup (-1.0, 1.0)));
%!test
%! assert (isequal (absrev (infsup (0.0, 0.0), infsup (-inf, inf)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (absrev (infsup (-1.0, -1.0), infsup (-inf, inf)), infsup));
%!test
%! assert (isequal (absrev (infsup (1.797693134862315708e+308, 1.797693134862315708e+308), infsup (-inf, inf)), infsup (-1.797693134862315708e+308, 1.797693134862315708e+308)));
%!test
%! assert (isequal (absrev (infsup (2.225073858507201383e-308, 2.225073858507201383e-308), infsup (-inf, inf)), infsup (-2.225073858507201383e-308, 2.225073858507201383e-308)));
%!test
%! assert (isequal (absrev (infsup (-2.225073858507201383e-308, -2.225073858507201383e-308), infsup (-inf, inf)), infsup));
%!test
%! assert (isequal (absrev (infsup (-1.797693134862315708e+308, -1.797693134862315708e+308), infsup (-inf, inf)), infsup));
%!test
%! assert (isequal (absrev (infsup (1.0, 2.0), infsup (-inf, inf)), infsup (-2.0, 2.0)));
%!test
%! assert (isequal (absrev (infsup (1.0, 2.0), infsup (0.0, 2.0)), infsup (1.0, 2.0)));
%!test
%! assert (isequal (absrev (infsup (0.0, 1.0), infsup (-0.5, 2.0)), infsup (-0.5, 1.0)));
%!test
%! assert (isequal (absrev (infsup (-1.0, 1.0), infsup (-inf, inf)), infsup (-1.0, 1.0)));
%!test
%! assert (isequal (absrev (infsup (-1.0, 0.0), infsup (-inf, inf)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (absrev (infsup (0.0, inf), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (absrev (infsup (-inf, inf), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (absrev (infsup (-inf, 0.0), infsup (-inf, inf)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (absrev (infsup (1.0, inf), infsup (-inf, 0.0)), infsup (-inf, -1.0)));
%!test
%! assert (isequal (absrev (infsup (-1.0, inf), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (absrev (infsup (-inf, -1.0), infsup (-inf, inf)), infsup));
%!test
%! assert (isequal (absrev (infsup (-inf, 1.0), infsup (-inf, inf)), infsup (-1.0, 1.0)));
