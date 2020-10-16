## DO NOT EDIT!  Generated automatically from test/libieeep1788_tests_num.itl
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

## minimal_inf_test

%!test
%! assert (isequal (inf (infsup), inf));
%!test
%! assert (isequal (inf (infsup (-inf, inf)), -inf));
%!test
%! assert (isequal (inf (infsup (1.0, 2.0)), 1.0));
%!test
%! assert (isequal (inf (infsup (-3.0, -2.0)), -3.0));
%!test
%! assert (isequal (inf (infsup (-inf, 2.0)), -inf));
%!test
%! assert (isequal (inf (infsup (-inf, 0.0)), -inf));
%!test
%! assert (isequal (inf (infsup (-inf, -0.0)), -inf));
%!test
%! assert (isequal (inf (infsup (-2.0, inf)), -2.0));
%!test
%! assert (isequal (inf (infsup (0.0, inf)), -0.0));
%!test
%! assert (isequal (inf (infsup (-0.0, inf)), -0.0));
%!test
%! assert (isequal (inf (infsup (-0.0, 0.0)), -0.0));
%!test
%! assert (isequal (inf (infsup (0.0, -0.0)), -0.0));
%!test
%! assert (isequal (inf (infsup (0.0, 0.0)), -0.0));
%!test
%! assert (isequal (inf (infsup (-0.0, -0.0)), -0.0));

## minimal_inf_dec_test

%!test
%! assert (isequal (inf (infsupdec (empty, "trv")), inf));
%!test
%! assert (isequal (inf (infsupdec (-inf, inf, "def")), -inf));
%!test
%! assert (isequal (inf (infsupdec (1.0, 2.0, "com")), 1.0));
%!test
%! assert (isequal (inf (infsupdec (-3.0, -2.0, "trv")), -3.0));
%!test
%! assert (isequal (inf (infsupdec (-inf, 2.0, "dac")), -inf));
%!test
%! assert (isequal (inf (infsupdec (-inf, 0.0, "def")), -inf));
%!test
%! assert (isequal (inf (infsupdec (-inf, -0.0, "trv")), -inf));
%!test
%! assert (isequal (inf (infsupdec (-2.0, inf, "trv")), -2.0));
%!test
%! assert (isequal (inf (infsupdec (0.0, inf, "def")), -0.0));
%!test
%! assert (isequal (inf (infsupdec (-0.0, inf, "trv")), -0.0));
%!test
%! assert (isequal (inf (infsupdec (-0.0, 0.0, "dac")), -0.0));
%!test
%! assert (isequal (inf (infsupdec (0.0, -0.0, "trv")), -0.0));
%!test
%! assert (isequal (inf (infsupdec (0.0, 0.0, "trv")), -0.0));
%!test
%! assert (isequal (inf (infsupdec (-0.0, -0.0, "trv")), -0.0));

## minimal_sup_test

%!test
%! assert (isequal (sup (infsup), -inf));
%!test
%! assert (isequal (sup (infsup (-inf, inf)), inf));
%!test
%! assert (isequal (sup (infsup (1.0, 2.0)), 2.0));
%!test
%! assert (isequal (sup (infsup (-3.0, -2.0)), -2.0));
%!test
%! assert (isequal (sup (infsup (-inf, 2.0)), 2.0));
%!test
%! assert (isequal (sup (infsup (-inf, 0.0)), 0.0));
%!test
%! assert (isequal (sup (infsup (-inf, -0.0)), 0.0));
%!test
%! assert (isequal (sup (infsup (-2.0, inf)), inf));
%!test
%! assert (isequal (sup (infsup (0.0, inf)), inf));
%!test
%! assert (isequal (sup (infsup (-0.0, inf)), inf));
%!test
%! assert (isequal (sup (infsup (-0.0, 0.0)), 0.0));
%!test
%! assert (isequal (sup (infsup (0.0, -0.0)), 0.0));
%!test
%! assert (isequal (sup (infsup (0.0, 0.0)), 0.0));
%!test
%! assert (isequal (sup (infsup (-0.0, -0.0)), 0.0));

## minimal_sup_dec_test

%!test
%! assert (isequal (sup (infsupdec (empty, "trv")), -inf));
%!test
%! assert (isequal (sup (infsupdec (-inf, inf, "def")), inf));
%!test
%! assert (isequal (sup (infsupdec (1.0, 2.0, "com")), 2.0));
%!test
%! assert (isequal (sup (infsupdec (-3.0, -2.0, "trv")), -2.0));
%!test
%! assert (isequal (sup (infsupdec (-inf, 2.0, "dac")), 2.0));
%!test
%! assert (isequal (sup (infsupdec (-inf, 0.0, "def")), 0.0));
%!test
%! assert (isequal (sup (infsupdec (-inf, -0.0, "trv")), 0.0));
%!test
%! assert (isequal (sup (infsupdec (-2.0, inf, "trv")), inf));
%!test
%! assert (isequal (sup (infsupdec (0.0, inf, "def")), inf));
%!test
%! assert (isequal (sup (infsupdec (-0.0, inf, "trv")), inf));
%!test
%! assert (isequal (sup (infsupdec (-0.0, 0.0, "dac")), +0.0));
%!test
%! assert (isequal (sup (infsupdec (0.0, -0.0, "trv")), +0.0));
%!test
%! assert (isequal (sup (infsupdec (0.0, 0.0, "trv")), +0.0));
%!test
%! assert (isequal (sup (infsupdec (-0.0, -0.0, "trv")), +0.0));

## minimal_mid_test

%!test
%! assert (isequal (mid (infsup (-inf, inf)), 0.0));
%!test
%! assert (isequal (mid (infsup (-1.797693134862315708e+308, 1.797693134862315708e+308)), 0.0));
%!test
%! assert (isequal (mid (infsup (0.0, 2.0)), 1.0));
%!test
%! assert (isequal (mid (infsup (2.0, 2.0)), 2.0));
%!test
%! assert (isequal (mid (infsup (-2.0, 2.0)), 0.0));
%!test
%! assert (isequal (mid (infsup (-9.881312916824930884e-324, 4.940656458412465442e-324)), 0.0));
%!test
%! assert (isequal (mid (infsup (-4.940656458412465442e-324, 9.881312916824930884e-324)), 0.0));

## minimal_mid_dec_test

%!test
%! assert (isequal (mid (infsupdec (-inf, inf, "def")), 0.0));
%!test
%! assert (isequal (mid (infsupdec (-1.797693134862315708e+308, 1.797693134862315708e+308, "trv")), 0.0));
%!test
%! assert (isequal (mid (infsupdec (0.0, 2.0, "com")), 1.0));
%!test
%! assert (isequal (mid (infsupdec (2.0, 2.0, "dac")), 2.0));
%!test
%! assert (isequal (mid (infsupdec (-2.0, 2.0, "trv")), 0.0));
%!test
%! assert (isequal (mid (infsupdec (-9.881312916824930884e-324, 4.940656458412465442e-324, "trv")), 0.0));
%!test
%! assert (isequal (mid (infsupdec (-4.940656458412465442e-324, 9.881312916824930884e-324, "trv")), 0.0));

## minimal_rad_test

%!test
%! assert (isequal (rad (infsup (0.0, 2.0)), 1.0));
%!test
%! assert (isequal (rad (infsup (2.0, 2.0)), 0.0));
%!test
%! assert (isequal (rad (infsup (-inf, inf)), inf));
%!test
%! assert (isequal (rad (infsup (0.0, inf)), inf));
%!test
%! assert (isequal (rad (infsup (-inf, 1.2)), inf));

## minimal_rad_dec_test

%!test
%! assert (isequal (rad (infsupdec (0.0, 2.0, "trv")), 1.0));
%!test
%! assert (isequal (rad (infsupdec (2.0, 2.0, "com")), 0.0));
%!test
%! assert (isequal (rad (infsupdec (-inf, inf, "trv")), inf));
%!test
%! assert (isequal (rad (infsupdec (0.0, inf, "def")), inf));
%!test
%! assert (isequal (rad (infsupdec (-inf, 1.2, "trv")), inf));

## minimal_wid_test

%!test
%! assert (isequal (wid (infsup (2.0, 2.0)), 0.0));
%!test
%! assert (isequal (wid (infsup (1.0, 2.0)), 1.0));
%!test
%! assert (isequal (wid (infsup (1.0, inf)), inf));
%!test
%! assert (isequal (wid (infsup (-inf, 2.0)), inf));
%!test
%! assert (isequal (wid (infsup (-inf, inf)), inf));

## minimal_wid_dec_test

%!test
%! assert (isequal (wid (infsupdec (2.0, 2.0, "com")), 0.0));
%!test
%! assert (isequal (wid (infsupdec (1.0, 2.0, "trv")), 1.0));
%!test
%! assert (isequal (wid (infsupdec (1.0, inf, "trv")), inf));
%!test
%! assert (isequal (wid (infsupdec (-inf, 2.0, "def")), inf));
%!test
%! assert (isequal (wid (infsupdec (-inf, inf, "trv")), inf));

## minimal_mag_test

%!test
%! assert (isequal (mag (infsup (1.0, 2.0)), 2.0));
%!test
%! assert (isequal (mag (infsup (-4.0, 2.0)), 4.0));
%!test
%! assert (isequal (mag (infsup (-inf, 2.0)), inf));
%!test
%! assert (isequal (mag (infsup (1.0, inf)), inf));
%!test
%! assert (isequal (mag (infsup (-inf, inf)), inf));
%!test
%! assert (isequal (mag (infsup (-0.0, 0.0)), 0.0));
%!test
%! assert (isequal (mag (infsup (-0.0, -0.0)), 0.0));

## minimal_mag_dec_test

%!test
%! assert (isequal (mag (infsupdec (1.0, 2.0, "com")), 2.0));
%!test
%! assert (isequal (mag (infsupdec (-4.0, 2.0, "trv")), 4.0));
%!test
%! assert (isequal (mag (infsupdec (-inf, 2.0, "trv")), inf));
%!test
%! assert (isequal (mag (infsupdec (1.0, inf, "def")), inf));
%!test
%! assert (isequal (mag (infsupdec (-inf, inf, "trv")), inf));
%!test
%! assert (isequal (mag (infsupdec (-0.0, 0.0, "trv")), 0.0));
%!test
%! assert (isequal (mag (infsupdec (-0.0, -0.0, "trv")), 0.0));

## minimal_mig_test

%!test
%! assert (isequal (mig (infsup (1.0, 2.0)), 1.0));
%!test
%! assert (isequal (mig (infsup (-4.0, 2.0)), 0.0));
%!test
%! assert (isequal (mig (infsup (-4.0, -2.0)), 2.0));
%!test
%! assert (isequal (mig (infsup (-inf, 2.0)), 0.0));
%!test
%! assert (isequal (mig (infsup (-inf, -2.0)), 2.0));
%!test
%! assert (isequal (mig (infsup (-1.0, inf)), 0.0));
%!test
%! assert (isequal (mig (infsup (1.0, inf)), 1.0));
%!test
%! assert (isequal (mig (infsup (-inf, inf)), 0.0));
%!test
%! assert (isequal (mig (infsup (-0.0, 0.0)), 0.0));
%!test
%! assert (isequal (mig (infsup (-0.0, -0.0)), 0.0));

## minimal_mig_dec_test

%!test
%! assert (isequal (mig (infsupdec (1.0, 2.0, "com")), 1.0));
%!test
%! assert (isequal (mig (infsupdec (-4.0, 2.0, "trv")), 0.0));
%!test
%! assert (isequal (mig (infsupdec (-4.0, -2.0, "trv")), 2.0));
%!test
%! assert (isequal (mig (infsupdec (-inf, 2.0, "def")), 0.0));
%!test
%! assert (isequal (mig (infsupdec (-inf, -2.0, "trv")), 2.0));
%!test
%! assert (isequal (mig (infsupdec (-1.0, inf, "trv")), 0.0));
%!test
%! assert (isequal (mig (infsupdec (1.0, inf, "trv")), 1.0));
%!test
%! assert (isequal (mig (infsupdec (-inf, inf, "trv")), 0.0));
%!test
%! assert (isequal (mig (infsupdec (-0.0, 0.0, "trv")), 0.0));
%!test
%! assert (isequal (mig (infsupdec (-0.0, -0.0, "trv")), 0.0));
