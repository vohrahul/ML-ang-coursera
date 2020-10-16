## DO NOT EDIT!  Generated automatically from test/libieeep1788_tests_bool.itl
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

## minimal_empty_test

%!test
%! assert (isempty (infsup));
%!test
%! assert (isequal (isempty (infsup (-inf, inf)), false));
%!test
%! assert (isequal (isempty (infsup (1.0, 2.0)), false));
%!test
%! assert (isequal (isempty (infsup (-1.0, 2.0)), false));
%!test
%! assert (isequal (isempty (infsup (-3.0, -2.0)), false));
%!test
%! assert (isequal (isempty (infsup (-inf, 2.0)), false));
%!test
%! assert (isequal (isempty (infsup (-inf, 0.0)), false));
%!test
%! assert (isequal (isempty (infsup (-inf, -0.0)), false));
%!test
%! assert (isequal (isempty (infsup (0.0, inf)), false));
%!test
%! assert (isequal (isempty (infsup (-0.0, inf)), false));
%!test
%! assert (isequal (isempty (infsup (-0.0, 0.0)), false));
%!test
%! assert (isequal (isempty (infsup (0.0, -0.0)), false));
%!test
%! assert (isequal (isempty (infsup (0.0, 0.0)), false));
%!test
%! assert (isequal (isempty (infsup (-0.0, -0.0)), false));

## minimal_empty_dec_test

%!test
%! assert (isempty (infsupdec (empty, "trv")));
%!test
%! assert (isequal (isempty (infsupdec (-inf, inf, "def")), false));
%!test
%! assert (isequal (isempty (infsupdec (1.0, 2.0, "com")), false));
%!test
%! assert (isequal (isempty (infsupdec (-1.0, 2.0, "trv")), false));
%!test
%! assert (isequal (isempty (infsupdec (-3.0, -2.0, "dac")), false));
%!test
%! assert (isequal (isempty (infsupdec (-inf, 2.0, "trv")), false));
%!test
%! assert (isequal (isempty (infsupdec (-inf, 0.0, "trv")), false));
%!test
%! assert (isequal (isempty (infsupdec (-inf, -0.0, "trv")), false));
%!test
%! assert (isequal (isempty (infsupdec (0.0, inf, "def")), false));
%!test
%! assert (isequal (isempty (infsupdec (-0.0, inf, "trv")), false));
%!test
%! assert (isequal (isempty (infsupdec (-0.0, 0.0, "com")), false));
%!test
%! assert (isequal (isempty (infsupdec (0.0, -0.0, "trv")), false));
%!test
%! assert (isequal (isempty (infsupdec (0.0, 0.0, "trv")), false));
%!test
%! assert (isequal (isempty (infsupdec (-0.0, -0.0, "trv")), false));

## minimal_entire_test

%!test
%! assert (isequal (isentire (infsup), false));
%!test
%! assert (isentire (infsup (-inf, inf)));
%!test
%! assert (isequal (isentire (infsup (1.0, 2.0)), false));
%!test
%! assert (isequal (isentire (infsup (-1.0, 2.0)), false));
%!test
%! assert (isequal (isentire (infsup (-3.0, -2.0)), false));
%!test
%! assert (isequal (isentire (infsup (-inf, 2.0)), false));
%!test
%! assert (isequal (isentire (infsup (-inf, 0.0)), false));
%!test
%! assert (isequal (isentire (infsup (-inf, -0.0)), false));
%!test
%! assert (isequal (isentire (infsup (0.0, inf)), false));
%!test
%! assert (isequal (isentire (infsup (-0.0, inf)), false));
%!test
%! assert (isequal (isentire (infsup (-0.0, 0.0)), false));
%!test
%! assert (isequal (isentire (infsup (0.0, -0.0)), false));
%!test
%! assert (isequal (isentire (infsup (0.0, 0.0)), false));
%!test
%! assert (isequal (isentire (infsup (-0.0, -0.0)), false));

## minimal_entire_dec_test

%!test
%! assert (isequal (isentire (infsupdec (empty, "trv")), false));
%!test
%! assert (isentire (infsupdec (-inf, inf, "trv")));
%!test
%! assert (isentire (infsupdec (-inf, inf, "def")));
%!test
%! assert (isentire (infsupdec (-inf, inf, "dac")));
%!test
%! assert (isequal (isentire (infsupdec (1.0, 2.0, "com")), false));
%!test
%! assert (isequal (isentire (infsupdec (-1.0, 2.0, "trv")), false));
%!test
%! assert (isequal (isentire (infsupdec (-3.0, -2.0, "dac")), false));
%!test
%! assert (isequal (isentire (infsupdec (-inf, 2.0, "trv")), false));
%!test
%! assert (isequal (isentire (infsupdec (-inf, 0.0, "trv")), false));
%!test
%! assert (isequal (isentire (infsupdec (-inf, -0.0, "trv")), false));
%!test
%! assert (isequal (isentire (infsupdec (0.0, inf, "def")), false));
%!test
%! assert (isequal (isentire (infsupdec (-0.0, inf, "trv")), false));
%!test
%! assert (isequal (isentire (infsupdec (-0.0, 0.0, "com")), false));
%!test
%! assert (isequal (isentire (infsupdec (0.0, -0.0, "trv")), false));
%!test
%! assert (isequal (isentire (infsupdec (0.0, 0.0, "trv")), false));
%!test
%! assert (isequal (isentire (infsupdec (-0.0, -0.0, "trv")), false));

## minimal_nai_dec_test

%!test
%! assert (isequal (isnai (infsupdec (-inf, inf, "trv")), false));
%!test
%! assert (isequal (isnai (infsupdec (-inf, inf, "def")), false));
%!test
%! assert (isequal (isnai (infsupdec (-inf, inf, "dac")), false));
%!test
%! assert (isequal (isnai (infsupdec (1.0, 2.0, "com")), false));
%!test
%! assert (isequal (isnai (infsupdec (-1.0, 2.0, "trv")), false));
%!test
%! assert (isequal (isnai (infsupdec (-3.0, -2.0, "dac")), false));
%!test
%! assert (isequal (isnai (infsupdec (-inf, 2.0, "trv")), false));
%!test
%! assert (isequal (isnai (infsupdec (-inf, 0.0, "trv")), false));
%!test
%! assert (isequal (isnai (infsupdec (-inf, -0.0, "trv")), false));
%!test
%! assert (isequal (isnai (infsupdec (0.0, inf, "def")), false));
%!test
%! assert (isequal (isnai (infsupdec (-0.0, inf, "trv")), false));
%!test
%! assert (isequal (isnai (infsupdec (-0.0, 0.0, "com")), false));
%!test
%! assert (isequal (isnai (infsupdec (0.0, -0.0, "trv")), false));
%!test
%! assert (isequal (isnai (infsupdec (0.0, 0.0, "trv")), false));
%!test
%! assert (isequal (isnai (infsupdec (-0.0, -0.0, "trv")), false));

## minimal_equal_test

%!test
%! assert (eq (infsup (1.0, 2.0), infsup (1.0, 2.0)));
%! assert (infsup (1.0, 2.0) == infsup (1.0, 2.0));
%!test
%! assert (isequal (eq (infsup (1.0, 2.1), infsup (1.0, 2.0)), false));
%! assert (isequal (infsup (1.0, 2.1) == infsup (1.0, 2.0), false));
%!test
%! assert (eq (infsup, infsup));
%! assert (infsup == infsup);
%!test
%! assert (isequal (eq (infsup, infsup (1.0, 2.0)), false));
%! assert (isequal (infsup == infsup (1.0, 2.0), false));
%!test
%! assert (eq (infsup (-inf, inf), infsup (-inf, inf)));
%! assert (infsup (-inf, inf) == infsup (-inf, inf));
%!test
%! assert (isequal (eq (infsup (1.0, 2.4), infsup (-inf, inf)), false));
%! assert (isequal (infsup (1.0, 2.4) == infsup (-inf, inf), false));
%!test
%! assert (eq (infsup (1.0, inf), infsup (1.0, inf)));
%! assert (infsup (1.0, inf) == infsup (1.0, inf));
%!test
%! assert (isequal (eq (infsup (1.0, 2.4), infsup (1.0, inf)), false));
%! assert (isequal (infsup (1.0, 2.4) == infsup (1.0, inf), false));
%!test
%! assert (eq (infsup (-inf, 2.0), infsup (-inf, 2.0)));
%! assert (infsup (-inf, 2.0) == infsup (-inf, 2.0));
%!test
%! assert (isequal (eq (infsup (-inf, 2.4), infsup (-inf, 2.0)), false));
%! assert (isequal (infsup (-inf, 2.4) == infsup (-inf, 2.0), false));
%!test
%! assert (eq (infsup (-2.0, 0.0), infsup (-2.0, 0.0)));
%! assert (infsup (-2.0, 0.0) == infsup (-2.0, 0.0));
%!test
%! assert (eq (infsup (-0.0, 2.0), infsup (0.0, 2.0)));
%! assert (infsup (-0.0, 2.0) == infsup (0.0, 2.0));
%!test
%! assert (eq (infsup (-0.0, -0.0), infsup (0.0, 0.0)));
%! assert (infsup (-0.0, -0.0) == infsup (0.0, 0.0));
%!test
%! assert (eq (infsup (-0.0, 0.0), infsup (0.0, 0.0)));
%! assert (infsup (-0.0, 0.0) == infsup (0.0, 0.0));
%!test
%! assert (eq (infsup (0.0, -0.0), infsup (0.0, 0.0)));
%! assert (infsup (0.0, -0.0) == infsup (0.0, 0.0));

## minimal_equal_dec_test

%!test
%! assert (eq (infsupdec (1.0, 2.0, "def"), infsupdec (1.0, 2.0, "trv")));
%! assert (infsupdec (1.0, 2.0, "def") == infsupdec (1.0, 2.0, "trv"));
%!test
%! assert (isequal (eq (infsupdec (1.0, 2.1, "trv"), infsupdec (1.0, 2.0, "trv")), false));
%! assert (isequal (infsupdec (1.0, 2.1, "trv") == infsupdec (1.0, 2.0, "trv"), false));
%!test
%! assert (eq (infsupdec (empty, "trv"), infsupdec (empty, "trv")));
%! assert (infsupdec (empty, "trv") == infsupdec (empty, "trv"));
%!test
%! assert (isequal (eq (infsupdec (empty, "trv"), infsupdec (1.0, 2.0, "trv")), false));
%! assert (isequal (infsupdec (empty, "trv") == infsupdec (1.0, 2.0, "trv"), false));
%!test
%! assert (isequal (eq (infsupdec (empty, "trv"), infsupdec (1.0, 2.0, "trv")), false));
%! assert (isequal (infsupdec (empty, "trv") == infsupdec (1.0, 2.0, "trv"), false));
%!test
%! assert (eq (infsupdec (-inf, inf, "def"), infsupdec (-inf, inf, "trv")));
%! assert (infsupdec (-inf, inf, "def") == infsupdec (-inf, inf, "trv"));
%!test
%! assert (isequal (eq (infsupdec (1.0, 2.4, "trv"), infsupdec (-inf, inf, "trv")), false));
%! assert (isequal (infsupdec (1.0, 2.4, "trv") == infsupdec (-inf, inf, "trv"), false));
%!test
%! assert (eq (infsupdec (1.0, inf, "trv"), infsupdec (1.0, inf, "trv")));
%! assert (infsupdec (1.0, inf, "trv") == infsupdec (1.0, inf, "trv"));
%!test
%! assert (isequal (eq (infsupdec (1.0, 2.4, "def"), infsupdec (1.0, inf, "trv")), false));
%! assert (isequal (infsupdec (1.0, 2.4, "def") == infsupdec (1.0, inf, "trv"), false));
%!test
%! assert (eq (infsupdec (-inf, 2.0, "trv"), infsupdec (-inf, 2.0, "trv")));
%! assert (infsupdec (-inf, 2.0, "trv") == infsupdec (-inf, 2.0, "trv"));
%!test
%! assert (isequal (eq (infsupdec (-inf, 2.4, "def"), infsupdec (-inf, 2.0, "trv")), false));
%! assert (isequal (infsupdec (-inf, 2.4, "def") == infsupdec (-inf, 2.0, "trv"), false));
%!test
%! assert (eq (infsupdec (-2.0, 0.0, "trv"), infsupdec (-2.0, 0.0, "trv")));
%! assert (infsupdec (-2.0, 0.0, "trv") == infsupdec (-2.0, 0.0, "trv"));
%!test
%! assert (eq (infsupdec (-0.0, 2.0, "def"), infsupdec (0.0, 2.0, "trv")));
%! assert (infsupdec (-0.0, 2.0, "def") == infsupdec (0.0, 2.0, "trv"));
%!test
%! assert (eq (infsupdec (-0.0, -0.0, "trv"), infsupdec (0.0, 0.0, "trv")));
%! assert (infsupdec (-0.0, -0.0, "trv") == infsupdec (0.0, 0.0, "trv"));
%!test
%! assert (eq (infsupdec (-0.0, 0.0, "def"), infsupdec (0.0, 0.0, "trv")));
%! assert (infsupdec (-0.0, 0.0, "def") == infsupdec (0.0, 0.0, "trv"));
%!test
%! assert (eq (infsupdec (0.0, -0.0, "trv"), infsupdec (0.0, 0.0, "trv")));
%! assert (infsupdec (0.0, -0.0, "trv") == infsupdec (0.0, 0.0, "trv"));

## minimal_subset_test

%!test
%! assert (subset (infsup, infsup));
%!test
%! assert (subset (infsup, infsup (0.0, 4.0)));
%!test
%! assert (subset (infsup, infsup (-0.0, 4.0)));
%!test
%! assert (subset (infsup, infsup (-0.1, 1.0)));
%!test
%! assert (subset (infsup, infsup (-0.1, 0.0)));
%!test
%! assert (subset (infsup, infsup (-0.1, -0.0)));
%!test
%! assert (subset (infsup, infsup (-inf, inf)));
%!test
%! assert (isequal (subset (infsup (0.0, 4.0), infsup), false));
%!test
%! assert (isequal (subset (infsup (-0.0, 4.0), infsup), false));
%!test
%! assert (isequal (subset (infsup (-0.1, 1.0), infsup), false));
%!test
%! assert (isequal (subset (infsup (-inf, inf), infsup), false));
%!test
%! assert (subset (infsup (0.0, 4.0), infsup (-inf, inf)));
%!test
%! assert (subset (infsup (-0.0, 4.0), infsup (-inf, inf)));
%!test
%! assert (subset (infsup (-0.1, 1.0), infsup (-inf, inf)));
%!test
%! assert (subset (infsup (-inf, inf), infsup (-inf, inf)));
%!test
%! assert (subset (infsup (1.0, 2.0), infsup (1.0, 2.0)));
%!test
%! assert (subset (infsup (1.0, 2.0), infsup (0.0, 4.0)));
%!test
%! assert (subset (infsup (1.0, 2.0), infsup (-0.0, 4.0)));
%!test
%! assert (subset (infsup (0.1, 0.2), infsup (0.0, 4.0)));
%!test
%! assert (subset (infsup (0.1, 0.2), infsup (-0.0, 4.0)));
%!test
%! assert (subset (infsup (-0.1, -0.1), infsup (-4.0, 3.4)));
%!test
%! assert (subset (infsup (0.0, 0.0), infsup (-0.0, -0.0)));
%!test
%! assert (subset (infsup (-0.0, -0.0), infsup (0.0, 0.0)));
%!test
%! assert (subset (infsup (-0.0, 0.0), infsup (0.0, 0.0)));
%!test
%! assert (subset (infsup (-0.0, 0.0), infsup (0.0, -0.0)));
%!test
%! assert (subset (infsup (0.0, -0.0), infsup (0.0, 0.0)));
%!test
%! assert (subset (infsup (0.0, -0.0), infsup (-0.0, 0.0)));

## minimal_subset_dec_test

%!test
%! assert (subset (infsupdec (empty, "trv"), infsupdec (0.0, 4.0, "trv")));
%!test
%! assert (subset (infsupdec (empty, "trv"), infsupdec (-0.0, 4.0, "def")));
%!test
%! assert (subset (infsupdec (empty, "trv"), infsupdec (-0.1, 1.0, "trv")));
%!test
%! assert (subset (infsupdec (empty, "trv"), infsupdec (-0.1, 0.0, "trv")));
%!test
%! assert (subset (infsupdec (empty, "trv"), infsupdec (-0.1, -0.0, "trv")));
%!test
%! assert (subset (infsupdec (empty, "trv"), infsupdec (-inf, inf, "trv")));
%!test
%! assert (isequal (subset (infsupdec (0.0, 4.0, "trv"), infsupdec (empty, "trv")), false));
%!test
%! assert (isequal (subset (infsupdec (-0.0, 4.0, "def"), infsupdec (empty, "trv")), false));
%!test
%! assert (isequal (subset (infsupdec (-0.1, 1.0, "trv"), infsupdec (empty, "trv")), false));
%!test
%! assert (isequal (subset (infsupdec (-inf, inf, "trv"), infsupdec (empty, "trv")), false));
%!test
%! assert (subset (infsupdec (0.0, 4.0, "trv"), infsupdec (-inf, inf, "trv")));
%!test
%! assert (subset (infsupdec (-0.0, 4.0, "trv"), infsupdec (-inf, inf, "trv")));
%!test
%! assert (subset (infsupdec (-0.1, 1.0, "trv"), infsupdec (-inf, inf, "trv")));
%!test
%! assert (subset (infsupdec (-inf, inf, "trv"), infsupdec (-inf, inf, "trv")));
%!test
%! assert (subset (infsupdec (1.0, 2.0, "trv"), infsupdec (1.0, 2.0, "trv")));
%!test
%! assert (subset (infsupdec (1.0, 2.0, "trv"), infsupdec (0.0, 4.0, "trv")));
%!test
%! assert (subset (infsupdec (1.0, 2.0, "def"), infsupdec (-0.0, 4.0, "def")));
%!test
%! assert (subset (infsupdec (0.1, 0.2, "trv"), infsupdec (0.0, 4.0, "trv")));
%!test
%! assert (subset (infsupdec (0.1, 0.2, "trv"), infsupdec (-0.0, 4.0, "def")));
%!test
%! assert (subset (infsupdec (-0.1, -0.1, "trv"), infsupdec (-4.0, 3.4, "trv")));
%!test
%! assert (subset (infsupdec (0.0, 0.0, "trv"), infsupdec (-0.0, -0.0, "trv")));
%!test
%! assert (subset (infsupdec (-0.0, -0.0, "trv"), infsupdec (0.0, 0.0, "def")));
%!test
%! assert (subset (infsupdec (-0.0, 0.0, "trv"), infsupdec (0.0, 0.0, "trv")));
%!test
%! assert (subset (infsupdec (-0.0, 0.0, "trv"), infsupdec (0.0, -0.0, "trv")));
%!test
%! assert (subset (infsupdec (0.0, -0.0, "def"), infsupdec (0.0, 0.0, "trv")));
%!test
%! assert (subset (infsupdec (0.0, -0.0, "trv"), infsupdec (-0.0, 0.0, "trv")));

## minimal_less_test

%!test
%! assert (le (infsup, infsup));
%! assert (infsup <= infsup);
%!test
%! assert (isequal (le (infsup (1.0, 2.0), infsup), false));
%! assert (isequal (infsup (1.0, 2.0) <= infsup, false));
%!test
%! assert (isequal (le (infsup, infsup (1.0, 2.0)), false));
%! assert (isequal (infsup <= infsup (1.0, 2.0), false));
%!test
%! assert (le (infsup (-inf, inf), infsup (-inf, inf)));
%! assert (infsup (-inf, inf) <= infsup (-inf, inf));
%!test
%! assert (isequal (le (infsup (1.0, 2.0), infsup (-inf, inf)), false));
%! assert (isequal (infsup (1.0, 2.0) <= infsup (-inf, inf), false));
%!test
%! assert (isequal (le (infsup (0.0, 2.0), infsup (-inf, inf)), false));
%! assert (isequal (infsup (0.0, 2.0) <= infsup (-inf, inf), false));
%!test
%! assert (isequal (le (infsup (-0.0, 2.0), infsup (-inf, inf)), false));
%! assert (isequal (infsup (-0.0, 2.0) <= infsup (-inf, inf), false));
%!test
%! assert (isequal (le (infsup (-inf, inf), infsup (1.0, 2.0)), false));
%! assert (isequal (infsup (-inf, inf) <= infsup (1.0, 2.0), false));
%!test
%! assert (isequal (le (infsup (-inf, inf), infsup (0.0, 2.0)), false));
%! assert (isequal (infsup (-inf, inf) <= infsup (0.0, 2.0), false));
%!test
%! assert (isequal (le (infsup (-inf, inf), infsup (-0.0, 2.0)), false));
%! assert (isequal (infsup (-inf, inf) <= infsup (-0.0, 2.0), false));
%!test
%! assert (le (infsup (0.0, 2.0), infsup (0.0, 2.0)));
%! assert (infsup (0.0, 2.0) <= infsup (0.0, 2.0));
%!test
%! assert (le (infsup (0.0, 2.0), infsup (-0.0, 2.0)));
%! assert (infsup (0.0, 2.0) <= infsup (-0.0, 2.0));
%!test
%! assert (le (infsup (0.0, 2.0), infsup (1.0, 2.0)));
%! assert (infsup (0.0, 2.0) <= infsup (1.0, 2.0));
%!test
%! assert (le (infsup (-0.0, 2.0), infsup (1.0, 2.0)));
%! assert (infsup (-0.0, 2.0) <= infsup (1.0, 2.0));
%!test
%! assert (le (infsup (1.0, 2.0), infsup (1.0, 2.0)));
%! assert (infsup (1.0, 2.0) <= infsup (1.0, 2.0));
%!test
%! assert (le (infsup (1.0, 2.0), infsup (3.0, 4.0)));
%! assert (infsup (1.0, 2.0) <= infsup (3.0, 4.0));
%!test
%! assert (le (infsup (1.0, 3.5), infsup (3.0, 4.0)));
%! assert (infsup (1.0, 3.5) <= infsup (3.0, 4.0));
%!test
%! assert (le (infsup (1.0, 4.0), infsup (3.0, 4.0)));
%! assert (infsup (1.0, 4.0) <= infsup (3.0, 4.0));
%!test
%! assert (le (infsup (-2.0, -1.0), infsup (-2.0, -1.0)));
%! assert (infsup (-2.0, -1.0) <= infsup (-2.0, -1.0));
%!test
%! assert (le (infsup (-3.0, -1.5), infsup (-2.0, -1.0)));
%! assert (infsup (-3.0, -1.5) <= infsup (-2.0, -1.0));
%!test
%! assert (le (infsup (0.0, 0.0), infsup (-0.0, -0.0)));
%! assert (infsup (0.0, 0.0) <= infsup (-0.0, -0.0));
%!test
%! assert (le (infsup (-0.0, -0.0), infsup (0.0, 0.0)));
%! assert (infsup (-0.0, -0.0) <= infsup (0.0, 0.0));
%!test
%! assert (le (infsup (-0.0, 0.0), infsup (0.0, 0.0)));
%! assert (infsup (-0.0, 0.0) <= infsup (0.0, 0.0));
%!test
%! assert (le (infsup (-0.0, 0.0), infsup (0.0, -0.0)));
%! assert (infsup (-0.0, 0.0) <= infsup (0.0, -0.0));
%!test
%! assert (le (infsup (0.0, -0.0), infsup (0.0, 0.0)));
%! assert (infsup (0.0, -0.0) <= infsup (0.0, 0.0));
%!test
%! assert (le (infsup (0.0, -0.0), infsup (-0.0, 0.0)));
%! assert (infsup (0.0, -0.0) <= infsup (-0.0, 0.0));

## minimal_less_dec_test

%!test
%! assert (isequal (le (infsupdec (1.0, 2.0, "trv"), infsupdec (empty, "trv")), false));
%! assert (isequal (infsupdec (1.0, 2.0, "trv") <= infsupdec (empty, "trv"), false));
%!test
%! assert (isequal (le (infsupdec (empty, "trv"), infsupdec (1.0, 2.0, "def")), false));
%! assert (isequal (infsupdec (empty, "trv") <= infsupdec (1.0, 2.0, "def"), false));
%!test
%! assert (isequal (le (infsupdec (1.0, 2.0, "trv"), infsupdec (empty, "trv")), false));
%! assert (isequal (infsupdec (1.0, 2.0, "trv") <= infsupdec (empty, "trv"), false));
%!test
%! assert (isequal (le (infsupdec (empty, "trv"), infsupdec (1.0, 2.0, "trv")), false));
%! assert (isequal (infsupdec (empty, "trv") <= infsupdec (1.0, 2.0, "trv"), false));
%!test
%! assert (le (infsupdec (-inf, inf, "trv"), infsupdec (-inf, inf, "trv")));
%! assert (infsupdec (-inf, inf, "trv") <= infsupdec (-inf, inf, "trv"));
%!test
%! assert (isequal (le (infsupdec (1.0, 2.0, "def"), infsupdec (-inf, inf, "trv")), false));
%! assert (isequal (infsupdec (1.0, 2.0, "def") <= infsupdec (-inf, inf, "trv"), false));
%!test
%! assert (isequal (le (infsupdec (0.0, 2.0, "trv"), infsupdec (-inf, inf, "trv")), false));
%! assert (isequal (infsupdec (0.0, 2.0, "trv") <= infsupdec (-inf, inf, "trv"), false));
%!test
%! assert (isequal (le (infsupdec (-0.0, 2.0, "trv"), infsupdec (-inf, inf, "trv")), false));
%! assert (isequal (infsupdec (-0.0, 2.0, "trv") <= infsupdec (-inf, inf, "trv"), false));
%!test
%! assert (isequal (le (infsupdec (-inf, inf, "trv"), infsupdec (1.0, 2.0, "trv")), false));
%! assert (isequal (infsupdec (-inf, inf, "trv") <= infsupdec (1.0, 2.0, "trv"), false));
%!test
%! assert (isequal (le (infsupdec (-inf, inf, "trv"), infsupdec (0.0, 2.0, "def")), false));
%! assert (isequal (infsupdec (-inf, inf, "trv") <= infsupdec (0.0, 2.0, "def"), false));
%!test
%! assert (isequal (le (infsupdec (-inf, inf, "trv"), infsupdec (-0.0, 2.0, "trv")), false));
%! assert (isequal (infsupdec (-inf, inf, "trv") <= infsupdec (-0.0, 2.0, "trv"), false));
%!test
%! assert (le (infsupdec (0.0, 2.0, "trv"), infsupdec (0.0, 2.0, "trv")));
%! assert (infsupdec (0.0, 2.0, "trv") <= infsupdec (0.0, 2.0, "trv"));
%!test
%! assert (le (infsupdec (0.0, 2.0, "trv"), infsupdec (-0.0, 2.0, "trv")));
%! assert (infsupdec (0.0, 2.0, "trv") <= infsupdec (-0.0, 2.0, "trv"));
%!test
%! assert (le (infsupdec (0.0, 2.0, "def"), infsupdec (1.0, 2.0, "def")));
%! assert (infsupdec (0.0, 2.0, "def") <= infsupdec (1.0, 2.0, "def"));
%!test
%! assert (le (infsupdec (-0.0, 2.0, "trv"), infsupdec (1.0, 2.0, "trv")));
%! assert (infsupdec (-0.0, 2.0, "trv") <= infsupdec (1.0, 2.0, "trv"));
%!test
%! assert (le (infsupdec (1.0, 2.0, "trv"), infsupdec (1.0, 2.0, "trv")));
%! assert (infsupdec (1.0, 2.0, "trv") <= infsupdec (1.0, 2.0, "trv"));
%!test
%! assert (le (infsupdec (1.0, 2.0, "trv"), infsupdec (3.0, 4.0, "def")));
%! assert (infsupdec (1.0, 2.0, "trv") <= infsupdec (3.0, 4.0, "def"));
%!test
%! assert (le (infsupdec (1.0, 3.5, "trv"), infsupdec (3.0, 4.0, "trv")));
%! assert (infsupdec (1.0, 3.5, "trv") <= infsupdec (3.0, 4.0, "trv"));
%!test
%! assert (le (infsupdec (1.0, 4.0, "trv"), infsupdec (3.0, 4.0, "trv")));
%! assert (infsupdec (1.0, 4.0, "trv") <= infsupdec (3.0, 4.0, "trv"));
%!test
%! assert (le (infsupdec (-2.0, -1.0, "trv"), infsupdec (-2.0, -1.0, "trv")));
%! assert (infsupdec (-2.0, -1.0, "trv") <= infsupdec (-2.0, -1.0, "trv"));
%!test
%! assert (le (infsupdec (-3.0, -1.5, "trv"), infsupdec (-2.0, -1.0, "trv")));
%! assert (infsupdec (-3.0, -1.5, "trv") <= infsupdec (-2.0, -1.0, "trv"));
%!test
%! assert (le (infsupdec (0.0, 0.0, "trv"), infsupdec (-0.0, -0.0, "trv")));
%! assert (infsupdec (0.0, 0.0, "trv") <= infsupdec (-0.0, -0.0, "trv"));
%!test
%! assert (le (infsupdec (-0.0, -0.0, "trv"), infsupdec (0.0, 0.0, "def")));
%! assert (infsupdec (-0.0, -0.0, "trv") <= infsupdec (0.0, 0.0, "def"));
%!test
%! assert (le (infsupdec (-0.0, 0.0, "trv"), infsupdec (0.0, 0.0, "trv")));
%! assert (infsupdec (-0.0, 0.0, "trv") <= infsupdec (0.0, 0.0, "trv"));
%!test
%! assert (le (infsupdec (-0.0, 0.0, "trv"), infsupdec (0.0, -0.0, "trv")));
%! assert (infsupdec (-0.0, 0.0, "trv") <= infsupdec (0.0, -0.0, "trv"));
%!test
%! assert (le (infsupdec (0.0, -0.0, "def"), infsupdec (0.0, 0.0, "trv")));
%! assert (infsupdec (0.0, -0.0, "def") <= infsupdec (0.0, 0.0, "trv"));
%!test
%! assert (le (infsupdec (0.0, -0.0, "trv"), infsupdec (-0.0, 0.0, "trv")));
%! assert (infsupdec (0.0, -0.0, "trv") <= infsupdec (-0.0, 0.0, "trv"));

## minimal_precedes_test

%!test
%! assert (precedes (infsup, infsup (3.0, 4.0)));
%!test
%! assert (precedes (infsup (3.0, 4.0), infsup));
%!test
%! assert (precedes (infsup, infsup));
%!test
%! assert (isequal (precedes (infsup (1.0, 2.0), infsup (-inf, inf)), false));
%!test
%! assert (isequal (precedes (infsup (0.0, 2.0), infsup (-inf, inf)), false));
%!test
%! assert (isequal (precedes (infsup (-0.0, 2.0), infsup (-inf, inf)), false));
%!test
%! assert (isequal (precedes (infsup (-inf, inf), infsup (1.0, 2.0)), false));
%!test
%! assert (isequal (precedes (infsup (-inf, inf), infsup (-inf, inf)), false));
%!test
%! assert (precedes (infsup (1.0, 2.0), infsup (3.0, 4.0)));
%!test
%! assert (precedes (infsup (1.0, 3.0), infsup (3.0, 4.0)));
%!test
%! assert (precedes (infsup (-3.0, -1.0), infsup (-1.0, 0.0)));
%!test
%! assert (precedes (infsup (-3.0, -1.0), infsup (-1.0, -0.0)));
%!test
%! assert (isequal (precedes (infsup (1.0, 3.5), infsup (3.0, 4.0)), false));
%!test
%! assert (isequal (precedes (infsup (1.0, 4.0), infsup (3.0, 4.0)), false));
%!test
%! assert (isequal (precedes (infsup (-3.0, -0.1), infsup (-1.0, 0.0)), false));
%!test
%! assert (precedes (infsup (0.0, 0.0), infsup (-0.0, -0.0)));
%!test
%! assert (precedes (infsup (-0.0, -0.0), infsup (0.0, 0.0)));
%!test
%! assert (precedes (infsup (-0.0, 0.0), infsup (0.0, 0.0)));
%!test
%! assert (precedes (infsup (-0.0, 0.0), infsup (0.0, -0.0)));
%!test
%! assert (precedes (infsup (0.0, -0.0), infsup (0.0, 0.0)));
%!test
%! assert (precedes (infsup (0.0, -0.0), infsup (-0.0, 0.0)));

## minimal_precedes_dec_test

%!test
%! assert (precedes (infsupdec (empty, "trv"), infsupdec (3.0, 4.0, "def")));
%!test
%! assert (precedes (infsupdec (3.0, 4.0, "trv"), infsupdec (empty, "trv")));
%!test
%! assert (precedes (infsupdec (empty, "trv"), infsupdec (3.0, 4.0, "trv")));
%!test
%! assert (precedes (infsupdec (3.0, 4.0, "trv"), infsupdec (empty, "trv")));
%!test
%! assert (isequal (precedes (infsupdec (1.0, 2.0, "trv"), infsupdec (-inf, inf, "trv")), false));
%!test
%! assert (isequal (precedes (infsupdec (0.0, 2.0, "trv"), infsupdec (-inf, inf, "trv")), false));
%!test
%! assert (isequal (precedes (infsupdec (-0.0, 2.0, "trv"), infsupdec (-inf, inf, "trv")), false));
%!test
%! assert (isequal (precedes (infsupdec (-inf, inf, "trv"), infsupdec (1.0, 2.0, "trv")), false));
%!test
%! assert (isequal (precedes (infsupdec (-inf, inf, "trv"), infsupdec (-inf, inf, "trv")), false));
%!test
%! assert (precedes (infsupdec (1.0, 2.0, "trv"), infsupdec (3.0, 4.0, "trv")));
%!test
%! assert (precedes (infsupdec (1.0, 3.0, "trv"), infsupdec (3.0, 4.0, "def")));
%!test
%! assert (precedes (infsupdec (-3.0, -1.0, "def"), infsupdec (-1.0, 0.0, "trv")));
%!test
%! assert (precedes (infsupdec (-3.0, -1.0, "trv"), infsupdec (-1.0, -0.0, "trv")));
%!test
%! assert (isequal (precedes (infsupdec (1.0, 3.5, "trv"), infsupdec (3.0, 4.0, "trv")), false));
%!test
%! assert (isequal (precedes (infsupdec (1.0, 4.0, "trv"), infsupdec (3.0, 4.0, "trv")), false));
%!test
%! assert (isequal (precedes (infsupdec (-3.0, -0.1, "trv"), infsupdec (-1.0, 0.0, "trv")), false));
%!test
%! assert (precedes (infsupdec (0.0, 0.0, "trv"), infsupdec (-0.0, -0.0, "trv")));
%!test
%! assert (precedes (infsupdec (-0.0, -0.0, "trv"), infsupdec (0.0, 0.0, "def")));
%!test
%! assert (precedes (infsupdec (-0.0, 0.0, "trv"), infsupdec (0.0, 0.0, "trv")));
%!test
%! assert (precedes (infsupdec (-0.0, 0.0, "def"), infsupdec (0.0, -0.0, "trv")));
%!test
%! assert (precedes (infsupdec (0.0, -0.0, "trv"), infsupdec (0.0, 0.0, "trv")));
%!test
%! assert (precedes (infsupdec (0.0, -0.0, "trv"), infsupdec (-0.0, 0.0, "trv")));

## minimal_interior_test

%!test
%! assert (interior (infsup, infsup));
%!test
%! assert (interior (infsup, infsup (0.0, 4.0)));
%!test
%! assert (isequal (interior (infsup (0.0, 4.0), infsup), false));
%!test
%! assert (interior (infsup (-inf, inf), infsup (-inf, inf)));
%!test
%! assert (interior (infsup (0.0, 4.0), infsup (-inf, inf)));
%!test
%! assert (interior (infsup, infsup (-inf, inf)));
%!test
%! assert (isequal (interior (infsup (-inf, inf), infsup (0.0, 4.0)), false));
%!test
%! assert (isequal (interior (infsup (0.0, 4.0), infsup (0.0, 4.0)), false));
%!test
%! assert (interior (infsup (1.0, 2.0), infsup (0.0, 4.0)));
%!test
%! assert (isequal (interior (infsup (-2.0, 2.0), infsup (-2.0, 4.0)), false));
%!test
%! assert (interior (infsup (-0.0, -0.0), infsup (-2.0, 4.0)));
%!test
%! assert (interior (infsup (0.0, 0.0), infsup (-2.0, 4.0)));
%!test
%! assert (isequal (interior (infsup (0.0, 0.0), infsup (-0.0, -0.0)), false));
%!test
%! assert (isequal (interior (infsup (0.0, 4.4), infsup (0.0, 4.0)), false));
%!test
%! assert (isequal (interior (infsup (-1.0, -1.0), infsup (0.0, 4.0)), false));
%!test
%! assert (isequal (interior (infsup (2.0, 2.0), infsup (-2.0, -1.0)), false));

## minimal_interior_dec_test

%!test
%! assert (interior (infsupdec (empty, "trv"), infsupdec (0.0, 4.0, "trv")));
%!test
%! assert (isequal (interior (infsupdec (0.0, 4.0, "def"), infsupdec (empty, "trv")), false));
%!test
%! assert (isequal (interior (infsupdec (0.0, 4.0, "trv"), infsupdec (empty, "trv")), false));
%!test
%! assert (interior (infsupdec (-inf, inf, "trv"), infsupdec (-inf, inf, "trv")));
%!test
%! assert (interior (infsupdec (0.0, 4.0, "trv"), infsupdec (-inf, inf, "trv")));
%!test
%! assert (interior (infsupdec (empty, "trv"), infsupdec (-inf, inf, "trv")));
%!test
%! assert (isequal (interior (infsupdec (-inf, inf, "trv"), infsupdec (0.0, 4.0, "trv")), false));
%!test
%! assert (isequal (interior (infsupdec (0.0, 4.0, "trv"), infsupdec (0.0, 4.0, "trv")), false));
%!test
%! assert (interior (infsupdec (1.0, 2.0, "def"), infsupdec (0.0, 4.0, "trv")));
%!test
%! assert (isequal (interior (infsupdec (-2.0, 2.0, "trv"), infsupdec (-2.0, 4.0, "def")), false));
%!test
%! assert (interior (infsupdec (-0.0, -0.0, "trv"), infsupdec (-2.0, 4.0, "trv")));
%!test
%! assert (interior (infsupdec (0.0, 0.0, "def"), infsupdec (-2.0, 4.0, "trv")));
%!test
%! assert (isequal (interior (infsupdec (0.0, 0.0, "trv"), infsupdec (-0.0, -0.0, "trv")), false));
%!test
%! assert (isequal (interior (infsupdec (0.0, 4.4, "trv"), infsupdec (0.0, 4.0, "trv")), false));
%!test
%! assert (isequal (interior (infsupdec (-1.0, -1.0, "trv"), infsupdec (0.0, 4.0, "def")), false));
%!test
%! assert (isequal (interior (infsupdec (2.0, 2.0, "def"), infsupdec (-2.0, -1.0, "trv")), false));

## minimal_strictLess_test

%!test
%! assert (lt (infsup, infsup));
%! assert (infsup < infsup);
%!test
%! assert (isequal (lt (infsup (1.0, 2.0), infsup), false));
%! assert (isequal (infsup (1.0, 2.0) < infsup, false));
%!test
%! assert (isequal (lt (infsup, infsup (1.0, 2.0)), false));
%! assert (isequal (infsup < infsup (1.0, 2.0), false));
%!test
%! assert (lt (infsup (-inf, inf), infsup (-inf, inf)));
%! assert (infsup (-inf, inf) < infsup (-inf, inf));
%!test
%! assert (isequal (lt (infsup (1.0, 2.0), infsup (-inf, inf)), false));
%! assert (isequal (infsup (1.0, 2.0) < infsup (-inf, inf), false));
%!test
%! assert (isequal (lt (infsup (-inf, inf), infsup (1.0, 2.0)), false));
%! assert (isequal (infsup (-inf, inf) < infsup (1.0, 2.0), false));
%!test
%! assert (isequal (lt (infsup (1.0, 2.0), infsup (1.0, 2.0)), false));
%! assert (isequal (infsup (1.0, 2.0) < infsup (1.0, 2.0), false));
%!test
%! assert (lt (infsup (1.0, 2.0), infsup (3.0, 4.0)));
%! assert (infsup (1.0, 2.0) < infsup (3.0, 4.0));
%!test
%! assert (lt (infsup (1.0, 3.5), infsup (3.0, 4.0)));
%! assert (infsup (1.0, 3.5) < infsup (3.0, 4.0));
%!test
%! assert (isequal (lt (infsup (1.0, 4.0), infsup (3.0, 4.0)), false));
%! assert (isequal (infsup (1.0, 4.0) < infsup (3.0, 4.0), false));
%!test
%! assert (isequal (lt (infsup (0.0, 4.0), infsup (0.0, 4.0)), false));
%! assert (isequal (infsup (0.0, 4.0) < infsup (0.0, 4.0), false));
%!test
%! assert (isequal (lt (infsup (-0.0, 4.0), infsup (0.0, 4.0)), false));
%! assert (isequal (infsup (-0.0, 4.0) < infsup (0.0, 4.0), false));
%!test
%! assert (isequal (lt (infsup (-2.0, -1.0), infsup (-2.0, -1.0)), false));
%! assert (isequal (infsup (-2.0, -1.0) < infsup (-2.0, -1.0), false));
%!test
%! assert (lt (infsup (-3.0, -1.5), infsup (-2.0, -1.0)));
%! assert (infsup (-3.0, -1.5) < infsup (-2.0, -1.0));

## minimal_strictLess_dec_test

%!test
%! assert (isequal (lt (infsupdec (1.0, 2.0, "trv"), infsupdec (empty, "trv")), false));
%! assert (isequal (infsupdec (1.0, 2.0, "trv") < infsupdec (empty, "trv"), false));
%!test
%! assert (isequal (lt (infsupdec (empty, "trv"), infsupdec (1.0, 2.0, "def")), false));
%! assert (isequal (infsupdec (empty, "trv") < infsupdec (1.0, 2.0, "def"), false));
%!test
%! assert (isequal (lt (infsupdec (1.0, 2.0, "def"), infsupdec (empty, "trv")), false));
%! assert (isequal (infsupdec (1.0, 2.0, "def") < infsupdec (empty, "trv"), false));
%!test
%! assert (isequal (lt (infsupdec (empty, "trv"), infsupdec (1.0, 2.0, "def")), false));
%! assert (isequal (infsupdec (empty, "trv") < infsupdec (1.0, 2.0, "def"), false));
%!test
%! assert (lt (infsupdec (-inf, inf, "trv"), infsupdec (-inf, inf, "trv")));
%! assert (infsupdec (-inf, inf, "trv") < infsupdec (-inf, inf, "trv"));
%!test
%! assert (isequal (lt (infsupdec (1.0, 2.0, "trv"), infsupdec (-inf, inf, "trv")), false));
%! assert (isequal (infsupdec (1.0, 2.0, "trv") < infsupdec (-inf, inf, "trv"), false));
%!test
%! assert (isequal (lt (infsupdec (-inf, inf, "trv"), infsupdec (1.0, 2.0, "trv")), false));
%! assert (isequal (infsupdec (-inf, inf, "trv") < infsupdec (1.0, 2.0, "trv"), false));
%!test
%! assert (isequal (lt (infsupdec (1.0, 2.0, "trv"), infsupdec (1.0, 2.0, "trv")), false));
%! assert (isequal (infsupdec (1.0, 2.0, "trv") < infsupdec (1.0, 2.0, "trv"), false));
%!test
%! assert (lt (infsupdec (1.0, 2.0, "trv"), infsupdec (3.0, 4.0, "trv")));
%! assert (infsupdec (1.0, 2.0, "trv") < infsupdec (3.0, 4.0, "trv"));
%!test
%! assert (lt (infsupdec (1.0, 3.5, "def"), infsupdec (3.0, 4.0, "trv")));
%! assert (infsupdec (1.0, 3.5, "def") < infsupdec (3.0, 4.0, "trv"));
%!test
%! assert (isequal (lt (infsupdec (1.0, 4.0, "trv"), infsupdec (3.0, 4.0, "def")), false));
%! assert (isequal (infsupdec (1.0, 4.0, "trv") < infsupdec (3.0, 4.0, "def"), false));
%!test
%! assert (isequal (lt (infsupdec (0.0, 4.0, "trv"), infsupdec (0.0, 4.0, "def")), false));
%! assert (isequal (infsupdec (0.0, 4.0, "trv") < infsupdec (0.0, 4.0, "def"), false));
%!test
%! assert (isequal (lt (infsupdec (-0.0, 4.0, "def"), infsupdec (0.0, 4.0, "trv")), false));
%! assert (isequal (infsupdec (-0.0, 4.0, "def") < infsupdec (0.0, 4.0, "trv"), false));
%!test
%! assert (isequal (lt (infsupdec (-2.0, -1.0, "def"), infsupdec (-2.0, -1.0, "def")), false));
%! assert (isequal (infsupdec (-2.0, -1.0, "def") < infsupdec (-2.0, -1.0, "def"), false));
%!test
%! assert (lt (infsupdec (-3.0, -1.5, "trv"), infsupdec (-2.0, -1.0, "trv")));
%! assert (infsupdec (-3.0, -1.5, "trv") < infsupdec (-2.0, -1.0, "trv"));

## minimal_strictPrecedes_test

%!test
%! assert (strictprecedes (infsup, infsup (3.0, 4.0)));
%!test
%! assert (strictprecedes (infsup (3.0, 4.0), infsup));
%!test
%! assert (strictprecedes (infsup, infsup));
%!test
%! assert (isequal (strictprecedes (infsup (1.0, 2.0), infsup (-inf, inf)), false));
%!test
%! assert (isequal (strictprecedes (infsup (-inf, inf), infsup (1.0, 2.0)), false));
%!test
%! assert (isequal (strictprecedes (infsup (-inf, inf), infsup (-inf, inf)), false));
%!test
%! assert (strictprecedes (infsup (1.0, 2.0), infsup (3.0, 4.0)));
%!test
%! assert (isequal (strictprecedes (infsup (1.0, 3.0), infsup (3.0, 4.0)), false));
%!test
%! assert (isequal (strictprecedes (infsup (-3.0, -1.0), infsup (-1.0, 0.0)), false));
%!test
%! assert (isequal (strictprecedes (infsup (-3.0, -0.0), infsup (0.0, 1.0)), false));
%!test
%! assert (isequal (strictprecedes (infsup (-3.0, 0.0), infsup (-0.0, 1.0)), false));
%!test
%! assert (isequal (strictprecedes (infsup (1.0, 3.5), infsup (3.0, 4.0)), false));
%!test
%! assert (isequal (strictprecedes (infsup (1.0, 4.0), infsup (3.0, 4.0)), false));
%!test
%! assert (isequal (strictprecedes (infsup (-3.0, -0.1), infsup (-1.0, 0.0)), false));

## minimal_strictPrecedes_dec_test

%!test
%! assert (strictprecedes (infsupdec (empty, "trv"), infsupdec (3.0, 4.0, "trv")));
%!test
%! assert (strictprecedes (infsupdec (3.0, 4.0, "def"), infsupdec (empty, "trv")));
%!test
%! assert (strictprecedes (infsupdec (empty, "trv"), infsupdec (3.0, 4.0, "trv")));
%!test
%! assert (strictprecedes (infsupdec (3.0, 4.0, "def"), infsupdec (empty, "trv")));
%!test
%! assert (isequal (strictprecedes (infsupdec (1.0, 2.0, "trv"), infsupdec (-inf, inf, "trv")), false));
%!test
%! assert (isequal (strictprecedes (infsupdec (-inf, inf, "trv"), infsupdec (1.0, 2.0, "trv")), false));
%!test
%! assert (isequal (strictprecedes (infsupdec (-inf, inf, "trv"), infsupdec (-inf, inf, "trv")), false));
%!test
%! assert (strictprecedes (infsupdec (1.0, 2.0, "trv"), infsupdec (3.0, 4.0, "trv")));
%!test
%! assert (isequal (strictprecedes (infsupdec (1.0, 3.0, "def"), infsupdec (3.0, 4.0, "trv")), false));
%!test
%! assert (isequal (strictprecedes (infsupdec (-3.0, -1.0, "trv"), infsupdec (-1.0, 0.0, "def")), false));
%!test
%! assert (isequal (strictprecedes (infsupdec (-3.0, -0.0, "def"), infsupdec (0.0, 1.0, "trv")), false));
%!test
%! assert (isequal (strictprecedes (infsupdec (-3.0, 0.0, "trv"), infsupdec (-0.0, 1.0, "trv")), false));
%!test
%! assert (isequal (strictprecedes (infsupdec (1.0, 3.5, "trv"), infsupdec (3.0, 4.0, "trv")), false));
%!test
%! assert (isequal (strictprecedes (infsupdec (1.0, 4.0, "trv"), infsupdec (3.0, 4.0, "def")), false));
%!test
%! assert (isequal (strictprecedes (infsupdec (-3.0, -0.1, "trv"), infsupdec (-1.0, 0.0, "trv")), false));

## minimal_disjoint_test

%!test
%! assert (disjoint (infsup, infsup (3.0, 4.0)));
%!test
%! assert (disjoint (infsup (3.0, 4.0), infsup));
%!test
%! assert (disjoint (infsup, infsup));
%!test
%! assert (disjoint (infsup (3.0, 4.0), infsup (1.0, 2.0)));
%!test
%! assert (isequal (disjoint (infsup (0.0, 0.0), infsup (-0.0, -0.0)), false));
%!test
%! assert (isequal (disjoint (infsup (0.0, -0.0), infsup (-0.0, 0.0)), false));
%!test
%! assert (isequal (disjoint (infsup (3.0, 4.0), infsup (1.0, 7.0)), false));
%!test
%! assert (isequal (disjoint (infsup (3.0, 4.0), infsup (-inf, inf)), false));
%!test
%! assert (isequal (disjoint (infsup (-inf, inf), infsup (1.0, 7.0)), false));
%!test
%! assert (isequal (disjoint (infsup (-inf, inf), infsup (-inf, inf)), false));

## minimal_disjoint_dec_test

%!test
%! assert (disjoint (infsupdec (empty, "trv"), infsupdec (3.0, 4.0, "def")));
%!test
%! assert (disjoint (infsupdec (3.0, 4.0, "trv"), infsupdec (empty, "trv")));
%!test
%! assert (disjoint (infsupdec (empty, "trv"), infsupdec (3.0, 4.0, "trv")));
%!test
%! assert (disjoint (infsupdec (3.0, 4.0, "trv"), infsupdec (empty, "trv")));
%!test
%! assert (disjoint (infsupdec (3.0, 4.0, "trv"), infsupdec (1.0, 2.0, "def")));
%!test
%! assert (isequal (disjoint (infsupdec (0.0, 0.0, "trv"), infsupdec (-0.0, -0.0, "trv")), false));
%!test
%! assert (isequal (disjoint (infsupdec (0.0, -0.0, "trv"), infsupdec (-0.0, 0.0, "trv")), false));
%!test
%! assert (isequal (disjoint (infsupdec (3.0, 4.0, "def"), infsupdec (1.0, 7.0, "def")), false));
%!test
%! assert (isequal (disjoint (infsupdec (3.0, 4.0, "trv"), infsupdec (-inf, inf, "trv")), false));
%!test
%! assert (isequal (disjoint (infsupdec (-inf, inf, "trv"), infsupdec (1.0, 7.0, "trv")), false));
%!test
%! assert (isequal (disjoint (infsupdec (-inf, inf, "trv"), infsupdec (-inf, inf, "trv")), false));
