## DO NOT EDIT!  Generated automatically from test/libieeep1788_tests_rec_bool.itl
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

## minimal_isCommonInterval_test

%!test
%! assert (iscommoninterval (infsup (-27.0, -27.0)));
%!test
%! assert (iscommoninterval (infsup (-27.0, 0.0)));
%!test
%! assert (iscommoninterval (infsup (0.0, 0.0)));
%!test
%! assert (iscommoninterval (infsup (-0.0, -0.0)));
%!test
%! assert (iscommoninterval (infsup (-0.0, 0.0)));
%!test
%! assert (iscommoninterval (infsup (0.0, -0.0)));
%!test
%! assert (iscommoninterval (infsup (5.0, 12.4)));
%!test
%! assert (iscommoninterval (infsup (-1.797693134862315708e+308, 1.797693134862315708e+308)));
%!test
%! assert (isequal (iscommoninterval (infsup (-inf, inf)), false));
%!test
%! assert (isequal (iscommoninterval (infsup), false));
%!test
%! assert (isequal (iscommoninterval (infsup (-inf, 0.0)), false));
%!test
%! assert (isequal (iscommoninterval (infsup (0.0, inf)), false));

## minimal_isCommonInterval_dec_test

%!test
%! assert (iscommoninterval (infsupdec (-27.0, -27.0, "com")));
%!test
%! assert (iscommoninterval (infsupdec (-27.0, 0.0, "com")));
%!test
%! assert (iscommoninterval (infsupdec (0.0, 0.0, "com")));
%!test
%! assert (iscommoninterval (infsupdec (-0.0, -0.0, "com")));
%!test
%! assert (iscommoninterval (infsupdec (-0.0, 0.0, "com")));
%!test
%! assert (iscommoninterval (infsupdec (0.0, -0.0, "com")));
%!test
%! assert (iscommoninterval (infsupdec (5.0, 12.4, "com")));
%!test
%! assert (iscommoninterval (infsupdec (-1.797693134862315708e+308, 1.797693134862315708e+308, "com")));
%!test
%! assert (iscommoninterval (infsupdec (-27.0, -27.0, "trv")));
%!test
%! assert (iscommoninterval (infsupdec (-27.0, 0.0, "def")));
%!test
%! assert (iscommoninterval (infsupdec (0.0, 0.0, "dac")));
%!test
%! assert (iscommoninterval (infsupdec (-0.0, -0.0, "trv")));
%!test
%! assert (iscommoninterval (infsupdec (-0.0, 0.0, "def")));
%!test
%! assert (iscommoninterval (infsupdec (0.0, -0.0, "dac")));
%!test
%! assert (iscommoninterval (infsupdec (5.0, 12.4, "def")));
%!test
%! assert (iscommoninterval (infsupdec (-1.797693134862315708e+308, 1.797693134862315708e+308, "trv")));
%!test
%! assert (isequal (iscommoninterval (infsupdec (entire, "dac")), false));
%!test
%! assert (isequal (iscommoninterval (infsupdec (empty, "trv")), false));
%!test
%! assert (isequal (iscommoninterval (infsupdec (empty, "trv")), false));
%!test
%! assert (isequal (iscommoninterval (infsupdec (-inf, 0.0, "trv")), false));
%!test
%! assert (isequal (iscommoninterval (infsupdec (0.0, inf, "def")), false));

## minimal_isSingleton_test

%!test
%! assert (issingleton (infsup (-27.0, -27.0)));
%!test
%! assert (issingleton (infsup (-2.0, -2.0)));
%!test
%! assert (issingleton (infsup (12.0, 12.0)));
%!test
%! assert (issingleton (infsup (17.1, 17.1)));
%!test
%! assert (issingleton (infsup (-0.0, -0.0)));
%!test
%! assert (issingleton (infsup (0.0, 0.0)));
%!test
%! assert (issingleton (infsup (-0.0, 0.0)));
%!test
%! assert (issingleton (infsup (0.0, -0.0)));
%!test
%! assert (isequal (issingleton (infsup), false));
%!test
%! assert (isequal (issingleton (infsup (-inf, inf)), false));
%!test
%! assert (isequal (issingleton (infsup (-1.0, 0.0)), false));
%!test
%! assert (isequal (issingleton (infsup (-1.0, -0.5)), false));
%!test
%! assert (isequal (issingleton (infsup (1.0, 2.0)), false));
%!test
%! assert (isequal (issingleton (infsup (-inf, -1.797693134862315708e+308)), false));
%!test
%! assert (isequal (issingleton (infsup (-1.0, inf)), false));

## minimal_isSingleton_dec_test

%!test
%! assert (issingleton (infsupdec (-27.0, -27.0, "def")));
%!test
%! assert (issingleton (infsupdec (-2.0, -2.0, "trv")));
%!test
%! assert (issingleton (infsupdec (12.0, 12.0, "dac")));
%!test
%! assert (issingleton (infsupdec (17.1, 17.1, "com")));
%!test
%! assert (issingleton (infsupdec (-0.0, -0.0, "def")));
%!test
%! assert (issingleton (infsupdec (0.0, 0.0, "com")));
%!test
%! assert (issingleton (infsupdec (-0.0, 0.0, "def")));
%!test
%! assert (issingleton (infsupdec (0.0, -0.0, "dac")));
%!test
%! assert (isequal (issingleton (infsupdec (empty, "trv")), false));
%!test
%! assert (isequal (issingleton (infsupdec (empty, "trv")), false));
%!test
%! assert (isequal (issingleton (infsupdec (entire, "def")), false));
%!test
%! assert (isequal (issingleton (infsupdec (-1.0, 0.0, "dac")), false));
%!test
%! assert (isequal (issingleton (infsupdec (-1.0, -0.5, "com")), false));
%!test
%! assert (isequal (issingleton (infsupdec (1.0, 2.0, "def")), false));
%!test
%! assert (isequal (issingleton (infsupdec (-inf, -1.797693134862315708e+308, "dac")), false));
%!test
%! assert (isequal (issingleton (infsupdec (-1.0, inf, "trv")), false));

## minimal_isMember_test

%!test
%! assert (ismember (-27.0, infsup (-27.0, -27.0)));
%!test
%! assert (ismember (-27.0, infsup (-27.0, 0.0)));
%!test
%! assert (ismember (-7.0, infsup (-27.0, 0.0)));
%!test
%! assert (ismember (0.0, infsup (-27.0, 0.0)));
%!test
%! assert (ismember (-0.0, infsup (0.0, 0.0)));
%!test
%! assert (ismember (0.0, infsup (0.0, 0.0)));
%!test
%! assert (ismember (0.0, infsup (-0.0, -0.0)));
%!test
%! assert (ismember (0.0, infsup (-0.0, 0.0)));
%!test
%! assert (ismember (0.0, infsup (0.0, -0.0)));
%!test
%! assert (ismember (5.0, infsup (5.0, 12.4)));
%!test
%! assert (ismember (6.3, infsup (5.0, 12.4)));
%!test
%! assert (ismember (12.4, infsup (5.0, 12.4)));
%!test
%! assert (ismember (0.0, infsup (-inf, inf)));
%!test
%! assert (ismember (5.0, infsup (-inf, inf)));
%!test
%! assert (ismember (6.3, infsup (-inf, inf)));
%!test
%! assert (ismember (12.4, infsup (-inf, inf)));
%!test
%! assert (isequal (ismember (-71.0, infsup (-27.0, 0.0)), false));
%!test
%! assert (isequal (ismember (0.1, infsup (-27.0, 0.0)), false));
%!test
%! assert (isequal (ismember (-0.01, infsup (0.0, 0.0)), false));
%!test
%! assert (isequal (ismember (0.000001, infsup (0.0, 0.0)), false));
%!test
%! assert (isequal (ismember (111110.0, infsup (-0.0, -0.0)), false));
%!test
%! assert (isequal (ismember (4.9, infsup (5.0, 12.4)), false));
%!test
%! assert (isequal (ismember (-6.3, infsup (5.0, 12.4)), false));
%!test
%! assert (isequal (ismember (0.0, infsup), false));
%!test
%! assert (isequal (ismember (-4535.3, infsup), false));
%!test
%! assert (isequal (ismember (-inf, infsup), false));
%!test
%! assert (isequal (ismember (inf, infsup), false));
%!test
%! assert (isequal (ismember (-inf, infsup (-inf, inf)), false));
%!test
%! assert (isequal (ismember (inf, infsup (-inf, inf)), false));

## minimal_isMember_dec_test

%!test
%! assert (ismember (-27.0, infsupdec (-27.0, -27.0, "trv")));
%!test
%! assert (ismember (-27.0, infsupdec (-27.0, 0.0, "def")));
%!test
%! assert (ismember (-7.0, infsupdec (-27.0, 0.0, "dac")));
%!test
%! assert (ismember (0.0, infsupdec (-27.0, 0.0, "com")));
%!test
%! assert (ismember (-0.0, infsupdec (0.0, 0.0, "trv")));
%!test
%! assert (ismember (0.0, infsupdec (0.0, 0.0, "def")));
%!test
%! assert (ismember (0.0, infsupdec (-0.0, -0.0, "dac")));
%!test
%! assert (ismember (0.0, infsupdec (-0.0, 0.0, "com")));
%!test
%! assert (ismember (0.0, infsupdec (0.0, -0.0, "trv")));
%!test
%! assert (ismember (5.0, infsupdec (5.0, 12.4, "def")));
%!test
%! assert (ismember (6.3, infsupdec (5.0, 12.4, "dac")));
%!test
%! assert (ismember (12.4, infsupdec (5.0, 12.4, "com")));
%!test
%! assert (ismember (0.0, infsupdec (entire, "trv")));
%!test
%! assert (ismember (5.0, infsupdec (entire, "def")));
%!test
%! assert (ismember (6.3, infsupdec (entire, "dac")));
%!test
%! assert (ismember (12.4, infsupdec (entire, "trv")));
%!test
%! assert (isequal (ismember (-71.0, infsupdec (-27.0, 0.0, "trv")), false));
%!test
%! assert (isequal (ismember (0.1, infsupdec (-27.0, 0.0, "def")), false));
%!test
%! assert (isequal (ismember (-0.01, infsupdec (0.0, 0.0, "dac")), false));
%!test
%! assert (isequal (ismember (0.000001, infsupdec (0.0, 0.0, "com")), false));
%!test
%! assert (isequal (ismember (111110.0, infsupdec (-0.0, -0.0, "trv")), false));
%!test
%! assert (isequal (ismember (4.9, infsupdec (5.0, 12.4, "def")), false));
%!test
%! assert (isequal (ismember (-6.3, infsupdec (5.0, 12.4, "dac")), false));
%!test
%! assert (isequal (ismember (0.0, infsupdec (empty, "trv")), false));
%!test
%! assert (isequal (ismember (0.0, infsupdec (empty, "trv")), false));
%!test
%! assert (isequal (ismember (-4535.3, infsupdec (empty, "trv")), false));
%!test
%! assert (isequal (ismember (-4535.3, infsupdec (empty, "trv")), false));
%!test
%! assert (isequal (ismember (-inf, infsupdec (empty, "trv")), false));
%!test
%! assert (isequal (ismember (-inf, infsupdec (empty, "trv")), false));
%!test
%! assert (isequal (ismember (inf, infsupdec (empty, "trv")), false));
%!test
%! assert (isequal (ismember (inf, infsupdec (empty, "trv")), false));
%!test
%! assert (isequal (ismember (-inf, infsupdec (entire, "trv")), false));
%!test
%! assert (isequal (ismember (inf, infsupdec (entire, "def")), false));
