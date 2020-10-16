## DO NOT EDIT!  Generated automatically from test/libieeep1788_tests_set.itl
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

## minimal_intersection_test

%!test
%! assert (isequal (intersect (infsup (1.0, 3.0), infsup (2.1, 4.0)), infsup (2.1, 3.0)));
%!test
%! assert (isequal (intersect (infsup (1.0, 3.0), infsup (3.0, 4.0)), infsup (3.0, 3.0)));
%!test
%! assert (isequal (intersect (infsup (1.0, 3.0), infsup), infsup));
%!test
%! assert (isequal (intersect (infsup (-inf, inf), infsup), infsup));
%!test
%! assert (isequal (intersect (infsup (1.0, 3.0), infsup (-inf, inf)), infsup (1.0, 3.0)));

## minimal_intersection_dec_test

%!test
%! assert (isequal (intersect (infsupdec (1.0, 3.0, "com"), infsupdec (2.1, 4.0, "com")), infsupdec (2.1, 3.0, "trv")));
%! assert (isequal (decorationpart (intersect (infsupdec (1.0, 3.0, "com"), infsupdec (2.1, 4.0, "com"))){1}, decorationpart (infsupdec (2.1, 3.0, "trv")){1}));
%!test
%! assert (isequal (intersect (infsupdec (1.0, 3.0, "dac"), infsupdec (3.0, 4.0, "def")), infsupdec (3.0, 3.0, "trv")));
%! assert (isequal (decorationpart (intersect (infsupdec (1.0, 3.0, "dac"), infsupdec (3.0, 4.0, "def"))){1}, decorationpart (infsupdec (3.0, 3.0, "trv")){1}));
%!test
%! assert (isequal (intersect (infsupdec (1.0, 3.0, "def"), infsupdec (empty, "trv")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (intersect (infsupdec (1.0, 3.0, "def"), infsupdec (empty, "trv"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (intersect (infsupdec (entire, "def"), infsupdec (empty, "trv")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (intersect (infsupdec (entire, "def"), infsupdec (empty, "trv"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (intersect (infsupdec (1.0, 3.0, "dac"), infsupdec (entire, "def")), infsupdec (1.0, 3.0, "trv")));
%! assert (isequal (decorationpart (intersect (infsupdec (1.0, 3.0, "dac"), infsupdec (entire, "def"))){1}, decorationpart (infsupdec (1.0, 3.0, "trv")){1}));

## minimal_convexHull_test

%!test
%! assert (isequal (union (infsup (1.0, 3.0), infsup (2.1, 4.0)), infsup (1.0, 4.0)));
%!test
%! assert (isequal (union (infsup (1.0, 1.0), infsup (2.1, 4.0)), infsup (1.0, 4.0)));
%!test
%! assert (isequal (union (infsup (1.0, 3.0), infsup), infsup (1.0, 3.0)));
%!test
%! assert (isequal (union (infsup, infsup), infsup));
%!test
%! assert (isequal (union (infsup (1.0, 3.0), infsup (-inf, inf)), infsup (-inf, inf)));

## minimal_convexHull_dec_test

%!test
%! assert (isequal (union (infsupdec (1.0, 3.0, "trv"), infsupdec (2.1, 4.0, "trv")), infsupdec (1.0, 4.0, "trv")));
%! assert (isequal (decorationpart (union (infsupdec (1.0, 3.0, "trv"), infsupdec (2.1, 4.0, "trv"))){1}, decorationpart (infsupdec (1.0, 4.0, "trv")){1}));
%!test
%! assert (isequal (union (infsupdec (1.0, 1.0, "trv"), infsupdec (2.1, 4.0, "trv")), infsupdec (1.0, 4.0, "trv")));
%! assert (isequal (decorationpart (union (infsupdec (1.0, 1.0, "trv"), infsupdec (2.1, 4.0, "trv"))){1}, decorationpart (infsupdec (1.0, 4.0, "trv")){1}));
%!test
%! assert (isequal (union (infsupdec (1.0, 3.0, "trv"), infsupdec (empty, "trv")), infsupdec (1.0, 3.0, "trv")));
%! assert (isequal (decorationpart (union (infsupdec (1.0, 3.0, "trv"), infsupdec (empty, "trv"))){1}, decorationpart (infsupdec (1.0, 3.0, "trv")){1}));
%!test
%! assert (isequal (union (infsupdec (empty, "trv"), infsupdec (empty, "trv")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (union (infsupdec (empty, "trv"), infsupdec (empty, "trv"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (union (infsupdec (1.0, 3.0, "trv"), infsupdec (entire, "def")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (union (infsupdec (1.0, 3.0, "trv"), infsupdec (entire, "def"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
