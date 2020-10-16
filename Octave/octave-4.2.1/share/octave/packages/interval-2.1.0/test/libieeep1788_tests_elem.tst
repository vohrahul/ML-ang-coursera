## DO NOT EDIT!  Generated automatically from test/libieeep1788_tests_elem.itl
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

## minimal_pos_test

%!test
%! assert (isequal (+infsup (1.0, 2.0), infsup (1.0, 2.0)));
%! assert (isequal (uplus (infsup (1.0, 2.0)), infsup (1.0, 2.0)));
%!test
%! assert (isequal (+infsup, infsup));
%! assert (isequal (uplus (infsup), infsup));
%!test
%! assert (isequal (+infsup (-inf, inf), infsup (-inf, inf)));
%! assert (isequal (uplus (infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (+infsup (1.0, inf), infsup (1.0, inf)));
%! assert (isequal (uplus (infsup (1.0, inf)), infsup (1.0, inf)));
%!test
%! assert (isequal (+infsup (-inf, -1.0), infsup (-inf, -1.0)));
%! assert (isequal (uplus (infsup (-inf, -1.0)), infsup (-inf, -1.0)));
%!test
%! assert (isequal (+infsup (0.0, 2.0), infsup (0.0, 2.0)));
%! assert (isequal (uplus (infsup (0.0, 2.0)), infsup (0.0, 2.0)));
%!test
%! assert (isequal (+infsup (-0.0, 2.0), infsup (0.0, 2.0)));
%! assert (isequal (uplus (infsup (-0.0, 2.0)), infsup (0.0, 2.0)));
%!test
%! assert (isequal (+infsup (-2.5, -0.0), infsup (-2.5, 0.0)));
%! assert (isequal (uplus (infsup (-2.5, -0.0)), infsup (-2.5, 0.0)));
%!test
%! assert (isequal (+infsup (-2.5, 0.0), infsup (-2.5, 0.0)));
%! assert (isequal (uplus (infsup (-2.5, 0.0)), infsup (-2.5, 0.0)));
%!test
%! assert (isequal (+infsup (-0.0, -0.0), infsup (0.0, 0.0)));
%! assert (isequal (uplus (infsup (-0.0, -0.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (+infsup (0.0, 0.0), infsup (0.0, 0.0)));
%! assert (isequal (uplus (infsup (0.0, 0.0)), infsup (0.0, 0.0)));

## minimal_pos_dec_test

%!test
%! assert (isequal (+infsupdec (empty, "trv"), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (+infsupdec (empty, "trv")){1}, decorationpart (infsupdec (empty, "trv")){1}));
%! assert (isequal (uplus (infsupdec (empty, "trv")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (uplus (infsupdec (empty, "trv"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (+infsupdec (entire, "def"), infsupdec (entire, "def")));
%! assert (isequal (decorationpart (+infsupdec (entire, "def")){1}, decorationpart (infsupdec (entire, "def")){1}));
%! assert (isequal (uplus (infsupdec (entire, "def")), infsupdec (entire, "def")));
%! assert (isequal (decorationpart (uplus (infsupdec (entire, "def"))){1}, decorationpart (infsupdec (entire, "def")){1}));
%!test
%! assert (isequal (+infsupdec (1.0, 2.0, "com"), infsupdec (1.0, 2.0, "com")));
%! assert (isequal (decorationpart (+infsupdec (1.0, 2.0, "com")){1}, decorationpart (infsupdec (1.0, 2.0, "com")){1}));
%! assert (isequal (uplus (infsupdec (1.0, 2.0, "com")), infsupdec (1.0, 2.0, "com")));
%! assert (isequal (decorationpart (uplus (infsupdec (1.0, 2.0, "com"))){1}, decorationpart (infsupdec (1.0, 2.0, "com")){1}));

## minimal_neg_test

%!test
%! assert (isequal (-infsup (1.0, 2.0), infsup (-2.0, -1.0)));
%! assert (isequal (uminus (infsup (1.0, 2.0)), infsup (-2.0, -1.0)));
%!test
%! assert (isequal (-infsup, infsup));
%! assert (isequal (uminus (infsup), infsup));
%!test
%! assert (isequal (-infsup (-inf, inf), infsup (-inf, inf)));
%! assert (isequal (uminus (infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (-infsup (1.0, inf), infsup (-inf, -1.0)));
%! assert (isequal (uminus (infsup (1.0, inf)), infsup (-inf, -1.0)));
%!test
%! assert (isequal (-infsup (-inf, 1.0), infsup (-1.0, inf)));
%! assert (isequal (uminus (infsup (-inf, 1.0)), infsup (-1.0, inf)));
%!test
%! assert (isequal (-infsup (0.0, 2.0), infsup (-2.0, 0.0)));
%! assert (isequal (uminus (infsup (0.0, 2.0)), infsup (-2.0, 0.0)));
%!test
%! assert (isequal (-infsup (-0.0, 2.0), infsup (-2.0, 0.0)));
%! assert (isequal (uminus (infsup (-0.0, 2.0)), infsup (-2.0, 0.0)));
%!test
%! assert (isequal (-infsup (-2.0, 0.0), infsup (0.0, 2.0)));
%! assert (isequal (uminus (infsup (-2.0, 0.0)), infsup (0.0, 2.0)));
%!test
%! assert (isequal (-infsup (-2.0, -0.0), infsup (0.0, 2.0)));
%! assert (isequal (uminus (infsup (-2.0, -0.0)), infsup (0.0, 2.0)));
%!test
%! assert (isequal (-infsup (0.0, -0.0), infsup (0.0, 0.0)));
%! assert (isequal (uminus (infsup (0.0, -0.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (-infsup (-0.0, -0.0), infsup (0.0, 0.0)));
%! assert (isequal (uminus (infsup (-0.0, -0.0)), infsup (0.0, 0.0)));

## minimal_neg_dec_test

%!test
%! assert (isequal (-infsupdec (empty, "trv"), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (-infsupdec (empty, "trv")){1}, decorationpart (infsupdec (empty, "trv")){1}));
%! assert (isequal (uminus (infsupdec (empty, "trv")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (uminus (infsupdec (empty, "trv"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (-infsupdec (entire, "def"), infsupdec (entire, "def")));
%! assert (isequal (decorationpart (-infsupdec (entire, "def")){1}, decorationpart (infsupdec (entire, "def")){1}));
%! assert (isequal (uminus (infsupdec (entire, "def")), infsupdec (entire, "def")));
%! assert (isequal (decorationpart (uminus (infsupdec (entire, "def"))){1}, decorationpart (infsupdec (entire, "def")){1}));
%!test
%! assert (isequal (-infsupdec (1.0, 2.0, "com"), infsupdec (-2.0, -1.0, "com")));
%! assert (isequal (decorationpart (-infsupdec (1.0, 2.0, "com")){1}, decorationpart (infsupdec (-2.0, -1.0, "com")){1}));
%! assert (isequal (uminus (infsupdec (1.0, 2.0, "com")), infsupdec (-2.0, -1.0, "com")));
%! assert (isequal (decorationpart (uminus (infsupdec (1.0, 2.0, "com"))){1}, decorationpart (infsupdec (-2.0, -1.0, "com")){1}));

## minimal_add_test

%!test
%! assert (isequal (infsup + infsup, infsup));
%! assert (isequal (plus (infsup, infsup), infsup));
%!test
%! assert (isequal (infsup (-1.0, 1.0) + infsup, infsup));
%! assert (isequal (plus (infsup (-1.0, 1.0), infsup), infsup));
%!test
%! assert (isequal (infsup + infsup (-1.0, 1.0), infsup));
%! assert (isequal (plus (infsup, infsup (-1.0, 1.0)), infsup));
%!test
%! assert (isequal (infsup + infsup (-inf, inf), infsup));
%! assert (isequal (plus (infsup, infsup (-inf, inf)), infsup));
%!test
%! assert (isequal (infsup (-inf, inf) + infsup, infsup));
%! assert (isequal (plus (infsup (-inf, inf), infsup), infsup));
%!test
%! assert (isequal (infsup (-inf, inf) + infsup (-inf, 1.0), infsup (-inf, inf)));
%! assert (isequal (plus (infsup (-inf, inf), infsup (-inf, 1.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-inf, inf) + infsup (-1.0, 1.0), infsup (-inf, inf)));
%! assert (isequal (plus (infsup (-inf, inf), infsup (-1.0, 1.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-inf, inf) + infsup (-1.0, inf), infsup (-inf, inf)));
%! assert (isequal (plus (infsup (-inf, inf), infsup (-1.0, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-inf, inf) + infsup (-inf, inf), infsup (-inf, inf)));
%! assert (isequal (plus (infsup (-inf, inf), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-inf, 1.0) + infsup (-inf, inf), infsup (-inf, inf)));
%! assert (isequal (plus (infsup (-inf, 1.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-1.0, 1.0) + infsup (-inf, inf), infsup (-inf, inf)));
%! assert (isequal (plus (infsup (-1.0, 1.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-1.0, inf) + infsup (-inf, inf), infsup (-inf, inf)));
%! assert (isequal (plus (infsup (-1.0, inf), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-inf, 2.0) + infsup (-inf, 4.0), infsup (-inf, 6.0)));
%! assert (isequal (plus (infsup (-inf, 2.0), infsup (-inf, 4.0)), infsup (-inf, 6.0)));
%!test
%! assert (isequal (infsup (-inf, 2.0) + infsup (3.0, 4.0), infsup (-inf, 6.0)));
%! assert (isequal (plus (infsup (-inf, 2.0), infsup (3.0, 4.0)), infsup (-inf, 6.0)));
%!test
%! assert (isequal (infsup (-inf, 2.0) + infsup (3.0, inf), infsup (-inf, inf)));
%! assert (isequal (plus (infsup (-inf, 2.0), infsup (3.0, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (1.0, 2.0) + infsup (-inf, 4.0), infsup (-inf, 6.0)));
%! assert (isequal (plus (infsup (1.0, 2.0), infsup (-inf, 4.0)), infsup (-inf, 6.0)));
%!test
%! assert (isequal (infsup (1.0, 2.0) + infsup (3.0, 4.0), infsup (4.0, 6.0)));
%! assert (isequal (plus (infsup (1.0, 2.0), infsup (3.0, 4.0)), infsup (4.0, 6.0)));
%!test
%! assert (isequal (infsup (1.0, 2.0) + infsup (3.0, inf), infsup (4.0, inf)));
%! assert (isequal (plus (infsup (1.0, 2.0), infsup (3.0, inf)), infsup (4.0, inf)));
%!test
%! assert (isequal (infsup (1.0, inf) + infsup (-inf, 4.0), infsup (-inf, inf)));
%! assert (isequal (plus (infsup (1.0, inf), infsup (-inf, 4.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (1.0, inf) + infsup (3.0, 4.0), infsup (4.0, inf)));
%! assert (isequal (plus (infsup (1.0, inf), infsup (3.0, 4.0)), infsup (4.0, inf)));
%!test
%! assert (isequal (infsup (1.0, inf) + infsup (3.0, inf), infsup (4.0, inf)));
%! assert (isequal (plus (infsup (1.0, inf), infsup (3.0, inf)), infsup (4.0, inf)));
%!test
%! assert (isequal (infsup (1.0, 1.797693134862315708e+308) + infsup (3.0, 4.0), infsup (4.0, inf)));
%! assert (isequal (plus (infsup (1.0, 1.797693134862315708e+308), infsup (3.0, 4.0)), infsup (4.0, inf)));
%!test
%! assert (isequal (infsup (-1.797693134862315708e+308, 2.0) + infsup (-3.0, 4.0), infsup (-inf, 6.0)));
%! assert (isequal (plus (infsup (-1.797693134862315708e+308, 2.0), infsup (-3.0, 4.0)), infsup (-inf, 6.0)));
%!test
%! assert (isequal (infsup (-1.797693134862315708e+308, 2.0) + infsup (-3.0, 1.797693134862315708e+308), infsup (-inf, inf)));
%! assert (isequal (plus (infsup (-1.797693134862315708e+308, 2.0), infsup (-3.0, 1.797693134862315708e+308)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (1.0, 1.797693134862315708e+308) + infsup (0.0, 0.0), infsup (1.0, 1.797693134862315708e+308)));
%! assert (isequal (plus (infsup (1.0, 1.797693134862315708e+308), infsup (0.0, 0.0)), infsup (1.0, 1.797693134862315708e+308)));
%!test
%! assert (isequal (infsup (1.0, 1.797693134862315708e+308) + infsup (-0.0, -0.0), infsup (1.0, 1.797693134862315708e+308)));
%! assert (isequal (plus (infsup (1.0, 1.797693134862315708e+308), infsup (-0.0, -0.0)), infsup (1.0, 1.797693134862315708e+308)));
%!test
%! assert (isequal (infsup (0.0, 0.0) + infsup (-3.0, 4.0), infsup (-3.0, 4.0)));
%! assert (isequal (plus (infsup (0.0, 0.0), infsup (-3.0, 4.0)), infsup (-3.0, 4.0)));
%!test
%! assert (isequal (infsup (-0.0, -0.0) + infsup (-3.0, 1.797693134862315708e+308), infsup (-3.0, 1.797693134862315708e+308)));
%! assert (isequal (plus (infsup (-0.0, -0.0), infsup (-3.0, 1.797693134862315708e+308)), infsup (-3.0, 1.797693134862315708e+308)));
%!test
%! assert (isequal (infsup (1.999999999999996447e+00, 1.999999999999996447e+00) + infsup (1.000000000000000056e-01, 1.000000000000000056e-01), infsup (2.099999999999996092e+00, 2.099999999999996536e+00)));
%! assert (isequal (plus (infsup (1.999999999999996447e+00, 1.999999999999996447e+00), infsup (1.000000000000000056e-01, 1.000000000000000056e-01)), infsup (2.099999999999996092e+00, 2.099999999999996536e+00)));
%!test
%! assert (isequal (infsup (1.999999999999996447e+00, 1.999999999999996447e+00) + infsup (-1.000000000000000056e-01, -1.000000000000000056e-01), infsup (1.899999999999996358e+00, 1.899999999999996581e+00)));
%! assert (isequal (plus (infsup (1.999999999999996447e+00, 1.999999999999996447e+00), infsup (-1.000000000000000056e-01, -1.000000000000000056e-01)), infsup (1.899999999999996358e+00, 1.899999999999996581e+00)));
%!test
%! assert (isequal (infsup (-1.999999999999996447e+00, 1.999999999999996447e+00) + infsup (1.000000000000000056e-01, 1.000000000000000056e-01), infsup (-1.899999999999996581e+00, 2.099999999999996536e+00)));
%! assert (isequal (plus (infsup (-1.999999999999996447e+00, 1.999999999999996447e+00), infsup (1.000000000000000056e-01, 1.000000000000000056e-01)), infsup (-1.899999999999996581e+00, 2.099999999999996536e+00)));

## minimal_add_dec_test

%!test
%! assert (isequal (infsupdec (1.0, 2.0, "com") + infsupdec (5.0, 7.0, "com"), infsupdec (6.0, 9.0, "com")));
%! assert (isequal (decorationpart (infsupdec (1.0, 2.0, "com") + infsupdec (5.0, 7.0, "com")){1}, decorationpart (infsupdec (6.0, 9.0, "com")){1}));
%! assert (isequal (plus (infsupdec (1.0, 2.0, "com"), infsupdec (5.0, 7.0, "com")), infsupdec (6.0, 9.0, "com")));
%! assert (isequal (decorationpart (plus (infsupdec (1.0, 2.0, "com"), infsupdec (5.0, 7.0, "com"))){1}, decorationpart (infsupdec (6.0, 9.0, "com")){1}));
%!test
%! assert (isequal (infsupdec (1.0, 2.0, "com") + infsupdec (5.0, 7.0, "def"), infsupdec (6.0, 9.0, "def")));
%! assert (isequal (decorationpart (infsupdec (1.0, 2.0, "com") + infsupdec (5.0, 7.0, "def")){1}, decorationpart (infsupdec (6.0, 9.0, "def")){1}));
%! assert (isequal (plus (infsupdec (1.0, 2.0, "com"), infsupdec (5.0, 7.0, "def")), infsupdec (6.0, 9.0, "def")));
%! assert (isequal (decorationpart (plus (infsupdec (1.0, 2.0, "com"), infsupdec (5.0, 7.0, "def"))){1}, decorationpart (infsupdec (6.0, 9.0, "def")){1}));
%!test
%! assert (isequal (infsupdec (1.0, 2.0, "com") + infsupdec (5.0, 1.797693134862315708e+308, "com"), infsupdec (6.0, inf, "dac")));
%! assert (isequal (decorationpart (infsupdec (1.0, 2.0, "com") + infsupdec (5.0, 1.797693134862315708e+308, "com")){1}, decorationpart (infsupdec (6.0, inf, "dac")){1}));
%! assert (isequal (plus (infsupdec (1.0, 2.0, "com"), infsupdec (5.0, 1.797693134862315708e+308, "com")), infsupdec (6.0, inf, "dac")));
%! assert (isequal (decorationpart (plus (infsupdec (1.0, 2.0, "com"), infsupdec (5.0, 1.797693134862315708e+308, "com"))){1}, decorationpart (infsupdec (6.0, inf, "dac")){1}));
%!test
%! assert (isequal (infsupdec (-1.797693134862315708e+308, 2.0, "com") + infsupdec (-0.1, 5.0, "com"), infsupdec (-inf, 7.0, "dac")));
%! assert (isequal (decorationpart (infsupdec (-1.797693134862315708e+308, 2.0, "com") + infsupdec (-0.1, 5.0, "com")){1}, decorationpart (infsupdec (-inf, 7.0, "dac")){1}));
%! assert (isequal (plus (infsupdec (-1.797693134862315708e+308, 2.0, "com"), infsupdec (-0.1, 5.0, "com")), infsupdec (-inf, 7.0, "dac")));
%! assert (isequal (decorationpart (plus (infsupdec (-1.797693134862315708e+308, 2.0, "com"), infsupdec (-0.1, 5.0, "com"))){1}, decorationpart (infsupdec (-inf, 7.0, "dac")){1}));
%!test
%! assert (isequal (infsupdec (1.0, 2.0, "trv") + infsupdec (empty, "trv"), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (infsupdec (1.0, 2.0, "trv") + infsupdec (empty, "trv")){1}, decorationpart (infsupdec (empty, "trv")){1}));
%! assert (isequal (plus (infsupdec (1.0, 2.0, "trv"), infsupdec (empty, "trv")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (plus (infsupdec (1.0, 2.0, "trv"), infsupdec (empty, "trv"))){1}, decorationpart (infsupdec (empty, "trv")){1}));

## minimal_sub_test

%!test
%! assert (isequal (infsup - infsup, infsup));
%! assert (isequal (minus (infsup, infsup), infsup));
%!test
%! assert (isequal (infsup (-1.0, 1.0) - infsup, infsup));
%! assert (isequal (minus (infsup (-1.0, 1.0), infsup), infsup));
%!test
%! assert (isequal (infsup - infsup (-1.0, 1.0), infsup));
%! assert (isequal (minus (infsup, infsup (-1.0, 1.0)), infsup));
%!test
%! assert (isequal (infsup - infsup (-inf, inf), infsup));
%! assert (isequal (minus (infsup, infsup (-inf, inf)), infsup));
%!test
%! assert (isequal (infsup (-inf, inf) - infsup, infsup));
%! assert (isequal (minus (infsup (-inf, inf), infsup), infsup));
%!test
%! assert (isequal (infsup (-inf, inf) - infsup (-inf, 1.0), infsup (-inf, inf)));
%! assert (isequal (minus (infsup (-inf, inf), infsup (-inf, 1.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-inf, inf) - infsup (-1.0, 1.0), infsup (-inf, inf)));
%! assert (isequal (minus (infsup (-inf, inf), infsup (-1.0, 1.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-inf, inf) - infsup (-1.0, inf), infsup (-inf, inf)));
%! assert (isequal (minus (infsup (-inf, inf), infsup (-1.0, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-inf, inf) - infsup (-inf, inf), infsup (-inf, inf)));
%! assert (isequal (minus (infsup (-inf, inf), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-inf, 1.0) - infsup (-inf, inf), infsup (-inf, inf)));
%! assert (isequal (minus (infsup (-inf, 1.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-1.0, 1.0) - infsup (-inf, inf), infsup (-inf, inf)));
%! assert (isequal (minus (infsup (-1.0, 1.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-1.0, inf) - infsup (-inf, inf), infsup (-inf, inf)));
%! assert (isequal (minus (infsup (-1.0, inf), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-inf, 2.0) - infsup (-inf, 4.0), infsup (-inf, inf)));
%! assert (isequal (minus (infsup (-inf, 2.0), infsup (-inf, 4.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-inf, 2.0) - infsup (3.0, 4.0), infsup (-inf, -1.0)));
%! assert (isequal (minus (infsup (-inf, 2.0), infsup (3.0, 4.0)), infsup (-inf, -1.0)));
%!test
%! assert (isequal (infsup (-inf, 2.0) - infsup (3.0, inf), infsup (-inf, -1.0)));
%! assert (isequal (minus (infsup (-inf, 2.0), infsup (3.0, inf)), infsup (-inf, -1.0)));
%!test
%! assert (isequal (infsup (1.0, 2.0) - infsup (-inf, 4.0), infsup (-3.0, inf)));
%! assert (isequal (minus (infsup (1.0, 2.0), infsup (-inf, 4.0)), infsup (-3.0, inf)));
%!test
%! assert (isequal (infsup (1.0, 2.0) - infsup (3.0, 4.0), infsup (-3.0, -1.0)));
%! assert (isequal (minus (infsup (1.0, 2.0), infsup (3.0, 4.0)), infsup (-3.0, -1.0)));
%!test
%! assert (isequal (infsup (1.0, 2.0) - infsup (3.0, inf), infsup (-inf, -1.0)));
%! assert (isequal (minus (infsup (1.0, 2.0), infsup (3.0, inf)), infsup (-inf, -1.0)));
%!test
%! assert (isequal (infsup (1.0, inf) - infsup (-inf, 4.0), infsup (-3.0, inf)));
%! assert (isequal (minus (infsup (1.0, inf), infsup (-inf, 4.0)), infsup (-3.0, inf)));
%!test
%! assert (isequal (infsup (1.0, inf) - infsup (3.0, 4.0), infsup (-3.0, inf)));
%! assert (isequal (minus (infsup (1.0, inf), infsup (3.0, 4.0)), infsup (-3.0, inf)));
%!test
%! assert (isequal (infsup (1.0, inf) - infsup (3.0, inf), infsup (-inf, inf)));
%! assert (isequal (minus (infsup (1.0, inf), infsup (3.0, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (1.0, 1.797693134862315708e+308) - infsup (-3.0, 4.0), infsup (-3.0, inf)));
%! assert (isequal (minus (infsup (1.0, 1.797693134862315708e+308), infsup (-3.0, 4.0)), infsup (-3.0, inf)));
%!test
%! assert (isequal (infsup (-1.797693134862315708e+308, 2.0) - infsup (3.0, 4.0), infsup (-inf, -1.0)));
%! assert (isequal (minus (infsup (-1.797693134862315708e+308, 2.0), infsup (3.0, 4.0)), infsup (-inf, -1.0)));
%!test
%! assert (isequal (infsup (-1.797693134862315708e+308, 2.0) - infsup (-1.797693134862315708e+308, 4.0), infsup (-inf, inf)));
%! assert (isequal (minus (infsup (-1.797693134862315708e+308, 2.0), infsup (-1.797693134862315708e+308, 4.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (1.0, 1.797693134862315708e+308) - infsup (0.0, 0.0), infsup (1.0, 1.797693134862315708e+308)));
%! assert (isequal (minus (infsup (1.0, 1.797693134862315708e+308), infsup (0.0, 0.0)), infsup (1.0, 1.797693134862315708e+308)));
%!test
%! assert (isequal (infsup (1.0, 1.797693134862315708e+308) - infsup (-0.0, -0.0), infsup (1.0, 1.797693134862315708e+308)));
%! assert (isequal (minus (infsup (1.0, 1.797693134862315708e+308), infsup (-0.0, -0.0)), infsup (1.0, 1.797693134862315708e+308)));
%!test
%! assert (isequal (infsup (0.0, 0.0) - infsup (-3.0, 4.0), infsup (-4.0, 3.0)));
%! assert (isequal (minus (infsup (0.0, 0.0), infsup (-3.0, 4.0)), infsup (-4.0, 3.0)));
%!test
%! assert (isequal (infsup (-0.0, -0.0) - infsup (-3.0, 1.797693134862315708e+308), infsup (-1.797693134862315708e+308, 3.0)));
%! assert (isequal (minus (infsup (-0.0, -0.0), infsup (-3.0, 1.797693134862315708e+308)), infsup (-1.797693134862315708e+308, 3.0)));
%!test
%! assert (isequal (infsup (1.999999999999996447e+00, 1.999999999999996447e+00) - infsup (1.000000000000000056e-01, 1.000000000000000056e-01), infsup (1.899999999999996358e+00, 1.899999999999996581e+00)));
%! assert (isequal (minus (infsup (1.999999999999996447e+00, 1.999999999999996447e+00), infsup (1.000000000000000056e-01, 1.000000000000000056e-01)), infsup (1.899999999999996358e+00, 1.899999999999996581e+00)));
%!test
%! assert (isequal (infsup (1.999999999999996447e+00, 1.999999999999996447e+00) - infsup (-1.000000000000000056e-01, -1.000000000000000056e-01), infsup (2.099999999999996092e+00, 2.099999999999996536e+00)));
%! assert (isequal (minus (infsup (1.999999999999996447e+00, 1.999999999999996447e+00), infsup (-1.000000000000000056e-01, -1.000000000000000056e-01)), infsup (2.099999999999996092e+00, 2.099999999999996536e+00)));
%!test
%! assert (isequal (infsup (-1.999999999999996447e+00, 1.999999999999996447e+00) - infsup (1.000000000000000056e-01, 1.000000000000000056e-01), infsup (-2.099999999999996536e+00, 1.899999999999996581e+00)));
%! assert (isequal (minus (infsup (-1.999999999999996447e+00, 1.999999999999996447e+00), infsup (1.000000000000000056e-01, 1.000000000000000056e-01)), infsup (-2.099999999999996536e+00, 1.899999999999996581e+00)));

## minimal_sub_dec_test

%!test
%! assert (isequal (infsupdec (1.0, 2.0, "com") - infsupdec (5.0, 7.0, "com"), infsupdec (-6.0, -3.0, "com")));
%! assert (isequal (decorationpart (infsupdec (1.0, 2.0, "com") - infsupdec (5.0, 7.0, "com")){1}, decorationpart (infsupdec (-6.0, -3.0, "com")){1}));
%! assert (isequal (minus (infsupdec (1.0, 2.0, "com"), infsupdec (5.0, 7.0, "com")), infsupdec (-6.0, -3.0, "com")));
%! assert (isequal (decorationpart (minus (infsupdec (1.0, 2.0, "com"), infsupdec (5.0, 7.0, "com"))){1}, decorationpart (infsupdec (-6.0, -3.0, "com")){1}));
%!test
%! assert (isequal (infsupdec (1.0, 2.0, "com") - infsupdec (5.0, 7.0, "def"), infsupdec (-6.0, -3.0, "def")));
%! assert (isequal (decorationpart (infsupdec (1.0, 2.0, "com") - infsupdec (5.0, 7.0, "def")){1}, decorationpart (infsupdec (-6.0, -3.0, "def")){1}));
%! assert (isequal (minus (infsupdec (1.0, 2.0, "com"), infsupdec (5.0, 7.0, "def")), infsupdec (-6.0, -3.0, "def")));
%! assert (isequal (decorationpart (minus (infsupdec (1.0, 2.0, "com"), infsupdec (5.0, 7.0, "def"))){1}, decorationpart (infsupdec (-6.0, -3.0, "def")){1}));
%!test
%! assert (isequal (infsupdec (-1.0, 2.0, "com") - infsupdec (5.0, 1.797693134862315708e+308, "com"), infsupdec (-inf, -3.0, "dac")));
%! assert (isequal (decorationpart (infsupdec (-1.0, 2.0, "com") - infsupdec (5.0, 1.797693134862315708e+308, "com")){1}, decorationpart (infsupdec (-inf, -3.0, "dac")){1}));
%! assert (isequal (minus (infsupdec (-1.0, 2.0, "com"), infsupdec (5.0, 1.797693134862315708e+308, "com")), infsupdec (-inf, -3.0, "dac")));
%! assert (isequal (decorationpart (minus (infsupdec (-1.0, 2.0, "com"), infsupdec (5.0, 1.797693134862315708e+308, "com"))){1}, decorationpart (infsupdec (-inf, -3.0, "dac")){1}));
%!test
%! assert (isequal (infsupdec (-1.797693134862315708e+308, 2.0, "com") - infsupdec (-1.0, 5.0, "com"), infsupdec (-inf, 3.0, "dac")));
%! assert (isequal (decorationpart (infsupdec (-1.797693134862315708e+308, 2.0, "com") - infsupdec (-1.0, 5.0, "com")){1}, decorationpart (infsupdec (-inf, 3.0, "dac")){1}));
%! assert (isequal (minus (infsupdec (-1.797693134862315708e+308, 2.0, "com"), infsupdec (-1.0, 5.0, "com")), infsupdec (-inf, 3.0, "dac")));
%! assert (isequal (decorationpart (minus (infsupdec (-1.797693134862315708e+308, 2.0, "com"), infsupdec (-1.0, 5.0, "com"))){1}, decorationpart (infsupdec (-inf, 3.0, "dac")){1}));
%!test
%! assert (isequal (infsupdec (1.0, 2.0, "trv") - infsupdec (empty, "trv"), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (infsupdec (1.0, 2.0, "trv") - infsupdec (empty, "trv")){1}, decorationpart (infsupdec (empty, "trv")){1}));
%! assert (isequal (minus (infsupdec (1.0, 2.0, "trv"), infsupdec (empty, "trv")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (minus (infsupdec (1.0, 2.0, "trv"), infsupdec (empty, "trv"))){1}, decorationpart (infsupdec (empty, "trv")){1}));

## minimal_mul_test

%!test
%! assert (isequal (infsup .* infsup, infsup));
%! assert (isequal (times (infsup, infsup), infsup));
%!test
%! assert (isequal (infsup (-1.0, 1.0) .* infsup, infsup));
%! assert (isequal (times (infsup (-1.0, 1.0), infsup), infsup));
%!test
%! assert (isequal (infsup .* infsup (-1.0, 1.0), infsup));
%! assert (isequal (times (infsup, infsup (-1.0, 1.0)), infsup));
%!test
%! assert (isequal (infsup .* infsup (-inf, inf), infsup));
%! assert (isequal (times (infsup, infsup (-inf, inf)), infsup));
%!test
%! assert (isequal (infsup (-inf, inf) .* infsup, infsup));
%! assert (isequal (times (infsup (-inf, inf), infsup), infsup));
%!test
%! assert (isequal (infsup (0.0, 0.0) .* infsup, infsup));
%! assert (isequal (times (infsup (0.0, 0.0), infsup), infsup));
%!test
%! assert (isequal (infsup .* infsup (0.0, 0.0), infsup));
%! assert (isequal (times (infsup, infsup (0.0, 0.0)), infsup));
%!test
%! assert (isequal (infsup (-0.0, -0.0) .* infsup, infsup));
%! assert (isequal (times (infsup (-0.0, -0.0), infsup), infsup));
%!test
%! assert (isequal (infsup .* infsup (-0.0, -0.0), infsup));
%! assert (isequal (times (infsup, infsup (-0.0, -0.0)), infsup));
%!test
%! assert (isequal (infsup (-inf, inf) .* infsup (0.0, 0.0), infsup (0.0, 0.0)));
%! assert (isequal (times (infsup (-inf, inf), infsup (0.0, 0.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (infsup (-inf, inf) .* infsup (-0.0, -0.0), infsup (0.0, 0.0)));
%! assert (isequal (times (infsup (-inf, inf), infsup (-0.0, -0.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (infsup (-inf, inf) .* infsup (-5.0, -1.0), infsup (-inf, inf)));
%! assert (isequal (times (infsup (-inf, inf), infsup (-5.0, -1.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-inf, inf) .* infsup (-5.0, 3.0), infsup (-inf, inf)));
%! assert (isequal (times (infsup (-inf, inf), infsup (-5.0, 3.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-inf, inf) .* infsup (1.0, 3.0), infsup (-inf, inf)));
%! assert (isequal (times (infsup (-inf, inf), infsup (1.0, 3.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-inf, inf) .* infsup (-inf, -1.0), infsup (-inf, inf)));
%! assert (isequal (times (infsup (-inf, inf), infsup (-inf, -1.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-inf, inf) .* infsup (-inf, 3.0), infsup (-inf, inf)));
%! assert (isequal (times (infsup (-inf, inf), infsup (-inf, 3.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-inf, inf) .* infsup (-5.0, inf), infsup (-inf, inf)));
%! assert (isequal (times (infsup (-inf, inf), infsup (-5.0, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-inf, inf) .* infsup (1.0, inf), infsup (-inf, inf)));
%! assert (isequal (times (infsup (-inf, inf), infsup (1.0, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-inf, inf) .* infsup (-inf, inf), infsup (-inf, inf)));
%! assert (isequal (times (infsup (-inf, inf), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (1.0, inf) .* infsup (0.0, 0.0), infsup (0.0, 0.0)));
%! assert (isequal (times (infsup (1.0, inf), infsup (0.0, 0.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (infsup (1.0, inf) .* infsup (-0.0, -0.0), infsup (0.0, 0.0)));
%! assert (isequal (times (infsup (1.0, inf), infsup (-0.0, -0.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (infsup (1.0, inf) .* infsup (-5.0, -1.0), infsup (-inf, -1.0)));
%! assert (isequal (times (infsup (1.0, inf), infsup (-5.0, -1.0)), infsup (-inf, -1.0)));
%!test
%! assert (isequal (infsup (1.0, inf) .* infsup (-5.0, 3.0), infsup (-inf, inf)));
%! assert (isequal (times (infsup (1.0, inf), infsup (-5.0, 3.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (1.0, inf) .* infsup (1.0, 3.0), infsup (1.0, inf)));
%! assert (isequal (times (infsup (1.0, inf), infsup (1.0, 3.0)), infsup (1.0, inf)));
%!test
%! assert (isequal (infsup (1.0, inf) .* infsup (-inf, -1.0), infsup (-inf, -1.0)));
%! assert (isequal (times (infsup (1.0, inf), infsup (-inf, -1.0)), infsup (-inf, -1.0)));
%!test
%! assert (isequal (infsup (1.0, inf) .* infsup (-inf, 3.0), infsup (-inf, inf)));
%! assert (isequal (times (infsup (1.0, inf), infsup (-inf, 3.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (1.0, inf) .* infsup (-5.0, inf), infsup (-inf, inf)));
%! assert (isequal (times (infsup (1.0, inf), infsup (-5.0, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (1.0, inf) .* infsup (1.0, inf), infsup (1.0, inf)));
%! assert (isequal (times (infsup (1.0, inf), infsup (1.0, inf)), infsup (1.0, inf)));
%!test
%! assert (isequal (infsup (1.0, inf) .* infsup (-inf, inf), infsup (-inf, inf)));
%! assert (isequal (times (infsup (1.0, inf), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-1.0, inf) .* infsup (0.0, 0.0), infsup (0.0, 0.0)));
%! assert (isequal (times (infsup (-1.0, inf), infsup (0.0, 0.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (infsup (-1.0, inf) .* infsup (-0.0, -0.0), infsup (0.0, 0.0)));
%! assert (isequal (times (infsup (-1.0, inf), infsup (-0.0, -0.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (infsup (-1.0, inf) .* infsup (-5.0, -1.0), infsup (-inf, 5.0)));
%! assert (isequal (times (infsup (-1.0, inf), infsup (-5.0, -1.0)), infsup (-inf, 5.0)));
%!test
%! assert (isequal (infsup (-1.0, inf) .* infsup (-5.0, 3.0), infsup (-inf, inf)));
%! assert (isequal (times (infsup (-1.0, inf), infsup (-5.0, 3.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-1.0, inf) .* infsup (1.0, 3.0), infsup (-3.0, inf)));
%! assert (isequal (times (infsup (-1.0, inf), infsup (1.0, 3.0)), infsup (-3.0, inf)));
%!test
%! assert (isequal (infsup (-1.0, inf) .* infsup (-inf, -1.0), infsup (-inf, inf)));
%! assert (isequal (times (infsup (-1.0, inf), infsup (-inf, -1.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-1.0, inf) .* infsup (-inf, 3.0), infsup (-inf, inf)));
%! assert (isequal (times (infsup (-1.0, inf), infsup (-inf, 3.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-1.0, inf) .* infsup (-5.0, inf), infsup (-inf, inf)));
%! assert (isequal (times (infsup (-1.0, inf), infsup (-5.0, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-1.0, inf) .* infsup (1.0, inf), infsup (-inf, inf)));
%! assert (isequal (times (infsup (-1.0, inf), infsup (1.0, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-1.0, inf) .* infsup (-inf, inf), infsup (-inf, inf)));
%! assert (isequal (times (infsup (-1.0, inf), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-inf, 3.0) .* infsup (0.0, 0.0), infsup (0.0, 0.0)));
%! assert (isequal (times (infsup (-inf, 3.0), infsup (0.0, 0.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (infsup (-inf, 3.0) .* infsup (-0.0, -0.0), infsup (0.0, 0.0)));
%! assert (isequal (times (infsup (-inf, 3.0), infsup (-0.0, -0.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (infsup (-inf, 3.0) .* infsup (-5.0, -1.0), infsup (-15.0, inf)));
%! assert (isequal (times (infsup (-inf, 3.0), infsup (-5.0, -1.0)), infsup (-15.0, inf)));
%!test
%! assert (isequal (infsup (-inf, 3.0) .* infsup (-5.0, 3.0), infsup (-inf, inf)));
%! assert (isequal (times (infsup (-inf, 3.0), infsup (-5.0, 3.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-inf, 3.0) .* infsup (1.0, 3.0), infsup (-inf, 9.0)));
%! assert (isequal (times (infsup (-inf, 3.0), infsup (1.0, 3.0)), infsup (-inf, 9.0)));
%!test
%! assert (isequal (infsup (-inf, 3.0) .* infsup (-inf, -1.0), infsup (-inf, inf)));
%! assert (isequal (times (infsup (-inf, 3.0), infsup (-inf, -1.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-inf, 3.0) .* infsup (-inf, 3.0), infsup (-inf, inf)));
%! assert (isequal (times (infsup (-inf, 3.0), infsup (-inf, 3.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-inf, 3.0) .* infsup (-5.0, inf), infsup (-inf, inf)));
%! assert (isequal (times (infsup (-inf, 3.0), infsup (-5.0, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-inf, 3.0) .* infsup (1.0, inf), infsup (-inf, inf)));
%! assert (isequal (times (infsup (-inf, 3.0), infsup (1.0, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-inf, 3.0) .* infsup (-inf, inf), infsup (-inf, inf)));
%! assert (isequal (times (infsup (-inf, 3.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-inf, -3.0) .* infsup (0.0, 0.0), infsup (0.0, 0.0)));
%! assert (isequal (times (infsup (-inf, -3.0), infsup (0.0, 0.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (infsup (-inf, -3.0) .* infsup (-0.0, -0.0), infsup (0.0, 0.0)));
%! assert (isequal (times (infsup (-inf, -3.0), infsup (-0.0, -0.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (infsup (-inf, -3.0) .* infsup (-5.0, -1.0), infsup (3.0, inf)));
%! assert (isequal (times (infsup (-inf, -3.0), infsup (-5.0, -1.0)), infsup (3.0, inf)));
%!test
%! assert (isequal (infsup (-inf, -3.0) .* infsup (-5.0, 3.0), infsup (-inf, inf)));
%! assert (isequal (times (infsup (-inf, -3.0), infsup (-5.0, 3.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-inf, -3.0) .* infsup (1.0, 3.0), infsup (-inf, -3.0)));
%! assert (isequal (times (infsup (-inf, -3.0), infsup (1.0, 3.0)), infsup (-inf, -3.0)));
%!test
%! assert (isequal (infsup (-inf, -3.0) .* infsup (-inf, -1.0), infsup (3.0, inf)));
%! assert (isequal (times (infsup (-inf, -3.0), infsup (-inf, -1.0)), infsup (3.0, inf)));
%!test
%! assert (isequal (infsup (-inf, -3.0) .* infsup (-inf, 3.0), infsup (-inf, inf)));
%! assert (isequal (times (infsup (-inf, -3.0), infsup (-inf, 3.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-inf, -3.0) .* infsup (-5.0, inf), infsup (-inf, inf)));
%! assert (isequal (times (infsup (-inf, -3.0), infsup (-5.0, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-inf, -3.0) .* infsup (1.0, inf), infsup (-inf, -3.0)));
%! assert (isequal (times (infsup (-inf, -3.0), infsup (1.0, inf)), infsup (-inf, -3.0)));
%!test
%! assert (isequal (infsup (-inf, -3.0) .* infsup (-inf, inf), infsup (-inf, inf)));
%! assert (isequal (times (infsup (-inf, -3.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (0.0, 0.0) .* infsup (0.0, 0.0), infsup (0.0, 0.0)));
%! assert (isequal (times (infsup (0.0, 0.0), infsup (0.0, 0.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (infsup (0.0, 0.0) .* infsup (-0.0, -0.0), infsup (0.0, 0.0)));
%! assert (isequal (times (infsup (0.0, 0.0), infsup (-0.0, -0.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (infsup (0.0, 0.0) .* infsup (-5.0, -1.0), infsup (0.0, 0.0)));
%! assert (isequal (times (infsup (0.0, 0.0), infsup (-5.0, -1.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (infsup (0.0, 0.0) .* infsup (-5.0, 3.0), infsup (0.0, 0.0)));
%! assert (isequal (times (infsup (0.0, 0.0), infsup (-5.0, 3.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (infsup (0.0, 0.0) .* infsup (1.0, 3.0), infsup (0.0, 0.0)));
%! assert (isequal (times (infsup (0.0, 0.0), infsup (1.0, 3.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (infsup (0.0, 0.0) .* infsup (-inf, -1.0), infsup (0.0, 0.0)));
%! assert (isequal (times (infsup (0.0, 0.0), infsup (-inf, -1.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (infsup (0.0, 0.0) .* infsup (-inf, 3.0), infsup (0.0, 0.0)));
%! assert (isequal (times (infsup (0.0, 0.0), infsup (-inf, 3.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (infsup (0.0, 0.0) .* infsup (-5.0, inf), infsup (0.0, 0.0)));
%! assert (isequal (times (infsup (0.0, 0.0), infsup (-5.0, inf)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (infsup (0.0, 0.0) .* infsup (1.0, inf), infsup (0.0, 0.0)));
%! assert (isequal (times (infsup (0.0, 0.0), infsup (1.0, inf)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (infsup (0.0, 0.0) .* infsup (-inf, inf), infsup (0.0, 0.0)));
%! assert (isequal (times (infsup (0.0, 0.0), infsup (-inf, inf)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (infsup (-0.0, -0.0) .* infsup (0.0, 0.0), infsup (0.0, 0.0)));
%! assert (isequal (times (infsup (-0.0, -0.0), infsup (0.0, 0.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (infsup (-0.0, -0.0) .* infsup (-0.0, -0.0), infsup (0.0, 0.0)));
%! assert (isequal (times (infsup (-0.0, -0.0), infsup (-0.0, -0.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (infsup (-0.0, -0.0) .* infsup (-5.0, -1.0), infsup (0.0, 0.0)));
%! assert (isequal (times (infsup (-0.0, -0.0), infsup (-5.0, -1.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (infsup (-0.0, -0.0) .* infsup (-5.0, 3.0), infsup (0.0, 0.0)));
%! assert (isequal (times (infsup (-0.0, -0.0), infsup (-5.0, 3.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (infsup (-0.0, -0.0) .* infsup (1.0, 3.0), infsup (0.0, 0.0)));
%! assert (isequal (times (infsup (-0.0, -0.0), infsup (1.0, 3.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (infsup (-0.0, -0.0) .* infsup (-inf, -1.0), infsup (0.0, 0.0)));
%! assert (isequal (times (infsup (-0.0, -0.0), infsup (-inf, -1.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (infsup (-0.0, -0.0) .* infsup (-inf, 3.0), infsup (0.0, 0.0)));
%! assert (isequal (times (infsup (-0.0, -0.0), infsup (-inf, 3.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (infsup (-0.0, -0.0) .* infsup (-5.0, inf), infsup (0.0, 0.0)));
%! assert (isequal (times (infsup (-0.0, -0.0), infsup (-5.0, inf)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (infsup (-0.0, -0.0) .* infsup (1.0, inf), infsup (0.0, 0.0)));
%! assert (isequal (times (infsup (-0.0, -0.0), infsup (1.0, inf)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (infsup (-0.0, -0.0) .* infsup (-inf, inf), infsup (0.0, 0.0)));
%! assert (isequal (times (infsup (-0.0, -0.0), infsup (-inf, inf)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (infsup (1.0, 5.0) .* infsup (0.0, 0.0), infsup (0.0, 0.0)));
%! assert (isequal (times (infsup (1.0, 5.0), infsup (0.0, 0.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (infsup (1.0, 5.0) .* infsup (-0.0, -0.0), infsup (0.0, 0.0)));
%! assert (isequal (times (infsup (1.0, 5.0), infsup (-0.0, -0.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (infsup (1.0, 5.0) .* infsup (-5.0, -1.0), infsup (-25.0, -1.0)));
%! assert (isequal (times (infsup (1.0, 5.0), infsup (-5.0, -1.0)), infsup (-25.0, -1.0)));
%!test
%! assert (isequal (infsup (1.0, 5.0) .* infsup (-5.0, 3.0), infsup (-25.0, 15.0)));
%! assert (isequal (times (infsup (1.0, 5.0), infsup (-5.0, 3.0)), infsup (-25.0, 15.0)));
%!test
%! assert (isequal (infsup (1.0, 5.0) .* infsup (1.0, 3.0), infsup (1.0, 15.0)));
%! assert (isequal (times (infsup (1.0, 5.0), infsup (1.0, 3.0)), infsup (1.0, 15.0)));
%!test
%! assert (isequal (infsup (1.0, 5.0) .* infsup (-inf, -1.0), infsup (-inf, -1.0)));
%! assert (isequal (times (infsup (1.0, 5.0), infsup (-inf, -1.0)), infsup (-inf, -1.0)));
%!test
%! assert (isequal (infsup (1.0, 5.0) .* infsup (-inf, 3.0), infsup (-inf, 15.0)));
%! assert (isequal (times (infsup (1.0, 5.0), infsup (-inf, 3.0)), infsup (-inf, 15.0)));
%!test
%! assert (isequal (infsup (1.0, 5.0) .* infsup (-5.0, inf), infsup (-25.0, inf)));
%! assert (isequal (times (infsup (1.0, 5.0), infsup (-5.0, inf)), infsup (-25.0, inf)));
%!test
%! assert (isequal (infsup (1.0, 5.0) .* infsup (1.0, inf), infsup (1.0, inf)));
%! assert (isequal (times (infsup (1.0, 5.0), infsup (1.0, inf)), infsup (1.0, inf)));
%!test
%! assert (isequal (infsup (1.0, 5.0) .* infsup (-inf, inf), infsup (-inf, inf)));
%! assert (isequal (times (infsup (1.0, 5.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-1.0, 5.0) .* infsup (0.0, 0.0), infsup (0.0, 0.0)));
%! assert (isequal (times (infsup (-1.0, 5.0), infsup (0.0, 0.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (infsup (-1.0, 5.0) .* infsup (-0.0, -0.0), infsup (0.0, 0.0)));
%! assert (isequal (times (infsup (-1.0, 5.0), infsup (-0.0, -0.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (infsup (-1.0, 5.0) .* infsup (-5.0, -1.0), infsup (-25.0, 5.0)));
%! assert (isequal (times (infsup (-1.0, 5.0), infsup (-5.0, -1.0)), infsup (-25.0, 5.0)));
%!#min max
%!test
%! assert (isequal (infsup (-1.0, 5.0) .* infsup (-5.0, 3.0), infsup (-25.0, 15.0)));
%! assert (isequal (times (infsup (-1.0, 5.0), infsup (-5.0, 3.0)), infsup (-25.0, 15.0)));
%!test
%! assert (isequal (infsup (-10.0, 2.0) .* infsup (-5.0, 3.0), infsup (-30.0, 50.0)));
%! assert (isequal (times (infsup (-10.0, 2.0), infsup (-5.0, 3.0)), infsup (-30.0, 50.0)));
%!test
%! assert (isequal (infsup (-1.0, 5.0) .* infsup (-1.0, 10.0), infsup (-10.0, 50.0)));
%! assert (isequal (times (infsup (-1.0, 5.0), infsup (-1.0, 10.0)), infsup (-10.0, 50.0)));
%!test
%! assert (isequal (infsup (-2.0, 2.0) .* infsup (-5.0, 3.0), infsup (-10.0, 10.0)));
%! assert (isequal (times (infsup (-2.0, 2.0), infsup (-5.0, 3.0)), infsup (-10.0, 10.0)));
%!#end min max
%!test
%! assert (isequal (infsup (-1.0, 5.0) .* infsup (1.0, 3.0), infsup (-3.0, 15.0)));
%! assert (isequal (times (infsup (-1.0, 5.0), infsup (1.0, 3.0)), infsup (-3.0, 15.0)));
%!test
%! assert (isequal (infsup (-1.0, 5.0) .* infsup (-inf, -1.0), infsup (-inf, inf)));
%! assert (isequal (times (infsup (-1.0, 5.0), infsup (-inf, -1.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-1.0, 5.0) .* infsup (-inf, 3.0), infsup (-inf, inf)));
%! assert (isequal (times (infsup (-1.0, 5.0), infsup (-inf, 3.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-1.0, 5.0) .* infsup (-5.0, inf), infsup (-inf, inf)));
%! assert (isequal (times (infsup (-1.0, 5.0), infsup (-5.0, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-1.0, 5.0) .* infsup (1.0, inf), infsup (-inf, inf)));
%! assert (isequal (times (infsup (-1.0, 5.0), infsup (1.0, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-1.0, 5.0) .* infsup (-inf, inf), infsup (-inf, inf)));
%! assert (isequal (times (infsup (-1.0, 5.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-10.0, -5.0) .* infsup (0.0, 0.0), infsup (0.0, 0.0)));
%! assert (isequal (times (infsup (-10.0, -5.0), infsup (0.0, 0.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (infsup (-10.0, -5.0) .* infsup (-0.0, -0.0), infsup (0.0, 0.0)));
%! assert (isequal (times (infsup (-10.0, -5.0), infsup (-0.0, -0.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (infsup (-10.0, -5.0) .* infsup (-5.0, -1.0), infsup (5.0, 50.0)));
%! assert (isequal (times (infsup (-10.0, -5.0), infsup (-5.0, -1.0)), infsup (5.0, 50.0)));
%!test
%! assert (isequal (infsup (-10.0, -5.0) .* infsup (-5.0, 3.0), infsup (-30.0, 50.0)));
%! assert (isequal (times (infsup (-10.0, -5.0), infsup (-5.0, 3.0)), infsup (-30.0, 50.0)));
%!test
%! assert (isequal (infsup (-10.0, -5.0) .* infsup (1.0, 3.0), infsup (-30.0, -5.0)));
%! assert (isequal (times (infsup (-10.0, -5.0), infsup (1.0, 3.0)), infsup (-30.0, -5.0)));
%!test
%! assert (isequal (infsup (-10.0, -5.0) .* infsup (-inf, -1.0), infsup (5.0, inf)));
%! assert (isequal (times (infsup (-10.0, -5.0), infsup (-inf, -1.0)), infsup (5.0, inf)));
%!test
%! assert (isequal (infsup (-10.0, -5.0) .* infsup (-inf, 3.0), infsup (-30.0, inf)));
%! assert (isequal (times (infsup (-10.0, -5.0), infsup (-inf, 3.0)), infsup (-30.0, inf)));
%!test
%! assert (isequal (infsup (-10.0, -5.0) .* infsup (-5.0, inf), infsup (-inf, 50.0)));
%! assert (isequal (times (infsup (-10.0, -5.0), infsup (-5.0, inf)), infsup (-inf, 50.0)));
%!test
%! assert (isequal (infsup (-10.0, -5.0) .* infsup (1.0, inf), infsup (-inf, -5.0)));
%! assert (isequal (times (infsup (-10.0, -5.0), infsup (1.0, inf)), infsup (-inf, -5.0)));
%!test
%! assert (isequal (infsup (-10.0, -5.0) .* infsup (-inf, inf), infsup (-inf, inf)));
%! assert (isequal (times (infsup (-10.0, -5.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (1.000000000000000056e-01, 1.999999999999996447e+00) .* infsup (-1.999999999999996447e+00, inf), infsup (-3.999999999999986233e+00, inf)));
%! assert (isequal (times (infsup (1.000000000000000056e-01, 1.999999999999996447e+00), infsup (-1.999999999999996447e+00, inf)), infsup (-3.999999999999986233e+00, inf)));
%!test
%! assert (isequal (infsup (-1.000000000000000056e-01, 1.999999999999996447e+00) .* infsup (-1.999999999999996447e+00, -1.000000000000000056e-01), infsup (-3.999999999999986233e+00, 1.999999999999996780e-01)));
%! assert (isequal (times (infsup (-1.000000000000000056e-01, 1.999999999999996447e+00), infsup (-1.999999999999996447e+00, -1.000000000000000056e-01)), infsup (-3.999999999999986233e+00, 1.999999999999996780e-01)));
%!test
%! assert (isequal (infsup (-1.000000000000000056e-01, 1.000000000000000056e-01) .* infsup (-1.999999999999996447e+00, 1.000000000000000056e-01), infsup (-1.999999999999996780e-01, 1.999999999999996780e-01)));
%! assert (isequal (times (infsup (-1.000000000000000056e-01, 1.000000000000000056e-01), infsup (-1.999999999999996447e+00, 1.000000000000000056e-01)), infsup (-1.999999999999996780e-01, 1.999999999999996780e-01)));
%!test
%! assert (isequal (infsup (-1.999999999999996447e+00, -1.000000000000000056e-01) .* infsup (1.000000000000000056e-01, 1.999999999999996447e+00), infsup (-3.999999999999986233e+00, -1.000000000000000021e-02)));
%! assert (isequal (times (infsup (-1.999999999999996447e+00, -1.000000000000000056e-01), infsup (1.000000000000000056e-01, 1.999999999999996447e+00)), infsup (-3.999999999999986233e+00, -1.000000000000000021e-02)));

## minimal_mul_dec_test

%!test
%! assert (isequal (infsupdec (1.0, 2.0, "com") .* infsupdec (5.0, 7.0, "com"), infsupdec (5.0, 14.0, "com")));
%! assert (isequal (decorationpart (infsupdec (1.0, 2.0, "com") .* infsupdec (5.0, 7.0, "com")){1}, decorationpart (infsupdec (5.0, 14.0, "com")){1}));
%! assert (isequal (times (infsupdec (1.0, 2.0, "com"), infsupdec (5.0, 7.0, "com")), infsupdec (5.0, 14.0, "com")));
%! assert (isequal (decorationpart (times (infsupdec (1.0, 2.0, "com"), infsupdec (5.0, 7.0, "com"))){1}, decorationpart (infsupdec (5.0, 14.0, "com")){1}));
%!test
%! assert (isequal (infsupdec (1.0, 2.0, "com") .* infsupdec (5.0, 7.0, "def"), infsupdec (5.0, 14.0, "def")));
%! assert (isequal (decorationpart (infsupdec (1.0, 2.0, "com") .* infsupdec (5.0, 7.0, "def")){1}, decorationpart (infsupdec (5.0, 14.0, "def")){1}));
%! assert (isequal (times (infsupdec (1.0, 2.0, "com"), infsupdec (5.0, 7.0, "def")), infsupdec (5.0, 14.0, "def")));
%! assert (isequal (decorationpart (times (infsupdec (1.0, 2.0, "com"), infsupdec (5.0, 7.0, "def"))){1}, decorationpart (infsupdec (5.0, 14.0, "def")){1}));
%!test
%! assert (isequal (infsupdec (1.0, 2.0, "com") .* infsupdec (5.0, 1.797693134862315708e+308, "com"), infsupdec (5.0, inf, "dac")));
%! assert (isequal (decorationpart (infsupdec (1.0, 2.0, "com") .* infsupdec (5.0, 1.797693134862315708e+308, "com")){1}, decorationpart (infsupdec (5.0, inf, "dac")){1}));
%! assert (isequal (times (infsupdec (1.0, 2.0, "com"), infsupdec (5.0, 1.797693134862315708e+308, "com")), infsupdec (5.0, inf, "dac")));
%! assert (isequal (decorationpart (times (infsupdec (1.0, 2.0, "com"), infsupdec (5.0, 1.797693134862315708e+308, "com"))){1}, decorationpart (infsupdec (5.0, inf, "dac")){1}));
%!test
%! assert (isequal (infsupdec (-1.797693134862315708e+308, 2.0, "com") .* infsupdec (-1.0, 5.0, "com"), infsupdec (-inf, 1.797693134862315708e+308, "dac")));
%! assert (isequal (decorationpart (infsupdec (-1.797693134862315708e+308, 2.0, "com") .* infsupdec (-1.0, 5.0, "com")){1}, decorationpart (infsupdec (-inf, 1.797693134862315708e+308, "dac")){1}));
%! assert (isequal (times (infsupdec (-1.797693134862315708e+308, 2.0, "com"), infsupdec (-1.0, 5.0, "com")), infsupdec (-inf, 1.797693134862315708e+308, "dac")));
%! assert (isequal (decorationpart (times (infsupdec (-1.797693134862315708e+308, 2.0, "com"), infsupdec (-1.0, 5.0, "com"))){1}, decorationpart (infsupdec (-inf, 1.797693134862315708e+308, "dac")){1}));
%!test
%! assert (isequal (infsupdec (1.0, 2.0, "trv") .* infsupdec (empty, "trv"), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (infsupdec (1.0, 2.0, "trv") .* infsupdec (empty, "trv")){1}, decorationpart (infsupdec (empty, "trv")){1}));
%! assert (isequal (times (infsupdec (1.0, 2.0, "trv"), infsupdec (empty, "trv")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (times (infsupdec (1.0, 2.0, "trv"), infsupdec (empty, "trv"))){1}, decorationpart (infsupdec (empty, "trv")){1}));

## minimal_div_test

%!test
%! assert (isequal (infsup ./ infsup, infsup));
%! assert (isequal (rdivide (infsup, infsup), infsup));
%!test
%! assert (isequal (infsup (-1.0, 1.0) ./ infsup, infsup));
%! assert (isequal (rdivide (infsup (-1.0, 1.0), infsup), infsup));
%!test
%! assert (isequal (infsup ./ infsup (-1.0, 1.0), infsup));
%! assert (isequal (rdivide (infsup, infsup (-1.0, 1.0)), infsup));
%!test
%! assert (isequal (infsup ./ infsup (0.1, 1.0), infsup));
%! assert (isequal (rdivide (infsup, infsup (0.1, 1.0)), infsup));
%!test
%! assert (isequal (infsup ./ infsup (-1.0, -0.1), infsup));
%! assert (isequal (rdivide (infsup, infsup (-1.0, -0.1)), infsup));
%!test
%! assert (isequal (infsup ./ infsup (-inf, inf), infsup));
%! assert (isequal (rdivide (infsup, infsup (-inf, inf)), infsup));
%!test
%! assert (isequal (infsup (-inf, inf) ./ infsup, infsup));
%! assert (isequal (rdivide (infsup (-inf, inf), infsup), infsup));
%!test
%! assert (isequal (infsup (0.0, 0.0) ./ infsup, infsup));
%! assert (isequal (rdivide (infsup (0.0, 0.0), infsup), infsup));
%!test
%! assert (isequal (infsup ./ infsup (0.0, 0.0), infsup));
%! assert (isequal (rdivide (infsup, infsup (0.0, 0.0)), infsup));
%!test
%! assert (isequal (infsup (-0.0, -0.0) ./ infsup, infsup));
%! assert (isequal (rdivide (infsup (-0.0, -0.0), infsup), infsup));
%!test
%! assert (isequal (infsup ./ infsup (-0.0, -0.0), infsup));
%! assert (isequal (rdivide (infsup, infsup (-0.0, -0.0)), infsup));
%!test
%! assert (isequal (infsup (-inf, inf) ./ infsup (-5.0, -3.0), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (-inf, inf), infsup (-5.0, -3.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-inf, inf) ./ infsup (3.0, 5.0), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (-inf, inf), infsup (3.0, 5.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-inf, inf) ./ infsup (-inf, -3.0), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (-inf, inf), infsup (-inf, -3.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-inf, inf) ./ infsup (3.0, inf), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (-inf, inf), infsup (3.0, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-inf, inf) ./ infsup (0.0, 0.0), infsup));
%! assert (isequal (rdivide (infsup (-inf, inf), infsup (0.0, 0.0)), infsup));
%!test
%! assert (isequal (infsup (-inf, inf) ./ infsup (-0.0, -0.0), infsup));
%! assert (isequal (rdivide (infsup (-inf, inf), infsup (-0.0, -0.0)), infsup));
%!test
%! assert (isequal (infsup (-inf, inf) ./ infsup (-3.0, 0.0), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (-inf, inf), infsup (-3.0, 0.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-inf, inf) ./ infsup (-3.0, -0.0), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (-inf, inf), infsup (-3.0, -0.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-inf, inf) ./ infsup (-3.0, 3.0), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (-inf, inf), infsup (-3.0, 3.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-inf, inf) ./ infsup (0.0, 3.0), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (-inf, inf), infsup (0.0, 3.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-inf, inf) ./ infsup (-inf, 0.0), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (-inf, inf), infsup (-inf, 0.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-inf, inf) ./ infsup (-0.0, 3.0), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (-inf, inf), infsup (-0.0, 3.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-inf, inf) ./ infsup (-inf, -0.0), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (-inf, inf), infsup (-inf, -0.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-inf, inf) ./ infsup (-inf, 3.0), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (-inf, inf), infsup (-inf, 3.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-inf, inf) ./ infsup (-3.0, inf), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (-inf, inf), infsup (-3.0, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-inf, inf) ./ infsup (0.0, inf), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (-inf, inf), infsup (0.0, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-inf, inf) ./ infsup (-0.0, inf), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (-inf, inf), infsup (-0.0, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-inf, inf) ./ infsup (-inf, inf), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (-inf, inf), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-30.0, -15.0) ./ infsup (-5.0, -3.0), infsup (3.0, 10.0)));
%! assert (isequal (rdivide (infsup (-30.0, -15.0), infsup (-5.0, -3.0)), infsup (3.0, 10.0)));
%!test
%! assert (isequal (infsup (-30.0, -15.0) ./ infsup (3.0, 5.0), infsup (-10.0, -3.0)));
%! assert (isequal (rdivide (infsup (-30.0, -15.0), infsup (3.0, 5.0)), infsup (-10.0, -3.0)));
%!test
%! assert (isequal (infsup (-30.0, -15.0) ./ infsup (-inf, -3.0), infsup (0.0, 10.0)));
%! assert (isequal (rdivide (infsup (-30.0, -15.0), infsup (-inf, -3.0)), infsup (0.0, 10.0)));
%!test
%! assert (isequal (infsup (-30.0, -15.0) ./ infsup (3.0, inf), infsup (-10.0, 0.0)));
%! assert (isequal (rdivide (infsup (-30.0, -15.0), infsup (3.0, inf)), infsup (-10.0, 0.0)));
%!test
%! assert (isequal (infsup (-30.0, -15.0) ./ infsup (0.0, 0.0), infsup));
%! assert (isequal (rdivide (infsup (-30.0, -15.0), infsup (0.0, 0.0)), infsup));
%!test
%! assert (isequal (infsup (-30.0, -15.0) ./ infsup (-3.0, 0.0), infsup (5.0, inf)));
%! assert (isequal (rdivide (infsup (-30.0, -15.0), infsup (-3.0, 0.0)), infsup (5.0, inf)));
%!test
%! assert (isequal (infsup (-30.0, -15.0) ./ infsup (-0.0, -0.0), infsup));
%! assert (isequal (rdivide (infsup (-30.0, -15.0), infsup (-0.0, -0.0)), infsup));
%!test
%! assert (isequal (infsup (-30.0, -15.0) ./ infsup (-3.0, -0.0), infsup (5.0, inf)));
%! assert (isequal (rdivide (infsup (-30.0, -15.0), infsup (-3.0, -0.0)), infsup (5.0, inf)));
%!test
%! assert (isequal (infsup (-30.0, -15.0) ./ infsup (-3.0, 3.0), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (-30.0, -15.0), infsup (-3.0, 3.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-30.0, -15.0) ./ infsup (0.0, 3.0), infsup (-inf, -5.0)));
%! assert (isequal (rdivide (infsup (-30.0, -15.0), infsup (0.0, 3.0)), infsup (-inf, -5.0)));
%!test
%! assert (isequal (infsup (-30.0, -15.0) ./ infsup (-inf, 0.0), infsup (0.0, inf)));
%! assert (isequal (rdivide (infsup (-30.0, -15.0), infsup (-inf, 0.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (infsup (-30.0, -15.0) ./ infsup (-0.0, 3.0), infsup (-inf, -5.0)));
%! assert (isequal (rdivide (infsup (-30.0, -15.0), infsup (-0.0, 3.0)), infsup (-inf, -5.0)));
%!test
%! assert (isequal (infsup (-30.0, -15.0) ./ infsup (-inf, -0.0), infsup (0.0, inf)));
%! assert (isequal (rdivide (infsup (-30.0, -15.0), infsup (-inf, -0.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (infsup (-30.0, -15.0) ./ infsup (-inf, 3.0), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (-30.0, -15.0), infsup (-inf, 3.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-30.0, -15.0) ./ infsup (-3.0, inf), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (-30.0, -15.0), infsup (-3.0, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-30.0, -15.0) ./ infsup (0.0, inf), infsup (-inf, 0.0)));
%! assert (isequal (rdivide (infsup (-30.0, -15.0), infsup (0.0, inf)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (infsup (-30.0, -15.0) ./ infsup (-0.0, inf), infsup (-inf, 0.0)));
%! assert (isequal (rdivide (infsup (-30.0, -15.0), infsup (-0.0, inf)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (infsup (-30.0, -15.0) ./ infsup (-inf, inf), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (-30.0, -15.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-30.0, 15.0) ./ infsup (-5.0, -3.0), infsup (-5.0, 10.0)));
%! assert (isequal (rdivide (infsup (-30.0, 15.0), infsup (-5.0, -3.0)), infsup (-5.0, 10.0)));
%!test
%! assert (isequal (infsup (-30.0, 15.0) ./ infsup (3.0, 5.0), infsup (-10.0, 5.0)));
%! assert (isequal (rdivide (infsup (-30.0, 15.0), infsup (3.0, 5.0)), infsup (-10.0, 5.0)));
%!test
%! assert (isequal (infsup (-30.0, 15.0) ./ infsup (-inf, -3.0), infsup (-5.0, 10.0)));
%! assert (isequal (rdivide (infsup (-30.0, 15.0), infsup (-inf, -3.0)), infsup (-5.0, 10.0)));
%!test
%! assert (isequal (infsup (-30.0, 15.0) ./ infsup (3.0, inf), infsup (-10.0, 5.0)));
%! assert (isequal (rdivide (infsup (-30.0, 15.0), infsup (3.0, inf)), infsup (-10.0, 5.0)));
%!test
%! assert (isequal (infsup (-30.0, 15.0) ./ infsup (0.0, 0.0), infsup));
%! assert (isequal (rdivide (infsup (-30.0, 15.0), infsup (0.0, 0.0)), infsup));
%!test
%! assert (isequal (infsup (-30.0, 15.0) ./ infsup (-0.0, -0.0), infsup));
%! assert (isequal (rdivide (infsup (-30.0, 15.0), infsup (-0.0, -0.0)), infsup));
%!test
%! assert (isequal (infsup (-30.0, 15.0) ./ infsup (-3.0, 0.0), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (-30.0, 15.0), infsup (-3.0, 0.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-30.0, 15.0) ./ infsup (-3.0, -0.0), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (-30.0, 15.0), infsup (-3.0, -0.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-30.0, 15.0) ./ infsup (-3.0, 3.0), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (-30.0, 15.0), infsup (-3.0, 3.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-30.0, 15.0) ./ infsup (0.0, 3.0), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (-30.0, 15.0), infsup (0.0, 3.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-30.0, 15.0) ./ infsup (-inf, 0.0), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (-30.0, 15.0), infsup (-inf, 0.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-30.0, 15.0) ./ infsup (-0.0, 3.0), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (-30.0, 15.0), infsup (-0.0, 3.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-30.0, 15.0) ./ infsup (-inf, -0.0), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (-30.0, 15.0), infsup (-inf, -0.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-30.0, 15.0) ./ infsup (-inf, 3.0), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (-30.0, 15.0), infsup (-inf, 3.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-30.0, 15.0) ./ infsup (-3.0, inf), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (-30.0, 15.0), infsup (-3.0, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-30.0, 15.0) ./ infsup (0.0, inf), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (-30.0, 15.0), infsup (0.0, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-30.0, 15.0) ./ infsup (-0.0, inf), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (-30.0, 15.0), infsup (-0.0, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-30.0, 15.0) ./ infsup (-inf, inf), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (-30.0, 15.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (15.0, 30.0) ./ infsup (-5.0, -3.0), infsup (-10.0, -3.0)));
%! assert (isequal (rdivide (infsup (15.0, 30.0), infsup (-5.0, -3.0)), infsup (-10.0, -3.0)));
%!test
%! assert (isequal (infsup (15.0, 30.0) ./ infsup (3.0, 5.0), infsup (3.0, 10.0)));
%! assert (isequal (rdivide (infsup (15.0, 30.0), infsup (3.0, 5.0)), infsup (3.0, 10.0)));
%!test
%! assert (isequal (infsup (15.0, 30.0) ./ infsup (-inf, -3.0), infsup (-10.0, 0.0)));
%! assert (isequal (rdivide (infsup (15.0, 30.0), infsup (-inf, -3.0)), infsup (-10.0, 0.0)));
%!test
%! assert (isequal (infsup (15.0, 30.0) ./ infsup (3.0, inf), infsup (0.0, 10.0)));
%! assert (isequal (rdivide (infsup (15.0, 30.0), infsup (3.0, inf)), infsup (0.0, 10.0)));
%!test
%! assert (isequal (infsup (15.0, 30.0) ./ infsup (0.0, 0.0), infsup));
%! assert (isequal (rdivide (infsup (15.0, 30.0), infsup (0.0, 0.0)), infsup));
%!test
%! assert (isequal (infsup (15.0, 30.0) ./ infsup (-3.0, 0.0), infsup (-inf, -5.0)));
%! assert (isequal (rdivide (infsup (15.0, 30.0), infsup (-3.0, 0.0)), infsup (-inf, -5.0)));
%!test
%! assert (isequal (infsup (15.0, 30.0) ./ infsup (-0.0, -0.0), infsup));
%! assert (isequal (rdivide (infsup (15.0, 30.0), infsup (-0.0, -0.0)), infsup));
%!test
%! assert (isequal (infsup (15.0, 30.0) ./ infsup (-3.0, -0.0), infsup (-inf, -5.0)));
%! assert (isequal (rdivide (infsup (15.0, 30.0), infsup (-3.0, -0.0)), infsup (-inf, -5.0)));
%!test
%! assert (isequal (infsup (15.0, 30.0) ./ infsup (-3.0, 3.0), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (15.0, 30.0), infsup (-3.0, 3.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (15.0, 30.0) ./ infsup (0.0, 3.0), infsup (5.0, inf)));
%! assert (isequal (rdivide (infsup (15.0, 30.0), infsup (0.0, 3.0)), infsup (5.0, inf)));
%!test
%! assert (isequal (infsup (15.0, 30.0) ./ infsup (-inf, 0.0), infsup (-inf, 0.0)));
%! assert (isequal (rdivide (infsup (15.0, 30.0), infsup (-inf, 0.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (infsup (15.0, 30.0) ./ infsup (-0.0, 3.0), infsup (5.0, inf)));
%! assert (isequal (rdivide (infsup (15.0, 30.0), infsup (-0.0, 3.0)), infsup (5.0, inf)));
%!test
%! assert (isequal (infsup (15.0, 30.0) ./ infsup (-inf, -0.0), infsup (-inf, 0.0)));
%! assert (isequal (rdivide (infsup (15.0, 30.0), infsup (-inf, -0.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (infsup (15.0, 30.0) ./ infsup (-inf, 3.0), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (15.0, 30.0), infsup (-inf, 3.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (15.0, 30.0) ./ infsup (-3.0, inf), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (15.0, 30.0), infsup (-3.0, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (15.0, 30.0) ./ infsup (0.0, inf), infsup (0.0, inf)));
%! assert (isequal (rdivide (infsup (15.0, 30.0), infsup (0.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (infsup (15.0, 30.0) ./ infsup (-0.0, inf), infsup (0.0, inf)));
%! assert (isequal (rdivide (infsup (15.0, 30.0), infsup (-0.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (infsup (15.0, 30.0) ./ infsup (-inf, inf), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (15.0, 30.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (0.0, 0.0) ./ infsup (-5.0, -3.0), infsup (0.0, 0.0)));
%! assert (isequal (rdivide (infsup (0.0, 0.0), infsup (-5.0, -3.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (infsup (0.0, 0.0) ./ infsup (3.0, 5.0), infsup (0.0, 0.0)));
%! assert (isequal (rdivide (infsup (0.0, 0.0), infsup (3.0, 5.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (infsup (0.0, 0.0) ./ infsup (-inf, -3.0), infsup (0.0, 0.0)));
%! assert (isequal (rdivide (infsup (0.0, 0.0), infsup (-inf, -3.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (infsup (0.0, 0.0) ./ infsup (3.0, inf), infsup (0.0, 0.0)));
%! assert (isequal (rdivide (infsup (0.0, 0.0), infsup (3.0, inf)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (infsup (0.0, 0.0) ./ infsup (0.0, 0.0), infsup));
%! assert (isequal (rdivide (infsup (0.0, 0.0), infsup (0.0, 0.0)), infsup));
%!test
%! assert (isequal (infsup (0.0, 0.0) ./ infsup (-3.0, 0.0), infsup (0.0, 0.0)));
%! assert (isequal (rdivide (infsup (0.0, 0.0), infsup (-3.0, 0.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (infsup (0.0, 0.0) ./ infsup (-0.0, -0.0), infsup));
%! assert (isequal (rdivide (infsup (0.0, 0.0), infsup (-0.0, -0.0)), infsup));
%!test
%! assert (isequal (infsup (0.0, 0.0) ./ infsup (-3.0, -0.0), infsup (0.0, 0.0)));
%! assert (isequal (rdivide (infsup (0.0, 0.0), infsup (-3.0, -0.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (infsup (0.0, 0.0) ./ infsup (-3.0, 3.0), infsup (0.0, 0.0)));
%! assert (isequal (rdivide (infsup (0.0, 0.0), infsup (-3.0, 3.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (infsup (0.0, 0.0) ./ infsup (0.0, 3.0), infsup (0.0, 0.0)));
%! assert (isequal (rdivide (infsup (0.0, 0.0), infsup (0.0, 3.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (infsup (0.0, 0.0) ./ infsup (-inf, 0.0), infsup (0.0, 0.0)));
%! assert (isequal (rdivide (infsup (0.0, 0.0), infsup (-inf, 0.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (infsup (0.0, 0.0) ./ infsup (-0.0, 3.0), infsup (0.0, 0.0)));
%! assert (isequal (rdivide (infsup (0.0, 0.0), infsup (-0.0, 3.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (infsup (0.0, 0.0) ./ infsup (-inf, -0.0), infsup (0.0, 0.0)));
%! assert (isequal (rdivide (infsup (0.0, 0.0), infsup (-inf, -0.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (infsup (0.0, 0.0) ./ infsup (-inf, 3.0), infsup (0.0, 0.0)));
%! assert (isequal (rdivide (infsup (0.0, 0.0), infsup (-inf, 3.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (infsup (0.0, 0.0) ./ infsup (-3.0, inf), infsup (0.0, 0.0)));
%! assert (isequal (rdivide (infsup (0.0, 0.0), infsup (-3.0, inf)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (infsup (0.0, 0.0) ./ infsup (0.0, inf), infsup (0.0, 0.0)));
%! assert (isequal (rdivide (infsup (0.0, 0.0), infsup (0.0, inf)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (infsup (0.0, 0.0) ./ infsup (-0.0, inf), infsup (0.0, 0.0)));
%! assert (isequal (rdivide (infsup (0.0, 0.0), infsup (-0.0, inf)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (infsup (0.0, 0.0) ./ infsup (-inf, inf), infsup (0.0, 0.0)));
%! assert (isequal (rdivide (infsup (0.0, 0.0), infsup (-inf, inf)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (infsup (-0.0, -0.0) ./ infsup (-5.0, -3.0), infsup (0.0, 0.0)));
%! assert (isequal (rdivide (infsup (-0.0, -0.0), infsup (-5.0, -3.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (infsup (-0.0, -0.0) ./ infsup (3.0, 5.0), infsup (0.0, 0.0)));
%! assert (isequal (rdivide (infsup (-0.0, -0.0), infsup (3.0, 5.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (infsup (-0.0, -0.0) ./ infsup (-inf, -3.0), infsup (0.0, 0.0)));
%! assert (isequal (rdivide (infsup (-0.0, -0.0), infsup (-inf, -3.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (infsup (-0.0, -0.0) ./ infsup (3.0, inf), infsup (0.0, 0.0)));
%! assert (isequal (rdivide (infsup (-0.0, -0.0), infsup (3.0, inf)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (infsup (-0.0, -0.0) ./ infsup (0.0, 0.0), infsup));
%! assert (isequal (rdivide (infsup (-0.0, -0.0), infsup (0.0, 0.0)), infsup));
%!test
%! assert (isequal (infsup (-0.0, -0.0) ./ infsup (-3.0, 0.0), infsup (0.0, 0.0)));
%! assert (isequal (rdivide (infsup (-0.0, -0.0), infsup (-3.0, 0.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (infsup (-0.0, -0.0) ./ infsup (-0.0, -0.0), infsup));
%! assert (isequal (rdivide (infsup (-0.0, -0.0), infsup (-0.0, -0.0)), infsup));
%!test
%! assert (isequal (infsup (-0.0, -0.0) ./ infsup (-3.0, -0.0), infsup (0.0, 0.0)));
%! assert (isequal (rdivide (infsup (-0.0, -0.0), infsup (-3.0, -0.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (infsup (-0.0, -0.0) ./ infsup (-3.0, 3.0), infsup (0.0, 0.0)));
%! assert (isequal (rdivide (infsup (-0.0, -0.0), infsup (-3.0, 3.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (infsup (-0.0, -0.0) ./ infsup (0.0, 3.0), infsup (0.0, 0.0)));
%! assert (isequal (rdivide (infsup (-0.0, -0.0), infsup (0.0, 3.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (infsup (-0.0, -0.0) ./ infsup (-inf, 0.0), infsup (0.0, 0.0)));
%! assert (isequal (rdivide (infsup (-0.0, -0.0), infsup (-inf, 0.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (infsup (-0.0, -0.0) ./ infsup (-0.0, 3.0), infsup (0.0, 0.0)));
%! assert (isequal (rdivide (infsup (-0.0, -0.0), infsup (-0.0, 3.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (infsup (-0.0, -0.0) ./ infsup (-inf, -0.0), infsup (0.0, 0.0)));
%! assert (isequal (rdivide (infsup (-0.0, -0.0), infsup (-inf, -0.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (infsup (-0.0, -0.0) ./ infsup (-inf, 3.0), infsup (0.0, 0.0)));
%! assert (isequal (rdivide (infsup (-0.0, -0.0), infsup (-inf, 3.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (infsup (-0.0, -0.0) ./ infsup (-3.0, inf), infsup (0.0, 0.0)));
%! assert (isequal (rdivide (infsup (-0.0, -0.0), infsup (-3.0, inf)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (infsup (-0.0, -0.0) ./ infsup (0.0, inf), infsup (0.0, 0.0)));
%! assert (isequal (rdivide (infsup (-0.0, -0.0), infsup (0.0, inf)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (infsup (-0.0, -0.0) ./ infsup (-0.0, inf), infsup (0.0, 0.0)));
%! assert (isequal (rdivide (infsup (-0.0, -0.0), infsup (-0.0, inf)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (infsup (-0.0, -0.0) ./ infsup (-inf, inf), infsup (0.0, 0.0)));
%! assert (isequal (rdivide (infsup (-0.0, -0.0), infsup (-inf, inf)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (infsup (-inf, -15.0) ./ infsup (-5.0, -3.0), infsup (3.0, inf)));
%! assert (isequal (rdivide (infsup (-inf, -15.0), infsup (-5.0, -3.0)), infsup (3.0, inf)));
%!test
%! assert (isequal (infsup (-inf, -15.0) ./ infsup (3.0, 5.0), infsup (-inf, -3.0)));
%! assert (isequal (rdivide (infsup (-inf, -15.0), infsup (3.0, 5.0)), infsup (-inf, -3.0)));
%!test
%! assert (isequal (infsup (-inf, -15.0) ./ infsup (-inf, -3.0), infsup (0.0, inf)));
%! assert (isequal (rdivide (infsup (-inf, -15.0), infsup (-inf, -3.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (infsup (-inf, -15.0) ./ infsup (3.0, inf), infsup (-inf, 0.0)));
%! assert (isequal (rdivide (infsup (-inf, -15.0), infsup (3.0, inf)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (infsup (-inf, -15.0) ./ infsup (0.0, 0.0), infsup));
%! assert (isequal (rdivide (infsup (-inf, -15.0), infsup (0.0, 0.0)), infsup));
%!test
%! assert (isequal (infsup (-inf, -15.0) ./ infsup (-3.0, 0.0), infsup (5.0, inf)));
%! assert (isequal (rdivide (infsup (-inf, -15.0), infsup (-3.0, 0.0)), infsup (5.0, inf)));
%!test
%! assert (isequal (infsup (-inf, -15.0) ./ infsup (-0.0, -0.0), infsup));
%! assert (isequal (rdivide (infsup (-inf, -15.0), infsup (-0.0, -0.0)), infsup));
%!test
%! assert (isequal (infsup (-inf, -15.0) ./ infsup (-3.0, -0.0), infsup (5.0, inf)));
%! assert (isequal (rdivide (infsup (-inf, -15.0), infsup (-3.0, -0.0)), infsup (5.0, inf)));
%!test
%! assert (isequal (infsup (-inf, -15.0) ./ infsup (-3.0, 3.0), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (-inf, -15.0), infsup (-3.0, 3.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-inf, -15.0) ./ infsup (0.0, 3.0), infsup (-inf, -5.0)));
%! assert (isequal (rdivide (infsup (-inf, -15.0), infsup (0.0, 3.0)), infsup (-inf, -5.0)));
%!test
%! assert (isequal (infsup (-inf, -15.0) ./ infsup (-inf, 0.0), infsup (0.0, inf)));
%! assert (isequal (rdivide (infsup (-inf, -15.0), infsup (-inf, 0.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (infsup (-inf, -15.0) ./ infsup (-0.0, 3.0), infsup (-inf, -5.0)));
%! assert (isequal (rdivide (infsup (-inf, -15.0), infsup (-0.0, 3.0)), infsup (-inf, -5.0)));
%!test
%! assert (isequal (infsup (-inf, -15.0) ./ infsup (-inf, -0.0), infsup (0.0, inf)));
%! assert (isequal (rdivide (infsup (-inf, -15.0), infsup (-inf, -0.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (infsup (-inf, -15.0) ./ infsup (-inf, 3.0), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (-inf, -15.0), infsup (-inf, 3.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-inf, -15.0) ./ infsup (-3.0, inf), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (-inf, -15.0), infsup (-3.0, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-inf, -15.0) ./ infsup (0.0, inf), infsup (-inf, 0.0)));
%! assert (isequal (rdivide (infsup (-inf, -15.0), infsup (0.0, inf)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (infsup (-inf, -15.0) ./ infsup (-0.0, inf), infsup (-inf, 0.0)));
%! assert (isequal (rdivide (infsup (-inf, -15.0), infsup (-0.0, inf)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (infsup (-inf, -15.0) ./ infsup (-inf, inf), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (-inf, -15.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-inf, 15.0) ./ infsup (-5.0, -3.0), infsup (-5.0, inf)));
%! assert (isequal (rdivide (infsup (-inf, 15.0), infsup (-5.0, -3.0)), infsup (-5.0, inf)));
%!test
%! assert (isequal (infsup (-inf, 15.0) ./ infsup (3.0, 5.0), infsup (-inf, 5.0)));
%! assert (isequal (rdivide (infsup (-inf, 15.0), infsup (3.0, 5.0)), infsup (-inf, 5.0)));
%!test
%! assert (isequal (infsup (-inf, 15.0) ./ infsup (-inf, -3.0), infsup (-5.0, inf)));
%! assert (isequal (rdivide (infsup (-inf, 15.0), infsup (-inf, -3.0)), infsup (-5.0, inf)));
%!test
%! assert (isequal (infsup (-inf, 15.0) ./ infsup (3.0, inf), infsup (-inf, 5.0)));
%! assert (isequal (rdivide (infsup (-inf, 15.0), infsup (3.0, inf)), infsup (-inf, 5.0)));
%!test
%! assert (isequal (infsup (-inf, 15.0) ./ infsup (0.0, 0.0), infsup));
%! assert (isequal (rdivide (infsup (-inf, 15.0), infsup (0.0, 0.0)), infsup));
%!test
%! assert (isequal (infsup (-inf, 15.0) ./ infsup (-3.0, 0.0), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (-inf, 15.0), infsup (-3.0, 0.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-inf, 15.0) ./ infsup (-0.0, -0.0), infsup));
%! assert (isequal (rdivide (infsup (-inf, 15.0), infsup (-0.0, -0.0)), infsup));
%!test
%! assert (isequal (infsup (-inf, 15.0) ./ infsup (-3.0, -0.0), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (-inf, 15.0), infsup (-3.0, -0.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-inf, 15.0) ./ infsup (-3.0, 3.0), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (-inf, 15.0), infsup (-3.0, 3.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-inf, 15.0) ./ infsup (0.0, 3.0), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (-inf, 15.0), infsup (0.0, 3.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-inf, 15.0) ./ infsup (-inf, 0.0), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (-inf, 15.0), infsup (-inf, 0.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-inf, 15.0) ./ infsup (-0.0, 3.0), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (-inf, 15.0), infsup (-0.0, 3.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-inf, 15.0) ./ infsup (-inf, -0.0), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (-inf, 15.0), infsup (-inf, -0.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-inf, 15.0) ./ infsup (-inf, 3.0), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (-inf, 15.0), infsup (-inf, 3.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-inf, 15.0) ./ infsup (-3.0, inf), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (-inf, 15.0), infsup (-3.0, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-inf, 15.0) ./ infsup (0.0, inf), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (-inf, 15.0), infsup (0.0, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-inf, 15.0) ./ infsup (-0.0, inf), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (-inf, 15.0), infsup (-0.0, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-inf, 15.0) ./ infsup (-inf, inf), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (-inf, 15.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-15.0, inf) ./ infsup (-5.0, -3.0), infsup (-inf, 5.0)));
%! assert (isequal (rdivide (infsup (-15.0, inf), infsup (-5.0, -3.0)), infsup (-inf, 5.0)));
%!test
%! assert (isequal (infsup (-15.0, inf) ./ infsup (3.0, 5.0), infsup (-5.0, inf)));
%! assert (isequal (rdivide (infsup (-15.0, inf), infsup (3.0, 5.0)), infsup (-5.0, inf)));
%!test
%! assert (isequal (infsup (-15.0, inf) ./ infsup (-inf, -3.0), infsup (-inf, 5.0)));
%! assert (isequal (rdivide (infsup (-15.0, inf), infsup (-inf, -3.0)), infsup (-inf, 5.0)));
%!test
%! assert (isequal (infsup (-15.0, inf) ./ infsup (3.0, inf), infsup (-5.0, inf)));
%! assert (isequal (rdivide (infsup (-15.0, inf), infsup (3.0, inf)), infsup (-5.0, inf)));
%!test
%! assert (isequal (infsup (-15.0, inf) ./ infsup (0.0, 0.0), infsup));
%! assert (isequal (rdivide (infsup (-15.0, inf), infsup (0.0, 0.0)), infsup));
%!test
%! assert (isequal (infsup (-15.0, inf) ./ infsup (-3.0, 0.0), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (-15.0, inf), infsup (-3.0, 0.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-15.0, inf) ./ infsup (-0.0, -0.0), infsup));
%! assert (isequal (rdivide (infsup (-15.0, inf), infsup (-0.0, -0.0)), infsup));
%!test
%! assert (isequal (infsup (-15.0, inf) ./ infsup (-3.0, -0.0), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (-15.0, inf), infsup (-3.0, -0.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-15.0, inf) ./ infsup (-3.0, 3.0), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (-15.0, inf), infsup (-3.0, 3.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-15.0, inf) ./ infsup (0.0, 3.0), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (-15.0, inf), infsup (0.0, 3.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-15.0, inf) ./ infsup (-inf, 0.0), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (-15.0, inf), infsup (-inf, 0.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-15.0, inf) ./ infsup (-0.0, 3.0), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (-15.0, inf), infsup (-0.0, 3.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-15.0, inf) ./ infsup (-inf, -0.0), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (-15.0, inf), infsup (-inf, -0.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-15.0, inf) ./ infsup (-inf, 3.0), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (-15.0, inf), infsup (-inf, 3.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-15.0, inf) ./ infsup (-3.0, inf), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (-15.0, inf), infsup (-3.0, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-15.0, inf) ./ infsup (0.0, inf), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (-15.0, inf), infsup (0.0, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-15.0, inf) ./ infsup (-0.0, inf), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (-15.0, inf), infsup (-0.0, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-15.0, inf) ./ infsup (-inf, inf), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (-15.0, inf), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (15.0, inf) ./ infsup (-5.0, -3.0), infsup (-inf, -3.0)));
%! assert (isequal (rdivide (infsup (15.0, inf), infsup (-5.0, -3.0)), infsup (-inf, -3.0)));
%!test
%! assert (isequal (infsup (15.0, inf) ./ infsup (3.0, 5.0), infsup (3.0, inf)));
%! assert (isequal (rdivide (infsup (15.0, inf), infsup (3.0, 5.0)), infsup (3.0, inf)));
%!test
%! assert (isequal (infsup (15.0, inf) ./ infsup (-inf, -3.0), infsup (-inf, 0.0)));
%! assert (isequal (rdivide (infsup (15.0, inf), infsup (-inf, -3.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (infsup (15.0, inf) ./ infsup (3.0, inf), infsup (0.0, inf)));
%! assert (isequal (rdivide (infsup (15.0, inf), infsup (3.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (infsup (15.0, inf) ./ infsup (0.0, 0.0), infsup));
%! assert (isequal (rdivide (infsup (15.0, inf), infsup (0.0, 0.0)), infsup));
%!test
%! assert (isequal (infsup (15.0, inf) ./ infsup (-3.0, 0.0), infsup (-inf, -5.0)));
%! assert (isequal (rdivide (infsup (15.0, inf), infsup (-3.0, 0.0)), infsup (-inf, -5.0)));
%!test
%! assert (isequal (infsup (15.0, inf) ./ infsup (-0.0, -0.0), infsup));
%! assert (isequal (rdivide (infsup (15.0, inf), infsup (-0.0, -0.0)), infsup));
%!test
%! assert (isequal (infsup (15.0, inf) ./ infsup (-3.0, -0.0), infsup (-inf, -5.0)));
%! assert (isequal (rdivide (infsup (15.0, inf), infsup (-3.0, -0.0)), infsup (-inf, -5.0)));
%!test
%! assert (isequal (infsup (15.0, inf) ./ infsup (-3.0, 3.0), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (15.0, inf), infsup (-3.0, 3.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (15.0, inf) ./ infsup (0.0, 3.0), infsup (5.0, inf)));
%! assert (isequal (rdivide (infsup (15.0, inf), infsup (0.0, 3.0)), infsup (5.0, inf)));
%!test
%! assert (isequal (infsup (15.0, inf) ./ infsup (-inf, 0.0), infsup (-inf, 0.0)));
%! assert (isequal (rdivide (infsup (15.0, inf), infsup (-inf, 0.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (infsup (15.0, inf) ./ infsup (-0.0, 3.0), infsup (5.0, inf)));
%! assert (isequal (rdivide (infsup (15.0, inf), infsup (-0.0, 3.0)), infsup (5.0, inf)));
%!test
%! assert (isequal (infsup (15.0, inf) ./ infsup (-inf, -0.0), infsup (-inf, 0.0)));
%! assert (isequal (rdivide (infsup (15.0, inf), infsup (-inf, -0.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (infsup (15.0, inf) ./ infsup (-inf, 3.0), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (15.0, inf), infsup (-inf, 3.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (15.0, inf) ./ infsup (-3.0, inf), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (15.0, inf), infsup (-3.0, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (15.0, inf) ./ infsup (0.0, inf), infsup (0.0, inf)));
%! assert (isequal (rdivide (infsup (15.0, inf), infsup (0.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (infsup (15.0, inf) ./ infsup (-0.0, inf), infsup (0.0, inf)));
%! assert (isequal (rdivide (infsup (15.0, inf), infsup (-0.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (infsup (15.0, inf) ./ infsup (-inf, inf), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (15.0, inf), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-30.0, 0.0) ./ infsup (-5.0, -3.0), infsup (0.0, 10.0)));
%! assert (isequal (rdivide (infsup (-30.0, 0.0), infsup (-5.0, -3.0)), infsup (0.0, 10.0)));
%!test
%! assert (isequal (infsup (-30.0, 0.0) ./ infsup (3.0, 5.0), infsup (-10.0, 0.0)));
%! assert (isequal (rdivide (infsup (-30.0, 0.0), infsup (3.0, 5.0)), infsup (-10.0, 0.0)));
%!test
%! assert (isequal (infsup (-30.0, 0.0) ./ infsup (-inf, -3.0), infsup (0.0, 10.0)));
%! assert (isequal (rdivide (infsup (-30.0, 0.0), infsup (-inf, -3.0)), infsup (0.0, 10.0)));
%!test
%! assert (isequal (infsup (-30.0, 0.0) ./ infsup (3.0, inf), infsup (-10.0, 0.0)));
%! assert (isequal (rdivide (infsup (-30.0, 0.0), infsup (3.0, inf)), infsup (-10.0, 0.0)));
%!test
%! assert (isequal (infsup (-30.0, 0.0) ./ infsup (0.0, 0.0), infsup));
%! assert (isequal (rdivide (infsup (-30.0, 0.0), infsup (0.0, 0.0)), infsup));
%!test
%! assert (isequal (infsup (-30.0, 0.0) ./ infsup (-3.0, 0.0), infsup (0.0, inf)));
%! assert (isequal (rdivide (infsup (-30.0, 0.0), infsup (-3.0, 0.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (infsup (-30.0, 0.0) ./ infsup (-0.0, -0.0), infsup));
%! assert (isequal (rdivide (infsup (-30.0, 0.0), infsup (-0.0, -0.0)), infsup));
%!test
%! assert (isequal (infsup (-30.0, 0.0) ./ infsup (-3.0, -0.0), infsup (0.0, inf)));
%! assert (isequal (rdivide (infsup (-30.0, 0.0), infsup (-3.0, -0.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (infsup (-30.0, 0.0) ./ infsup (-3.0, 3.0), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (-30.0, 0.0), infsup (-3.0, 3.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-30.0, 0.0) ./ infsup (0.0, 3.0), infsup (-inf, 0.0)));
%! assert (isequal (rdivide (infsup (-30.0, 0.0), infsup (0.0, 3.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (infsup (-30.0, 0.0) ./ infsup (-inf, 0.0), infsup (0.0, inf)));
%! assert (isequal (rdivide (infsup (-30.0, 0.0), infsup (-inf, 0.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (infsup (-30.0, 0.0) ./ infsup (-0.0, 3.0), infsup (-inf, 0.0)));
%! assert (isequal (rdivide (infsup (-30.0, 0.0), infsup (-0.0, 3.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (infsup (-30.0, 0.0) ./ infsup (-inf, -0.0), infsup (0.0, inf)));
%! assert (isequal (rdivide (infsup (-30.0, 0.0), infsup (-inf, -0.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (infsup (-30.0, 0.0) ./ infsup (-inf, 3.0), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (-30.0, 0.0), infsup (-inf, 3.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-30.0, 0.0) ./ infsup (-3.0, inf), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (-30.0, 0.0), infsup (-3.0, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-30.0, 0.0) ./ infsup (0.0, inf), infsup (-inf, 0.0)));
%! assert (isequal (rdivide (infsup (-30.0, 0.0), infsup (0.0, inf)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (infsup (-30.0, 0.0) ./ infsup (-0.0, inf), infsup (-inf, 0.0)));
%! assert (isequal (rdivide (infsup (-30.0, 0.0), infsup (-0.0, inf)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (infsup (-30.0, 0.0) ./ infsup (-inf, inf), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (-30.0, 0.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-30.0, -0.0) ./ infsup (-5.0, -3.0), infsup (0.0, 10.0)));
%! assert (isequal (rdivide (infsup (-30.0, -0.0), infsup (-5.0, -3.0)), infsup (0.0, 10.0)));
%!test
%! assert (isequal (infsup (-30.0, -0.0) ./ infsup (3.0, 5.0), infsup (-10.0, 0.0)));
%! assert (isequal (rdivide (infsup (-30.0, -0.0), infsup (3.0, 5.0)), infsup (-10.0, 0.0)));
%!test
%! assert (isequal (infsup (-30.0, -0.0) ./ infsup (-inf, -3.0), infsup (0.0, 10.0)));
%! assert (isequal (rdivide (infsup (-30.0, -0.0), infsup (-inf, -3.0)), infsup (0.0, 10.0)));
%!test
%! assert (isequal (infsup (-30.0, -0.0) ./ infsup (3.0, inf), infsup (-10.0, 0.0)));
%! assert (isequal (rdivide (infsup (-30.0, -0.0), infsup (3.0, inf)), infsup (-10.0, 0.0)));
%!test
%! assert (isequal (infsup (-30.0, -0.0) ./ infsup (0.0, 0.0), infsup));
%! assert (isequal (rdivide (infsup (-30.0, -0.0), infsup (0.0, 0.0)), infsup));
%!test
%! assert (isequal (infsup (-30.0, -0.0) ./ infsup (-3.0, 0.0), infsup (0.0, inf)));
%! assert (isequal (rdivide (infsup (-30.0, -0.0), infsup (-3.0, 0.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (infsup (-30.0, -0.0) ./ infsup (-0.0, -0.0), infsup));
%! assert (isequal (rdivide (infsup (-30.0, -0.0), infsup (-0.0, -0.0)), infsup));
%!test
%! assert (isequal (infsup (-30.0, -0.0) ./ infsup (-3.0, -0.0), infsup (0.0, inf)));
%! assert (isequal (rdivide (infsup (-30.0, -0.0), infsup (-3.0, -0.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (infsup (-30.0, -0.0) ./ infsup (-3.0, 3.0), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (-30.0, -0.0), infsup (-3.0, 3.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-30.0, -0.0) ./ infsup (0.0, 3.0), infsup (-inf, 0.0)));
%! assert (isequal (rdivide (infsup (-30.0, -0.0), infsup (0.0, 3.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (infsup (-30.0, -0.0) ./ infsup (-inf, 0.0), infsup (0.0, inf)));
%! assert (isequal (rdivide (infsup (-30.0, -0.0), infsup (-inf, 0.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (infsup (-30.0, -0.0) ./ infsup (-0.0, 3.0), infsup (-inf, 0.0)));
%! assert (isequal (rdivide (infsup (-30.0, -0.0), infsup (-0.0, 3.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (infsup (-30.0, -0.0) ./ infsup (-inf, -0.0), infsup (0.0, inf)));
%! assert (isequal (rdivide (infsup (-30.0, -0.0), infsup (-inf, -0.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (infsup (-30.0, -0.0) ./ infsup (-inf, 3.0), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (-30.0, -0.0), infsup (-inf, 3.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-30.0, -0.0) ./ infsup (-3.0, inf), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (-30.0, -0.0), infsup (-3.0, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-30.0, -0.0) ./ infsup (0.0, inf), infsup (-inf, 0.0)));
%! assert (isequal (rdivide (infsup (-30.0, -0.0), infsup (0.0, inf)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (infsup (-30.0, -0.0) ./ infsup (-0.0, inf), infsup (-inf, 0.0)));
%! assert (isequal (rdivide (infsup (-30.0, -0.0), infsup (-0.0, inf)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (infsup (-30.0, -0.0) ./ infsup (-inf, inf), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (-30.0, -0.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (0.0, 30.0) ./ infsup (-5.0, -3.0), infsup (-10.0, 0.0)));
%! assert (isequal (rdivide (infsup (0.0, 30.0), infsup (-5.0, -3.0)), infsup (-10.0, 0.0)));
%!test
%! assert (isequal (infsup (0.0, 30.0) ./ infsup (3.0, 5.0), infsup (0.0, 10.0)));
%! assert (isequal (rdivide (infsup (0.0, 30.0), infsup (3.0, 5.0)), infsup (0.0, 10.0)));
%!test
%! assert (isequal (infsup (0.0, 30.0) ./ infsup (-inf, -3.0), infsup (-10.0, 0.0)));
%! assert (isequal (rdivide (infsup (0.0, 30.0), infsup (-inf, -3.0)), infsup (-10.0, 0.0)));
%!test
%! assert (isequal (infsup (0.0, 30.0) ./ infsup (3.0, inf), infsup (0.0, 10.0)));
%! assert (isequal (rdivide (infsup (0.0, 30.0), infsup (3.0, inf)), infsup (0.0, 10.0)));
%!test
%! assert (isequal (infsup (0.0, 30.0) ./ infsup (0.0, 0.0), infsup));
%! assert (isequal (rdivide (infsup (0.0, 30.0), infsup (0.0, 0.0)), infsup));
%!test
%! assert (isequal (infsup (0.0, 30.0) ./ infsup (-3.0, 0.0), infsup (-inf, 0.0)));
%! assert (isequal (rdivide (infsup (0.0, 30.0), infsup (-3.0, 0.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (infsup (0.0, 30.0) ./ infsup (-0.0, -0.0), infsup));
%! assert (isequal (rdivide (infsup (0.0, 30.0), infsup (-0.0, -0.0)), infsup));
%!test
%! assert (isequal (infsup (0.0, 30.0) ./ infsup (-3.0, -0.0), infsup (-inf, 0.0)));
%! assert (isequal (rdivide (infsup (0.0, 30.0), infsup (-3.0, -0.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (infsup (0.0, 30.0) ./ infsup (-3.0, 3.0), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (0.0, 30.0), infsup (-3.0, 3.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (0.0, 30.0) ./ infsup (0.0, 3.0), infsup (0.0, inf)));
%! assert (isequal (rdivide (infsup (0.0, 30.0), infsup (0.0, 3.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (infsup (0.0, 30.0) ./ infsup (-inf, 0.0), infsup (-inf, 0.0)));
%! assert (isequal (rdivide (infsup (0.0, 30.0), infsup (-inf, 0.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (infsup (0.0, 30.0) ./ infsup (-0.0, 3.0), infsup (0.0, inf)));
%! assert (isequal (rdivide (infsup (0.0, 30.0), infsup (-0.0, 3.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (infsup (0.0, 30.0) ./ infsup (-inf, -0.0), infsup (-inf, 0.0)));
%! assert (isequal (rdivide (infsup (0.0, 30.0), infsup (-inf, -0.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (infsup (0.0, 30.0) ./ infsup (-inf, 3.0), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (0.0, 30.0), infsup (-inf, 3.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (0.0, 30.0) ./ infsup (-3.0, inf), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (0.0, 30.0), infsup (-3.0, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (0.0, 30.0) ./ infsup (0.0, inf), infsup (0.0, inf)));
%! assert (isequal (rdivide (infsup (0.0, 30.0), infsup (0.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (infsup (0.0, 30.0) ./ infsup (-0.0, inf), infsup (0.0, inf)));
%! assert (isequal (rdivide (infsup (0.0, 30.0), infsup (-0.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (infsup (0.0, 30.0) ./ infsup (-inf, inf), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (0.0, 30.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-0.0, 30.0) ./ infsup (-5.0, -3.0), infsup (-10.0, 0.0)));
%! assert (isequal (rdivide (infsup (-0.0, 30.0), infsup (-5.0, -3.0)), infsup (-10.0, 0.0)));
%!test
%! assert (isequal (infsup (-0.0, 30.0) ./ infsup (3.0, 5.0), infsup (0.0, 10.0)));
%! assert (isequal (rdivide (infsup (-0.0, 30.0), infsup (3.0, 5.0)), infsup (0.0, 10.0)));
%!test
%! assert (isequal (infsup (-0.0, 30.0) ./ infsup (-inf, -3.0), infsup (-10.0, 0.0)));
%! assert (isequal (rdivide (infsup (-0.0, 30.0), infsup (-inf, -3.0)), infsup (-10.0, 0.0)));
%!test
%! assert (isequal (infsup (-0.0, 30.0) ./ infsup (3.0, inf), infsup (0.0, 10.0)));
%! assert (isequal (rdivide (infsup (-0.0, 30.0), infsup (3.0, inf)), infsup (0.0, 10.0)));
%!test
%! assert (isequal (infsup (-0.0, 30.0) ./ infsup (0.0, 0.0), infsup));
%! assert (isequal (rdivide (infsup (-0.0, 30.0), infsup (0.0, 0.0)), infsup));
%!test
%! assert (isequal (infsup (-0.0, 30.0) ./ infsup (-3.0, 0.0), infsup (-inf, 0.0)));
%! assert (isequal (rdivide (infsup (-0.0, 30.0), infsup (-3.0, 0.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (infsup (-0.0, 30.0) ./ infsup (-0.0, -0.0), infsup));
%! assert (isequal (rdivide (infsup (-0.0, 30.0), infsup (-0.0, -0.0)), infsup));
%!test
%! assert (isequal (infsup (-0.0, 30.0) ./ infsup (-3.0, -0.0), infsup (-inf, 0.0)));
%! assert (isequal (rdivide (infsup (-0.0, 30.0), infsup (-3.0, -0.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (infsup (-0.0, 30.0) ./ infsup (-3.0, 3.0), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (-0.0, 30.0), infsup (-3.0, 3.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-0.0, 30.0) ./ infsup (0.0, 3.0), infsup (0.0, inf)));
%! assert (isequal (rdivide (infsup (-0.0, 30.0), infsup (0.0, 3.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (infsup (-0.0, 30.0) ./ infsup (-inf, 0.0), infsup (-inf, 0.0)));
%! assert (isequal (rdivide (infsup (-0.0, 30.0), infsup (-inf, 0.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (infsup (-0.0, 30.0) ./ infsup (-0.0, 3.0), infsup (0.0, inf)));
%! assert (isequal (rdivide (infsup (-0.0, 30.0), infsup (-0.0, 3.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (infsup (-0.0, 30.0) ./ infsup (-inf, -0.0), infsup (-inf, 0.0)));
%! assert (isequal (rdivide (infsup (-0.0, 30.0), infsup (-inf, -0.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (infsup (-0.0, 30.0) ./ infsup (-inf, 3.0), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (-0.0, 30.0), infsup (-inf, 3.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-0.0, 30.0) ./ infsup (-3.0, inf), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (-0.0, 30.0), infsup (-3.0, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-0.0, 30.0) ./ infsup (0.0, inf), infsup (0.0, inf)));
%! assert (isequal (rdivide (infsup (-0.0, 30.0), infsup (0.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (infsup (-0.0, 30.0) ./ infsup (-0.0, inf), infsup (0.0, inf)));
%! assert (isequal (rdivide (infsup (-0.0, 30.0), infsup (-0.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (infsup (-0.0, 30.0) ./ infsup (-inf, inf), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (-0.0, 30.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-inf, 0.0) ./ infsup (-5.0, -3.0), infsup (0.0, inf)));
%! assert (isequal (rdivide (infsup (-inf, 0.0), infsup (-5.0, -3.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (infsup (-inf, 0.0) ./ infsup (3.0, 5.0), infsup (-inf, 0.0)));
%! assert (isequal (rdivide (infsup (-inf, 0.0), infsup (3.0, 5.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (infsup (-inf, 0.0) ./ infsup (-inf, -3.0), infsup (0.0, inf)));
%! assert (isequal (rdivide (infsup (-inf, 0.0), infsup (-inf, -3.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (infsup (-inf, 0.0) ./ infsup (3.0, inf), infsup (-inf, 0.0)));
%! assert (isequal (rdivide (infsup (-inf, 0.0), infsup (3.0, inf)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (infsup (-inf, 0.0) ./ infsup (0.0, 0.0), infsup));
%! assert (isequal (rdivide (infsup (-inf, 0.0), infsup (0.0, 0.0)), infsup));
%!test
%! assert (isequal (infsup (-inf, 0.0) ./ infsup (-3.0, 0.0), infsup (0.0, inf)));
%! assert (isequal (rdivide (infsup (-inf, 0.0), infsup (-3.0, 0.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (infsup (-inf, 0.0) ./ infsup (-0.0, -0.0), infsup));
%! assert (isequal (rdivide (infsup (-inf, 0.0), infsup (-0.0, -0.0)), infsup));
%!test
%! assert (isequal (infsup (-inf, 0.0) ./ infsup (-3.0, -0.0), infsup (0.0, inf)));
%! assert (isequal (rdivide (infsup (-inf, 0.0), infsup (-3.0, -0.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (infsup (-inf, 0.0) ./ infsup (-3.0, 3.0), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (-inf, 0.0), infsup (-3.0, 3.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-inf, 0.0) ./ infsup (0.0, 3.0), infsup (-inf, 0.0)));
%! assert (isequal (rdivide (infsup (-inf, 0.0), infsup (0.0, 3.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (infsup (-inf, 0.0) ./ infsup (-inf, 0.0), infsup (0.0, inf)));
%! assert (isequal (rdivide (infsup (-inf, 0.0), infsup (-inf, 0.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (infsup (-inf, 0.0) ./ infsup (-0.0, 3.0), infsup (-inf, 0.0)));
%! assert (isequal (rdivide (infsup (-inf, 0.0), infsup (-0.0, 3.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (infsup (-inf, 0.0) ./ infsup (-inf, -0.0), infsup (0.0, inf)));
%! assert (isequal (rdivide (infsup (-inf, 0.0), infsup (-inf, -0.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (infsup (-inf, 0.0) ./ infsup (-inf, 3.0), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (-inf, 0.0), infsup (-inf, 3.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-inf, 0.0) ./ infsup (-3.0, inf), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (-inf, 0.0), infsup (-3.0, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-inf, 0.0) ./ infsup (0.0, inf), infsup (-inf, 0.0)));
%! assert (isequal (rdivide (infsup (-inf, 0.0), infsup (0.0, inf)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (infsup (-inf, 0.0) ./ infsup (-0.0, inf), infsup (-inf, 0.0)));
%! assert (isequal (rdivide (infsup (-inf, 0.0), infsup (-0.0, inf)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (infsup (-inf, 0.0) ./ infsup (-inf, inf), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (-inf, 0.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-inf, -0.0) ./ infsup (-5.0, -3.0), infsup (0.0, inf)));
%! assert (isequal (rdivide (infsup (-inf, -0.0), infsup (-5.0, -3.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (infsup (-inf, -0.0) ./ infsup (3.0, 5.0), infsup (-inf, 0.0)));
%! assert (isequal (rdivide (infsup (-inf, -0.0), infsup (3.0, 5.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (infsup (-inf, -0.0) ./ infsup (-inf, -3.0), infsup (0.0, inf)));
%! assert (isequal (rdivide (infsup (-inf, -0.0), infsup (-inf, -3.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (infsup (-inf, -0.0) ./ infsup (3.0, inf), infsup (-inf, 0.0)));
%! assert (isequal (rdivide (infsup (-inf, -0.0), infsup (3.0, inf)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (infsup (-inf, -0.0) ./ infsup (0.0, 0.0), infsup));
%! assert (isequal (rdivide (infsup (-inf, -0.0), infsup (0.0, 0.0)), infsup));
%!test
%! assert (isequal (infsup (-inf, -0.0) ./ infsup (-3.0, 0.0), infsup (0.0, inf)));
%! assert (isequal (rdivide (infsup (-inf, -0.0), infsup (-3.0, 0.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (infsup (-inf, -0.0) ./ infsup (-0.0, -0.0), infsup));
%! assert (isequal (rdivide (infsup (-inf, -0.0), infsup (-0.0, -0.0)), infsup));
%!test
%! assert (isequal (infsup (-inf, -0.0) ./ infsup (-3.0, -0.0), infsup (0.0, inf)));
%! assert (isequal (rdivide (infsup (-inf, -0.0), infsup (-3.0, -0.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (infsup (-inf, -0.0) ./ infsup (-3.0, 3.0), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (-inf, -0.0), infsup (-3.0, 3.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-inf, -0.0) ./ infsup (0.0, 3.0), infsup (-inf, 0.0)));
%! assert (isequal (rdivide (infsup (-inf, -0.0), infsup (0.0, 3.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (infsup (-inf, -0.0) ./ infsup (-inf, 0.0), infsup (0.0, inf)));
%! assert (isequal (rdivide (infsup (-inf, -0.0), infsup (-inf, 0.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (infsup (-inf, -0.0) ./ infsup (-0.0, 3.0), infsup (-inf, 0.0)));
%! assert (isequal (rdivide (infsup (-inf, -0.0), infsup (-0.0, 3.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (infsup (-inf, -0.0) ./ infsup (-inf, -0.0), infsup (0.0, inf)));
%! assert (isequal (rdivide (infsup (-inf, -0.0), infsup (-inf, -0.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (infsup (-inf, -0.0) ./ infsup (-inf, 3.0), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (-inf, -0.0), infsup (-inf, 3.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-inf, -0.0) ./ infsup (-3.0, inf), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (-inf, -0.0), infsup (-3.0, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-inf, -0.0) ./ infsup (0.0, inf), infsup (-inf, 0.0)));
%! assert (isequal (rdivide (infsup (-inf, -0.0), infsup (0.0, inf)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (infsup (-inf, -0.0) ./ infsup (-0.0, inf), infsup (-inf, 0.0)));
%! assert (isequal (rdivide (infsup (-inf, -0.0), infsup (-0.0, inf)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (infsup (-inf, -0.0) ./ infsup (-inf, inf), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (-inf, -0.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (0.0, inf) ./ infsup (-5.0, -3.0), infsup (-inf, 0.0)));
%! assert (isequal (rdivide (infsup (0.0, inf), infsup (-5.0, -3.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (infsup (0.0, inf) ./ infsup (3.0, 5.0), infsup (0.0, inf)));
%! assert (isequal (rdivide (infsup (0.0, inf), infsup (3.0, 5.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (infsup (0.0, inf) ./ infsup (-inf, -3.0), infsup (-inf, 0.0)));
%! assert (isequal (rdivide (infsup (0.0, inf), infsup (-inf, -3.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (infsup (0.0, inf) ./ infsup (3.0, inf), infsup (0.0, inf)));
%! assert (isequal (rdivide (infsup (0.0, inf), infsup (3.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (infsup (0.0, inf) ./ infsup (0.0, 0.0), infsup));
%! assert (isequal (rdivide (infsup (0.0, inf), infsup (0.0, 0.0)), infsup));
%!test
%! assert (isequal (infsup (0.0, inf) ./ infsup (-3.0, 0.0), infsup (-inf, 0.0)));
%! assert (isequal (rdivide (infsup (0.0, inf), infsup (-3.0, 0.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (infsup (0.0, inf) ./ infsup (-0.0, -0.0), infsup));
%! assert (isequal (rdivide (infsup (0.0, inf), infsup (-0.0, -0.0)), infsup));
%!test
%! assert (isequal (infsup (0.0, inf) ./ infsup (-3.0, -0.0), infsup (-inf, 0.0)));
%! assert (isequal (rdivide (infsup (0.0, inf), infsup (-3.0, -0.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (infsup (0.0, inf) ./ infsup (-3.0, 3.0), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (0.0, inf), infsup (-3.0, 3.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (0.0, inf) ./ infsup (0.0, 3.0), infsup (0.0, inf)));
%! assert (isequal (rdivide (infsup (0.0, inf), infsup (0.0, 3.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (infsup (0.0, inf) ./ infsup (-inf, 0.0), infsup (-inf, 0.0)));
%! assert (isequal (rdivide (infsup (0.0, inf), infsup (-inf, 0.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (infsup (0.0, inf) ./ infsup (-0.0, 3.0), infsup (0.0, inf)));
%! assert (isequal (rdivide (infsup (0.0, inf), infsup (-0.0, 3.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (infsup (0.0, inf) ./ infsup (-inf, -0.0), infsup (-inf, 0.0)));
%! assert (isequal (rdivide (infsup (0.0, inf), infsup (-inf, -0.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (infsup (0.0, inf) ./ infsup (-inf, 3.0), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (0.0, inf), infsup (-inf, 3.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (0.0, inf) ./ infsup (-3.0, inf), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (0.0, inf), infsup (-3.0, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (0.0, inf) ./ infsup (0.0, inf), infsup (0.0, inf)));
%! assert (isequal (rdivide (infsup (0.0, inf), infsup (0.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (infsup (0.0, inf) ./ infsup (-0.0, inf), infsup (0.0, inf)));
%! assert (isequal (rdivide (infsup (0.0, inf), infsup (-0.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (infsup (0.0, inf) ./ infsup (-inf, inf), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (0.0, inf), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-0.0, inf) ./ infsup (-5.0, -3.0), infsup (-inf, 0.0)));
%! assert (isequal (rdivide (infsup (-0.0, inf), infsup (-5.0, -3.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (infsup (-0.0, inf) ./ infsup (3.0, 5.0), infsup (0.0, inf)));
%! assert (isequal (rdivide (infsup (-0.0, inf), infsup (3.0, 5.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (infsup (-0.0, inf) ./ infsup (-inf, -3.0), infsup (-inf, 0.0)));
%! assert (isequal (rdivide (infsup (-0.0, inf), infsup (-inf, -3.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (infsup (-0.0, inf) ./ infsup (3.0, inf), infsup (0.0, inf)));
%! assert (isequal (rdivide (infsup (-0.0, inf), infsup (3.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (infsup (-0.0, inf) ./ infsup (0.0, 0.0), infsup));
%! assert (isequal (rdivide (infsup (-0.0, inf), infsup (0.0, 0.0)), infsup));
%!test
%! assert (isequal (infsup (-0.0, inf) ./ infsup (-3.0, 0.0), infsup (-inf, 0.0)));
%! assert (isequal (rdivide (infsup (-0.0, inf), infsup (-3.0, 0.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (infsup (-0.0, inf) ./ infsup (-0.0, -0.0), infsup));
%! assert (isequal (rdivide (infsup (-0.0, inf), infsup (-0.0, -0.0)), infsup));
%!test
%! assert (isequal (infsup (-0.0, inf) ./ infsup (-3.0, -0.0), infsup (-inf, 0.0)));
%! assert (isequal (rdivide (infsup (-0.0, inf), infsup (-3.0, -0.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (infsup (-0.0, inf) ./ infsup (-3.0, 3.0), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (-0.0, inf), infsup (-3.0, 3.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-0.0, inf) ./ infsup (0.0, 3.0), infsup (0.0, inf)));
%! assert (isequal (rdivide (infsup (-0.0, inf), infsup (0.0, 3.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (infsup (-0.0, inf) ./ infsup (-inf, 0.0), infsup (-inf, 0.0)));
%! assert (isequal (rdivide (infsup (-0.0, inf), infsup (-inf, 0.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (infsup (-0.0, inf) ./ infsup (-0.0, 3.0), infsup (0.0, inf)));
%! assert (isequal (rdivide (infsup (-0.0, inf), infsup (-0.0, 3.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (infsup (-0.0, inf) ./ infsup (-inf, -0.0), infsup (-inf, 0.0)));
%! assert (isequal (rdivide (infsup (-0.0, inf), infsup (-inf, -0.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (infsup (-0.0, inf) ./ infsup (-inf, 3.0), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (-0.0, inf), infsup (-inf, 3.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-0.0, inf) ./ infsup (-3.0, inf), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (-0.0, inf), infsup (-3.0, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-0.0, inf) ./ infsup (0.0, inf), infsup (0.0, inf)));
%! assert (isequal (rdivide (infsup (-0.0, inf), infsup (0.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (infsup (-0.0, inf) ./ infsup (-0.0, inf), infsup (0.0, inf)));
%! assert (isequal (rdivide (infsup (-0.0, inf), infsup (-0.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (infsup (-0.0, inf) ./ infsup (-inf, inf), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (-0.0, inf), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-2.0, -1.0) ./ infsup (-10.0, -3.0), infsup (9.999999999999999167e-02, 6.666666666666667407e-01)));
%! assert (isequal (rdivide (infsup (-2.0, -1.0), infsup (-10.0, -3.0)), infsup (9.999999999999999167e-02, 6.666666666666667407e-01)));
%!test
%! assert (isequal (infsup (-2.0, -1.0) ./ infsup (0.0, 10.0), infsup (-inf, -9.999999999999999167e-02)));
%! assert (isequal (rdivide (infsup (-2.0, -1.0), infsup (0.0, 10.0)), infsup (-inf, -9.999999999999999167e-02)));
%!test
%! assert (isequal (infsup (-2.0, -1.0) ./ infsup (-0.0, 10.0), infsup (-inf, -9.999999999999999167e-02)));
%! assert (isequal (rdivide (infsup (-2.0, -1.0), infsup (-0.0, 10.0)), infsup (-inf, -9.999999999999999167e-02)));
%!test
%! assert (isequal (infsup (-1.0, 2.0) ./ infsup (10.0, inf), infsup (-1.000000000000000056e-01, 2.000000000000000111e-01)));
%! assert (isequal (rdivide (infsup (-1.0, 2.0), infsup (10.0, inf)), infsup (-1.000000000000000056e-01, 2.000000000000000111e-01)));
%!test
%! assert (isequal (infsup (1.0, 3.0) ./ infsup (-inf, -10.0), infsup (-3.000000000000000444e-01, 0.0)));
%! assert (isequal (rdivide (infsup (1.0, 3.0), infsup (-inf, -10.0)), infsup (-3.000000000000000444e-01, 0.0)));
%!test
%! assert (isequal (infsup (-inf, -1.0) ./ infsup (1.0, 3.0), infsup (-inf, -3.333333333333333148e-01)));
%! assert (isequal (rdivide (infsup (-inf, -1.0), infsup (1.0, 3.0)), infsup (-inf, -3.333333333333333148e-01)));

## minimal_div_dec_test

%!test
%! assert (isequal (infsupdec (-2.0, -1.0, "com") ./ infsupdec (-10.0, -3.0, "com"), infsupdec (9.999999999999999167e-02, 6.666666666666667407e-01, "com")));
%! assert (isequal (decorationpart (infsupdec (-2.0, -1.0, "com") ./ infsupdec (-10.0, -3.0, "com")){1}, decorationpart (infsupdec (9.999999999999999167e-02, 6.666666666666667407e-01, "com")){1}));
%! assert (isequal (rdivide (infsupdec (-2.0, -1.0, "com"), infsupdec (-10.0, -3.0, "com")), infsupdec (9.999999999999999167e-02, 6.666666666666667407e-01, "com")));
%! assert (isequal (decorationpart (rdivide (infsupdec (-2.0, -1.0, "com"), infsupdec (-10.0, -3.0, "com"))){1}, decorationpart (infsupdec (9.999999999999999167e-02, 6.666666666666667407e-01, "com")){1}));
%!test
%! assert (isequal (infsupdec (-200.0, -1.0, "com") ./ infsupdec (4.940656458412465442e-324, 10.0, "com"), infsupdec (-inf, -9.999999999999999167e-02, "dac")));
%! assert (isequal (decorationpart (infsupdec (-200.0, -1.0, "com") ./ infsupdec (4.940656458412465442e-324, 10.0, "com")){1}, decorationpart (infsupdec (-inf, -9.999999999999999167e-02, "dac")){1}));
%! assert (isequal (rdivide (infsupdec (-200.0, -1.0, "com"), infsupdec (4.940656458412465442e-324, 10.0, "com")), infsupdec (-inf, -9.999999999999999167e-02, "dac")));
%! assert (isequal (decorationpart (rdivide (infsupdec (-200.0, -1.0, "com"), infsupdec (4.940656458412465442e-324, 10.0, "com"))){1}, decorationpart (infsupdec (-inf, -9.999999999999999167e-02, "dac")){1}));
%!test
%! assert (isequal (infsupdec (-2.0, -1.0, "com") ./ infsupdec (0.0, 10.0, "com"), infsupdec (-inf, -9.999999999999999167e-02, "trv")));
%! assert (isequal (decorationpart (infsupdec (-2.0, -1.0, "com") ./ infsupdec (0.0, 10.0, "com")){1}, decorationpart (infsupdec (-inf, -9.999999999999999167e-02, "trv")){1}));
%! assert (isequal (rdivide (infsupdec (-2.0, -1.0, "com"), infsupdec (0.0, 10.0, "com")), infsupdec (-inf, -9.999999999999999167e-02, "trv")));
%! assert (isequal (decorationpart (rdivide (infsupdec (-2.0, -1.0, "com"), infsupdec (0.0, 10.0, "com"))){1}, decorationpart (infsupdec (-inf, -9.999999999999999167e-02, "trv")){1}));
%!test
%! assert (isequal (infsupdec (1.0, 3.0, "def") ./ infsupdec (-inf, -10.0, "dac"), infsupdec (-3.000000000000000444e-01, 0.0, "def")));
%! assert (isequal (decorationpart (infsupdec (1.0, 3.0, "def") ./ infsupdec (-inf, -10.0, "dac")){1}, decorationpart (infsupdec (-3.000000000000000444e-01, 0.0, "def")){1}));
%! assert (isequal (rdivide (infsupdec (1.0, 3.0, "def"), infsupdec (-inf, -10.0, "dac")), infsupdec (-3.000000000000000444e-01, 0.0, "def")));
%! assert (isequal (decorationpart (rdivide (infsupdec (1.0, 3.0, "def"), infsupdec (-inf, -10.0, "dac"))){1}, decorationpart (infsupdec (-3.000000000000000444e-01, 0.0, "def")){1}));
%!test
%! assert (isequal (infsupdec (1.0, 2.0, "trv") ./ infsupdec (empty, "trv"), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (infsupdec (1.0, 2.0, "trv") ./ infsupdec (empty, "trv")){1}, decorationpart (infsupdec (empty, "trv")){1}));
%! assert (isequal (rdivide (infsupdec (1.0, 2.0, "trv"), infsupdec (empty, "trv")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (rdivide (infsupdec (1.0, 2.0, "trv"), infsupdec (empty, "trv"))){1}, decorationpart (infsupdec (empty, "trv")){1}));

## minimal_recip_test

%!test
%! assert (isequal (1 ./ infsup (-50.0, -10.0), infsup (-1.000000000000000056e-01, -1.999999999999999695e-02)));
%! assert (isequal (rdivide (1, infsup (-50.0, -10.0)), infsup (-1.000000000000000056e-01, -1.999999999999999695e-02)));
%! assert (isequal (pown (infsup (-50.0, -10.0), -1), infsup (-1.000000000000000056e-01, -1.999999999999999695e-02)));
%! assert (isequal (infsup (-50.0, -10.0) .^ -1, infsup (-1.000000000000000056e-01, -1.999999999999999695e-02)));
%! assert (isequal (power (infsup (-50.0, -10.0), -1), infsup (-1.000000000000000056e-01, -1.999999999999999695e-02)));
%! assert (isequal (infsup (-50.0, -10.0) ^ -1, infsup (-1.000000000000000056e-01, -1.999999999999999695e-02)));
%! assert (isequal (mpower (infsup (-50.0, -10.0), -1), infsup (-1.000000000000000056e-01, -1.999999999999999695e-02)));
%!test
%! assert (isequal (1 ./ infsup (10.0, 50.0), infsup (1.999999999999999695e-02, 1.000000000000000056e-01)));
%! assert (isequal (rdivide (1, infsup (10.0, 50.0)), infsup (1.999999999999999695e-02, 1.000000000000000056e-01)));
%! assert (isequal (pown (infsup (10.0, 50.0), -1), infsup (1.999999999999999695e-02, 1.000000000000000056e-01)));
%! assert (isequal (infsup (10.0, 50.0) .^ -1, infsup (1.999999999999999695e-02, 1.000000000000000056e-01)));
%! assert (isequal (power (infsup (10.0, 50.0), -1), infsup (1.999999999999999695e-02, 1.000000000000000056e-01)));
%! assert (isequal (infsup (10.0, 50.0) ^ -1, infsup (1.999999999999999695e-02, 1.000000000000000056e-01)));
%! assert (isequal (mpower (infsup (10.0, 50.0), -1), infsup (1.999999999999999695e-02, 1.000000000000000056e-01)));
%!test
%! assert (isequal (1 ./ infsup (-inf, -10.0), infsup (-1.000000000000000056e-01, 0.0)));
%! assert (isequal (rdivide (1, infsup (-inf, -10.0)), infsup (-1.000000000000000056e-01, 0.0)));
%! assert (isequal (pown (infsup (-inf, -10.0), -1), infsup (-1.000000000000000056e-01, 0.0)));
%! assert (isequal (infsup (-inf, -10.0) .^ -1, infsup (-1.000000000000000056e-01, 0.0)));
%! assert (isequal (power (infsup (-inf, -10.0), -1), infsup (-1.000000000000000056e-01, 0.0)));
%! assert (isequal (infsup (-inf, -10.0) ^ -1, infsup (-1.000000000000000056e-01, 0.0)));
%! assert (isequal (mpower (infsup (-inf, -10.0), -1), infsup (-1.000000000000000056e-01, 0.0)));
%!test
%! assert (isequal (1 ./ infsup (10.0, inf), infsup (0.0, 1.000000000000000056e-01)));
%! assert (isequal (rdivide (1, infsup (10.0, inf)), infsup (0.0, 1.000000000000000056e-01)));
%! assert (isequal (pown (infsup (10.0, inf), -1), infsup (0.0, 1.000000000000000056e-01)));
%! assert (isequal (infsup (10.0, inf) .^ -1, infsup (0.0, 1.000000000000000056e-01)));
%! assert (isequal (power (infsup (10.0, inf), -1), infsup (0.0, 1.000000000000000056e-01)));
%! assert (isequal (infsup (10.0, inf) ^ -1, infsup (0.0, 1.000000000000000056e-01)));
%! assert (isequal (mpower (infsup (10.0, inf), -1), infsup (0.0, 1.000000000000000056e-01)));
%!test
%! assert (isequal (1 ./ infsup (0.0, 0.0), infsup));
%! assert (isequal (rdivide (1, infsup (0.0, 0.0)), infsup));
%! assert (isequal (pown (infsup (0.0, 0.0), -1), infsup));
%! assert (isequal (infsup (0.0, 0.0) .^ -1, infsup));
%! assert (isequal (power (infsup (0.0, 0.0), -1), infsup));
%! assert (isequal (infsup (0.0, 0.0) ^ -1, infsup));
%! assert (isequal (mpower (infsup (0.0, 0.0), -1), infsup));
%!test
%! assert (isequal (1 ./ infsup (-0.0, -0.0), infsup));
%! assert (isequal (rdivide (1, infsup (-0.0, -0.0)), infsup));
%! assert (isequal (pown (infsup (-0.0, -0.0), -1), infsup));
%! assert (isequal (infsup (-0.0, -0.0) .^ -1, infsup));
%! assert (isequal (power (infsup (-0.0, -0.0), -1), infsup));
%! assert (isequal (infsup (-0.0, -0.0) ^ -1, infsup));
%! assert (isequal (mpower (infsup (-0.0, -0.0), -1), infsup));
%!test
%! assert (isequal (1 ./ infsup (-10.0, 0.0), infsup (-inf, -9.999999999999999167e-02)));
%! assert (isequal (rdivide (1, infsup (-10.0, 0.0)), infsup (-inf, -9.999999999999999167e-02)));
%! assert (isequal (pown (infsup (-10.0, 0.0), -1), infsup (-inf, -9.999999999999999167e-02)));
%! assert (isequal (infsup (-10.0, 0.0) .^ -1, infsup (-inf, -9.999999999999999167e-02)));
%! assert (isequal (power (infsup (-10.0, 0.0), -1), infsup (-inf, -9.999999999999999167e-02)));
%! assert (isequal (infsup (-10.0, 0.0) ^ -1, infsup (-inf, -9.999999999999999167e-02)));
%! assert (isequal (mpower (infsup (-10.0, 0.0), -1), infsup (-inf, -9.999999999999999167e-02)));
%!test
%! assert (isequal (1 ./ infsup (-10.0, -0.0), infsup (-inf, -9.999999999999999167e-02)));
%! assert (isequal (rdivide (1, infsup (-10.0, -0.0)), infsup (-inf, -9.999999999999999167e-02)));
%! assert (isequal (pown (infsup (-10.0, -0.0), -1), infsup (-inf, -9.999999999999999167e-02)));
%! assert (isequal (infsup (-10.0, -0.0) .^ -1, infsup (-inf, -9.999999999999999167e-02)));
%! assert (isequal (power (infsup (-10.0, -0.0), -1), infsup (-inf, -9.999999999999999167e-02)));
%! assert (isequal (infsup (-10.0, -0.0) ^ -1, infsup (-inf, -9.999999999999999167e-02)));
%! assert (isequal (mpower (infsup (-10.0, -0.0), -1), infsup (-inf, -9.999999999999999167e-02)));
%!test
%! assert (isequal (1 ./ infsup (-10.0, 10.0), infsup (-inf, inf)));
%! assert (isequal (rdivide (1, infsup (-10.0, 10.0)), infsup (-inf, inf)));
%! assert (isequal (pown (infsup (-10.0, 10.0), -1), infsup (-inf, inf)));
%! assert (isequal (infsup (-10.0, 10.0) .^ -1, infsup (-inf, inf)));
%! assert (isequal (power (infsup (-10.0, 10.0), -1), infsup (-inf, inf)));
%! assert (isequal (infsup (-10.0, 10.0) ^ -1, infsup (-inf, inf)));
%! assert (isequal (mpower (infsup (-10.0, 10.0), -1), infsup (-inf, inf)));
%!test
%! assert (isequal (1 ./ infsup (0.0, 10.0), infsup (9.999999999999999167e-02, inf)));
%! assert (isequal (rdivide (1, infsup (0.0, 10.0)), infsup (9.999999999999999167e-02, inf)));
%! assert (isequal (pown (infsup (0.0, 10.0), -1), infsup (9.999999999999999167e-02, inf)));
%! assert (isequal (infsup (0.0, 10.0) .^ -1, infsup (9.999999999999999167e-02, inf)));
%! assert (isequal (power (infsup (0.0, 10.0), -1), infsup (9.999999999999999167e-02, inf)));
%! assert (isequal (infsup (0.0, 10.0) ^ -1, infsup (9.999999999999999167e-02, inf)));
%! assert (isequal (mpower (infsup (0.0, 10.0), -1), infsup (9.999999999999999167e-02, inf)));
%!test
%! assert (isequal (1 ./ infsup (-0.0, 10.0), infsup (9.999999999999999167e-02, inf)));
%! assert (isequal (rdivide (1, infsup (-0.0, 10.0)), infsup (9.999999999999999167e-02, inf)));
%! assert (isequal (pown (infsup (-0.0, 10.0), -1), infsup (9.999999999999999167e-02, inf)));
%! assert (isequal (infsup (-0.0, 10.0) .^ -1, infsup (9.999999999999999167e-02, inf)));
%! assert (isequal (power (infsup (-0.0, 10.0), -1), infsup (9.999999999999999167e-02, inf)));
%! assert (isequal (infsup (-0.0, 10.0) ^ -1, infsup (9.999999999999999167e-02, inf)));
%! assert (isequal (mpower (infsup (-0.0, 10.0), -1), infsup (9.999999999999999167e-02, inf)));
%!test
%! assert (isequal (1 ./ infsup (-inf, 0.0), infsup (-inf, 0.0)));
%! assert (isequal (rdivide (1, infsup (-inf, 0.0)), infsup (-inf, 0.0)));
%! assert (isequal (pown (infsup (-inf, 0.0), -1), infsup (-inf, 0.0)));
%! assert (isequal (infsup (-inf, 0.0) .^ -1, infsup (-inf, 0.0)));
%! assert (isequal (power (infsup (-inf, 0.0), -1), infsup (-inf, 0.0)));
%! assert (isequal (infsup (-inf, 0.0) ^ -1, infsup (-inf, 0.0)));
%! assert (isequal (mpower (infsup (-inf, 0.0), -1), infsup (-inf, 0.0)));
%!test
%! assert (isequal (1 ./ infsup (-inf, -0.0), infsup (-inf, 0.0)));
%! assert (isequal (rdivide (1, infsup (-inf, -0.0)), infsup (-inf, 0.0)));
%! assert (isequal (pown (infsup (-inf, -0.0), -1), infsup (-inf, 0.0)));
%! assert (isequal (infsup (-inf, -0.0) .^ -1, infsup (-inf, 0.0)));
%! assert (isequal (power (infsup (-inf, -0.0), -1), infsup (-inf, 0.0)));
%! assert (isequal (infsup (-inf, -0.0) ^ -1, infsup (-inf, 0.0)));
%! assert (isequal (mpower (infsup (-inf, -0.0), -1), infsup (-inf, 0.0)));
%!test
%! assert (isequal (1 ./ infsup (-inf, 10.0), infsup (-inf, inf)));
%! assert (isequal (rdivide (1, infsup (-inf, 10.0)), infsup (-inf, inf)));
%! assert (isequal (pown (infsup (-inf, 10.0), -1), infsup (-inf, inf)));
%! assert (isequal (infsup (-inf, 10.0) .^ -1, infsup (-inf, inf)));
%! assert (isequal (power (infsup (-inf, 10.0), -1), infsup (-inf, inf)));
%! assert (isequal (infsup (-inf, 10.0) ^ -1, infsup (-inf, inf)));
%! assert (isequal (mpower (infsup (-inf, 10.0), -1), infsup (-inf, inf)));
%!test
%! assert (isequal (1 ./ infsup (-10.0, inf), infsup (-inf, inf)));
%! assert (isequal (rdivide (1, infsup (-10.0, inf)), infsup (-inf, inf)));
%! assert (isequal (pown (infsup (-10.0, inf), -1), infsup (-inf, inf)));
%! assert (isequal (infsup (-10.0, inf) .^ -1, infsup (-inf, inf)));
%! assert (isequal (power (infsup (-10.0, inf), -1), infsup (-inf, inf)));
%! assert (isequal (infsup (-10.0, inf) ^ -1, infsup (-inf, inf)));
%! assert (isequal (mpower (infsup (-10.0, inf), -1), infsup (-inf, inf)));
%!test
%! assert (isequal (1 ./ infsup (0.0, inf), infsup (0.0, inf)));
%! assert (isequal (rdivide (1, infsup (0.0, inf)), infsup (0.0, inf)));
%! assert (isequal (pown (infsup (0.0, inf), -1), infsup (0.0, inf)));
%! assert (isequal (infsup (0.0, inf) .^ -1, infsup (0.0, inf)));
%! assert (isequal (power (infsup (0.0, inf), -1), infsup (0.0, inf)));
%! assert (isequal (infsup (0.0, inf) ^ -1, infsup (0.0, inf)));
%! assert (isequal (mpower (infsup (0.0, inf), -1), infsup (0.0, inf)));
%!test
%! assert (isequal (1 ./ infsup (-0.0, inf), infsup (0.0, inf)));
%! assert (isequal (rdivide (1, infsup (-0.0, inf)), infsup (0.0, inf)));
%! assert (isequal (pown (infsup (-0.0, inf), -1), infsup (0.0, inf)));
%! assert (isequal (infsup (-0.0, inf) .^ -1, infsup (0.0, inf)));
%! assert (isequal (power (infsup (-0.0, inf), -1), infsup (0.0, inf)));
%! assert (isequal (infsup (-0.0, inf) ^ -1, infsup (0.0, inf)));
%! assert (isequal (mpower (infsup (-0.0, inf), -1), infsup (0.0, inf)));
%!test
%! assert (isequal (1 ./ infsup (-inf, inf), infsup (-inf, inf)));
%! assert (isequal (rdivide (1, infsup (-inf, inf)), infsup (-inf, inf)));
%! assert (isequal (pown (infsup (-inf, inf), -1), infsup (-inf, inf)));
%! assert (isequal (infsup (-inf, inf) .^ -1, infsup (-inf, inf)));
%! assert (isequal (power (infsup (-inf, inf), -1), infsup (-inf, inf)));
%! assert (isequal (infsup (-inf, inf) ^ -1, infsup (-inf, inf)));
%! assert (isequal (mpower (infsup (-inf, inf), -1), infsup (-inf, inf)));

## minimal_recip_dec_test

%!test
%! assert (isequal (1 ./ infsupdec (10.0, 50.0, "com"), infsupdec (1.999999999999999695e-02, 1.000000000000000056e-01, "com")));
%! assert (isequal (decorationpart (1 ./ infsupdec (10.0, 50.0, "com")){1}, decorationpart (infsupdec (1.999999999999999695e-02, 1.000000000000000056e-01, "com")){1}));
%! assert (isequal (rdivide (1, infsupdec (10.0, 50.0, "com")), infsupdec (1.999999999999999695e-02, 1.000000000000000056e-01, "com")));
%! assert (isequal (decorationpart (rdivide (1, infsupdec (10.0, 50.0, "com"))){1}, decorationpart (infsupdec (1.999999999999999695e-02, 1.000000000000000056e-01, "com")){1}));
%! assert (isequal (pown (infsupdec (10.0, 50.0, "com"), -1), infsupdec (1.999999999999999695e-02, 1.000000000000000056e-01, "com")));
%! assert (isequal (decorationpart (pown (infsupdec (10.0, 50.0, "com"), -1)){1}, decorationpart (infsupdec (1.999999999999999695e-02, 1.000000000000000056e-01, "com")){1}));
%! assert (isequal (infsupdec (10.0, 50.0, "com") .^ -1, infsupdec (1.999999999999999695e-02, 1.000000000000000056e-01, "com")));
%! assert (isequal (decorationpart (infsupdec (10.0, 50.0, "com") .^ -1){1}, decorationpart (infsupdec (1.999999999999999695e-02, 1.000000000000000056e-01, "com")){1}));
%! assert (isequal (power (infsupdec (10.0, 50.0, "com"), -1), infsupdec (1.999999999999999695e-02, 1.000000000000000056e-01, "com")));
%! assert (isequal (decorationpart (power (infsupdec (10.0, 50.0, "com"), -1)){1}, decorationpart (infsupdec (1.999999999999999695e-02, 1.000000000000000056e-01, "com")){1}));
%! assert (isequal (infsupdec (10.0, 50.0, "com") ^ -1, infsupdec (1.999999999999999695e-02, 1.000000000000000056e-01, "com")));
%! assert (isequal (decorationpart (infsupdec (10.0, 50.0, "com") ^ -1){1}, decorationpart (infsupdec (1.999999999999999695e-02, 1.000000000000000056e-01, "com")){1}));
%! assert (isequal (mpower (infsupdec (10.0, 50.0, "com"), -1), infsupdec (1.999999999999999695e-02, 1.000000000000000056e-01, "com")));
%! assert (isequal (decorationpart (mpower (infsupdec (10.0, 50.0, "com"), -1)){1}, decorationpart (infsupdec (1.999999999999999695e-02, 1.000000000000000056e-01, "com")){1}));
%!test
%! assert (isequal (1 ./ infsupdec (-inf, -10.0, "dac"), infsupdec (-1.000000000000000056e-01, 0.0, "dac")));
%! assert (isequal (decorationpart (1 ./ infsupdec (-inf, -10.0, "dac")){1}, decorationpart (infsupdec (-1.000000000000000056e-01, 0.0, "dac")){1}));
%! assert (isequal (rdivide (1, infsupdec (-inf, -10.0, "dac")), infsupdec (-1.000000000000000056e-01, 0.0, "dac")));
%! assert (isequal (decorationpart (rdivide (1, infsupdec (-inf, -10.0, "dac"))){1}, decorationpart (infsupdec (-1.000000000000000056e-01, 0.0, "dac")){1}));
%! assert (isequal (pown (infsupdec (-inf, -10.0, "dac"), -1), infsupdec (-1.000000000000000056e-01, 0.0, "dac")));
%! assert (isequal (decorationpart (pown (infsupdec (-inf, -10.0, "dac"), -1)){1}, decorationpart (infsupdec (-1.000000000000000056e-01, 0.0, "dac")){1}));
%! assert (isequal (infsupdec (-inf, -10.0, "dac") .^ -1, infsupdec (-1.000000000000000056e-01, 0.0, "dac")));
%! assert (isequal (decorationpart (infsupdec (-inf, -10.0, "dac") .^ -1){1}, decorationpart (infsupdec (-1.000000000000000056e-01, 0.0, "dac")){1}));
%! assert (isequal (power (infsupdec (-inf, -10.0, "dac"), -1), infsupdec (-1.000000000000000056e-01, 0.0, "dac")));
%! assert (isequal (decorationpart (power (infsupdec (-inf, -10.0, "dac"), -1)){1}, decorationpart (infsupdec (-1.000000000000000056e-01, 0.0, "dac")){1}));
%! assert (isequal (infsupdec (-inf, -10.0, "dac") ^ -1, infsupdec (-1.000000000000000056e-01, 0.0, "dac")));
%! assert (isequal (decorationpart (infsupdec (-inf, -10.0, "dac") ^ -1){1}, decorationpart (infsupdec (-1.000000000000000056e-01, 0.0, "dac")){1}));
%! assert (isequal (mpower (infsupdec (-inf, -10.0, "dac"), -1), infsupdec (-1.000000000000000056e-01, 0.0, "dac")));
%! assert (isequal (decorationpart (mpower (infsupdec (-inf, -10.0, "dac"), -1)){1}, decorationpart (infsupdec (-1.000000000000000056e-01, 0.0, "dac")){1}));
%!test
%! assert (isequal (1 ./ infsupdec (-1.797693134862315708e+308, -4.940656458412465442e-324, "def"), infsupdec (-inf, -5.562684646268003458e-309, "def")));
%! assert (isequal (decorationpart (1 ./ infsupdec (-1.797693134862315708e+308, -4.940656458412465442e-324, "def")){1}, decorationpart (infsupdec (-inf, -5.562684646268003458e-309, "def")){1}));
%! assert (isequal (rdivide (1, infsupdec (-1.797693134862315708e+308, -4.940656458412465442e-324, "def")), infsupdec (-inf, -5.562684646268003458e-309, "def")));
%! assert (isequal (decorationpart (rdivide (1, infsupdec (-1.797693134862315708e+308, -4.940656458412465442e-324, "def"))){1}, decorationpart (infsupdec (-inf, -5.562684646268003458e-309, "def")){1}));
%! assert (isequal (pown (infsupdec (-1.797693134862315708e+308, -4.940656458412465442e-324, "def"), -1), infsupdec (-inf, -5.562684646268003458e-309, "def")));
%! assert (isequal (decorationpart (pown (infsupdec (-1.797693134862315708e+308, -4.940656458412465442e-324, "def"), -1)){1}, decorationpart (infsupdec (-inf, -5.562684646268003458e-309, "def")){1}));
%! assert (isequal (infsupdec (-1.797693134862315708e+308, -4.940656458412465442e-324, "def") .^ -1, infsupdec (-inf, -5.562684646268003458e-309, "def")));
%! assert (isequal (decorationpart (infsupdec (-1.797693134862315708e+308, -4.940656458412465442e-324, "def") .^ -1){1}, decorationpart (infsupdec (-inf, -5.562684646268003458e-309, "def")){1}));
%! assert (isequal (power (infsupdec (-1.797693134862315708e+308, -4.940656458412465442e-324, "def"), -1), infsupdec (-inf, -5.562684646268003458e-309, "def")));
%! assert (isequal (decorationpart (power (infsupdec (-1.797693134862315708e+308, -4.940656458412465442e-324, "def"), -1)){1}, decorationpart (infsupdec (-inf, -5.562684646268003458e-309, "def")){1}));
%! assert (isequal (infsupdec (-1.797693134862315708e+308, -4.940656458412465442e-324, "def") ^ -1, infsupdec (-inf, -5.562684646268003458e-309, "def")));
%! assert (isequal (decorationpart (infsupdec (-1.797693134862315708e+308, -4.940656458412465442e-324, "def") ^ -1){1}, decorationpart (infsupdec (-inf, -5.562684646268003458e-309, "def")){1}));
%! assert (isequal (mpower (infsupdec (-1.797693134862315708e+308, -4.940656458412465442e-324, "def"), -1), infsupdec (-inf, -5.562684646268003458e-309, "def")));
%! assert (isequal (decorationpart (mpower (infsupdec (-1.797693134862315708e+308, -4.940656458412465442e-324, "def"), -1)){1}, decorationpart (infsupdec (-inf, -5.562684646268003458e-309, "def")){1}));
%!test
%! assert (isequal (1 ./ infsupdec (0.0, 0.0, "com"), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (1 ./ infsupdec (0.0, 0.0, "com")){1}, decorationpart (infsupdec (empty, "trv")){1}));
%! assert (isequal (rdivide (1, infsupdec (0.0, 0.0, "com")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (rdivide (1, infsupdec (0.0, 0.0, "com"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%! assert (isequal (pown (infsupdec (0.0, 0.0, "com"), -1), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (pown (infsupdec (0.0, 0.0, "com"), -1)){1}, decorationpart (infsupdec (empty, "trv")){1}));
%! assert (isequal (infsupdec (0.0, 0.0, "com") .^ -1, infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (infsupdec (0.0, 0.0, "com") .^ -1){1}, decorationpart (infsupdec (empty, "trv")){1}));
%! assert (isequal (power (infsupdec (0.0, 0.0, "com"), -1), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (power (infsupdec (0.0, 0.0, "com"), -1)){1}, decorationpart (infsupdec (empty, "trv")){1}));
%! assert (isequal (infsupdec (0.0, 0.0, "com") ^ -1, infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (infsupdec (0.0, 0.0, "com") ^ -1){1}, decorationpart (infsupdec (empty, "trv")){1}));
%! assert (isequal (mpower (infsupdec (0.0, 0.0, "com"), -1), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (mpower (infsupdec (0.0, 0.0, "com"), -1)){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (1 ./ infsupdec (-10.0, 0.0, "com"), infsupdec (-inf, -9.999999999999999167e-02, "trv")));
%! assert (isequal (decorationpart (1 ./ infsupdec (-10.0, 0.0, "com")){1}, decorationpart (infsupdec (-inf, -9.999999999999999167e-02, "trv")){1}));
%! assert (isequal (rdivide (1, infsupdec (-10.0, 0.0, "com")), infsupdec (-inf, -9.999999999999999167e-02, "trv")));
%! assert (isequal (decorationpart (rdivide (1, infsupdec (-10.0, 0.0, "com"))){1}, decorationpart (infsupdec (-inf, -9.999999999999999167e-02, "trv")){1}));
%! assert (isequal (pown (infsupdec (-10.0, 0.0, "com"), -1), infsupdec (-inf, -9.999999999999999167e-02, "trv")));
%! assert (isequal (decorationpart (pown (infsupdec (-10.0, 0.0, "com"), -1)){1}, decorationpart (infsupdec (-inf, -9.999999999999999167e-02, "trv")){1}));
%! assert (isequal (infsupdec (-10.0, 0.0, "com") .^ -1, infsupdec (-inf, -9.999999999999999167e-02, "trv")));
%! assert (isequal (decorationpart (infsupdec (-10.0, 0.0, "com") .^ -1){1}, decorationpart (infsupdec (-inf, -9.999999999999999167e-02, "trv")){1}));
%! assert (isequal (power (infsupdec (-10.0, 0.0, "com"), -1), infsupdec (-inf, -9.999999999999999167e-02, "trv")));
%! assert (isequal (decorationpart (power (infsupdec (-10.0, 0.0, "com"), -1)){1}, decorationpart (infsupdec (-inf, -9.999999999999999167e-02, "trv")){1}));
%! assert (isequal (infsupdec (-10.0, 0.0, "com") ^ -1, infsupdec (-inf, -9.999999999999999167e-02, "trv")));
%! assert (isequal (decorationpart (infsupdec (-10.0, 0.0, "com") ^ -1){1}, decorationpart (infsupdec (-inf, -9.999999999999999167e-02, "trv")){1}));
%! assert (isequal (mpower (infsupdec (-10.0, 0.0, "com"), -1), infsupdec (-inf, -9.999999999999999167e-02, "trv")));
%! assert (isequal (decorationpart (mpower (infsupdec (-10.0, 0.0, "com"), -1)){1}, decorationpart (infsupdec (-inf, -9.999999999999999167e-02, "trv")){1}));
%!test
%! assert (isequal (1 ./ infsupdec (-10.0, inf, "dac"), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (1 ./ infsupdec (-10.0, inf, "dac")){1}, decorationpart (infsupdec (entire, "trv")){1}));
%! assert (isequal (rdivide (1, infsupdec (-10.0, inf, "dac")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (rdivide (1, infsupdec (-10.0, inf, "dac"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%! assert (isequal (pown (infsupdec (-10.0, inf, "dac"), -1), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (pown (infsupdec (-10.0, inf, "dac"), -1)){1}, decorationpart (infsupdec (entire, "trv")){1}));
%! assert (isequal (infsupdec (-10.0, inf, "dac") .^ -1, infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (infsupdec (-10.0, inf, "dac") .^ -1){1}, decorationpart (infsupdec (entire, "trv")){1}));
%! assert (isequal (power (infsupdec (-10.0, inf, "dac"), -1), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (power (infsupdec (-10.0, inf, "dac"), -1)){1}, decorationpart (infsupdec (entire, "trv")){1}));
%! assert (isequal (infsupdec (-10.0, inf, "dac") ^ -1, infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (infsupdec (-10.0, inf, "dac") ^ -1){1}, decorationpart (infsupdec (entire, "trv")){1}));
%! assert (isequal (mpower (infsupdec (-10.0, inf, "dac"), -1), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (mpower (infsupdec (-10.0, inf, "dac"), -1)){1}, decorationpart (infsupdec (entire, "trv")){1}));
%!test
%! assert (isequal (1 ./ infsupdec (-0.0, inf, "dac"), infsupdec (0.0, inf, "trv")));
%! assert (isequal (decorationpart (1 ./ infsupdec (-0.0, inf, "dac")){1}, decorationpart (infsupdec (0.0, inf, "trv")){1}));
%! assert (isequal (rdivide (1, infsupdec (-0.0, inf, "dac")), infsupdec (0.0, inf, "trv")));
%! assert (isequal (decorationpart (rdivide (1, infsupdec (-0.0, inf, "dac"))){1}, decorationpart (infsupdec (0.0, inf, "trv")){1}));
%! assert (isequal (pown (infsupdec (-0.0, inf, "dac"), -1), infsupdec (0.0, inf, "trv")));
%! assert (isequal (decorationpart (pown (infsupdec (-0.0, inf, "dac"), -1)){1}, decorationpart (infsupdec (0.0, inf, "trv")){1}));
%! assert (isequal (infsupdec (-0.0, inf, "dac") .^ -1, infsupdec (0.0, inf, "trv")));
%! assert (isequal (decorationpart (infsupdec (-0.0, inf, "dac") .^ -1){1}, decorationpart (infsupdec (0.0, inf, "trv")){1}));
%! assert (isequal (power (infsupdec (-0.0, inf, "dac"), -1), infsupdec (0.0, inf, "trv")));
%! assert (isequal (decorationpart (power (infsupdec (-0.0, inf, "dac"), -1)){1}, decorationpart (infsupdec (0.0, inf, "trv")){1}));
%! assert (isequal (infsupdec (-0.0, inf, "dac") ^ -1, infsupdec (0.0, inf, "trv")));
%! assert (isequal (decorationpart (infsupdec (-0.0, inf, "dac") ^ -1){1}, decorationpart (infsupdec (0.0, inf, "trv")){1}));
%! assert (isequal (mpower (infsupdec (-0.0, inf, "dac"), -1), infsupdec (0.0, inf, "trv")));
%! assert (isequal (decorationpart (mpower (infsupdec (-0.0, inf, "dac"), -1)){1}, decorationpart (infsupdec (0.0, inf, "trv")){1}));
%!test
%! assert (isequal (1 ./ infsupdec (entire, "def"), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (1 ./ infsupdec (entire, "def")){1}, decorationpart (infsupdec (entire, "trv")){1}));
%! assert (isequal (rdivide (1, infsupdec (entire, "def")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (rdivide (1, infsupdec (entire, "def"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%! assert (isequal (pown (infsupdec (entire, "def"), -1), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (pown (infsupdec (entire, "def"), -1)){1}, decorationpart (infsupdec (entire, "trv")){1}));
%! assert (isequal (infsupdec (entire, "def") .^ -1, infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (infsupdec (entire, "def") .^ -1){1}, decorationpart (infsupdec (entire, "trv")){1}));
%! assert (isequal (power (infsupdec (entire, "def"), -1), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (power (infsupdec (entire, "def"), -1)){1}, decorationpart (infsupdec (entire, "trv")){1}));
%! assert (isequal (infsupdec (entire, "def") ^ -1, infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (infsupdec (entire, "def") ^ -1){1}, decorationpart (infsupdec (entire, "trv")){1}));
%! assert (isequal (mpower (infsupdec (entire, "def"), -1), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (mpower (infsupdec (entire, "def"), -1)){1}, decorationpart (infsupdec (entire, "trv")){1}));

## minimal_sqr_test

%!test
%! assert (isequal (pown (infsup, 2), infsup));
%! assert (isequal (infsup .^ 2, infsup));
%! assert (isequal (power (infsup, 2), infsup));
%! assert (isequal (infsup ^ 2, infsup));
%! assert (isequal (mpower (infsup, 2), infsup));
%!test
%! assert (isequal (pown (infsup (-inf, inf), 2), infsup (0.0, inf)));
%! assert (isequal (infsup (-inf, inf) .^ 2, infsup (0.0, inf)));
%! assert (isequal (power (infsup (-inf, inf), 2), infsup (0.0, inf)));
%! assert (isequal (infsup (-inf, inf) ^ 2, infsup (0.0, inf)));
%! assert (isequal (mpower (infsup (-inf, inf), 2), infsup (0.0, inf)));
%!test
%! assert (isequal (pown (infsup (-inf, -4.940656458412465442e-324), 2), infsup (0.0, inf)));
%! assert (isequal (infsup (-inf, -4.940656458412465442e-324) .^ 2, infsup (0.0, inf)));
%! assert (isequal (power (infsup (-inf, -4.940656458412465442e-324), 2), infsup (0.0, inf)));
%! assert (isequal (infsup (-inf, -4.940656458412465442e-324) ^ 2, infsup (0.0, inf)));
%! assert (isequal (mpower (infsup (-inf, -4.940656458412465442e-324), 2), infsup (0.0, inf)));
%!test
%! assert (isequal (pown (infsup (-1.0, 1.0), 2), infsup (0.0, 1.0)));
%! assert (isequal (infsup (-1.0, 1.0) .^ 2, infsup (0.0, 1.0)));
%! assert (isequal (power (infsup (-1.0, 1.0), 2), infsup (0.0, 1.0)));
%! assert (isequal (infsup (-1.0, 1.0) ^ 2, infsup (0.0, 1.0)));
%! assert (isequal (mpower (infsup (-1.0, 1.0), 2), infsup (0.0, 1.0)));
%!test
%! assert (isequal (pown (infsup (0.0, 1.0), 2), infsup (0.0, 1.0)));
%! assert (isequal (infsup (0.0, 1.0) .^ 2, infsup (0.0, 1.0)));
%! assert (isequal (power (infsup (0.0, 1.0), 2), infsup (0.0, 1.0)));
%! assert (isequal (infsup (0.0, 1.0) ^ 2, infsup (0.0, 1.0)));
%! assert (isequal (mpower (infsup (0.0, 1.0), 2), infsup (0.0, 1.0)));
%!test
%! assert (isequal (pown (infsup (-0.0, 1.0), 2), infsup (0.0, 1.0)));
%! assert (isequal (infsup (-0.0, 1.0) .^ 2, infsup (0.0, 1.0)));
%! assert (isequal (power (infsup (-0.0, 1.0), 2), infsup (0.0, 1.0)));
%! assert (isequal (infsup (-0.0, 1.0) ^ 2, infsup (0.0, 1.0)));
%! assert (isequal (mpower (infsup (-0.0, 1.0), 2), infsup (0.0, 1.0)));
%!test
%! assert (isequal (pown (infsup (-5.0, 3.0), 2), infsup (0.0, 25.0)));
%! assert (isequal (infsup (-5.0, 3.0) .^ 2, infsup (0.0, 25.0)));
%! assert (isequal (power (infsup (-5.0, 3.0), 2), infsup (0.0, 25.0)));
%! assert (isequal (infsup (-5.0, 3.0) ^ 2, infsup (0.0, 25.0)));
%! assert (isequal (mpower (infsup (-5.0, 3.0), 2), infsup (0.0, 25.0)));
%!test
%! assert (isequal (pown (infsup (-5.0, 0.0), 2), infsup (0.0, 25.0)));
%! assert (isequal (infsup (-5.0, 0.0) .^ 2, infsup (0.0, 25.0)));
%! assert (isequal (power (infsup (-5.0, 0.0), 2), infsup (0.0, 25.0)));
%! assert (isequal (infsup (-5.0, 0.0) ^ 2, infsup (0.0, 25.0)));
%! assert (isequal (mpower (infsup (-5.0, 0.0), 2), infsup (0.0, 25.0)));
%!test
%! assert (isequal (pown (infsup (-5.0, -0.0), 2), infsup (0.0, 25.0)));
%! assert (isequal (infsup (-5.0, -0.0) .^ 2, infsup (0.0, 25.0)));
%! assert (isequal (power (infsup (-5.0, -0.0), 2), infsup (0.0, 25.0)));
%! assert (isequal (infsup (-5.0, -0.0) ^ 2, infsup (0.0, 25.0)));
%! assert (isequal (mpower (infsup (-5.0, -0.0), 2), infsup (0.0, 25.0)));
%!test
%! assert (isequal (pown (infsup (1.000000000000000056e-01, 1.000000000000000056e-01), 2), infsup (1.000000000000000021e-02, 1.000000000000000194e-02)));
%! assert (isequal (infsup (1.000000000000000056e-01, 1.000000000000000056e-01) .^ 2, infsup (1.000000000000000021e-02, 1.000000000000000194e-02)));
%! assert (isequal (power (infsup (1.000000000000000056e-01, 1.000000000000000056e-01), 2), infsup (1.000000000000000021e-02, 1.000000000000000194e-02)));
%! assert (isequal (infsup (1.000000000000000056e-01, 1.000000000000000056e-01) ^ 2, infsup (1.000000000000000021e-02, 1.000000000000000194e-02)));
%! assert (isequal (mpower (infsup (1.000000000000000056e-01, 1.000000000000000056e-01), 2), infsup (1.000000000000000021e-02, 1.000000000000000194e-02)));
%!test
%! assert (isequal (pown (infsup (-1.999999999999996447e+00, 1.000000000000000056e-01), 2), infsup (0.0, 3.999999999999986233e+00)));
%! assert (isequal (infsup (-1.999999999999996447e+00, 1.000000000000000056e-01) .^ 2, infsup (0.0, 3.999999999999986233e+00)));
%! assert (isequal (power (infsup (-1.999999999999996447e+00, 1.000000000000000056e-01), 2), infsup (0.0, 3.999999999999986233e+00)));
%! assert (isequal (infsup (-1.999999999999996447e+00, 1.000000000000000056e-01) ^ 2, infsup (0.0, 3.999999999999986233e+00)));
%! assert (isequal (mpower (infsup (-1.999999999999996447e+00, 1.000000000000000056e-01), 2), infsup (0.0, 3.999999999999986233e+00)));
%!test
%! assert (isequal (pown (infsup (-1.999999999999996447e+00, -1.999999999999996447e+00), 2), infsup (3.999999999999985789e+00, 3.999999999999986233e+00)));
%! assert (isequal (infsup (-1.999999999999996447e+00, -1.999999999999996447e+00) .^ 2, infsup (3.999999999999985789e+00, 3.999999999999986233e+00)));
%! assert (isequal (power (infsup (-1.999999999999996447e+00, -1.999999999999996447e+00), 2), infsup (3.999999999999985789e+00, 3.999999999999986233e+00)));
%! assert (isequal (infsup (-1.999999999999996447e+00, -1.999999999999996447e+00) ^ 2, infsup (3.999999999999985789e+00, 3.999999999999986233e+00)));
%! assert (isequal (mpower (infsup (-1.999999999999996447e+00, -1.999999999999996447e+00), 2), infsup (3.999999999999985789e+00, 3.999999999999986233e+00)));

## minimal_sqr_dec_test

%!test
%! assert (isequal (pown (infsupdec (-1.797693134862315708e+308, -4.940656458412465442e-324, "com"), 2), infsupdec (0.0, inf, "dac")));
%! assert (isequal (decorationpart (pown (infsupdec (-1.797693134862315708e+308, -4.940656458412465442e-324, "com"), 2)){1}, decorationpart (infsupdec (0.0, inf, "dac")){1}));
%! assert (isequal (infsupdec (-1.797693134862315708e+308, -4.940656458412465442e-324, "com") .^ 2, infsupdec (0.0, inf, "dac")));
%! assert (isequal (decorationpart (infsupdec (-1.797693134862315708e+308, -4.940656458412465442e-324, "com") .^ 2){1}, decorationpart (infsupdec (0.0, inf, "dac")){1}));
%! assert (isequal (power (infsupdec (-1.797693134862315708e+308, -4.940656458412465442e-324, "com"), 2), infsupdec (0.0, inf, "dac")));
%! assert (isequal (decorationpart (power (infsupdec (-1.797693134862315708e+308, -4.940656458412465442e-324, "com"), 2)){1}, decorationpart (infsupdec (0.0, inf, "dac")){1}));
%! assert (isequal (infsupdec (-1.797693134862315708e+308, -4.940656458412465442e-324, "com") ^ 2, infsupdec (0.0, inf, "dac")));
%! assert (isequal (decorationpart (infsupdec (-1.797693134862315708e+308, -4.940656458412465442e-324, "com") ^ 2){1}, decorationpart (infsupdec (0.0, inf, "dac")){1}));
%! assert (isequal (mpower (infsupdec (-1.797693134862315708e+308, -4.940656458412465442e-324, "com"), 2), infsupdec (0.0, inf, "dac")));
%! assert (isequal (decorationpart (mpower (infsupdec (-1.797693134862315708e+308, -4.940656458412465442e-324, "com"), 2)){1}, decorationpart (infsupdec (0.0, inf, "dac")){1}));
%!test
%! assert (isequal (pown (infsupdec (-1.0, 1.0, "def"), 2), infsupdec (0.0, 1.0, "def")));
%! assert (isequal (decorationpart (pown (infsupdec (-1.0, 1.0, "def"), 2)){1}, decorationpart (infsupdec (0.0, 1.0, "def")){1}));
%! assert (isequal (infsupdec (-1.0, 1.0, "def") .^ 2, infsupdec (0.0, 1.0, "def")));
%! assert (isequal (decorationpart (infsupdec (-1.0, 1.0, "def") .^ 2){1}, decorationpart (infsupdec (0.0, 1.0, "def")){1}));
%! assert (isequal (power (infsupdec (-1.0, 1.0, "def"), 2), infsupdec (0.0, 1.0, "def")));
%! assert (isequal (decorationpart (power (infsupdec (-1.0, 1.0, "def"), 2)){1}, decorationpart (infsupdec (0.0, 1.0, "def")){1}));
%! assert (isequal (infsupdec (-1.0, 1.0, "def") ^ 2, infsupdec (0.0, 1.0, "def")));
%! assert (isequal (decorationpart (infsupdec (-1.0, 1.0, "def") ^ 2){1}, decorationpart (infsupdec (0.0, 1.0, "def")){1}));
%! assert (isequal (mpower (infsupdec (-1.0, 1.0, "def"), 2), infsupdec (0.0, 1.0, "def")));
%! assert (isequal (decorationpart (mpower (infsupdec (-1.0, 1.0, "def"), 2)){1}, decorationpart (infsupdec (0.0, 1.0, "def")){1}));
%!test
%! assert (isequal (pown (infsupdec (-5.0, 3.0, "com"), 2), infsupdec (0.0, 25.0, "com")));
%! assert (isequal (decorationpart (pown (infsupdec (-5.0, 3.0, "com"), 2)){1}, decorationpart (infsupdec (0.0, 25.0, "com")){1}));
%! assert (isequal (infsupdec (-5.0, 3.0, "com") .^ 2, infsupdec (0.0, 25.0, "com")));
%! assert (isequal (decorationpart (infsupdec (-5.0, 3.0, "com") .^ 2){1}, decorationpart (infsupdec (0.0, 25.0, "com")){1}));
%! assert (isequal (power (infsupdec (-5.0, 3.0, "com"), 2), infsupdec (0.0, 25.0, "com")));
%! assert (isequal (decorationpart (power (infsupdec (-5.0, 3.0, "com"), 2)){1}, decorationpart (infsupdec (0.0, 25.0, "com")){1}));
%! assert (isequal (infsupdec (-5.0, 3.0, "com") ^ 2, infsupdec (0.0, 25.0, "com")));
%! assert (isequal (decorationpart (infsupdec (-5.0, 3.0, "com") ^ 2){1}, decorationpart (infsupdec (0.0, 25.0, "com")){1}));
%! assert (isequal (mpower (infsupdec (-5.0, 3.0, "com"), 2), infsupdec (0.0, 25.0, "com")));
%! assert (isequal (decorationpart (mpower (infsupdec (-5.0, 3.0, "com"), 2)){1}, decorationpart (infsupdec (0.0, 25.0, "com")){1}));
%!test
%! assert (isequal (pown (infsupdec (1.000000000000000056e-01, 1.000000000000000056e-01, "com"), 2), infsupdec (1.000000000000000021e-02, 1.000000000000000194e-02, "com")));
%! assert (isequal (decorationpart (pown (infsupdec (1.000000000000000056e-01, 1.000000000000000056e-01, "com"), 2)){1}, decorationpart (infsupdec (1.000000000000000021e-02, 1.000000000000000194e-02, "com")){1}));
%! assert (isequal (infsupdec (1.000000000000000056e-01, 1.000000000000000056e-01, "com") .^ 2, infsupdec (1.000000000000000021e-02, 1.000000000000000194e-02, "com")));
%! assert (isequal (decorationpart (infsupdec (1.000000000000000056e-01, 1.000000000000000056e-01, "com") .^ 2){1}, decorationpart (infsupdec (1.000000000000000021e-02, 1.000000000000000194e-02, "com")){1}));
%! assert (isequal (power (infsupdec (1.000000000000000056e-01, 1.000000000000000056e-01, "com"), 2), infsupdec (1.000000000000000021e-02, 1.000000000000000194e-02, "com")));
%! assert (isequal (decorationpart (power (infsupdec (1.000000000000000056e-01, 1.000000000000000056e-01, "com"), 2)){1}, decorationpart (infsupdec (1.000000000000000021e-02, 1.000000000000000194e-02, "com")){1}));
%! assert (isequal (infsupdec (1.000000000000000056e-01, 1.000000000000000056e-01, "com") ^ 2, infsupdec (1.000000000000000021e-02, 1.000000000000000194e-02, "com")));
%! assert (isequal (decorationpart (infsupdec (1.000000000000000056e-01, 1.000000000000000056e-01, "com") ^ 2){1}, decorationpart (infsupdec (1.000000000000000021e-02, 1.000000000000000194e-02, "com")){1}));
%! assert (isequal (mpower (infsupdec (1.000000000000000056e-01, 1.000000000000000056e-01, "com"), 2), infsupdec (1.000000000000000021e-02, 1.000000000000000194e-02, "com")));
%! assert (isequal (decorationpart (mpower (infsupdec (1.000000000000000056e-01, 1.000000000000000056e-01, "com"), 2)){1}, decorationpart (infsupdec (1.000000000000000021e-02, 1.000000000000000194e-02, "com")){1}));

## minimal_sqrt_test

%!test
%! assert (isequal (realsqrt (infsup), infsup));
%!test
%! assert (isequal (realsqrt (infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (realsqrt (infsup (-inf, -4.940656458412465442e-324)), infsup));
%!test
%! assert (isequal (realsqrt (infsup (-1.0, 1.0)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (realsqrt (infsup (0.0, 1.0)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (realsqrt (infsup (-0.0, 1.0)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (realsqrt (infsup (-5.0, 25.0)), infsup (0.0, 5.0)));
%!test
%! assert (isequal (realsqrt (infsup (0.0, 25.0)), infsup (0.0, 5.0)));
%!test
%! assert (isequal (realsqrt (infsup (-0.0, 25.0)), infsup (0.0, 5.0)));
%!test
%! assert (isequal (realsqrt (infsup (-5.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (realsqrt (infsup (1.000000000000000056e-01, 1.000000000000000056e-01)), infsup (3.162277660168379412e-01, 3.162277660168379967e-01)));
%!test
%! assert (isequal (realsqrt (infsup (-1.999999999999996447e+00, 1.000000000000000056e-01)), infsup (0.0, 3.162277660168379967e-01)));
%!test
%! assert (isequal (realsqrt (infsup (1.000000000000000056e-01, 1.999999999999996447e+00)), infsup (3.162277660168379412e-01, 1.414213562373093813e+00)));

## minimal_sqrt_dec_test

%!test
%! assert (isequal (realsqrt (infsupdec (1.0, 4.0, "com")), infsupdec (1.0, 2.0, "com")));
%! assert (isequal (decorationpart (realsqrt (infsupdec (1.0, 4.0, "com"))){1}, decorationpart (infsupdec (1.0, 2.0, "com")){1}));
%!test
%! assert (isequal (realsqrt (infsupdec (-5.0, 25.0, "com")), infsupdec (0.0, 5.0, "trv")));
%! assert (isequal (decorationpart (realsqrt (infsupdec (-5.0, 25.0, "com"))){1}, decorationpart (infsupdec (0.0, 5.0, "trv")){1}));
%!test
%! assert (isequal (realsqrt (infsupdec (0.0, 25.0, "def")), infsupdec (0.0, 5.0, "def")));
%! assert (isequal (decorationpart (realsqrt (infsupdec (0.0, 25.0, "def"))){1}, decorationpart (infsupdec (0.0, 5.0, "def")){1}));
%!test
%! assert (isequal (realsqrt (infsupdec (-5.0, inf, "dac")), infsupdec (0.0, inf, "trv")));
%! assert (isequal (decorationpart (realsqrt (infsupdec (-5.0, inf, "dac"))){1}, decorationpart (infsupdec (0.0, inf, "trv")){1}));

## minimal_fma_test

%!test
%! assert (isequal (fma (infsup, infsup, infsup), infsup));
%!test
%! assert (isequal (fma (infsup (-1.0, 1.0), infsup, infsup), infsup));
%!test
%! assert (isequal (fma (infsup, infsup (-1.0, 1.0), infsup), infsup));
%!test
%! assert (isequal (fma (infsup, infsup (-inf, inf), infsup), infsup));
%!test
%! assert (isequal (fma (infsup (-inf, inf), infsup, infsup), infsup));
%!test
%! assert (isequal (fma (infsup (0.0, 0.0), infsup, infsup), infsup));
%!test
%! assert (isequal (fma (infsup (-0.0, -0.0), infsup, infsup), infsup));
%!test
%! assert (isequal (fma (infsup, infsup (0.0, 0.0), infsup), infsup));
%!test
%! assert (isequal (fma (infsup, infsup (-0.0, -0.0), infsup), infsup));
%!test
%! assert (isequal (fma (infsup (-inf, inf), infsup (0.0, 0.0), infsup), infsup));
%!test
%! assert (isequal (fma (infsup (-inf, inf), infsup (-0.0, -0.0), infsup), infsup));
%!test
%! assert (isequal (fma (infsup (-inf, inf), infsup (-5.0, -1.0), infsup), infsup));
%!test
%! assert (isequal (fma (infsup (-inf, inf), infsup (-5.0, 3.0), infsup), infsup));
%!test
%! assert (isequal (fma (infsup (-inf, inf), infsup (1.0, 3.0), infsup), infsup));
%!test
%! assert (isequal (fma (infsup (-inf, inf), infsup (-inf, -1.0), infsup), infsup));
%!test
%! assert (isequal (fma (infsup (-inf, inf), infsup (-inf, 3.0), infsup), infsup));
%!test
%! assert (isequal (fma (infsup (-inf, inf), infsup (-5.0, inf), infsup), infsup));
%!test
%! assert (isequal (fma (infsup (-inf, inf), infsup (1.0, inf), infsup), infsup));
%!test
%! assert (isequal (fma (infsup (-inf, inf), infsup (-inf, inf), infsup), infsup));
%!test
%! assert (isequal (fma (infsup (1.0, inf), infsup (0.0, 0.0), infsup), infsup));
%!test
%! assert (isequal (fma (infsup (1.0, inf), infsup (-0.0, -0.0), infsup), infsup));
%!test
%! assert (isequal (fma (infsup (1.0, inf), infsup (-5.0, -1.0), infsup), infsup));
%!test
%! assert (isequal (fma (infsup (1.0, inf), infsup (-5.0, 3.0), infsup), infsup));
%!test
%! assert (isequal (fma (infsup (1.0, inf), infsup (1.0, 3.0), infsup), infsup));
%!test
%! assert (isequal (fma (infsup (1.0, inf), infsup (-inf, -1.0), infsup), infsup));
%!test
%! assert (isequal (fma (infsup (1.0, inf), infsup (-inf, 3.0), infsup), infsup));
%!test
%! assert (isequal (fma (infsup (1.0, inf), infsup (-5.0, inf), infsup), infsup));
%!test
%! assert (isequal (fma (infsup (1.0, inf), infsup (1.0, inf), infsup), infsup));
%!test
%! assert (isequal (fma (infsup (1.0, inf), infsup (-inf, inf), infsup), infsup));
%!test
%! assert (isequal (fma (infsup (-1.0, inf), infsup (0.0, 0.0), infsup), infsup));
%!test
%! assert (isequal (fma (infsup (-1.0, inf), infsup (-0.0, -0.0), infsup), infsup));
%!test
%! assert (isequal (fma (infsup (-1.0, inf), infsup (-5.0, -1.0), infsup), infsup));
%!test
%! assert (isequal (fma (infsup (-1.0, inf), infsup (-5.0, 3.0), infsup), infsup));
%!test
%! assert (isequal (fma (infsup (-1.0, inf), infsup (1.0, 3.0), infsup), infsup));
%!test
%! assert (isequal (fma (infsup (-1.0, inf), infsup (-inf, -1.0), infsup), infsup));
%!test
%! assert (isequal (fma (infsup (-1.0, inf), infsup (-inf, 3.0), infsup), infsup));
%!test
%! assert (isequal (fma (infsup (-1.0, inf), infsup (-5.0, inf), infsup), infsup));
%!test
%! assert (isequal (fma (infsup (-1.0, inf), infsup (1.0, inf), infsup), infsup));
%!test
%! assert (isequal (fma (infsup (-1.0, inf), infsup (-inf, inf), infsup), infsup));
%!test
%! assert (isequal (fma (infsup (-inf, 3.0), infsup (0.0, 0.0), infsup), infsup));
%!test
%! assert (isequal (fma (infsup (-inf, 3.0), infsup (-0.0, -0.0), infsup), infsup));
%!test
%! assert (isequal (fma (infsup (-inf, 3.0), infsup (-5.0, -1.0), infsup), infsup));
%!test
%! assert (isequal (fma (infsup (-inf, 3.0), infsup (-5.0, 3.0), infsup), infsup));
%!test
%! assert (isequal (fma (infsup (-inf, 3.0), infsup (1.0, 3.0), infsup), infsup));
%!test
%! assert (isequal (fma (infsup (-inf, 3.0), infsup (-inf, -1.0), infsup), infsup));
%!test
%! assert (isequal (fma (infsup (-inf, 3.0), infsup (-inf, 3.0), infsup), infsup));
%!test
%! assert (isequal (fma (infsup (-inf, 3.0), infsup (-5.0, inf), infsup), infsup));
%!test
%! assert (isequal (fma (infsup (-inf, 3.0), infsup (1.0, inf), infsup), infsup));
%!test
%! assert (isequal (fma (infsup (-inf, 3.0), infsup (-inf, inf), infsup), infsup));
%!test
%! assert (isequal (fma (infsup (-inf, -3.0), infsup (0.0, 0.0), infsup), infsup));
%!test
%! assert (isequal (fma (infsup (-inf, -3.0), infsup (-0.0, -0.0), infsup), infsup));
%!test
%! assert (isequal (fma (infsup (-inf, -3.0), infsup (-5.0, -1.0), infsup), infsup));
%!test
%! assert (isequal (fma (infsup (-inf, -3.0), infsup (-5.0, 3.0), infsup), infsup));
%!test
%! assert (isequal (fma (infsup (-inf, -3.0), infsup (1.0, 3.0), infsup), infsup));
%!test
%! assert (isequal (fma (infsup (-inf, -3.0), infsup (-inf, -1.0), infsup), infsup));
%!test
%! assert (isequal (fma (infsup (-inf, -3.0), infsup (-inf, 3.0), infsup), infsup));
%!test
%! assert (isequal (fma (infsup (-inf, -3.0), infsup (-5.0, inf), infsup), infsup));
%!test
%! assert (isequal (fma (infsup (-inf, -3.0), infsup (1.0, inf), infsup), infsup));
%!test
%! assert (isequal (fma (infsup (-inf, -3.0), infsup (-inf, inf), infsup), infsup));
%!test
%! assert (isequal (fma (infsup (0.0, 0.0), infsup (0.0, 0.0), infsup), infsup));
%!test
%! assert (isequal (fma (infsup (0.0, 0.0), infsup (-0.0, -0.0), infsup), infsup));
%!test
%! assert (isequal (fma (infsup (0.0, 0.0), infsup (-5.0, -1.0), infsup), infsup));
%!test
%! assert (isequal (fma (infsup (0.0, 0.0), infsup (-5.0, 3.0), infsup), infsup));
%!test
%! assert (isequal (fma (infsup (0.0, 0.0), infsup (1.0, 3.0), infsup), infsup));
%!test
%! assert (isequal (fma (infsup (0.0, 0.0), infsup (-inf, -1.0), infsup), infsup));
%!test
%! assert (isequal (fma (infsup (0.0, 0.0), infsup (-inf, 3.0), infsup), infsup));
%!test
%! assert (isequal (fma (infsup (0.0, 0.0), infsup (-5.0, inf), infsup), infsup));
%!test
%! assert (isequal (fma (infsup (0.0, 0.0), infsup (1.0, inf), infsup), infsup));
%!test
%! assert (isequal (fma (infsup (0.0, 0.0), infsup (-inf, inf), infsup), infsup));
%!test
%! assert (isequal (fma (infsup (-0.0, -0.0), infsup (0.0, 0.0), infsup), infsup));
%!test
%! assert (isequal (fma (infsup (-0.0, -0.0), infsup (-0.0, -0.0), infsup), infsup));
%!test
%! assert (isequal (fma (infsup (-0.0, -0.0), infsup (-5.0, -1.0), infsup), infsup));
%!test
%! assert (isequal (fma (infsup (-0.0, -0.0), infsup (-5.0, 3.0), infsup), infsup));
%!test
%! assert (isequal (fma (infsup (-0.0, -0.0), infsup (1.0, 3.0), infsup), infsup));
%!test
%! assert (isequal (fma (infsup (-0.0, -0.0), infsup (-inf, -1.0), infsup), infsup));
%!test
%! assert (isequal (fma (infsup (-0.0, -0.0), infsup (-inf, 3.0), infsup), infsup));
%!test
%! assert (isequal (fma (infsup (-0.0, -0.0), infsup (-5.0, inf), infsup), infsup));
%!test
%! assert (isequal (fma (infsup (-0.0, -0.0), infsup (1.0, inf), infsup), infsup));
%!test
%! assert (isequal (fma (infsup (-0.0, -0.0), infsup (-inf, inf), infsup), infsup));
%!test
%! assert (isequal (fma (infsup (1.0, 5.0), infsup (0.0, 0.0), infsup), infsup));
%!test
%! assert (isequal (fma (infsup (1.0, 5.0), infsup (-0.0, -0.0), infsup), infsup));
%!test
%! assert (isequal (fma (infsup (1.0, 5.0), infsup (-5.0, -1.0), infsup), infsup));
%!test
%! assert (isequal (fma (infsup (1.0, 5.0), infsup (-5.0, 3.0), infsup), infsup));
%!test
%! assert (isequal (fma (infsup (1.0, 5.0), infsup (1.0, 3.0), infsup), infsup));
%!test
%! assert (isequal (fma (infsup (1.0, 5.0), infsup (-inf, -1.0), infsup), infsup));
%!test
%! assert (isequal (fma (infsup (1.0, 5.0), infsup (-inf, 3.0), infsup), infsup));
%!test
%! assert (isequal (fma (infsup (1.0, 5.0), infsup (-5.0, inf), infsup), infsup));
%!test
%! assert (isequal (fma (infsup (1.0, 5.0), infsup (1.0, inf), infsup), infsup));
%!test
%! assert (isequal (fma (infsup (1.0, 5.0), infsup (-inf, inf), infsup), infsup));
%!test
%! assert (isequal (fma (infsup (-1.0, 5.0), infsup (0.0, 0.0), infsup), infsup));
%!test
%! assert (isequal (fma (infsup (-1.0, 5.0), infsup (-0.0, -0.0), infsup), infsup));
%!test
%! assert (isequal (fma (infsup (-1.0, 5.0), infsup (-5.0, -1.0), infsup), infsup));
%!#min max
%!test
%! assert (isequal (fma (infsup (-1.0, 5.0), infsup (-5.0, 3.0), infsup), infsup));
%!test
%! assert (isequal (fma (infsup (-10.0, 2.0), infsup (-5.0, 3.0), infsup), infsup));
%!test
%! assert (isequal (fma (infsup (-1.0, 5.0), infsup (-1.0, 10.0), infsup), infsup));
%!test
%! assert (isequal (fma (infsup (-2.0, 2.0), infsup (-5.0, 3.0), infsup), infsup));
%!#end min max
%!test
%! assert (isequal (fma (infsup (-1.0, 5.0), infsup (1.0, 3.0), infsup), infsup));
%!test
%! assert (isequal (fma (infsup (-1.0, 5.0), infsup (-inf, -1.0), infsup), infsup));
%!test
%! assert (isequal (fma (infsup (-1.0, 5.0), infsup (-inf, 3.0), infsup), infsup));
%!test
%! assert (isequal (fma (infsup (-1.0, 5.0), infsup (-5.0, inf), infsup), infsup));
%!test
%! assert (isequal (fma (infsup (-1.0, 5.0), infsup (1.0, inf), infsup), infsup));
%!test
%! assert (isequal (fma (infsup (-1.0, 5.0), infsup (-inf, inf), infsup), infsup));
%!test
%! assert (isequal (fma (infsup (-10.0, -5.0), infsup (0.0, 0.0), infsup), infsup));
%!test
%! assert (isequal (fma (infsup (-10.0, -5.0), infsup (-0.0, -0.0), infsup), infsup));
%!test
%! assert (isequal (fma (infsup (-10.0, -5.0), infsup (-5.0, -1.0), infsup), infsup));
%!test
%! assert (isequal (fma (infsup (-10.0, -5.0), infsup (-5.0, 3.0), infsup), infsup));
%!test
%! assert (isequal (fma (infsup (-10.0, -5.0), infsup (1.0, 3.0), infsup), infsup));
%!test
%! assert (isequal (fma (infsup (-10.0, -5.0), infsup (-inf, -1.0), infsup), infsup));
%!test
%! assert (isequal (fma (infsup (-10.0, -5.0), infsup (-inf, 3.0), infsup), infsup));
%!test
%! assert (isequal (fma (infsup (-10.0, -5.0), infsup (-5.0, inf), infsup), infsup));
%!test
%! assert (isequal (fma (infsup (-10.0, -5.0), infsup (1.0, inf), infsup), infsup));
%!test
%! assert (isequal (fma (infsup (-10.0, -5.0), infsup (-inf, inf), infsup), infsup));
%!test
%! assert (isequal (fma (infsup, infsup, infsup (-inf, 2.0)), infsup));
%!test
%! assert (isequal (fma (infsup (-1.0, 1.0), infsup, infsup (-inf, 2.0)), infsup));
%!test
%! assert (isequal (fma (infsup, infsup (-1.0, 1.0), infsup (-inf, 2.0)), infsup));
%!test
%! assert (isequal (fma (infsup, infsup (-inf, inf), infsup (-inf, 2.0)), infsup));
%!test
%! assert (isequal (fma (infsup (-inf, inf), infsup, infsup (-inf, 2.0)), infsup));
%!test
%! assert (isequal (fma (infsup (0.0, 0.0), infsup, infsup (-inf, 2.0)), infsup));
%!test
%! assert (isequal (fma (infsup (-0.0, -0.0), infsup, infsup (-inf, 2.0)), infsup));
%!test
%! assert (isequal (fma (infsup, infsup (0.0, 0.0), infsup (-inf, 2.0)), infsup));
%!test
%! assert (isequal (fma (infsup, infsup (-0.0, -0.0), infsup (-inf, 2.0)), infsup));
%!test
%! assert (isequal (fma (infsup (-inf, inf), infsup (0.0, 0.0), infsup (-inf, 2.0)), infsup (-inf, 2.0)));
%!test
%! assert (isequal (fma (infsup (-inf, inf), infsup (-0.0, -0.0), infsup (-inf, 2.0)), infsup (-inf, 2.0)));
%!test
%! assert (isequal (fma (infsup (-inf, inf), infsup (-5.0, -1.0), infsup (-inf, 2.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-inf, inf), infsup (-5.0, 3.0), infsup (-inf, 2.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-inf, inf), infsup (1.0, 3.0), infsup (-inf, 2.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-inf, inf), infsup (-inf, -1.0), infsup (-inf, 2.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-inf, inf), infsup (-inf, 3.0), infsup (-inf, 2.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-inf, inf), infsup (-5.0, inf), infsup (-inf, 2.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-inf, inf), infsup (1.0, inf), infsup (-inf, 2.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-inf, inf), infsup (-inf, inf), infsup (-inf, 2.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (1.0, inf), infsup (0.0, 0.0), infsup (-inf, 2.0)), infsup (-inf, 2.0)));
%!test
%! assert (isequal (fma (infsup (1.0, inf), infsup (-0.0, -0.0), infsup (-inf, 2.0)), infsup (-inf, 2.0)));
%!test
%! assert (isequal (fma (infsup (1.0, inf), infsup (-5.0, -1.0), infsup (-inf, 2.0)), infsup (-inf, 1.0)));
%!test
%! assert (isequal (fma (infsup (1.0, inf), infsup (-5.0, 3.0), infsup (-inf, 2.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (1.0, inf), infsup (1.0, 3.0), infsup (-inf, 2.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (1.0, inf), infsup (-inf, -1.0), infsup (-inf, 2.0)), infsup (-inf, 1.0)));
%!test
%! assert (isequal (fma (infsup (1.0, inf), infsup (-inf, 3.0), infsup (-inf, 2.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (1.0, inf), infsup (-5.0, inf), infsup (-inf, 2.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (1.0, inf), infsup (1.0, inf), infsup (-inf, 2.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (1.0, inf), infsup (-inf, inf), infsup (-inf, 2.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-1.0, inf), infsup (0.0, 0.0), infsup (-inf, 2.0)), infsup (-inf, 2.0)));
%!test
%! assert (isequal (fma (infsup (-1.0, inf), infsup (-0.0, -0.0), infsup (-inf, 2.0)), infsup (-inf, 2.0)));
%!test
%! assert (isequal (fma (infsup (-1.0, inf), infsup (-5.0, -1.0), infsup (-inf, 2.0)), infsup (-inf, 7.0)));
%!test
%! assert (isequal (fma (infsup (-1.0, inf), infsup (-5.0, 3.0), infsup (-inf, 2.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-1.0, inf), infsup (1.0, 3.0), infsup (-inf, 2.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-1.0, inf), infsup (-inf, -1.0), infsup (-inf, 2.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-1.0, inf), infsup (-inf, 3.0), infsup (-inf, 2.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-1.0, inf), infsup (-5.0, inf), infsup (-inf, 2.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-1.0, inf), infsup (1.0, inf), infsup (-inf, 2.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-1.0, inf), infsup (-inf, inf), infsup (-inf, 2.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-inf, 3.0), infsup (0.0, 0.0), infsup (-inf, 2.0)), infsup (-inf, 2.0)));
%!test
%! assert (isequal (fma (infsup (-inf, 3.0), infsup (-0.0, -0.0), infsup (-inf, 2.0)), infsup (-inf, 2.0)));
%!test
%! assert (isequal (fma (infsup (-inf, 3.0), infsup (-5.0, -1.0), infsup (-inf, 2.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-inf, 3.0), infsup (-5.0, 3.0), infsup (-inf, 2.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-inf, 3.0), infsup (1.0, 3.0), infsup (-inf, 2.0)), infsup (-inf, 11.0)));
%!test
%! assert (isequal (fma (infsup (-inf, 3.0), infsup (-inf, -1.0), infsup (-inf, 2.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-inf, 3.0), infsup (-inf, 3.0), infsup (-inf, 2.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-inf, 3.0), infsup (-5.0, inf), infsup (-inf, 2.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-inf, 3.0), infsup (1.0, inf), infsup (-inf, 2.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-inf, 3.0), infsup (-inf, inf), infsup (-inf, 2.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-inf, -3.0), infsup (0.0, 0.0), infsup (-inf, 2.0)), infsup (-inf, 2.0)));
%!test
%! assert (isequal (fma (infsup (-inf, -3.0), infsup (-0.0, -0.0), infsup (-inf, 2.0)), infsup (-inf, 2.0)));
%!test
%! assert (isequal (fma (infsup (-inf, -3.0), infsup (-5.0, -1.0), infsup (-inf, 2.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-inf, -3.0), infsup (-5.0, 3.0), infsup (-inf, 2.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-inf, -3.0), infsup (1.0, 3.0), infsup (-inf, 2.0)), infsup (-inf, -1.0)));
%!test
%! assert (isequal (fma (infsup (-inf, -3.0), infsup (-inf, -1.0), infsup (-inf, 2.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-inf, -3.0), infsup (-inf, 3.0), infsup (-inf, 2.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-inf, -3.0), infsup (-5.0, inf), infsup (-inf, 2.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-inf, -3.0), infsup (1.0, inf), infsup (-inf, 2.0)), infsup (-inf, -1.0)));
%!test
%! assert (isequal (fma (infsup (-inf, -3.0), infsup (-inf, inf), infsup (-inf, 2.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (0.0, 0.0), infsup (0.0, 0.0), infsup (-inf, 2.0)), infsup (-inf, 2.0)));
%!test
%! assert (isequal (fma (infsup (0.0, 0.0), infsup (-0.0, -0.0), infsup (-inf, 2.0)), infsup (-inf, 2.0)));
%!test
%! assert (isequal (fma (infsup (0.0, 0.0), infsup (-5.0, -1.0), infsup (-inf, 2.0)), infsup (-inf, 2.0)));
%!test
%! assert (isequal (fma (infsup (0.0, 0.0), infsup (-5.0, 3.0), infsup (-inf, 2.0)), infsup (-inf, 2.0)));
%!test
%! assert (isequal (fma (infsup (0.0, 0.0), infsup (1.0, 3.0), infsup (-inf, 2.0)), infsup (-inf, 2.0)));
%!test
%! assert (isequal (fma (infsup (0.0, 0.0), infsup (-inf, -1.0), infsup (-inf, 2.0)), infsup (-inf, 2.0)));
%!test
%! assert (isequal (fma (infsup (0.0, 0.0), infsup (-inf, 3.0), infsup (-inf, 2.0)), infsup (-inf, 2.0)));
%!test
%! assert (isequal (fma (infsup (0.0, 0.0), infsup (-5.0, inf), infsup (-inf, 2.0)), infsup (-inf, 2.0)));
%!test
%! assert (isequal (fma (infsup (0.0, 0.0), infsup (1.0, inf), infsup (-inf, 2.0)), infsup (-inf, 2.0)));
%!test
%! assert (isequal (fma (infsup (0.0, 0.0), infsup (-inf, inf), infsup (-inf, 2.0)), infsup (-inf, 2.0)));
%!test
%! assert (isequal (fma (infsup (-0.0, -0.0), infsup (0.0, 0.0), infsup (-inf, 2.0)), infsup (-inf, 2.0)));
%!test
%! assert (isequal (fma (infsup (-0.0, -0.0), infsup (-0.0, -0.0), infsup (-inf, 2.0)), infsup (-inf, 2.0)));
%!test
%! assert (isequal (fma (infsup (-0.0, -0.0), infsup (-5.0, -1.0), infsup (-inf, 2.0)), infsup (-inf, 2.0)));
%!test
%! assert (isequal (fma (infsup (-0.0, -0.0), infsup (-5.0, 3.0), infsup (-inf, 2.0)), infsup (-inf, 2.0)));
%!test
%! assert (isequal (fma (infsup (-0.0, -0.0), infsup (1.0, 3.0), infsup (-inf, 2.0)), infsup (-inf, 2.0)));
%!test
%! assert (isequal (fma (infsup (-0.0, -0.0), infsup (-inf, -1.0), infsup (-inf, 2.0)), infsup (-inf, 2.0)));
%!test
%! assert (isequal (fma (infsup (-0.0, -0.0), infsup (-inf, 3.0), infsup (-inf, 2.0)), infsup (-inf, 2.0)));
%!test
%! assert (isequal (fma (infsup (-0.0, -0.0), infsup (-5.0, inf), infsup (-inf, 2.0)), infsup (-inf, 2.0)));
%!test
%! assert (isequal (fma (infsup (-0.0, -0.0), infsup (1.0, inf), infsup (-inf, 2.0)), infsup (-inf, 2.0)));
%!test
%! assert (isequal (fma (infsup (-0.0, -0.0), infsup (-inf, inf), infsup (-inf, 2.0)), infsup (-inf, 2.0)));
%!test
%! assert (isequal (fma (infsup (1.0, 5.0), infsup (0.0, 0.0), infsup (-inf, 2.0)), infsup (-inf, 2.0)));
%!test
%! assert (isequal (fma (infsup (1.0, 5.0), infsup (-0.0, -0.0), infsup (-inf, 2.0)), infsup (-inf, 2.0)));
%!test
%! assert (isequal (fma (infsup (1.0, 5.0), infsup (-5.0, -1.0), infsup (-inf, 2.0)), infsup (-inf, 1.0)));
%!test
%! assert (isequal (fma (infsup (1.0, 5.0), infsup (-5.0, 3.0), infsup (-inf, 2.0)), infsup (-inf, 17.0)));
%!test
%! assert (isequal (fma (infsup (1.0, 5.0), infsup (1.0, 3.0), infsup (-inf, 2.0)), infsup (-inf, 17.0)));
%!test
%! assert (isequal (fma (infsup (1.0, 5.0), infsup (-inf, -1.0), infsup (-inf, 2.0)), infsup (-inf, 1.0)));
%!test
%! assert (isequal (fma (infsup (1.0, 5.0), infsup (-inf, 3.0), infsup (-inf, 2.0)), infsup (-inf, 17.0)));
%!test
%! assert (isequal (fma (infsup (1.0, 5.0), infsup (-5.0, inf), infsup (-inf, 2.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (1.0, 5.0), infsup (1.0, inf), infsup (-inf, 2.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (1.0, 5.0), infsup (-inf, inf), infsup (-inf, 2.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-1.0, 5.0), infsup (0.0, 0.0), infsup (-inf, 2.0)), infsup (-inf, 2.0)));
%!test
%! assert (isequal (fma (infsup (-1.0, 5.0), infsup (-0.0, -0.0), infsup (-inf, 2.0)), infsup (-inf, 2.0)));
%!test
%! assert (isequal (fma (infsup (-1.0, 5.0), infsup (-5.0, -1.0), infsup (-inf, 2.0)), infsup (-inf, 7.0)));
%!#min max
%!test
%! assert (isequal (fma (infsup (-1.0, 5.0), infsup (-5.0, 3.0), infsup (-inf, 2.0)), infsup (-inf, 17.0)));
%!test
%! assert (isequal (fma (infsup (-10.0, 2.0), infsup (-5.0, 3.0), infsup (-inf, 2.0)), infsup (-inf, 52.0)));
%!test
%! assert (isequal (fma (infsup (-1.0, 5.0), infsup (-1.0, 10.0), infsup (-inf, 2.0)), infsup (-inf, 52.0)));
%!test
%! assert (isequal (fma (infsup (-2.0, 2.0), infsup (-5.0, 3.0), infsup (-inf, 2.0)), infsup (-inf, 12.0)));
%!#end min max
%!test
%! assert (isequal (fma (infsup (-1.0, 5.0), infsup (1.0, 3.0), infsup (-inf, 2.0)), infsup (-inf, 17.0)));
%!test
%! assert (isequal (fma (infsup (-1.0, 5.0), infsup (-inf, -1.0), infsup (-inf, 2.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-1.0, 5.0), infsup (-inf, 3.0), infsup (-inf, 2.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-1.0, 5.0), infsup (-5.0, inf), infsup (-inf, 2.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-1.0, 5.0), infsup (1.0, inf), infsup (-inf, 2.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-1.0, 5.0), infsup (-inf, inf), infsup (-inf, 2.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-10.0, -5.0), infsup (0.0, 0.0), infsup (-inf, 2.0)), infsup (-inf, 2.0)));
%!test
%! assert (isequal (fma (infsup (-10.0, -5.0), infsup (-0.0, -0.0), infsup (-inf, 2.0)), infsup (-inf, 2.0)));
%!test
%! assert (isequal (fma (infsup (-10.0, -5.0), infsup (-5.0, -1.0), infsup (-inf, 2.0)), infsup (-inf, 52.0)));
%!test
%! assert (isequal (fma (infsup (-10.0, -5.0), infsup (-5.0, 3.0), infsup (-inf, 2.0)), infsup (-inf, 52.0)));
%!test
%! assert (isequal (fma (infsup (-10.0, -5.0), infsup (1.0, 3.0), infsup (-inf, 2.0)), infsup (-inf, -3.0)));
%!test
%! assert (isequal (fma (infsup (-10.0, -5.0), infsup (-inf, -1.0), infsup (-inf, 2.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-10.0, -5.0), infsup (-inf, 3.0), infsup (-inf, 2.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-10.0, -5.0), infsup (-5.0, inf), infsup (-inf, 2.0)), infsup (-inf, 52.0)));
%!test
%! assert (isequal (fma (infsup (-10.0, -5.0), infsup (1.0, inf), infsup (-inf, 2.0)), infsup (-inf, -3.0)));
%!test
%! assert (isequal (fma (infsup (-10.0, -5.0), infsup (-inf, inf), infsup (-inf, 2.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup, infsup, infsup (-2.0, 2.0)), infsup));
%!test
%! assert (isequal (fma (infsup (-1.0, 1.0), infsup, infsup (-2.0, 2.0)), infsup));
%!test
%! assert (isequal (fma (infsup, infsup (-1.0, 1.0), infsup (-2.0, 2.0)), infsup));
%!test
%! assert (isequal (fma (infsup, infsup (-inf, inf), infsup (-2.0, 2.0)), infsup));
%!test
%! assert (isequal (fma (infsup (-inf, inf), infsup, infsup (-2.0, 2.0)), infsup));
%!test
%! assert (isequal (fma (infsup (0.0, 0.0), infsup, infsup (-2.0, 2.0)), infsup));
%!test
%! assert (isequal (fma (infsup (-0.0, -0.0), infsup, infsup (-2.0, 2.0)), infsup));
%!test
%! assert (isequal (fma (infsup, infsup (0.0, 0.0), infsup (-2.0, 2.0)), infsup));
%!test
%! assert (isequal (fma (infsup, infsup (-0.0, -0.0), infsup (-2.0, 2.0)), infsup));
%!test
%! assert (isequal (fma (infsup (-inf, inf), infsup (0.0, 0.0), infsup (-2.0, 2.0)), infsup (-2.0, 2.0)));
%!test
%! assert (isequal (fma (infsup (-inf, inf), infsup (-0.0, -0.0), infsup (-2.0, 2.0)), infsup (-2.0, 2.0)));
%!test
%! assert (isequal (fma (infsup (-inf, inf), infsup (-5.0, -1.0), infsup (-2.0, 2.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-inf, inf), infsup (-5.0, 3.0), infsup (-2.0, 2.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-inf, inf), infsup (1.0, 3.0), infsup (-2.0, 2.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-inf, inf), infsup (-inf, -1.0), infsup (-2.0, 2.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-inf, inf), infsup (-inf, 3.0), infsup (-2.0, 2.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-inf, inf), infsup (-5.0, inf), infsup (-2.0, 2.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-inf, inf), infsup (1.0, inf), infsup (-2.0, 2.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-inf, inf), infsup (-inf, inf), infsup (-2.0, 2.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (1.0, inf), infsup (0.0, 0.0), infsup (-2.0, 2.0)), infsup (-2.0, 2.0)));
%!test
%! assert (isequal (fma (infsup (1.0, inf), infsup (-0.0, -0.0), infsup (-2.0, 2.0)), infsup (-2.0, 2.0)));
%!test
%! assert (isequal (fma (infsup (1.0, inf), infsup (-5.0, -1.0), infsup (-2.0, 2.0)), infsup (-inf, 1.0)));
%!test
%! assert (isequal (fma (infsup (1.0, inf), infsup (-5.0, 3.0), infsup (-2.0, 2.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (1.0, inf), infsup (1.0, 3.0), infsup (-2.0, 2.0)), infsup (-1.0, inf)));
%!test
%! assert (isequal (fma (infsup (1.0, inf), infsup (-inf, -1.0), infsup (-2.0, 2.0)), infsup (-inf, 1.0)));
%!test
%! assert (isequal (fma (infsup (1.0, inf), infsup (-inf, 3.0), infsup (-2.0, 2.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (1.0, inf), infsup (-5.0, inf), infsup (-2.0, 2.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (1.0, inf), infsup (1.0, inf), infsup (-2.0, 2.0)), infsup (-1.0, inf)));
%!test
%! assert (isequal (fma (infsup (1.0, inf), infsup (-inf, inf), infsup (-2.0, 2.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-1.0, inf), infsup (0.0, 0.0), infsup (-2.0, 2.0)), infsup (-2.0, 2.0)));
%!test
%! assert (isequal (fma (infsup (-1.0, inf), infsup (-0.0, -0.0), infsup (-2.0, 2.0)), infsup (-2.0, 2.0)));
%!test
%! assert (isequal (fma (infsup (-1.0, inf), infsup (-5.0, -1.0), infsup (-2.0, 2.0)), infsup (-inf, 7.0)));
%!test
%! assert (isequal (fma (infsup (-1.0, inf), infsup (-5.0, 3.0), infsup (-2.0, 2.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-1.0, inf), infsup (1.0, 3.0), infsup (-2.0, 2.0)), infsup (-5.0, inf)));
%!test
%! assert (isequal (fma (infsup (-1.0, inf), infsup (-inf, -1.0), infsup (-2.0, 2.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-1.0, inf), infsup (-inf, 3.0), infsup (-2.0, 2.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-1.0, inf), infsup (-5.0, inf), infsup (-2.0, 2.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-1.0, inf), infsup (1.0, inf), infsup (-2.0, 2.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-1.0, inf), infsup (-inf, inf), infsup (-2.0, 2.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-inf, 3.0), infsup (0.0, 0.0), infsup (-2.0, 2.0)), infsup (-2.0, 2.0)));
%!test
%! assert (isequal (fma (infsup (-inf, 3.0), infsup (-0.0, -0.0), infsup (-2.0, 2.0)), infsup (-2.0, 2.0)));
%!test
%! assert (isequal (fma (infsup (-inf, 3.0), infsup (-5.0, -1.0), infsup (-2.0, 2.0)), infsup (-17.0, inf)));
%!test
%! assert (isequal (fma (infsup (-inf, 3.0), infsup (-5.0, 3.0), infsup (-2.0, 2.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-inf, 3.0), infsup (1.0, 3.0), infsup (-2.0, 2.0)), infsup (-inf, 11.0)));
%!test
%! assert (isequal (fma (infsup (-inf, 3.0), infsup (-inf, -1.0), infsup (-2.0, 2.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-inf, 3.0), infsup (-inf, 3.0), infsup (-2.0, 2.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-inf, 3.0), infsup (-5.0, inf), infsup (-2.0, 2.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-inf, 3.0), infsup (1.0, inf), infsup (-2.0, 2.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-inf, 3.0), infsup (-inf, inf), infsup (-2.0, 2.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-inf, -3.0), infsup (0.0, 0.0), infsup (-2.0, 2.0)), infsup (-2.0, 2.0)));
%!test
%! assert (isequal (fma (infsup (-inf, -3.0), infsup (-0.0, -0.0), infsup (-2.0, 2.0)), infsup (-2.0, 2.0)));
%!test
%! assert (isequal (fma (infsup (-inf, -3.0), infsup (-5.0, -1.0), infsup (-2.0, 2.0)), infsup (1.0, inf)));
%!test
%! assert (isequal (fma (infsup (-inf, -3.0), infsup (-5.0, 3.0), infsup (-2.0, 2.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-inf, -3.0), infsup (1.0, 3.0), infsup (-2.0, 2.0)), infsup (-inf, -1.0)));
%!test
%! assert (isequal (fma (infsup (-inf, -3.0), infsup (-inf, -1.0), infsup (-2.0, 2.0)), infsup (1.0, inf)));
%!test
%! assert (isequal (fma (infsup (-inf, -3.0), infsup (-inf, 3.0), infsup (-2.0, 2.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-inf, -3.0), infsup (-5.0, inf), infsup (-2.0, 2.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-inf, -3.0), infsup (1.0, inf), infsup (-2.0, 2.0)), infsup (-inf, -1.0)));
%!test
%! assert (isequal (fma (infsup (-inf, -3.0), infsup (-inf, inf), infsup (-2.0, 2.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (0.0, 0.0), infsup (0.0, 0.0), infsup (-2.0, 2.0)), infsup (-2.0, 2.0)));
%!test
%! assert (isequal (fma (infsup (0.0, 0.0), infsup (-0.0, -0.0), infsup (-2.0, 2.0)), infsup (-2.0, 2.0)));
%!test
%! assert (isequal (fma (infsup (0.0, 0.0), infsup (-5.0, -1.0), infsup (-2.0, 2.0)), infsup (-2.0, 2.0)));
%!test
%! assert (isequal (fma (infsup (0.0, 0.0), infsup (-5.0, 3.0), infsup (-2.0, 2.0)), infsup (-2.0, 2.0)));
%!test
%! assert (isequal (fma (infsup (0.0, 0.0), infsup (1.0, 3.0), infsup (-2.0, 2.0)), infsup (-2.0, 2.0)));
%!test
%! assert (isequal (fma (infsup (0.0, 0.0), infsup (-inf, -1.0), infsup (-2.0, 2.0)), infsup (-2.0, 2.0)));
%!test
%! assert (isequal (fma (infsup (0.0, 0.0), infsup (-inf, 3.0), infsup (-2.0, 2.0)), infsup (-2.0, 2.0)));
%!test
%! assert (isequal (fma (infsup (0.0, 0.0), infsup (-5.0, inf), infsup (-2.0, 2.0)), infsup (-2.0, 2.0)));
%!test
%! assert (isequal (fma (infsup (0.0, 0.0), infsup (1.0, inf), infsup (-2.0, 2.0)), infsup (-2.0, 2.0)));
%!test
%! assert (isequal (fma (infsup (0.0, 0.0), infsup (-inf, inf), infsup (-2.0, 2.0)), infsup (-2.0, 2.0)));
%!test
%! assert (isequal (fma (infsup (-0.0, -0.0), infsup (0.0, 0.0), infsup (-2.0, 2.0)), infsup (-2.0, 2.0)));
%!test
%! assert (isequal (fma (infsup (-0.0, -0.0), infsup (-0.0, -0.0), infsup (-2.0, 2.0)), infsup (-2.0, 2.0)));
%!test
%! assert (isequal (fma (infsup (-0.0, -0.0), infsup (-5.0, -1.0), infsup (-2.0, 2.0)), infsup (-2.0, 2.0)));
%!test
%! assert (isequal (fma (infsup (-0.0, -0.0), infsup (-5.0, 3.0), infsup (-2.0, 2.0)), infsup (-2.0, 2.0)));
%!test
%! assert (isequal (fma (infsup (-0.0, -0.0), infsup (1.0, 3.0), infsup (-2.0, 2.0)), infsup (-2.0, 2.0)));
%!test
%! assert (isequal (fma (infsup (-0.0, -0.0), infsup (-inf, -1.0), infsup (-2.0, 2.0)), infsup (-2.0, 2.0)));
%!test
%! assert (isequal (fma (infsup (-0.0, -0.0), infsup (-inf, 3.0), infsup (-2.0, 2.0)), infsup (-2.0, 2.0)));
%!test
%! assert (isequal (fma (infsup (-0.0, -0.0), infsup (-5.0, inf), infsup (-2.0, 2.0)), infsup (-2.0, 2.0)));
%!test
%! assert (isequal (fma (infsup (-0.0, -0.0), infsup (1.0, inf), infsup (-2.0, 2.0)), infsup (-2.0, 2.0)));
%!test
%! assert (isequal (fma (infsup (-0.0, -0.0), infsup (-inf, inf), infsup (-2.0, 2.0)), infsup (-2.0, 2.0)));
%!test
%! assert (isequal (fma (infsup (1.0, 5.0), infsup (0.0, 0.0), infsup (-2.0, 2.0)), infsup (-2.0, 2.0)));
%!test
%! assert (isequal (fma (infsup (1.0, 5.0), infsup (-0.0, -0.0), infsup (-2.0, 2.0)), infsup (-2.0, 2.0)));
%!test
%! assert (isequal (fma (infsup (1.0, 5.0), infsup (-5.0, -1.0), infsup (-2.0, 2.0)), infsup (-27.0, 1.0)));
%!test
%! assert (isequal (fma (infsup (1.0, 5.0), infsup (-5.0, 3.0), infsup (-2.0, 2.0)), infsup (-27.0, 17.0)));
%!test
%! assert (isequal (fma (infsup (1.0, 5.0), infsup (1.0, 3.0), infsup (-2.0, 2.0)), infsup (-1.0, 17.0)));
%!test
%! assert (isequal (fma (infsup (1.0, 5.0), infsup (-inf, -1.0), infsup (-2.0, 2.0)), infsup (-inf, 1.0)));
%!test
%! assert (isequal (fma (infsup (1.0, 5.0), infsup (-inf, 3.0), infsup (-2.0, 2.0)), infsup (-inf, 17.0)));
%!test
%! assert (isequal (fma (infsup (1.0, 5.0), infsup (-5.0, inf), infsup (-2.0, 2.0)), infsup (-27.0, inf)));
%!test
%! assert (isequal (fma (infsup (1.0, 5.0), infsup (1.0, inf), infsup (-2.0, 2.0)), infsup (-1.0, inf)));
%!test
%! assert (isequal (fma (infsup (1.0, 5.0), infsup (-inf, inf), infsup (-2.0, 2.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-1.0, 5.0), infsup (0.0, 0.0), infsup (-2.0, 2.0)), infsup (-2.0, 2.0)));
%!test
%! assert (isequal (fma (infsup (-1.0, 5.0), infsup (-0.0, -0.0), infsup (-2.0, 2.0)), infsup (-2.0, 2.0)));
%!test
%! assert (isequal (fma (infsup (-1.0, 5.0), infsup (-5.0, -1.0), infsup (-2.0, 2.0)), infsup (-27.0, 7.0)));
%!#min max
%!test
%! assert (isequal (fma (infsup (-1.0, 5.0), infsup (-5.0, 3.0), infsup (-2.0, 2.0)), infsup (-27.0, 17.0)));
%!test
%! assert (isequal (fma (infsup (-10.0, 2.0), infsup (-5.0, 3.0), infsup (-2.0, 2.0)), infsup (-32.0, 52.0)));
%!test
%! assert (isequal (fma (infsup (-1.0, 5.0), infsup (-1.0, 10.0), infsup (-2.0, 2.0)), infsup (-12.0, 52.0)));
%!test
%! assert (isequal (fma (infsup (-2.0, 2.0), infsup (-5.0, 3.0), infsup (-2.0, 2.0)), infsup (-12.0, 12.0)));
%!#end min max
%!test
%! assert (isequal (fma (infsup (-1.0, 5.0), infsup (1.0, 3.0), infsup (-2.0, 2.0)), infsup (-5.0, 17.0)));
%!test
%! assert (isequal (fma (infsup (-1.0, 5.0), infsup (-inf, -1.0), infsup (-2.0, 2.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-1.0, 5.0), infsup (-inf, 3.0), infsup (-2.0, 2.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-1.0, 5.0), infsup (-5.0, inf), infsup (-2.0, 2.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-1.0, 5.0), infsup (1.0, inf), infsup (-2.0, 2.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-1.0, 5.0), infsup (-inf, inf), infsup (-2.0, 2.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-10.0, -5.0), infsup (0.0, 0.0), infsup (-2.0, 2.0)), infsup (-2.0, 2.0)));
%!test
%! assert (isequal (fma (infsup (-10.0, -5.0), infsup (-0.0, -0.0), infsup (-2.0, 2.0)), infsup (-2.0, 2.0)));
%!test
%! assert (isequal (fma (infsup (-10.0, -5.0), infsup (-5.0, -1.0), infsup (-2.0, 2.0)), infsup (3.0, 52.0)));
%!test
%! assert (isequal (fma (infsup (-10.0, -5.0), infsup (-5.0, 3.0), infsup (-2.0, 2.0)), infsup (-32.0, 52.0)));
%!test
%! assert (isequal (fma (infsup (-10.0, -5.0), infsup (1.0, 3.0), infsup (-2.0, 2.0)), infsup (-32.0, -3.0)));
%!test
%! assert (isequal (fma (infsup (-10.0, -5.0), infsup (-inf, -1.0), infsup (-2.0, 2.0)), infsup (3.0, inf)));
%!test
%! assert (isequal (fma (infsup (-10.0, -5.0), infsup (-inf, 3.0), infsup (-2.0, 2.0)), infsup (-32.0, inf)));
%!test
%! assert (isequal (fma (infsup (-10.0, -5.0), infsup (-5.0, inf), infsup (-2.0, 2.0)), infsup (-inf, 52.0)));
%!test
%! assert (isequal (fma (infsup (-10.0, -5.0), infsup (1.0, inf), infsup (-2.0, 2.0)), infsup (-inf, -3.0)));
%!test
%! assert (isequal (fma (infsup (-10.0, -5.0), infsup (-inf, inf), infsup (-2.0, 2.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup, infsup, infsup (-2.0, inf)), infsup));
%!test
%! assert (isequal (fma (infsup (-1.0, 1.0), infsup, infsup (-2.0, inf)), infsup));
%!test
%! assert (isequal (fma (infsup, infsup (-1.0, 1.0), infsup (-2.0, inf)), infsup));
%!test
%! assert (isequal (fma (infsup, infsup (-inf, inf), infsup (-2.0, inf)), infsup));
%!test
%! assert (isequal (fma (infsup (-inf, inf), infsup, infsup (-2.0, inf)), infsup));
%!test
%! assert (isequal (fma (infsup (0.0, 0.0), infsup, infsup (-2.0, inf)), infsup));
%!test
%! assert (isequal (fma (infsup (-0.0, -0.0), infsup, infsup (-2.0, inf)), infsup));
%!test
%! assert (isequal (fma (infsup, infsup (0.0, 0.0), infsup (-2.0, inf)), infsup));
%!test
%! assert (isequal (fma (infsup, infsup (-0.0, -0.0), infsup (-2.0, inf)), infsup));
%!test
%! assert (isequal (fma (infsup (-inf, inf), infsup (0.0, 0.0), infsup (-2.0, inf)), infsup (-2.0, inf)));
%!test
%! assert (isequal (fma (infsup (-inf, inf), infsup (-0.0, -0.0), infsup (-2.0, inf)), infsup (-2.0, inf)));
%!test
%! assert (isequal (fma (infsup (-inf, inf), infsup (-5.0, -1.0), infsup (-2.0, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-inf, inf), infsup (-5.0, 3.0), infsup (-2.0, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-inf, inf), infsup (1.0, 3.0), infsup (-2.0, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-inf, inf), infsup (-inf, -1.0), infsup (-2.0, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-inf, inf), infsup (-inf, 3.0), infsup (-2.0, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-inf, inf), infsup (-5.0, inf), infsup (-2.0, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-inf, inf), infsup (1.0, inf), infsup (-2.0, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-inf, inf), infsup (-inf, inf), infsup (-2.0, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (1.0, inf), infsup (0.0, 0.0), infsup (-2.0, inf)), infsup (-2.0, inf)));
%!test
%! assert (isequal (fma (infsup (1.0, inf), infsup (-0.0, -0.0), infsup (-2.0, inf)), infsup (-2.0, inf)));
%!test
%! assert (isequal (fma (infsup (1.0, inf), infsup (-5.0, -1.0), infsup (-2.0, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (1.0, inf), infsup (-5.0, 3.0), infsup (-2.0, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (1.0, inf), infsup (1.0, 3.0), infsup (-2.0, inf)), infsup (-1.0, inf)));
%!test
%! assert (isequal (fma (infsup (1.0, inf), infsup (-inf, -1.0), infsup (-2.0, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (1.0, inf), infsup (-inf, 3.0), infsup (-2.0, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (1.0, inf), infsup (-5.0, inf), infsup (-2.0, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (1.0, inf), infsup (1.0, inf), infsup (-2.0, inf)), infsup (-1.0, inf)));
%!test
%! assert (isequal (fma (infsup (1.0, inf), infsup (-inf, inf), infsup (-2.0, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-1.0, inf), infsup (0.0, 0.0), infsup (-2.0, inf)), infsup (-2.0, inf)));
%!test
%! assert (isequal (fma (infsup (-1.0, inf), infsup (-0.0, -0.0), infsup (-2.0, inf)), infsup (-2.0, inf)));
%!test
%! assert (isequal (fma (infsup (-1.0, inf), infsup (-5.0, -1.0), infsup (-2.0, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-1.0, inf), infsup (-5.0, 3.0), infsup (-2.0, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-1.0, inf), infsup (1.0, 3.0), infsup (-2.0, inf)), infsup (-5.0, inf)));
%!test
%! assert (isequal (fma (infsup (-1.0, inf), infsup (-inf, -1.0), infsup (-2.0, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-1.0, inf), infsup (-inf, 3.0), infsup (-2.0, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-1.0, inf), infsup (-5.0, inf), infsup (-2.0, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-1.0, inf), infsup (1.0, inf), infsup (-2.0, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-1.0, inf), infsup (-inf, inf), infsup (-2.0, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-inf, 3.0), infsup (0.0, 0.0), infsup (-2.0, inf)), infsup (-2.0, inf)));
%!test
%! assert (isequal (fma (infsup (-inf, 3.0), infsup (-0.0, -0.0), infsup (-2.0, inf)), infsup (-2.0, inf)));
%!test
%! assert (isequal (fma (infsup (-inf, 3.0), infsup (-5.0, -1.0), infsup (-2.0, inf)), infsup (-17.0, inf)));
%!test
%! assert (isequal (fma (infsup (-inf, 3.0), infsup (-5.0, 3.0), infsup (-2.0, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-inf, 3.0), infsup (1.0, 3.0), infsup (-2.0, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-inf, 3.0), infsup (-inf, -1.0), infsup (-2.0, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-inf, 3.0), infsup (-inf, 3.0), infsup (-2.0, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-inf, 3.0), infsup (-5.0, inf), infsup (-2.0, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-inf, 3.0), infsup (1.0, inf), infsup (-2.0, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-inf, 3.0), infsup (-inf, inf), infsup (-2.0, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-inf, -3.0), infsup (0.0, 0.0), infsup (-2.0, inf)), infsup (-2.0, inf)));
%!test
%! assert (isequal (fma (infsup (-inf, -3.0), infsup (-0.0, -0.0), infsup (-2.0, inf)), infsup (-2.0, inf)));
%!test
%! assert (isequal (fma (infsup (-inf, -3.0), infsup (-5.0, -1.0), infsup (-2.0, inf)), infsup (1.0, inf)));
%!test
%! assert (isequal (fma (infsup (-inf, -3.0), infsup (-5.0, 3.0), infsup (-2.0, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-inf, -3.0), infsup (1.0, 3.0), infsup (-2.0, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-inf, -3.0), infsup (-inf, -1.0), infsup (-2.0, inf)), infsup (1.0, inf)));
%!test
%! assert (isequal (fma (infsup (-inf, -3.0), infsup (-inf, 3.0), infsup (-2.0, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-inf, -3.0), infsup (-5.0, inf), infsup (-2.0, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-inf, -3.0), infsup (1.0, inf), infsup (-2.0, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-inf, -3.0), infsup (-inf, inf), infsup (-2.0, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (0.0, 0.0), infsup (0.0, 0.0), infsup (-2.0, inf)), infsup (-2.0, inf)));
%!test
%! assert (isequal (fma (infsup (0.0, 0.0), infsup (-0.0, -0.0), infsup (-2.0, inf)), infsup (-2.0, inf)));
%!test
%! assert (isequal (fma (infsup (0.0, 0.0), infsup (-5.0, -1.0), infsup (-2.0, inf)), infsup (-2.0, inf)));
%!test
%! assert (isequal (fma (infsup (0.0, 0.0), infsup (-5.0, 3.0), infsup (-2.0, inf)), infsup (-2.0, inf)));
%!test
%! assert (isequal (fma (infsup (0.0, 0.0), infsup (1.0, 3.0), infsup (-2.0, inf)), infsup (-2.0, inf)));
%!test
%! assert (isequal (fma (infsup (0.0, 0.0), infsup (-inf, -1.0), infsup (-2.0, inf)), infsup (-2.0, inf)));
%!test
%! assert (isequal (fma (infsup (0.0, 0.0), infsup (-inf, 3.0), infsup (-2.0, inf)), infsup (-2.0, inf)));
%!test
%! assert (isequal (fma (infsup (0.0, 0.0), infsup (-5.0, inf), infsup (-2.0, inf)), infsup (-2.0, inf)));
%!test
%! assert (isequal (fma (infsup (0.0, 0.0), infsup (1.0, inf), infsup (-2.0, inf)), infsup (-2.0, inf)));
%!test
%! assert (isequal (fma (infsup (0.0, 0.0), infsup (-inf, inf), infsup (-2.0, inf)), infsup (-2.0, inf)));
%!test
%! assert (isequal (fma (infsup (-0.0, -0.0), infsup (0.0, 0.0), infsup (-2.0, inf)), infsup (-2.0, inf)));
%!test
%! assert (isequal (fma (infsup (-0.0, -0.0), infsup (-0.0, -0.0), infsup (-2.0, inf)), infsup (-2.0, inf)));
%!test
%! assert (isequal (fma (infsup (-0.0, -0.0), infsup (-5.0, -1.0), infsup (-2.0, inf)), infsup (-2.0, inf)));
%!test
%! assert (isequal (fma (infsup (-0.0, -0.0), infsup (-5.0, 3.0), infsup (-2.0, inf)), infsup (-2.0, inf)));
%!test
%! assert (isequal (fma (infsup (-0.0, -0.0), infsup (1.0, 3.0), infsup (-2.0, inf)), infsup (-2.0, inf)));
%!test
%! assert (isequal (fma (infsup (-0.0, -0.0), infsup (-inf, -1.0), infsup (-2.0, inf)), infsup (-2.0, inf)));
%!test
%! assert (isequal (fma (infsup (-0.0, -0.0), infsup (-inf, 3.0), infsup (-2.0, inf)), infsup (-2.0, inf)));
%!test
%! assert (isequal (fma (infsup (-0.0, -0.0), infsup (-5.0, inf), infsup (-2.0, inf)), infsup (-2.0, inf)));
%!test
%! assert (isequal (fma (infsup (-0.0, -0.0), infsup (1.0, inf), infsup (-2.0, inf)), infsup (-2.0, inf)));
%!test
%! assert (isequal (fma (infsup (-0.0, -0.0), infsup (-inf, inf), infsup (-2.0, inf)), infsup (-2.0, inf)));
%!test
%! assert (isequal (fma (infsup (1.0, 5.0), infsup (0.0, 0.0), infsup (-2.0, inf)), infsup (-2.0, inf)));
%!test
%! assert (isequal (fma (infsup (1.0, 5.0), infsup (-0.0, -0.0), infsup (-2.0, inf)), infsup (-2.0, inf)));
%!test
%! assert (isequal (fma (infsup (1.0, 5.0), infsup (-5.0, -1.0), infsup (-2.0, inf)), infsup (-27.0, inf)));
%!test
%! assert (isequal (fma (infsup (1.0, 5.0), infsup (-5.0, 3.0), infsup (-2.0, inf)), infsup (-27.0, inf)));
%!test
%! assert (isequal (fma (infsup (1.0, 5.0), infsup (1.0, 3.0), infsup (-2.0, inf)), infsup (-1.0, inf)));
%!test
%! assert (isequal (fma (infsup (1.0, 5.0), infsup (-inf, -1.0), infsup (-2.0, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (1.0, 5.0), infsup (-inf, 3.0), infsup (-2.0, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (1.0, 5.0), infsup (-5.0, inf), infsup (-2.0, inf)), infsup (-27.0, inf)));
%!test
%! assert (isequal (fma (infsup (1.0, 5.0), infsup (1.0, inf), infsup (-2.0, inf)), infsup (-1.0, inf)));
%!test
%! assert (isequal (fma (infsup (1.0, 5.0), infsup (-inf, inf), infsup (-2.0, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-1.0, 5.0), infsup (-0.0, -0.0), infsup (-2.0, inf)), infsup (-2.0, inf)));
%!test
%! assert (isequal (fma (infsup (-1.0, 5.0), infsup (0.0, 0.0), infsup (-2.0, inf)), infsup (-2.0, inf)));
%!test
%! assert (isequal (fma (infsup (-1.0, 5.0), infsup (-5.0, -1.0), infsup (-2.0, inf)), infsup (-27.0, inf)));
%!#min max
%!test
%! assert (isequal (fma (infsup (-1.0, 5.0), infsup (-5.0, 3.0), infsup (-2.0, inf)), infsup (-27.0, inf)));
%!test
%! assert (isequal (fma (infsup (-10.0, 2.0), infsup (-5.0, 3.0), infsup (-2.0, inf)), infsup (-32.0, inf)));
%!test
%! assert (isequal (fma (infsup (-1.0, 5.0), infsup (-1.0, 10.0), infsup (-2.0, inf)), infsup (-12.0, inf)));
%!test
%! assert (isequal (fma (infsup (-2.0, 2.0), infsup (-5.0, 3.0), infsup (-2.0, inf)), infsup (-12.0, inf)));
%!#end min max
%!test
%! assert (isequal (fma (infsup (-1.0, 5.0), infsup (1.0, 3.0), infsup (-2.0, inf)), infsup (-5.0, inf)));
%!test
%! assert (isequal (fma (infsup (-1.0, 5.0), infsup (-inf, -1.0), infsup (-2.0, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-1.0, 5.0), infsup (-inf, 3.0), infsup (-2.0, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-1.0, 5.0), infsup (-5.0, inf), infsup (-2.0, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-1.0, 5.0), infsup (1.0, inf), infsup (-2.0, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-1.0, 5.0), infsup (-inf, inf), infsup (-2.0, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-10.0, -5.0), infsup (0.0, 0.0), infsup (-2.0, inf)), infsup (-2.0, inf)));
%!test
%! assert (isequal (fma (infsup (-10.0, -5.0), infsup (-0.0, -0.0), infsup (-2.0, inf)), infsup (-2.0, inf)));
%!test
%! assert (isequal (fma (infsup (-10.0, -5.0), infsup (-5.0, -1.0), infsup (-2.0, inf)), infsup (3.0, inf)));
%!test
%! assert (isequal (fma (infsup (-10.0, -5.0), infsup (-5.0, 3.0), infsup (-2.0, inf)), infsup (-32.0, inf)));
%!test
%! assert (isequal (fma (infsup (-10.0, -5.0), infsup (1.0, 3.0), infsup (-2.0, inf)), infsup (-32.0, inf)));
%!test
%! assert (isequal (fma (infsup (-10.0, -5.0), infsup (-inf, -1.0), infsup (-2.0, inf)), infsup (3.0, inf)));
%!test
%! assert (isequal (fma (infsup (-10.0, -5.0), infsup (-inf, 3.0), infsup (-2.0, inf)), infsup (-32.0, inf)));
%!test
%! assert (isequal (fma (infsup (-10.0, -5.0), infsup (-5.0, inf), infsup (-2.0, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-10.0, -5.0), infsup (1.0, inf), infsup (-2.0, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-10.0, -5.0), infsup (-inf, inf), infsup (-2.0, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup, infsup, infsup (-inf, inf)), infsup));
%!test
%! assert (isequal (fma (infsup (-1.0, 1.0), infsup, infsup (-inf, inf)), infsup));
%!test
%! assert (isequal (fma (infsup, infsup (-1.0, 1.0), infsup (-inf, inf)), infsup));
%!test
%! assert (isequal (fma (infsup, infsup (-inf, inf), infsup (-inf, inf)), infsup));
%!test
%! assert (isequal (fma (infsup (-inf, inf), infsup, infsup (-inf, inf)), infsup));
%!test
%! assert (isequal (fma (infsup (0.0, 0.0), infsup, infsup (-inf, inf)), infsup));
%!test
%! assert (isequal (fma (infsup (-0.0, -0.0), infsup, infsup (-inf, inf)), infsup));
%!test
%! assert (isequal (fma (infsup, infsup (0.0, 0.0), infsup (-inf, inf)), infsup));
%!test
%! assert (isequal (fma (infsup, infsup (-0.0, -0.0), infsup (-inf, inf)), infsup));
%!test
%! assert (isequal (fma (infsup (-inf, inf), infsup (0.0, 0.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-inf, inf), infsup (-0.0, -0.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-inf, inf), infsup (-5.0, -1.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-inf, inf), infsup (-5.0, 3.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-inf, inf), infsup (1.0, 3.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-inf, inf), infsup (-inf, -1.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-inf, inf), infsup (-inf, 3.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-inf, inf), infsup (-5.0, inf), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-inf, inf), infsup (1.0, inf), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-inf, inf), infsup (-inf, inf), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (1.0, inf), infsup (0.0, 0.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (1.0, inf), infsup (-0.0, -0.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (1.0, inf), infsup (-5.0, -1.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (1.0, inf), infsup (-5.0, 3.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (1.0, inf), infsup (1.0, 3.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (1.0, inf), infsup (-inf, -1.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (1.0, inf), infsup (-inf, 3.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (1.0, inf), infsup (-5.0, inf), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (1.0, inf), infsup (1.0, inf), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (1.0, inf), infsup (-inf, inf), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-1.0, inf), infsup (0.0, 0.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-1.0, inf), infsup (-0.0, -0.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-1.0, inf), infsup (-5.0, -1.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-1.0, inf), infsup (-5.0, 3.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-1.0, inf), infsup (1.0, 3.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-1.0, inf), infsup (-inf, -1.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-1.0, inf), infsup (-inf, 3.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-1.0, inf), infsup (-5.0, inf), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-1.0, inf), infsup (1.0, inf), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-1.0, inf), infsup (-inf, inf), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-inf, 3.0), infsup (0.0, 0.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-inf, 3.0), infsup (-0.0, -0.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-inf, 3.0), infsup (-5.0, -1.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-inf, 3.0), infsup (-5.0, 3.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-inf, 3.0), infsup (1.0, 3.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-inf, 3.0), infsup (-inf, -1.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-inf, 3.0), infsup (-inf, 3.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-inf, 3.0), infsup (-5.0, inf), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-inf, 3.0), infsup (1.0, inf), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-inf, 3.0), infsup (-inf, inf), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-inf, -3.0), infsup (0.0, 0.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-inf, -3.0), infsup (-0.0, -0.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-inf, -3.0), infsup (-5.0, -1.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-inf, -3.0), infsup (-5.0, 3.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-inf, -3.0), infsup (1.0, 3.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-inf, -3.0), infsup (-inf, -1.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-inf, -3.0), infsup (-inf, 3.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-inf, -3.0), infsup (-5.0, inf), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-inf, -3.0), infsup (1.0, inf), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-inf, -3.0), infsup (-inf, inf), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (0.0, 0.0), infsup (0.0, 0.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (0.0, 0.0), infsup (-0.0, -0.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (0.0, 0.0), infsup (-5.0, -1.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (0.0, 0.0), infsup (-5.0, 3.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (0.0, 0.0), infsup (1.0, 3.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (0.0, 0.0), infsup (-inf, -1.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (0.0, 0.0), infsup (-inf, 3.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (0.0, 0.0), infsup (-5.0, inf), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (0.0, 0.0), infsup (1.0, inf), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (0.0, 0.0), infsup (-inf, inf), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-0.0, -0.0), infsup (0.0, 0.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-0.0, -0.0), infsup (-0.0, -0.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-0.0, -0.0), infsup (-5.0, -1.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-0.0, -0.0), infsup (-5.0, 3.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-0.0, -0.0), infsup (1.0, 3.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-0.0, -0.0), infsup (-inf, -1.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-0.0, -0.0), infsup (-inf, 3.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-0.0, -0.0), infsup (-5.0, inf), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-0.0, -0.0), infsup (1.0, inf), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-0.0, -0.0), infsup (-inf, inf), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (1.0, 5.0), infsup (0.0, 0.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (1.0, 5.0), infsup (-0.0, -0.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (1.0, 5.0), infsup (-5.0, -1.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (1.0, 5.0), infsup (-5.0, 3.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (1.0, 5.0), infsup (1.0, 3.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (1.0, 5.0), infsup (-inf, -1.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (1.0, 5.0), infsup (-inf, 3.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (1.0, 5.0), infsup (-5.0, inf), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (1.0, 5.0), infsup (1.0, inf), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (1.0, 5.0), infsup (-inf, inf), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-1.0, 5.0), infsup (0.0, 0.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-1.0, 5.0), infsup (-0.0, -0.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-1.0, 5.0), infsup (-5.0, -1.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!#min max
%!test
%! assert (isequal (fma (infsup (-1.0, 5.0), infsup (-5.0, 3.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-10.0, 2.0), infsup (-5.0, 3.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-1.0, 5.0), infsup (-1.0, 10.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-2.0, 2.0), infsup (-5.0, 3.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!#end min max
%!test
%! assert (isequal (fma (infsup (-1.0, 5.0), infsup (1.0, 3.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-1.0, 5.0), infsup (-inf, -1.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-1.0, 5.0), infsup (-inf, 3.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-1.0, 5.0), infsup (-5.0, inf), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-1.0, 5.0), infsup (1.0, inf), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-1.0, 5.0), infsup (-inf, inf), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-10.0, -5.0), infsup (0.0, 0.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-10.0, -5.0), infsup (-0.0, -0.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-10.0, -5.0), infsup (-5.0, -1.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-10.0, -5.0), infsup (-5.0, 3.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-10.0, -5.0), infsup (1.0, 3.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-10.0, -5.0), infsup (-inf, -1.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-10.0, -5.0), infsup (-inf, 3.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-10.0, -5.0), infsup (-5.0, inf), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-10.0, -5.0), infsup (1.0, inf), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (-10.0, -5.0), infsup (-inf, inf), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fma (infsup (0.1, 0.5), infsup (-5.0, 3.0), infsup (-0.1, 0.1)), infsup (-2.600000000000000089e+00, 1.600000000000000089e+00)));
%!test
%! assert (isequal (fma (infsup (-0.5, 0.2), infsup (-5.0, 3.0), infsup (-0.1, 0.1)), infsup (-1.600000000000000089e+00, 2.600000000000000089e+00)));
%!test
%! assert (isequal (fma (infsup (-0.5, -0.1), infsup (2.0, 3.0), infsup (-0.1, 0.1)), infsup (-1.600000000000000089e+00, -1.000000000000000056e-01)));
%!test
%! assert (isequal (fma (infsup (-0.5, -0.1), infsup (-inf, 3.0), infsup (-0.1, 0.1)), infsup (-1.600000000000000089e+00, inf)));

## minimal_fma_dec_test

%!test
%! assert (isequal (fma (infsupdec (-0.5, -0.1, "com"), infsupdec (-inf, 3.0, "dac"), infsupdec (-0.1, 0.1, "com")), infsupdec (-1.600000000000000089e+00, inf, "dac")));
%! assert (isequal (decorationpart (fma (infsupdec (-0.5, -0.1, "com"), infsupdec (-inf, 3.0, "dac"), infsupdec (-0.1, 0.1, "com"))){1}, decorationpart (infsupdec (-1.600000000000000089e+00, inf, "dac")){1}));
%!test
%! assert (isequal (fma (infsupdec (1.0, 2.0, "com"), infsupdec (1.0, 1.797693134862315708e+308, "com"), infsupdec (0.0, 1.0, "com")), infsupdec (1.0, inf, "dac")));
%! assert (isequal (decorationpart (fma (infsupdec (1.0, 2.0, "com"), infsupdec (1.0, 1.797693134862315708e+308, "com"), infsupdec (0.0, 1.0, "com"))){1}, decorationpart (infsupdec (1.0, inf, "dac")){1}));
%!test
%! assert (isequal (fma (infsupdec (1.0, 2.0, "com"), infsupdec (1.0, 2.0, "com"), infsupdec (2.0, 5.0, "com")), infsupdec (3.0, 9.0, "com")));
%! assert (isequal (decorationpart (fma (infsupdec (1.0, 2.0, "com"), infsupdec (1.0, 2.0, "com"), infsupdec (2.0, 5.0, "com"))){1}, decorationpart (infsupdec (3.0, 9.0, "com")){1}));

## minimal_pown_test

%!test
%! assert (isequal (pown (infsup, 0), infsup));
%!test
%! assert (isequal (pown (infsup (-inf, inf), 0), infsup (1.0, 1.0)));
%!test
%! assert (isequal (pown (infsup (0.0, 0.0), 0), infsup (1.0, 1.0)));
%!test
%! assert (isequal (pown (infsup (-0.0, -0.0), 0), infsup (1.0, 1.0)));
%!test
%! assert (isequal (pown (infsup (13.1, 13.1), 0), infsup (1.0, 1.0)));
%!test
%! assert (isequal (pown (infsup (-7451.145, -7451.145), 0), infsup (1.0, 1.0)));
%!test
%! assert (isequal (pown (infsup (1.797693134862315708e+308, 1.797693134862315708e+308), 0), infsup (1.0, 1.0)));
%!test
%! assert (isequal (pown (infsup (-1.797693134862315708e+308, -1.797693134862315708e+308), 0), infsup (1.0, 1.0)));
%!test
%! assert (isequal (pown (infsup (0.0, inf), 0), infsup (1.0, 1.0)));
%!test
%! assert (isequal (pown (infsup (-0.0, inf), 0), infsup (1.0, 1.0)));
%!test
%! assert (isequal (pown (infsup (-inf, 0.0), 0), infsup (1.0, 1.0)));
%!test
%! assert (isequal (pown (infsup (-inf, -0.0), 0), infsup (1.0, 1.0)));
%!test
%! assert (isequal (pown (infsup (-324.3, 2.5), 0), infsup (1.0, 1.0)));
%!test
%! assert (isequal (pown (infsup, 2), infsup));
%!test
%! assert (isequal (pown (infsup (-inf, inf), 2), infsup (0.0, inf)));
%!test
%! assert (isequal (pown (infsup (0.0, 0.0), 2), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pown (infsup (-0.0, -0.0), 2), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pown (infsup (13.1, 13.1), 2), infsup (1.716099999999999852e+02, 1.716100000000000136e+02)));
%!test
%! assert (isequal (pown (infsup (-7451.145, -7451.145), 2), infsup (5.551956181102500111e+07, 5.551956181102500856e+07)));
%!test
%! assert (isequal (pown (infsup (1.797693134862315708e+308, 1.797693134862315708e+308), 2), infsup (1.797693134862315708e+308, inf)));
%!test
%! assert (isequal (pown (infsup (-1.797693134862315708e+308, -1.797693134862315708e+308), 2), infsup (1.797693134862315708e+308, inf)));
%!test
%! assert (isequal (pown (infsup (0.0, inf), 2), infsup (0.0, inf)));
%!test
%! assert (isequal (pown (infsup (-0.0, inf), 2), infsup (0.0, inf)));
%!test
%! assert (isequal (pown (infsup (-inf, 0.0), 2), infsup (0.0, inf)));
%!test
%! assert (isequal (pown (infsup (-inf, -0.0), 2), infsup (0.0, inf)));
%!test
%! assert (isequal (pown (infsup (-324.3, 2.5), 2), infsup (0.0, 1.051704900000000198e+05)));
%!test
%! assert (isequal (pown (infsup (0.01, 2.33), 2), infsup (9.999999999999999124e-05, 5.428900000000000503e+00)));
%!test
%! assert (isequal (pown (infsup (-1.9, -0.33), 2), infsup (1.088999999999999968e-01, 3.609999999999999876e+00)));
%!test
%! assert (isequal (pown (infsup, 8), infsup));
%!test
%! assert (isequal (pown (infsup (-inf, inf), 8), infsup (0.0, inf)));
%!test
%! assert (isequal (pown (infsup (0.0, 0.0), 8), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pown (infsup (-0.0, -0.0), 8), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pown (infsup (13.1, 13.1), 8), infsup (8.673020346900621653e+08, 8.673020346900622845e+08)));
%!test
%! assert (isequal (pown (infsup (-7451.145, -7451.145), 8), infsup (9.501323805961964567e+30, 9.501323805961965692e+30)));
%!test
%! assert (isequal (pown (infsup (1.797693134862315708e+308, 1.797693134862315708e+308), 8), infsup (1.797693134862315708e+308, inf)));
%!test
%! assert (isequal (pown (infsup (-1.797693134862315708e+308, -1.797693134862315708e+308), 8), infsup (1.797693134862315708e+308, inf)));
%!test
%! assert (isequal (pown (infsup (0.0, inf), 8), infsup (0.0, inf)));
%!test
%! assert (isequal (pown (infsup (-0.0, inf), 8), infsup (0.0, inf)));
%!test
%! assert (isequal (pown (infsup (-inf, 0.0), 8), infsup (0.0, inf)));
%!test
%! assert (isequal (pown (infsup (-inf, -0.0), 8), infsup (0.0, inf)));
%!test
%! assert (isequal (pown (infsup (-324.3, 2.5), 8), infsup (0.0, 1.223420037986718843e+20)));
%!test
%! assert (isequal (pown (infsup (0.01, 2.33), 8), infsup (1.000000000000000102e-16, 8.686550888106663706e+02)));
%!test
%! assert (isequal (pown (infsup (-1.9, -0.33), 8), infsup (1.406408618241000491e-04, 1.698356304099999647e+02)));
%!test
%! assert (isequal (pown (infsup, 1), infsup));
%!test
%! assert (isequal (pown (infsup (-inf, inf), 1), infsup (-inf, inf)));
%!test
%! assert (isequal (pown (infsup (0.0, 0.0), 1), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pown (infsup (-0.0, -0.0), 1), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pown (infsup (13.1, 13.1), 1), infsup (13.1, 13.1)));
%!test
%! assert (isequal (pown (infsup (-7451.145, -7451.145), 1), infsup (-7451.145, -7451.145)));
%!test
%! assert (isequal (pown (infsup (1.797693134862315708e+308, 1.797693134862315708e+308), 1), infsup (1.797693134862315708e+308, 1.797693134862315708e+308)));
%!test
%! assert (isequal (pown (infsup (-1.797693134862315708e+308, -1.797693134862315708e+308), 1), infsup (-1.797693134862315708e+308, -1.797693134862315708e+308)));
%!test
%! assert (isequal (pown (infsup (0.0, inf), 1), infsup (0.0, inf)));
%!test
%! assert (isequal (pown (infsup (-0.0, inf), 1), infsup (0.0, inf)));
%!test
%! assert (isequal (pown (infsup (-inf, 0.0), 1), infsup (-inf, 0.0)));
%!test
%! assert (isequal (pown (infsup (-inf, -0.0), 1), infsup (-inf, 0.0)));
%!test
%! assert (isequal (pown (infsup (-324.3, 2.5), 1), infsup (-324.3, 2.5)));
%!test
%! assert (isequal (pown (infsup (0.01, 2.33), 1), infsup (0.01, 2.33)));
%!test
%! assert (isequal (pown (infsup (-1.9, -0.33), 1), infsup (-1.9, -0.33)));
%!test
%! assert (isequal (pown (infsup, 3), infsup));
%!test
%! assert (isequal (pown (infsup (-inf, inf), 3), infsup (-inf, inf)));
%!test
%! assert (isequal (pown (infsup (0.0, 0.0), 3), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pown (infsup (-0.0, -0.0), 3), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pown (infsup (13.1, 13.1), 3), infsup (2.248090999999999440e+03, 2.248090999999999894e+03)));
%!test
%! assert (isequal (pown (infsup (-7451.145, -7451.145), 3), infsup (-4.136843053904099731e+11, -4.136843053904099121e+11)));
%!test
%! assert (isequal (pown (infsup (1.797693134862315708e+308, 1.797693134862315708e+308), 3), infsup (1.797693134862315708e+308, inf)));
%!test
%! assert (isequal (pown (infsup (-1.797693134862315708e+308, -1.797693134862315708e+308), 3), infsup (-inf, -1.797693134862315708e+308)));
%!test
%! assert (isequal (pown (infsup (0.0, inf), 3), infsup (0.0, inf)));
%!test
%! assert (isequal (pown (infsup (-0.0, inf), 3), infsup (0.0, inf)));
%!test
%! assert (isequal (pown (infsup (-inf, 0.0), 3), infsup (-inf, 0.0)));
%!test
%! assert (isequal (pown (infsup (-inf, -0.0), 3), infsup (-inf, 0.0)));
%!test
%! assert (isequal (pown (infsup (-324.3, 2.5), 3), infsup (-3.410678990700000525e+07, 1.562500000000000000e+01)));
%!test
%! assert (isequal (pown (infsup (0.01, 2.33), 3), infsup (9.999999999999999547e-07, 1.264933700000000272e+01)));
%!test
%! assert (isequal (pown (infsup (-1.9, -0.33), 3), infsup (-6.858999999999999098e+00, -3.593700000000000366e-02)));
%!test
%! assert (isequal (pown (infsup, 7), infsup));
%!test
%! assert (isequal (pown (infsup (-inf, inf), 7), infsup (-inf, inf)));
%!test
%! assert (isequal (pown (infsup (0.0, 0.0), 7), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pown (infsup (-0.0, -0.0), 7), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pown (infsup (13.1, 13.1), 7), infsup (6.620626219008108228e+07, 6.620626219008108974e+07)));
%!test
%! assert (isequal (pown (infsup (-7451.145, -7451.145), 7), infsup (-1.275149497957960280e+27, -1.275149497957960005e+27)));
%!test
%! assert (isequal (pown (infsup (1.797693134862315708e+308, 1.797693134862315708e+308), 7), infsup (1.797693134862315708e+308, inf)));
%!test
%! assert (isequal (pown (infsup (-1.797693134862315708e+308, -1.797693134862315708e+308), 7), infsup (-inf, -1.797693134862315708e+308)));
%!test
%! assert (isequal (pown (infsup (0.0, inf), 7), infsup (0.0, inf)));
%!test
%! assert (isequal (pown (infsup (-0.0, inf), 7), infsup (0.0, inf)));
%!test
%! assert (isequal (pown (infsup (-inf, 0.0), 7), infsup (-inf, 0.0)));
%!test
%! assert (isequal (pown (infsup (-inf, -0.0), 7), infsup (-inf, 0.0)));
%!test
%! assert (isequal (pown (infsup (-324.3, 2.5), 7), infsup (-3.772494720896449920e+17, 6.103515625000000000e+02)));
%!test
%! assert (isequal (pown (infsup (0.01, 2.33), 7), infsup (9.999999999999999988e-15, 3.728133428371958757e+02)));
%!test
%! assert (isequal (pown (infsup (-1.9, -0.33), 7), infsup (-8.938717389999997920e+01, -4.261844297700001028e-04)));
%!test
%! assert (isequal (pown (infsup, -2), infsup));
%!test
%! assert (isequal (pown (infsup (-inf, inf), -2), infsup (0.0, inf)));
%!test
%! assert (isequal (pown (infsup (0.0, 0.0), -2), infsup));
%!test
%! assert (isequal (pown (infsup (-0.0, -0.0), -2), infsup));
%!test
%! assert (isequal (pown (infsup (13.1, 13.1), -2), infsup (5.827166249053085390e-03, 5.827166249053086257e-03)));
%!test
%! assert (isequal (pown (infsup (-7451.145, -7451.145), -2), infsup (1.801166953377180740e-08, 1.801166953377181071e-08)));
%!test
%! assert (isequal (pown (infsup (1.797693134862315708e+308, 1.797693134862315708e+308), -2), infsup (0.000000000000000000e+00, 4.940656458412465442e-324)));
%!test
%! assert (isequal (pown (infsup (-1.797693134862315708e+308, -1.797693134862315708e+308), -2), infsup (0.000000000000000000e+00, 4.940656458412465442e-324)));
%!test
%! assert (isequal (pown (infsup (0.0, inf), -2), infsup (0.0, inf)));
%!test
%! assert (isequal (pown (infsup (-0.0, inf), -2), infsup (0.0, inf)));
%!test
%! assert (isequal (pown (infsup (-inf, 0.0), -2), infsup (0.0, inf)));
%!test
%! assert (isequal (pown (infsup (-inf, -0.0), -2), infsup (0.0, inf)));
%!test
%! assert (isequal (pown (infsup (-324.3, 2.5), -2), infsup (9.508370646556841917e-06, inf)));
%!test
%! assert (isequal (pown (infsup (0.01, 2.33), -2), infsup (1.841993774061043421e-01, 1.000000000000000000e+04)));
%!test
%! assert (isequal (pown (infsup (-1.9, -0.33), -2), infsup (2.770083102493074989e-01, 9.182736455463727410e+00)));
%!test
%! assert (isequal (pown (infsup, -8), infsup));
%!test
%! assert (isequal (pown (infsup (-inf, inf), -8), infsup (0.0, inf)));
%!test
%! assert (isequal (pown (infsup (0.0, 0.0), -8), infsup));
%!test
%! assert (isequal (pown (infsup (-0.0, -0.0), -8), infsup));
%!test
%! assert (isequal (pown (infsup (13.1, 13.1), -8), infsup (1.153000869365374417e-09, 1.153000869365374624e-09)));
%!test
%! assert (isequal (pown (infsup (-7451.145, -7451.145), -8), infsup (1.052484917283328578e-31, 1.052484917283328797e-31)));
%!test
%! assert (isequal (pown (infsup (1.797693134862315708e+308, 1.797693134862315708e+308), -8), infsup (0.000000000000000000e+00, 4.940656458412465442e-324)));
%!test
%! assert (isequal (pown (infsup (-1.797693134862315708e+308, -1.797693134862315708e+308), -8), infsup (0.000000000000000000e+00, 4.940656458412465442e-324)));
%!test
%! assert (isequal (pown (infsup (0.0, inf), -8), infsup (0.0, inf)));
%!test
%! assert (isequal (pown (infsup (-0.0, inf), -8), infsup (0.0, inf)));
%!test
%! assert (isequal (pown (infsup (-inf, 0.0), -8), infsup (0.0, inf)));
%!test
%! assert (isequal (pown (infsup (-inf, -0.0), -8), infsup (0.0, inf)));
%!test
%! assert (isequal (pown (infsup (-324.3, 2.5), -8), infsup (8.173807596331487643e-21, inf)));
%!test
%! assert (isequal (pown (infsup (0.01, 2.33), -8), infsup (1.151204906160357110e-03, 1.000000000000000000e+16)));
%!test
%! assert (isequal (pown (infsup (-1.9, -0.33), -8), infsup (5.888045974722156024e-03, 7.110309102419345436e+03)));
%!test
%! assert (isequal (pown (infsup, -1), infsup));
%!test
%! assert (isequal (pown (infsup (-inf, inf), -1), infsup (-inf, inf)));
%!test
%! assert (isequal (pown (infsup (0.0, 0.0), -1), infsup));
%!test
%! assert (isequal (pown (infsup (-0.0, -0.0), -1), infsup));
%!test
%! assert (isequal (pown (infsup (13.1, 13.1), -1), infsup (7.633587786259540819e-02, 7.633587786259542207e-02)));
%!test
%! assert (isequal (pown (infsup (-7451.145, -7451.145), -1), infsup (-1.342075613882161712e-04, -1.342075613882161441e-04)));
%!test
%! assert (isequal (pown (infsup (1.797693134862315708e+308, 1.797693134862315708e+308), -1), infsup (5.562684646268003458e-309, 5.562684646268008398e-309)));
%!test
%! assert (isequal (pown (infsup (-1.797693134862315708e+308, -1.797693134862315708e+308), -1), infsup (-5.562684646268008398e-309, -5.562684646268003458e-309)));
%!test
%! assert (isequal (pown (infsup (0.0, inf), -1), infsup (0.0, inf)));
%!test
%! assert (isequal (pown (infsup (-0.0, inf), -1), infsup (0.0, inf)));
%!test
%! assert (isequal (pown (infsup (-inf, 0.0), -1), infsup (-inf, 0.0)));
%!test
%! assert (isequal (pown (infsup (-inf, -0.0), -1), infsup (-inf, 0.0)));
%!test
%! assert (isequal (pown (infsup (-324.3, 2.5), -1), infsup (-inf, inf)));
%!test
%! assert (isequal (pown (infsup (0.01, 2.33), -1), infsup (4.291845493562231328e-01, 1.000000000000000000e+02)));
%!test
%! assert (isequal (pown (infsup (-1.9, -0.33), -1), infsup (-3.030303030303030276e+00, -5.263157894736841813e-01)));
%!test
%! assert (isequal (pown (infsup, -3), infsup));
%!test
%! assert (isequal (pown (infsup (-inf, inf), -3), infsup (-inf, inf)));
%!test
%! assert (isequal (pown (infsup (0.0, 0.0), -3), infsup));
%!test
%! assert (isequal (pown (infsup (-0.0, -0.0), -3), infsup));
%!test
%! assert (isequal (pown (infsup (13.1, 13.1), -3), infsup (4.448218510727546177e-04, 4.448218510727546720e-04)));
%!test
%! assert (isequal (pown (infsup (-7451.145, -7451.145), -3), infsup (-2.417302244657943502e-12, -2.417302244657943098e-12)));
%!test
%! assert (isequal (pown (infsup (1.797693134862315708e+308, 1.797693134862315708e+308), -3), infsup (0.000000000000000000e+00, 4.940656458412465442e-324)));
%!test
%! assert (isequal (pown (infsup (-1.797693134862315708e+308, -1.797693134862315708e+308), -3), infsup (-4.940656458412465442e-324, -0.000000000000000000e+00)));
%!test
%! assert (isequal (pown (infsup (0.0, inf), -3), infsup (0.0, inf)));
%!test
%! assert (isequal (pown (infsup (-0.0, inf), -3), infsup (0.0, inf)));
%!test
%! assert (isequal (pown (infsup (-inf, 0.0), -3), infsup (-inf, 0.0)));
%!test
%! assert (isequal (pown (infsup (-inf, -0.0), -3), infsup (-inf, 0.0)));
%!test
%! assert (isequal (pown (infsup (-324.3, 2.5), -3), infsup (-inf, inf)));
%!test
%! assert (isequal (pown (infsup (0.01, 2.33), -3), infsup (7.905552678373577169e-02, 1.000000000000000000e+06)));
%!test
%! assert (isequal (pown (infsup (-1.9, -0.33), -3), infsup (-2.782647410746584171e+01, -1.457938474996355316e-01)));
%!test
%! assert (isequal (pown (infsup, -7), infsup));
%!test
%! assert (isequal (pown (infsup (-inf, inf), -7), infsup (-inf, inf)));
%!test
%! assert (isequal (pown (infsup (0.0, 0.0), -7), infsup));
%!test
%! assert (isequal (pown (infsup (-0.0, -0.0), -7), infsup));
%!test
%! assert (isequal (pown (infsup (13.1, 13.1), -7), infsup (1.510431138868640339e-08, 1.510431138868640670e-08)));
%!test
%! assert (isequal (pown (infsup (-7451.145, -7451.145), -7), infsup (-7.842217728991088300e-28, -7.842217728991087403e-28)));
%!test
%! assert (isequal (pown (infsup (1.797693134862315708e+308, 1.797693134862315708e+308), -7), infsup (0.000000000000000000e+00, 4.940656458412465442e-324)));
%!test
%! assert (isequal (pown (infsup (-1.797693134862315708e+308, -1.797693134862315708e+308), -7), infsup (-4.940656458412465442e-324, -0.000000000000000000e+00)));
%!test
%! assert (isequal (pown (infsup (0.0, inf), -7), infsup (0.0, inf)));
%!test
%! assert (isequal (pown (infsup (-0.0, inf), -7), infsup (0.0, inf)));
%!test
%! assert (isequal (pown (infsup (-inf, 0.0), -7), infsup (-inf, 0.0)));
%!test
%! assert (isequal (pown (infsup (-inf, -0.0), -7), infsup (-inf, 0.0)));
%!test
%! assert (isequal (pown (infsup (-324.3, 2.5), -7), infsup (-inf, inf)));
%!test
%! assert (isequal (pown (infsup (0.01, 2.33), -7), infsup (2.682307431353632161e-03, 1.000000000000000000e+14)));
%!test
%! assert (isequal (pown (infsup (-1.9, -0.33), -7), infsup (-2.346402003798384158e+03, -1.118728735197209619e-02)));

## minimal_pown_dec_test

%!test
%! assert (isequal (pown (infsupdec (-5.0, 10.0, "com"), 0), infsupdec (1.0, 1.0, "com")));
%! assert (isequal (decorationpart (pown (infsupdec (-5.0, 10.0, "com"), 0)){1}, decorationpart (infsupdec (1.0, 1.0, "com")){1}));
%!test
%! assert (isequal (pown (infsupdec (-inf, 15.0, "dac"), 0), infsupdec (1.0, 1.0, "dac")));
%! assert (isequal (decorationpart (pown (infsupdec (-inf, 15.0, "dac"), 0)){1}, decorationpart (infsupdec (1.0, 1.0, "dac")){1}));
%!test
%! assert (isequal (pown (infsupdec (-3.0, 5.0, "def"), 2), infsupdec (0.0, 25.0, "def")));
%! assert (isequal (decorationpart (pown (infsupdec (-3.0, 5.0, "def"), 2)){1}, decorationpart (infsupdec (0.0, 25.0, "def")){1}));
%!test
%! assert (isequal (pown (infsupdec (-1.797693134862315708e+308, 2.0, "com"), 2), infsupdec (0.0, inf, "dac")));
%! assert (isequal (decorationpart (pown (infsupdec (-1.797693134862315708e+308, 2.0, "com"), 2)){1}, decorationpart (infsupdec (0.0, inf, "dac")){1}));
%!test
%! assert (isequal (pown (infsupdec (-3.0, 5.0, "dac"), 3), infsupdec (-27.0, 125.0, "dac")));
%! assert (isequal (decorationpart (pown (infsupdec (-3.0, 5.0, "dac"), 3)){1}, decorationpart (infsupdec (-27.0, 125.0, "dac")){1}));
%!test
%! assert (isequal (pown (infsupdec (-1.797693134862315708e+308, 2.0, "com"), 3), infsupdec (-inf, 8.0, "dac")));
%! assert (isequal (decorationpart (pown (infsupdec (-1.797693134862315708e+308, 2.0, "com"), 3)){1}, decorationpart (infsupdec (-inf, 8.0, "dac")){1}));
%!test
%! assert (isequal (pown (infsupdec (3.0, 5.0, "com"), -2), infsupdec (3.999999999999999389e-02, 1.111111111111111188e-01, "com")));
%! assert (isequal (decorationpart (pown (infsupdec (3.0, 5.0, "com"), -2)){1}, decorationpart (infsupdec (3.999999999999999389e-02, 1.111111111111111188e-01, "com")){1}));
%!test
%! assert (isequal (pown (infsupdec (-5.0, -3.0, "def"), -2), infsupdec (3.999999999999999389e-02, 1.111111111111111188e-01, "def")));
%! assert (isequal (decorationpart (pown (infsupdec (-5.0, -3.0, "def"), -2)){1}, decorationpart (infsupdec (3.999999999999999389e-02, 1.111111111111111188e-01, "def")){1}));
%!test
%! assert (isequal (pown (infsupdec (-5.0, 3.0, "com"), -2), infsupdec (3.999999999999999389e-02, inf, "trv")));
%! assert (isequal (decorationpart (pown (infsupdec (-5.0, 3.0, "com"), -2)){1}, decorationpart (infsupdec (3.999999999999999389e-02, inf, "trv")){1}));
%!test
%! assert (isequal (pown (infsupdec (3.0, 5.0, "dac"), -3), infsupdec (7.999999999999998432e-03, 3.703703703703704192e-02, "dac")));
%! assert (isequal (decorationpart (pown (infsupdec (3.0, 5.0, "dac"), -3)){1}, decorationpart (infsupdec (7.999999999999998432e-03, 3.703703703703704192e-02, "dac")){1}));
%!test
%! assert (isequal (pown (infsupdec (-3.0, 5.0, "com"), -3), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (pown (infsupdec (-3.0, 5.0, "com"), -3)){1}, decorationpart (infsupdec (entire, "trv")){1}));

## minimal_pow_test

%!test
%! assert (isequal (pow (infsup, infsup), infsup));
%!test
%! assert (isequal (pow (infsup, infsup (-inf, inf)), infsup));
%!test
%! assert (isequal (pow (infsup, infsup (-inf, -1.0)), infsup));
%!test
%! assert (isequal (pow (infsup, infsup (-inf, 0.0)), infsup));
%!test
%! assert (isequal (pow (infsup, infsup (-inf, -0.0)), infsup));
%!test
%! assert (isequal (pow (infsup, infsup (0.0, inf)), infsup));
%!test
%! assert (isequal (pow (infsup, infsup (-0.0, inf)), infsup));
%!test
%! assert (isequal (pow (infsup, infsup (1.0, inf)), infsup));
%!test
%! assert (isequal (pow (infsup, infsup (-3.0, 5.0)), infsup));
%!test
%! assert (isequal (pow (infsup, infsup (0.0, 0.0)), infsup));
%!test
%! assert (isequal (pow (infsup, infsup (-0.0, -0.0)), infsup));
%!test
%! assert (isequal (pow (infsup, infsup (-5.0, -5.0)), infsup));
%!test
%! assert (isequal (pow (infsup, infsup (5.0, 5.0)), infsup));
%!test
%! assert (isequal (pow (infsup (0.1, 0.5), infsup), infsup));
%!test
%! assert (isequal (pow (infsup (0.1, 0.5), infsup (0.0, 0.0)), infsup (1.0, 1.0)));
%!test
%! assert (isequal (pow (infsup (0.1, 0.5), infsup (-0.0, -0.0)), infsup (1.0, 1.0)));
%!test
%! assert (isequal (pow (infsup (0.1, 0.5), infsup (0.0, 1.0)), infsup (1.000000000000000056e-01, 1.0)));
%!test
%! assert (isequal (pow (infsup (0.1, 0.5), infsup (-0.0, 1.0)), infsup (1.000000000000000056e-01, 1.0)));
%!test
%! assert (isequal (pow (infsup (0.1, 0.5), infsup (0.0, 2.5)), infsup (3.162277660168379394e-03, 1.0)));
%!test
%! assert (isequal (pow (infsup (0.1, 0.5), infsup (-0.0, 2.5)), infsup (3.162277660168379394e-03, 1.0)));
%!test
%! assert (isequal (pow (infsup (0.1, 0.5), infsup (0.0, inf)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (pow (infsup (0.1, 0.5), infsup (-0.0, inf)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (pow (infsup (0.1, 0.5), infsup (0.1, 0.1)), infsup (7.943282347242814900e-01, 9.330329915368075211e-01)));
%!test
%! assert (isequal (pow (infsup (0.1, 0.5), infsup (0.1, 1.0)), infsup (1.000000000000000056e-01, 9.330329915368075211e-01)));
%!test
%! assert (isequal (pow (infsup (0.1, 0.5), infsup (0.1, 2.5)), infsup (3.162277660168379394e-03, 9.330329915368075211e-01)));
%!test
%! assert (isequal (pow (infsup (0.1, 0.5), infsup (0.1, inf)), infsup (0.0, 9.330329915368075211e-01)));
%!test
%! assert (isequal (pow (infsup (0.1, 0.5), infsup (1.0, 1.0)), infsup (1.000000000000000056e-01, 5.000000000000000000e-01)));
%!test
%! assert (isequal (pow (infsup (0.1, 0.5), infsup (1.0, 2.5)), infsup (3.162277660168379394e-03, 5.000000000000000000e-01)));
%!test
%! assert (isequal (pow (infsup (0.1, 0.5), infsup (1.0, inf)), infsup (0.0, 5.000000000000000000e-01)));
%!test
%! assert (isequal (pow (infsup (0.1, 0.5), infsup (2.5, 2.5)), infsup (3.162277660168379394e-03, 1.767766952966368932e-01)));
%!test
%! assert (isequal (pow (infsup (0.1, 0.5), infsup (2.5, inf)), infsup (0.0, 1.767766952966368932e-01)));
%!test
%! assert (isequal (pow (infsup (0.1, 0.5), infsup (-0.1, 0.1)), infsup (7.943282347242814900e-01, 1.258925411794167282e+00)));
%!test
%! assert (isequal (pow (infsup (0.1, 0.5), infsup (-0.1, 1.0)), infsup (1.000000000000000056e-01, 1.258925411794167282e+00)));
%!test
%! assert (isequal (pow (infsup (0.1, 0.5), infsup (-0.1, 2.5)), infsup (3.162277660168379394e-03, 1.258925411794167282e+00)));
%!test
%! assert (isequal (pow (infsup (0.1, 0.5), infsup (-0.1, inf)), infsup (0.0, 1.258925411794167282e+00)));
%!test
%! assert (isequal (pow (infsup (0.1, 0.5), infsup (-1.0, 0.1)), infsup (7.943282347242814900e-01, 1.000000000000000000e+01)));
%!test
%! assert (isequal (pow (infsup (0.1, 0.5), infsup (-1.0, 1.0)), infsup (1.000000000000000056e-01, 1.000000000000000000e+01)));
%!test
%! assert (isequal (pow (infsup (0.1, 0.5), infsup (-1.0, 2.5)), infsup (3.162277660168379394e-03, 1.000000000000000000e+01)));
%!test
%! assert (isequal (pow (infsup (0.1, 0.5), infsup (-1.0, inf)), infsup (0.0, 1.000000000000000000e+01)));
%!test
%! assert (isequal (pow (infsup (0.1, 0.5), infsup (-2.5, 0.1)), infsup (7.943282347242814900e-01, 3.162277660168379043e+02)));
%!test
%! assert (isequal (pow (infsup (0.1, 0.5), infsup (-2.5, 1.0)), infsup (1.000000000000000056e-01, 3.162277660168379043e+02)));
%!test
%! assert (isequal (pow (infsup (0.1, 0.5), infsup (-2.5, 2.5)), infsup (3.162277660168379394e-03, 3.162277660168379043e+02)));
%!test
%! assert (isequal (pow (infsup (0.1, 0.5), infsup (-2.5, inf)), infsup (0.0, 3.162277660168379043e+02)));
%!test
%! assert (isequal (pow (infsup (0.1, 0.5), infsup (-inf, 0.1)), infsup (7.943282347242814900e-01, inf)));
%!test
%! assert (isequal (pow (infsup (0.1, 0.5), infsup (-inf, 1.0)), infsup (1.000000000000000056e-01, inf)));
%!test
%! assert (isequal (pow (infsup (0.1, 0.5), infsup (-inf, 2.5)), infsup (3.162277660168379394e-03, inf)));
%!test
%! assert (isequal (pow (infsup (0.1, 0.5), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.1, 0.5), infsup (-1.0, 0.0)), infsup (1.0, 1.000000000000000000e+01)));
%!test
%! assert (isequal (pow (infsup (0.1, 0.5), infsup (-1.0, -0.0)), infsup (1.0, 1.000000000000000000e+01)));
%!test
%! assert (isequal (pow (infsup (0.1, 0.5), infsup (-2.5, 0.0)), infsup (1.0, 3.162277660168379043e+02)));
%!test
%! assert (isequal (pow (infsup (0.1, 0.5), infsup (-2.5, -0.0)), infsup (1.0, 3.162277660168379043e+02)));
%!test
%! assert (isequal (pow (infsup (0.1, 0.5), infsup (-inf, 0.0)), infsup (1.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.1, 0.5), infsup (-inf, -0.0)), infsup (1.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.1, 0.5), infsup (-0.1, -0.1)), infsup (1.071773462536293131e+00, 1.258925411794167282e+00)));
%!test
%! assert (isequal (pow (infsup (0.1, 0.5), infsup (-1.0, -0.1)), infsup (1.071773462536293131e+00, 1.000000000000000000e+01)));
%!test
%! assert (isequal (pow (infsup (0.1, 0.5), infsup (-2.5, -0.1)), infsup (1.071773462536293131e+00, 3.162277660168379043e+02)));
%!test
%! assert (isequal (pow (infsup (0.1, 0.5), infsup (-inf, -0.1)), infsup (1.071773462536293131e+00, inf)));
%!test
%! assert (isequal (pow (infsup (0.1, 0.5), infsup (-1.0, -1.0)), infsup (2.000000000000000000e+00, 1.000000000000000000e+01)));
%!test
%! assert (isequal (pow (infsup (0.1, 0.5), infsup (-2.5, -1.0)), infsup (2.000000000000000000e+00, 3.162277660168379043e+02)));
%!test
%! assert (isequal (pow (infsup (0.1, 0.5), infsup (-inf, -1.0)), infsup (2.000000000000000000e+00, inf)));
%!test
%! assert (isequal (pow (infsup (0.1, 0.5), infsup (-2.5, -2.5)), infsup (5.656854249492379694e+00, 3.162277660168379043e+02)));
%!test
%! assert (isequal (pow (infsup (0.1, 0.5), infsup (-inf, -2.5)), infsup (5.656854249492379694e+00, inf)));
%!test
%! assert (isequal (pow (infsup (0.1, 1.0), infsup), infsup));
%!test
%! assert (isequal (pow (infsup (0.1, 1.0), infsup (0.0, 0.0)), infsup (1.0, 1.0)));
%!test
%! assert (isequal (pow (infsup (0.1, 1.0), infsup (-0.0, -0.0)), infsup (1.0, 1.0)));
%!test
%! assert (isequal (pow (infsup (0.1, 1.0), infsup (0.0, 1.0)), infsup (1.000000000000000056e-01, 1.0)));
%!test
%! assert (isequal (pow (infsup (0.1, 1.0), infsup (-0.0, 1.0)), infsup (1.000000000000000056e-01, 1.0)));
%!test
%! assert (isequal (pow (infsup (0.1, 1.0), infsup (0.0, 2.5)), infsup (3.162277660168379394e-03, 1.0)));
%!test
%! assert (isequal (pow (infsup (0.1, 1.0), infsup (-0.0, 2.5)), infsup (3.162277660168379394e-03, 1.0)));
%!test
%! assert (isequal (pow (infsup (0.1, 1.0), infsup (0.0, inf)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (pow (infsup (0.1, 1.0), infsup (-0.0, inf)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (pow (infsup (0.1, 1.0), infsup (0.1, 0.1)), infsup (7.943282347242814900e-01, 1.0)));
%!test
%! assert (isequal (pow (infsup (0.1, 1.0), infsup (0.1, 1.0)), infsup (1.000000000000000056e-01, 1.0)));
%!test
%! assert (isequal (pow (infsup (0.1, 1.0), infsup (0.1, 2.5)), infsup (3.162277660168379394e-03, 1.0)));
%!test
%! assert (isequal (pow (infsup (0.1, 1.0), infsup (0.1, inf)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (pow (infsup (0.1, 1.0), infsup (1.0, 1.0)), infsup (1.000000000000000056e-01, 1.0)));
%!test
%! assert (isequal (pow (infsup (0.1, 1.0), infsup (1.0, 2.5)), infsup (3.162277660168379394e-03, 1.0)));
%!test
%! assert (isequal (pow (infsup (0.1, 1.0), infsup (1.0, inf)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (pow (infsup (0.1, 1.0), infsup (2.5, 2.5)), infsup (3.162277660168379394e-03, 1.0)));
%!test
%! assert (isequal (pow (infsup (0.1, 1.0), infsup (2.5, inf)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (pow (infsup (0.1, 1.0), infsup (-0.1, 0.1)), infsup (7.943282347242814900e-01, 1.258925411794167282e+00)));
%!test
%! assert (isequal (pow (infsup (0.1, 1.0), infsup (-0.1, 1.0)), infsup (1.000000000000000056e-01, 1.258925411794167282e+00)));
%!test
%! assert (isequal (pow (infsup (0.1, 1.0), infsup (-0.1, 2.5)), infsup (3.162277660168379394e-03, 1.258925411794167282e+00)));
%!test
%! assert (isequal (pow (infsup (0.1, 1.0), infsup (-0.1, inf)), infsup (0.0, 1.258925411794167282e+00)));
%!test
%! assert (isequal (pow (infsup (0.1, 1.0), infsup (-1.0, 0.1)), infsup (7.943282347242814900e-01, 1.000000000000000000e+01)));
%!test
%! assert (isequal (pow (infsup (0.1, 1.0), infsup (-1.0, 1.0)), infsup (1.000000000000000056e-01, 1.000000000000000000e+01)));
%!test
%! assert (isequal (pow (infsup (0.1, 1.0), infsup (-1.0, 2.5)), infsup (3.162277660168379394e-03, 1.000000000000000000e+01)));
%!test
%! assert (isequal (pow (infsup (0.1, 1.0), infsup (-1.0, inf)), infsup (0.0, 1.000000000000000000e+01)));
%!test
%! assert (isequal (pow (infsup (0.1, 1.0), infsup (-2.5, 0.1)), infsup (7.943282347242814900e-01, 3.162277660168379043e+02)));
%!test
%! assert (isequal (pow (infsup (0.1, 1.0), infsup (-2.5, 1.0)), infsup (1.000000000000000056e-01, 3.162277660168379043e+02)));
%!test
%! assert (isequal (pow (infsup (0.1, 1.0), infsup (-2.5, 2.5)), infsup (3.162277660168379394e-03, 3.162277660168379043e+02)));
%!test
%! assert (isequal (pow (infsup (0.1, 1.0), infsup (-2.5, inf)), infsup (0.0, 3.162277660168379043e+02)));
%!test
%! assert (isequal (pow (infsup (0.1, 1.0), infsup (-inf, 0.1)), infsup (7.943282347242814900e-01, inf)));
%!test
%! assert (isequal (pow (infsup (0.1, 1.0), infsup (-inf, 1.0)), infsup (1.000000000000000056e-01, inf)));
%!test
%! assert (isequal (pow (infsup (0.1, 1.0), infsup (-inf, 2.5)), infsup (3.162277660168379394e-03, inf)));
%!test
%! assert (isequal (pow (infsup (0.1, 1.0), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.1, 1.0), infsup (-0.1, 0.0)), infsup (1.0, 1.258925411794167282e+00)));
%!test
%! assert (isequal (pow (infsup (0.1, 1.0), infsup (-0.1, -0.0)), infsup (1.0, 1.258925411794167282e+00)));
%!test
%! assert (isequal (pow (infsup (0.1, 1.0), infsup (-1.0, 0.0)), infsup (1.0, 1.000000000000000000e+01)));
%!test
%! assert (isequal (pow (infsup (0.1, 1.0), infsup (-1.0, -0.0)), infsup (1.0, 1.000000000000000000e+01)));
%!test
%! assert (isequal (pow (infsup (0.1, 1.0), infsup (-2.5, 0.0)), infsup (1.0, 3.162277660168379043e+02)));
%!test
%! assert (isequal (pow (infsup (0.1, 1.0), infsup (-2.5, -0.0)), infsup (1.0, 3.162277660168379043e+02)));
%!test
%! assert (isequal (pow (infsup (0.1, 1.0), infsup (-inf, 0.0)), infsup (1.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.1, 1.0), infsup (-inf, -0.0)), infsup (1.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.1, 1.0), infsup (-0.1, -0.1)), infsup (1.0, 1.258925411794167282e+00)));
%!test
%! assert (isequal (pow (infsup (0.1, 1.0), infsup (-1.0, -0.1)), infsup (1.0, 1.000000000000000000e+01)));
%!test
%! assert (isequal (pow (infsup (0.1, 1.0), infsup (-2.5, -0.1)), infsup (1.0, 3.162277660168379043e+02)));
%!test
%! assert (isequal (pow (infsup (0.1, 1.0), infsup (-inf, -0.1)), infsup (1.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.1, 1.0), infsup (-1.0, -1.0)), infsup (1.0, 1.000000000000000000e+01)));
%!test
%! assert (isequal (pow (infsup (0.1, 1.0), infsup (-2.5, -1.0)), infsup (1.0, 3.162277660168379043e+02)));
%!test
%! assert (isequal (pow (infsup (0.1, 1.0), infsup (-inf, -1.0)), infsup (1.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.1, 1.0), infsup (-2.5, -2.5)), infsup (1.0, 3.162277660168379043e+02)));
%!test
%! assert (isequal (pow (infsup (0.1, 1.0), infsup (-inf, -2.5)), infsup (1.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.5, 1.5), infsup), infsup));
%!test
%! assert (isequal (pow (infsup (0.5, 1.5), infsup (0.0, 0.0)), infsup (1.0, 1.0)));
%!test
%! assert (isequal (pow (infsup (0.5, 1.5), infsup (-0.0, -0.0)), infsup (1.0, 1.0)));
%!test
%! assert (isequal (pow (infsup (0.5, 1.5), infsup (0.0, 1.0)), infsup (0.5, 1.5)));
%!test
%! assert (isequal (pow (infsup (0.5, 1.5), infsup (-0.0, 1.0)), infsup (0.5, 1.5)));
%!test
%! assert (isequal (pow (infsup (0.5, 1.5), infsup (0.0, 2.5)), infsup (1.767766952966368654e-01, 2.755675960631075672e+00)));
%!test
%! assert (isequal (pow (infsup (0.5, 1.5), infsup (-0.0, 2.5)), infsup (1.767766952966368654e-01, 2.755675960631075672e+00)));
%!test
%! assert (isequal (pow (infsup (0.5, 1.5), infsup (0.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.5, 1.5), infsup (-0.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.5, 1.5), infsup (0.1, 0.1)), infsup (9.330329915368074101e-01, 1.041379743992410623e+00)));
%!test
%! assert (isequal (pow (infsup (0.5, 1.5), infsup (0.1, 1.0)), infsup (0.5, 1.5)));
%!test
%! assert (isequal (pow (infsup (0.5, 1.5), infsup (0.1, 2.5)), infsup (1.767766952966368654e-01, 2.755675960631075672e+00)));
%!test
%! assert (isequal (pow (infsup (0.5, 1.5), infsup (0.1, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.5, 1.5), infsup (1.0, 1.0)), infsup (0.5, 1.5)));
%!test
%! assert (isequal (pow (infsup (0.5, 1.5), infsup (1.0, 2.5)), infsup (1.767766952966368654e-01, 2.755675960631075672e+00)));
%!test
%! assert (isequal (pow (infsup (0.5, 1.5), infsup (1.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.5, 1.5), infsup (2.5, 2.5)), infsup (1.767766952966368654e-01, 2.755675960631075672e+00)));
%!test
%! assert (isequal (pow (infsup (0.5, 1.5), infsup (2.5, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.5, 1.5), infsup (-0.1, 0.1)), infsup (9.330329915368074101e-01, 1.071773462536293353e+00)));
%!test
%! assert (isequal (pow (infsup (0.5, 1.5), infsup (-0.1, 1.0)), infsup (5.000000000000000000e-01, 1.500000000000000000e+00)));
%!test
%! assert (isequal (pow (infsup (0.5, 1.5), infsup (-0.1, 2.5)), infsup (1.767766952966368654e-01, 2.755675960631075672e+00)));
%!test
%! assert (isequal (pow (infsup (0.5, 1.5), infsup (-0.1, inf)), infsup (0.000000000000000000e+00, inf)));
%!test
%! assert (isequal (pow (infsup (0.5, 1.5), infsup (-1.0, 0.1)), infsup (6.666666666666666297e-01, 2.000000000000000000e+00)));
%!test
%! assert (isequal (pow (infsup (0.5, 1.5), infsup (-1.0, 1.0)), infsup (5.000000000000000000e-01, 2.000000000000000000e+00)));
%!test
%! assert (isequal (pow (infsup (0.5, 1.5), infsup (-1.0, 2.5)), infsup (1.767766952966368654e-01, 2.755675960631075672e+00)));
%!test
%! assert (isequal (pow (infsup (0.5, 1.5), infsup (-1.0, inf)), infsup (0.000000000000000000e+00, inf)));
%!test
%! assert (isequal (pow (infsup (0.5, 1.5), infsup (-2.5, 0.1)), infsup (3.628873693012115154e-01, 5.656854249492380582e+00)));
%!test
%! assert (isequal (pow (infsup (0.5, 1.5), infsup (-2.5, 1.0)), infsup (3.628873693012115154e-01, 5.656854249492380582e+00)));
%!test
%! assert (isequal (pow (infsup (0.5, 1.5), infsup (-2.5, 2.5)), infsup (1.767766952966368654e-01, 5.656854249492380582e+00)));
%!test
%! assert (isequal (pow (infsup (0.5, 1.5), infsup (-2.5, inf)), infsup (0.000000000000000000e+00, inf)));
%!test
%! assert (isequal (pow (infsup (0.5, 1.5), infsup (-inf, 0.1)), infsup (0.000000000000000000e+00, inf)));
%!test
%! assert (isequal (pow (infsup (0.5, 1.5), infsup (-inf, 1.0)), infsup (0.000000000000000000e+00, inf)));
%!test
%! assert (isequal (pow (infsup (0.5, 1.5), infsup (-inf, 2.5)), infsup (0.000000000000000000e+00, inf)));
%!test
%! assert (isequal (pow (infsup (0.5, 1.5), infsup (-inf, inf)), infsup (0.000000000000000000e+00, inf)));
%!test
%! assert (isequal (pow (infsup (0.5, 1.5), infsup (-1.0, 0.0)), infsup (6.666666666666666297e-01, 2.000000000000000000e+00)));
%!test
%! assert (isequal (pow (infsup (0.5, 1.5), infsup (-1.0, -0.0)), infsup (6.666666666666666297e-01, 2.000000000000000000e+00)));
%!test
%! assert (isequal (pow (infsup (0.5, 1.5), infsup (-2.5, 0.0)), infsup (3.628873693012115154e-01, 5.656854249492380582e+00)));
%!test
%! assert (isequal (pow (infsup (0.5, 1.5), infsup (-2.5, -0.0)), infsup (3.628873693012115154e-01, 5.656854249492380582e+00)));
%!test
%! assert (isequal (pow (infsup (0.5, 1.5), infsup (-inf, 0.0)), infsup (0.000000000000000000e+00, inf)));
%!test
%! assert (isequal (pow (infsup (0.5, 1.5), infsup (-inf, -0.0)), infsup (0.000000000000000000e+00, inf)));
%!test
%! assert (isequal (pow (infsup (0.5, 1.5), infsup (-0.1, -0.1)), infsup (9.602645007922180342e-01, 1.071773462536293353e+00)));
%!test
%! assert (isequal (pow (infsup (0.5, 1.5), infsup (-1.0, -0.1)), infsup (6.666666666666666297e-01, 2.000000000000000000e+00)));
%!test
%! assert (isequal (pow (infsup (0.5, 1.5), infsup (-2.5, -0.1)), infsup (3.628873693012115154e-01, 5.656854249492380582e+00)));
%!test
%! assert (isequal (pow (infsup (0.5, 1.5), infsup (-inf, -0.1)), infsup (0.000000000000000000e+00, inf)));
%!test
%! assert (isequal (pow (infsup (0.5, 1.5), infsup (-1.0, -1.0)), infsup (6.666666666666666297e-01, 2.000000000000000000e+00)));
%!test
%! assert (isequal (pow (infsup (0.5, 1.5), infsup (-2.5, -1.0)), infsup (3.628873693012115154e-01, 5.656854249492380582e+00)));
%!test
%! assert (isequal (pow (infsup (0.5, 1.5), infsup (-inf, -1.0)), infsup (0.000000000000000000e+00, inf)));
%!test
%! assert (isequal (pow (infsup (0.5, 1.5), infsup (-2.5, -2.5)), infsup (3.628873693012115154e-01, 5.656854249492380582e+00)));
%!test
%! assert (isequal (pow (infsup (0.5, 1.5), infsup (-inf, -2.5)), infsup (0.000000000000000000e+00, inf)));
%!test
%! assert (isequal (pow (infsup (0.5, inf), infsup), infsup));
%!test
%! assert (isequal (pow (infsup (0.5, inf), infsup (0.0, 0.0)), infsup (1.0, 1.0)));
%!test
%! assert (isequal (pow (infsup (0.5, inf), infsup (-0.0, -0.0)), infsup (1.0, 1.0)));
%!test
%! assert (isequal (pow (infsup (0.5, inf), infsup (0.0, 1.0)), infsup (0.5, inf)));
%!test
%! assert (isequal (pow (infsup (0.5, inf), infsup (-0.0, 1.0)), infsup (0.5, inf)));
%!test
%! assert (isequal (pow (infsup (0.5, inf), infsup (0.0, 2.5)), infsup (1.767766952966368654e-01, inf)));
%!test
%! assert (isequal (pow (infsup (0.5, inf), infsup (-0.0, 2.5)), infsup (1.767766952966368654e-01, inf)));
%!test
%! assert (isequal (pow (infsup (0.5, inf), infsup (0.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.5, inf), infsup (-0.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.5, inf), infsup (0.1, 0.1)), infsup (9.330329915368074101e-01, inf)));
%!test
%! assert (isequal (pow (infsup (0.5, inf), infsup (0.1, 1.0)), infsup (0.5, inf)));
%!test
%! assert (isequal (pow (infsup (0.5, inf), infsup (0.1, 2.5)), infsup (1.767766952966368654e-01, inf)));
%!test
%! assert (isequal (pow (infsup (0.5, inf), infsup (0.1, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.5, inf), infsup (1.0, 1.0)), infsup (0.5, inf)));
%!test
%! assert (isequal (pow (infsup (0.5, inf), infsup (1.0, 2.5)), infsup (1.767766952966368654e-01, inf)));
%!test
%! assert (isequal (pow (infsup (0.5, inf), infsup (1.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.5, inf), infsup (2.5, 2.5)), infsup (1.767766952966368654e-01, inf)));
%!test
%! assert (isequal (pow (infsup (0.5, inf), infsup (2.5, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.5, inf), infsup (-0.1, 0.1)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.5, inf), infsup (-0.1, 1.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.5, inf), infsup (-0.1, 2.5)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.5, inf), infsup (-0.1, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.5, inf), infsup (-1.0, 0.1)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.5, inf), infsup (-1.0, 1.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.5, inf), infsup (-1.0, 2.5)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.5, inf), infsup (-1.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.5, inf), infsup (-2.5, 0.1)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.5, inf), infsup (-2.5, 1.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.5, inf), infsup (-2.5, 2.5)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.5, inf), infsup (-2.5, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.5, inf), infsup (-inf, 0.1)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.5, inf), infsup (-inf, 1.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.5, inf), infsup (-inf, 2.5)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.5, inf), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.5, inf), infsup (-1.0, 0.0)), infsup (0.0, 2.000000000000000000e+00)));
%!test
%! assert (isequal (pow (infsup (0.5, inf), infsup (-1.0, -0.0)), infsup (0.0, 2.000000000000000000e+00)));
%!test
%! assert (isequal (pow (infsup (0.5, inf), infsup (-2.5, 0.0)), infsup (0.0, 5.656854249492380582e+00)));
%!test
%! assert (isequal (pow (infsup (0.5, inf), infsup (-2.5, -0.0)), infsup (0.0, 5.656854249492380582e+00)));
%!test
%! assert (isequal (pow (infsup (0.5, inf), infsup (-inf, 0.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.5, inf), infsup (-inf, -0.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.5, inf), infsup (-0.1, -0.1)), infsup (0.0, 1.071773462536293353e+00)));
%!test
%! assert (isequal (pow (infsup (0.5, inf), infsup (-1.0, -0.1)), infsup (0.0, 2.000000000000000000e+00)));
%!test
%! assert (isequal (pow (infsup (0.5, inf), infsup (-2.5, -0.1)), infsup (0.0, 5.656854249492380582e+00)));
%!test
%! assert (isequal (pow (infsup (0.5, inf), infsup (-inf, -0.1)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.5, inf), infsup (-1.0, -1.0)), infsup (0.0, 2.000000000000000000e+00)));
%!test
%! assert (isequal (pow (infsup (0.5, inf), infsup (-2.5, -1.0)), infsup (0.0, 5.656854249492380582e+00)));
%!test
%! assert (isequal (pow (infsup (0.5, inf), infsup (-inf, -1.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.5, inf), infsup (-inf, -2.5)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.5, inf), infsup (-2.5, -2.5)), infsup (0.0, 5.656854249492380582e+00)));
%!test
%! assert (isequal (pow (infsup (1.0, 1.5), infsup), infsup));
%!test
%! assert (isequal (pow (infsup (1.0, 1.5), infsup (0.0, 0.0)), infsup (1.0, 1.0)));
%!test
%! assert (isequal (pow (infsup (1.0, 1.5), infsup (-0.0, -0.0)), infsup (1.0, 1.0)));
%!test
%! assert (isequal (pow (infsup (1.0, 1.5), infsup (0.0, 1.0)), infsup (1.0, 1.500000000000000000e+00)));
%!test
%! assert (isequal (pow (infsup (1.0, 1.5), infsup (-0.0, 1.0)), infsup (1.0, 1.500000000000000000e+00)));
%!test
%! assert (isequal (pow (infsup (1.0, 1.5), infsup (0.0, 2.5)), infsup (1.0, 2.755675960631075672e+00)));
%!test
%! assert (isequal (pow (infsup (1.0, 1.5), infsup (-0.0, 2.5)), infsup (1.0, 2.755675960631075672e+00)));
%!test
%! assert (isequal (pow (infsup (1.0, 1.5), infsup (0.0, inf)), infsup (1.0, inf)));
%!test
%! assert (isequal (pow (infsup (1.0, 1.5), infsup (-0.0, inf)), infsup (1.0, inf)));
%!test
%! assert (isequal (pow (infsup (1.0, 1.5), infsup (0.1, 0.1)), infsup (1.0, 1.041379743992410623e+00)));
%!test
%! assert (isequal (pow (infsup (1.0, 1.5), infsup (0.1, 1.0)), infsup (1.0, 1.500000000000000000e+00)));
%!test
%! assert (isequal (pow (infsup (1.0, 1.5), infsup (0.1, 2.5)), infsup (1.0, 2.755675960631075672e+00)));
%!test
%! assert (isequal (pow (infsup (1.0, 1.5), infsup (0.1, inf)), infsup (1.0, inf)));
%!test
%! assert (isequal (pow (infsup (1.0, 1.5), infsup (1.0, 1.0)), infsup (1.0, 1.500000000000000000e+00)));
%!test
%! assert (isequal (pow (infsup (1.0, 1.5), infsup (1.0, 2.5)), infsup (1.0, 2.755675960631075672e+00)));
%!test
%! assert (isequal (pow (infsup (1.0, 1.5), infsup (1.0, inf)), infsup (1.0, inf)));
%!test
%! assert (isequal (pow (infsup (1.0, 1.5), infsup (2.5, 2.5)), infsup (1.0, 2.755675960631075672e+00)));
%!test
%! assert (isequal (pow (infsup (1.0, 1.5), infsup (2.5, inf)), infsup (1.0, inf)));
%!test
%! assert (isequal (pow (infsup (1.0, 1.5), infsup (-0.1, 0.1)), infsup (9.602645007922180342e-01, 1.041379743992410623e+00)));
%!test
%! assert (isequal (pow (infsup (1.0, 1.5), infsup (-0.1, 1.0)), infsup (9.602645007922180342e-01, 1.500000000000000000e+00)));
%!test
%! assert (isequal (pow (infsup (1.0, 1.5), infsup (-0.1, 2.5)), infsup (9.602645007922180342e-01, 2.755675960631075672e+00)));
%!test
%! assert (isequal (pow (infsup (1.0, 1.5), infsup (-0.1, inf)), infsup (9.602645007922180342e-01, inf)));
%!test
%! assert (isequal (pow (infsup (1.0, 1.5), infsup (-1.0, 0.1)), infsup (6.666666666666666297e-01, 1.041379743992410623e+00)));
%!test
%! assert (isequal (pow (infsup (1.0, 1.5), infsup (-1.0, 1.0)), infsup (6.666666666666666297e-01, 1.500000000000000000e+00)));
%!test
%! assert (isequal (pow (infsup (1.0, 1.5), infsup (-1.0, 2.5)), infsup (6.666666666666666297e-01, 2.755675960631075672e+00)));
%!test
%! assert (isequal (pow (infsup (1.0, 1.5), infsup (-1.0, inf)), infsup (6.666666666666666297e-01, inf)));
%!test
%! assert (isequal (pow (infsup (1.0, 1.5), infsup (-2.5, 0.1)), infsup (3.628873693012115154e-01, 1.041379743992410623e+00)));
%!test
%! assert (isequal (pow (infsup (1.0, 1.5), infsup (-2.5, 1.0)), infsup (3.628873693012115154e-01, 1.500000000000000000e+00)));
%!test
%! assert (isequal (pow (infsup (1.0, 1.5), infsup (-2.5, 2.5)), infsup (3.628873693012115154e-01, 2.755675960631075672e+00)));
%!test
%! assert (isequal (pow (infsup (1.0, 1.5), infsup (-2.5, inf)), infsup (3.628873693012115154e-01, inf)));
%!test
%! assert (isequal (pow (infsup (1.0, 1.5), infsup (-inf, 0.1)), infsup (0.000000000000000000e+00, 1.041379743992410623e+00)));
%!test
%! assert (isequal (pow (infsup (1.0, 1.5), infsup (-inf, 1.0)), infsup (0.000000000000000000e+00, 1.500000000000000000e+00)));
%!test
%! assert (isequal (pow (infsup (1.0, 1.5), infsup (-inf, 2.5)), infsup (0.000000000000000000e+00, 2.755675960631075672e+00)));
%!test
%! assert (isequal (pow (infsup (1.0, 1.5), infsup (-inf, inf)), infsup (0.000000000000000000e+00, inf)));
%!test
%! assert (isequal (pow (infsup (1.0, 1.5), infsup (-1.0, 0.0)), infsup (6.666666666666666297e-01, 1.0)));
%!test
%! assert (isequal (pow (infsup (1.0, 1.5), infsup (-1.0, -0.0)), infsup (6.666666666666666297e-01, 1.0)));
%!test
%! assert (isequal (pow (infsup (1.0, 1.5), infsup (-2.5, 0.0)), infsup (3.628873693012115154e-01, 1.0)));
%!test
%! assert (isequal (pow (infsup (1.0, 1.5), infsup (-2.5, -0.0)), infsup (3.628873693012115154e-01, 1.0)));
%!test
%! assert (isequal (pow (infsup (1.0, 1.5), infsup (-inf, 0.0)), infsup (0.000000000000000000e+00, 1.0)));
%!test
%! assert (isequal (pow (infsup (1.0, 1.5), infsup (-inf, -0.0)), infsup (0.000000000000000000e+00, 1.0)));
%!test
%! assert (isequal (pow (infsup (1.0, 1.5), infsup (-0.1, -0.1)), infsup (9.602645007922180342e-01, 1.0)));
%!test
%! assert (isequal (pow (infsup (1.0, 1.5), infsup (-1.0, -0.1)), infsup (6.666666666666666297e-01, 1.0)));
%!test
%! assert (isequal (pow (infsup (1.0, 1.5), infsup (-2.5, -0.1)), infsup (3.628873693012115154e-01, 1.0)));
%!test
%! assert (isequal (pow (infsup (1.0, 1.5), infsup (-inf, -0.1)), infsup (0.000000000000000000e+00, 1.0)));
%!test
%! assert (isequal (pow (infsup (1.0, 1.5), infsup (-1.0, -1.0)), infsup (6.666666666666666297e-01, 1.0)));
%!test
%! assert (isequal (pow (infsup (1.0, 1.5), infsup (-2.5, -1.0)), infsup (3.628873693012115154e-01, 1.0)));
%!test
%! assert (isequal (pow (infsup (1.0, 1.5), infsup (-inf, -1.0)), infsup (0.000000000000000000e+00, 1.0)));
%!test
%! assert (isequal (pow (infsup (1.0, 1.5), infsup (-2.5, -2.5)), infsup (3.628873693012115154e-01, 1.0)));
%!test
%! assert (isequal (pow (infsup (1.0, 1.5), infsup (-inf, -2.5)), infsup (0.000000000000000000e+00, 1.0)));
%!test
%! assert (isequal (pow (infsup (1.0, inf), infsup), infsup));
%!test
%! assert (isequal (pow (infsup (1.0, inf), infsup (0.0, 0.0)), infsup (1.0, 1.0)));
%!test
%! assert (isequal (pow (infsup (1.0, inf), infsup (-0.0, -0.0)), infsup (1.0, 1.0)));
%!test
%! assert (isequal (pow (infsup (1.0, inf), infsup (0.0, 1.0)), infsup (1.0, inf)));
%!test
%! assert (isequal (pow (infsup (1.0, inf), infsup (-0.0, 1.0)), infsup (1.0, inf)));
%!test
%! assert (isequal (pow (infsup (1.0, inf), infsup (0.0, 2.5)), infsup (1.0, inf)));
%!test
%! assert (isequal (pow (infsup (1.0, inf), infsup (-0.0, 2.5)), infsup (1.0, inf)));
%!test
%! assert (isequal (pow (infsup (1.0, inf), infsup (0.0, inf)), infsup (1.0, inf)));
%!test
%! assert (isequal (pow (infsup (1.0, inf), infsup (-0.0, inf)), infsup (1.0, inf)));
%!test
%! assert (isequal (pow (infsup (1.0, inf), infsup (0.1, 0.1)), infsup (1.0, inf)));
%!test
%! assert (isequal (pow (infsup (1.0, inf), infsup (0.1, 1.0)), infsup (1.0, inf)));
%!test
%! assert (isequal (pow (infsup (1.0, inf), infsup (0.1, 2.5)), infsup (1.0, inf)));
%!test
%! assert (isequal (pow (infsup (1.0, inf), infsup (0.1, inf)), infsup (1.0, inf)));
%!test
%! assert (isequal (pow (infsup (1.0, inf), infsup (1.0, 1.0)), infsup (1.0, inf)));
%!test
%! assert (isequal (pow (infsup (1.0, inf), infsup (1.0, 2.5)), infsup (1.0, inf)));
%!test
%! assert (isequal (pow (infsup (1.0, inf), infsup (1.0, inf)), infsup (1.0, inf)));
%!test
%! assert (isequal (pow (infsup (1.0, inf), infsup (2.5, 2.5)), infsup (1.0, inf)));
%!test
%! assert (isequal (pow (infsup (1.0, inf), infsup (2.5, inf)), infsup (1.0, inf)));
%!test
%! assert (isequal (pow (infsup (1.0, inf), infsup (-0.1, 0.1)), infsup (0.000000000000000000e+00, inf)));
%!test
%! assert (isequal (pow (infsup (1.0, inf), infsup (-0.1, 1.0)), infsup (0.000000000000000000e+00, inf)));
%!test
%! assert (isequal (pow (infsup (1.0, inf), infsup (-0.1, 2.5)), infsup (0.000000000000000000e+00, inf)));
%!test
%! assert (isequal (pow (infsup (1.0, inf), infsup (-0.1, inf)), infsup (0.000000000000000000e+00, inf)));
%!test
%! assert (isequal (pow (infsup (1.0, inf), infsup (-1.0, 0.1)), infsup (0.000000000000000000e+00, inf)));
%!test
%! assert (isequal (pow (infsup (1.0, inf), infsup (-1.0, 1.0)), infsup (0.000000000000000000e+00, inf)));
%!test
%! assert (isequal (pow (infsup (1.0, inf), infsup (-1.0, 2.5)), infsup (0.000000000000000000e+00, inf)));
%!test
%! assert (isequal (pow (infsup (1.0, inf), infsup (-1.0, inf)), infsup (0.000000000000000000e+00, inf)));
%!test
%! assert (isequal (pow (infsup (1.0, inf), infsup (-2.5, 0.1)), infsup (0.000000000000000000e+00, inf)));
%!test
%! assert (isequal (pow (infsup (1.0, inf), infsup (-2.5, 1.0)), infsup (0.000000000000000000e+00, inf)));
%!test
%! assert (isequal (pow (infsup (1.0, inf), infsup (-2.5, 2.5)), infsup (0.000000000000000000e+00, inf)));
%!test
%! assert (isequal (pow (infsup (1.0, inf), infsup (-2.5, inf)), infsup (0.000000000000000000e+00, inf)));
%!test
%! assert (isequal (pow (infsup (1.0, inf), infsup (-inf, 0.1)), infsup (0.000000000000000000e+00, inf)));
%!test
%! assert (isequal (pow (infsup (1.0, inf), infsup (-inf, 1.0)), infsup (0.000000000000000000e+00, inf)));
%!test
%! assert (isequal (pow (infsup (1.0, inf), infsup (-inf, 2.5)), infsup (0.000000000000000000e+00, inf)));
%!test
%! assert (isequal (pow (infsup (1.0, inf), infsup (-inf, inf)), infsup (0.000000000000000000e+00, inf)));
%!test
%! assert (isequal (pow (infsup (1.0, inf), infsup (-1.0, 0.0)), infsup (0.000000000000000000e+00, 1.0)));
%!test
%! assert (isequal (pow (infsup (1.0, inf), infsup (-1.0, -0.0)), infsup (0.000000000000000000e+00, 1.0)));
%!test
%! assert (isequal (pow (infsup (1.0, inf), infsup (-2.5, 0.0)), infsup (0.000000000000000000e+00, 1.0)));
%!test
%! assert (isequal (pow (infsup (1.0, inf), infsup (-2.5, -0.0)), infsup (0.000000000000000000e+00, 1.0)));
%!test
%! assert (isequal (pow (infsup (1.0, inf), infsup (-inf, 0.0)), infsup (0.000000000000000000e+00, 1.0)));
%!test
%! assert (isequal (pow (infsup (1.0, inf), infsup (-inf, -0.0)), infsup (0.000000000000000000e+00, 1.0)));
%!test
%! assert (isequal (pow (infsup (1.0, inf), infsup (-0.1, -0.1)), infsup (0.000000000000000000e+00, 1.0)));
%!test
%! assert (isequal (pow (infsup (1.0, inf), infsup (-1.0, -0.1)), infsup (0.000000000000000000e+00, 1.0)));
%!test
%! assert (isequal (pow (infsup (1.0, inf), infsup (-2.5, -0.1)), infsup (0.000000000000000000e+00, 1.0)));
%!test
%! assert (isequal (pow (infsup (1.0, inf), infsup (-inf, -0.1)), infsup (0.000000000000000000e+00, 1.0)));
%!test
%! assert (isequal (pow (infsup (1.0, inf), infsup (-1.0, -1.0)), infsup (0.000000000000000000e+00, 1.0)));
%!test
%! assert (isequal (pow (infsup (1.0, inf), infsup (-2.5, -1.0)), infsup (0.000000000000000000e+00, 1.0)));
%!test
%! assert (isequal (pow (infsup (1.0, inf), infsup (-inf, -1.0)), infsup (0.000000000000000000e+00, 1.0)));
%!test
%! assert (isequal (pow (infsup (1.0, inf), infsup (-2.5, -2.5)), infsup (0.000000000000000000e+00, 1.0)));
%!test
%! assert (isequal (pow (infsup (1.0, inf), infsup (-inf, -2.5)), infsup (0.000000000000000000e+00, 1.0)));
%!test
%! assert (isequal (pow (infsup (1.1, 1.5), infsup), infsup));
%!test
%! assert (isequal (pow (infsup (1.1, 1.5), infsup (0.0, 0.0)), infsup (1.0, 1.0)));
%!test
%! assert (isequal (pow (infsup (1.1, 1.5), infsup (-0.0, -0.0)), infsup (1.0, 1.0)));
%!test
%! assert (isequal (pow (infsup (1.1, 1.5), infsup (0.0, 1.0)), infsup (1.0, 1.500000000000000000e+00)));
%!test
%! assert (isequal (pow (infsup (1.1, 1.5), infsup (-0.0, 1.0)), infsup (1.0, 1.500000000000000000e+00)));
%!test
%! assert (isequal (pow (infsup (1.1, 1.5), infsup (0.0, 2.5)), infsup (1.0, 2.755675960631075672e+00)));
%!test
%! assert (isequal (pow (infsup (1.1, 1.5), infsup (-0.0, 2.5)), infsup (1.0, 2.755675960631075672e+00)));
%!test
%! assert (isequal (pow (infsup (1.1, 1.5), infsup (0.0, inf)), infsup (1.0, inf)));
%!test
%! assert (isequal (pow (infsup (1.1, 1.5), infsup (-0.0, inf)), infsup (1.0, inf)));
%!test
%! assert (isequal (pow (infsup (1.1, 1.5), infsup (0.1, 0.1)), infsup (1.009576582776886999e+00, 1.041379743992410623e+00)));
%!test
%! assert (isequal (pow (infsup (1.1, 1.5), infsup (0.1, 1.0)), infsup (1.009576582776886999e+00, 1.500000000000000000e+00)));
%!test
%! assert (isequal (pow (infsup (1.1, 1.5), infsup (0.1, 2.5)), infsup (1.009576582776886999e+00, 2.755675960631075672e+00)));
%!test
%! assert (isequal (pow (infsup (1.1, 1.5), infsup (0.1, inf)), infsup (1.009576582776886999e+00, inf)));
%!test
%! assert (isequal (pow (infsup (1.1, 1.5), infsup (1.0, 1.0)), infsup (1.100000000000000089e+00, 1.500000000000000000e+00)));
%!test
%! assert (isequal (pow (infsup (1.1, 1.5), infsup (1.0, 2.5)), infsup (1.100000000000000089e+00, 2.755675960631075672e+00)));
%!test
%! assert (isequal (pow (infsup (1.1, 1.5), infsup (1.0, inf)), infsup (1.100000000000000089e+00, inf)));
%!test
%! assert (isequal (pow (infsup (1.1, 1.5), infsup (2.5, 2.5)), infsup (1.269058706285883575e+00, 2.755675960631075672e+00)));
%!test
%! assert (isequal (pow (infsup (1.1, 1.5), infsup (2.5, inf)), infsup (1.269058706285883575e+00, inf)));
%!test
%! assert (isequal (pow (infsup (1.1, 1.5), infsup (-0.1, 0.1)), infsup (9.602645007922180342e-01, 1.041379743992410623e+00)));
%!test
%! assert (isequal (pow (infsup (1.1, 1.5), infsup (-0.1, 1.0)), infsup (9.602645007922180342e-01, 1.500000000000000000e+00)));
%!test
%! assert (isequal (pow (infsup (1.1, 1.5), infsup (-0.1, 2.5)), infsup (9.602645007922180342e-01, 2.755675960631075672e+00)));
%!test
%! assert (isequal (pow (infsup (1.1, 1.5), infsup (-0.1, inf)), infsup (9.602645007922180342e-01, inf)));
%!test
%! assert (isequal (pow (infsup (1.1, 1.5), infsup (-1.0, 0.1)), infsup (6.666666666666666297e-01, 1.041379743992410623e+00)));
%!test
%! assert (isequal (pow (infsup (1.1, 1.5), infsup (-1.0, 1.0)), infsup (6.666666666666666297e-01, 1.500000000000000000e+00)));
%!test
%! assert (isequal (pow (infsup (1.1, 1.5), infsup (-1.0, 2.5)), infsup (6.666666666666666297e-01, 2.755675960631075672e+00)));
%!test
%! assert (isequal (pow (infsup (1.1, 1.5), infsup (-1.0, inf)), infsup (6.666666666666666297e-01, inf)));
%!test
%! assert (isequal (pow (infsup (1.1, 1.5), infsup (-2.5, 0.1)), infsup (3.628873693012115154e-01, 1.041379743992410623e+00)));
%!test
%! assert (isequal (pow (infsup (1.1, 1.5), infsup (-2.5, 1.0)), infsup (3.628873693012115154e-01, 1.500000000000000000e+00)));
%!test
%! assert (isequal (pow (infsup (1.1, 1.5), infsup (-2.5, 2.5)), infsup (3.628873693012115154e-01, 2.755675960631075672e+00)));
%!test
%! assert (isequal (pow (infsup (1.1, 1.5), infsup (-2.5, inf)), infsup (3.628873693012115154e-01, inf)));
%!test
%! assert (isequal (pow (infsup (1.1, 1.5), infsup (-inf, 0.1)), infsup (0.000000000000000000e+00, 1.041379743992410623e+00)));
%!test
%! assert (isequal (pow (infsup (1.1, 1.5), infsup (-inf, 1.0)), infsup (0.000000000000000000e+00, 1.500000000000000000e+00)));
%!test
%! assert (isequal (pow (infsup (1.1, 1.5), infsup (-inf, 2.5)), infsup (0.000000000000000000e+00, 2.755675960631075672e+00)));
%!test
%! assert (isequal (pow (infsup (1.1, 1.5), infsup (-inf, inf)), infsup (0.000000000000000000e+00, inf)));
%!test
%! assert (isequal (pow (infsup (1.1, 1.5), infsup (-1.0, 0.0)), infsup (6.666666666666666297e-01, 1.0)));
%!test
%! assert (isequal (pow (infsup (1.1, 1.5), infsup (-1.0, -0.0)), infsup (6.666666666666666297e-01, 1.0)));
%!test
%! assert (isequal (pow (infsup (1.1, 1.5), infsup (-2.5, 0.0)), infsup (3.628873693012115154e-01, 1.0)));
%!test
%! assert (isequal (pow (infsup (1.1, 1.5), infsup (-2.5, -0.0)), infsup (3.628873693012115154e-01, 1.0)));
%!test
%! assert (isequal (pow (infsup (1.1, 1.5), infsup (-inf, 0.0)), infsup (0.000000000000000000e+00, 1.0)));
%!test
%! assert (isequal (pow (infsup (1.1, 1.5), infsup (-inf, -0.0)), infsup (0.000000000000000000e+00, 1.0)));
%!test
%! assert (isequal (pow (infsup (1.1, 1.5), infsup (-0.1, -0.1)), infsup (9.602645007922180342e-01, 9.905142582145218810e-01)));
%!test
%! assert (isequal (pow (infsup (1.1, 1.5), infsup (-1.0, -0.1)), infsup (6.666666666666666297e-01, 9.905142582145218810e-01)));
%!test
%! assert (isequal (pow (infsup (1.1, 1.5), infsup (-2.5, -0.1)), infsup (3.628873693012115154e-01, 9.905142582145218810e-01)));
%!test
%! assert (isequal (pow (infsup (1.1, 1.5), infsup (-inf, -0.1)), infsup (0.000000000000000000e+00, 9.905142582145218810e-01)));
%!test
%! assert (isequal (pow (infsup (1.1, 1.5), infsup (-1.0, -1.0)), infsup (6.666666666666666297e-01, 9.090909090909090606e-01)));
%!test
%! assert (isequal (pow (infsup (1.1, 1.5), infsup (-2.5, -1.0)), infsup (3.628873693012115154e-01, 9.090909090909090606e-01)));
%!test
%! assert (isequal (pow (infsup (1.1, 1.5), infsup (-inf, -1.0)), infsup (0.000000000000000000e+00, 9.090909090909090606e-01)));
%!test
%! assert (isequal (pow (infsup (1.1, 1.5), infsup (-2.5, -2.5)), infsup (3.628873693012115154e-01, 7.879856109467704428e-01)));
%!test
%! assert (isequal (pow (infsup (1.1, 1.5), infsup (-inf, -2.5)), infsup (0.000000000000000000e+00, 7.879856109467704428e-01)));
%!test
%! assert (isequal (pow (infsup (1.1, inf), infsup), infsup));
%!test
%! assert (isequal (pow (infsup (1.1, inf), infsup (0.0, 0.0)), infsup (1.0, 1.0)));
%!test
%! assert (isequal (pow (infsup (1.1, inf), infsup (-0.0, -0.0)), infsup (1.0, 1.0)));
%!test
%! assert (isequal (pow (infsup (1.1, inf), infsup (0.0, 1.0)), infsup (1.0, inf)));
%!test
%! assert (isequal (pow (infsup (1.1, inf), infsup (-0.0, 1.0)), infsup (1.0, inf)));
%!test
%! assert (isequal (pow (infsup (1.1, inf), infsup (0.0, 2.5)), infsup (1.0, inf)));
%!test
%! assert (isequal (pow (infsup (1.1, inf), infsup (-0.0, 2.5)), infsup (1.0, inf)));
%!test
%! assert (isequal (pow (infsup (1.1, inf), infsup (0.0, inf)), infsup (1.0, inf)));
%!test
%! assert (isequal (pow (infsup (1.1, inf), infsup (-0.0, inf)), infsup (1.0, inf)));
%!test
%! assert (isequal (pow (infsup (1.1, inf), infsup (0.1, 0.1)), infsup (1.009576582776886999e+00, inf)));
%!test
%! assert (isequal (pow (infsup (1.1, inf), infsup (0.1, 1.0)), infsup (1.009576582776886999e+00, inf)));
%!test
%! assert (isequal (pow (infsup (1.1, inf), infsup (0.1, 2.5)), infsup (1.009576582776886999e+00, inf)));
%!test
%! assert (isequal (pow (infsup (1.1, inf), infsup (0.1, inf)), infsup (1.009576582776886999e+00, inf)));
%!test
%! assert (isequal (pow (infsup (1.1, inf), infsup (1.0, 1.0)), infsup (1.100000000000000089e+00, inf)));
%!test
%! assert (isequal (pow (infsup (1.1, inf), infsup (1.0, 2.5)), infsup (1.100000000000000089e+00, inf)));
%!test
%! assert (isequal (pow (infsup (1.1, inf), infsup (1.0, inf)), infsup (1.100000000000000089e+00, inf)));
%!test
%! assert (isequal (pow (infsup (1.1, inf), infsup (2.5, 2.5)), infsup (1.269058706285883575e+00, inf)));
%!test
%! assert (isequal (pow (infsup (1.1, inf), infsup (2.5, inf)), infsup (1.269058706285883575e+00, inf)));
%!test
%! assert (isequal (pow (infsup (1.1, inf), infsup (-0.1, 0.1)), infsup (0.000000000000000000e+00, inf)));
%!test
%! assert (isequal (pow (infsup (1.1, inf), infsup (-0.1, 1.0)), infsup (0.000000000000000000e+00, inf)));
%!test
%! assert (isequal (pow (infsup (1.1, inf), infsup (-0.1, 2.5)), infsup (0.000000000000000000e+00, inf)));
%!test
%! assert (isequal (pow (infsup (1.1, inf), infsup (-0.1, inf)), infsup (0.000000000000000000e+00, inf)));
%!test
%! assert (isequal (pow (infsup (1.1, inf), infsup (-1.0, 0.1)), infsup (0.000000000000000000e+00, inf)));
%!test
%! assert (isequal (pow (infsup (1.1, inf), infsup (-1.0, 1.0)), infsup (0.000000000000000000e+00, inf)));
%!test
%! assert (isequal (pow (infsup (1.1, inf), infsup (-1.0, 2.5)), infsup (0.000000000000000000e+00, inf)));
%!test
%! assert (isequal (pow (infsup (1.1, inf), infsup (-1.0, inf)), infsup (0.000000000000000000e+00, inf)));
%!test
%! assert (isequal (pow (infsup (1.1, inf), infsup (-2.5, 0.1)), infsup (0.000000000000000000e+00, inf)));
%!test
%! assert (isequal (pow (infsup (1.1, inf), infsup (-2.5, 1.0)), infsup (0.000000000000000000e+00, inf)));
%!test
%! assert (isequal (pow (infsup (1.1, inf), infsup (-2.5, 2.5)), infsup (0.000000000000000000e+00, inf)));
%!test
%! assert (isequal (pow (infsup (1.1, inf), infsup (-2.5, inf)), infsup (0.000000000000000000e+00, inf)));
%!test
%! assert (isequal (pow (infsup (1.1, inf), infsup (-inf, 0.1)), infsup (0.000000000000000000e+00, inf)));
%!test
%! assert (isequal (pow (infsup (1.1, inf), infsup (-inf, 1.0)), infsup (0.000000000000000000e+00, inf)));
%!test
%! assert (isequal (pow (infsup (1.1, inf), infsup (-inf, 2.5)), infsup (0.000000000000000000e+00, inf)));
%!test
%! assert (isequal (pow (infsup (1.1, inf), infsup (-inf, inf)), infsup (0.000000000000000000e+00, inf)));
%!test
%! assert (isequal (pow (infsup (1.1, inf), infsup (-1.0, 0.0)), infsup (0.000000000000000000e+00, 1.0)));
%!test
%! assert (isequal (pow (infsup (1.1, inf), infsup (-1.0, -0.0)), infsup (0.000000000000000000e+00, 1.0)));
%!test
%! assert (isequal (pow (infsup (1.1, inf), infsup (-2.5, 0.0)), infsup (0.000000000000000000e+00, 1.0)));
%!test
%! assert (isequal (pow (infsup (1.1, inf), infsup (-2.5, -0.0)), infsup (0.000000000000000000e+00, 1.0)));
%!test
%! assert (isequal (pow (infsup (1.1, inf), infsup (-inf, 0.0)), infsup (0.000000000000000000e+00, 1.0)));
%!test
%! assert (isequal (pow (infsup (1.1, inf), infsup (-inf, -0.0)), infsup (0.000000000000000000e+00, 1.0)));
%!test
%! assert (isequal (pow (infsup (1.1, inf), infsup (-0.1, -0.1)), infsup (0.000000000000000000e+00, 9.905142582145218810e-01)));
%!test
%! assert (isequal (pow (infsup (1.1, inf), infsup (-1.0, -0.1)), infsup (0.000000000000000000e+00, 9.905142582145218810e-01)));
%!test
%! assert (isequal (pow (infsup (1.1, inf), infsup (-2.5, -0.1)), infsup (0.000000000000000000e+00, 9.905142582145218810e-01)));
%!test
%! assert (isequal (pow (infsup (1.1, inf), infsup (-inf, -0.1)), infsup (0.000000000000000000e+00, 9.905142582145218810e-01)));
%!test
%! assert (isequal (pow (infsup (1.1, inf), infsup (-1.0, -1.0)), infsup (0.000000000000000000e+00, 9.090909090909090606e-01)));
%!test
%! assert (isequal (pow (infsup (1.1, inf), infsup (-2.5, -1.0)), infsup (0.000000000000000000e+00, 9.090909090909090606e-01)));
%!test
%! assert (isequal (pow (infsup (1.1, inf), infsup (-inf, -1.0)), infsup (0.000000000000000000e+00, 9.090909090909090606e-01)));
%!test
%! assert (isequal (pow (infsup (1.1, inf), infsup (-2.5, -2.5)), infsup (0.000000000000000000e+00, 7.879856109467704428e-01)));
%!test
%! assert (isequal (pow (infsup (1.1, inf), infsup (-inf, -2.5)), infsup (0.000000000000000000e+00, 7.879856109467704428e-01)));
%!test
%! assert (isequal (pow (infsup (0.0, 0.5), infsup), infsup));
%!test
%! assert (isequal (pow (infsup (0.0, 0.5), infsup (0.0, 0.0)), infsup (1.0, 1.0)));
%!test
%! assert (isequal (pow (infsup (0.0, 0.5), infsup (-0.0, -0.0)), infsup (1.0, 1.0)));
%!test
%! assert (isequal (pow (infsup (0.0, 0.5), infsup (0.0, 1.0)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (pow (infsup (0.0, 0.5), infsup (-0.0, 1.0)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (pow (infsup (0.0, 0.5), infsup (0.0, 2.5)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (pow (infsup (0.0, 0.5), infsup (-0.0, 2.5)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (pow (infsup (0.0, 0.5), infsup (0.0, inf)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (pow (infsup (0.0, 0.5), infsup (-0.0, inf)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (pow (infsup (0.0, 0.5), infsup (0.1, 0.1)), infsup (0.0, 9.330329915368075211e-01)));
%!test
%! assert (isequal (pow (infsup (0.0, 0.5), infsup (0.1, 1.0)), infsup (0.0, 9.330329915368075211e-01)));
%!test
%! assert (isequal (pow (infsup (0.0, 0.5), infsup (0.1, 2.5)), infsup (0.0, 9.330329915368075211e-01)));
%!test
%! assert (isequal (pow (infsup (0.0, 0.5), infsup (0.1, inf)), infsup (0.0, 9.330329915368075211e-01)));
%!test
%! assert (isequal (pow (infsup (0.0, 0.5), infsup (1.0, 1.0)), infsup (0.0, 0.5)));
%!test
%! assert (isequal (pow (infsup (0.0, 0.5), infsup (1.0, 2.5)), infsup (0.0, 0.5)));
%!test
%! assert (isequal (pow (infsup (0.0, 0.5), infsup (1.0, inf)), infsup (0.0, 0.5)));
%!test
%! assert (isequal (pow (infsup (0.0, 0.5), infsup (2.5, 2.5)), infsup (0.0, 1.767766952966368932e-01)));
%!test
%! assert (isequal (pow (infsup (0.0, 0.5), infsup (2.5, inf)), infsup (0.0, 1.767766952966368932e-01)));
%!test
%! assert (isequal (pow (infsup (0.0, 0.5), infsup (-0.1, 0.1)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, 0.5), infsup (-0.1, 1.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, 0.5), infsup (-0.1, 2.5)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, 0.5), infsup (-0.1, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, 0.5), infsup (-1.0, 0.1)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, 0.5), infsup (-1.0, 1.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, 0.5), infsup (-1.0, 2.5)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, 0.5), infsup (-1.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, 0.5), infsup (-2.5, 0.1)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, 0.5), infsup (-2.5, 1.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, 0.5), infsup (-2.5, 2.5)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, 0.5), infsup (-2.5, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, 0.5), infsup (-inf, 0.1)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, 0.5), infsup (-inf, 1.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, 0.5), infsup (-inf, 2.5)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, 0.5), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, 0.5), infsup (-1.0, 0.0)), infsup (1.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, 0.5), infsup (-1.0, -0.0)), infsup (1.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, 0.5), infsup (-2.5, 0.0)), infsup (1.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, 0.5), infsup (-2.5, -0.0)), infsup (1.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, 0.5), infsup (-inf, 0.0)), infsup (1.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, 0.5), infsup (-inf, -0.0)), infsup (1.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, 0.5), infsup (-0.1, -0.1)), infsup (1.071773462536293131e+00, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, 0.5), infsup (-1.0, -0.1)), infsup (1.071773462536293131e+00, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, 0.5), infsup (-2.5, -0.1)), infsup (1.071773462536293131e+00, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, 0.5), infsup (-inf, -0.1)), infsup (1.071773462536293131e+00, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, 0.5), infsup (-1.0, -1.0)), infsup (2.000000000000000000e+00, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, 0.5), infsup (-2.5, -1.0)), infsup (2.000000000000000000e+00, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, 0.5), infsup (-inf, -1.0)), infsup (2.000000000000000000e+00, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, 0.5), infsup (-2.5, -2.5)), infsup (5.656854249492379694e+00, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, 0.5), infsup (-inf, -2.5)), infsup (5.656854249492379694e+00, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, 1.0), infsup), infsup));
%!test
%! assert (isequal (pow (infsup (0.0, 1.0), infsup (0.0, 0.0)), infsup (1.0, 1.0)));
%!test
%! assert (isequal (pow (infsup (0.0, 1.0), infsup (-0.0, -0.0)), infsup (1.0, 1.0)));
%!test
%! assert (isequal (pow (infsup (0.0, 1.0), infsup (0.0, 1.0)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (pow (infsup (0.0, 1.0), infsup (-0.0, 1.0)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (pow (infsup (0.0, 1.0), infsup (0.0, 2.5)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (pow (infsup (0.0, 1.0), infsup (-0.0, 2.5)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (pow (infsup (0.0, 1.0), infsup (0.0, inf)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (pow (infsup (0.0, 1.0), infsup (-0.0, inf)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (pow (infsup (0.0, 1.0), infsup (0.1, 0.1)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (pow (infsup (0.0, 1.0), infsup (0.1, 1.0)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (pow (infsup (0.0, 1.0), infsup (0.1, 2.5)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (pow (infsup (0.0, 1.0), infsup (0.1, inf)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (pow (infsup (0.0, 1.0), infsup (1.0, 1.0)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (pow (infsup (0.0, 1.0), infsup (1.0, 2.5)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (pow (infsup (0.0, 1.0), infsup (1.0, inf)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (pow (infsup (0.0, 1.0), infsup (2.5, 2.5)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (pow (infsup (0.0, 1.0), infsup (2.5, inf)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (pow (infsup (0.0, 1.0), infsup (-0.1, 0.1)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, 1.0), infsup (-0.1, 1.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, 1.0), infsup (-0.1, 2.5)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, 1.0), infsup (-0.1, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, 1.0), infsup (-1.0, 0.1)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, 1.0), infsup (-1.0, 1.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, 1.0), infsup (-1.0, 2.5)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, 1.0), infsup (-1.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, 1.0), infsup (-2.5, 0.1)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, 1.0), infsup (-2.5, 1.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, 1.0), infsup (-2.5, 2.5)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, 1.0), infsup (-2.5, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, 1.0), infsup (-inf, 0.1)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, 1.0), infsup (-inf, 1.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, 1.0), infsup (-inf, 2.5)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, 1.0), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, 1.0), infsup (-0.1, 0.0)), infsup (1.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, 1.0), infsup (-0.1, -0.0)), infsup (1.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, 1.0), infsup (-1.0, 0.0)), infsup (1.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, 1.0), infsup (-1.0, -0.0)), infsup (1.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, 1.0), infsup (-2.5, 0.0)), infsup (1.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, 1.0), infsup (-2.5, -0.0)), infsup (1.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, 1.0), infsup (-inf, 0.0)), infsup (1.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, 1.0), infsup (-inf, -0.0)), infsup (1.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, 1.0), infsup (-0.1, -0.1)), infsup (1.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, 1.0), infsup (-1.0, -0.1)), infsup (1.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, 1.0), infsup (-2.5, -0.1)), infsup (1.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, 1.0), infsup (-inf, -0.1)), infsup (1.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, 1.0), infsup (-1.0, -1.0)), infsup (1.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, 1.0), infsup (-2.5, -1.0)), infsup (1.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, 1.0), infsup (-inf, -1.0)), infsup (1.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, 1.0), infsup (-2.5, -2.5)), infsup (1.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, 1.0), infsup (-inf, -2.5)), infsup (1.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, 1.5), infsup), infsup));
%!test
%! assert (isequal (pow (infsup (0.0, 1.5), infsup (0.0, 0.0)), infsup (1.0, 1.0)));
%!test
%! assert (isequal (pow (infsup (0.0, 1.5), infsup (-0.0, -0.0)), infsup (1.0, 1.0)));
%!test
%! assert (isequal (pow (infsup (0.0, 1.5), infsup (0.0, 1.0)), infsup (0.0, 1.5)));
%!test
%! assert (isequal (pow (infsup (0.0, 1.5), infsup (-0.0, 1.0)), infsup (0.0, 1.5)));
%!test
%! assert (isequal (pow (infsup (0.0, 1.5), infsup (0.0, 2.5)), infsup (0.0, 2.755675960631075672e+00)));
%!test
%! assert (isequal (pow (infsup (0.0, 1.5), infsup (-0.0, 2.5)), infsup (0.0, 2.755675960631075672e+00)));
%!test
%! assert (isequal (pow (infsup (0.0, 1.5), infsup (0.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, 1.5), infsup (-0.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, 1.5), infsup (0.1, 0.1)), infsup (0.0, 1.041379743992410623e+00)));
%!test
%! assert (isequal (pow (infsup (0.0, 1.5), infsup (0.1, 1.0)), infsup (0.0, 1.5)));
%!test
%! assert (isequal (pow (infsup (0.0, 1.5), infsup (0.1, 2.5)), infsup (0.0, 2.755675960631075672e+00)));
%!test
%! assert (isequal (pow (infsup (0.0, 1.5), infsup (0.1, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, 1.5), infsup (1.0, 1.0)), infsup (0.0, 1.5)));
%!test
%! assert (isequal (pow (infsup (0.0, 1.5), infsup (1.0, 2.5)), infsup (0.0, 2.755675960631075672e+00)));
%!test
%! assert (isequal (pow (infsup (0.0, 1.5), infsup (1.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, 1.5), infsup (2.5, 2.5)), infsup (0.0, 2.755675960631075672e+00)));
%!test
%! assert (isequal (pow (infsup (0.0, 1.5), infsup (2.5, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, 1.5), infsup (-0.1, 0.1)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, 1.5), infsup (-0.1, 1.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, 1.5), infsup (-0.1, 2.5)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, 1.5), infsup (-0.1, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, 1.5), infsup (-1.0, 0.1)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, 1.5), infsup (-1.0, 1.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, 1.5), infsup (-1.0, 2.5)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, 1.5), infsup (-1.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, 1.5), infsup (-2.5, 0.1)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, 1.5), infsup (-2.5, 1.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, 1.5), infsup (-2.5, 2.5)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, 1.5), infsup (-2.5, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, 1.5), infsup (-inf, 0.1)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, 1.5), infsup (-inf, 1.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, 1.5), infsup (-inf, 2.5)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, 1.5), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, 1.5), infsup (-1.0, 0.0)), infsup (6.666666666666666297e-01, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, 1.5), infsup (-1.0, -0.0)), infsup (6.666666666666666297e-01, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, 1.5), infsup (-2.5, 0.0)), infsup (3.628873693012115154e-01, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, 1.5), infsup (-2.5, -0.0)), infsup (3.628873693012115154e-01, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, 1.5), infsup (-inf, 0.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, 1.5), infsup (-inf, -0.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, 1.5), infsup (-0.1, -0.1)), infsup (9.602645007922180342e-01, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, 1.5), infsup (-1.0, -0.1)), infsup (6.666666666666666297e-01, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, 1.5), infsup (-2.5, -0.1)), infsup (3.628873693012115154e-01, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, 1.5), infsup (-inf, -0.1)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, 1.5), infsup (-1.0, -1.0)), infsup (6.666666666666666297e-01, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, 1.5), infsup (-2.5, -1.0)), infsup (3.628873693012115154e-01, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, 1.5), infsup (-inf, -1.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, 1.5), infsup (-2.5, -2.5)), infsup (3.628873693012115154e-01, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, 1.5), infsup (-inf, -2.5)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, inf), infsup), infsup));
%!test
%! assert (isequal (pow (infsup (0.0, inf), infsup (0.0, 0.0)), infsup (1.0, 1.0)));
%!test
%! assert (isequal (pow (infsup (0.0, inf), infsup (-0.0, -0.0)), infsup (1.0, 1.0)));
%!test
%! assert (isequal (pow (infsup (0.0, inf), infsup (0.0, 1.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, inf), infsup (-0.0, 1.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, inf), infsup (0.0, 2.5)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, inf), infsup (-0.0, 2.5)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, inf), infsup (0.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, inf), infsup (-0.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, inf), infsup (0.1, 0.1)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, inf), infsup (0.1, 1.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, inf), infsup (0.1, 2.5)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, inf), infsup (0.1, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, inf), infsup (1.0, 1.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, inf), infsup (1.0, 2.5)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, inf), infsup (1.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, inf), infsup (2.5, 2.5)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, inf), infsup (2.5, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, inf), infsup (-0.1, 0.1)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, inf), infsup (-0.1, 1.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, inf), infsup (-0.1, 2.5)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, inf), infsup (-0.1, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, inf), infsup (-1.0, 0.1)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, inf), infsup (-1.0, 1.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, inf), infsup (-1.0, 2.5)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, inf), infsup (-1.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, inf), infsup (-2.5, 0.1)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, inf), infsup (-2.5, 1.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, inf), infsup (-2.5, 2.5)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, inf), infsup (-2.5, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, inf), infsup (-inf, 0.1)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, inf), infsup (-inf, 1.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, inf), infsup (-inf, 2.5)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, inf), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, inf), infsup (-1.0, 0.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, inf), infsup (-1.0, -0.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, inf), infsup (-2.5, 0.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, inf), infsup (-2.5, -0.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, inf), infsup (-inf, 0.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, inf), infsup (-inf, -0.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, inf), infsup (-0.1, -0.1)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, inf), infsup (-1.0, -0.1)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, inf), infsup (-2.5, -0.1)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, inf), infsup (-inf, -0.1)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, inf), infsup (-1.0, -1.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, inf), infsup (-2.5, -1.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, inf), infsup (-inf, -1.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, inf), infsup (-inf, -2.5)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, inf), infsup (-2.5, -2.5)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, 0.5), infsup), infsup));
%!test
%! assert (isequal (pow (infsup (-0.0, 0.5), infsup (0.0, 0.0)), infsup (1.0, 1.0)));
%!test
%! assert (isequal (pow (infsup (-0.0, 0.5), infsup (-0.0, -0.0)), infsup (1.0, 1.0)));
%!test
%! assert (isequal (pow (infsup (-0.0, 0.5), infsup (0.0, 1.0)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (pow (infsup (-0.0, 0.5), infsup (-0.0, 1.0)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (pow (infsup (-0.0, 0.5), infsup (0.0, 2.5)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (pow (infsup (-0.0, 0.5), infsup (-0.0, 2.5)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (pow (infsup (-0.0, 0.5), infsup (0.0, inf)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (pow (infsup (-0.0, 0.5), infsup (-0.0, inf)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (pow (infsup (-0.0, 0.5), infsup (0.1, 0.1)), infsup (0.0, 9.330329915368075211e-01)));
%!test
%! assert (isequal (pow (infsup (-0.0, 0.5), infsup (0.1, 1.0)), infsup (0.0, 9.330329915368075211e-01)));
%!test
%! assert (isequal (pow (infsup (-0.0, 0.5), infsup (0.1, 2.5)), infsup (0.0, 9.330329915368075211e-01)));
%!test
%! assert (isequal (pow (infsup (-0.0, 0.5), infsup (0.1, inf)), infsup (0.0, 9.330329915368075211e-01)));
%!test
%! assert (isequal (pow (infsup (-0.0, 0.5), infsup (1.0, 1.0)), infsup (0.0, 0.5)));
%!test
%! assert (isequal (pow (infsup (-0.0, 0.5), infsup (1.0, 2.5)), infsup (0.0, 0.5)));
%!test
%! assert (isequal (pow (infsup (-0.0, 0.5), infsup (1.0, inf)), infsup (0.0, 0.5)));
%!test
%! assert (isequal (pow (infsup (-0.0, 0.5), infsup (2.5, 2.5)), infsup (0.0, 1.767766952966368932e-01)));
%!test
%! assert (isequal (pow (infsup (-0.0, 0.5), infsup (2.5, inf)), infsup (0.0, 1.767766952966368932e-01)));
%!test
%! assert (isequal (pow (infsup (-0.0, 0.5), infsup (-0.1, 0.1)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, 0.5), infsup (-0.1, 1.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, 0.5), infsup (-0.1, 2.5)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, 0.5), infsup (-0.1, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, 0.5), infsup (-1.0, 0.1)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, 0.5), infsup (-1.0, 1.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, 0.5), infsup (-1.0, 2.5)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, 0.5), infsup (-1.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, 0.5), infsup (-2.5, 0.1)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, 0.5), infsup (-2.5, 1.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, 0.5), infsup (-2.5, 2.5)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, 0.5), infsup (-2.5, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, 0.5), infsup (-inf, 0.1)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, 0.5), infsup (-inf, 1.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, 0.5), infsup (-inf, 2.5)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, 0.5), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, 0.5), infsup (-1.0, 0.0)), infsup (1.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, 0.5), infsup (-1.0, -0.0)), infsup (1.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, 0.5), infsup (-2.5, 0.0)), infsup (1.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, 0.5), infsup (-2.5, -0.0)), infsup (1.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, 0.5), infsup (-inf, 0.0)), infsup (1.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, 0.5), infsup (-inf, -0.0)), infsup (1.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, 0.5), infsup (-0.1, -0.1)), infsup (1.071773462536293131e+00, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, 0.5), infsup (-1.0, -0.1)), infsup (1.071773462536293131e+00, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, 0.5), infsup (-2.5, -0.1)), infsup (1.071773462536293131e+00, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, 0.5), infsup (-inf, -0.1)), infsup (1.071773462536293131e+00, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, 0.5), infsup (-1.0, -1.0)), infsup (2.000000000000000000e+00, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, 0.5), infsup (-2.5, -1.0)), infsup (2.000000000000000000e+00, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, 0.5), infsup (-inf, -1.0)), infsup (2.000000000000000000e+00, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, 0.5), infsup (-2.5, -2.5)), infsup (5.656854249492379694e+00, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, 0.5), infsup (-inf, -2.5)), infsup (5.656854249492379694e+00, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, 1.0), infsup), infsup));
%!test
%! assert (isequal (pow (infsup (-0.0, 1.0), infsup (0.0, 0.0)), infsup (1.0, 1.0)));
%!test
%! assert (isequal (pow (infsup (-0.0, 1.0), infsup (-0.0, -0.0)), infsup (1.0, 1.0)));
%!test
%! assert (isequal (pow (infsup (-0.0, 1.0), infsup (0.0, 1.0)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (pow (infsup (-0.0, 1.0), infsup (-0.0, 1.0)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (pow (infsup (-0.0, 1.0), infsup (0.0, 2.5)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (pow (infsup (-0.0, 1.0), infsup (-0.0, 2.5)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (pow (infsup (-0.0, 1.0), infsup (0.0, inf)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (pow (infsup (-0.0, 1.0), infsup (-0.0, inf)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (pow (infsup (-0.0, 1.0), infsup (0.1, 0.1)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (pow (infsup (-0.0, 1.0), infsup (0.1, 1.0)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (pow (infsup (-0.0, 1.0), infsup (0.1, 2.5)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (pow (infsup (-0.0, 1.0), infsup (0.1, inf)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (pow (infsup (-0.0, 1.0), infsup (1.0, 1.0)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (pow (infsup (-0.0, 1.0), infsup (1.0, 2.5)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (pow (infsup (-0.0, 1.0), infsup (1.0, inf)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (pow (infsup (-0.0, 1.0), infsup (2.5, 2.5)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (pow (infsup (-0.0, 1.0), infsup (2.5, inf)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (pow (infsup (-0.0, 1.0), infsup (-0.1, 0.1)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, 1.0), infsup (-0.1, 1.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, 1.0), infsup (-0.1, 2.5)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, 1.0), infsup (-0.1, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, 1.0), infsup (-1.0, 0.1)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, 1.0), infsup (-1.0, 1.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, 1.0), infsup (-1.0, 2.5)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, 1.0), infsup (-1.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, 1.0), infsup (-2.5, 0.1)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, 1.0), infsup (-2.5, 1.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, 1.0), infsup (-2.5, 2.5)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, 1.0), infsup (-2.5, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, 1.0), infsup (-inf, 0.1)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, 1.0), infsup (-inf, 1.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, 1.0), infsup (-inf, 2.5)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, 1.0), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, 1.0), infsup (-0.1, 0.0)), infsup (1.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, 1.0), infsup (-0.1, -0.0)), infsup (1.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, 1.0), infsup (-1.0, 0.0)), infsup (1.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, 1.0), infsup (-1.0, -0.0)), infsup (1.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, 1.0), infsup (-2.5, 0.0)), infsup (1.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, 1.0), infsup (-2.5, -0.0)), infsup (1.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, 1.0), infsup (-inf, 0.0)), infsup (1.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, 1.0), infsup (-inf, -0.0)), infsup (1.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, 1.0), infsup (-0.1, -0.1)), infsup (1.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, 1.0), infsup (-1.0, -0.1)), infsup (1.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, 1.0), infsup (-2.5, -0.1)), infsup (1.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, 1.0), infsup (-inf, -0.1)), infsup (1.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, 1.0), infsup (-1.0, -1.0)), infsup (1.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, 1.0), infsup (-2.5, -1.0)), infsup (1.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, 1.0), infsup (-inf, -1.0)), infsup (1.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, 1.0), infsup (-2.5, -2.5)), infsup (1.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, 1.0), infsup (-inf, -2.5)), infsup (1.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, 1.5), infsup), infsup));
%!test
%! assert (isequal (pow (infsup (-0.0, 1.5), infsup (0.0, 0.0)), infsup (1.0, 1.0)));
%!test
%! assert (isequal (pow (infsup (-0.0, 1.5), infsup (-0.0, -0.0)), infsup (1.0, 1.0)));
%!test
%! assert (isequal (pow (infsup (-0.0, 1.5), infsup (0.0, 1.0)), infsup (0.0, 1.5)));
%!test
%! assert (isequal (pow (infsup (-0.0, 1.5), infsup (-0.0, 1.0)), infsup (0.0, 1.5)));
%!test
%! assert (isequal (pow (infsup (-0.0, 1.5), infsup (0.0, 2.5)), infsup (0.0, 2.755675960631075672e+00)));
%!test
%! assert (isequal (pow (infsup (-0.0, 1.5), infsup (-0.0, 2.5)), infsup (0.0, 2.755675960631075672e+00)));
%!test
%! assert (isequal (pow (infsup (-0.0, 1.5), infsup (0.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, 1.5), infsup (-0.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, 1.5), infsup (0.1, 0.1)), infsup (0.0, 1.041379743992410623e+00)));
%!test
%! assert (isequal (pow (infsup (-0.0, 1.5), infsup (0.1, 1.0)), infsup (0.0, 1.5)));
%!test
%! assert (isequal (pow (infsup (-0.0, 1.5), infsup (0.1, 2.5)), infsup (0.0, 2.755675960631075672e+00)));
%!test
%! assert (isequal (pow (infsup (-0.0, 1.5), infsup (0.1, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, 1.5), infsup (1.0, 1.0)), infsup (0.0, 1.5)));
%!test
%! assert (isequal (pow (infsup (-0.0, 1.5), infsup (1.0, 2.5)), infsup (0.0, 2.755675960631075672e+00)));
%!test
%! assert (isequal (pow (infsup (-0.0, 1.5), infsup (1.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, 1.5), infsup (2.5, 2.5)), infsup (0.0, 2.755675960631075672e+00)));
%!test
%! assert (isequal (pow (infsup (-0.0, 1.5), infsup (2.5, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, 1.5), infsup (-0.1, 0.1)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, 1.5), infsup (-0.1, 1.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, 1.5), infsup (-0.1, 2.5)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, 1.5), infsup (-0.1, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, 1.5), infsup (-1.0, 0.1)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, 1.5), infsup (-1.0, 1.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, 1.5), infsup (-1.0, 2.5)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, 1.5), infsup (-1.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, 1.5), infsup (-2.5, 0.1)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, 1.5), infsup (-2.5, 1.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, 1.5), infsup (-2.5, 2.5)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, 1.5), infsup (-2.5, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, 1.5), infsup (-inf, 0.1)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, 1.5), infsup (-inf, 1.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, 1.5), infsup (-inf, 2.5)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, 1.5), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, 1.5), infsup (-1.0, 0.0)), infsup (6.666666666666666297e-01, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, 1.5), infsup (-1.0, -0.0)), infsup (6.666666666666666297e-01, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, 1.5), infsup (-2.5, 0.0)), infsup (3.628873693012115154e-01, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, 1.5), infsup (-2.5, -0.0)), infsup (3.628873693012115154e-01, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, 1.5), infsup (-inf, 0.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, 1.5), infsup (-inf, -0.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, 1.5), infsup (-0.1, -0.1)), infsup (9.602645007922180342e-01, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, 1.5), infsup (-1.0, -0.1)), infsup (6.666666666666666297e-01, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, 1.5), infsup (-2.5, -0.1)), infsup (3.628873693012115154e-01, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, 1.5), infsup (-inf, -0.1)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, 1.5), infsup (-1.0, -1.0)), infsup (6.666666666666666297e-01, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, 1.5), infsup (-2.5, -1.0)), infsup (3.628873693012115154e-01, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, 1.5), infsup (-inf, -1.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, 1.5), infsup (-2.5, -2.5)), infsup (3.628873693012115154e-01, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, 1.5), infsup (-inf, -2.5)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, inf), infsup), infsup));
%!test
%! assert (isequal (pow (infsup (-0.0, inf), infsup (0.0, 0.0)), infsup (1.0, 1.0)));
%!test
%! assert (isequal (pow (infsup (-0.0, inf), infsup (-0.0, -0.0)), infsup (1.0, 1.0)));
%!test
%! assert (isequal (pow (infsup (-0.0, inf), infsup (0.0, 1.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, inf), infsup (-0.0, 1.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, inf), infsup (0.0, 2.5)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, inf), infsup (-0.0, 2.5)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, inf), infsup (0.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, inf), infsup (-0.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, inf), infsup (0.1, 0.1)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, inf), infsup (0.1, 1.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, inf), infsup (0.1, 2.5)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, inf), infsup (0.1, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, inf), infsup (1.0, 1.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, inf), infsup (1.0, 2.5)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, inf), infsup (1.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, inf), infsup (2.5, 2.5)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, inf), infsup (2.5, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, inf), infsup (-0.1, 0.1)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, inf), infsup (-0.1, 1.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, inf), infsup (-0.1, 2.5)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, inf), infsup (-0.1, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, inf), infsup (-1.0, 0.1)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, inf), infsup (-1.0, 1.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, inf), infsup (-1.0, 2.5)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, inf), infsup (-1.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, inf), infsup (-2.5, 0.1)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, inf), infsup (-2.5, 1.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, inf), infsup (-2.5, 2.5)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, inf), infsup (-2.5, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, inf), infsup (-inf, 0.1)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, inf), infsup (-inf, 1.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, inf), infsup (-inf, 2.5)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, inf), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, inf), infsup (-1.0, 0.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, inf), infsup (-1.0, -0.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, inf), infsup (-2.5, 0.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, inf), infsup (-2.5, -0.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, inf), infsup (-inf, 0.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, inf), infsup (-inf, -0.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, inf), infsup (-0.1, -0.1)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, inf), infsup (-1.0, -0.1)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, inf), infsup (-2.5, -0.1)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, inf), infsup (-inf, -0.1)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, inf), infsup (-1.0, -1.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, inf), infsup (-2.5, -1.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, inf), infsup (-inf, -1.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, inf), infsup (-inf, -2.5)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.0, inf), infsup (-2.5, -2.5)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, 0.5), infsup), infsup));
%!test
%! assert (isequal (pow (infsup (-0.1, 0.5), infsup (0.0, 0.0)), infsup (1.0, 1.0)));
%!test
%! assert (isequal (pow (infsup (-0.1, 0.5), infsup (-0.0, -0.0)), infsup (1.0, 1.0)));
%!test
%! assert (isequal (pow (infsup (-0.1, 0.5), infsup (0.0, 1.0)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (pow (infsup (-0.1, 0.5), infsup (-0.0, 1.0)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (pow (infsup (-0.1, 0.5), infsup (0.0, 2.5)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (pow (infsup (-0.1, 0.5), infsup (-0.0, 2.5)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (pow (infsup (-0.1, 0.5), infsup (0.0, inf)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (pow (infsup (-0.1, 0.5), infsup (-0.0, inf)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (pow (infsup (-0.1, 0.5), infsup (0.1, 0.1)), infsup (0.0, 9.330329915368075211e-01)));
%!test
%! assert (isequal (pow (infsup (-0.1, 0.5), infsup (0.1, 1.0)), infsup (0.0, 9.330329915368075211e-01)));
%!test
%! assert (isequal (pow (infsup (-0.1, 0.5), infsup (0.1, 2.5)), infsup (0.0, 9.330329915368075211e-01)));
%!test
%! assert (isequal (pow (infsup (-0.1, 0.5), infsup (0.1, inf)), infsup (0.0, 9.330329915368075211e-01)));
%!test
%! assert (isequal (pow (infsup (-0.1, 0.5), infsup (1.0, 1.0)), infsup (0.0, 0.5)));
%!test
%! assert (isequal (pow (infsup (-0.1, 0.5), infsup (1.0, 2.5)), infsup (0.0, 0.5)));
%!test
%! assert (isequal (pow (infsup (-0.1, 0.5), infsup (1.0, inf)), infsup (0.0, 0.5)));
%!test
%! assert (isequal (pow (infsup (-0.1, 0.5), infsup (2.5, 2.5)), infsup (0.0, 1.767766952966368932e-01)));
%!test
%! assert (isequal (pow (infsup (-0.1, 0.5), infsup (2.5, inf)), infsup (0.0, 1.767766952966368932e-01)));
%!test
%! assert (isequal (pow (infsup (-0.1, 0.5), infsup (-0.1, 0.1)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, 0.5), infsup (-0.1, 1.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, 0.5), infsup (-0.1, 2.5)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, 0.5), infsup (-0.1, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, 0.5), infsup (-1.0, 0.1)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, 0.5), infsup (-1.0, 1.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, 0.5), infsup (-1.0, 2.5)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, 0.5), infsup (-1.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, 0.5), infsup (-2.5, 0.1)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, 0.5), infsup (-2.5, 1.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, 0.5), infsup (-2.5, 2.5)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, 0.5), infsup (-2.5, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, 0.5), infsup (-inf, 0.1)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, 0.5), infsup (-inf, 1.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, 0.5), infsup (-inf, 2.5)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, 0.5), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, 0.5), infsup (-1.0, 0.0)), infsup (1.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, 0.5), infsup (-1.0, -0.0)), infsup (1.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, 0.5), infsup (-2.5, 0.0)), infsup (1.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, 0.5), infsup (-2.5, -0.0)), infsup (1.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, 0.5), infsup (-inf, 0.0)), infsup (1.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, 0.5), infsup (-inf, -0.0)), infsup (1.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, 0.5), infsup (-0.1, -0.1)), infsup (1.071773462536293131e+00, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, 0.5), infsup (-1.0, -0.1)), infsup (1.071773462536293131e+00, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, 0.5), infsup (-2.5, -0.1)), infsup (1.071773462536293131e+00, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, 0.5), infsup (-inf, -0.1)), infsup (1.071773462536293131e+00, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, 0.5), infsup (-1.0, -1.0)), infsup (2.000000000000000000e+00, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, 0.5), infsup (-2.5, -1.0)), infsup (2.000000000000000000e+00, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, 0.5), infsup (-inf, -1.0)), infsup (2.000000000000000000e+00, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, 0.5), infsup (-2.5, -2.5)), infsup (5.656854249492379694e+00, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, 0.5), infsup (-inf, -2.5)), infsup (5.656854249492379694e+00, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, 1.0), infsup), infsup));
%!test
%! assert (isequal (pow (infsup (-0.1, 1.0), infsup (0.0, 0.0)), infsup (1.0, 1.0)));
%!test
%! assert (isequal (pow (infsup (-0.1, 1.0), infsup (-0.0, -0.0)), infsup (1.0, 1.0)));
%!test
%! assert (isequal (pow (infsup (-0.1, 1.0), infsup (0.0, 1.0)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (pow (infsup (-0.1, 1.0), infsup (-0.0, 1.0)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (pow (infsup (-0.1, 1.0), infsup (0.0, 2.5)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (pow (infsup (-0.1, 1.0), infsup (-0.0, 2.5)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (pow (infsup (-0.1, 1.0), infsup (0.0, inf)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (pow (infsup (-0.1, 1.0), infsup (-0.0, inf)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (pow (infsup (-0.1, 1.0), infsup (0.1, 0.1)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (pow (infsup (-0.1, 1.0), infsup (0.1, 1.0)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (pow (infsup (-0.1, 1.0), infsup (0.1, 2.5)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (pow (infsup (-0.1, 1.0), infsup (0.1, inf)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (pow (infsup (-0.1, 1.0), infsup (1.0, 1.0)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (pow (infsup (-0.1, 1.0), infsup (1.0, 2.5)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (pow (infsup (-0.1, 1.0), infsup (1.0, inf)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (pow (infsup (-0.1, 1.0), infsup (2.5, 2.5)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (pow (infsup (-0.1, 1.0), infsup (2.5, inf)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (pow (infsup (-0.1, 1.0), infsup (-0.1, 0.1)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, 1.0), infsup (-0.1, 1.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, 1.0), infsup (-0.1, 2.5)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, 1.0), infsup (-0.1, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, 1.0), infsup (-1.0, 0.1)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, 1.0), infsup (-1.0, 1.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, 1.0), infsup (-1.0, 2.5)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, 1.0), infsup (-1.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, 1.0), infsup (-2.5, 0.1)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, 1.0), infsup (-2.5, 1.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, 1.0), infsup (-2.5, 2.5)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, 1.0), infsup (-2.5, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, 1.0), infsup (-inf, 0.1)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, 1.0), infsup (-inf, 1.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, 1.0), infsup (-inf, 2.5)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, 1.0), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, 1.0), infsup (-0.1, 0.0)), infsup (1.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, 1.0), infsup (-0.1, -0.0)), infsup (1.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, 1.0), infsup (-1.0, 0.0)), infsup (1.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, 1.0), infsup (-1.0, -0.0)), infsup (1.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, 1.0), infsup (-2.5, 0.0)), infsup (1.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, 1.0), infsup (-2.5, -0.0)), infsup (1.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, 1.0), infsup (-inf, 0.0)), infsup (1.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, 1.0), infsup (-inf, -0.0)), infsup (1.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, 1.0), infsup (-0.1, -0.1)), infsup (1.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, 1.0), infsup (-1.0, -0.1)), infsup (1.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, 1.0), infsup (-2.5, -0.1)), infsup (1.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, 1.0), infsup (-inf, -0.1)), infsup (1.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, 1.0), infsup (-1.0, -1.0)), infsup (1.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, 1.0), infsup (-2.5, -1.0)), infsup (1.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, 1.0), infsup (-inf, -1.0)), infsup (1.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, 1.0), infsup (-2.5, -2.5)), infsup (1.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, 1.0), infsup (-inf, -2.5)), infsup (1.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, 1.5), infsup), infsup));
%!test
%! assert (isequal (pow (infsup (-0.1, 1.5), infsup (0.0, 0.0)), infsup (1.0, 1.0)));
%!test
%! assert (isequal (pow (infsup (-0.1, 1.5), infsup (-0.0, -0.0)), infsup (1.0, 1.0)));
%!test
%! assert (isequal (pow (infsup (-0.1, 1.5), infsup (0.0, 1.0)), infsup (0.0, 1.5)));
%!test
%! assert (isequal (pow (infsup (-0.1, 1.5), infsup (-0.0, 1.0)), infsup (0.0, 1.5)));
%!test
%! assert (isequal (pow (infsup (-0.1, 1.5), infsup (0.0, 2.5)), infsup (0.0, 2.755675960631075672e+00)));
%!test
%! assert (isequal (pow (infsup (-0.1, 1.5), infsup (-0.0, 2.5)), infsup (0.0, 2.755675960631075672e+00)));
%!test
%! assert (isequal (pow (infsup (-0.1, 1.5), infsup (0.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, 1.5), infsup (-0.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, 1.5), infsup (0.1, 0.1)), infsup (0.0, 1.041379743992410623e+00)));
%!test
%! assert (isequal (pow (infsup (-0.1, 1.5), infsup (0.1, 1.0)), infsup (0.0, 1.5)));
%!test
%! assert (isequal (pow (infsup (-0.1, 1.5), infsup (0.1, 2.5)), infsup (0.0, 2.755675960631075672e+00)));
%!test
%! assert (isequal (pow (infsup (-0.1, 1.5), infsup (0.1, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, 1.5), infsup (1.0, 1.0)), infsup (0.0, 1.5)));
%!test
%! assert (isequal (pow (infsup (-0.1, 1.5), infsup (1.0, 2.5)), infsup (0.0, 2.755675960631075672e+00)));
%!test
%! assert (isequal (pow (infsup (-0.1, 1.5), infsup (1.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, 1.5), infsup (2.5, 2.5)), infsup (0.0, 2.755675960631075672e+00)));
%!test
%! assert (isequal (pow (infsup (-0.1, 1.5), infsup (2.5, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, 1.5), infsup (-0.1, 0.1)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, 1.5), infsup (-0.1, 1.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, 1.5), infsup (-0.1, 2.5)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, 1.5), infsup (-0.1, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, 1.5), infsup (-1.0, 0.1)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, 1.5), infsup (-1.0, 1.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, 1.5), infsup (-1.0, 2.5)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, 1.5), infsup (-1.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, 1.5), infsup (-2.5, 0.1)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, 1.5), infsup (-2.5, 1.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, 1.5), infsup (-2.5, 2.5)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, 1.5), infsup (-2.5, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, 1.5), infsup (-inf, 0.1)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, 1.5), infsup (-inf, 1.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, 1.5), infsup (-inf, 2.5)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, 1.5), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, 1.5), infsup (-1.0, 0.0)), infsup (6.666666666666666297e-01, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, 1.5), infsup (-1.0, -0.0)), infsup (6.666666666666666297e-01, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, 1.5), infsup (-2.5, 0.0)), infsup (3.628873693012115154e-01, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, 1.5), infsup (-2.5, -0.0)), infsup (3.628873693012115154e-01, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, 1.5), infsup (-inf, 0.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, 1.5), infsup (-inf, -0.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, 1.5), infsup (-0.1, -0.1)), infsup (9.602645007922180342e-01, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, 1.5), infsup (-1.0, -0.1)), infsup (6.666666666666666297e-01, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, 1.5), infsup (-2.5, -0.1)), infsup (3.628873693012115154e-01, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, 1.5), infsup (-inf, -0.1)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, 1.5), infsup (-1.0, -1.0)), infsup (6.666666666666666297e-01, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, 1.5), infsup (-2.5, -1.0)), infsup (3.628873693012115154e-01, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, 1.5), infsup (-inf, -1.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, 1.5), infsup (-2.5, -2.5)), infsup (3.628873693012115154e-01, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, 1.5), infsup (-inf, -2.5)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, inf), infsup), infsup));
%!test
%! assert (isequal (pow (infsup (-0.1, inf), infsup (0.0, 0.0)), infsup (1.0, 1.0)));
%!test
%! assert (isequal (pow (infsup (-0.1, inf), infsup (-0.0, -0.0)), infsup (1.0, 1.0)));
%!test
%! assert (isequal (pow (infsup (-0.1, inf), infsup (0.0, 1.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, inf), infsup (-0.0, 1.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, inf), infsup (0.0, 2.5)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, inf), infsup (-0.0, 2.5)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, inf), infsup (0.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, inf), infsup (-0.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, inf), infsup (0.1, 0.1)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, inf), infsup (0.1, 1.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, inf), infsup (0.1, 2.5)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, inf), infsup (0.1, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, inf), infsup (1.0, 1.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, inf), infsup (1.0, 2.5)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, inf), infsup (1.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, inf), infsup (2.5, 2.5)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, inf), infsup (2.5, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, inf), infsup (-0.1, 0.1)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, inf), infsup (-0.1, 1.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, inf), infsup (-0.1, 2.5)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, inf), infsup (-0.1, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, inf), infsup (-1.0, 0.1)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, inf), infsup (-1.0, 1.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, inf), infsup (-1.0, 2.5)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, inf), infsup (-1.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, inf), infsup (-2.5, 0.1)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, inf), infsup (-2.5, 1.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, inf), infsup (-2.5, 2.5)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, inf), infsup (-2.5, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, inf), infsup (-inf, 0.1)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, inf), infsup (-inf, 1.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, inf), infsup (-inf, 2.5)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, inf), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, inf), infsup (-1.0, 0.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, inf), infsup (-1.0, -0.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, inf), infsup (-2.5, 0.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, inf), infsup (-2.5, -0.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, inf), infsup (-inf, 0.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, inf), infsup (-inf, -0.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, inf), infsup (-0.1, -0.1)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, inf), infsup (-1.0, -0.1)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, inf), infsup (-2.5, -0.1)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, inf), infsup (-inf, -0.1)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, inf), infsup (-1.0, -1.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, inf), infsup (-2.5, -1.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, inf), infsup (-inf, -1.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, inf), infsup (-inf, -2.5)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (-0.1, inf), infsup (-2.5, -2.5)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow (infsup (0.0, 0.0), infsup), infsup));
%!test
%! assert (isequal (pow (infsup (0.0, 0.0), infsup (0.0, 0.0)), infsup));
%!test
%! assert (isequal (pow (infsup (0.0, 0.0), infsup (-0.0, -0.0)), infsup));
%!test
%! assert (isequal (pow (infsup (0.0, 0.0), infsup (0.0, 1.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (0.0, 0.0), infsup (-0.0, 1.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (0.0, 0.0), infsup (0.0, 2.5)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (0.0, 0.0), infsup (-0.0, 2.5)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (0.0, 0.0), infsup (0.0, inf)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (0.0, 0.0), infsup (-0.0, inf)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (0.0, 0.0), infsup (0.1, 0.1)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (0.0, 0.0), infsup (0.1, 1.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (0.0, 0.0), infsup (0.1, 2.5)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (0.0, 0.0), infsup (0.1, inf)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (0.0, 0.0), infsup (1.0, 1.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (0.0, 0.0), infsup (1.0, 2.5)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (0.0, 0.0), infsup (1.0, inf)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (0.0, 0.0), infsup (2.5, 2.5)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (0.0, 0.0), infsup (2.5, inf)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (0.0, 0.0), infsup (-0.1, 0.1)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (0.0, 0.0), infsup (-0.1, 1.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (0.0, 0.0), infsup (-0.1, 2.5)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (0.0, 0.0), infsup (-0.1, inf)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (0.0, 0.0), infsup (-1.0, 0.1)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (0.0, 0.0), infsup (-1.0, 1.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (0.0, 0.0), infsup (-1.0, 2.5)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (0.0, 0.0), infsup (-1.0, inf)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (0.0, 0.0), infsup (-2.5, 0.1)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (0.0, 0.0), infsup (-2.5, 1.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (0.0, 0.0), infsup (-2.5, 2.5)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (0.0, 0.0), infsup (-2.5, inf)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (0.0, 0.0), infsup (-inf, 0.1)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (0.0, 0.0), infsup (-inf, 1.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (0.0, 0.0), infsup (-inf, 2.5)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (0.0, 0.0), infsup (-inf, inf)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (0.0, 0.0), infsup (-1.0, 0.0)), infsup));
%!test
%! assert (isequal (pow (infsup (0.0, 0.0), infsup (-1.0, -0.0)), infsup));
%!test
%! assert (isequal (pow (infsup (0.0, 0.0), infsup (-2.5, 0.0)), infsup));
%!test
%! assert (isequal (pow (infsup (0.0, 0.0), infsup (-2.5, -0.0)), infsup));
%!test
%! assert (isequal (pow (infsup (0.0, 0.0), infsup (-inf, 0.0)), infsup));
%!test
%! assert (isequal (pow (infsup (0.0, 0.0), infsup (-inf, -0.0)), infsup));
%!test
%! assert (isequal (pow (infsup (0.0, 0.0), infsup (-0.1, -0.1)), infsup));
%!test
%! assert (isequal (pow (infsup (0.0, 0.0), infsup (-1.0, -0.1)), infsup));
%!test
%! assert (isequal (pow (infsup (0.0, 0.0), infsup (-2.5, -0.1)), infsup));
%!test
%! assert (isequal (pow (infsup (0.0, 0.0), infsup (-inf, -0.1)), infsup));
%!test
%! assert (isequal (pow (infsup (0.0, 0.0), infsup (-1.0, -1.0)), infsup));
%!test
%! assert (isequal (pow (infsup (0.0, 0.0), infsup (-2.5, -1.0)), infsup));
%!test
%! assert (isequal (pow (infsup (0.0, 0.0), infsup (-inf, -1.0)), infsup));
%!test
%! assert (isequal (pow (infsup (0.0, 0.0), infsup (-inf, -2.5)), infsup));
%!test
%! assert (isequal (pow (infsup (0.0, 0.0), infsup (-2.5, -2.5)), infsup));
%!test
%! assert (isequal (pow (infsup (-0.0, -0.0), infsup), infsup));
%!test
%! assert (isequal (pow (infsup (-0.0, -0.0), infsup (0.0, 0.0)), infsup));
%!test
%! assert (isequal (pow (infsup (-0.0, -0.0), infsup (-0.0, -0.0)), infsup));
%!test
%! assert (isequal (pow (infsup (-0.0, -0.0), infsup (0.0, 1.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-0.0, -0.0), infsup (-0.0, 1.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-0.0, -0.0), infsup (0.0, 2.5)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-0.0, -0.0), infsup (-0.0, 2.5)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-0.0, -0.0), infsup (0.0, inf)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-0.0, -0.0), infsup (-0.0, inf)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-0.0, -0.0), infsup (0.1, 0.1)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-0.0, -0.0), infsup (0.1, 1.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-0.0, -0.0), infsup (0.1, 2.5)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-0.0, -0.0), infsup (0.1, inf)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-0.0, -0.0), infsup (1.0, 1.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-0.0, -0.0), infsup (1.0, 2.5)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-0.0, -0.0), infsup (1.0, inf)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-0.0, -0.0), infsup (2.5, 2.5)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-0.0, -0.0), infsup (2.5, inf)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-0.0, -0.0), infsup (-0.1, 0.1)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-0.0, -0.0), infsup (-0.1, 1.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-0.0, -0.0), infsup (-0.1, 2.5)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-0.0, -0.0), infsup (-0.1, inf)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-0.0, -0.0), infsup (-1.0, 0.1)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-0.0, -0.0), infsup (-1.0, 1.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-0.0, -0.0), infsup (-1.0, 2.5)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-0.0, -0.0), infsup (-1.0, inf)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-0.0, -0.0), infsup (-2.5, 0.1)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-0.0, -0.0), infsup (-2.5, 1.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-0.0, -0.0), infsup (-2.5, 2.5)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-0.0, -0.0), infsup (-2.5, inf)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-0.0, -0.0), infsup (-inf, 0.1)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-0.0, -0.0), infsup (-inf, 1.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-0.0, -0.0), infsup (-inf, 2.5)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-0.0, -0.0), infsup (-inf, inf)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-0.0, -0.0), infsup (-1.0, 0.0)), infsup));
%!test
%! assert (isequal (pow (infsup (-0.0, -0.0), infsup (-1.0, -0.0)), infsup));
%!test
%! assert (isequal (pow (infsup (-0.0, -0.0), infsup (-2.5, 0.0)), infsup));
%!test
%! assert (isequal (pow (infsup (-0.0, -0.0), infsup (-2.5, -0.0)), infsup));
%!test
%! assert (isequal (pow (infsup (-0.0, -0.0), infsup (-inf, 0.0)), infsup));
%!test
%! assert (isequal (pow (infsup (-0.0, -0.0), infsup (-inf, -0.0)), infsup));
%!test
%! assert (isequal (pow (infsup (-0.0, -0.0), infsup (-0.1, -0.1)), infsup));
%!test
%! assert (isequal (pow (infsup (-0.0, -0.0), infsup (-1.0, -0.1)), infsup));
%!test
%! assert (isequal (pow (infsup (-0.0, -0.0), infsup (-2.5, -0.1)), infsup));
%!test
%! assert (isequal (pow (infsup (-0.0, -0.0), infsup (-inf, -0.1)), infsup));
%!test
%! assert (isequal (pow (infsup (-0.0, -0.0), infsup (-1.0, -1.0)), infsup));
%!test
%! assert (isequal (pow (infsup (-0.0, -0.0), infsup (-2.5, -1.0)), infsup));
%!test
%! assert (isequal (pow (infsup (-0.0, -0.0), infsup (-inf, -1.0)), infsup));
%!test
%! assert (isequal (pow (infsup (-0.0, -0.0), infsup (-inf, -2.5)), infsup));
%!test
%! assert (isequal (pow (infsup (-0.0, -0.0), infsup (-2.5, -2.5)), infsup));
%!test
%! assert (isequal (pow (infsup (-0.0, 0.0), infsup), infsup));
%!test
%! assert (isequal (pow (infsup (-0.0, 0.0), infsup (0.0, 0.0)), infsup));
%!test
%! assert (isequal (pow (infsup (-0.0, 0.0), infsup (-0.0, -0.0)), infsup));
%!test
%! assert (isequal (pow (infsup (-0.0, 0.0), infsup (0.0, 1.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-0.0, 0.0), infsup (-0.0, 1.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-0.0, 0.0), infsup (0.0, 2.5)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-0.0, 0.0), infsup (-0.0, 2.5)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-0.0, 0.0), infsup (0.0, inf)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-0.0, 0.0), infsup (-0.0, inf)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-0.0, 0.0), infsup (0.1, 0.1)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-0.0, 0.0), infsup (0.1, 1.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-0.0, 0.0), infsup (0.1, 2.5)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-0.0, 0.0), infsup (0.1, inf)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-0.0, 0.0), infsup (1.0, 1.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-0.0, 0.0), infsup (1.0, 2.5)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-0.0, 0.0), infsup (1.0, inf)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-0.0, 0.0), infsup (2.5, 2.5)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-0.0, 0.0), infsup (2.5, inf)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-0.0, 0.0), infsup (-0.1, 0.1)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-0.0, 0.0), infsup (-0.1, 1.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-0.0, 0.0), infsup (-0.1, 2.5)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-0.0, 0.0), infsup (-0.1, inf)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-0.0, 0.0), infsup (-1.0, 0.1)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-0.0, 0.0), infsup (-1.0, 1.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-0.0, 0.0), infsup (-1.0, 2.5)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-0.0, 0.0), infsup (-1.0, inf)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-0.0, 0.0), infsup (-2.5, 0.1)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-0.0, 0.0), infsup (-2.5, 1.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-0.0, 0.0), infsup (-2.5, 2.5)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-0.0, 0.0), infsup (-2.5, inf)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-0.0, 0.0), infsup (-inf, 0.1)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-0.0, 0.0), infsup (-inf, 1.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-0.0, 0.0), infsup (-inf, 2.5)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-0.0, 0.0), infsup (-inf, inf)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-0.0, 0.0), infsup (-1.0, 0.0)), infsup));
%!test
%! assert (isequal (pow (infsup (-0.0, 0.0), infsup (-1.0, -0.0)), infsup));
%!test
%! assert (isequal (pow (infsup (-0.0, 0.0), infsup (-2.5, 0.0)), infsup));
%!test
%! assert (isequal (pow (infsup (-0.0, 0.0), infsup (-2.5, -0.0)), infsup));
%!test
%! assert (isequal (pow (infsup (-0.0, 0.0), infsup (-inf, 0.0)), infsup));
%!test
%! assert (isequal (pow (infsup (-0.0, 0.0), infsup (-inf, -0.0)), infsup));
%!test
%! assert (isequal (pow (infsup (-0.0, 0.0), infsup (-0.1, -0.1)), infsup));
%!test
%! assert (isequal (pow (infsup (-0.0, 0.0), infsup (-1.0, -0.1)), infsup));
%!test
%! assert (isequal (pow (infsup (-0.0, 0.0), infsup (-2.5, -0.1)), infsup));
%!test
%! assert (isequal (pow (infsup (-0.0, 0.0), infsup (-inf, -0.1)), infsup));
%!test
%! assert (isequal (pow (infsup (-0.0, 0.0), infsup (-1.0, -1.0)), infsup));
%!test
%! assert (isequal (pow (infsup (-0.0, 0.0), infsup (-2.5, -1.0)), infsup));
%!test
%! assert (isequal (pow (infsup (-0.0, 0.0), infsup (-inf, -1.0)), infsup));
%!test
%! assert (isequal (pow (infsup (-0.0, 0.0), infsup (-inf, -2.5)), infsup));
%!test
%! assert (isequal (pow (infsup (-0.0, 0.0), infsup (-2.5, -2.5)), infsup));
%!test
%! assert (isequal (pow (infsup (0.0, -0.0), infsup), infsup));
%!test
%! assert (isequal (pow (infsup (0.0, -0.0), infsup (0.0, 0.0)), infsup));
%!test
%! assert (isequal (pow (infsup (0.0, -0.0), infsup (-0.0, -0.0)), infsup));
%!test
%! assert (isequal (pow (infsup (0.0, -0.0), infsup (0.0, 1.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (0.0, -0.0), infsup (-0.0, 1.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (0.0, -0.0), infsup (0.0, 2.5)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (0.0, -0.0), infsup (-0.0, 2.5)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (0.0, -0.0), infsup (0.0, inf)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (0.0, -0.0), infsup (-0.0, inf)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (0.0, -0.0), infsup (0.1, 0.1)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (0.0, -0.0), infsup (0.1, 1.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (0.0, -0.0), infsup (0.1, 2.5)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (0.0, -0.0), infsup (0.1, inf)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (0.0, -0.0), infsup (1.0, 1.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (0.0, -0.0), infsup (1.0, 2.5)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (0.0, -0.0), infsup (1.0, inf)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (0.0, -0.0), infsup (2.5, 2.5)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (0.0, -0.0), infsup (2.5, inf)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (0.0, -0.0), infsup (-0.1, 0.1)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (0.0, -0.0), infsup (-0.1, 1.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (0.0, -0.0), infsup (-0.1, 2.5)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (0.0, -0.0), infsup (-0.1, inf)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (0.0, -0.0), infsup (-1.0, 0.1)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (0.0, -0.0), infsup (-1.0, 1.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (0.0, -0.0), infsup (-1.0, 2.5)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (0.0, -0.0), infsup (-1.0, inf)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (0.0, -0.0), infsup (-2.5, 0.1)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (0.0, -0.0), infsup (-2.5, 1.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (0.0, -0.0), infsup (-2.5, 2.5)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (0.0, -0.0), infsup (-2.5, inf)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (0.0, -0.0), infsup (-inf, 0.1)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (0.0, -0.0), infsup (-inf, 1.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (0.0, -0.0), infsup (-inf, 2.5)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (0.0, -0.0), infsup (-inf, inf)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (0.0, -0.0), infsup (-1.0, 0.0)), infsup));
%!test
%! assert (isequal (pow (infsup (0.0, -0.0), infsup (-1.0, -0.0)), infsup));
%!test
%! assert (isequal (pow (infsup (0.0, -0.0), infsup (-2.5, 0.0)), infsup));
%!test
%! assert (isequal (pow (infsup (0.0, -0.0), infsup (-2.5, -0.0)), infsup));
%!test
%! assert (isequal (pow (infsup (0.0, -0.0), infsup (-inf, 0.0)), infsup));
%!test
%! assert (isequal (pow (infsup (0.0, -0.0), infsup (-inf, -0.0)), infsup));
%!test
%! assert (isequal (pow (infsup (0.0, -0.0), infsup (-0.1, -0.1)), infsup));
%!test
%! assert (isequal (pow (infsup (0.0, -0.0), infsup (-1.0, -0.1)), infsup));
%!test
%! assert (isequal (pow (infsup (0.0, -0.0), infsup (-2.5, -0.1)), infsup));
%!test
%! assert (isequal (pow (infsup (0.0, -0.0), infsup (-inf, -0.1)), infsup));
%!test
%! assert (isequal (pow (infsup (0.0, -0.0), infsup (-1.0, -1.0)), infsup));
%!test
%! assert (isequal (pow (infsup (0.0, -0.0), infsup (-2.5, -1.0)), infsup));
%!test
%! assert (isequal (pow (infsup (0.0, -0.0), infsup (-inf, -1.0)), infsup));
%!test
%! assert (isequal (pow (infsup (0.0, -0.0), infsup (-inf, -2.5)), infsup));
%!test
%! assert (isequal (pow (infsup (0.0, -0.0), infsup (-2.5, -2.5)), infsup));
%!test
%! assert (isequal (pow (infsup (-1.0, 0.0), infsup), infsup));
%!test
%! assert (isequal (pow (infsup (-1.0, 0.0), infsup (0.0, 0.0)), infsup));
%!test
%! assert (isequal (pow (infsup (-1.0, 0.0), infsup (-0.0, -0.0)), infsup));
%!test
%! assert (isequal (pow (infsup (-1.0, 0.0), infsup (0.0, 1.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-1.0, 0.0), infsup (-0.0, 1.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-1.0, 0.0), infsup (0.0, 2.5)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-1.0, 0.0), infsup (-0.0, 2.5)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-1.0, 0.0), infsup (0.0, inf)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-1.0, 0.0), infsup (-0.0, inf)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-1.0, 0.0), infsup (0.1, 0.1)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-1.0, 0.0), infsup (0.1, 1.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-1.0, 0.0), infsup (0.1, 2.5)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-1.0, 0.0), infsup (0.1, inf)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-1.0, 0.0), infsup (1.0, 1.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-1.0, 0.0), infsup (1.0, 2.5)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-1.0, 0.0), infsup (1.0, inf)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-1.0, 0.0), infsup (2.5, 2.5)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-1.0, 0.0), infsup (2.5, inf)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-1.0, 0.0), infsup (-0.1, 0.1)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-1.0, 0.0), infsup (-0.1, 1.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-1.0, 0.0), infsup (-0.1, 2.5)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-1.0, 0.0), infsup (-0.1, inf)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-1.0, 0.0), infsup (-1.0, 0.1)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-1.0, 0.0), infsup (-1.0, 1.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-1.0, 0.0), infsup (-1.0, 2.5)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-1.0, 0.0), infsup (-1.0, inf)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-1.0, 0.0), infsup (-2.5, 0.1)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-1.0, 0.0), infsup (-2.5, 1.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-1.0, 0.0), infsup (-2.5, 2.5)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-1.0, 0.0), infsup (-2.5, inf)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-1.0, 0.0), infsup (-inf, 0.1)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-1.0, 0.0), infsup (-inf, 1.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-1.0, 0.0), infsup (-inf, 2.5)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-1.0, 0.0), infsup (-inf, inf)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-1.0, 0.0), infsup (-1.0, 0.0)), infsup));
%!test
%! assert (isequal (pow (infsup (-1.0, 0.0), infsup (-1.0, -0.0)), infsup));
%!test
%! assert (isequal (pow (infsup (-1.0, 0.0), infsup (-2.5, 0.0)), infsup));
%!test
%! assert (isequal (pow (infsup (-1.0, 0.0), infsup (-2.5, -0.0)), infsup));
%!test
%! assert (isequal (pow (infsup (-1.0, 0.0), infsup (-inf, 0.0)), infsup));
%!test
%! assert (isequal (pow (infsup (-1.0, 0.0), infsup (-inf, -0.0)), infsup));
%!test
%! assert (isequal (pow (infsup (-1.0, 0.0), infsup (-0.1, -0.1)), infsup));
%!test
%! assert (isequal (pow (infsup (-1.0, 0.0), infsup (-1.0, -0.1)), infsup));
%!test
%! assert (isequal (pow (infsup (-1.0, 0.0), infsup (-2.5, -0.1)), infsup));
%!test
%! assert (isequal (pow (infsup (-1.0, 0.0), infsup (-inf, -0.1)), infsup));
%!test
%! assert (isequal (pow (infsup (-1.0, 0.0), infsup (-1.0, -1.0)), infsup));
%!test
%! assert (isequal (pow (infsup (-1.0, 0.0), infsup (-2.5, -1.0)), infsup));
%!test
%! assert (isequal (pow (infsup (-1.0, 0.0), infsup (-inf, -1.0)), infsup));
%!test
%! assert (isequal (pow (infsup (-1.0, 0.0), infsup (-inf, -2.5)), infsup));
%!test
%! assert (isequal (pow (infsup (-1.0, 0.0), infsup (-2.5, -2.5)), infsup));
%!test
%! assert (isequal (pow (infsup (-1.0, -0.0), infsup), infsup));
%!test
%! assert (isequal (pow (infsup (-1.0, -0.0), infsup (0.0, 0.0)), infsup));
%!test
%! assert (isequal (pow (infsup (-1.0, -0.0), infsup (-0.0, -0.0)), infsup));
%!test
%! assert (isequal (pow (infsup (-1.0, -0.0), infsup (0.0, 1.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-1.0, -0.0), infsup (-0.0, 1.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-1.0, -0.0), infsup (0.0, 2.5)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-1.0, -0.0), infsup (-0.0, 2.5)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-1.0, -0.0), infsup (0.0, inf)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-1.0, -0.0), infsup (-0.0, inf)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-1.0, -0.0), infsup (0.1, 0.1)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-1.0, -0.0), infsup (0.1, 1.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-1.0, -0.0), infsup (0.1, 2.5)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-1.0, -0.0), infsup (0.1, inf)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-1.0, -0.0), infsup (1.0, 1.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-1.0, -0.0), infsup (1.0, 2.5)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-1.0, -0.0), infsup (1.0, inf)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-1.0, -0.0), infsup (2.5, 2.5)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-1.0, -0.0), infsup (2.5, inf)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-1.0, -0.0), infsup (-0.1, 0.1)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-1.0, -0.0), infsup (-0.1, 1.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-1.0, -0.0), infsup (-0.1, 2.5)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-1.0, -0.0), infsup (-0.1, inf)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-1.0, -0.0), infsup (-1.0, 0.1)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-1.0, -0.0), infsup (-1.0, 1.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-1.0, -0.0), infsup (-1.0, 2.5)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-1.0, -0.0), infsup (-1.0, inf)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-1.0, -0.0), infsup (-2.5, 0.1)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-1.0, -0.0), infsup (-2.5, 1.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-1.0, -0.0), infsup (-2.5, 2.5)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-1.0, -0.0), infsup (-2.5, inf)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-1.0, -0.0), infsup (-inf, 0.1)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-1.0, -0.0), infsup (-inf, 1.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-1.0, -0.0), infsup (-inf, 2.5)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-1.0, -0.0), infsup (-inf, inf)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pow (infsup (-1.0, -0.0), infsup (-1.0, 0.0)), infsup));
%!test
%! assert (isequal (pow (infsup (-1.0, -0.0), infsup (-1.0, -0.0)), infsup));
%!test
%! assert (isequal (pow (infsup (-1.0, -0.0), infsup (-2.5, 0.0)), infsup));
%!test
%! assert (isequal (pow (infsup (-1.0, -0.0), infsup (-2.5, -0.0)), infsup));
%!test
%! assert (isequal (pow (infsup (-1.0, -0.0), infsup (-inf, 0.0)), infsup));
%!test
%! assert (isequal (pow (infsup (-1.0, -0.0), infsup (-inf, -0.0)), infsup));
%!test
%! assert (isequal (pow (infsup (-1.0, -0.0), infsup (-0.1, -0.1)), infsup));
%!test
%! assert (isequal (pow (infsup (-1.0, -0.0), infsup (-1.0, -0.1)), infsup));
%!test
%! assert (isequal (pow (infsup (-1.0, -0.0), infsup (-2.5, -0.1)), infsup));
%!test
%! assert (isequal (pow (infsup (-1.0, -0.0), infsup (-inf, -0.1)), infsup));
%!test
%! assert (isequal (pow (infsup (-1.0, -0.0), infsup (-1.0, -1.0)), infsup));
%!test
%! assert (isequal (pow (infsup (-1.0, -0.0), infsup (-2.5, -1.0)), infsup));
%!test
%! assert (isequal (pow (infsup (-1.0, -0.0), infsup (-inf, -1.0)), infsup));
%!test
%! assert (isequal (pow (infsup (-1.0, -0.0), infsup (-inf, -2.5)), infsup));
%!test
%! assert (isequal (pow (infsup (-1.0, -0.0), infsup (-2.5, -2.5)), infsup));
%!test
%! assert (isequal (pow (infsup (-1.0, -0.1), infsup), infsup));
%!test
%! assert (isequal (pow (infsup (-1.0, -0.1), infsup (0.0, 0.0)), infsup));
%!test
%! assert (isequal (pow (infsup (-1.0, -0.1), infsup (-0.0, -0.0)), infsup));
%!test
%! assert (isequal (pow (infsup (-1.0, -0.1), infsup (0.0, 1.0)), infsup));
%!test
%! assert (isequal (pow (infsup (-1.0, -0.1), infsup (-0.0, 1.0)), infsup));
%!test
%! assert (isequal (pow (infsup (-1.0, -0.1), infsup (0.0, 2.5)), infsup));
%!test
%! assert (isequal (pow (infsup (-1.0, -0.1), infsup (-0.0, 2.5)), infsup));
%!test
%! assert (isequal (pow (infsup (-1.0, -0.1), infsup (0.0, inf)), infsup));
%!test
%! assert (isequal (pow (infsup (-1.0, -0.1), infsup (-0.0, inf)), infsup));
%!test
%! assert (isequal (pow (infsup (-1.0, -0.1), infsup (0.1, 0.1)), infsup));
%!test
%! assert (isequal (pow (infsup (-1.0, -0.1), infsup (0.1, 1.0)), infsup));
%!test
%! assert (isequal (pow (infsup (-1.0, -0.1), infsup (0.1, 2.5)), infsup));
%!test
%! assert (isequal (pow (infsup (-1.0, -0.1), infsup (0.1, inf)), infsup));
%!test
%! assert (isequal (pow (infsup (-1.0, -0.1), infsup (1.0, 1.0)), infsup));
%!test
%! assert (isequal (pow (infsup (-1.0, -0.1), infsup (1.0, 2.5)), infsup));
%!test
%! assert (isequal (pow (infsup (-1.0, -0.1), infsup (1.0, inf)), infsup));
%!test
%! assert (isequal (pow (infsup (-1.0, -0.1), infsup (2.5, 2.5)), infsup));
%!test
%! assert (isequal (pow (infsup (-1.0, -0.1), infsup (2.5, inf)), infsup));
%!test
%! assert (isequal (pow (infsup (-1.0, -0.1), infsup (-0.1, 0.1)), infsup));
%!test
%! assert (isequal (pow (infsup (-1.0, -0.1), infsup (-0.1, 1.0)), infsup));
%!test
%! assert (isequal (pow (infsup (-1.0, -0.1), infsup (-0.1, 2.5)), infsup));
%!test
%! assert (isequal (pow (infsup (-1.0, -0.1), infsup (-0.1, inf)), infsup));
%!test
%! assert (isequal (pow (infsup (-1.0, -0.1), infsup (-1.0, 0.1)), infsup));
%!test
%! assert (isequal (pow (infsup (-1.0, -0.1), infsup (-1.0, 1.0)), infsup));
%!test
%! assert (isequal (pow (infsup (-1.0, -0.1), infsup (-1.0, 2.5)), infsup));
%!test
%! assert (isequal (pow (infsup (-1.0, -0.1), infsup (-1.0, inf)), infsup));
%!test
%! assert (isequal (pow (infsup (-1.0, -0.1), infsup (-2.5, 0.1)), infsup));
%!test
%! assert (isequal (pow (infsup (-1.0, -0.1), infsup (-2.5, 1.0)), infsup));
%!test
%! assert (isequal (pow (infsup (-1.0, -0.1), infsup (-2.5, 2.5)), infsup));
%!test
%! assert (isequal (pow (infsup (-1.0, -0.1), infsup (-2.5, inf)), infsup));
%!test
%! assert (isequal (pow (infsup (-1.0, -0.1), infsup (-inf, 0.1)), infsup));
%!test
%! assert (isequal (pow (infsup (-1.0, -0.1), infsup (-inf, 1.0)), infsup));
%!test
%! assert (isequal (pow (infsup (-1.0, -0.1), infsup (-inf, 2.5)), infsup));
%!test
%! assert (isequal (pow (infsup (-1.0, -0.1), infsup (-inf, inf)), infsup));
%!test
%! assert (isequal (pow (infsup (-1.0, -0.1), infsup (-1.0, 0.0)), infsup));
%!test
%! assert (isequal (pow (infsup (-1.0, -0.1), infsup (-1.0, -0.0)), infsup));
%!test
%! assert (isequal (pow (infsup (-1.0, -0.1), infsup (-2.5, 0.0)), infsup));
%!test
%! assert (isequal (pow (infsup (-1.0, -0.1), infsup (-2.5, -0.0)), infsup));
%!test
%! assert (isequal (pow (infsup (-1.0, -0.1), infsup (-inf, 0.0)), infsup));
%!test
%! assert (isequal (pow (infsup (-1.0, -0.1), infsup (-inf, -0.0)), infsup));
%!test
%! assert (isequal (pow (infsup (-1.0, -0.1), infsup (-0.1, -0.1)), infsup));
%!test
%! assert (isequal (pow (infsup (-1.0, -0.1), infsup (-1.0, -0.1)), infsup));
%!test
%! assert (isequal (pow (infsup (-1.0, -0.1), infsup (-2.5, -0.1)), infsup));
%!test
%! assert (isequal (pow (infsup (-1.0, -0.1), infsup (-inf, -0.1)), infsup));
%!test
%! assert (isequal (pow (infsup (-1.0, -0.1), infsup (-1.0, -1.0)), infsup));
%!test
%! assert (isequal (pow (infsup (-1.0, -0.1), infsup (-2.5, -1.0)), infsup));
%!test
%! assert (isequal (pow (infsup (-1.0, -0.1), infsup (-inf, -1.0)), infsup));
%!test
%! assert (isequal (pow (infsup (-1.0, -0.1), infsup (-inf, -2.5)), infsup));
%!test
%! assert (isequal (pow (infsup (-1.0, -0.1), infsup (-2.5, -2.5)), infsup));

## minimal_pow_dec_test

%!test
%! assert (isequal (pow (infsupdec (0.1, 0.5, "com"), infsupdec (0.0, 1.0, "com")), infsupdec (1.000000000000000056e-01, 1.0, "com")));
%! assert (isequal (decorationpart (pow (infsupdec (0.1, 0.5, "com"), infsupdec (0.0, 1.0, "com"))){1}, decorationpart (infsupdec (1.000000000000000056e-01, 1.0, "com")){1}));
%!test
%! assert (isequal (pow (infsupdec (0.1, 0.5, "com"), infsupdec (0.1, 0.1, "def")), infsupdec (7.943282347242814900e-01, 9.330329915368075211e-01, "def")));
%! assert (isequal (decorationpart (pow (infsupdec (0.1, 0.5, "com"), infsupdec (0.1, 0.1, "def"))){1}, decorationpart (infsupdec (7.943282347242814900e-01, 9.330329915368075211e-01, "def")){1}));
%!test
%! assert (isequal (pow (infsupdec (0.1, 0.5, "trv"), infsupdec (-2.5, 2.5, "dac")), infsupdec (3.162277660168379394e-03, 3.162277660168379043e+02, "trv")));
%! assert (isequal (decorationpart (pow (infsupdec (0.1, 0.5, "trv"), infsupdec (-2.5, 2.5, "dac"))){1}, decorationpart (infsupdec (3.162277660168379394e-03, 3.162277660168379043e+02, "trv")){1}));
%!test
%! assert (isequal (pow (infsupdec (0.1, 0.5, "com"), infsupdec (-2.5, inf, "dac")), infsupdec (0.0, 3.162277660168379043e+02, "dac")));
%! assert (isequal (decorationpart (pow (infsupdec (0.1, 0.5, "com"), infsupdec (-2.5, inf, "dac"))){1}, decorationpart (infsupdec (0.0, 3.162277660168379043e+02, "dac")){1}));
%!test
%! assert (isequal (pow (infsupdec (0.1, 0.5, "trv"), infsupdec (-inf, 0.1, "dac")), infsupdec (7.943282347242814900e-01, inf, "trv")));
%! assert (isequal (decorationpart (pow (infsupdec (0.1, 0.5, "trv"), infsupdec (-inf, 0.1, "dac"))){1}, decorationpart (infsupdec (7.943282347242814900e-01, inf, "trv")){1}));
%!test
%! assert (isequal (pow (infsupdec (0.1, 1.0, "com"), infsupdec (0.0, 2.5, "com")), infsupdec (3.162277660168379394e-03, 1.0, "com")));
%! assert (isequal (decorationpart (pow (infsupdec (0.1, 1.0, "com"), infsupdec (0.0, 2.5, "com"))){1}, decorationpart (infsupdec (3.162277660168379394e-03, 1.0, "com")){1}));
%!test
%! assert (isequal (pow (infsupdec (0.1, 1.0, "def"), infsupdec (1.0, 1.0, "dac")), infsupdec (1.000000000000000056e-01, 1.0, "def")));
%! assert (isequal (decorationpart (pow (infsupdec (0.1, 1.0, "def"), infsupdec (1.0, 1.0, "dac"))){1}, decorationpart (infsupdec (1.000000000000000056e-01, 1.0, "def")){1}));
%!test
%! assert (isequal (pow (infsupdec (0.1, 1.0, "trv"), infsupdec (-2.5, 1.0, "def")), infsupdec (1.000000000000000056e-01, 3.162277660168379043e+02, "trv")));
%! assert (isequal (decorationpart (pow (infsupdec (0.1, 1.0, "trv"), infsupdec (-2.5, 1.0, "def"))){1}, decorationpart (infsupdec (1.000000000000000056e-01, 3.162277660168379043e+02, "trv")){1}));
%!test
%! assert (isequal (pow (infsupdec (0.5, 1.5, "dac"), infsupdec (0.1, 0.1, "com")), infsupdec (9.330329915368074101e-01, 1.041379743992410623e+00, "dac")));
%! assert (isequal (decorationpart (pow (infsupdec (0.5, 1.5, "dac"), infsupdec (0.1, 0.1, "com"))){1}, decorationpart (infsupdec (9.330329915368074101e-01, 1.041379743992410623e+00, "dac")){1}));
%!test
%! assert (isequal (pow (infsupdec (0.5, 1.5, "def"), infsupdec (-2.5, 0.1, "trv")), infsupdec (3.628873693012115154e-01, 5.656854249492380582e+00, "trv")));
%! assert (isequal (decorationpart (pow (infsupdec (0.5, 1.5, "def"), infsupdec (-2.5, 0.1, "trv"))){1}, decorationpart (infsupdec (3.628873693012115154e-01, 5.656854249492380582e+00, "trv")){1}));
%!test
%! assert (isequal (pow (infsupdec (0.5, 1.5, "com"), infsupdec (-2.5, -2.5, "com")), infsupdec (3.628873693012115154e-01, 5.656854249492380582e+00, "com")));
%! assert (isequal (decorationpart (pow (infsupdec (0.5, 1.5, "com"), infsupdec (-2.5, -2.5, "com"))){1}, decorationpart (infsupdec (3.628873693012115154e-01, 5.656854249492380582e+00, "com")){1}));
%!test
%! assert (isequal (pow (infsupdec (0.5, inf, "dac"), infsupdec (0.1, 0.1, "com")), infsupdec (9.330329915368074101e-01, inf, "dac")));
%! assert (isequal (decorationpart (pow (infsupdec (0.5, inf, "dac"), infsupdec (0.1, 0.1, "com"))){1}, decorationpart (infsupdec (9.330329915368074101e-01, inf, "dac")){1}));
%!test
%! assert (isequal (pow (infsupdec (0.5, inf, "def"), infsupdec (-2.5, -0.0, "com")), infsupdec (0.0, 5.656854249492380582e+00, "def")));
%! assert (isequal (decorationpart (pow (infsupdec (0.5, inf, "def"), infsupdec (-2.5, -0.0, "com"))){1}, decorationpart (infsupdec (0.0, 5.656854249492380582e+00, "def")){1}));
%!test
%! assert (isequal (pow (infsupdec (1.0, 1.5, "com"), infsupdec (-0.1, 0.1, "def")), infsupdec (9.602645007922180342e-01, 1.041379743992410623e+00, "def")));
%! assert (isequal (decorationpart (pow (infsupdec (1.0, 1.5, "com"), infsupdec (-0.1, 0.1, "def"))){1}, decorationpart (infsupdec (9.602645007922180342e-01, 1.041379743992410623e+00, "def")){1}));
%!test
%! assert (isequal (pow (infsupdec (1.0, 1.5, "trv"), infsupdec (-0.1, -0.1, "com")), infsupdec (9.602645007922180342e-01, 1.0, "trv")));
%! assert (isequal (decorationpart (pow (infsupdec (1.0, 1.5, "trv"), infsupdec (-0.1, -0.1, "com"))){1}, decorationpart (infsupdec (9.602645007922180342e-01, 1.0, "trv")){1}));
%!test
%! assert (isequal (pow (infsupdec (1.0, inf, "dac"), infsupdec (1.0, 1.0, "dac")), infsupdec (1.0, inf, "dac")));
%! assert (isequal (decorationpart (pow (infsupdec (1.0, inf, "dac"), infsupdec (1.0, 1.0, "dac"))){1}, decorationpart (infsupdec (1.0, inf, "dac")){1}));
%!test
%! assert (isequal (pow (infsupdec (1.0, inf, "def"), infsupdec (-1.0, -0.0, "dac")), infsupdec (0.000000000000000000e+00, 1.0, "def")));
%! assert (isequal (decorationpart (pow (infsupdec (1.0, inf, "def"), infsupdec (-1.0, -0.0, "dac"))){1}, decorationpart (infsupdec (0.000000000000000000e+00, 1.0, "def")){1}));
%!test
%! assert (isequal (pow (infsupdec (1.1, 1.5, "def"), infsupdec (1.0, 2.5, "com")), infsupdec (1.100000000000000089e+00, 2.755675960631075672e+00, "def")));
%! assert (isequal (decorationpart (pow (infsupdec (1.1, 1.5, "def"), infsupdec (1.0, 2.5, "com"))){1}, decorationpart (infsupdec (1.100000000000000089e+00, 2.755675960631075672e+00, "def")){1}));
%!test
%! assert (isequal (pow (infsupdec (1.1, 1.5, "com"), infsupdec (-0.1, -0.1, "com")), infsupdec (9.602645007922180342e-01, 9.905142582145218810e-01, "com")));
%! assert (isequal (decorationpart (pow (infsupdec (1.1, 1.5, "com"), infsupdec (-0.1, -0.1, "com"))){1}, decorationpart (infsupdec (9.602645007922180342e-01, 9.905142582145218810e-01, "com")){1}));
%!test
%! assert (isequal (pow (infsupdec (1.1, inf, "dac"), infsupdec (0.1, inf, "dac")), infsupdec (1.009576582776886999e+00, inf, "dac")));
%! assert (isequal (decorationpart (pow (infsupdec (1.1, inf, "dac"), infsupdec (0.1, inf, "dac"))){1}, decorationpart (infsupdec (1.009576582776886999e+00, inf, "dac")){1}));
%!test
%! assert (isequal (pow (infsupdec (1.1, inf, "def"), infsupdec (-2.5, inf, "dac")), infsupdec (0.000000000000000000e+00, inf, "def")));
%! assert (isequal (decorationpart (pow (infsupdec (1.1, inf, "def"), infsupdec (-2.5, inf, "dac"))){1}, decorationpart (infsupdec (0.000000000000000000e+00, inf, "def")){1}));
%!test
%! assert (isequal (pow (infsupdec (1.1, inf, "trv"), infsupdec (-inf, -1.0, "def")), infsupdec (0.000000000000000000e+00, 9.090909090909090606e-01, "trv")));
%! assert (isequal (decorationpart (pow (infsupdec (1.1, inf, "trv"), infsupdec (-inf, -1.0, "def"))){1}, decorationpart (infsupdec (0.000000000000000000e+00, 9.090909090909090606e-01, "trv")){1}));
%!test
%! assert (isequal (pow (infsupdec (0.0, 0.5, "com"), infsupdec (0.1, 0.1, "com")), infsupdec (0.0, 9.330329915368075211e-01, "com")));
%! assert (isequal (decorationpart (pow (infsupdec (0.0, 0.5, "com"), infsupdec (0.1, 0.1, "com"))){1}, decorationpart (infsupdec (0.0, 9.330329915368075211e-01, "com")){1}));
%!test
%! assert (isequal (pow (infsupdec (0.0, 0.5, "com"), infsupdec (2.5, inf, "dac")), infsupdec (0.0, 1.767766952966368932e-01, "dac")));
%! assert (isequal (decorationpart (pow (infsupdec (0.0, 0.5, "com"), infsupdec (2.5, inf, "dac"))){1}, decorationpart (infsupdec (0.0, 1.767766952966368932e-01, "dac")){1}));
%!test
%! assert (isequal (pow (infsupdec (0.0, 0.5, "com"), infsupdec (-inf, -2.5, "dac")), infsupdec (5.656854249492379694e+00, inf, "trv")));
%! assert (isequal (decorationpart (pow (infsupdec (0.0, 0.5, "com"), infsupdec (-inf, -2.5, "dac"))){1}, decorationpart (infsupdec (5.656854249492379694e+00, inf, "trv")){1}));
%!test
%! assert (isequal (pow (infsupdec (0.0, 1.0, "com"), infsupdec (0.0, 0.0, "com")), infsupdec (1.0, 1.0, "trv")));
%! assert (isequal (decorationpart (pow (infsupdec (0.0, 1.0, "com"), infsupdec (0.0, 0.0, "com"))){1}, decorationpart (infsupdec (1.0, 1.0, "trv")){1}));
%!test
%! assert (isequal (pow (infsupdec (0.0, 1.0, "def"), infsupdec (0.0, 2.5, "dac")), infsupdec (0.0, 1.0, "trv")));
%! assert (isequal (decorationpart (pow (infsupdec (0.0, 1.0, "def"), infsupdec (0.0, 2.5, "dac"))){1}, decorationpart (infsupdec (0.0, 1.0, "trv")){1}));
%!test
%! assert (isequal (pow (infsupdec (0.0, 1.0, "dac"), infsupdec (1.0, 2.5, "com")), infsupdec (0.0, 1.0, "dac")));
%! assert (isequal (decorationpart (pow (infsupdec (0.0, 1.0, "dac"), infsupdec (1.0, 2.5, "com"))){1}, decorationpart (infsupdec (0.0, 1.0, "dac")){1}));
%!test
%! assert (isequal (pow (infsupdec (0.0, 1.0, "com"), infsupdec (-2.5, 0.1, "dac")), infsupdec (0.0, inf, "trv")));
%! assert (isequal (decorationpart (pow (infsupdec (0.0, 1.0, "com"), infsupdec (-2.5, 0.1, "dac"))){1}, decorationpart (infsupdec (0.0, inf, "trv")){1}));
%!test
%! assert (isequal (pow (infsupdec (0.0, 1.0, "def"), infsupdec (entire, "def")), infsupdec (0.0, inf, "trv")));
%! assert (isequal (decorationpart (pow (infsupdec (0.0, 1.0, "def"), infsupdec (entire, "def"))){1}, decorationpart (infsupdec (0.0, inf, "trv")){1}));
%!test
%! assert (isequal (pow (infsupdec (0.0, 1.0, "dac"), infsupdec (-0.1, 0.0, "com")), infsupdec (1.0, inf, "trv")));
%! assert (isequal (decorationpart (pow (infsupdec (0.0, 1.0, "dac"), infsupdec (-0.1, 0.0, "com"))){1}, decorationpart (infsupdec (1.0, inf, "trv")){1}));
%!test
%! assert (isequal (pow (infsupdec (0.0, 1.0, "com"), infsupdec (-inf, 0.0, "dac")), infsupdec (1.0, inf, "trv")));
%! assert (isequal (decorationpart (pow (infsupdec (0.0, 1.0, "com"), infsupdec (-inf, 0.0, "dac"))){1}, decorationpart (infsupdec (1.0, inf, "trv")){1}));
%!test
%! assert (isequal (pow (infsupdec (0.0, 1.0, "def"), infsupdec (-inf, -2.5, "dac")), infsupdec (1.0, inf, "trv")));
%! assert (isequal (decorationpart (pow (infsupdec (0.0, 1.0, "def"), infsupdec (-inf, -2.5, "dac"))){1}, decorationpart (infsupdec (1.0, inf, "trv")){1}));
%!test
%! assert (isequal (pow (infsupdec (0.0, 1.5, "com"), infsupdec (0.0, 2.5, "com")), infsupdec (0.0, 2.755675960631075672e+00, "trv")));
%! assert (isequal (decorationpart (pow (infsupdec (0.0, 1.5, "com"), infsupdec (0.0, 2.5, "com"))){1}, decorationpart (infsupdec (0.0, 2.755675960631075672e+00, "trv")){1}));
%!test
%! assert (isequal (pow (infsupdec (0.0, 1.5, "def"), infsupdec (2.5, 2.5, "dac")), infsupdec (0.0, 2.755675960631075672e+00, "def")));
%! assert (isequal (decorationpart (pow (infsupdec (0.0, 1.5, "def"), infsupdec (2.5, 2.5, "dac"))){1}, decorationpart (infsupdec (0.0, 2.755675960631075672e+00, "def")){1}));
%!test
%! assert (isequal (pow (infsupdec (0.0, 1.5, "dac"), infsupdec (-1.0, 0.0, "com")), infsupdec (6.666666666666666297e-01, inf, "trv")));
%! assert (isequal (decorationpart (pow (infsupdec (0.0, 1.5, "dac"), infsupdec (-1.0, 0.0, "com"))){1}, decorationpart (infsupdec (6.666666666666666297e-01, inf, "trv")){1}));
%!test
%! assert (isequal (pow (infsupdec (0.0, 1.5, "com"), infsupdec (-2.5, -2.5, "def")), infsupdec (3.628873693012115154e-01, inf, "trv")));
%! assert (isequal (decorationpart (pow (infsupdec (0.0, 1.5, "com"), infsupdec (-2.5, -2.5, "def"))){1}, decorationpart (infsupdec (3.628873693012115154e-01, inf, "trv")){1}));
%!test
%! assert (isequal (pow (infsupdec (0.0, inf, "dac"), infsupdec (0.1, 0.1, "com")), infsupdec (0.0, inf, "dac")));
%! assert (isequal (decorationpart (pow (infsupdec (0.0, inf, "dac"), infsupdec (0.1, 0.1, "com"))){1}, decorationpart (infsupdec (0.0, inf, "dac")){1}));
%!test
%! assert (isequal (pow (infsupdec (0.0, inf, "def"), infsupdec (-1.0, 1.0, "dac")), infsupdec (0.0, inf, "trv")));
%! assert (isequal (decorationpart (pow (infsupdec (0.0, inf, "def"), infsupdec (-1.0, 1.0, "dac"))){1}, decorationpart (infsupdec (0.0, inf, "trv")){1}));
%!test
%! assert (isequal (pow (infsupdec (0.0, inf, "trv"), infsupdec (-inf, -1.0, "def")), infsupdec (0.0, inf, "trv")));
%! assert (isequal (decorationpart (pow (infsupdec (0.0, inf, "trv"), infsupdec (-inf, -1.0, "def"))){1}, decorationpart (infsupdec (0.0, inf, "trv")){1}));
%!test
%! assert (isequal (pow (infsupdec (0.0, inf, "dac"), infsupdec (-2.5, -2.5, "dac")), infsupdec (0.0, inf, "trv")));
%! assert (isequal (decorationpart (pow (infsupdec (0.0, inf, "dac"), infsupdec (-2.5, -2.5, "dac"))){1}, decorationpart (infsupdec (0.0, inf, "trv")){1}));
%!test
%! assert (isequal (pow (infsupdec (-0.0, 0.5, "com"), infsupdec (0.0, inf, "dac")), infsupdec (0.0, 1.0, "trv")));
%! assert (isequal (decorationpart (pow (infsupdec (-0.0, 0.5, "com"), infsupdec (0.0, inf, "dac"))){1}, decorationpart (infsupdec (0.0, 1.0, "trv")){1}));
%!test
%! assert (isequal (pow (infsupdec (-0.0, 0.5, "def"), infsupdec (0.1, inf, "def")), infsupdec (0.0, 9.330329915368075211e-01, "def")));
%! assert (isequal (decorationpart (pow (infsupdec (-0.0, 0.5, "def"), infsupdec (0.1, inf, "def"))){1}, decorationpart (infsupdec (0.0, 9.330329915368075211e-01, "def")){1}));
%!test
%! assert (isequal (pow (infsupdec (-0.0, 0.5, "dac"), infsupdec (2.5, 2.5, "com")), infsupdec (0.0, 1.767766952966368932e-01, "dac")));
%! assert (isequal (decorationpart (pow (infsupdec (-0.0, 0.5, "dac"), infsupdec (2.5, 2.5, "com"))){1}, decorationpart (infsupdec (0.0, 1.767766952966368932e-01, "dac")){1}));
%!test
%! assert (isequal (pow (infsupdec (-0.0, 0.5, "trv"), infsupdec (-2.5, -0.0, "dac")), infsupdec (1.0, inf, "trv")));
%! assert (isequal (decorationpart (pow (infsupdec (-0.0, 0.5, "trv"), infsupdec (-2.5, -0.0, "dac"))){1}, decorationpart (infsupdec (1.0, inf, "trv")){1}));
%!test
%! assert (isequal (pow (infsupdec (-0.0, 0.5, "com"), infsupdec (-inf, -0.1, "def")), infsupdec (1.071773462536293131e+00, inf, "trv")));
%! assert (isequal (decorationpart (pow (infsupdec (-0.0, 0.5, "com"), infsupdec (-inf, -0.1, "def"))){1}, decorationpart (infsupdec (1.071773462536293131e+00, inf, "trv")){1}));
%!test
%! assert (isequal (pow (infsupdec (-0.0, 0.5, "def"), infsupdec (-inf, -2.5, "dac")), infsupdec (5.656854249492379694e+00, inf, "trv")));
%! assert (isequal (decorationpart (pow (infsupdec (-0.0, 0.5, "def"), infsupdec (-inf, -2.5, "dac"))){1}, decorationpart (infsupdec (5.656854249492379694e+00, inf, "trv")){1}));
%!test
%! assert (isequal (pow (infsupdec (-0.0, 1.0, "com"), infsupdec (2.5, 2.5, "dac")), infsupdec (0.0, 1.0, "dac")));
%! assert (isequal (decorationpart (pow (infsupdec (-0.0, 1.0, "com"), infsupdec (2.5, 2.5, "dac"))){1}, decorationpart (infsupdec (0.0, 1.0, "dac")){1}));
%!test
%! assert (isequal (pow (infsupdec (-0.0, 1.0, "dac"), infsupdec (-1.0, inf, "def")), infsupdec (0.0, inf, "trv")));
%! assert (isequal (decorationpart (pow (infsupdec (-0.0, 1.0, "dac"), infsupdec (-1.0, inf, "def"))){1}, decorationpart (infsupdec (0.0, inf, "trv")){1}));
%!test
%! assert (isequal (pow (infsupdec (-0.0, 1.0, "com"), infsupdec (entire, "def")), infsupdec (0.0, inf, "trv")));
%! assert (isequal (decorationpart (pow (infsupdec (-0.0, 1.0, "com"), infsupdec (entire, "def"))){1}, decorationpart (infsupdec (0.0, inf, "trv")){1}));
%!test
%! assert (isequal (pow (infsupdec (-0.0, 1.0, "def"), infsupdec (-2.5, -2.5, "com")), infsupdec (1.0, inf, "trv")));
%! assert (isequal (decorationpart (pow (infsupdec (-0.0, 1.0, "def"), infsupdec (-2.5, -2.5, "com"))){1}, decorationpart (infsupdec (1.0, inf, "trv")){1}));
%!test
%! assert (isequal (pow (infsupdec (-0.0, 1.0, "dac"), infsupdec (-inf, -2.5, "def")), infsupdec (1.0, inf, "trv")));
%! assert (isequal (decorationpart (pow (infsupdec (-0.0, 1.0, "dac"), infsupdec (-inf, -2.5, "def"))){1}, decorationpart (infsupdec (1.0, inf, "trv")){1}));
%!test
%! assert (isequal (pow (infsupdec (-0.0, 1.5, "com"), infsupdec (0.1, 2.5, "dac")), infsupdec (0.0, 2.755675960631075672e+00, "dac")));
%! assert (isequal (decorationpart (pow (infsupdec (-0.0, 1.5, "com"), infsupdec (0.1, 2.5, "dac"))){1}, decorationpart (infsupdec (0.0, 2.755675960631075672e+00, "dac")){1}));
%!test
%! assert (isequal (pow (infsupdec (-0.0, 1.5, "def"), infsupdec (-1.0, 0.0, "trv")), infsupdec (6.666666666666666297e-01, inf, "trv")));
%! assert (isequal (decorationpart (pow (infsupdec (-0.0, 1.5, "def"), infsupdec (-1.0, 0.0, "trv"))){1}, decorationpart (infsupdec (6.666666666666666297e-01, inf, "trv")){1}));
%!test
%! assert (isequal (pow (infsupdec (-0.0, 1.5, "dac"), infsupdec (-2.5, -0.1, "def")), infsupdec (3.628873693012115154e-01, inf, "trv")));
%! assert (isequal (decorationpart (pow (infsupdec (-0.0, 1.5, "dac"), infsupdec (-2.5, -0.1, "def"))){1}, decorationpart (infsupdec (3.628873693012115154e-01, inf, "trv")){1}));
%!test
%! assert (isequal (pow (infsupdec (-0.0, 1.5, "com"), infsupdec (-2.5, -2.5, "com")), infsupdec (3.628873693012115154e-01, inf, "trv")));
%! assert (isequal (decorationpart (pow (infsupdec (-0.0, 1.5, "com"), infsupdec (-2.5, -2.5, "com"))){1}, decorationpart (infsupdec (3.628873693012115154e-01, inf, "trv")){1}));
%!test
%! assert (isequal (pow (infsupdec (-0.0, 1.5, "def"), infsupdec (-inf, -2.5, "dac")), infsupdec (0.0, inf, "trv")));
%! assert (isequal (decorationpart (pow (infsupdec (-0.0, 1.5, "def"), infsupdec (-inf, -2.5, "dac"))){1}, decorationpart (infsupdec (0.0, inf, "trv")){1}));
%!test
%! assert (isequal (pow (infsupdec (-0.0, inf, "dac"), infsupdec (-0.1, inf, "dac")), infsupdec (0.0, inf, "trv")));
%! assert (isequal (decorationpart (pow (infsupdec (-0.0, inf, "dac"), infsupdec (-0.1, inf, "dac"))){1}, decorationpart (infsupdec (0.0, inf, "trv")){1}));
%!test
%! assert (isequal (pow (infsupdec (-0.0, inf, "def"), infsupdec (-2.5, -0.0, "com")), infsupdec (0.0, inf, "trv")));
%! assert (isequal (decorationpart (pow (infsupdec (-0.0, inf, "def"), infsupdec (-2.5, -0.0, "com"))){1}, decorationpart (infsupdec (0.0, inf, "trv")){1}));
%!test
%! assert (isequal (pow (infsupdec (-0.0, inf, "trv"), infsupdec (-inf, 0.0, "def")), infsupdec (0.0, inf, "trv")));
%! assert (isequal (decorationpart (pow (infsupdec (-0.0, inf, "trv"), infsupdec (-inf, 0.0, "def"))){1}, decorationpart (infsupdec (0.0, inf, "trv")){1}));
%!test
%! assert (isequal (pow (infsupdec (-0.0, inf, "dac"), infsupdec (-inf, -0.0, "trv")), infsupdec (0.0, inf, "trv")));
%! assert (isequal (decorationpart (pow (infsupdec (-0.0, inf, "dac"), infsupdec (-inf, -0.0, "trv"))){1}, decorationpart (infsupdec (0.0, inf, "trv")){1}));
%!test
%! assert (isequal (pow (infsupdec (-0.0, inf, "def"), infsupdec (-inf, -1.0, "def")), infsupdec (0.0, inf, "trv")));
%! assert (isequal (decorationpart (pow (infsupdec (-0.0, inf, "def"), infsupdec (-inf, -1.0, "def"))){1}, decorationpart (infsupdec (0.0, inf, "trv")){1}));
%!test
%! assert (isequal (pow (infsupdec (-0.1, 0.5, "def"), infsupdec (0.1, inf, "dac")), infsupdec (0.0, 9.330329915368075211e-01, "trv")));
%! assert (isequal (decorationpart (pow (infsupdec (-0.1, 0.5, "def"), infsupdec (0.1, inf, "dac"))){1}, decorationpart (infsupdec (0.0, 9.330329915368075211e-01, "trv")){1}));
%!test
%! assert (isequal (pow (infsupdec (-0.1, 0.5, "com"), infsupdec (-0.1, -0.1, "com")), infsupdec (1.071773462536293131e+00, inf, "trv")));
%! assert (isequal (decorationpart (pow (infsupdec (-0.1, 0.5, "com"), infsupdec (-0.1, -0.1, "com"))){1}, decorationpart (infsupdec (1.071773462536293131e+00, inf, "trv")){1}));
%!test
%! assert (isequal (pow (infsupdec (-0.1, 0.5, "dac"), infsupdec (-inf, -2.5, "def")), infsupdec (5.656854249492379694e+00, inf, "trv")));
%! assert (isequal (decorationpart (pow (infsupdec (-0.1, 0.5, "dac"), infsupdec (-inf, -2.5, "def"))){1}, decorationpart (infsupdec (5.656854249492379694e+00, inf, "trv")){1}));
%!test
%! assert (isequal (pow (infsupdec (-0.1, 1.0, "com"), infsupdec (0.0, 0.0, "com")), infsupdec (1.0, 1.0, "trv")));
%! assert (isequal (decorationpart (pow (infsupdec (-0.1, 1.0, "com"), infsupdec (0.0, 0.0, "com"))){1}, decorationpart (infsupdec (1.0, 1.0, "trv")){1}));
%!test
%! assert (isequal (pow (infsupdec (-0.1, 1.0, "dac"), infsupdec (-inf, 2.5, "dac")), infsupdec (0.0, inf, "trv")));
%! assert (isequal (decorationpart (pow (infsupdec (-0.1, 1.0, "dac"), infsupdec (-inf, 2.5, "dac"))){1}, decorationpart (infsupdec (0.0, inf, "trv")){1}));
%!test
%! assert (isequal (pow (infsupdec (-0.1, 1.0, "def"), infsupdec (-inf, -1.0, "def")), infsupdec (1.0, inf, "trv")));
%! assert (isequal (decorationpart (pow (infsupdec (-0.1, 1.0, "def"), infsupdec (-inf, -1.0, "def"))){1}, decorationpart (infsupdec (1.0, inf, "trv")){1}));
%!test
%! assert (isequal (pow (infsupdec (-0.1, 1.0, "com"), infsupdec (-2.5, -2.5, "com")), infsupdec (1.0, inf, "trv")));
%! assert (isequal (decorationpart (pow (infsupdec (-0.1, 1.0, "com"), infsupdec (-2.5, -2.5, "com"))){1}, decorationpart (infsupdec (1.0, inf, "trv")){1}));
%!test
%! assert (isequal (pow (infsupdec (-0.1, 1.0, "trv"), infsupdec (-inf, -2.5, "trv")), infsupdec (1.0, inf, "trv")));
%! assert (isequal (decorationpart (pow (infsupdec (-0.1, 1.0, "trv"), infsupdec (-inf, -2.5, "trv"))){1}, decorationpart (infsupdec (1.0, inf, "trv")){1}));
%!test
%! assert (isequal (pow (infsupdec (-0.1, 1.5, "trv"), infsupdec (0.0, 2.5, "com")), infsupdec (0.0, 2.755675960631075672e+00, "trv")));
%! assert (isequal (decorationpart (pow (infsupdec (-0.1, 1.5, "trv"), infsupdec (0.0, 2.5, "com"))){1}, decorationpart (infsupdec (0.0, 2.755675960631075672e+00, "trv")){1}));
%!test
%! assert (isequal (pow (infsupdec (-0.1, 1.5, "com"), infsupdec (2.5, 2.5, "dac")), infsupdec (0.0, 2.755675960631075672e+00, "trv")));
%! assert (isequal (decorationpart (pow (infsupdec (-0.1, 1.5, "com"), infsupdec (2.5, 2.5, "dac"))){1}, decorationpart (infsupdec (0.0, 2.755675960631075672e+00, "trv")){1}));
%!test
%! assert (isequal (pow (infsupdec (-0.1, 1.5, "dac"), infsupdec (-1.0, 0.0, "trv")), infsupdec (6.666666666666666297e-01, inf, "trv")));
%! assert (isequal (decorationpart (pow (infsupdec (-0.1, 1.5, "dac"), infsupdec (-1.0, 0.0, "trv"))){1}, decorationpart (infsupdec (6.666666666666666297e-01, inf, "trv")){1}));
%!test
%! assert (isequal (pow (infsupdec (-0.1, 1.5, "com"), infsupdec (-0.1, -0.1, "com")), infsupdec (9.602645007922180342e-01, inf, "trv")));
%! assert (isequal (decorationpart (pow (infsupdec (-0.1, 1.5, "com"), infsupdec (-0.1, -0.1, "com"))){1}, decorationpart (infsupdec (9.602645007922180342e-01, inf, "trv")){1}));
%!test
%! assert (isequal (pow (infsupdec (-0.1, 1.5, "def"), infsupdec (-2.5, -2.5, "def")), infsupdec (3.628873693012115154e-01, inf, "trv")));
%! assert (isequal (decorationpart (pow (infsupdec (-0.1, 1.5, "def"), infsupdec (-2.5, -2.5, "def"))){1}, decorationpart (infsupdec (3.628873693012115154e-01, inf, "trv")){1}));
%!test
%! assert (isequal (pow (infsupdec (-0.1, inf, "dac"), infsupdec (-0.1, 2.5, "com")), infsupdec (0.0, inf, "trv")));
%! assert (isequal (decorationpart (pow (infsupdec (-0.1, inf, "dac"), infsupdec (-0.1, 2.5, "com"))){1}, decorationpart (infsupdec (0.0, inf, "trv")){1}));
%!test
%! assert (isequal (pow (infsupdec (-0.1, inf, "def"), infsupdec (-2.5, 0.0, "def")), infsupdec (0.0, inf, "trv")));
%! assert (isequal (decorationpart (pow (infsupdec (-0.1, inf, "def"), infsupdec (-2.5, 0.0, "def"))){1}, decorationpart (infsupdec (0.0, inf, "trv")){1}));
%!test
%! assert (isequal (pow (infsupdec (-0.1, inf, "dac"), infsupdec (-2.5, -2.5, "trv")), infsupdec (0.0, inf, "trv")));
%! assert (isequal (decorationpart (pow (infsupdec (-0.1, inf, "dac"), infsupdec (-2.5, -2.5, "trv"))){1}, decorationpart (infsupdec (0.0, inf, "trv")){1}));
%!test
%! assert (isequal (pow (infsupdec (0.0, 0.0, "com"), infsupdec (1.0, inf, "dac")), infsupdec (0.0, 0.0, "dac")));
%! assert (isequal (decorationpart (pow (infsupdec (0.0, 0.0, "com"), infsupdec (1.0, inf, "dac"))){1}, decorationpart (infsupdec (0.0, 0.0, "dac")){1}));
%!test
%! assert (isequal (pow (infsupdec (0.0, 0.0, "com"), infsupdec (-2.5, 0.1, "com")), infsupdec (0.0, 0.0, "trv")));
%! assert (isequal (decorationpart (pow (infsupdec (0.0, 0.0, "com"), infsupdec (-2.5, 0.1, "com"))){1}, decorationpart (infsupdec (0.0, 0.0, "trv")){1}));
%!test
%! assert (isequal (pow (infsupdec (0.0, 0.0, "dac"), infsupdec (-1.0, 0.0, "def")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (pow (infsupdec (0.0, 0.0, "dac"), infsupdec (-1.0, 0.0, "def"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (pow (infsupdec (-1.0, -0.1, "com"), infsupdec (-0.1, 1.0, "def")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (pow (infsupdec (-1.0, -0.1, "com"), infsupdec (-0.1, 1.0, "def"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (pow (infsupdec (-1.0, -0.1, "dac"), infsupdec (-0.1, 2.5, "com")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (pow (infsupdec (-1.0, -0.1, "dac"), infsupdec (-0.1, 2.5, "com"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (pow (infsupdec (-1.0, -0.1, "def"), infsupdec (-0.1, inf, "trv")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (pow (infsupdec (-1.0, -0.1, "def"), infsupdec (-0.1, inf, "trv"))){1}, decorationpart (infsupdec (empty, "trv")){1}));

## minimal_exp_test

%!test
%! assert (isequal (exp (infsup), infsup));
%!test
%! assert (isequal (exp (infsup (-inf, 0.0)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (exp (infsup (-inf, -0.0)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (exp (infsup (0.0, inf)), infsup (1.0, inf)));
%!test
%! assert (isequal (exp (infsup (-0.0, inf)), infsup (1.0, inf)));
%!test
%! assert (isequal (exp (infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (exp (infsup (-inf, 7.097827128933840868e+02)), infsup (0.0, inf)));
%!test
%! assert (isequal (exp (infsup (7.097827128933840868e+02, 7.097827128933840868e+02)), infsup (1.797693134862315708e+308, inf)));
%!test
%! assert (isequal (exp (infsup (0.0, 7.097827128933822678e+02)), infsup (1.0, 1.797693134859207786e+308)));
%!test
%! assert (isequal (exp (infsup (-0.0, 7.097827128933822678e+02)), infsup (1.0, 1.797693134859207786e+308)));
%!test
%! assert (isequal (exp (infsup (-7.083964185322641924e+02, 7.097827128933822678e+02)), infsup (2.225073858507009192e-308, 1.797693134859207786e+308)));
%!test
%! assert (isequal (exp (infsup (-3.541982092661320962e+02, 7.097827128933822678e+02)), infsup (1.491668146239976927e-154, 1.797693134859207786e+308)));
%!test
%! assert (isequal (exp (infsup (-3.541982092661320962e+02, 0.0)), infsup (1.491668146239976927e-154, 1.0)));
%!test
%! assert (isequal (exp (infsup (-3.541982092661320962e+02, -0.0)), infsup (1.491668146239976927e-154, 1.0)));
%!test
%! assert (isequal (exp (infsup (-3.541982092661320962e+02, 1.0)), infsup (1.491668146239976927e-154, 2.718281828459045535e+00)));
%!test
%! assert (isequal (exp (infsup (1.0, 5.0)), infsup (2.718281828459045091e+00, 1.484131591025766284e+02)));
%!test
%! assert (isequal (exp (infsup (-3.321928094887362626e+00, 1.807354922057604174e+00)), infsup (3.608319282078719520e-02, 6.094306179356355990e+00)));
%!test
%! assert (isequal (exp (infsup (7.655347463629769145e-01, 9.883328352961747498e+01)), infsup (2.150143848892317244e+00, 8.370466551497384459e+42)));
%!test
%! assert (isequal (exp (infsup (1.175028826901562873e+01, 2.599046225837774315e+01)), infsup (1.267901033964801463e+05, 1.938716653660042725e+11)));

## minimal_exp_dec_test

%!test
%! assert (isequal (exp (infsupdec (7.097827128933840868e+02, 7.097827128933840868e+02, "com")), infsupdec (1.797693134862315708e+308, inf, "dac")));
%! assert (isequal (decorationpart (exp (infsupdec (7.097827128933840868e+02, 7.097827128933840868e+02, "com"))){1}, decorationpart (infsupdec (1.797693134862315708e+308, inf, "dac")){1}));
%!test
%! assert (isequal (exp (infsupdec (0.0, 7.097827128933822678e+02, "def")), infsupdec (1.0, 1.797693134859207786e+308, "def")));
%! assert (isequal (decorationpart (exp (infsupdec (0.0, 7.097827128933822678e+02, "def"))){1}, decorationpart (infsupdec (1.0, 1.797693134859207786e+308, "def")){1}));

## minimal_exp2_test

%!test
%! assert (isequal (pow2 (infsup), infsup));
%!test
%! assert (isequal (pow2 (infsup (-inf, 0.0)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (pow2 (infsup (-inf, -0.0)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (pow2 (infsup (0.0, inf)), infsup (1.0, inf)));
%!test
%! assert (isequal (pow2 (infsup (-0.0, inf)), infsup (1.0, inf)));
%!test
%! assert (isequal (pow2 (infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow2 (infsup (-inf, 1024.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow2 (infsup (1024.0, 1024.0)), infsup (1.797693134862315708e+308, inf)));
%!test
%! assert (isequal (pow2 (infsup (0.0, 1023.0)), infsup (1.0, 8.988465674311579539e+307)));
%!test
%! assert (isequal (pow2 (infsup (-0.0, 1023.0)), infsup (1.0, 8.988465674311579539e+307)));
%!test
%! assert (isequal (pow2 (infsup (-1022.0, 1023.0)), infsup (2.225073858507201383e-308, 8.988465674311579539e+307)));
%!test
%! assert (isequal (pow2 (infsup (-1022.0, 0.0)), infsup (2.225073858507201383e-308, 1.0)));
%!test
%! assert (isequal (pow2 (infsup (-1022.0, -0.0)), infsup (2.225073858507201383e-308, 1.0)));
%!test
%! assert (isequal (pow2 (infsup (-1022.0, 1.0)), infsup (2.225073858507201383e-308, 2.0)));
%!test
%! assert (isequal (pow2 (infsup (1.0, 5.0)), infsup (2.0, 32.0)));
%!test
%! assert (isequal (pow2 (infsup (-3.321928094887362626e+00, 1.807354922057604174e+00)), infsup (9.999999999999997780e-02, 3.500000000000000444e+00)));
%!test
%! assert (isequal (pow2 (infsup (7.655347463629769145e-01, 9.883328352961747498e+01)), infsup (1.699999999999999734e+00, 5.646546544444466696e+29)));
%!test
%! assert (isequal (pow2 (infsup (1.175028826901562873e+01, 2.599046225837774315e+01)), infsup (3.445000003400298283e+03, 6.666666666666669399e+07)));

## minimal_exp2_dec_test

%!test
%! assert (isequal (pow2 (infsupdec (1024.0, 1024.0, "com")), infsupdec (1.797693134862315708e+308, inf, "dac")));
%! assert (isequal (decorationpart (pow2 (infsupdec (1024.0, 1024.0, "com"))){1}, decorationpart (infsupdec (1.797693134862315708e+308, inf, "dac")){1}));
%!test
%! assert (isequal (pow2 (infsupdec (7.655347463629769145e-01, 9.883328352961747498e+01, "def")), infsupdec (1.699999999999999734e+00, 5.646546544444466696e+29, "def")));
%! assert (isequal (decorationpart (pow2 (infsupdec (7.655347463629769145e-01, 9.883328352961747498e+01, "def"))){1}, decorationpart (infsupdec (1.699999999999999734e+00, 5.646546544444466696e+29, "def")){1}));

## minimal_exp10_test

%!test
%! assert (isequal (pow10 (infsup), infsup));
%!test
%! assert (isequal (pow10 (infsup (-inf, 0.0)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (pow10 (infsup (-inf, -0.0)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (pow10 (infsup (0.0, inf)), infsup (1.0, inf)));
%!test
%! assert (isequal (pow10 (infsup (-0.0, inf)), infsup (1.0, inf)));
%!test
%! assert (isequal (pow10 (infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow10 (infsup (-inf, 3.082547155599167468e+02)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow10 (infsup (3.082547155599167468e+02, 3.082547155599167468e+02)), infsup (1.797693134862315708e+308, inf)));
%!test
%! assert (isequal (pow10 (infsup (0.0, 3.082547155599166899e+02)), infsup (1.0, 1.797693134862092573e+308)));
%!test
%! assert (isequal (pow10 (infsup (-0.0, 3.082547155599166899e+02)), infsup (1.0, 1.797693134862092573e+308)));
%!test
%! assert (isequal (pow10 (infsup (-3.076526555685887843e+02, 3.082547155599166899e+02)), infsup (2.225073858507187055e-308, 1.797693134862092573e+308)));
%!test
%! assert (isequal (pow10 (infsup (-1.450000000000000000e+02, 3.082547155599166899e+02)), infsup (9.999999999999999149e-146, 1.797693134862092573e+308)));
%!test
%! assert (isequal (pow10 (infsup (-1.450000000000000000e+02, 0.0)), infsup (9.999999999999999149e-146, 1.0)));
%!test
%! assert (isequal (pow10 (infsup (-1.450000000000000000e+02, -0.0)), infsup (9.999999999999999149e-146, 1.0)));
%!test
%! assert (isequal (pow10 (infsup (-1.450000000000000000e+02, 1.0)), infsup (9.999999999999999149e-146, 10.0)));
%!test
%! assert (isequal (pow10 (infsup (1.0, 5.0)), infsup (10.0, 100000.0)));
%!test
%! assert (isequal (pow10 (infsup (-3.321928094887362626e+00, 1.807354922057604174e+00)), infsup (4.765098748902241383e-04, 6.417338117537050834e+01)));
%!test
%! assert (isequal (pow10 (infsup (7.655347463629769145e-01, 9.883328352961747498e+01)), infsup (5.828204023267978151e+00, 6.812139448068793717e+98)));
%!test
%! assert (isequal (pow10 (infsup (1.175028826901562873e+01, 2.599046225837774315e+01)), infsup (5.627147109892520752e+11, 9.782779355126447395e+25)));

## minimal_exp10_dec_test

%!test
%! assert (isequal (pow10 (infsupdec (3.082547155599167468e+02, 3.082547155599167468e+02, "com")), infsupdec (1.797693134862315708e+308, inf, "dac")));
%! assert (isequal (decorationpart (pow10 (infsupdec (3.082547155599167468e+02, 3.082547155599167468e+02, "com"))){1}, decorationpart (infsupdec (1.797693134862315708e+308, inf, "dac")){1}));
%!test
%! assert (isequal (pow10 (infsupdec (7.655347463629769145e-01, 9.883328352961747498e+01, "def")), infsupdec (5.828204023267978151e+00, 6.812139448068793717e+98, "def")));
%! assert (isequal (decorationpart (pow10 (infsupdec (7.655347463629769145e-01, 9.883328352961747498e+01, "def"))){1}, decorationpart (infsupdec (5.828204023267978151e+00, 6.812139448068793717e+98, "def")){1}));

## minimal_log_test

%!test
%! assert (isequal (log (infsup), infsup));
%!test
%! assert (isequal (log (infsup (-inf, 0.0)), infsup));
%!test
%! assert (isequal (log (infsup (-inf, -0.0)), infsup));
%!test
%! assert (isequal (log (infsup (0.0, 1.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (log (infsup (-0.0, 1.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (log (infsup (1.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (log (infsup (0.0, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (log (infsup (-0.0, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (log (infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (log (infsup (0.0, 1.797693134862315708e+308)), infsup (-inf, 7.097827128933840868e+02)));
%!test
%! assert (isequal (log (infsup (-0.0, 1.797693134862315708e+308)), infsup (-inf, 7.097827128933840868e+02)));
%!test
%! assert (isequal (log (infsup (1.0, 1.797693134862315708e+308)), infsup (0.0, 7.097827128933840868e+02)));
%!test
%! assert (isequal (log (infsup (4.940656458412465442e-324, 1.797693134862315708e+308)), infsup (-7.444400719213813318e+02, 7.097827128933840868e+02)));
%!test
%! assert (isequal (log (infsup (4.940656458412465442e-324, 1.0)), infsup (-7.444400719213813318e+02, 0.0)));
%!test
%! assert (isequal (log (infsup (2.718281828459045091e+00, 2.718281828459045091e+00)), infsup (9.999999999999998890e-01, 1.000000000000000000e+00)));
%!test
%! assert (isequal (log (infsup (2.718281828459045535e+00, 2.718281828459045535e+00)), infsup (1.000000000000000000e+00, 1.000000000000000222e+00)));
%!test
%! assert (isequal (log (infsup (4.940656458412465442e-324, 2.718281828459045535e+00)), infsup (-7.444400719213813318e+02, 1.000000000000000222e+00)));
%!test
%! assert (isequal (log (infsup (2.718281828459045091e+00, 32.0)), infsup (9.999999999999998890e-01, 3.465735902799726986e+00)));
%!test
%! assert (isequal (log (infsup (1.000000000000000056e-01, 3.500000000000000000e+00)), infsup (-2.302585092994045901e+00, 1.252762968495368057e+00)));
%!test
%! assert (isequal (log (infsup (1.699999999999999956e+00, 5.646546544444444178e+29)), infsup (5.306282510621702642e-01, 6.850601182403603673e+01)));
%!test
%! assert (isequal (log (infsup (3.445000003400302830e+03, 6.666666666666659713e+07)), infsup (8.144679184434783892e+00, 1.801521563584420349e+01)));

## minimal_log_dec_test

%!test
%! assert (isequal (log (infsupdec (4.940656458412465442e-324, 1.797693134862315708e+308, "com")), infsupdec (-7.444400719213813318e+02, 7.097827128933840868e+02, "com")));
%! assert (isequal (decorationpart (log (infsupdec (4.940656458412465442e-324, 1.797693134862315708e+308, "com"))){1}, decorationpart (infsupdec (-7.444400719213813318e+02, 7.097827128933840868e+02, "com")){1}));
%!test
%! assert (isequal (log (infsupdec (0.0, 1.0, "com")), infsupdec (-inf, 0.0, "trv")));
%! assert (isequal (decorationpart (log (infsupdec (0.0, 1.0, "com"))){1}, decorationpart (infsupdec (-inf, 0.0, "trv")){1}));
%!test
%! assert (isequal (log (infsupdec (2.718281828459045535e+00, 2.718281828459045535e+00, "def")), infsupdec (1.000000000000000000e+00, 1.000000000000000222e+00, "def")));
%! assert (isequal (decorationpart (log (infsupdec (2.718281828459045535e+00, 2.718281828459045535e+00, "def"))){1}, decorationpart (infsupdec (1.000000000000000000e+00, 1.000000000000000222e+00, "def")){1}));

## minimal_log2_test

%!test
%! assert (isequal (log2 (infsup), infsup));
%!test
%! assert (isequal (log2 (infsup (-inf, 0.0)), infsup));
%!test
%! assert (isequal (log2 (infsup (-inf, -0.0)), infsup));
%!test
%! assert (isequal (log2 (infsup (0.0, 1.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (log2 (infsup (-0.0, 1.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (log2 (infsup (1.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (log2 (infsup (0.0, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (log2 (infsup (-0.0, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (log2 (infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (log2 (infsup (0.0, 1.797693134862315708e+308)), infsup (-inf, 1024.0)));
%!test
%! assert (isequal (log2 (infsup (-0.0, 1.797693134862315708e+308)), infsup (-inf, 1024.0)));
%!test
%! assert (isequal (log2 (infsup (1.0, 1.797693134862315708e+308)), infsup (0.0, 1024.0)));
%!test
%! assert (isequal (log2 (infsup (4.940656458412465442e-324, 1.797693134862315708e+308)), infsup (-1074.0, 1024.0)));
%!test
%! assert (isequal (log2 (infsup (4.940656458412465442e-324, 1.0)), infsup (-1074.0, 0.0)));
%!test
%! assert (isequal (log2 (infsup (4.940656458412465442e-324, 2.0)), infsup (-1074.0, 1.0)));
%!test
%! assert (isequal (log2 (infsup (2.0, 32.0)), infsup (1.0, 5.0)));
%!test
%! assert (isequal (log2 (infsup (1.000000000000000056e-01, 3.500000000000000000e+00)), infsup (-3.321928094887362626e+00, 1.807354922057604174e+00)));
%!test
%! assert (isequal (log2 (infsup (1.699999999999999956e+00, 5.646546544444444178e+29)), infsup (7.655347463629769145e-01, 9.883328352961747498e+01)));
%!test
%! assert (isequal (log2 (infsup (3.445000003400302830e+03, 6.666666666666659713e+07)), infsup (1.175028826901562873e+01, 2.599046225837774315e+01)));

## minimal_log2_dec_test

%!test
%! assert (isequal (log2 (infsupdec (4.940656458412465442e-324, 1.797693134862315708e+308, "com")), infsupdec (-1074.0, 1024.0, "com")));
%! assert (isequal (decorationpart (log2 (infsupdec (4.940656458412465442e-324, 1.797693134862315708e+308, "com"))){1}, decorationpart (infsupdec (-1074.0, 1024.0, "com")){1}));
%!test
%! assert (isequal (log2 (infsupdec (4.940656458412465442e-324, inf, "dac")), infsupdec (-1074.0, inf, "dac")));
%! assert (isequal (decorationpart (log2 (infsupdec (4.940656458412465442e-324, inf, "dac"))){1}, decorationpart (infsupdec (-1074.0, inf, "dac")){1}));
%!test
%! assert (isequal (log2 (infsupdec (2.0, 32.0, "def")), infsupdec (1.0, 5.0, "def")));
%! assert (isequal (decorationpart (log2 (infsupdec (2.0, 32.0, "def"))){1}, decorationpart (infsupdec (1.0, 5.0, "def")){1}));
%!test
%! assert (isequal (log2 (infsupdec (0.0, 1.797693134862315708e+308, "com")), infsupdec (-inf, 1024.0, "trv")));
%! assert (isequal (decorationpart (log2 (infsupdec (0.0, 1.797693134862315708e+308, "com"))){1}, decorationpart (infsupdec (-inf, 1024.0, "trv")){1}));

## minimal_log10_test

%!test
%! assert (isequal (log10 (infsup), infsup));
%!test
%! assert (isequal (log10 (infsup (-inf, 0.0)), infsup));
%!test
%! assert (isequal (log10 (infsup (-inf, -0.0)), infsup));
%!test
%! assert (isequal (log10 (infsup (0.0, 1.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (log10 (infsup (-0.0, 1.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (log10 (infsup (1.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (log10 (infsup (0.0, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (log10 (infsup (-0.0, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (log10 (infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (log10 (infsup (0.0, 1.797693134862315708e+308)), infsup (-inf, 3.082547155599167468e+02)));
%!test
%! assert (isequal (log10 (infsup (-0.0, 1.797693134862315708e+308)), infsup (-inf, 3.082547155599167468e+02)));
%!test
%! assert (isequal (log10 (infsup (1.0, 1.797693134862315708e+308)), infsup (0.0, 3.082547155599167468e+02)));
%!test
%! assert (isequal (log10 (infsup (4.940656458412465442e-324, 1.797693134862315708e+308)), infsup (-3.233062153431158094e+02, 3.082547155599167468e+02)));
%!test
%! assert (isequal (log10 (infsup (4.940656458412465442e-324, 1.0)), infsup (-3.233062153431158094e+02, 0.0)));
%!test
%! assert (isequal (log10 (infsup (4.940656458412465442e-324, 10.0)), infsup (-3.233062153431158094e+02, 1.0)));
%!test
%! assert (isequal (log10 (infsup (10.0, 100000.0)), infsup (1.0, 5.0)));
%!test
%! assert (isequal (log10 (infsup (1.000000000000000056e-01, 3.500000000000000000e+00)), infsup (-1.000000000000000000e+00, 5.440680443502756702e-01)));
%!test
%! assert (isequal (log10 (infsup (1.000000000000000056e-01, 1.000000000000000056e-01)), infsup (-1.000000000000000000e+00, -9.999999999999998890e-01)));
%!test
%! assert (isequal (log10 (infsup (1.699999999999999956e+00, 5.646546544444444178e+29)), infsup (2.304489213782739132e-01, 2.975178291237777373e+01)));
%!test
%! assert (isequal (log10 (infsup (3.445000003400302830e+03, 6.666666666666659713e+07)), infsup (3.537189226672304176e+00, 7.823908740944318652e+00)));

## minimal_log10_dec_test

%!test
%! assert (isequal (log10 (infsupdec (4.940656458412465442e-324, 1.797693134862315708e+308, "com")), infsupdec (-3.233062153431158094e+02, 3.082547155599167468e+02, "com")));
%! assert (isequal (decorationpart (log10 (infsupdec (4.940656458412465442e-324, 1.797693134862315708e+308, "com"))){1}, decorationpart (infsupdec (-3.233062153431158094e+02, 3.082547155599167468e+02, "com")){1}));
%!test
%! assert (isequal (log10 (infsupdec (0.0, 1.797693134862315708e+308, "dac")), infsupdec (-inf, 3.082547155599167468e+02, "trv")));
%! assert (isequal (decorationpart (log10 (infsupdec (0.0, 1.797693134862315708e+308, "dac"))){1}, decorationpart (infsupdec (-inf, 3.082547155599167468e+02, "trv")){1}));

## minimal_sin_test

%!test
%! assert (isequal (sin (infsup), infsup));
%!test
%! assert (isequal (sin (infsup (0.0, inf)), infsup (-1.0, 1.0)));
%!test
%! assert (isequal (sin (infsup (-0.0, inf)), infsup (-1.0, 1.0)));
%!test
%! assert (isequal (sin (infsup (-inf, 0.0)), infsup (-1.0, 1.0)));
%!test
%! assert (isequal (sin (infsup (-inf, -0.0)), infsup (-1.0, 1.0)));
%!test
%! assert (isequal (sin (infsup (-inf, inf)), infsup (-1.0, 1.0)));
%!test
%! assert (isequal (sin (infsup (0.0, 0.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (sin (infsup (-0.0, -0.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (sin (infsup (1.570796326794896558e+00, 1.570796326794896558e+00)), infsup (9.999999999999998890e-01, 1.000000000000000000e+00)));
%!test
%! assert (isequal (sin (infsup (1.570796326794896780e+00, 1.570796326794896780e+00)), infsup (9.999999999999998890e-01, 1.000000000000000000e+00)));
%!test
%! assert (isequal (sin (infsup (1.570796326794896558e+00, 1.570796326794896780e+00)), infsup (9.999999999999998890e-01, 1.000000000000000000e+00)));
%!test
%! assert (isequal (sin (infsup (0.0, 1.570796326794896558e+00)), infsup (0.0, 1.000000000000000000e+00)));
%!test
%! assert (isequal (sin (infsup (-0.0, 1.570796326794896558e+00)), infsup (0.0, 1.000000000000000000e+00)));
%!test
%! assert (isequal (sin (infsup (0.0, 1.570796326794896780e+00)), infsup (0.0, 1.000000000000000000e+00)));
%!test
%! assert (isequal (sin (infsup (-0.0, 1.570796326794896780e+00)), infsup (0.0, 1.000000000000000000e+00)));
%!test
%! assert (isequal (sin (infsup (3.141592653589793116e+00, 3.141592653589793116e+00)), infsup (1.224646799147352961e-16, 1.224646799147353207e-16)));
%!test
%! assert (isequal (sin (infsup (3.141592653589793560e+00, 3.141592653589793560e+00)), infsup (-3.216245299353273201e-16, -3.216245299353272708e-16)));
%!test
%! assert (isequal (sin (infsup (3.141592653589793116e+00, 3.141592653589793560e+00)), infsup (-3.216245299353273201e-16, 1.224646799147353207e-16)));
%!test
%! assert (isequal (sin (infsup (0.0, 3.141592653589793116e+00)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (sin (infsup (-0.0, 3.141592653589793116e+00)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (sin (infsup (0.0, 3.141592653589793560e+00)), infsup (-3.216245299353273201e-16, 1.0)));
%!test
%! assert (isequal (sin (infsup (-0.0, 3.141592653589793560e+00)), infsup (-3.216245299353273201e-16, 1.0)));
%!test
%! assert (isequal (sin (infsup (1.570796326794896558e+00, 3.141592653589793116e+00)), infsup (1.224646799147352961e-16, 1.000000000000000000e+00)));
%!test
%! assert (isequal (sin (infsup (1.570796326794896558e+00, 3.141592653589793560e+00)), infsup (-3.216245299353273201e-16, 1.000000000000000000e+00)));
%!test
%! assert (isequal (sin (infsup (1.570796326794896780e+00, 3.141592653589793116e+00)), infsup (1.224646799147352961e-16, 1.000000000000000000e+00)));
%!test
%! assert (isequal (sin (infsup (1.570796326794896780e+00, 3.141592653589793560e+00)), infsup (-3.216245299353273201e-16, 1.000000000000000000e+00)));
%!test
%! assert (isequal (sin (infsup (-1.570796326794896558e+00, -1.570796326794896558e+00)), infsup (-1.000000000000000000e+00, -9.999999999999998890e-01)));
%!test
%! assert (isequal (sin (infsup (-1.570796326794896780e+00, -1.570796326794896780e+00)), infsup (-1.000000000000000000e+00, -9.999999999999998890e-01)));
%!test
%! assert (isequal (sin (infsup (-1.570796326794896780e+00, -1.570796326794896558e+00)), infsup (-1.000000000000000000e+00, -9.999999999999998890e-01)));
%!test
%! assert (isequal (sin (infsup (-1.570796326794896558e+00, 0.0)), infsup (-1.000000000000000000e+00, 0.0)));
%!test
%! assert (isequal (sin (infsup (-1.570796326794896558e+00, -0.0)), infsup (-1.000000000000000000e+00, 0.0)));
%!test
%! assert (isequal (sin (infsup (-1.570796326794896780e+00, 0.0)), infsup (-1.000000000000000000e+00, 0.0)));
%!test
%! assert (isequal (sin (infsup (-1.570796326794896780e+00, -0.0)), infsup (-1.000000000000000000e+00, 0.0)));
%!test
%! assert (isequal (sin (infsup (-3.141592653589793116e+00, -3.141592653589793116e+00)), infsup (-1.224646799147353207e-16, -1.224646799147352961e-16)));
%!test
%! assert (isequal (sin (infsup (-3.141592653589793560e+00, -3.141592653589793560e+00)), infsup (3.216245299353272708e-16, 3.216245299353273201e-16)));
%!test
%! assert (isequal (sin (infsup (-3.141592653589793560e+00, -3.141592653589793116e+00)), infsup (-1.224646799147353207e-16, 3.216245299353273201e-16)));
%!test
%! assert (isequal (sin (infsup (-3.141592653589793116e+00, 0.0)), infsup (-1.0, 0.0)));
%!test
%! assert (isequal (sin (infsup (-3.141592653589793116e+00, -0.0)), infsup (-1.0, 0.0)));
%!test
%! assert (isequal (sin (infsup (-3.141592653589793560e+00, 0.0)), infsup (-1.0, 3.216245299353273201e-16)));
%!test
%! assert (isequal (sin (infsup (-3.141592653589793560e+00, -0.0)), infsup (-1.0, 3.216245299353273201e-16)));
%!test
%! assert (isequal (sin (infsup (-3.141592653589793116e+00, -1.570796326794896558e+00)), infsup (-1.000000000000000000e+00, -1.224646799147352961e-16)));
%!test
%! assert (isequal (sin (infsup (-3.141592653589793560e+00, -1.570796326794896558e+00)), infsup (-1.000000000000000000e+00, 3.216245299353273201e-16)));
%!test
%! assert (isequal (sin (infsup (-3.141592653589793116e+00, -1.570796326794896780e+00)), infsup (-1.000000000000000000e+00, -1.224646799147352961e-16)));
%!test
%! assert (isequal (sin (infsup (-3.141592653589793560e+00, -1.570796326794896780e+00)), infsup (-1.000000000000000000e+00, 3.216245299353273201e-16)));
%!test
%! assert (isequal (sin (infsup (-1.570796326794896558e+00, 1.570796326794896558e+00)), infsup (-1.000000000000000000e+00, 1.000000000000000000e+00)));
%!test
%! assert (isequal (sin (infsup (-1.570796326794896558e+00, 1.570796326794896780e+00)), infsup (-1.000000000000000000e+00, 1.000000000000000000e+00)));
%!test
%! assert (isequal (sin (infsup (-1.570796326794896780e+00, 1.570796326794896558e+00)), infsup (-1.000000000000000000e+00, 1.000000000000000000e+00)));
%!test
%! assert (isequal (sin (infsup (-1.570796326794896780e+00, 1.570796326794896780e+00)), infsup (-1.000000000000000000e+00, 1.000000000000000000e+00)));
%!test
%! assert (isequal (sin (infsup (-0.7, 0.1)), infsup (-6.442176872376911279e-01, 9.983341664682816863e-02)));
%!test
%! assert (isequal (sin (infsup (1.0, 2.0)), infsup (8.414709848078965049e-01, 1.0)));
%!test
%! assert (isequal (sin (infsup (-3.2, -2.9)), infsup (-2.392493292139824257e-01, 5.837414342758009272e-02)));
%!test
%! assert (isequal (sin (infsup (2.0, 3.0)), infsup (1.411200080598672135e-01, 9.092974268256817094e-01)));

## minimal_sin_dec_test

%!test
%! assert (isequal (sin (infsupdec (-3.141592653589793116e+00, -1.570796326794896558e+00, "def")), infsupdec (-1.000000000000000000e+00, -1.224646799147352961e-16, "def")));
%! assert (isequal (decorationpart (sin (infsupdec (-3.141592653589793116e+00, -1.570796326794896558e+00, "def"))){1}, decorationpart (infsupdec (-1.000000000000000000e+00, -1.224646799147352961e-16, "def")){1}));
%!test
%! assert (isequal (sin (infsupdec (-inf, -0.0, "trv")), infsupdec (-1.0, 1.0, "trv")));
%! assert (isequal (decorationpart (sin (infsupdec (-inf, -0.0, "trv"))){1}, decorationpart (infsupdec (-1.0, 1.0, "trv")){1}));
%!test
%! assert (isequal (sin (infsupdec (entire, "def")), infsupdec (-1.0, 1.0, "def")));
%! assert (isequal (decorationpart (sin (infsupdec (entire, "def"))){1}, decorationpart (infsupdec (-1.0, 1.0, "def")){1}));

## minimal_cos_test

%!test
%! assert (isequal (cos (infsup), infsup));
%!test
%! assert (isequal (cos (infsup (0.0, inf)), infsup (-1.0, 1.0)));
%!test
%! assert (isequal (cos (infsup (-0.0, inf)), infsup (-1.0, 1.0)));
%!test
%! assert (isequal (cos (infsup (-inf, 0.0)), infsup (-1.0, 1.0)));
%!test
%! assert (isequal (cos (infsup (-inf, -0.0)), infsup (-1.0, 1.0)));
%!test
%! assert (isequal (cos (infsup (-inf, inf)), infsup (-1.0, 1.0)));
%!test
%! assert (isequal (cos (infsup (0.0, 0.0)), infsup (1.0, 1.0)));
%!test
%! assert (isequal (cos (infsup (-0.0, -0.0)), infsup (1.0, 1.0)));
%!test
%! assert (isequal (cos (infsup (1.570796326794896558e+00, 1.570796326794896558e+00)), infsup (6.123233995736764803e-17, 6.123233995736766036e-17)));
%!test
%! assert (isequal (cos (infsup (1.570796326794896780e+00, 1.570796326794896780e+00)), infsup (-1.608122649676636601e-16, -1.608122649676636354e-16)));
%!test
%! assert (isequal (cos (infsup (1.570796326794896558e+00, 1.570796326794896780e+00)), infsup (-1.608122649676636601e-16, 6.123233995736766036e-17)));
%!test
%! assert (isequal (cos (infsup (0.0, 1.570796326794896558e+00)), infsup (6.123233995736764803e-17, 1.0)));
%!test
%! assert (isequal (cos (infsup (-0.0, 1.570796326794896558e+00)), infsup (6.123233995736764803e-17, 1.0)));
%!test
%! assert (isequal (cos (infsup (0.0, 1.570796326794896780e+00)), infsup (-1.608122649676636601e-16, 1.0)));
%!test
%! assert (isequal (cos (infsup (-0.0, 1.570796326794896780e+00)), infsup (-1.608122649676636601e-16, 1.0)));
%!test
%! assert (isequal (cos (infsup (3.141592653589793116e+00, 3.141592653589793116e+00)), infsup (-1.000000000000000000e+00, -9.999999999999998890e-01)));
%!test
%! assert (isequal (cos (infsup (3.141592653589793560e+00, 3.141592653589793560e+00)), infsup (-1.000000000000000000e+00, -9.999999999999998890e-01)));
%!test
%! assert (isequal (cos (infsup (3.141592653589793116e+00, 3.141592653589793560e+00)), infsup (-1.000000000000000000e+00, -9.999999999999998890e-01)));
%!test
%! assert (isequal (cos (infsup (0.0, 3.141592653589793116e+00)), infsup (-1.0, 1.0)));
%!test
%! assert (isequal (cos (infsup (-0.0, 3.141592653589793116e+00)), infsup (-1.0, 1.0)));
%!test
%! assert (isequal (cos (infsup (0.0, 3.141592653589793560e+00)), infsup (-1.0, 1.0)));
%!test
%! assert (isequal (cos (infsup (-0.0, 3.141592653589793560e+00)), infsup (-1.0, 1.0)));
%!test
%! assert (isequal (cos (infsup (1.570796326794896558e+00, 3.141592653589793116e+00)), infsup (-1.0, 6.123233995736766036e-17)));
%!test
%! assert (isequal (cos (infsup (1.570796326794896558e+00, 3.141592653589793560e+00)), infsup (-1.0, 6.123233995736766036e-17)));
%!test
%! assert (isequal (cos (infsup (1.570796326794896780e+00, 3.141592653589793116e+00)), infsup (-1.0, -1.608122649676636354e-16)));
%!test
%! assert (isequal (cos (infsup (1.570796326794896780e+00, 3.141592653589793560e+00)), infsup (-1.0, -1.608122649676636354e-16)));
%!test
%! assert (isequal (cos (infsup (-1.570796326794896558e+00, -1.570796326794896558e+00)), infsup (6.123233995736764803e-17, 6.123233995736766036e-17)));
%!test
%! assert (isequal (cos (infsup (-1.570796326794896780e+00, -1.570796326794896780e+00)), infsup (-1.608122649676636601e-16, -1.608122649676636354e-16)));
%!test
%! assert (isequal (cos (infsup (-1.570796326794896780e+00, -1.570796326794896558e+00)), infsup (-1.608122649676636601e-16, 6.123233995736766036e-17)));
%!test
%! assert (isequal (cos (infsup (-1.570796326794896558e+00, 0.0)), infsup (6.123233995736764803e-17, 1.0)));
%!test
%! assert (isequal (cos (infsup (-1.570796326794896558e+00, -0.0)), infsup (6.123233995736764803e-17, 1.0)));
%!test
%! assert (isequal (cos (infsup (-1.570796326794896780e+00, 0.0)), infsup (-1.608122649676636601e-16, 1.0)));
%!test
%! assert (isequal (cos (infsup (-1.570796326794896780e+00, -0.0)), infsup (-1.608122649676636601e-16, 1.0)));
%!test
%! assert (isequal (cos (infsup (-3.141592653589793116e+00, -3.141592653589793116e+00)), infsup (-1.000000000000000000e+00, -9.999999999999998890e-01)));
%!test
%! assert (isequal (cos (infsup (-3.141592653589793560e+00, -3.141592653589793560e+00)), infsup (-1.000000000000000000e+00, -9.999999999999998890e-01)));
%!test
%! assert (isequal (cos (infsup (-3.141592653589793560e+00, -3.141592653589793116e+00)), infsup (-1.000000000000000000e+00, -9.999999999999998890e-01)));
%!test
%! assert (isequal (cos (infsup (-3.141592653589793116e+00, 0.0)), infsup (-1.0, 1.0)));
%!test
%! assert (isequal (cos (infsup (-3.141592653589793116e+00, -0.0)), infsup (-1.0, 1.0)));
%!test
%! assert (isequal (cos (infsup (-3.141592653589793560e+00, 0.0)), infsup (-1.0, 1.0)));
%!test
%! assert (isequal (cos (infsup (-3.141592653589793560e+00, -0.0)), infsup (-1.0, 1.0)));
%!test
%! assert (isequal (cos (infsup (-3.141592653589793116e+00, -1.570796326794896558e+00)), infsup (-1.0, 6.123233995736766036e-17)));
%!test
%! assert (isequal (cos (infsup (-3.141592653589793560e+00, -1.570796326794896558e+00)), infsup (-1.0, 6.123233995736766036e-17)));
%!test
%! assert (isequal (cos (infsup (-3.141592653589793116e+00, -1.570796326794896780e+00)), infsup (-1.0, -1.608122649676636354e-16)));
%!test
%! assert (isequal (cos (infsup (-3.141592653589793560e+00, -1.570796326794896780e+00)), infsup (-1.0, -1.608122649676636354e-16)));
%!test
%! assert (isequal (cos (infsup (-1.570796326794896558e+00, 1.570796326794896558e+00)), infsup (6.123233995736764803e-17, 1.0)));
%!test
%! assert (isequal (cos (infsup (-1.570796326794896558e+00, 1.570796326794896780e+00)), infsup (-1.608122649676636601e-16, 1.0)));
%!test
%! assert (isequal (cos (infsup (-1.570796326794896780e+00, 1.570796326794896558e+00)), infsup (-1.608122649676636601e-16, 1.0)));
%!test
%! assert (isequal (cos (infsup (-1.570796326794896780e+00, 1.570796326794896780e+00)), infsup (-1.608122649676636601e-16, 1.0)));
%!test
%! assert (isequal (cos (infsup (-0.7, 0.1)), infsup (7.648421872844883840e-01, 1.0)));
%!test
%! assert (isequal (cos (infsup (1.0, 2.0)), infsup (-4.161468365471424069e-01, 5.403023058681397650e-01)));
%!test
%! assert (isequal (cos (infsup (-3.2, -2.9)), infsup (-1.0, -9.709581651495904353e-01)));
%!test
%! assert (isequal (cos (infsup (2.0, 3.0)), infsup (-9.899924966004455262e-01, -4.161468365471423514e-01)));

## minimal_cos_dec_test

%!test
%! assert (isequal (cos (infsupdec (-1.570796326794896558e+00, -1.570796326794896558e+00, "trv")), infsupdec (6.123233995736764803e-17, 6.123233995736766036e-17, "trv")));
%! assert (isequal (decorationpart (cos (infsupdec (-1.570796326794896558e+00, -1.570796326794896558e+00, "trv"))){1}, decorationpart (infsupdec (6.123233995736764803e-17, 6.123233995736766036e-17, "trv")){1}));
%!test
%! assert (isequal (cos (infsupdec (-inf, -0.0, "def")), infsupdec (-1.0, 1.0, "def")));
%! assert (isequal (decorationpart (cos (infsupdec (-inf, -0.0, "def"))){1}, decorationpart (infsupdec (-1.0, 1.0, "def")){1}));
%!test
%! assert (isequal (cos (infsupdec (entire, "def")), infsupdec (-1.0, 1.0, "def")));
%! assert (isequal (decorationpart (cos (infsupdec (entire, "def"))){1}, decorationpart (infsupdec (-1.0, 1.0, "def")){1}));

## minimal_tan_test

%!test
%! assert (isequal (tan (infsup), infsup));
%!test
%! assert (isequal (tan (infsup (0.0, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (tan (infsup (-0.0, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (tan (infsup (-inf, 0.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (tan (infsup (-inf, -0.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (tan (infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (tan (infsup (0.0, 0.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (tan (infsup (-0.0, -0.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (tan (infsup (1.570796326794896558e+00, 1.570796326794896558e+00)), infsup (1.633123935319536800e+16, 1.633123935319537000e+16)));
%!test
%! assert (isequal (tan (infsup (1.570796326794896780e+00, 1.570796326794896780e+00)), infsup (-6.218431163823739000e+15, -6.218431163823738000e+15)));
%!test
%! assert (isequal (tan (infsup (1.570796326794896558e+00, 1.570796326794896780e+00)), infsup (-inf, inf)));
%!test
%! assert (isequal (tan (infsup (3.141592653589793116e+00, 3.141592653589793116e+00)), infsup (-1.224646799147353207e-16, -1.224646799147352961e-16)));
%!test
%! assert (isequal (tan (infsup (3.141592653589793560e+00, 3.141592653589793560e+00)), infsup (3.216245299353272708e-16, 3.216245299353273201e-16)));
%!test
%! assert (isequal (tan (infsup (0.0, 1.570796326794896558e+00)), infsup (0.0, 1.633123935319537000e+16)));
%!test
%! assert (isequal (tan (infsup (-0.0, 1.570796326794896558e+00)), infsup (0.0, 1.633123935319537000e+16)));
%!test
%! assert (isequal (tan (infsup (0.0, 1.570796326794896780e+00)), infsup (-inf, inf)));
%!test
%! assert (isequal (tan (infsup (-0.0, 1.570796326794896780e+00)), infsup (-inf, inf)));
%!test
%! assert (isequal (tan (infsup (0.0, 3.141592653589793116e+00)), infsup (-inf, inf)));
%!test
%! assert (isequal (tan (infsup (-0.0, 3.141592653589793116e+00)), infsup (-inf, inf)));
%!test
%! assert (isequal (tan (infsup (0.0, 3.141592653589793560e+00)), infsup (-inf, inf)));
%!test
%! assert (isequal (tan (infsup (-0.0, 3.141592653589793560e+00)), infsup (-inf, inf)));
%!test
%! assert (isequal (tan (infsup (4.440892098500626162e-16, 3.141592653589793116e+00)), infsup (-inf, inf)));
%!test
%! assert (isequal (tan (infsup (4.440892098500626162e-16, 3.141592653589793560e+00)), infsup (-inf, inf)));
%!test
%! assert (isequal (tan (infsup (2.220446049250313081e-16, 3.141592653589793116e+00)), infsup (-inf, inf)));
%!test
%! assert (isequal (tan (infsup (2.220446049250313081e-16, 3.141592653589793560e+00)), infsup (-inf, inf)));
%!test
%! assert (isequal (tan (infsup (-1.570796326794896558e+00, 1.570796326794896558e+00)), infsup (-1.633123935319537000e+16, 1.633123935319537000e+16)));
%!test
%! assert (isequal (tan (infsup (-1.570796326794896558e+00, 1.570796326794896780e+00)), infsup (-inf, inf)));
%!test
%! assert (isequal (tan (infsup (-1.570796326794896780e+00, 1.570796326794896558e+00)), infsup (-inf, inf)));
%!test
%! assert (isequal (tan (infsup (-1.570796326794896780e+00, 1.570796326794896780e+00)), infsup (-inf, inf)));
%!test
%! assert (isequal (tan (infsup (-3.333300000000000152e-01, 1.000000000000000056e-01)), infsup (-3.462498165431488473e-01, 1.003346720854505630e-01)));
%!test
%! assert (isequal (tan (infsup (5.345555000000000291e+03, 5.346010000000000218e+03)), infsup (-7.356840852049277402e+00, -1.493205097982578833e+00)));
%!test
%! assert (isequal (tan (infsup (5.345555000000000291e+03, 5.446010000000000218e+03)), infsup (-inf, inf)));
%!test
%! assert (isequal (tan (infsup (9.899999999999999911e-01, 1.010000000000000009e+00)), infsup (1.523676741017902181e+00, 1.592206024219570581e+00)));

## minimal_tan_dec_test

%!test
%! assert (isequal (tan (infsupdec (empty, "trv")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (tan (infsupdec (empty, "trv"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (tan (infsupdec (0.0, inf, "dac")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (tan (infsupdec (0.0, inf, "dac"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%!test
%! assert (isequal (tan (infsupdec (-0.0, inf, "def")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (tan (infsupdec (-0.0, inf, "def"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%!test
%! assert (isequal (tan (infsupdec (-inf, 0.0, "trv")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (tan (infsupdec (-inf, 0.0, "trv"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%!test
%! assert (isequal (tan (infsupdec (-inf, -0.0, "dac")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (tan (infsupdec (-inf, -0.0, "dac"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%!test
%! assert (isequal (tan (infsupdec (entire, "def")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (tan (infsupdec (entire, "def"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%!test
%! assert (isequal (tan (infsupdec (0.0, 0.0, "com")), infsupdec (0.0, 0.0, "com")));
%! assert (isequal (decorationpart (tan (infsupdec (0.0, 0.0, "com"))){1}, decorationpart (infsupdec (0.0, 0.0, "com")){1}));
%!test
%! assert (isequal (tan (infsupdec (-0.0, -0.0, "def")), infsupdec (0.0, 0.0, "def")));
%! assert (isequal (decorationpart (tan (infsupdec (-0.0, -0.0, "def"))){1}, decorationpart (infsupdec (0.0, 0.0, "def")){1}));
%!test
%! assert (isequal (tan (infsupdec (1.570796326794896558e+00, 1.570796326794896558e+00, "com")), infsupdec (1.633123935319536800e+16, 1.633123935319537000e+16, "com")));
%! assert (isequal (decorationpart (tan (infsupdec (1.570796326794896558e+00, 1.570796326794896558e+00, "com"))){1}, decorationpart (infsupdec (1.633123935319536800e+16, 1.633123935319537000e+16, "com")){1}));
%!test
%! assert (isequal (tan (infsupdec (1.570796326794896780e+00, 1.570796326794896780e+00, "def")), infsupdec (-6.218431163823739000e+15, -6.218431163823738000e+15, "def")));
%! assert (isequal (decorationpart (tan (infsupdec (1.570796326794896780e+00, 1.570796326794896780e+00, "def"))){1}, decorationpart (infsupdec (-6.218431163823739000e+15, -6.218431163823738000e+15, "def")){1}));
%!test
%! assert (isequal (tan (infsupdec (1.570796326794896558e+00, 1.570796326794896780e+00, "dac")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (tan (infsupdec (1.570796326794896558e+00, 1.570796326794896780e+00, "dac"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%!test
%! assert (isequal (tan (infsupdec (3.141592653589793116e+00, 3.141592653589793116e+00, "trv")), infsupdec (-1.224646799147353207e-16, -1.224646799147352961e-16, "trv")));
%! assert (isequal (decorationpart (tan (infsupdec (3.141592653589793116e+00, 3.141592653589793116e+00, "trv"))){1}, decorationpart (infsupdec (-1.224646799147353207e-16, -1.224646799147352961e-16, "trv")){1}));
%!test
%! assert (isequal (tan (infsupdec (3.141592653589793560e+00, 3.141592653589793560e+00, "com")), infsupdec (3.216245299353272708e-16, 3.216245299353273201e-16, "com")));
%! assert (isequal (decorationpart (tan (infsupdec (3.141592653589793560e+00, 3.141592653589793560e+00, "com"))){1}, decorationpart (infsupdec (3.216245299353272708e-16, 3.216245299353273201e-16, "com")){1}));
%!test
%! assert (isequal (tan (infsupdec (0.0, 1.570796326794896558e+00, "dac")), infsupdec (0.0, 1.633123935319537000e+16, "dac")));
%! assert (isequal (decorationpart (tan (infsupdec (0.0, 1.570796326794896558e+00, "dac"))){1}, decorationpart (infsupdec (0.0, 1.633123935319537000e+16, "dac")){1}));
%!test
%! assert (isequal (tan (infsupdec (-0.0, 1.570796326794896558e+00, "com")), infsupdec (0.0, 1.633123935319537000e+16, "com")));
%! assert (isequal (decorationpart (tan (infsupdec (-0.0, 1.570796326794896558e+00, "com"))){1}, decorationpart (infsupdec (0.0, 1.633123935319537000e+16, "com")){1}));
%!test
%! assert (isequal (tan (infsupdec (0.0, 1.570796326794896780e+00, "trv")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (tan (infsupdec (0.0, 1.570796326794896780e+00, "trv"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%!test
%! assert (isequal (tan (infsupdec (-0.0, 1.570796326794896780e+00, "def")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (tan (infsupdec (-0.0, 1.570796326794896780e+00, "def"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%!test
%! assert (isequal (tan (infsupdec (0.0, 3.141592653589793116e+00, "dac")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (tan (infsupdec (0.0, 3.141592653589793116e+00, "dac"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%!test
%! assert (isequal (tan (infsupdec (-0.0, 3.141592653589793116e+00, "com")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (tan (infsupdec (-0.0, 3.141592653589793116e+00, "com"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%!test
%! assert (isequal (tan (infsupdec (0.0, 3.141592653589793560e+00, "trv")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (tan (infsupdec (0.0, 3.141592653589793560e+00, "trv"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%!test
%! assert (isequal (tan (infsupdec (-0.0, 3.141592653589793560e+00, "def")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (tan (infsupdec (-0.0, 3.141592653589793560e+00, "def"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%!test
%! assert (isequal (tan (infsupdec (4.440892098500626162e-16, 3.141592653589793116e+00, "dac")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (tan (infsupdec (4.440892098500626162e-16, 3.141592653589793116e+00, "dac"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%!test
%! assert (isequal (tan (infsupdec (4.440892098500626162e-16, 3.141592653589793560e+00, "com")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (tan (infsupdec (4.440892098500626162e-16, 3.141592653589793560e+00, "com"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%!test
%! assert (isequal (tan (infsupdec (2.220446049250313081e-16, 3.141592653589793116e+00, "trv")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (tan (infsupdec (2.220446049250313081e-16, 3.141592653589793116e+00, "trv"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%!test
%! assert (isequal (tan (infsupdec (2.220446049250313081e-16, 3.141592653589793560e+00, "def")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (tan (infsupdec (2.220446049250313081e-16, 3.141592653589793560e+00, "def"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%!test
%! assert (isequal (tan (infsupdec (-1.570796326794896558e+00, 1.570796326794896558e+00, "com")), infsupdec (-1.633123935319537000e+16, 1.633123935319537000e+16, "com")));
%! assert (isequal (decorationpart (tan (infsupdec (-1.570796326794896558e+00, 1.570796326794896558e+00, "com"))){1}, decorationpart (infsupdec (-1.633123935319537000e+16, 1.633123935319537000e+16, "com")){1}));
%!test
%! assert (isequal (tan (infsupdec (-1.570796326794896558e+00, 1.570796326794896780e+00, "trv")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (tan (infsupdec (-1.570796326794896558e+00, 1.570796326794896780e+00, "trv"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%!test
%! assert (isequal (tan (infsupdec (-1.570796326794896780e+00, 1.570796326794896558e+00, "def")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (tan (infsupdec (-1.570796326794896780e+00, 1.570796326794896558e+00, "def"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%!test
%! assert (isequal (tan (infsupdec (-1.570796326794896780e+00, 1.570796326794896780e+00, "dac")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (tan (infsupdec (-1.570796326794896780e+00, 1.570796326794896780e+00, "dac"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%!test
%! assert (isequal (tan (infsupdec (-3.333300000000000152e-01, 1.000000000000000056e-01, "com")), infsupdec (-3.462498165431488473e-01, 1.003346720854505630e-01, "com")));
%! assert (isequal (decorationpart (tan (infsupdec (-3.333300000000000152e-01, 1.000000000000000056e-01, "com"))){1}, decorationpart (infsupdec (-3.462498165431488473e-01, 1.003346720854505630e-01, "com")){1}));
%!test
%! assert (isequal (tan (infsupdec (5.345555000000000291e+03, 5.346010000000000218e+03, "dac")), infsupdec (-7.356840852049277402e+00, -1.493205097982578833e+00, "dac")));
%! assert (isequal (decorationpart (tan (infsupdec (5.345555000000000291e+03, 5.346010000000000218e+03, "dac"))){1}, decorationpart (infsupdec (-7.356840852049277402e+00, -1.493205097982578833e+00, "dac")){1}));
%!test
%! assert (isequal (tan (infsupdec (5.345555000000000291e+03, 5.446010000000000218e+03, "def")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (tan (infsupdec (5.345555000000000291e+03, 5.446010000000000218e+03, "def"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%!test
%! assert (isequal (tan (infsupdec (9.899999999999999911e-01, 1.010000000000000009e+00, "trv")), infsupdec (1.523676741017902181e+00, 1.592206024219570581e+00, "trv")));
%! assert (isequal (decorationpart (tan (infsupdec (9.899999999999999911e-01, 1.010000000000000009e+00, "trv"))){1}, decorationpart (infsupdec (1.523676741017902181e+00, 1.592206024219570581e+00, "trv")){1}));

## minimal_asin_test

%!test
%! assert (isequal (asin (infsup), infsup));
%!test
%! assert (isequal (asin (infsup (0.0, inf)), infsup (0.0, 1.570796326794896780e+00)));
%!test
%! assert (isequal (asin (infsup (-0.0, inf)), infsup (0.0, 1.570796326794896780e+00)));
%!test
%! assert (isequal (asin (infsup (-inf, 0.0)), infsup (-1.570796326794896780e+00, 0.0)));
%!test
%! assert (isequal (asin (infsup (-inf, -0.0)), infsup (-1.570796326794896780e+00, 0.0)));
%!test
%! assert (isequal (asin (infsup (-inf, inf)), infsup (-1.570796326794896780e+00, 1.570796326794896780e+00)));
%!test
%! assert (isequal (asin (infsup (-1.0, 1.0)), infsup (-1.570796326794896780e+00, 1.570796326794896780e+00)));
%!test
%! assert (isequal (asin (infsup (-inf, -1.0)), infsup (-1.570796326794896780e+00, -1.570796326794896558e+00)));
%!test
%! assert (isequal (asin (infsup (1.0, inf)), infsup (1.570796326794896558e+00, 1.570796326794896780e+00)));
%!test
%! assert (isequal (asin (infsup (-1.0, -1.0)), infsup (-1.570796326794896780e+00, -1.570796326794896558e+00)));
%!test
%! assert (isequal (asin (infsup (1.0, 1.0)), infsup (1.570796326794896558e+00, 1.570796326794896780e+00)));
%!test
%! assert (isequal (asin (infsup (0.0, 0.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (asin (infsup (-0.0, -0.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (asin (infsup (-inf, -1.000000000000000222e+00)), infsup));
%!test
%! assert (isequal (asin (infsup (1.000000000000000222e+00, inf)), infsup));
%!test
%! assert (isequal (asin (infsup (-1.000000000000000056e-01, 1.000000000000000056e-01)), infsup (-1.001674211615598137e-01, 1.001674211615598137e-01)));
%!test
%! assert (isequal (asin (infsup (-3.300000000000000155e-01, 9.999999999999998890e-01)), infsup (-3.363035751539804052e-01, 1.570796311893735586e+00)));
%!test
%! assert (isequal (asin (infsup (-9.999999999999998890e-01, 9.999999999999998890e-01)), infsup (-1.570796311893735586e+00, 1.570796311893735586e+00)));

## minimal_asin_dec_test

%!test
%! assert (isequal (asin (infsupdec (0.0, inf, "dac")), infsupdec (0.0, 1.570796326794896780e+00, "trv")));
%! assert (isequal (decorationpart (asin (infsupdec (0.0, inf, "dac"))){1}, decorationpart (infsupdec (0.0, 1.570796326794896780e+00, "trv")){1}));
%!test
%! assert (isequal (asin (infsupdec (-inf, 0.0, "def")), infsupdec (-1.570796326794896780e+00, 0.0, "trv")));
%! assert (isequal (decorationpart (asin (infsupdec (-inf, 0.0, "def"))){1}, decorationpart (infsupdec (-1.570796326794896780e+00, 0.0, "trv")){1}));
%!test
%! assert (isequal (asin (infsupdec (-1.0, 1.0, "com")), infsupdec (-1.570796326794896780e+00, 1.570796326794896780e+00, "com")));
%! assert (isequal (decorationpart (asin (infsupdec (-1.0, 1.0, "com"))){1}, decorationpart (infsupdec (-1.570796326794896780e+00, 1.570796326794896780e+00, "com")){1}));
%!test
%! assert (isequal (asin (infsupdec (entire, "def")), infsupdec (-1.570796326794896780e+00, 1.570796326794896780e+00, "trv")));
%! assert (isequal (decorationpart (asin (infsupdec (entire, "def"))){1}, decorationpart (infsupdec (-1.570796326794896780e+00, 1.570796326794896780e+00, "trv")){1}));
%!test
%! assert (isequal (asin (infsupdec (-3.300000000000000155e-01, 9.999999999999998890e-01, "def")), infsupdec (-3.363035751539804052e-01, 1.570796311893735586e+00, "def")));
%! assert (isequal (decorationpart (asin (infsupdec (-3.300000000000000155e-01, 9.999999999999998890e-01, "def"))){1}, decorationpart (infsupdec (-3.363035751539804052e-01, 1.570796311893735586e+00, "def")){1}));

## minimal_acos_test

%!test
%! assert (isequal (acos (infsup), infsup));
%!test
%! assert (isequal (acos (infsup (0.0, inf)), infsup (0.0, 1.570796326794896780e+00)));
%!test
%! assert (isequal (acos (infsup (-0.0, inf)), infsup (0.0, 1.570796326794896780e+00)));
%!test
%! assert (isequal (acos (infsup (-inf, 0.0)), infsup (1.570796326794896558e+00, 3.141592653589793560e+00)));
%!test
%! assert (isequal (acos (infsup (-inf, -0.0)), infsup (1.570796326794896558e+00, 3.141592653589793560e+00)));
%!test
%! assert (isequal (acos (infsup (-inf, inf)), infsup (0.0, 3.141592653589793560e+00)));
%!test
%! assert (isequal (acos (infsup (-1.0, 1.0)), infsup (0.0, 3.141592653589793560e+00)));
%!test
%! assert (isequal (acos (infsup (-inf, -1.0)), infsup (3.141592653589793116e+00, 3.141592653589793560e+00)));
%!test
%! assert (isequal (acos (infsup (1.0, inf)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (acos (infsup (-1.0, -1.0)), infsup (3.141592653589793116e+00, 3.141592653589793560e+00)));
%!test
%! assert (isequal (acos (infsup (1.0, 1.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (acos (infsup (0.0, 0.0)), infsup (1.570796326794896558e+00, 1.570796326794896780e+00)));
%!test
%! assert (isequal (acos (infsup (-0.0, -0.0)), infsup (1.570796326794896558e+00, 1.570796326794896780e+00)));
%!test
%! assert (isequal (acos (infsup (-inf, -1.000000000000000222e+00)), infsup));
%!test
%! assert (isequal (acos (infsup (1.000000000000000222e+00, inf)), infsup));
%!test
%! assert (isequal (acos (infsup (-1.000000000000000056e-01, 1.000000000000000056e-01)), infsup (1.470628905633336814e+00, 1.670963747956456524e+00)));
%!test
%! assert (isequal (acos (infsup (-3.300000000000000155e-01, 9.999999999999998890e-01)), infsup (1.490116119384765625e-08, 1.907099901948877019e+00)));
%!test
%! assert (isequal (acos (infsup (-9.999999999999998890e-01, 9.999999999999998890e-01)), infsup (1.490116119384765625e-08, 3.141592638688632366e+00)));

## minimal_acos_dec_test

%!test
%! assert (isequal (acos (infsupdec (0.0, inf, "dac")), infsupdec (0.0, 1.570796326794896780e+00, "trv")));
%! assert (isequal (decorationpart (acos (infsupdec (0.0, inf, "dac"))){1}, decorationpart (infsupdec (0.0, 1.570796326794896780e+00, "trv")){1}));
%!test
%! assert (isequal (acos (infsupdec (-inf, 0.0, "def")), infsupdec (1.570796326794896558e+00, 3.141592653589793560e+00, "trv")));
%! assert (isequal (decorationpart (acos (infsupdec (-inf, 0.0, "def"))){1}, decorationpart (infsupdec (1.570796326794896558e+00, 3.141592653589793560e+00, "trv")){1}));
%!test
%! assert (isequal (acos (infsupdec (-1.0, 1.0, "com")), infsupdec (0.0, 3.141592653589793560e+00, "com")));
%! assert (isequal (decorationpart (acos (infsupdec (-1.0, 1.0, "com"))){1}, decorationpart (infsupdec (0.0, 3.141592653589793560e+00, "com")){1}));
%!test
%! assert (isequal (acos (infsupdec (entire, "def")), infsupdec (0.0, 3.141592653589793560e+00, "trv")));
%! assert (isequal (decorationpart (acos (infsupdec (entire, "def"))){1}, decorationpart (infsupdec (0.0, 3.141592653589793560e+00, "trv")){1}));
%!test
%! assert (isequal (acos (infsupdec (-3.300000000000000155e-01, 9.999999999999998890e-01, "def")), infsupdec (1.490116119384765625e-08, 1.907099901948877019e+00, "def")));
%! assert (isequal (decorationpart (acos (infsupdec (-3.300000000000000155e-01, 9.999999999999998890e-01, "def"))){1}, decorationpart (infsupdec (1.490116119384765625e-08, 1.907099901948877019e+00, "def")){1}));

## minimal_atan_test

%!test
%! assert (isequal (atan (infsup), infsup));
%!test
%! assert (isequal (atan (infsup (0.0, inf)), infsup (0.0, 1.570796326794896780e+00)));
%!test
%! assert (isequal (atan (infsup (-0.0, inf)), infsup (0.0, 1.570796326794896780e+00)));
%!test
%! assert (isequal (atan (infsup (-inf, 0.0)), infsup (-1.570796326794896780e+00, 0.0)));
%!test
%! assert (isequal (atan (infsup (-inf, -0.0)), infsup (-1.570796326794896780e+00, 0.0)));
%!test
%! assert (isequal (atan (infsup (-inf, inf)), infsup (-1.570796326794896780e+00, 1.570796326794896780e+00)));
%!test
%! assert (isequal (atan (infsup (0.0, 0.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (atan (infsup (-0.0, -0.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (atan (infsup (1.0, 4.353453467566999793e+07)), infsup (7.853981633974482790e-01, 1.570796303824627094e+00)));
%!test
%! assert (isequal (atan (infsup (-5.466754345546680298e+11, -5.658889722000000120e+02)), infsup (-1.570796326793067577e+00, -1.569029197537726406e+00)));

## minimal_atan_dec_test

%!test
%! assert (isequal (atan (infsupdec (0.0, inf, "dac")), infsupdec (0.0, 1.570796326794896780e+00, "dac")));
%! assert (isequal (decorationpart (atan (infsupdec (0.0, inf, "dac"))){1}, decorationpart (infsupdec (0.0, 1.570796326794896780e+00, "dac")){1}));
%!test
%! assert (isequal (atan (infsupdec (-inf, 0.0, "def")), infsupdec (-1.570796326794896780e+00, 0.0, "def")));
%! assert (isequal (decorationpart (atan (infsupdec (-inf, 0.0, "def"))){1}, decorationpart (infsupdec (-1.570796326794896780e+00, 0.0, "def")){1}));
%!test
%! assert (isequal (atan (infsupdec (entire, "def")), infsupdec (-1.570796326794896780e+00, 1.570796326794896780e+00, "def")));
%! assert (isequal (decorationpart (atan (infsupdec (entire, "def"))){1}, decorationpart (infsupdec (-1.570796326794896780e+00, 1.570796326794896780e+00, "def")){1}));
%!test
%! assert (isequal (atan (infsupdec (1.0, 4.353453467566999793e+07, "trv")), infsupdec (7.853981633974482790e-01, 1.570796303824627094e+00, "trv")));
%! assert (isequal (decorationpart (atan (infsupdec (1.0, 4.353453467566999793e+07, "trv"))){1}, decorationpart (infsupdec (7.853981633974482790e-01, 1.570796303824627094e+00, "trv")){1}));
%!test
%! assert (isequal (atan (infsupdec (-5.466754345546680298e+11, -5.658889722000000120e+02, "com")), infsupdec (-1.570796326793067577e+00, -1.569029197537726406e+00, "com")));
%! assert (isequal (decorationpart (atan (infsupdec (-5.466754345546680298e+11, -5.658889722000000120e+02, "com"))){1}, decorationpart (infsupdec (-1.570796326793067577e+00, -1.569029197537726406e+00, "com")){1}));

## minimal_atan2_test

%!test
%! assert (isequal (atan2 (infsup, infsup), infsup));
%!test
%! assert (isequal (atan2 (infsup, infsup (-inf, inf)), infsup));
%!test
%! assert (isequal (atan2 (infsup, infsup (0.0, 0.0)), infsup));
%!test
%! assert (isequal (atan2 (infsup, infsup (-0.0, 0.0)), infsup));
%!test
%! assert (isequal (atan2 (infsup, infsup (0.0, -0.0)), infsup));
%!test
%! assert (isequal (atan2 (infsup, infsup (-0.0, -0.0)), infsup));
%!test
%! assert (isequal (atan2 (infsup, infsup (-2.0, -0.1)), infsup));
%!test
%! assert (isequal (atan2 (infsup, infsup (-2.0, 0.0)), infsup));
%!test
%! assert (isequal (atan2 (infsup, infsup (-2.0, -0.0)), infsup));
%!test
%! assert (isequal (atan2 (infsup, infsup (-2.0, 1.0)), infsup));
%!test
%! assert (isequal (atan2 (infsup, infsup (0.0, 1.0)), infsup));
%!test
%! assert (isequal (atan2 (infsup, infsup (-0.0, 1.0)), infsup));
%!test
%! assert (isequal (atan2 (infsup, infsup (0.1, 1.0)), infsup));
%!test
%! assert (isequal (atan2 (infsup (-inf, inf), infsup), infsup));
%!test
%! assert (isequal (atan2 (infsup (-inf, inf), infsup (-inf, inf)), infsup (-3.141592653589793560e+00, 3.141592653589793560e+00)));
%!test
%! assert (isequal (atan2 (infsup (-inf, inf), infsup (0.0, 0.0)), infsup (-1.570796326794896780e+00, 1.570796326794896780e+00)));
%!test
%! assert (isequal (atan2 (infsup (-inf, inf), infsup (0.0, -0.0)), infsup (-1.570796326794896780e+00, 1.570796326794896780e+00)));
%!test
%! assert (isequal (atan2 (infsup (-inf, inf), infsup (-0.0, 0.0)), infsup (-1.570796326794896780e+00, 1.570796326794896780e+00)));
%!test
%! assert (isequal (atan2 (infsup (-inf, inf), infsup (-0.0, -0.0)), infsup (-1.570796326794896780e+00, 1.570796326794896780e+00)));
%!test
%! assert (isequal (atan2 (infsup (-inf, inf), infsup (-2.0, -0.1)), infsup (-3.141592653589793560e+00, 3.141592653589793560e+00)));
%!test
%! assert (isequal (atan2 (infsup (-inf, inf), infsup (-2.0, 0.0)), infsup (-3.141592653589793560e+00, 3.141592653589793560e+00)));
%!test
%! assert (isequal (atan2 (infsup (-inf, inf), infsup (-2.0, -0.0)), infsup (-3.141592653589793560e+00, 3.141592653589793560e+00)));
%!test
%! assert (isequal (atan2 (infsup (-inf, inf), infsup (-2.0, 1.0)), infsup (-3.141592653589793560e+00, 3.141592653589793560e+00)));
%!test
%! assert (isequal (atan2 (infsup (-inf, inf), infsup (0.0, 1.0)), infsup (-1.570796326794896780e+00, 1.570796326794896780e+00)));
%!test
%! assert (isequal (atan2 (infsup (-inf, inf), infsup (-0.0, 1.0)), infsup (-1.570796326794896780e+00, 1.570796326794896780e+00)));
%!test
%! assert (isequal (atan2 (infsup (-inf, inf), infsup (0.1, 1.0)), infsup (-1.570796326794896780e+00, 1.570796326794896780e+00)));
%!test
%! assert (isequal (atan2 (infsup (0.0, 0.0), infsup), infsup));
%!test
%! assert (isequal (atan2 (infsup (0.0, 0.0), infsup (-inf, inf)), infsup (0.0, 3.141592653589793560e+00)));
%!test
%! assert (isequal (atan2 (infsup (0.0, 0.0), infsup (0.0, 0.0)), infsup));
%!test
%! assert (isequal (atan2 (infsup (0.0, 0.0), infsup (-0.0, 0.0)), infsup));
%!test
%! assert (isequal (atan2 (infsup (0.0, 0.0), infsup (0.0, -0.0)), infsup));
%!test
%! assert (isequal (atan2 (infsup (0.0, 0.0), infsup (-0.0, -0.0)), infsup));
%!test
%! assert (isequal (atan2 (infsup (0.0, 0.0), infsup (-2.0, -0.1)), infsup (3.141592653589793116e+00, 3.141592653589793560e+00)));
%!test
%! assert (isequal (atan2 (infsup (0.0, 0.0), infsup (-2.0, 0.0)), infsup (3.141592653589793116e+00, 3.141592653589793560e+00)));
%!test
%! assert (isequal (atan2 (infsup (0.0, 0.0), infsup (-2.0, -0.0)), infsup (3.141592653589793116e+00, 3.141592653589793560e+00)));
%!test
%! assert (isequal (atan2 (infsup (0.0, 0.0), infsup (-2.0, 1.0)), infsup (0.0, 3.141592653589793560e+00)));
%!test
%! assert (isequal (atan2 (infsup (0.0, 0.0), infsup (0.0, 1.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (atan2 (infsup (0.0, 0.0), infsup (-0.0, 1.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (atan2 (infsup (0.0, 0.0), infsup (0.1, 1.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (atan2 (infsup (-0.0, 0.0), infsup), infsup));
%!test
%! assert (isequal (atan2 (infsup (-0.0, 0.0), infsup (-inf, inf)), infsup (0.0, 3.141592653589793560e+00)));
%!test
%! assert (isequal (atan2 (infsup (-0.0, 0.0), infsup (0.0, 0.0)), infsup));
%!test
%! assert (isequal (atan2 (infsup (-0.0, 0.0), infsup (-0.0, 0.0)), infsup));
%!test
%! assert (isequal (atan2 (infsup (-0.0, 0.0), infsup (0.0, -0.0)), infsup));
%!test
%! assert (isequal (atan2 (infsup (-0.0, 0.0), infsup (-0.0, -0.0)), infsup));
%!test
%! assert (isequal (atan2 (infsup (-0.0, 0.0), infsup (-2.0, -0.1)), infsup (3.141592653589793116e+00, 3.141592653589793560e+00)));
%!test
%! assert (isequal (atan2 (infsup (-0.0, 0.0), infsup (-2.0, 0.0)), infsup (3.141592653589793116e+00, 3.141592653589793560e+00)));
%!test
%! assert (isequal (atan2 (infsup (-0.0, 0.0), infsup (-2.0, -0.0)), infsup (3.141592653589793116e+00, 3.141592653589793560e+00)));
%!test
%! assert (isequal (atan2 (infsup (-0.0, 0.0), infsup (-2.0, 1.0)), infsup (0.0, 3.141592653589793560e+00)));
%!test
%! assert (isequal (atan2 (infsup (-0.0, 0.0), infsup (0.0, 1.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (atan2 (infsup (-0.0, 0.0), infsup (-0.0, 1.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (atan2 (infsup (-0.0, 0.0), infsup (0.1, 1.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (atan2 (infsup (0.0, -0.0), infsup), infsup));
%!test
%! assert (isequal (atan2 (infsup (0.0, -0.0), infsup (-inf, inf)), infsup (0.0, 3.141592653589793560e+00)));
%!test
%! assert (isequal (atan2 (infsup (0.0, -0.0), infsup (0.0, 0.0)), infsup));
%!test
%! assert (isequal (atan2 (infsup (0.0, -0.0), infsup (-0.0, 0.0)), infsup));
%!test
%! assert (isequal (atan2 (infsup (0.0, -0.0), infsup (0.0, -0.0)), infsup));
%!test
%! assert (isequal (atan2 (infsup (0.0, -0.0), infsup (-0.0, -0.0)), infsup));
%!test
%! assert (isequal (atan2 (infsup (0.0, -0.0), infsup (-2.0, -0.1)), infsup (3.141592653589793116e+00, 3.141592653589793560e+00)));
%!test
%! assert (isequal (atan2 (infsup (0.0, -0.0), infsup (-2.0, 0.0)), infsup (3.141592653589793116e+00, 3.141592653589793560e+00)));
%!test
%! assert (isequal (atan2 (infsup (0.0, -0.0), infsup (-2.0, -0.0)), infsup (3.141592653589793116e+00, 3.141592653589793560e+00)));
%!test
%! assert (isequal (atan2 (infsup (0.0, -0.0), infsup (-2.0, 1.0)), infsup (0.0, 3.141592653589793560e+00)));
%!test
%! assert (isequal (atan2 (infsup (0.0, -0.0), infsup (0.0, 1.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (atan2 (infsup (0.0, -0.0), infsup (-0.0, 1.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (atan2 (infsup (0.0, -0.0), infsup (0.1, 1.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (atan2 (infsup (-0.0, -0.0), infsup), infsup));
%!test
%! assert (isequal (atan2 (infsup (-0.0, -0.0), infsup (-inf, inf)), infsup (0.0, 3.141592653589793560e+00)));
%!test
%! assert (isequal (atan2 (infsup (-0.0, -0.0), infsup (0.0, 0.0)), infsup));
%!test
%! assert (isequal (atan2 (infsup (-0.0, -0.0), infsup (-0.0, 0.0)), infsup));
%!test
%! assert (isequal (atan2 (infsup (-0.0, -0.0), infsup (0.0, -0.0)), infsup));
%!test
%! assert (isequal (atan2 (infsup (-0.0, -0.0), infsup (-0.0, -0.0)), infsup));
%!test
%! assert (isequal (atan2 (infsup (-0.0, -0.0), infsup (-2.0, -0.1)), infsup (3.141592653589793116e+00, 3.141592653589793560e+00)));
%!test
%! assert (isequal (atan2 (infsup (-0.0, -0.0), infsup (-2.0, 0.0)), infsup (3.141592653589793116e+00, 3.141592653589793560e+00)));
%!test
%! assert (isequal (atan2 (infsup (-0.0, -0.0), infsup (-2.0, -0.0)), infsup (3.141592653589793116e+00, 3.141592653589793560e+00)));
%!test
%! assert (isequal (atan2 (infsup (-0.0, -0.0), infsup (-2.0, 1.0)), infsup (0.0, 3.141592653589793560e+00)));
%!test
%! assert (isequal (atan2 (infsup (-0.0, -0.0), infsup (0.0, 1.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (atan2 (infsup (-0.0, -0.0), infsup (-0.0, 1.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (atan2 (infsup (-0.0, -0.0), infsup (0.1, 1.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (atan2 (infsup (-2.0, -0.1), infsup), infsup));
%!test
%! assert (isequal (atan2 (infsup (-2.0, -0.1), infsup (-inf, inf)), infsup (-3.141592653589793560e+00, 0.0)));
%!test
%! assert (isequal (atan2 (infsup (-2.0, -0.1), infsup (0.0, 0.0)), infsup (-1.570796326794896780e+00, -1.570796326794896558e+00)));
%!test
%! assert (isequal (atan2 (infsup (-2.0, -0.1), infsup (0.0, -0.0)), infsup (-1.570796326794896780e+00, -1.570796326794896558e+00)));
%!test
%! assert (isequal (atan2 (infsup (-2.0, -0.1), infsup (-0.0, 0.0)), infsup (-1.570796326794896780e+00, -1.570796326794896558e+00)));
%!test
%! assert (isequal (atan2 (infsup (-2.0, -0.1), infsup (0.0, -0.0)), infsup (-1.570796326794896780e+00, -1.570796326794896558e+00)));
%!test
%! assert (isequal (atan2 (infsup (-2.0, -0.1), infsup (-2.0, -0.1)), infsup (-3.091634257867850621e+00, -1.620754722516839275e+00)));
%!test
%! assert (isequal (atan2 (infsup (-2.0, -0.1), infsup (-2.0, 0.0)), infsup (-3.091634257867850621e+00, -1.570796326794896558e+00)));
%!test
%! assert (isequal (atan2 (infsup (-2.0, -0.1), infsup (-2.0, -0.0)), infsup (-3.091634257867850621e+00, -1.570796326794896558e+00)));
%!test
%! assert (isequal (atan2 (infsup (-2.0, -0.1), infsup (-2.0, 1.0)), infsup (-3.091634257867850621e+00, -9.966865249116202419e-02)));
%!test
%! assert (isequal (atan2 (infsup (-2.0, -0.1), infsup (0.0, 1.0)), infsup (-1.570796326794896780e+00, -9.966865249116202419e-02)));
%!test
%! assert (isequal (atan2 (infsup (-2.0, -0.1), infsup (-0.0, 1.0)), infsup (-1.570796326794896780e+00, -9.966865249116202419e-02)));
%!test
%! assert (isequal (atan2 (infsup (-2.0, -0.1), infsup (0.1, 1.0)), infsup (-1.520837931072954063e+00, -9.966865249116202419e-02)));
%!test
%! assert (isequal (atan2 (infsup (-2.0, 0.0), infsup), infsup));
%!test
%! assert (isequal (atan2 (infsup (-2.0, 0.0), infsup (-inf, inf)), infsup (-3.141592653589793560e+00, 3.141592653589793560e+00)));
%!test
%! assert (isequal (atan2 (infsup (-2.0, 0.0), infsup (0.0, 0.0)), infsup (-1.570796326794896780e+00, -1.570796326794896558e+00)));
%!test
%! assert (isequal (atan2 (infsup (-2.0, 0.0), infsup (-0.0, 0.0)), infsup (-1.570796326794896780e+00, -1.570796326794896558e+00)));
%!test
%! assert (isequal (atan2 (infsup (-2.0, 0.0), infsup (0.0, -0.0)), infsup (-1.570796326794896780e+00, -1.570796326794896558e+00)));
%!test
%! assert (isequal (atan2 (infsup (-2.0, 0.0), infsup (-0.0, -0.0)), infsup (-1.570796326794896780e+00, -1.570796326794896558e+00)));
%!test
%! assert (isequal (atan2 (infsup (-2.0, 0.0), infsup (-2.0, -0.1)), infsup (-3.141592653589793560e+00, 3.141592653589793560e+00)));
%!test
%! assert (isequal (atan2 (infsup (-2.0, 0.0), infsup (-2.0, 0.0)), infsup (-3.141592653589793560e+00, 3.141592653589793560e+00)));
%!test
%! assert (isequal (atan2 (infsup (-2.0, 0.0), infsup (-2.0, -0.0)), infsup (-3.141592653589793560e+00, 3.141592653589793560e+00)));
%!test
%! assert (isequal (atan2 (infsup (-2.0, 0.0), infsup (-2.0, 1.0)), infsup (-3.141592653589793560e+00, 3.141592653589793560e+00)));
%!test
%! assert (isequal (atan2 (infsup (-2.0, 0.0), infsup (0.0, 1.0)), infsup (-1.570796326794896780e+00, 0.0)));
%!test
%! assert (isequal (atan2 (infsup (-2.0, 0.0), infsup (-0.0, 1.0)), infsup (-1.570796326794896780e+00, 0.0)));
%!test
%! assert (isequal (atan2 (infsup (-2.0, 0.0), infsup (0.1, 1.0)), infsup (-1.520837931072954063e+00, 0.0)));
%!test
%! assert (isequal (atan2 (infsup (-2.0, -0.0), infsup), infsup));
%!test
%! assert (isequal (atan2 (infsup (-2.0, -0.0), infsup (-inf, inf)), infsup (-3.141592653589793560e+00, 3.141592653589793560e+00)));
%!test
%! assert (isequal (atan2 (infsup (-2.0, -0.0), infsup (0.0, 0.0)), infsup (-1.570796326794896780e+00, -1.570796326794896558e+00)));
%!test
%! assert (isequal (atan2 (infsup (-2.0, -0.0), infsup (-0.0, 0.0)), infsup (-1.570796326794896780e+00, -1.570796326794896558e+00)));
%!test
%! assert (isequal (atan2 (infsup (-2.0, -0.0), infsup (0.0, -0.0)), infsup (-1.570796326794896780e+00, -1.570796326794896558e+00)));
%!test
%! assert (isequal (atan2 (infsup (-2.0, -0.0), infsup (-0.0, -0.0)), infsup (-1.570796326794896780e+00, -1.570796326794896558e+00)));
%!test
%! assert (isequal (atan2 (infsup (-2.0, -0.0), infsup (-2.0, -0.1)), infsup (-3.141592653589793560e+00, 3.141592653589793560e+00)));
%!test
%! assert (isequal (atan2 (infsup (-2.0, -0.0), infsup (-2.0, 0.0)), infsup (-3.141592653589793560e+00, 3.141592653589793560e+00)));
%!test
%! assert (isequal (atan2 (infsup (-2.0, -0.0), infsup (-2.0, -0.0)), infsup (-3.141592653589793560e+00, 3.141592653589793560e+00)));
%!test
%! assert (isequal (atan2 (infsup (-2.0, -0.0), infsup (-2.0, 1.0)), infsup (-3.141592653589793560e+00, 3.141592653589793560e+00)));
%!test
%! assert (isequal (atan2 (infsup (-2.0, -0.0), infsup (0.0, 1.0)), infsup (-1.570796326794896780e+00, 0.0)));
%!test
%! assert (isequal (atan2 (infsup (-2.0, -0.0), infsup (-0.0, 1.0)), infsup (-1.570796326794896780e+00, 0.0)));
%!test
%! assert (isequal (atan2 (infsup (-2.0, -0.0), infsup (0.1, 1.0)), infsup (-1.520837931072954063e+00, 0.0)));
%!test
%! assert (isequal (atan2 (infsup (-2.0, 1.0), infsup), infsup));
%!test
%! assert (isequal (atan2 (infsup (-2.0, 1.0), infsup (-inf, inf)), infsup (-3.141592653589793560e+00, 3.141592653589793560e+00)));
%!test
%! assert (isequal (atan2 (infsup (-2.0, 1.0), infsup (0.0, 0.0)), infsup (-1.570796326794896780e+00, 1.570796326794896780e+00)));
%!test
%! assert (isequal (atan2 (infsup (-2.0, 1.0), infsup (-0.0, 0.0)), infsup (-1.570796326794896780e+00, 1.570796326794896780e+00)));
%!test
%! assert (isequal (atan2 (infsup (-2.0, 1.0), infsup (0.0, -0.0)), infsup (-1.570796326794896780e+00, 1.570796326794896780e+00)));
%!test
%! assert (isequal (atan2 (infsup (-2.0, 1.0), infsup (-0.0, -0.0)), infsup (-1.570796326794896780e+00, 1.570796326794896780e+00)));
%!test
%! assert (isequal (atan2 (infsup (-2.0, 1.0), infsup (-2.0, -0.1)), infsup (-3.141592653589793560e+00, 3.141592653589793560e+00)));
%!test
%! assert (isequal (atan2 (infsup (-2.0, 1.0), infsup (-2.0, 0.0)), infsup (-3.141592653589793560e+00, 3.141592653589793560e+00)));
%!test
%! assert (isequal (atan2 (infsup (-2.0, 1.0), infsup (-2.0, -0.0)), infsup (-3.141592653589793560e+00, 3.141592653589793560e+00)));
%!test
%! assert (isequal (atan2 (infsup (-2.0, 1.0), infsup (-2.0, 1.0)), infsup (-3.141592653589793560e+00, 3.141592653589793560e+00)));
%!test
%! assert (isequal (atan2 (infsup (-2.0, 1.0), infsup (0.0, 1.0)), infsup (-1.570796326794896780e+00, 1.570796326794896780e+00)));
%!test
%! assert (isequal (atan2 (infsup (-2.0, 1.0), infsup (-0.0, 1.0)), infsup (-1.570796326794896780e+00, 1.570796326794896780e+00)));
%!test
%! assert (isequal (atan2 (infsup (-2.0, 1.0), infsup (0.1, 1.0)), infsup (-1.520837931072954063e+00, 1.471127674303734700e+00)));
%!test
%! assert (isequal (atan2 (infsup (-0.0, 1.0), infsup), infsup));
%!test
%! assert (isequal (atan2 (infsup (-0.0, 1.0), infsup (-inf, inf)), infsup (0.0, 3.141592653589793560e+00)));
%!test
%! assert (isequal (atan2 (infsup (-0.0, 1.0), infsup (0.0, 0.0)), infsup (1.570796326794896558e+00, 1.570796326794896780e+00)));
%!test
%! assert (isequal (atan2 (infsup (-0.0, 1.0), infsup (-0.0, 0.0)), infsup (1.570796326794896558e+00, 1.570796326794896780e+00)));
%!test
%! assert (isequal (atan2 (infsup (-0.0, 1.0), infsup (0.0, -0.0)), infsup (1.570796326794896558e+00, 1.570796326794896780e+00)));
%!test
%! assert (isequal (atan2 (infsup (-0.0, 1.0), infsup (-0.0, -0.0)), infsup (1.570796326794896558e+00, 1.570796326794896780e+00)));
%!test
%! assert (isequal (atan2 (infsup (-0.0, 1.0), infsup (-2.0, -0.1)), infsup (1.670464979286058638e+00, 3.141592653589793560e+00)));
%!test
%! assert (isequal (atan2 (infsup (-0.0, 1.0), infsup (-2.0, 0.0)), infsup (1.570796326794896558e+00, 3.141592653589793560e+00)));
%!test
%! assert (isequal (atan2 (infsup (-0.0, 1.0), infsup (-2.0, -0.0)), infsup (1.570796326794896558e+00, 3.141592653589793560e+00)));
%!test
%! assert (isequal (atan2 (infsup (-0.0, 1.0), infsup (-2.0, 1.0)), infsup (0.0, 3.141592653589793560e+00)));
%!test
%! assert (isequal (atan2 (infsup (-0.0, 1.0), infsup (0.0, 1.0)), infsup (0.0, 1.570796326794896780e+00)));
%!test
%! assert (isequal (atan2 (infsup (-0.0, 1.0), infsup (-0.0, 1.0)), infsup (0.0, 1.570796326794896780e+00)));
%!test
%! assert (isequal (atan2 (infsup (-0.0, 1.0), infsup (0.1, 1.0)), infsup (0.0, 1.471127674303734700e+00)));
%!test
%! assert (isequal (atan2 (infsup (0.0, 1.0), infsup), infsup));
%!test
%! assert (isequal (atan2 (infsup (0.0, 1.0), infsup (-inf, inf)), infsup (0.0, 3.141592653589793560e+00)));
%!test
%! assert (isequal (atan2 (infsup (0.0, 1.0), infsup (0.0, 0.0)), infsup (1.570796326794896558e+00, 1.570796326794896780e+00)));
%!test
%! assert (isequal (atan2 (infsup (0.0, 1.0), infsup (-0.0, 0.0)), infsup (1.570796326794896558e+00, 1.570796326794896780e+00)));
%!test
%! assert (isequal (atan2 (infsup (0.0, 1.0), infsup (0.0, -0.0)), infsup (1.570796326794896558e+00, 1.570796326794896780e+00)));
%!test
%! assert (isequal (atan2 (infsup (0.0, 1.0), infsup (-0.0, -0.0)), infsup (1.570796326794896558e+00, 1.570796326794896780e+00)));
%!test
%! assert (isequal (atan2 (infsup (0.0, 1.0), infsup (-2.0, -0.1)), infsup (1.670464979286058638e+00, 3.141592653589793560e+00)));
%!test
%! assert (isequal (atan2 (infsup (0.0, 1.0), infsup (-2.0, 0.0)), infsup (1.570796326794896558e+00, 3.141592653589793560e+00)));
%!test
%! assert (isequal (atan2 (infsup (0.0, 1.0), infsup (-2.0, -0.0)), infsup (1.570796326794896558e+00, 3.141592653589793560e+00)));
%!test
%! assert (isequal (atan2 (infsup (0.0, 1.0), infsup (-2.0, 1.0)), infsup (0.0, 3.141592653589793560e+00)));
%!test
%! assert (isequal (atan2 (infsup (0.0, 1.0), infsup (0.0, 1.0)), infsup (0.0, 1.570796326794896780e+00)));
%!test
%! assert (isequal (atan2 (infsup (0.0, 1.0), infsup (-0.0, 1.0)), infsup (0.0, 1.570796326794896780e+00)));
%!test
%! assert (isequal (atan2 (infsup (0.0, 1.0), infsup (0.1, 1.0)), infsup (0.0, 1.471127674303734700e+00)));
%!test
%! assert (isequal (atan2 (infsup (0.1, 1.0), infsup), infsup));
%!test
%! assert (isequal (atan2 (infsup (0.1, 1.0), infsup (-inf, inf)), infsup (0.0, 3.141592653589793560e+00)));
%!test
%! assert (isequal (atan2 (infsup (0.1, 1.0), infsup (0.0, 0.0)), infsup (1.570796326794896558e+00, 1.570796326794896780e+00)));
%!test
%! assert (isequal (atan2 (infsup (0.1, 1.0), infsup (-0.0, 0.0)), infsup (1.570796326794896558e+00, 1.570796326794896780e+00)));
%!test
%! assert (isequal (atan2 (infsup (0.1, 1.0), infsup (0.0, -0.0)), infsup (1.570796326794896558e+00, 1.570796326794896780e+00)));
%!test
%! assert (isequal (atan2 (infsup (0.1, 1.0), infsup (-0.0, -0.0)), infsup (1.570796326794896558e+00, 1.570796326794896780e+00)));
%!test
%! assert (isequal (atan2 (infsup (0.1, 1.0), infsup (-2.0, -0.1)), infsup (1.670464979286058638e+00, 3.091634257867850621e+00)));
%!test
%! assert (isequal (atan2 (infsup (0.1, 1.0), infsup (-2.0, 0.0)), infsup (1.570796326794896558e+00, 3.091634257867850621e+00)));
%!test
%! assert (isequal (atan2 (infsup (0.1, 1.0), infsup (-2.0, -0.0)), infsup (1.570796326794896558e+00, 3.091634257867850621e+00)));
%!test
%! assert (isequal (atan2 (infsup (0.1, 1.0), infsup (-2.0, 1.0)), infsup (9.966865249116202419e-02, 3.091634257867850621e+00)));
%!test
%! assert (isequal (atan2 (infsup (0.1, 1.0), infsup (0.0, 1.0)), infsup (9.966865249116202419e-02, 1.570796326794896780e+00)));
%!test
%! assert (isequal (atan2 (infsup (0.1, 1.0), infsup (-0.0, 1.0)), infsup (9.966865249116202419e-02, 1.570796326794896780e+00)));
%!test
%! assert (isequal (atan2 (infsup (0.1, 1.0), infsup (0.1, 1.0)), infsup (9.966865249116202419e-02, 1.471127674303734700e+00)));

## minimal_atan2_dec_test

%!test
%! assert (isequal (atan2 (infsupdec (empty, "trv"), infsupdec (entire, "def")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (empty, "trv"), infsupdec (entire, "def"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (empty, "trv"), infsupdec (0.0, 0.0, "com")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (empty, "trv"), infsupdec (0.0, 0.0, "com"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (empty, "trv"), infsupdec (-0.0, 0.0, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (empty, "trv"), infsupdec (-0.0, 0.0, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (empty, "trv"), infsupdec (0.0, -0.0, "def")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (empty, "trv"), infsupdec (0.0, -0.0, "def"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (empty, "trv"), infsupdec (-0.0, -0.0, "trv")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (empty, "trv"), infsupdec (-0.0, -0.0, "trv"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (empty, "trv"), infsupdec (-2.0, -0.1, "com")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (empty, "trv"), infsupdec (-2.0, -0.1, "com"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (empty, "trv"), infsupdec (-2.0, 0.0, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (empty, "trv"), infsupdec (-2.0, 0.0, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (empty, "trv"), infsupdec (-2.0, -0.0, "def")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (empty, "trv"), infsupdec (-2.0, -0.0, "def"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (empty, "trv"), infsupdec (-2.0, 1.0, "trv")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (empty, "trv"), infsupdec (-2.0, 1.0, "trv"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (empty, "trv"), infsupdec (0.0, 1.0, "com")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (empty, "trv"), infsupdec (0.0, 1.0, "com"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (empty, "trv"), infsupdec (-0.0, 1.0, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (empty, "trv"), infsupdec (-0.0, 1.0, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (empty, "trv"), infsupdec (0.1, 1.0, "def")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (empty, "trv"), infsupdec (0.1, 1.0, "def"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (entire, "def"), infsupdec (empty, "trv")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (entire, "def"), infsupdec (empty, "trv"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (entire, "def"), infsupdec (entire, "def")), infsupdec (-3.141592653589793560e+00, 3.141592653589793560e+00, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (entire, "def"), infsupdec (entire, "def"))){1}, decorationpart (infsupdec (-3.141592653589793560e+00, 3.141592653589793560e+00, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (entire, "def"), infsupdec (0.0, 0.0, "com")), infsupdec (-1.570796326794896780e+00, 1.570796326794896780e+00, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (entire, "def"), infsupdec (0.0, 0.0, "com"))){1}, decorationpart (infsupdec (-1.570796326794896780e+00, 1.570796326794896780e+00, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (entire, "def"), infsupdec (0.0, -0.0, "def")), infsupdec (-1.570796326794896780e+00, 1.570796326794896780e+00, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (entire, "def"), infsupdec (0.0, -0.0, "def"))){1}, decorationpart (infsupdec (-1.570796326794896780e+00, 1.570796326794896780e+00, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (entire, "def"), infsupdec (-0.0, 0.0, "dac")), infsupdec (-1.570796326794896780e+00, 1.570796326794896780e+00, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (entire, "def"), infsupdec (-0.0, 0.0, "dac"))){1}, decorationpart (infsupdec (-1.570796326794896780e+00, 1.570796326794896780e+00, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (entire, "def"), infsupdec (-0.0, -0.0, "trv")), infsupdec (-1.570796326794896780e+00, 1.570796326794896780e+00, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (entire, "def"), infsupdec (-0.0, -0.0, "trv"))){1}, decorationpart (infsupdec (-1.570796326794896780e+00, 1.570796326794896780e+00, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (entire, "def"), infsupdec (-2.0, -0.1, "com")), infsupdec (-3.141592653589793560e+00, 3.141592653589793560e+00, "def")));
%! assert (isequal (decorationpart (atan2 (infsupdec (entire, "def"), infsupdec (-2.0, -0.1, "com"))){1}, decorationpart (infsupdec (-3.141592653589793560e+00, 3.141592653589793560e+00, "def")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (entire, "def"), infsupdec (-2.0, 0.0, "dac")), infsupdec (-3.141592653589793560e+00, 3.141592653589793560e+00, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (entire, "def"), infsupdec (-2.0, 0.0, "dac"))){1}, decorationpart (infsupdec (-3.141592653589793560e+00, 3.141592653589793560e+00, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (entire, "def"), infsupdec (-2.0, -0.0, "def")), infsupdec (-3.141592653589793560e+00, 3.141592653589793560e+00, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (entire, "def"), infsupdec (-2.0, -0.0, "def"))){1}, decorationpart (infsupdec (-3.141592653589793560e+00, 3.141592653589793560e+00, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (entire, "def"), infsupdec (-2.0, 1.0, "trv")), infsupdec (-3.141592653589793560e+00, 3.141592653589793560e+00, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (entire, "def"), infsupdec (-2.0, 1.0, "trv"))){1}, decorationpart (infsupdec (-3.141592653589793560e+00, 3.141592653589793560e+00, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (entire, "def"), infsupdec (0.0, 1.0, "dac")), infsupdec (-1.570796326794896780e+00, 1.570796326794896780e+00, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (entire, "def"), infsupdec (0.0, 1.0, "dac"))){1}, decorationpart (infsupdec (-1.570796326794896780e+00, 1.570796326794896780e+00, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (entire, "def"), infsupdec (-0.0, 1.0, "def")), infsupdec (-1.570796326794896780e+00, 1.570796326794896780e+00, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (entire, "def"), infsupdec (-0.0, 1.0, "def"))){1}, decorationpart (infsupdec (-1.570796326794896780e+00, 1.570796326794896780e+00, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (entire, "def"), infsupdec (0.1, 1.0, "com")), infsupdec (-1.570796326794896780e+00, 1.570796326794896780e+00, "def")));
%! assert (isequal (decorationpart (atan2 (infsupdec (entire, "def"), infsupdec (0.1, 1.0, "com"))){1}, decorationpart (infsupdec (-1.570796326794896780e+00, 1.570796326794896780e+00, "def")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (0.0, 0.0, "com"), infsupdec (empty, "trv")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (0.0, 0.0, "com"), infsupdec (empty, "trv"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (0.0, 0.0, "dac"), infsupdec (entire, "def")), infsupdec (0.0, 3.141592653589793560e+00, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (0.0, 0.0, "dac"), infsupdec (entire, "def"))){1}, decorationpart (infsupdec (0.0, 3.141592653589793560e+00, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (0.0, 0.0, "def"), infsupdec (0.0, 0.0, "trv")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (0.0, 0.0, "def"), infsupdec (0.0, 0.0, "trv"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (0.0, 0.0, "trv"), infsupdec (-0.0, 0.0, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (0.0, 0.0, "trv"), infsupdec (-0.0, 0.0, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (0.0, 0.0, "com"), infsupdec (0.0, -0.0, "def")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (0.0, 0.0, "com"), infsupdec (0.0, -0.0, "def"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (0.0, 0.0, "dac"), infsupdec (-0.0, -0.0, "com")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (0.0, 0.0, "dac"), infsupdec (-0.0, -0.0, "com"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (0.0, 0.0, "com"), infsupdec (-2.0, -0.1, "dac")), infsupdec (3.141592653589793116e+00, 3.141592653589793560e+00, "dac")));
%! assert (isequal (decorationpart (atan2 (infsupdec (0.0, 0.0, "com"), infsupdec (-2.0, -0.1, "dac"))){1}, decorationpart (infsupdec (3.141592653589793116e+00, 3.141592653589793560e+00, "dac")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (0.0, 0.0, "trv"), infsupdec (-2.0, 0.0, "com")), infsupdec (3.141592653589793116e+00, 3.141592653589793560e+00, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (0.0, 0.0, "trv"), infsupdec (-2.0, 0.0, "com"))){1}, decorationpart (infsupdec (3.141592653589793116e+00, 3.141592653589793560e+00, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (0.0, 0.0, "com"), infsupdec (-2.0, -0.0, "trv")), infsupdec (3.141592653589793116e+00, 3.141592653589793560e+00, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (0.0, 0.0, "com"), infsupdec (-2.0, -0.0, "trv"))){1}, decorationpart (infsupdec (3.141592653589793116e+00, 3.141592653589793560e+00, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (0.0, 0.0, "dac"), infsupdec (-2.0, 1.0, "def")), infsupdec (0.0, 3.141592653589793560e+00, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (0.0, 0.0, "dac"), infsupdec (-2.0, 1.0, "def"))){1}, decorationpart (infsupdec (0.0, 3.141592653589793560e+00, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (0.0, 0.0, "def"), infsupdec (0.0, 1.0, "com")), infsupdec (0.0, 0.0, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (0.0, 0.0, "def"), infsupdec (0.0, 1.0, "com"))){1}, decorationpart (infsupdec (0.0, 0.0, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (0.0, 0.0, "trv"), infsupdec (-0.0, 1.0, "dac")), infsupdec (0.0, 0.0, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (0.0, 0.0, "trv"), infsupdec (-0.0, 1.0, "dac"))){1}, decorationpart (infsupdec (0.0, 0.0, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (0.0, 0.0, "com"), infsupdec (0.1, 1.0, "com")), infsupdec (0.0, 0.0, "com")));
%! assert (isequal (decorationpart (atan2 (infsupdec (0.0, 0.0, "com"), infsupdec (0.1, 1.0, "com"))){1}, decorationpart (infsupdec (0.0, 0.0, "com")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (-0.0, 0.0, "com"), infsupdec (empty, "trv")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (-0.0, 0.0, "com"), infsupdec (empty, "trv"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (-0.0, 0.0, "dac"), infsupdec (entire, "def")), infsupdec (0.0, 3.141592653589793560e+00, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (-0.0, 0.0, "dac"), infsupdec (entire, "def"))){1}, decorationpart (infsupdec (0.0, 3.141592653589793560e+00, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (-0.0, 0.0, "def"), infsupdec (0.0, 0.0, "com")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (-0.0, 0.0, "def"), infsupdec (0.0, 0.0, "com"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (-0.0, 0.0, "trv"), infsupdec (-0.0, 0.0, "trv")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (-0.0, 0.0, "trv"), infsupdec (-0.0, 0.0, "trv"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (-0.0, 0.0, "com"), infsupdec (0.0, -0.0, "def")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (-0.0, 0.0, "com"), infsupdec (0.0, -0.0, "def"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (-0.0, 0.0, "dac"), infsupdec (-0.0, -0.0, "com")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (-0.0, 0.0, "dac"), infsupdec (-0.0, -0.0, "com"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (-0.0, 0.0, "dac"), infsupdec (-2.0, -0.1, "dac")), infsupdec (3.141592653589793116e+00, 3.141592653589793560e+00, "dac")));
%! assert (isequal (decorationpart (atan2 (infsupdec (-0.0, 0.0, "dac"), infsupdec (-2.0, -0.1, "dac"))){1}, decorationpart (infsupdec (3.141592653589793116e+00, 3.141592653589793560e+00, "dac")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (-0.0, 0.0, "trv"), infsupdec (-2.0, 0.0, "com")), infsupdec (3.141592653589793116e+00, 3.141592653589793560e+00, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (-0.0, 0.0, "trv"), infsupdec (-2.0, 0.0, "com"))){1}, decorationpart (infsupdec (3.141592653589793116e+00, 3.141592653589793560e+00, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (-0.0, 0.0, "com"), infsupdec (-2.0, -0.0, "trv")), infsupdec (3.141592653589793116e+00, 3.141592653589793560e+00, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (-0.0, 0.0, "com"), infsupdec (-2.0, -0.0, "trv"))){1}, decorationpart (infsupdec (3.141592653589793116e+00, 3.141592653589793560e+00, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (-0.0, 0.0, "dac"), infsupdec (-2.0, 1.0, "def")), infsupdec (0.0, 3.141592653589793560e+00, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (-0.0, 0.0, "dac"), infsupdec (-2.0, 1.0, "def"))){1}, decorationpart (infsupdec (0.0, 3.141592653589793560e+00, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (-0.0, 0.0, "com"), infsupdec (0.0, 1.0, "com")), infsupdec (0.0, 0.0, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (-0.0, 0.0, "com"), infsupdec (0.0, 1.0, "com"))){1}, decorationpart (infsupdec (0.0, 0.0, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (-0.0, 0.0, "def"), infsupdec (-0.0, 1.0, "dac")), infsupdec (0.0, 0.0, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (-0.0, 0.0, "def"), infsupdec (-0.0, 1.0, "dac"))){1}, decorationpart (infsupdec (0.0, 0.0, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (-0.0, 0.0, "com"), infsupdec (0.1, 1.0, "com")), infsupdec (0.0, 0.0, "com")));
%! assert (isequal (decorationpart (atan2 (infsupdec (-0.0, 0.0, "com"), infsupdec (0.1, 1.0, "com"))){1}, decorationpart (infsupdec (0.0, 0.0, "com")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (0.0, -0.0, "com"), infsupdec (empty, "trv")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (0.0, -0.0, "com"), infsupdec (empty, "trv"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (0.0, -0.0, "dac"), infsupdec (entire, "def")), infsupdec (0.0, 3.141592653589793560e+00, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (0.0, -0.0, "dac"), infsupdec (entire, "def"))){1}, decorationpart (infsupdec (0.0, 3.141592653589793560e+00, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (0.0, -0.0, "def"), infsupdec (0.0, 0.0, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (0.0, -0.0, "def"), infsupdec (0.0, 0.0, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (0.0, -0.0, "trv"), infsupdec (-0.0, 0.0, "com")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (0.0, -0.0, "trv"), infsupdec (-0.0, 0.0, "com"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (0.0, -0.0, "dac"), infsupdec (0.0, -0.0, "def")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (0.0, -0.0, "dac"), infsupdec (0.0, -0.0, "def"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (0.0, -0.0, "com"), infsupdec (-0.0, -0.0, "trv")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (0.0, -0.0, "com"), infsupdec (-0.0, -0.0, "trv"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (0.0, -0.0, "com"), infsupdec (-2.0, -0.1, "dac")), infsupdec (3.141592653589793116e+00, 3.141592653589793560e+00, "dac")));
%! assert (isequal (decorationpart (atan2 (infsupdec (0.0, -0.0, "com"), infsupdec (-2.0, -0.1, "dac"))){1}, decorationpart (infsupdec (3.141592653589793116e+00, 3.141592653589793560e+00, "dac")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (0.0, -0.0, "def"), infsupdec (-2.0, 0.0, "com")), infsupdec (3.141592653589793116e+00, 3.141592653589793560e+00, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (0.0, -0.0, "def"), infsupdec (-2.0, 0.0, "com"))){1}, decorationpart (infsupdec (3.141592653589793116e+00, 3.141592653589793560e+00, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (0.0, -0.0, "com"), infsupdec (-2.0, -0.0, "dac")), infsupdec (3.141592653589793116e+00, 3.141592653589793560e+00, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (0.0, -0.0, "com"), infsupdec (-2.0, -0.0, "dac"))){1}, decorationpart (infsupdec (3.141592653589793116e+00, 3.141592653589793560e+00, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (0.0, -0.0, "dac"), infsupdec (-2.0, 1.0, "com")), infsupdec (0.0, 3.141592653589793560e+00, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (0.0, -0.0, "dac"), infsupdec (-2.0, 1.0, "com"))){1}, decorationpart (infsupdec (0.0, 3.141592653589793560e+00, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (0.0, -0.0, "com"), infsupdec (0.0, 1.0, "trv")), infsupdec (0.0, 0.0, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (0.0, -0.0, "com"), infsupdec (0.0, 1.0, "trv"))){1}, decorationpart (infsupdec (0.0, 0.0, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (0.0, -0.0, "def"), infsupdec (-0.0, 1.0, "com")), infsupdec (0.0, 0.0, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (0.0, -0.0, "def"), infsupdec (-0.0, 1.0, "com"))){1}, decorationpart (infsupdec (0.0, 0.0, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (0.0, -0.0, "com"), infsupdec (0.1, 1.0, "def")), infsupdec (0.0, 0.0, "def")));
%! assert (isequal (decorationpart (atan2 (infsupdec (0.0, -0.0, "com"), infsupdec (0.1, 1.0, "def"))){1}, decorationpart (infsupdec (0.0, 0.0, "def")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (-0.0, -0.0, "com"), infsupdec (empty, "trv")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (-0.0, -0.0, "com"), infsupdec (empty, "trv"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (-0.0, -0.0, "def"), infsupdec (entire, "def")), infsupdec (0.0, 3.141592653589793560e+00, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (-0.0, -0.0, "def"), infsupdec (entire, "def"))){1}, decorationpart (infsupdec (0.0, 3.141592653589793560e+00, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (-0.0, -0.0, "dac"), infsupdec (0.0, 0.0, "com")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (-0.0, -0.0, "dac"), infsupdec (0.0, 0.0, "com"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (-0.0, -0.0, "trv"), infsupdec (-0.0, 0.0, "def")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (-0.0, -0.0, "trv"), infsupdec (-0.0, 0.0, "def"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (-0.0, -0.0, "com"), infsupdec (0.0, -0.0, "trv")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (-0.0, -0.0, "com"), infsupdec (0.0, -0.0, "trv"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (-0.0, -0.0, "dac"), infsupdec (-0.0, -0.0, "com")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (-0.0, -0.0, "dac"), infsupdec (-0.0, -0.0, "com"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (-0.0, -0.0, "def"), infsupdec (-2.0, -0.1, "dac")), infsupdec (3.141592653589793116e+00, 3.141592653589793560e+00, "def")));
%! assert (isequal (decorationpart (atan2 (infsupdec (-0.0, -0.0, "def"), infsupdec (-2.0, -0.1, "dac"))){1}, decorationpart (infsupdec (3.141592653589793116e+00, 3.141592653589793560e+00, "def")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (-0.0, -0.0, "trv"), infsupdec (-2.0, 0.0, "def")), infsupdec (3.141592653589793116e+00, 3.141592653589793560e+00, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (-0.0, -0.0, "trv"), infsupdec (-2.0, 0.0, "def"))){1}, decorationpart (infsupdec (3.141592653589793116e+00, 3.141592653589793560e+00, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (-0.0, -0.0, "dac"), infsupdec (-2.0, -0.0, "trv")), infsupdec (3.141592653589793116e+00, 3.141592653589793560e+00, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (-0.0, -0.0, "dac"), infsupdec (-2.0, -0.0, "trv"))){1}, decorationpart (infsupdec (3.141592653589793116e+00, 3.141592653589793560e+00, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (-0.0, -0.0, "def"), infsupdec (-2.0, 1.0, "com")), infsupdec (0.0, 3.141592653589793560e+00, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (-0.0, -0.0, "def"), infsupdec (-2.0, 1.0, "com"))){1}, decorationpart (infsupdec (0.0, 3.141592653589793560e+00, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (-0.0, -0.0, "com"), infsupdec (0.0, 1.0, "com")), infsupdec (0.0, 0.0, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (-0.0, -0.0, "com"), infsupdec (0.0, 1.0, "com"))){1}, decorationpart (infsupdec (0.0, 0.0, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (-0.0, -0.0, "trv"), infsupdec (-0.0, 1.0, "dac")), infsupdec (0.0, 0.0, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (-0.0, -0.0, "trv"), infsupdec (-0.0, 1.0, "dac"))){1}, decorationpart (infsupdec (0.0, 0.0, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (-0.0, -0.0, "com"), infsupdec (0.1, 1.0, "com")), infsupdec (0.0, 0.0, "com")));
%! assert (isequal (decorationpart (atan2 (infsupdec (-0.0, -0.0, "com"), infsupdec (0.1, 1.0, "com"))){1}, decorationpart (infsupdec (0.0, 0.0, "com")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (-2.0, -0.1, "dac"), infsupdec (empty, "trv")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (-2.0, -0.1, "dac"), infsupdec (empty, "trv"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (-2.0, -0.1, "def"), infsupdec (entire, "def")), infsupdec (-3.141592653589793560e+00, 0.0, "def")));
%! assert (isequal (decorationpart (atan2 (infsupdec (-2.0, -0.1, "def"), infsupdec (entire, "def"))){1}, decorationpart (infsupdec (-3.141592653589793560e+00, 0.0, "def")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (-2.0, -0.1, "trv"), infsupdec (0.0, 0.0, "com")), infsupdec (-1.570796326794896780e+00, -1.570796326794896558e+00, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (-2.0, -0.1, "trv"), infsupdec (0.0, 0.0, "com"))){1}, decorationpart (infsupdec (-1.570796326794896780e+00, -1.570796326794896558e+00, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (-2.0, -0.1, "com"), infsupdec (0.0, -0.0, "dac")), infsupdec (-1.570796326794896780e+00, -1.570796326794896558e+00, "dac")));
%! assert (isequal (decorationpart (atan2 (infsupdec (-2.0, -0.1, "com"), infsupdec (0.0, -0.0, "dac"))){1}, decorationpart (infsupdec (-1.570796326794896780e+00, -1.570796326794896558e+00, "dac")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (-2.0, -0.1, "dac"), infsupdec (-0.0, 0.0, "def")), infsupdec (-1.570796326794896780e+00, -1.570796326794896558e+00, "def")));
%! assert (isequal (decorationpart (atan2 (infsupdec (-2.0, -0.1, "dac"), infsupdec (-0.0, 0.0, "def"))){1}, decorationpart (infsupdec (-1.570796326794896780e+00, -1.570796326794896558e+00, "def")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (-2.0, -0.1, "com"), infsupdec (0.0, -0.0, "trv")), infsupdec (-1.570796326794896780e+00, -1.570796326794896558e+00, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (-2.0, -0.1, "com"), infsupdec (0.0, -0.0, "trv"))){1}, decorationpart (infsupdec (-1.570796326794896780e+00, -1.570796326794896558e+00, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (-2.0, -0.1, "def"), infsupdec (-2.0, -0.1, "com")), infsupdec (-3.091634257867850621e+00, -1.620754722516839275e+00, "def")));
%! assert (isequal (decorationpart (atan2 (infsupdec (-2.0, -0.1, "def"), infsupdec (-2.0, -0.1, "com"))){1}, decorationpart (infsupdec (-3.091634257867850621e+00, -1.620754722516839275e+00, "def")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (-2.0, -0.1, "com"), infsupdec (-2.0, 0.0, "def")), infsupdec (-3.091634257867850621e+00, -1.570796326794896558e+00, "def")));
%! assert (isequal (decorationpart (atan2 (infsupdec (-2.0, -0.1, "com"), infsupdec (-2.0, 0.0, "def"))){1}, decorationpart (infsupdec (-3.091634257867850621e+00, -1.570796326794896558e+00, "def")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (-2.0, -0.1, "trv"), infsupdec (-2.0, -0.0, "dac")), infsupdec (-3.091634257867850621e+00, -1.570796326794896558e+00, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (-2.0, -0.1, "trv"), infsupdec (-2.0, -0.0, "dac"))){1}, decorationpart (infsupdec (-3.091634257867850621e+00, -1.570796326794896558e+00, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (-2.0, -0.1, "def"), infsupdec (-2.0, 1.0, "trv")), infsupdec (-3.091634257867850621e+00, -9.966865249116202419e-02, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (-2.0, -0.1, "def"), infsupdec (-2.0, 1.0, "trv"))){1}, decorationpart (infsupdec (-3.091634257867850621e+00, -9.966865249116202419e-02, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (-2.0, -0.1, "com"), infsupdec (0.0, 1.0, "def")), infsupdec (-1.570796326794896780e+00, -9.966865249116202419e-02, "def")));
%! assert (isequal (decorationpart (atan2 (infsupdec (-2.0, -0.1, "com"), infsupdec (0.0, 1.0, "def"))){1}, decorationpart (infsupdec (-1.570796326794896780e+00, -9.966865249116202419e-02, "def")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (-2.0, -0.1, "dac"), infsupdec (-0.0, 1.0, "com")), infsupdec (-1.570796326794896780e+00, -9.966865249116202419e-02, "dac")));
%! assert (isequal (decorationpart (atan2 (infsupdec (-2.0, -0.1, "dac"), infsupdec (-0.0, 1.0, "com"))){1}, decorationpart (infsupdec (-1.570796326794896780e+00, -9.966865249116202419e-02, "dac")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (-2.0, -0.1, "com"), infsupdec (0.1, 1.0, "com")), infsupdec (-1.520837931072954063e+00, -9.966865249116202419e-02, "com")));
%! assert (isequal (decorationpart (atan2 (infsupdec (-2.0, -0.1, "com"), infsupdec (0.1, 1.0, "com"))){1}, decorationpart (infsupdec (-1.520837931072954063e+00, -9.966865249116202419e-02, "com")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (-2.0, 0.0, "def"), infsupdec (empty, "trv")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (-2.0, 0.0, "def"), infsupdec (empty, "trv"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (-2.0, 0.0, "def"), infsupdec (entire, "def")), infsupdec (-3.141592653589793560e+00, 3.141592653589793560e+00, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (-2.0, 0.0, "def"), infsupdec (entire, "def"))){1}, decorationpart (infsupdec (-3.141592653589793560e+00, 3.141592653589793560e+00, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (-2.0, 0.0, "dac"), infsupdec (0.0, 0.0, "dac")), infsupdec (-1.570796326794896780e+00, -1.570796326794896558e+00, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (-2.0, 0.0, "dac"), infsupdec (0.0, 0.0, "dac"))){1}, decorationpart (infsupdec (-1.570796326794896780e+00, -1.570796326794896558e+00, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (-2.0, 0.0, "trv"), infsupdec (-0.0, 0.0, "com")), infsupdec (-1.570796326794896780e+00, -1.570796326794896558e+00, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (-2.0, 0.0, "trv"), infsupdec (-0.0, 0.0, "com"))){1}, decorationpart (infsupdec (-1.570796326794896780e+00, -1.570796326794896558e+00, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (-2.0, 0.0, "com"), infsupdec (0.0, -0.0, "trv")), infsupdec (-1.570796326794896780e+00, -1.570796326794896558e+00, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (-2.0, 0.0, "com"), infsupdec (0.0, -0.0, "trv"))){1}, decorationpart (infsupdec (-1.570796326794896780e+00, -1.570796326794896558e+00, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (-2.0, 0.0, "def"), infsupdec (-0.0, -0.0, "def")), infsupdec (-1.570796326794896780e+00, -1.570796326794896558e+00, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (-2.0, 0.0, "def"), infsupdec (-0.0, -0.0, "def"))){1}, decorationpart (infsupdec (-1.570796326794896780e+00, -1.570796326794896558e+00, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (-2.0, 0.0, "com"), infsupdec (-2.0, -0.1, "dac")), infsupdec (-3.141592653589793560e+00, 3.141592653589793560e+00, "def")));
%! assert (isequal (decorationpart (atan2 (infsupdec (-2.0, 0.0, "com"), infsupdec (-2.0, -0.1, "dac"))){1}, decorationpart (infsupdec (-3.141592653589793560e+00, 3.141592653589793560e+00, "def")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (-2.0, 0.0, "dac"), infsupdec (-2.0, 0.0, "com")), infsupdec (-3.141592653589793560e+00, 3.141592653589793560e+00, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (-2.0, 0.0, "dac"), infsupdec (-2.0, 0.0, "com"))){1}, decorationpart (infsupdec (-3.141592653589793560e+00, 3.141592653589793560e+00, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (-2.0, 0.0, "com"), infsupdec (-2.0, -0.0, "dac")), infsupdec (-3.141592653589793560e+00, 3.141592653589793560e+00, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (-2.0, 0.0, "com"), infsupdec (-2.0, -0.0, "dac"))){1}, decorationpart (infsupdec (-3.141592653589793560e+00, 3.141592653589793560e+00, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (-2.0, 0.0, "trv"), infsupdec (-2.0, 1.0, "com")), infsupdec (-3.141592653589793560e+00, 3.141592653589793560e+00, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (-2.0, 0.0, "trv"), infsupdec (-2.0, 1.0, "com"))){1}, decorationpart (infsupdec (-3.141592653589793560e+00, 3.141592653589793560e+00, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (-2.0, 0.0, "def"), infsupdec (0.0, 1.0, "def")), infsupdec (-1.570796326794896780e+00, 0.0, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (-2.0, 0.0, "def"), infsupdec (0.0, 1.0, "def"))){1}, decorationpart (infsupdec (-1.570796326794896780e+00, 0.0, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (-2.0, 0.0, "com"), infsupdec (-0.0, 1.0, "dac")), infsupdec (-1.570796326794896780e+00, 0.0, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (-2.0, 0.0, "com"), infsupdec (-0.0, 1.0, "dac"))){1}, decorationpart (infsupdec (-1.570796326794896780e+00, 0.0, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (-2.0, 0.0, "com"), infsupdec (0.1, 1.0, "com")), infsupdec (-1.520837931072954063e+00, 0.0, "com")));
%! assert (isequal (decorationpart (atan2 (infsupdec (-2.0, 0.0, "com"), infsupdec (0.1, 1.0, "com"))){1}, decorationpart (infsupdec (-1.520837931072954063e+00, 0.0, "com")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (-2.0, -0.0, "trv"), infsupdec (empty, "trv")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (-2.0, -0.0, "trv"), infsupdec (empty, "trv"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (-2.0, -0.0, "dac"), infsupdec (entire, "def")), infsupdec (-3.141592653589793560e+00, 3.141592653589793560e+00, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (-2.0, -0.0, "dac"), infsupdec (entire, "def"))){1}, decorationpart (infsupdec (-3.141592653589793560e+00, 3.141592653589793560e+00, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (-2.0, -0.0, "com"), infsupdec (0.0, 0.0, "com")), infsupdec (-1.570796326794896780e+00, -1.570796326794896558e+00, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (-2.0, -0.0, "com"), infsupdec (0.0, 0.0, "com"))){1}, decorationpart (infsupdec (-1.570796326794896780e+00, -1.570796326794896558e+00, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (-2.0, -0.0, "def"), infsupdec (-0.0, 0.0, "dac")), infsupdec (-1.570796326794896780e+00, -1.570796326794896558e+00, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (-2.0, -0.0, "def"), infsupdec (-0.0, 0.0, "dac"))){1}, decorationpart (infsupdec (-1.570796326794896780e+00, -1.570796326794896558e+00, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (-2.0, -0.0, "dac"), infsupdec (0.0, -0.0, "def")), infsupdec (-1.570796326794896780e+00, -1.570796326794896558e+00, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (-2.0, -0.0, "dac"), infsupdec (0.0, -0.0, "def"))){1}, decorationpart (infsupdec (-1.570796326794896780e+00, -1.570796326794896558e+00, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (-2.0, -0.0, "com"), infsupdec (-0.0, -0.0, "trv")), infsupdec (-1.570796326794896780e+00, -1.570796326794896558e+00, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (-2.0, -0.0, "com"), infsupdec (-0.0, -0.0, "trv"))){1}, decorationpart (infsupdec (-1.570796326794896780e+00, -1.570796326794896558e+00, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (-2.0, -0.0, "def"), infsupdec (-2.0, -0.1, "com")), infsupdec (-3.141592653589793560e+00, 3.141592653589793560e+00, "def")));
%! assert (isequal (decorationpart (atan2 (infsupdec (-2.0, -0.0, "def"), infsupdec (-2.0, -0.1, "com"))){1}, decorationpart (infsupdec (-3.141592653589793560e+00, 3.141592653589793560e+00, "def")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (-2.0, -0.0, "com"), infsupdec (-2.0, 0.0, "dac")), infsupdec (-3.141592653589793560e+00, 3.141592653589793560e+00, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (-2.0, -0.0, "com"), infsupdec (-2.0, 0.0, "dac"))){1}, decorationpart (infsupdec (-3.141592653589793560e+00, 3.141592653589793560e+00, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (-2.0, -0.0, "dac"), infsupdec (-2.0, -0.0, "def")), infsupdec (-3.141592653589793560e+00, 3.141592653589793560e+00, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (-2.0, -0.0, "dac"), infsupdec (-2.0, -0.0, "def"))){1}, decorationpart (infsupdec (-3.141592653589793560e+00, 3.141592653589793560e+00, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (-2.0, -0.0, "def"), infsupdec (-2.0, 1.0, "trv")), infsupdec (-3.141592653589793560e+00, 3.141592653589793560e+00, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (-2.0, -0.0, "def"), infsupdec (-2.0, 1.0, "trv"))){1}, decorationpart (infsupdec (-3.141592653589793560e+00, 3.141592653589793560e+00, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (-2.0, -0.0, "trv"), infsupdec (0.0, 1.0, "dac")), infsupdec (-1.570796326794896780e+00, 0.0, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (-2.0, -0.0, "trv"), infsupdec (0.0, 1.0, "dac"))){1}, decorationpart (infsupdec (-1.570796326794896780e+00, 0.0, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (-2.0, -0.0, "com"), infsupdec (-0.0, 1.0, "com")), infsupdec (-1.570796326794896780e+00, 0.0, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (-2.0, -0.0, "com"), infsupdec (-0.0, 1.0, "com"))){1}, decorationpart (infsupdec (-1.570796326794896780e+00, 0.0, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (-2.0, -0.0, "com"), infsupdec (0.1, 1.0, "com")), infsupdec (-1.520837931072954063e+00, 0.0, "com")));
%! assert (isequal (decorationpart (atan2 (infsupdec (-2.0, -0.0, "com"), infsupdec (0.1, 1.0, "com"))){1}, decorationpart (infsupdec (-1.520837931072954063e+00, 0.0, "com")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (-2.0, 1.0, "def"), infsupdec (empty, "trv")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (-2.0, 1.0, "def"), infsupdec (empty, "trv"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (-2.0, 1.0, "dac"), infsupdec (entire, "def")), infsupdec (-3.141592653589793560e+00, 3.141592653589793560e+00, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (-2.0, 1.0, "dac"), infsupdec (entire, "def"))){1}, decorationpart (infsupdec (-3.141592653589793560e+00, 3.141592653589793560e+00, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (-2.0, 1.0, "def"), infsupdec (0.0, 0.0, "def")), infsupdec (-1.570796326794896780e+00, 1.570796326794896780e+00, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (-2.0, 1.0, "def"), infsupdec (0.0, 0.0, "def"))){1}, decorationpart (infsupdec (-1.570796326794896780e+00, 1.570796326794896780e+00, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (-2.0, 1.0, "com"), infsupdec (-0.0, 0.0, "dac")), infsupdec (-1.570796326794896780e+00, 1.570796326794896780e+00, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (-2.0, 1.0, "com"), infsupdec (-0.0, 0.0, "dac"))){1}, decorationpart (infsupdec (-1.570796326794896780e+00, 1.570796326794896780e+00, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (-2.0, 1.0, "trv"), infsupdec (0.0, -0.0, "trv")), infsupdec (-1.570796326794896780e+00, 1.570796326794896780e+00, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (-2.0, 1.0, "trv"), infsupdec (0.0, -0.0, "trv"))){1}, decorationpart (infsupdec (-1.570796326794896780e+00, 1.570796326794896780e+00, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (-2.0, 1.0, "com"), infsupdec (-0.0, -0.0, "com")), infsupdec (-1.570796326794896780e+00, 1.570796326794896780e+00, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (-2.0, 1.0, "com"), infsupdec (-0.0, -0.0, "com"))){1}, decorationpart (infsupdec (-1.570796326794896780e+00, 1.570796326794896780e+00, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (-2.0, 1.0, "dac"), infsupdec (-2.0, -0.1, "dac")), infsupdec (-3.141592653589793560e+00, 3.141592653589793560e+00, "def")));
%! assert (isequal (decorationpart (atan2 (infsupdec (-2.0, 1.0, "dac"), infsupdec (-2.0, -0.1, "dac"))){1}, decorationpart (infsupdec (-3.141592653589793560e+00, 3.141592653589793560e+00, "def")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (-2.0, 1.0, "def"), infsupdec (-2.0, 0.0, "def")), infsupdec (-3.141592653589793560e+00, 3.141592653589793560e+00, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (-2.0, 1.0, "def"), infsupdec (-2.0, 0.0, "def"))){1}, decorationpart (infsupdec (-3.141592653589793560e+00, 3.141592653589793560e+00, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (-2.0, 1.0, "trv"), infsupdec (-2.0, -0.0, "trv")), infsupdec (-3.141592653589793560e+00, 3.141592653589793560e+00, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (-2.0, 1.0, "trv"), infsupdec (-2.0, -0.0, "trv"))){1}, decorationpart (infsupdec (-3.141592653589793560e+00, 3.141592653589793560e+00, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (-2.0, 1.0, "dac"), infsupdec (-2.0, 1.0, "com")), infsupdec (-3.141592653589793560e+00, 3.141592653589793560e+00, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (-2.0, 1.0, "dac"), infsupdec (-2.0, 1.0, "com"))){1}, decorationpart (infsupdec (-3.141592653589793560e+00, 3.141592653589793560e+00, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (-2.0, 1.0, "com"), infsupdec (0.0, 1.0, "dac")), infsupdec (-1.570796326794896780e+00, 1.570796326794896780e+00, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (-2.0, 1.0, "com"), infsupdec (0.0, 1.0, "dac"))){1}, decorationpart (infsupdec (-1.570796326794896780e+00, 1.570796326794896780e+00, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (-2.0, 1.0, "trv"), infsupdec (-0.0, 1.0, "dac")), infsupdec (-1.570796326794896780e+00, 1.570796326794896780e+00, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (-2.0, 1.0, "trv"), infsupdec (-0.0, 1.0, "dac"))){1}, decorationpart (infsupdec (-1.570796326794896780e+00, 1.570796326794896780e+00, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (-2.0, 1.0, "com"), infsupdec (0.1, 1.0, "com")), infsupdec (-1.520837931072954063e+00, 1.471127674303734700e+00, "com")));
%! assert (isequal (decorationpart (atan2 (infsupdec (-2.0, 1.0, "com"), infsupdec (0.1, 1.0, "com"))){1}, decorationpart (infsupdec (-1.520837931072954063e+00, 1.471127674303734700e+00, "com")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (-0.0, 1.0, "com"), infsupdec (empty, "trv")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (-0.0, 1.0, "com"), infsupdec (empty, "trv"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (-0.0, 1.0, "dac"), infsupdec (entire, "def")), infsupdec (0.0, 3.141592653589793560e+00, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (-0.0, 1.0, "dac"), infsupdec (entire, "def"))){1}, decorationpart (infsupdec (0.0, 3.141592653589793560e+00, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (-0.0, 1.0, "def"), infsupdec (0.0, 0.0, "def")), infsupdec (1.570796326794896558e+00, 1.570796326794896780e+00, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (-0.0, 1.0, "def"), infsupdec (0.0, 0.0, "def"))){1}, decorationpart (infsupdec (1.570796326794896558e+00, 1.570796326794896780e+00, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (-0.0, 1.0, "trv"), infsupdec (-0.0, 0.0, "trv")), infsupdec (1.570796326794896558e+00, 1.570796326794896780e+00, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (-0.0, 1.0, "trv"), infsupdec (-0.0, 0.0, "trv"))){1}, decorationpart (infsupdec (1.570796326794896558e+00, 1.570796326794896780e+00, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (-0.0, 1.0, "dac"), infsupdec (0.0, -0.0, "dac")), infsupdec (1.570796326794896558e+00, 1.570796326794896780e+00, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (-0.0, 1.0, "dac"), infsupdec (0.0, -0.0, "dac"))){1}, decorationpart (infsupdec (1.570796326794896558e+00, 1.570796326794896780e+00, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (-0.0, 1.0, "com"), infsupdec (-0.0, -0.0, "def")), infsupdec (1.570796326794896558e+00, 1.570796326794896780e+00, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (-0.0, 1.0, "com"), infsupdec (-0.0, -0.0, "def"))){1}, decorationpart (infsupdec (1.570796326794896558e+00, 1.570796326794896780e+00, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (-0.0, 1.0, "com"), infsupdec (-2.0, -0.1, "com")), infsupdec (1.670464979286058638e+00, 3.141592653589793560e+00, "dac")));
%! assert (isequal (decorationpart (atan2 (infsupdec (-0.0, 1.0, "com"), infsupdec (-2.0, -0.1, "com"))){1}, decorationpart (infsupdec (1.670464979286058638e+00, 3.141592653589793560e+00, "dac")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (-0.0, 1.0, "def"), infsupdec (-2.0, 0.0, "com")), infsupdec (1.570796326794896558e+00, 3.141592653589793560e+00, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (-0.0, 1.0, "def"), infsupdec (-2.0, 0.0, "com"))){1}, decorationpart (infsupdec (1.570796326794896558e+00, 3.141592653589793560e+00, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (-0.0, 1.0, "def"), infsupdec (-2.0, -0.0, "def")), infsupdec (1.570796326794896558e+00, 3.141592653589793560e+00, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (-0.0, 1.0, "def"), infsupdec (-2.0, -0.0, "def"))){1}, decorationpart (infsupdec (1.570796326794896558e+00, 3.141592653589793560e+00, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (-0.0, 1.0, "dac"), infsupdec (-2.0, 1.0, "dac")), infsupdec (0.0, 3.141592653589793560e+00, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (-0.0, 1.0, "dac"), infsupdec (-2.0, 1.0, "dac"))){1}, decorationpart (infsupdec (0.0, 3.141592653589793560e+00, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (-0.0, 1.0, "dac"), infsupdec (0.0, 1.0, "dac")), infsupdec (0.0, 1.570796326794896780e+00, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (-0.0, 1.0, "dac"), infsupdec (0.0, 1.0, "dac"))){1}, decorationpart (infsupdec (0.0, 1.570796326794896780e+00, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (-0.0, 1.0, "trv"), infsupdec (-0.0, 1.0, "com")), infsupdec (0.0, 1.570796326794896780e+00, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (-0.0, 1.0, "trv"), infsupdec (-0.0, 1.0, "com"))){1}, decorationpart (infsupdec (0.0, 1.570796326794896780e+00, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (-0.0, 1.0, "trv"), infsupdec (0.1, 1.0, "com")), infsupdec (0.0, 1.471127674303734700e+00, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (-0.0, 1.0, "trv"), infsupdec (0.1, 1.0, "com"))){1}, decorationpart (infsupdec (0.0, 1.471127674303734700e+00, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (0.0, 1.0, "def"), infsupdec (empty, "trv")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (0.0, 1.0, "def"), infsupdec (empty, "trv"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (0.0, 1.0, "dac"), infsupdec (entire, "def")), infsupdec (0.0, 3.141592653589793560e+00, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (0.0, 1.0, "dac"), infsupdec (entire, "def"))){1}, decorationpart (infsupdec (0.0, 3.141592653589793560e+00, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (0.0, 1.0, "dac"), infsupdec (0.0, 0.0, "def")), infsupdec (1.570796326794896558e+00, 1.570796326794896780e+00, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (0.0, 1.0, "dac"), infsupdec (0.0, 0.0, "def"))){1}, decorationpart (infsupdec (1.570796326794896558e+00, 1.570796326794896780e+00, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (0.0, 1.0, "trv"), infsupdec (-0.0, 0.0, "trv")), infsupdec (1.570796326794896558e+00, 1.570796326794896780e+00, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (0.0, 1.0, "trv"), infsupdec (-0.0, 0.0, "trv"))){1}, decorationpart (infsupdec (1.570796326794896558e+00, 1.570796326794896780e+00, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (0.0, 1.0, "trv"), infsupdec (0.0, -0.0, "dac")), infsupdec (1.570796326794896558e+00, 1.570796326794896780e+00, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (0.0, 1.0, "trv"), infsupdec (0.0, -0.0, "dac"))){1}, decorationpart (infsupdec (1.570796326794896558e+00, 1.570796326794896780e+00, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (0.0, 1.0, "def"), infsupdec (-0.0, -0.0, "com")), infsupdec (1.570796326794896558e+00, 1.570796326794896780e+00, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (0.0, 1.0, "def"), infsupdec (-0.0, -0.0, "com"))){1}, decorationpart (infsupdec (1.570796326794896558e+00, 1.570796326794896780e+00, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (0.0, 1.0, "dac"), infsupdec (-2.0, -0.1, "dac")), infsupdec (1.670464979286058638e+00, 3.141592653589793560e+00, "dac")));
%! assert (isequal (decorationpart (atan2 (infsupdec (0.0, 1.0, "dac"), infsupdec (-2.0, -0.1, "dac"))){1}, decorationpart (infsupdec (1.670464979286058638e+00, 3.141592653589793560e+00, "dac")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (0.0, 1.0, "def"), infsupdec (-2.0, 0.0, "trv")), infsupdec (1.570796326794896558e+00, 3.141592653589793560e+00, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (0.0, 1.0, "def"), infsupdec (-2.0, 0.0, "trv"))){1}, decorationpart (infsupdec (1.570796326794896558e+00, 3.141592653589793560e+00, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (0.0, 1.0, "dac"), infsupdec (-2.0, -0.0, "dac")), infsupdec (1.570796326794896558e+00, 3.141592653589793560e+00, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (0.0, 1.0, "dac"), infsupdec (-2.0, -0.0, "dac"))){1}, decorationpart (infsupdec (1.570796326794896558e+00, 3.141592653589793560e+00, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (0.0, 1.0, "dac"), infsupdec (-2.0, 1.0, "def")), infsupdec (0.0, 3.141592653589793560e+00, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (0.0, 1.0, "dac"), infsupdec (-2.0, 1.0, "def"))){1}, decorationpart (infsupdec (0.0, 3.141592653589793560e+00, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (0.0, 1.0, "dac"), infsupdec (0.0, 1.0, "trv")), infsupdec (0.0, 1.570796326794896780e+00, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (0.0, 1.0, "dac"), infsupdec (0.0, 1.0, "trv"))){1}, decorationpart (infsupdec (0.0, 1.570796326794896780e+00, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (0.0, 1.0, "dac"), infsupdec (-0.0, 1.0, "def")), infsupdec (0.0, 1.570796326794896780e+00, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (0.0, 1.0, "dac"), infsupdec (-0.0, 1.0, "def"))){1}, decorationpart (infsupdec (0.0, 1.570796326794896780e+00, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (0.0, 1.0, "com"), infsupdec (0.1, 1.0, "com")), infsupdec (0.0, 1.471127674303734700e+00, "com")));
%! assert (isequal (decorationpart (atan2 (infsupdec (0.0, 1.0, "com"), infsupdec (0.1, 1.0, "com"))){1}, decorationpart (infsupdec (0.0, 1.471127674303734700e+00, "com")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (0.1, 1.0, "dac"), infsupdec (empty, "trv")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (0.1, 1.0, "dac"), infsupdec (empty, "trv"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (0.1, 1.0, "dac"), infsupdec (entire, "def")), infsupdec (0.0, 3.141592653589793560e+00, "def")));
%! assert (isequal (decorationpart (atan2 (infsupdec (0.1, 1.0, "dac"), infsupdec (entire, "def"))){1}, decorationpart (infsupdec (0.0, 3.141592653589793560e+00, "def")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (0.1, 1.0, "def"), infsupdec (0.0, 0.0, "com")), infsupdec (1.570796326794896558e+00, 1.570796326794896780e+00, "def")));
%! assert (isequal (decorationpart (atan2 (infsupdec (0.1, 1.0, "def"), infsupdec (0.0, 0.0, "com"))){1}, decorationpart (infsupdec (1.570796326794896558e+00, 1.570796326794896780e+00, "def")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (0.1, 1.0, "trv"), infsupdec (-0.0, 0.0, "def")), infsupdec (1.570796326794896558e+00, 1.570796326794896780e+00, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (0.1, 1.0, "trv"), infsupdec (-0.0, 0.0, "def"))){1}, decorationpart (infsupdec (1.570796326794896558e+00, 1.570796326794896780e+00, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (0.1, 1.0, "trv"), infsupdec (0.0, -0.0, "def")), infsupdec (1.570796326794896558e+00, 1.570796326794896780e+00, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (0.1, 1.0, "trv"), infsupdec (0.0, -0.0, "def"))){1}, decorationpart (infsupdec (1.570796326794896558e+00, 1.570796326794896780e+00, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (0.1, 1.0, "dac"), infsupdec (-0.0, -0.0, "def")), infsupdec (1.570796326794896558e+00, 1.570796326794896780e+00, "def")));
%! assert (isequal (decorationpart (atan2 (infsupdec (0.1, 1.0, "dac"), infsupdec (-0.0, -0.0, "def"))){1}, decorationpart (infsupdec (1.570796326794896558e+00, 1.570796326794896780e+00, "def")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (0.1, 1.0, "com"), infsupdec (-2.0, -0.1, "trv")), infsupdec (1.670464979286058638e+00, 3.091634257867850621e+00, "trv")));
%! assert (isequal (decorationpart (atan2 (infsupdec (0.1, 1.0, "com"), infsupdec (-2.0, -0.1, "trv"))){1}, decorationpart (infsupdec (1.670464979286058638e+00, 3.091634257867850621e+00, "trv")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (0.1, 1.0, "com"), infsupdec (-2.0, 0.0, "dac")), infsupdec (1.570796326794896558e+00, 3.091634257867850621e+00, "dac")));
%! assert (isequal (decorationpart (atan2 (infsupdec (0.1, 1.0, "com"), infsupdec (-2.0, 0.0, "dac"))){1}, decorationpart (infsupdec (1.570796326794896558e+00, 3.091634257867850621e+00, "dac")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (0.1, 1.0, "com"), infsupdec (-2.0, -0.0, "dac")), infsupdec (1.570796326794896558e+00, 3.091634257867850621e+00, "dac")));
%! assert (isequal (decorationpart (atan2 (infsupdec (0.1, 1.0, "com"), infsupdec (-2.0, -0.0, "dac"))){1}, decorationpart (infsupdec (1.570796326794896558e+00, 3.091634257867850621e+00, "dac")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (0.1, 1.0, "def"), infsupdec (-2.0, 1.0, "dac")), infsupdec (9.966865249116202419e-02, 3.091634257867850621e+00, "def")));
%! assert (isequal (decorationpart (atan2 (infsupdec (0.1, 1.0, "def"), infsupdec (-2.0, 1.0, "dac"))){1}, decorationpart (infsupdec (9.966865249116202419e-02, 3.091634257867850621e+00, "def")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (0.1, 1.0, "def"), infsupdec (0.0, 1.0, "def")), infsupdec (9.966865249116202419e-02, 1.570796326794896780e+00, "def")));
%! assert (isequal (decorationpart (atan2 (infsupdec (0.1, 1.0, "def"), infsupdec (0.0, 1.0, "def"))){1}, decorationpart (infsupdec (9.966865249116202419e-02, 1.570796326794896780e+00, "def")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (0.1, 1.0, "dac"), infsupdec (-0.0, 1.0, "def")), infsupdec (9.966865249116202419e-02, 1.570796326794896780e+00, "def")));
%! assert (isequal (decorationpart (atan2 (infsupdec (0.1, 1.0, "dac"), infsupdec (-0.0, 1.0, "def"))){1}, decorationpart (infsupdec (9.966865249116202419e-02, 1.570796326794896780e+00, "def")){1}));
%!test
%! assert (isequal (atan2 (infsupdec (0.1, 1.0, "dac"), infsupdec (0.1, 1.0, "def")), infsupdec (9.966865249116202419e-02, 1.471127674303734700e+00, "def")));
%! assert (isequal (decorationpart (atan2 (infsupdec (0.1, 1.0, "dac"), infsupdec (0.1, 1.0, "def"))){1}, decorationpart (infsupdec (9.966865249116202419e-02, 1.471127674303734700e+00, "def")){1}));

## minimal_sinh_test

%!test
%! assert (isequal (sinh (infsup), infsup));
%!test
%! assert (isequal (sinh (infsup (0.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (sinh (infsup (-0.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (sinh (infsup (-inf, 0.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (sinh (infsup (-inf, -0.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (sinh (infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (sinh (infsup (0.0, 0.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (sinh (infsup (-0.0, -0.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (sinh (infsup (1.0, 3.005632345000000214e+02)), infsup (1.175201193643801378e+00, 1.705784684221513993e+130)));
%!test
%! assert (isequal (sinh (infsup (-5.466754345546680298e+11, -5.658889722000000120e+02)), infsup (-inf, -2.893530074810801279e+245)));
%!test
%! assert (isequal (sinh (infsup (-1.100000000000000089e+00, 2.299999999999999822e+00)), infsup (-1.335647470124176950e+00, 4.936961805545958093e+00)));

## minimal_sinh_dec_test

%!test
%! assert (isequal (sinh (infsupdec (entire, "def")), infsupdec (entire, "def")));
%! assert (isequal (decorationpart (sinh (infsupdec (entire, "def"))){1}, decorationpart (infsupdec (entire, "def")){1}));
%!test
%! assert (isequal (sinh (infsupdec (0.0, inf, "dac")), infsupdec (0.0, inf, "dac")));
%! assert (isequal (decorationpart (sinh (infsupdec (0.0, inf, "dac"))){1}, decorationpart (infsupdec (0.0, inf, "dac")){1}));
%!test
%! assert (isequal (sinh (infsupdec (-inf, 0.0, "def")), infsupdec (-inf, 0.0, "def")));
%! assert (isequal (decorationpart (sinh (infsupdec (-inf, 0.0, "def"))){1}, decorationpart (infsupdec (-inf, 0.0, "def")){1}));
%!test
%! assert (isequal (sinh (infsupdec (1.0, 3.005632345000000214e+02, "com")), infsupdec (1.175201193643801378e+00, 1.705784684221513993e+130, "com")));
%! assert (isequal (decorationpart (sinh (infsupdec (1.0, 3.005632345000000214e+02, "com"))){1}, decorationpart (infsupdec (1.175201193643801378e+00, 1.705784684221513993e+130, "com")){1}));
%!test
%! assert (isequal (sinh (infsupdec (-5.466754345546680298e+11, -5.658889722000000120e+02, "com")), infsupdec (-inf, -2.893530074810801279e+245, "dac")));
%! assert (isequal (decorationpart (sinh (infsupdec (-5.466754345546680298e+11, -5.658889722000000120e+02, "com"))){1}, decorationpart (infsupdec (-inf, -2.893530074810801279e+245, "dac")){1}));

## minimal_cosh_test

%!test
%! assert (isequal (cosh (infsup), infsup));
%!test
%! assert (isequal (cosh (infsup (0.0, inf)), infsup (1.0, inf)));
%!test
%! assert (isequal (cosh (infsup (-0.0, inf)), infsup (1.0, inf)));
%!test
%! assert (isequal (cosh (infsup (-inf, 0.0)), infsup (1.0, inf)));
%!test
%! assert (isequal (cosh (infsup (-inf, -0.0)), infsup (1.0, inf)));
%!test
%! assert (isequal (cosh (infsup (-inf, inf)), infsup (1.0, inf)));
%!test
%! assert (isequal (cosh (infsup (0.0, 0.0)), infsup (1.0, 1.0)));
%!test
%! assert (isequal (cosh (infsup (-0.0, -0.0)), infsup (1.0, 1.0)));
%!test
%! assert (isequal (cosh (infsup (1.0, 3.005632345000000214e+02)), infsup (1.543080634815243712e+00, 1.705784684221513993e+130)));
%!test
%! assert (isequal (cosh (infsup (-5.466754345546680298e+11, -5.658889722000000120e+02)), infsup (2.893530074810801279e+245, inf)));
%!test
%! assert (isequal (cosh (infsup (-1.100000000000000089e+00, 2.299999999999999822e+00)), infsup (1.0, 5.037220649268761896e+00)));

## minimal_cosh_dec_test

%!test
%! assert (isequal (cosh (infsupdec (0.0, inf, "dac")), infsupdec (1.0, inf, "dac")));
%! assert (isequal (decorationpart (cosh (infsupdec (0.0, inf, "dac"))){1}, decorationpart (infsupdec (1.0, inf, "dac")){1}));
%!test
%! assert (isequal (cosh (infsupdec (-inf, 0.0, "def")), infsupdec (1.0, inf, "def")));
%! assert (isequal (decorationpart (cosh (infsupdec (-inf, 0.0, "def"))){1}, decorationpart (infsupdec (1.0, inf, "def")){1}));
%!test
%! assert (isequal (cosh (infsupdec (entire, "def")), infsupdec (1.0, inf, "def")));
%! assert (isequal (decorationpart (cosh (infsupdec (entire, "def"))){1}, decorationpart (infsupdec (1.0, inf, "def")){1}));
%!test
%! assert (isequal (cosh (infsupdec (1.0, 3.005632345000000214e+02, "def")), infsupdec (1.543080634815243712e+00, 1.705784684221513993e+130, "def")));
%! assert (isequal (decorationpart (cosh (infsupdec (1.0, 3.005632345000000214e+02, "def"))){1}, decorationpart (infsupdec (1.543080634815243712e+00, 1.705784684221513993e+130, "def")){1}));
%!test
%! assert (isequal (cosh (infsupdec (-5.466754345546680298e+11, -5.658889722000000120e+02, "com")), infsupdec (2.893530074810801279e+245, inf, "dac")));
%! assert (isequal (decorationpart (cosh (infsupdec (-5.466754345546680298e+11, -5.658889722000000120e+02, "com"))){1}, decorationpart (infsupdec (2.893530074810801279e+245, inf, "dac")){1}));

## minimal_tanh_test

%!test
%! assert (isequal (tanh (infsup), infsup));
%!test
%! assert (isequal (tanh (infsup (0.0, inf)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (tanh (infsup (-0.0, inf)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (tanh (infsup (-inf, 0.0)), infsup (-1.0, 0.0)));
%!test
%! assert (isequal (tanh (infsup (-inf, -0.0)), infsup (-1.0, 0.0)));
%!test
%! assert (isequal (tanh (infsup (-inf, inf)), infsup (-1.0, 1.0)));
%!test
%! assert (isequal (tanh (infsup (0.0, 0.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (tanh (infsup (-0.0, -0.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (tanh (infsup (1.0, 3.005632345000000214e+02)), infsup (7.615941559557648510e-01, 1.000000000000000000e+00)));
%!test
%! assert (isequal (tanh (infsup (-5.466754345546680298e+11, -5.658889722000000120e+02)), infsup (-1.000000000000000000e+00, -9.999999999999998890e-01)));
%!test
%! assert (isequal (tanh (infsup (-1.100000000000000089e+00, 2.299999999999999822e+00)), infsup (-8.004990217606298142e-01, 9.800963962661913831e-01)));

## minimal_tanh_dec_test

%!test
%! assert (isequal (tanh (infsupdec (0.0, inf, "dac")), infsupdec (0.0, 1.0, "dac")));
%! assert (isequal (decorationpart (tanh (infsupdec (0.0, inf, "dac"))){1}, decorationpart (infsupdec (0.0, 1.0, "dac")){1}));
%!test
%! assert (isequal (tanh (infsupdec (-inf, 0.0, "def")), infsupdec (-1.0, 0.0, "def")));
%! assert (isequal (decorationpart (tanh (infsupdec (-inf, 0.0, "def"))){1}, decorationpart (infsupdec (-1.0, 0.0, "def")){1}));
%!test
%! assert (isequal (tanh (infsupdec (entire, "def")), infsupdec (-1.0, 1.0, "def")));
%! assert (isequal (decorationpart (tanh (infsupdec (entire, "def"))){1}, decorationpart (infsupdec (-1.0, 1.0, "def")){1}));
%!test
%! assert (isequal (tanh (infsupdec (1.0, 3.005632345000000214e+02, "com")), infsupdec (7.615941559557648510e-01, 1.000000000000000000e+00, "com")));
%! assert (isequal (decorationpart (tanh (infsupdec (1.0, 3.005632345000000214e+02, "com"))){1}, decorationpart (infsupdec (7.615941559557648510e-01, 1.000000000000000000e+00, "com")){1}));
%!test
%! assert (isequal (tanh (infsupdec (-5.466754345546680298e+11, -5.658889722000000120e+02, "trv")), infsupdec (-1.000000000000000000e+00, -9.999999999999998890e-01, "trv")));
%! assert (isequal (decorationpart (tanh (infsupdec (-5.466754345546680298e+11, -5.658889722000000120e+02, "trv"))){1}, decorationpart (infsupdec (-1.000000000000000000e+00, -9.999999999999998890e-01, "trv")){1}));

## minimal_asinh_test

%!test
%! assert (isequal (asinh (infsup), infsup));
%!test
%! assert (isequal (asinh (infsup (0.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (asinh (infsup (-0.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (asinh (infsup (-inf, 0.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (asinh (infsup (-inf, -0.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (asinh (infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (asinh (infsup (0.0, 0.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (asinh (infsup (-0.0, -0.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (asinh (infsup (1.0, 3.005632345000000214e+02)), infsup (8.813735870195429367e-01, 6.398808110711462938e+00)));
%!test
%! assert (isequal (asinh (infsup (-5.466754345546680298e+11, -5.658889722000000120e+02)), infsup (-2.772026828834738765e+01, -7.031545858017159922e+00)));
%!test
%! assert (isequal (asinh (infsup (-1.100000000000000089e+00, 2.299999999999999822e+00)), infsup (-9.503469298211343341e-01, 1.570278543484978195e+00)));

## minimal_asinh_dec_test

%!test
%! assert (isequal (asinh (infsupdec (0.0, inf, "dac")), infsupdec (0.0, inf, "dac")));
%! assert (isequal (decorationpart (asinh (infsupdec (0.0, inf, "dac"))){1}, decorationpart (infsupdec (0.0, inf, "dac")){1}));
%!test
%! assert (isequal (asinh (infsupdec (-inf, 0.0, "trv")), infsupdec (-inf, 0.0, "trv")));
%! assert (isequal (decorationpart (asinh (infsupdec (-inf, 0.0, "trv"))){1}, decorationpart (infsupdec (-inf, 0.0, "trv")){1}));
%!test
%! assert (isequal (asinh (infsupdec (entire, "def")), infsupdec (entire, "def")));
%! assert (isequal (decorationpart (asinh (infsupdec (entire, "def"))){1}, decorationpart (infsupdec (entire, "def")){1}));
%!test
%! assert (isequal (asinh (infsupdec (1.0, 3.005632345000000214e+02, "com")), infsupdec (8.813735870195429367e-01, 6.398808110711462938e+00, "com")));
%! assert (isequal (decorationpart (asinh (infsupdec (1.0, 3.005632345000000214e+02, "com"))){1}, decorationpart (infsupdec (8.813735870195429367e-01, 6.398808110711462938e+00, "com")){1}));
%!test
%! assert (isequal (asinh (infsupdec (-5.466754345546680298e+11, -5.658889722000000120e+02, "def")), infsupdec (-2.772026828834738765e+01, -7.031545858017159922e+00, "def")));
%! assert (isequal (decorationpart (asinh (infsupdec (-5.466754345546680298e+11, -5.658889722000000120e+02, "def"))){1}, decorationpart (infsupdec (-2.772026828834738765e+01, -7.031545858017159922e+00, "def")){1}));

## minimal_acosh_test

%!test
%! assert (isequal (acosh (infsup), infsup));
%!test
%! assert (isequal (acosh (infsup (0.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (acosh (infsup (-0.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (acosh (infsup (1.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (acosh (infsup (-inf, 1.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (acosh (infsup (-inf, 9.999999999999998890e-01)), infsup));
%!test
%! assert (isequal (acosh (infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (acosh (infsup (1.0, 1.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (acosh (infsup (1.0, 3.005632345000000214e+02)), infsup (0.0, 6.398802575957843963e+00)));
%!test
%! assert (isequal (acosh (infsup (1.100000000000000089e+00, 2.299999999999999822e+00)), infsup (4.435682543851153792e-01, 1.475044781241425129e+00)));
%!test
%! assert (isequal (acosh (infsup (3.543445345434999763e+04, 7.777477475642000437e+08)), infsup (1.116858706759319908e+01, 2.116505997820545559e+01)));

## minimal_acosh_dec_test

%!test
%! assert (isequal (acosh (infsupdec (0.0, inf, "dac")), infsupdec (0.0, inf, "trv")));
%! assert (isequal (decorationpart (acosh (infsupdec (0.0, inf, "dac"))){1}, decorationpart (infsupdec (0.0, inf, "trv")){1}));
%!test
%! assert (isequal (acosh (infsupdec (1.0, inf, "dac")), infsupdec (0.0, inf, "dac")));
%! assert (isequal (decorationpart (acosh (infsupdec (1.0, inf, "dac"))){1}, decorationpart (infsupdec (0.0, inf, "dac")){1}));
%!test
%! assert (isequal (acosh (infsupdec (entire, "def")), infsupdec (0.0, inf, "trv")));
%! assert (isequal (decorationpart (acosh (infsupdec (entire, "def"))){1}, decorationpart (infsupdec (0.0, inf, "trv")){1}));
%!test
%! assert (isequal (acosh (infsupdec (1.0, 1.0, "com")), infsupdec (0.0, 0.0, "com")));
%! assert (isequal (decorationpart (acosh (infsupdec (1.0, 1.0, "com"))){1}, decorationpart (infsupdec (0.0, 0.0, "com")){1}));
%!test
%! assert (isequal (acosh (infsupdec (0.9, 1.0, "com")), infsupdec (0.0, 0.0, "trv")));
%! assert (isequal (decorationpart (acosh (infsupdec (0.9, 1.0, "com"))){1}, decorationpart (infsupdec (0.0, 0.0, "trv")){1}));
%!test
%! assert (isequal (acosh (infsupdec (1.0, 3.005632345000000214e+02, "dac")), infsupdec (0.0, 6.398802575957843963e+00, "dac")));
%! assert (isequal (decorationpart (acosh (infsupdec (1.0, 3.005632345000000214e+02, "dac"))){1}, decorationpart (infsupdec (0.0, 6.398802575957843963e+00, "dac")){1}));
%!test
%! assert (isequal (acosh (infsupdec (0.9, 3.005632345000000214e+02, "com")), infsupdec (0.0, 6.398802575957843963e+00, "trv")));
%! assert (isequal (decorationpart (acosh (infsupdec (0.9, 3.005632345000000214e+02, "com"))){1}, decorationpart (infsupdec (0.0, 6.398802575957843963e+00, "trv")){1}));
%!test
%! assert (isequal (acosh (infsupdec (3.543445345434999763e+04, 7.777477475642000437e+08, "def")), infsupdec (1.116858706759319908e+01, 2.116505997820545559e+01, "def")));
%! assert (isequal (decorationpart (acosh (infsupdec (3.543445345434999763e+04, 7.777477475642000437e+08, "def"))){1}, decorationpart (infsupdec (1.116858706759319908e+01, 2.116505997820545559e+01, "def")){1}));

## minimal_atanh_test

%!test
%! assert (isequal (atanh (infsup), infsup));
%!test
%! assert (isequal (atanh (infsup (0.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (atanh (infsup (-0.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (atanh (infsup (1.0, inf)), infsup));
%!test
%! assert (isequal (atanh (infsup (-inf, 0.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (atanh (infsup (-inf, -0.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (atanh (infsup (-inf, -1.0)), infsup));
%!test
%! assert (isequal (atanh (infsup (-1.0, 1.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (atanh (infsup (0.0, 0.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (atanh (infsup (-0.0, -0.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (atanh (infsup (-1.0, -1.0)), infsup));
%!test
%! assert (isequal (atanh (infsup (1.0, 1.0)), infsup));
%!test
%! assert (isequal (atanh (infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (atanh (infsup (3.242344999999999811e-01, 9.999999999999998890e-01)), infsup (3.363718566236145735e-01, 1.871497387511852395e+01)));
%!test
%! assert (isequal (atanh (infsup (-9.994549339999999615e-01, 1.000000000000000056e-01)), infsup (-4.103739140065865598e+00, 1.003353477310755942e-01)));

## minimal_atanh_dec_test

%!test
%! assert (isequal (atanh (infsupdec (0.0, inf, "dac")), infsupdec (0.0, inf, "trv")));
%! assert (isequal (decorationpart (atanh (infsupdec (0.0, inf, "dac"))){1}, decorationpart (infsupdec (0.0, inf, "trv")){1}));
%!test
%! assert (isequal (atanh (infsupdec (-inf, 0.0, "def")), infsupdec (-inf, 0.0, "trv")));
%! assert (isequal (decorationpart (atanh (infsupdec (-inf, 0.0, "def"))){1}, decorationpart (infsupdec (-inf, 0.0, "trv")){1}));
%!test
%! assert (isequal (atanh (infsupdec (-1.0, 1.0, "com")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (atanh (infsupdec (-1.0, 1.0, "com"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%!test
%! assert (isequal (atanh (infsupdec (0.0, 0.0, "com")), infsupdec (0.0, 0.0, "com")));
%! assert (isequal (decorationpart (atanh (infsupdec (0.0, 0.0, "com"))){1}, decorationpart (infsupdec (0.0, 0.0, "com")){1}));
%!test
%! assert (isequal (atanh (infsupdec (1.0, 1.0, "def")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (atanh (infsupdec (1.0, 1.0, "def"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (atanh (infsupdec (3.242344999999999811e-01, 9.999999999999998890e-01, "com")), infsupdec (3.363718566236145735e-01, 1.871497387511852395e+01, "com")));
%! assert (isequal (decorationpart (atanh (infsupdec (3.242344999999999811e-01, 9.999999999999998890e-01, "com"))){1}, decorationpart (infsupdec (3.363718566236145735e-01, 1.871497387511852395e+01, "com")){1}));
%!test
%! assert (isequal (atanh (infsupdec (-1.0, 9.999999999999998890e-01, "com")), infsupdec (-inf, 1.871497387511852395e+01, "trv")));
%! assert (isequal (decorationpart (atanh (infsupdec (-1.0, 9.999999999999998890e-01, "com"))){1}, decorationpart (infsupdec (-inf, 1.871497387511852395e+01, "trv")){1}));
%!test
%! assert (isequal (atanh (infsupdec (-9.994549339999999615e-01, 1.000000000000000056e-01, "def")), infsupdec (-4.103739140065865598e+00, 1.003353477310755942e-01, "def")));
%! assert (isequal (decorationpart (atanh (infsupdec (-9.994549339999999615e-01, 1.000000000000000056e-01, "def"))){1}, decorationpart (infsupdec (-4.103739140065865598e+00, 1.003353477310755942e-01, "def")){1}));
%!test
%! assert (isequal (atanh (infsupdec (-9.994549339999999615e-01, 1.0, "com")), infsupdec (-4.103739140065865598e+00, inf, "trv")));
%! assert (isequal (decorationpart (atanh (infsupdec (-9.994549339999999615e-01, 1.0, "com"))){1}, decorationpart (infsupdec (-4.103739140065865598e+00, inf, "trv")){1}));

## minimal_sign_test

%!test
%! assert (isequal (sign (infsup), infsup));
%!test
%! assert (isequal (sign (infsup (1.0, 2.0)), infsup (1.0, 1.0)));
%!test
%! assert (isequal (sign (infsup (-1.0, 2.0)), infsup (-1.0, 1.0)));
%!test
%! assert (isequal (sign (infsup (-1.0, 0.0)), infsup (-1.0, 0.0)));
%!test
%! assert (isequal (sign (infsup (0.0, 2.0)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (sign (infsup (-0.0, 2.0)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (sign (infsup (-5.0, -2.0)), infsup (-1.0, -1.0)));
%!test
%! assert (isequal (sign (infsup (0.0, 0.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (sign (infsup (-0.0, -0.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (sign (infsup (-0.0, 0.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (sign (infsup (-inf, inf)), infsup (-1.0, 1.0)));

## minimal_sign_dec_test

%!test
%! assert (isequal (sign (infsupdec (1.0, 2.0, "com")), infsupdec (1.0, 1.0, "com")));
%! assert (isequal (decorationpart (sign (infsupdec (1.0, 2.0, "com"))){1}, decorationpart (infsupdec (1.0, 1.0, "com")){1}));
%!test
%! assert (isequal (sign (infsupdec (-1.0, 2.0, "com")), infsupdec (-1.0, 1.0, "def")));
%! assert (isequal (decorationpart (sign (infsupdec (-1.0, 2.0, "com"))){1}, decorationpart (infsupdec (-1.0, 1.0, "def")){1}));
%!test
%! assert (isequal (sign (infsupdec (-1.0, 0.0, "com")), infsupdec (-1.0, 0.0, "def")));
%! assert (isequal (decorationpart (sign (infsupdec (-1.0, 0.0, "com"))){1}, decorationpart (infsupdec (-1.0, 0.0, "def")){1}));
%!test
%! assert (isequal (sign (infsupdec (0.0, 2.0, "com")), infsupdec (0.0, 1.0, "def")));
%! assert (isequal (decorationpart (sign (infsupdec (0.0, 2.0, "com"))){1}, decorationpart (infsupdec (0.0, 1.0, "def")){1}));
%!test
%! assert (isequal (sign (infsupdec (-0.0, 2.0, "def")), infsupdec (0.0, 1.0, "def")));
%! assert (isequal (decorationpart (sign (infsupdec (-0.0, 2.0, "def"))){1}, decorationpart (infsupdec (0.0, 1.0, "def")){1}));
%!test
%! assert (isequal (sign (infsupdec (-5.0, -2.0, "trv")), infsupdec (-1.0, -1.0, "trv")));
%! assert (isequal (decorationpart (sign (infsupdec (-5.0, -2.0, "trv"))){1}, decorationpart (infsupdec (-1.0, -1.0, "trv")){1}));
%!test
%! assert (isequal (sign (infsupdec (0.0, 0.0, "dac")), infsupdec (0.0, 0.0, "dac")));
%! assert (isequal (decorationpart (sign (infsupdec (0.0, 0.0, "dac"))){1}, decorationpart (infsupdec (0.0, 0.0, "dac")){1}));

## minimal_ceil_test

%!test
%! assert (isequal (ceil (infsup), infsup));
%!test
%! assert (isequal (ceil (infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (ceil (infsup (1.1, 2.0)), infsup (2.0, 2.0)));
%!test
%! assert (isequal (ceil (infsup (-1.1, 2.0)), infsup (-1.0, 2.0)));
%!test
%! assert (isequal (ceil (infsup (-1.1, 0.0)), infsup (-1.0, 0.0)));
%!test
%! assert (isequal (ceil (infsup (-1.1, -0.0)), infsup (-1.0, 0.0)));
%!test
%! assert (isequal (ceil (infsup (-1.1, -0.4)), infsup (-1.0, 0.0)));
%!test
%! assert (isequal (ceil (infsup (-1.9, 2.2)), infsup (-1.0, 3.0)));
%!test
%! assert (isequal (ceil (infsup (-1.0, 2.2)), infsup (-1.0, 3.0)));
%!test
%! assert (isequal (ceil (infsup (0.0, 2.2)), infsup (0.0, 3.0)));
%!test
%! assert (isequal (ceil (infsup (-0.0, 2.2)), infsup (0.0, 3.0)));
%!test
%! assert (isequal (ceil (infsup (-1.5, inf)), infsup (-1.0, inf)));
%!test
%! assert (isequal (ceil (infsup (1.797693134862315708e+308, inf)), infsup (1.797693134862315708e+308, inf)));
%!test
%! assert (isequal (ceil (infsup (-inf, 2.2)), infsup (-inf, 3.0)));
%!test
%! assert (isequal (ceil (infsup (-inf, -1.797693134862315708e+308)), infsup (-inf, -1.797693134862315708e+308)));

## minimal_ceil_dec_test

%!test
%! assert (isequal (ceil (infsupdec (1.1, 2.0, "com")), infsupdec (2.0, 2.0, "dac")));
%! assert (isequal (decorationpart (ceil (infsupdec (1.1, 2.0, "com"))){1}, decorationpart (infsupdec (2.0, 2.0, "dac")){1}));
%!test
%! assert (isequal (ceil (infsupdec (-1.1, 2.0, "com")), infsupdec (-1.0, 2.0, "def")));
%! assert (isequal (decorationpart (ceil (infsupdec (-1.1, 2.0, "com"))){1}, decorationpart (infsupdec (-1.0, 2.0, "def")){1}));
%!test
%! assert (isequal (ceil (infsupdec (-1.1, 0.0, "dac")), infsupdec (-1.0, 0.0, "def")));
%! assert (isequal (decorationpart (ceil (infsupdec (-1.1, 0.0, "dac"))){1}, decorationpart (infsupdec (-1.0, 0.0, "def")){1}));
%!test
%! assert (isequal (ceil (infsupdec (-1.1, -0.0, "trv")), infsupdec (-1.0, 0.0, "trv")));
%! assert (isequal (decorationpart (ceil (infsupdec (-1.1, -0.0, "trv"))){1}, decorationpart (infsupdec (-1.0, 0.0, "trv")){1}));
%!test
%! assert (isequal (ceil (infsupdec (-1.1, -0.4, "dac")), infsupdec (-1.0, 0.0, "def")));
%! assert (isequal (decorationpart (ceil (infsupdec (-1.1, -0.4, "dac"))){1}, decorationpart (infsupdec (-1.0, 0.0, "def")){1}));
%!test
%! assert (isequal (ceil (infsupdec (-1.9, 2.2, "com")), infsupdec (-1.0, 3.0, "def")));
%! assert (isequal (decorationpart (ceil (infsupdec (-1.9, 2.2, "com"))){1}, decorationpart (infsupdec (-1.0, 3.0, "def")){1}));
%!test
%! assert (isequal (ceil (infsupdec (-1.0, 2.2, "dac")), infsupdec (-1.0, 3.0, "def")));
%! assert (isequal (decorationpart (ceil (infsupdec (-1.0, 2.2, "dac"))){1}, decorationpart (infsupdec (-1.0, 3.0, "def")){1}));
%!test
%! assert (isequal (ceil (infsupdec (0.0, 2.2, "trv")), infsupdec (0.0, 3.0, "trv")));
%! assert (isequal (decorationpart (ceil (infsupdec (0.0, 2.2, "trv"))){1}, decorationpart (infsupdec (0.0, 3.0, "trv")){1}));
%!test
%! assert (isequal (ceil (infsupdec (-0.0, 2.2, "def")), infsupdec (0.0, 3.0, "def")));
%! assert (isequal (decorationpart (ceil (infsupdec (-0.0, 2.2, "def"))){1}, decorationpart (infsupdec (0.0, 3.0, "def")){1}));
%!test
%! assert (isequal (ceil (infsupdec (-1.5, inf, "trv")), infsupdec (-1.0, inf, "trv")));
%! assert (isequal (decorationpart (ceil (infsupdec (-1.5, inf, "trv"))){1}, decorationpart (infsupdec (-1.0, inf, "trv")){1}));
%!test
%! assert (isequal (ceil (infsupdec (1.797693134862315708e+308, inf, "dac")), infsupdec (1.797693134862315708e+308, inf, "def")));
%! assert (isequal (decorationpart (ceil (infsupdec (1.797693134862315708e+308, inf, "dac"))){1}, decorationpart (infsupdec (1.797693134862315708e+308, inf, "def")){1}));
%!test
%! assert (isequal (ceil (infsupdec (1.797693134862315708e+308, 1.797693134862315708e+308, "com")), infsupdec (1.797693134862315708e+308, 1.797693134862315708e+308, "dac")));
%! assert (isequal (decorationpart (ceil (infsupdec (1.797693134862315708e+308, 1.797693134862315708e+308, "com"))){1}, decorationpart (infsupdec (1.797693134862315708e+308, 1.797693134862315708e+308, "dac")){1}));
%!test
%! assert (isequal (ceil (infsupdec (-inf, 2.2, "trv")), infsupdec (-inf, 3.0, "trv")));
%! assert (isequal (decorationpart (ceil (infsupdec (-inf, 2.2, "trv"))){1}, decorationpart (infsupdec (-inf, 3.0, "trv")){1}));
%!test
%! assert (isequal (ceil (infsupdec (-inf, -1.797693134862315708e+308, "dac")), infsupdec (-inf, -1.797693134862315708e+308, "def")));
%! assert (isequal (decorationpart (ceil (infsupdec (-inf, -1.797693134862315708e+308, "dac"))){1}, decorationpart (infsupdec (-inf, -1.797693134862315708e+308, "def")){1}));

## minimal_floor_test

%!test
%! assert (isequal (floor (infsup), infsup));
%!test
%! assert (isequal (floor (infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (floor (infsup (1.1, 2.0)), infsup (1.0, 2.0)));
%!test
%! assert (isequal (floor (infsup (-1.1, 2.0)), infsup (-2.0, 2.0)));
%!test
%! assert (isequal (floor (infsup (-1.1, 0.0)), infsup (-2.0, 0.0)));
%!test
%! assert (isequal (floor (infsup (-1.1, -0.0)), infsup (-2.0, 0.0)));
%!test
%! assert (isequal (floor (infsup (-1.1, -0.4)), infsup (-2.0, -1.0)));
%!test
%! assert (isequal (floor (infsup (-1.9, 2.2)), infsup (-2.0, 2.0)));
%!test
%! assert (isequal (floor (infsup (-1.0, 2.2)), infsup (-1.0, 2.0)));
%!test
%! assert (isequal (floor (infsup (0.0, 2.2)), infsup (0.0, 2.0)));
%!test
%! assert (isequal (floor (infsup (-0.0, 2.2)), infsup (0.0, 2.0)));
%!test
%! assert (isequal (floor (infsup (-1.5, inf)), infsup (-2.0, inf)));
%!test
%! assert (isequal (floor (infsup (-inf, 2.2)), infsup (-inf, 2.0)));

## minimal_floor_dec_test

%!test
%! assert (isequal (floor (infsupdec (1.1, 2.0, "com")), infsupdec (1.0, 2.0, "def")));
%! assert (isequal (decorationpart (floor (infsupdec (1.1, 2.0, "com"))){1}, decorationpart (infsupdec (1.0, 2.0, "def")){1}));
%!test
%! assert (isequal (floor (infsupdec (-1.1, 2.0, "def")), infsupdec (-2.0, 2.0, "def")));
%! assert (isequal (decorationpart (floor (infsupdec (-1.1, 2.0, "def"))){1}, decorationpart (infsupdec (-2.0, 2.0, "def")){1}));
%!test
%! assert (isequal (floor (infsupdec (-1.1, 0.0, "dac")), infsupdec (-2.0, 0.0, "def")));
%! assert (isequal (decorationpart (floor (infsupdec (-1.1, 0.0, "dac"))){1}, decorationpart (infsupdec (-2.0, 0.0, "def")){1}));
%!test
%! assert (isequal (floor (infsupdec (-1.2, -1.1, "com")), infsupdec (-2.0, -2.0, "com")));
%! assert (isequal (decorationpart (floor (infsupdec (-1.2, -1.1, "com"))){1}, decorationpart (infsupdec (-2.0, -2.0, "com")){1}));
%!test
%! assert (isequal (floor (infsupdec (-1.1, -0.4, "def")), infsupdec (-2.0, -1.0, "def")));
%! assert (isequal (decorationpart (floor (infsupdec (-1.1, -0.4, "def"))){1}, decorationpart (infsupdec (-2.0, -1.0, "def")){1}));
%!test
%! assert (isequal (floor (infsupdec (-1.9, 2.2, "com")), infsupdec (-2.0, 2.0, "def")));
%! assert (isequal (decorationpart (floor (infsupdec (-1.9, 2.2, "com"))){1}, decorationpart (infsupdec (-2.0, 2.0, "def")){1}));
%!test
%! assert (isequal (floor (infsupdec (-1.0, 2.2, "trv")), infsupdec (-1.0, 2.0, "trv")));
%! assert (isequal (decorationpart (floor (infsupdec (-1.0, 2.2, "trv"))){1}, decorationpart (infsupdec (-1.0, 2.0, "trv")){1}));
%!test
%! assert (isequal (floor (infsupdec (0.0, 2.2, "trv")), infsupdec (0.0, 2.0, "trv")));
%! assert (isequal (decorationpart (floor (infsupdec (0.0, 2.2, "trv"))){1}, decorationpart (infsupdec (0.0, 2.0, "trv")){1}));
%!test
%! assert (isequal (floor (infsupdec (-0.0, 2.2, "com")), infsupdec (0.0, 2.0, "def")));
%! assert (isequal (decorationpart (floor (infsupdec (-0.0, 2.2, "com"))){1}, decorationpart (infsupdec (0.0, 2.0, "def")){1}));
%!test
%! assert (isequal (floor (infsupdec (-1.5, inf, "dac")), infsupdec (-2.0, inf, "def")));
%! assert (isequal (decorationpart (floor (infsupdec (-1.5, inf, "dac"))){1}, decorationpart (infsupdec (-2.0, inf, "def")){1}));
%!test
%! assert (isequal (floor (infsupdec (-inf, 2.2, "trv")), infsupdec (-inf, 2.0, "trv")));
%! assert (isequal (decorationpart (floor (infsupdec (-inf, 2.2, "trv"))){1}, decorationpart (infsupdec (-inf, 2.0, "trv")){1}));

## minimal_trunc_test

%!test
%! assert (isequal (fix (infsup), infsup));
%!test
%! assert (isequal (fix (infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (fix (infsup (1.1, 2.1)), infsup (1.0, 2.0)));
%!test
%! assert (isequal (fix (infsup (-1.1, 2.0)), infsup (-1.0, 2.0)));
%!test
%! assert (isequal (fix (infsup (-1.1, 0.0)), infsup (-1.0, 0.0)));
%!test
%! assert (isequal (fix (infsup (-1.1, -0.0)), infsup (-1.0, 0.0)));
%!test
%! assert (isequal (fix (infsup (-1.1, -0.4)), infsup (-1.0, 0.0)));
%!test
%! assert (isequal (fix (infsup (-1.9, 2.2)), infsup (-1.0, 2.0)));
%!test
%! assert (isequal (fix (infsup (-1.0, 2.2)), infsup (-1.0, 2.0)));
%!test
%! assert (isequal (fix (infsup (0.0, 2.2)), infsup (0.0, 2.0)));
%!test
%! assert (isequal (fix (infsup (-0.0, 2.2)), infsup (0.0, 2.0)));
%!test
%! assert (isequal (fix (infsup (-1.5, inf)), infsup (-1.0, inf)));
%!test
%! assert (isequal (fix (infsup (-inf, 2.2)), infsup (-inf, 2.0)));

## minimal_trunc_dec_test

%!test
%! assert (isequal (fix (infsupdec (1.1, 2.1, "com")), infsupdec (1.0, 2.0, "def")));
%! assert (isequal (decorationpart (fix (infsupdec (1.1, 2.1, "com"))){1}, decorationpart (infsupdec (1.0, 2.0, "def")){1}));
%!test
%! assert (isequal (fix (infsupdec (1.1, 1.9, "com")), infsupdec (1.0, 1.0, "com")));
%! assert (isequal (decorationpart (fix (infsupdec (1.1, 1.9, "com"))){1}, decorationpart (infsupdec (1.0, 1.0, "com")){1}));
%!test
%! assert (isequal (fix (infsupdec (-1.1, 2.0, "dac")), infsupdec (-1.0, 2.0, "def")));
%! assert (isequal (decorationpart (fix (infsupdec (-1.1, 2.0, "dac"))){1}, decorationpart (infsupdec (-1.0, 2.0, "def")){1}));
%!test
%! assert (isequal (fix (infsupdec (-1.1, 0.0, "trv")), infsupdec (-1.0, 0.0, "trv")));
%! assert (isequal (decorationpart (fix (infsupdec (-1.1, 0.0, "trv"))){1}, decorationpart (infsupdec (-1.0, 0.0, "trv")){1}));
%!test
%! assert (isequal (fix (infsupdec (-1.1, -0.0, "def")), infsupdec (-1.0, 0.0, "def")));
%! assert (isequal (decorationpart (fix (infsupdec (-1.1, -0.0, "def"))){1}, decorationpart (infsupdec (-1.0, 0.0, "def")){1}));
%!test
%! assert (isequal (fix (infsupdec (-1.1, -0.4, "com")), infsupdec (-1.0, 0.0, "def")));
%! assert (isequal (decorationpart (fix (infsupdec (-1.1, -0.4, "com"))){1}, decorationpart (infsupdec (-1.0, 0.0, "def")){1}));
%!test
%! assert (isequal (fix (infsupdec (-1.9, 2.2, "def")), infsupdec (-1.0, 2.0, "def")));
%! assert (isequal (decorationpart (fix (infsupdec (-1.9, 2.2, "def"))){1}, decorationpart (infsupdec (-1.0, 2.0, "def")){1}));
%!test
%! assert (isequal (fix (infsupdec (-1.0, 2.2, "dac")), infsupdec (-1.0, 2.0, "def")));
%! assert (isequal (decorationpart (fix (infsupdec (-1.0, 2.2, "dac"))){1}, decorationpart (infsupdec (-1.0, 2.0, "def")){1}));
%!test
%! assert (isequal (fix (infsupdec (-1.5, inf, "dac")), infsupdec (-1.0, inf, "def")));
%! assert (isequal (decorationpart (fix (infsupdec (-1.5, inf, "dac"))){1}, decorationpart (infsupdec (-1.0, inf, "def")){1}));
%!test
%! assert (isequal (fix (infsupdec (-inf, 2.2, "trv")), infsupdec (-inf, 2.0, "trv")));
%! assert (isequal (decorationpart (fix (infsupdec (-inf, 2.2, "trv"))){1}, decorationpart (infsupdec (-inf, 2.0, "trv")){1}));

## minimal_roundTiesToEven_test

%!test
%! assert (isequal (roundb (infsup), infsup));
%!test
%! assert (isequal (roundb (infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (roundb (infsup (1.1, 2.1)), infsup (1.0, 2.0)));
%!test
%! assert (isequal (roundb (infsup (-1.1, 2.0)), infsup (-1.0, 2.0)));
%!test
%! assert (isequal (roundb (infsup (-1.1, -0.4)), infsup (-1.0, 0.0)));
%!test
%! assert (isequal (roundb (infsup (-1.1, 0.0)), infsup (-1.0, 0.0)));
%!test
%! assert (isequal (roundb (infsup (-1.1, -0.0)), infsup (-1.0, 0.0)));
%!test
%! assert (isequal (roundb (infsup (-1.9, 2.2)), infsup (-2.0, 2.0)));
%!test
%! assert (isequal (roundb (infsup (-1.0, 2.2)), infsup (-1.0, 2.0)));
%!test
%! assert (isequal (roundb (infsup (1.5, 2.1)), infsup (2.0, 2.0)));
%!test
%! assert (isequal (roundb (infsup (-1.5, 2.0)), infsup (-2.0, 2.0)));
%!test
%! assert (isequal (roundb (infsup (-1.1, -0.5)), infsup (-1.0, 0.0)));
%!test
%! assert (isequal (roundb (infsup (-1.9, 2.5)), infsup (-2.0, 2.0)));
%!test
%! assert (isequal (roundb (infsup (0.0, 2.5)), infsup (0.0, 2.0)));
%!test
%! assert (isequal (roundb (infsup (-0.0, 2.5)), infsup (0.0, 2.0)));
%!test
%! assert (isequal (roundb (infsup (-1.5, 2.5)), infsup (-2.0, 2.0)));
%!test
%! assert (isequal (roundb (infsup (-1.5, inf)), infsup (-2.0, inf)));
%!test
%! assert (isequal (roundb (infsup (-inf, 2.2)), infsup (-inf, 2.0)));

## minimal_roundTiesToEven_dec_test

%!test
%! assert (isequal (roundb (infsupdec (1.1, 2.1, "com")), infsupdec (1.0, 2.0, "def")));
%! assert (isequal (decorationpart (roundb (infsupdec (1.1, 2.1, "com"))){1}, decorationpart (infsupdec (1.0, 2.0, "def")){1}));
%!test
%! assert (isequal (roundb (infsupdec (-1.1, 2.0, "trv")), infsupdec (-1.0, 2.0, "trv")));
%! assert (isequal (decorationpart (roundb (infsupdec (-1.1, 2.0, "trv"))){1}, decorationpart (infsupdec (-1.0, 2.0, "trv")){1}));
%!test
%! assert (isequal (roundb (infsupdec (-1.6, -1.5, "com")), infsupdec (-2.0, -2.0, "dac")));
%! assert (isequal (decorationpart (roundb (infsupdec (-1.6, -1.5, "com"))){1}, decorationpart (infsupdec (-2.0, -2.0, "dac")){1}));
%!test
%! assert (isequal (roundb (infsupdec (-1.6, -1.4, "com")), infsupdec (-2.0, -1.0, "def")));
%! assert (isequal (decorationpart (roundb (infsupdec (-1.6, -1.4, "com"))){1}, decorationpart (infsupdec (-2.0, -1.0, "def")){1}));
%!test
%! assert (isequal (roundb (infsupdec (-1.5, inf, "dac")), infsupdec (-2.0, inf, "def")));
%! assert (isequal (decorationpart (roundb (infsupdec (-1.5, inf, "dac"))){1}, decorationpart (infsupdec (-2.0, inf, "def")){1}));
%!test
%! assert (isequal (roundb (infsupdec (-inf, 2.2, "trv")), infsupdec (-inf, 2.0, "trv")));
%! assert (isequal (decorationpart (roundb (infsupdec (-inf, 2.2, "trv"))){1}, decorationpart (infsupdec (-inf, 2.0, "trv")){1}));

## minimal_roundTiesToAway_test

%!test
%! assert (isequal (round (infsup), infsup));
%!test
%! assert (isequal (round (infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (round (infsup (1.1, 2.1)), infsup (1.0, 2.0)));
%!test
%! assert (isequal (round (infsup (-1.1, 2.0)), infsup (-1.0, 2.0)));
%!test
%! assert (isequal (round (infsup (-1.1, 0.0)), infsup (-1.0, 0.0)));
%!test
%! assert (isequal (round (infsup (-1.1, -0.0)), infsup (-1.0, -0.0)));
%!test
%! assert (isequal (round (infsup (-1.1, -0.4)), infsup (-1.0, 0.0)));
%!test
%! assert (isequal (round (infsup (-1.9, 2.2)), infsup (-2.0, 2.0)));
%!test
%! assert (isequal (round (infsup (-1.0, 2.2)), infsup (-1.0, 2.0)));
%!test
%! assert (isequal (round (infsup (0.5, 2.1)), infsup (1.0, 2.0)));
%!test
%! assert (isequal (round (infsup (-2.5, 2.0)), infsup (-3.0, 2.0)));
%!test
%! assert (isequal (round (infsup (-1.1, -0.5)), infsup (-1.0, -1.0)));
%!test
%! assert (isequal (round (infsup (-1.9, 2.5)), infsup (-2.0, 3.0)));
%!test
%! assert (isequal (round (infsup (-1.5, 2.5)), infsup (-2.0, 3.0)));
%!test
%! assert (isequal (round (infsup (0.0, 2.5)), infsup (0.0, 3.0)));
%!test
%! assert (isequal (round (infsup (-0.0, 2.5)), infsup (0.0, 3.0)));
%!test
%! assert (isequal (round (infsup (-1.5, inf)), infsup (-2.0, inf)));
%!test
%! assert (isequal (round (infsup (-inf, 2.2)), infsup (-inf, 2.0)));

## minimal_roundTiesToAway_dec_test

%!test
%! assert (isequal (round (infsupdec (1.1, 2.1, "com")), infsupdec (1.0, 2.0, "def")));
%! assert (isequal (decorationpart (round (infsupdec (1.1, 2.1, "com"))){1}, decorationpart (infsupdec (1.0, 2.0, "def")){1}));
%!test
%! assert (isequal (round (infsupdec (-1.9, 2.2, "com")), infsupdec (-2.0, 2.0, "def")));
%! assert (isequal (decorationpart (round (infsupdec (-1.9, 2.2, "com"))){1}, decorationpart (infsupdec (-2.0, 2.0, "def")){1}));
%!test
%! assert (isequal (round (infsupdec (1.9, 2.2, "com")), infsupdec (2.0, 2.0, "com")));
%! assert (isequal (decorationpart (round (infsupdec (1.9, 2.2, "com"))){1}, decorationpart (infsupdec (2.0, 2.0, "com")){1}));
%!test
%! assert (isequal (round (infsupdec (-1.0, 2.2, "trv")), infsupdec (-1.0, 2.0, "trv")));
%! assert (isequal (decorationpart (round (infsupdec (-1.0, 2.2, "trv"))){1}, decorationpart (infsupdec (-1.0, 2.0, "trv")){1}));
%!test
%! assert (isequal (round (infsupdec (2.5, 2.6, "com")), infsupdec (3.0, 3.0, "dac")));
%! assert (isequal (decorationpart (round (infsupdec (2.5, 2.6, "com"))){1}, decorationpart (infsupdec (3.0, 3.0, "dac")){1}));
%!test
%! assert (isequal (round (infsupdec (-1.5, inf, "dac")), infsupdec (-2.0, inf, "def")));
%! assert (isequal (decorationpart (round (infsupdec (-1.5, inf, "dac"))){1}, decorationpart (infsupdec (-2.0, inf, "def")){1}));
%!test
%! assert (isequal (round (infsupdec (-inf, 2.2, "def")), infsupdec (-inf, 2.0, "def")));
%! assert (isequal (decorationpart (round (infsupdec (-inf, 2.2, "def"))){1}, decorationpart (infsupdec (-inf, 2.0, "def")){1}));

## minimal_abs_test

%!test
%! assert (isequal (abs (infsup), infsup));
%!test
%! assert (isequal (abs (infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (abs (infsup (1.1, 2.1)), infsup (1.1, 2.1)));
%!test
%! assert (isequal (abs (infsup (-1.1, 2.0)), infsup (0.0, 2.0)));
%!test
%! assert (isequal (abs (infsup (-1.1, 0.0)), infsup (0.0, 1.1)));
%!test
%! assert (isequal (abs (infsup (-1.1, -0.0)), infsup (0.0, 1.1)));
%!test
%! assert (isequal (abs (infsup (-1.1, -0.4)), infsup (0.4, 1.1)));
%!test
%! assert (isequal (abs (infsup (-1.9, 0.2)), infsup (0.0, 1.9)));
%!test
%! assert (isequal (abs (infsup (0.0, 0.2)), infsup (0.0, 0.2)));
%!test
%! assert (isequal (abs (infsup (-0.0, 0.2)), infsup (0.0, 0.2)));
%!test
%! assert (isequal (abs (infsup (-1.5, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (abs (infsup (-inf, -2.2)), infsup (2.2, inf)));

## minimal_abs_dec_test

%!test
%! assert (isequal (abs (infsupdec (-1.1, 2.0, "com")), infsupdec (0.0, 2.0, "com")));
%! assert (isequal (decorationpart (abs (infsupdec (-1.1, 2.0, "com"))){1}, decorationpart (infsupdec (0.0, 2.0, "com")){1}));
%!test
%! assert (isequal (abs (infsupdec (-1.1, 0.0, "dac")), infsupdec (0.0, 1.1, "dac")));
%! assert (isequal (decorationpart (abs (infsupdec (-1.1, 0.0, "dac"))){1}, decorationpart (infsupdec (0.0, 1.1, "dac")){1}));
%!test
%! assert (isequal (abs (infsupdec (-1.1, -0.0, "def")), infsupdec (0.0, 1.1, "def")));
%! assert (isequal (decorationpart (abs (infsupdec (-1.1, -0.0, "def"))){1}, decorationpart (infsupdec (0.0, 1.1, "def")){1}));
%!test
%! assert (isequal (abs (infsupdec (-1.1, -0.4, "trv")), infsupdec (0.4, 1.1, "trv")));
%! assert (isequal (decorationpart (abs (infsupdec (-1.1, -0.4, "trv"))){1}, decorationpart (infsupdec (0.4, 1.1, "trv")){1}));
%!test
%! assert (isequal (abs (infsupdec (-1.9, 0.2, "dac")), infsupdec (0.0, 1.9, "dac")));
%! assert (isequal (decorationpart (abs (infsupdec (-1.9, 0.2, "dac"))){1}, decorationpart (infsupdec (0.0, 1.9, "dac")){1}));
%!test
%! assert (isequal (abs (infsupdec (0.0, 0.2, "def")), infsupdec (0.0, 0.2, "def")));
%! assert (isequal (decorationpart (abs (infsupdec (0.0, 0.2, "def"))){1}, decorationpart (infsupdec (0.0, 0.2, "def")){1}));
%!test
%! assert (isequal (abs (infsupdec (-0.0, 0.2, "com")), infsupdec (0.0, 0.2, "com")));
%! assert (isequal (decorationpart (abs (infsupdec (-0.0, 0.2, "com"))){1}, decorationpart (infsupdec (0.0, 0.2, "com")){1}));
%!test
%! assert (isequal (abs (infsupdec (-1.5, inf, "dac")), infsupdec (0.0, inf, "dac")));
%! assert (isequal (decorationpart (abs (infsupdec (-1.5, inf, "dac"))){1}, decorationpart (infsupdec (0.0, inf, "dac")){1}));

## minimal_min_test

%!test
%! assert (isequal (min (infsup, infsup (1.0, 2.0)), infsup));
%!test
%! assert (isequal (min (infsup (1.0, 2.0), infsup), infsup));
%!test
%! assert (isequal (min (infsup, infsup), infsup));
%!test
%! assert (isequal (min (infsup (-inf, inf), infsup (1.0, 2.0)), infsup (-inf, 2.0)));
%!test
%! assert (isequal (min (infsup (1.0, 2.0), infsup (-inf, inf)), infsup (-inf, 2.0)));
%!test
%! assert (isequal (min (infsup (-inf, inf), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (min (infsup, infsup (-inf, inf)), infsup));
%!test
%! assert (isequal (min (infsup (1.0, 5.0), infsup (2.0, 4.0)), infsup (1.0, 4.0)));
%!test
%! assert (isequal (min (infsup (0.0, 5.0), infsup (2.0, 4.0)), infsup (0.0, 4.0)));
%!test
%! assert (isequal (min (infsup (-0.0, 5.0), infsup (2.0, 4.0)), infsup (0.0, 4.0)));
%!test
%! assert (isequal (min (infsup (1.0, 5.0), infsup (2.0, 8.0)), infsup (1.0, 5.0)));
%!test
%! assert (isequal (min (infsup (1.0, 5.0), infsup (-inf, inf)), infsup (-inf, 5.0)));
%!test
%! assert (isequal (min (infsup (-7.0, -5.0), infsup (2.0, 4.0)), infsup (-7.0, -5.0)));
%!test
%! assert (isequal (min (infsup (-7.0, 0.0), infsup (2.0, 4.0)), infsup (-7.0, 0.0)));
%!test
%! assert (isequal (min (infsup (-7.0, -0.0), infsup (2.0, 4.0)), infsup (-7.0, 0.0)));

## minimal_min_dec_test

%!test
%! assert (isequal (min (infsupdec (entire, "def"), infsupdec (1.0, 2.0, "com")), infsupdec (-inf, 2.0, "def")));
%! assert (isequal (decorationpart (min (infsupdec (entire, "def"), infsupdec (1.0, 2.0, "com"))){1}, decorationpart (infsupdec (-inf, 2.0, "def")){1}));
%!test
%! assert (isequal (min (infsupdec (-7.0, -5.0, "trv"), infsupdec (2.0, 4.0, "def")), infsupdec (-7.0, -5.0, "trv")));
%! assert (isequal (decorationpart (min (infsupdec (-7.0, -5.0, "trv"), infsupdec (2.0, 4.0, "def"))){1}, decorationpart (infsupdec (-7.0, -5.0, "trv")){1}));
%!test
%! assert (isequal (min (infsupdec (-7.0, 0.0, "dac"), infsupdec (2.0, 4.0, "def")), infsupdec (-7.0, 0.0, "def")));
%! assert (isequal (decorationpart (min (infsupdec (-7.0, 0.0, "dac"), infsupdec (2.0, 4.0, "def"))){1}, decorationpart (infsupdec (-7.0, 0.0, "def")){1}));
%!test
%! assert (isequal (min (infsupdec (-7.0, -0.0, "com"), infsupdec (2.0, 4.0, "com")), infsupdec (-7.0, 0.0, "com")));
%! assert (isequal (decorationpart (min (infsupdec (-7.0, -0.0, "com"), infsupdec (2.0, 4.0, "com"))){1}, decorationpart (infsupdec (-7.0, 0.0, "com")){1}));

## minimal_max_test

%!test
%! assert (isequal (max (infsup, infsup (1.0, 2.0)), infsup));
%!test
%! assert (isequal (max (infsup (1.0, 2.0), infsup), infsup));
%!test
%! assert (isequal (max (infsup, infsup), infsup));
%!test
%! assert (isequal (max (infsup (-inf, inf), infsup (1.0, 2.0)), infsup (1.0, inf)));
%!test
%! assert (isequal (max (infsup (1.0, 2.0), infsup (-inf, inf)), infsup (1.0, inf)));
%!test
%! assert (isequal (max (infsup (-inf, inf), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (max (infsup, infsup (-inf, inf)), infsup));
%!test
%! assert (isequal (max (infsup (1.0, 5.0), infsup (2.0, 4.0)), infsup (2.0, 5.0)));
%!test
%! assert (isequal (max (infsup (1.0, 5.0), infsup (2.0, 8.0)), infsup (2.0, 8.0)));
%!test
%! assert (isequal (max (infsup (-1.0, 5.0), infsup (-inf, inf)), infsup (-1.0, inf)));
%!test
%! assert (isequal (max (infsup (-7.0, -5.0), infsup (2.0, 4.0)), infsup (2.0, 4.0)));
%!test
%! assert (isequal (max (infsup (-7.0, -5.0), infsup (0.0, 4.0)), infsup (0.0, 4.0)));
%!test
%! assert (isequal (max (infsup (-7.0, -5.0), infsup (-0.0, 4.0)), infsup (0.0, 4.0)));
%!test
%! assert (isequal (max (infsup (-7.0, -5.0), infsup (-2.0, 0.0)), infsup (-2.0, 0.0)));
%!test
%! assert (isequal (max (infsup (-7.0, -5.0), infsup (-2.0, -0.0)), infsup (-2.0, 0.0)));

## minimal_max_dec_test

%!test
%! assert (isequal (max (infsupdec (entire, "def"), infsupdec (1.0, 2.0, "com")), infsupdec (1.0, inf, "def")));
%! assert (isequal (decorationpart (max (infsupdec (entire, "def"), infsupdec (1.0, 2.0, "com"))){1}, decorationpart (infsupdec (1.0, inf, "def")){1}));
%!test
%! assert (isequal (max (infsupdec (-7.0, -5.0, "trv"), infsupdec (2.0, 4.0, "def")), infsupdec (2.0, 4.0, "trv")));
%! assert (isequal (decorationpart (max (infsupdec (-7.0, -5.0, "trv"), infsupdec (2.0, 4.0, "def"))){1}, decorationpart (infsupdec (2.0, 4.0, "trv")){1}));
%!test
%! assert (isequal (max (infsupdec (-7.0, 5.0, "dac"), infsupdec (2.0, 4.0, "def")), infsupdec (2.0, 5.0, "def")));
%! assert (isequal (decorationpart (max (infsupdec (-7.0, 5.0, "dac"), infsupdec (2.0, 4.0, "def"))){1}, decorationpart (infsupdec (2.0, 5.0, "def")){1}));
%!test
%! assert (isequal (max (infsupdec (3.0, 3.5, "com"), infsupdec (2.0, 4.0, "com")), infsupdec (3.0, 4.0, "com")));
%! assert (isequal (decorationpart (max (infsupdec (3.0, 3.5, "com"), infsupdec (2.0, 4.0, "com"))){1}, decorationpart (infsupdec (3.0, 4.0, "com")){1}));
