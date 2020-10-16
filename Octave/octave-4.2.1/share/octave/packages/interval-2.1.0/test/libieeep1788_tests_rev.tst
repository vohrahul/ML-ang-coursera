## DO NOT EDIT!  Generated automatically from test/libieeep1788_tests_rev.itl
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

## minimal_sqrRev_test

%!test
%! assert (isequal (sqrrev (infsup), infsup));
%!test
%! assert (isequal (sqrrev (infsup (-10.0, -1.0)), infsup));
%!test
%! assert (isequal (sqrrev (infsup (0.0, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (sqrrev (infsup (0.0, 1.0)), infsup (-1.0, 1.0)));
%!test
%! assert (isequal (sqrrev (infsup (-0.5, 1.0)), infsup (-1.0, 1.0)));
%!test
%! assert (isequal (sqrrev (infsup (-1000.0, 1.0)), infsup (-1.0, 1.0)));
%!test
%! assert (isequal (sqrrev (infsup (0.0, 25.0)), infsup (-5.0, 5.0)));
%!test
%! assert (isequal (sqrrev (infsup (-1.0, 25.0)), infsup (-5.0, 5.0)));
%!test
%! assert (isequal (sqrrev (infsup (1.000000000000000021e-02, 1.000000000000000194e-02)), infsup (-1.000000000000000194e-01, 1.000000000000000194e-01)));
%!test
%! assert (isequal (sqrrev (infsup (0.0, 3.999999999999986233e+00)), infsup (-1.999999999999996669e+00, 1.999999999999996669e+00)));

## minimal_sqrRevBin_test

%!test
%! assert (isequal (sqrrev (infsup, infsup (-5.0, 1.0)), infsup));
%!test
%! assert (isequal (sqrrev (infsup (-10.0, -1.0), infsup (-5.0, 1.0)), infsup));
%!test
%! assert (isequal (sqrrev (infsup (0.0, inf), infsup (-5.0, 1.0)), infsup (-5.0, 1.0)));
%!test
%! assert (isequal (sqrrev (infsup (0.0, 1.0), infsup (-0.1, 1.0)), infsup (-0.1, 1.0)));
%!test
%! assert (isequal (sqrrev (infsup (-0.5, 1.0), infsup (-0.1, 1.0)), infsup (-0.1, 1.0)));
%!test
%! assert (isequal (sqrrev (infsup (-1000.0, 1.0), infsup (-0.1, 1.0)), infsup (-0.1, 1.0)));
%!test
%! assert (isequal (sqrrev (infsup (0.0, 25.0), infsup (-4.1, 6.0)), infsup (-4.1, 5.0)));
%!test
%! assert (isequal (sqrrev (infsup (-1.0, 25.0), infsup (-4.1, 7.0)), infsup (-4.1, 5.0)));
%!test
%! assert (isequal (sqrrev (infsup (1.0, 25.0), infsup (0.0, 7.0)), infsup (1.0, 5.0)));
%!test
%! assert (isequal (sqrrev (infsup (1.000000000000000021e-02, 1.000000000000000194e-02), infsup (-0.1, inf)), infsup (-0.1, 1.000000000000000194e-01)));
%!test
%! assert (isequal (sqrrev (infsup (0.0, 3.999999999999986233e+00), infsup (-0.1, inf)), infsup (-0.1, 1.999999999999996669e+00)));

## minimal_sqrRev_dec_test

%!test
%! assert (isequal (sqrrev (infsupdec (empty, "trv")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (sqrrev (infsupdec (empty, "trv"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (sqrrev (infsupdec (-10.0, -1.0, "com")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (sqrrev (infsupdec (-10.0, -1.0, "com"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (sqrrev (infsupdec (0.0, inf, "dac")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (sqrrev (infsupdec (0.0, inf, "dac"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%!test
%! assert (isequal (sqrrev (infsupdec (0.0, 1.0, "def")), infsupdec (-1.0, 1.0, "trv")));
%! assert (isequal (decorationpart (sqrrev (infsupdec (0.0, 1.0, "def"))){1}, decorationpart (infsupdec (-1.0, 1.0, "trv")){1}));
%!test
%! assert (isequal (sqrrev (infsupdec (-0.5, 1.0, "dac")), infsupdec (-1.0, 1.0, "trv")));
%! assert (isequal (decorationpart (sqrrev (infsupdec (-0.5, 1.0, "dac"))){1}, decorationpart (infsupdec (-1.0, 1.0, "trv")){1}));
%!test
%! assert (isequal (sqrrev (infsupdec (-1000.0, 1.0, "com")), infsupdec (-1.0, 1.0, "trv")));
%! assert (isequal (decorationpart (sqrrev (infsupdec (-1000.0, 1.0, "com"))){1}, decorationpart (infsupdec (-1.0, 1.0, "trv")){1}));
%!test
%! assert (isequal (sqrrev (infsupdec (0.0, 25.0, "def")), infsupdec (-5.0, 5.0, "trv")));
%! assert (isequal (decorationpart (sqrrev (infsupdec (0.0, 25.0, "def"))){1}, decorationpart (infsupdec (-5.0, 5.0, "trv")){1}));
%!test
%! assert (isequal (sqrrev (infsupdec (-1.0, 25.0, "dac")), infsupdec (-5.0, 5.0, "trv")));
%! assert (isequal (decorationpart (sqrrev (infsupdec (-1.0, 25.0, "dac"))){1}, decorationpart (infsupdec (-5.0, 5.0, "trv")){1}));
%!test
%! assert (isequal (sqrrev (infsupdec (1.000000000000000021e-02, 1.000000000000000194e-02, "com")), infsupdec (-1.000000000000000194e-01, 1.000000000000000194e-01, "trv")));
%! assert (isequal (decorationpart (sqrrev (infsupdec (1.000000000000000021e-02, 1.000000000000000194e-02, "com"))){1}, decorationpart (infsupdec (-1.000000000000000194e-01, 1.000000000000000194e-01, "trv")){1}));
%!test
%! assert (isequal (sqrrev (infsupdec (0.0, 3.999999999999986233e+00, "def")), infsupdec (-1.999999999999996669e+00, 1.999999999999996669e+00, "trv")));
%! assert (isequal (decorationpart (sqrrev (infsupdec (0.0, 3.999999999999986233e+00, "def"))){1}, decorationpart (infsupdec (-1.999999999999996669e+00, 1.999999999999996669e+00, "trv")){1}));

## minimal_sqrRev_dec_bin_test

%!test
%! assert (isequal (sqrrev (infsupdec (empty, "trv"), infsupdec (-5.0, 1.0, "def")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (sqrrev (infsupdec (empty, "trv"), infsupdec (-5.0, 1.0, "def"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (sqrrev (infsupdec (-10.0, -1.0, "com"), infsupdec (-5.0, 1.0, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (sqrrev (infsupdec (-10.0, -1.0, "com"), infsupdec (-5.0, 1.0, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (sqrrev (infsupdec (0.0, inf, "def"), infsupdec (-5.0, 1.0, "dac")), infsupdec (-5.0, 1.0, "trv")));
%! assert (isequal (decorationpart (sqrrev (infsupdec (0.0, inf, "def"), infsupdec (-5.0, 1.0, "dac"))){1}, decorationpart (infsupdec (-5.0, 1.0, "trv")){1}));
%!test
%! assert (isequal (sqrrev (infsupdec (0.0, 1.0, "dac"), infsupdec (-0.1, 1.0, "def")), infsupdec (-0.1, 1.0, "trv")));
%! assert (isequal (decorationpart (sqrrev (infsupdec (0.0, 1.0, "dac"), infsupdec (-0.1, 1.0, "def"))){1}, decorationpart (infsupdec (-0.1, 1.0, "trv")){1}));
%!test
%! assert (isequal (sqrrev (infsupdec (-0.5, 1.0, "def"), infsupdec (-0.1, 1.0, "dac")), infsupdec (-0.1, 1.0, "trv")));
%! assert (isequal (decorationpart (sqrrev (infsupdec (-0.5, 1.0, "def"), infsupdec (-0.1, 1.0, "dac"))){1}, decorationpart (infsupdec (-0.1, 1.0, "trv")){1}));
%!test
%! assert (isequal (sqrrev (infsupdec (-1000.0, 1.0, "com"), infsupdec (-0.1, 1.0, "def")), infsupdec (-0.1, 1.0, "trv")));
%! assert (isequal (decorationpart (sqrrev (infsupdec (-1000.0, 1.0, "com"), infsupdec (-0.1, 1.0, "def"))){1}, decorationpart (infsupdec (-0.1, 1.0, "trv")){1}));
%!test
%! assert (isequal (sqrrev (infsupdec (0.0, 25.0, "def"), infsupdec (-4.1, 6.0, "com")), infsupdec (-4.1, 5.0, "trv")));
%! assert (isequal (decorationpart (sqrrev (infsupdec (0.0, 25.0, "def"), infsupdec (-4.1, 6.0, "com"))){1}, decorationpart (infsupdec (-4.1, 5.0, "trv")){1}));
%!test
%! assert (isequal (sqrrev (infsupdec (-1.0, 25.0, "dac"), infsupdec (-4.1, 7.0, "def")), infsupdec (-4.1, 5.0, "trv")));
%! assert (isequal (decorationpart (sqrrev (infsupdec (-1.0, 25.0, "dac"), infsupdec (-4.1, 7.0, "def"))){1}, decorationpart (infsupdec (-4.1, 5.0, "trv")){1}));
%!test
%! assert (isequal (sqrrev (infsupdec (1.0, 25.0, "dac"), infsupdec (0.0, 7.0, "def")), infsupdec (1.0, 5.0, "trv")));
%! assert (isequal (decorationpart (sqrrev (infsupdec (1.0, 25.0, "dac"), infsupdec (0.0, 7.0, "def"))){1}, decorationpart (infsupdec (1.0, 5.0, "trv")){1}));
%!test
%! assert (isequal (sqrrev (infsupdec (1.000000000000000021e-02, 1.000000000000000194e-02, "def"), infsupdec (-0.1, inf, "dac")), infsupdec (-0.1, 1.000000000000000194e-01, "trv")));
%! assert (isequal (decorationpart (sqrrev (infsupdec (1.000000000000000021e-02, 1.000000000000000194e-02, "def"), infsupdec (-0.1, inf, "dac"))){1}, decorationpart (infsupdec (-0.1, 1.000000000000000194e-01, "trv")){1}));
%!test
%! assert (isequal (sqrrev (infsupdec (0.0, 3.999999999999986233e+00, "dac"), infsupdec (-0.1, inf, "dac")), infsupdec (-0.1, 1.999999999999996669e+00, "trv")));
%! assert (isequal (decorationpart (sqrrev (infsupdec (0.0, 3.999999999999986233e+00, "dac"), infsupdec (-0.1, inf, "dac"))){1}, decorationpart (infsupdec (-0.1, 1.999999999999996669e+00, "trv")){1}));

## minimal_absRev_test

%!test
%! assert (isequal (absrev (infsup), infsup));
%!test
%! assert (isequal (absrev (infsup (-1.1, -0.4)), infsup));
%!test
%! assert (isequal (absrev (infsup (0.0, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (absrev (infsup (1.1, 2.1)), infsup (-2.1, 2.1)));
%!test
%! assert (isequal (absrev (infsup (-1.1, 2.0)), infsup (-2.0, 2.0)));
%!test
%! assert (isequal (absrev (infsup (-1.1, 0.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (absrev (infsup (-1.9, 0.2)), infsup (-0.2, 0.2)));
%!test
%! assert (isequal (absrev (infsup (0.0, 0.2)), infsup (-0.2, 0.2)));
%!test
%! assert (isequal (absrev (infsup (-1.5, inf)), infsup (-inf, inf)));

## minimal_absRevBin_test

%!test
%! assert (isequal (absrev (infsup, infsup (-1.1, 5.0)), infsup));
%!test
%! assert (isequal (absrev (infsup (-1.1, -0.4), infsup (-1.1, 5.0)), infsup));
%!test
%! assert (isequal (absrev (infsup (0.0, inf), infsup (-1.1, 5.0)), infsup (-1.1, 5.0)));
%!test
%! assert (isequal (absrev (infsup (1.1, 2.1), infsup (-1.0, 5.0)), infsup (1.1, 2.1)));
%!test
%! assert (isequal (absrev (infsup (-1.1, 2.0), infsup (-1.1, 5.0)), infsup (-1.1, 2.0)));
%!test
%! assert (isequal (absrev (infsup (-1.1, 0.0), infsup (-1.1, 5.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (absrev (infsup (-1.9, 0.2), infsup (-1.1, 5.0)), infsup (-0.2, 0.2)));

## minimal_absRev_dec_test

%!test
%! assert (isequal (absrev (infsupdec (empty, "trv")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (absrev (infsupdec (empty, "trv"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (absrev (infsupdec (-1.1, -0.4, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (absrev (infsupdec (-1.1, -0.4, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (absrev (infsupdec (0.0, inf, "dac")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (absrev (infsupdec (0.0, inf, "dac"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%!test
%! assert (isequal (absrev (infsupdec (1.1, 2.1, "com")), infsupdec (-2.1, 2.1, "trv")));
%! assert (isequal (decorationpart (absrev (infsupdec (1.1, 2.1, "com"))){1}, decorationpart (infsupdec (-2.1, 2.1, "trv")){1}));
%!test
%! assert (isequal (absrev (infsupdec (-1.1, 2.0, "def")), infsupdec (-2.0, 2.0, "trv")));
%! assert (isequal (decorationpart (absrev (infsupdec (-1.1, 2.0, "def"))){1}, decorationpart (infsupdec (-2.0, 2.0, "trv")){1}));
%!test
%! assert (isequal (absrev (infsupdec (-1.1, 0.0, "dac")), infsupdec (0.0, 0.0, "trv")));
%! assert (isequal (decorationpart (absrev (infsupdec (-1.1, 0.0, "dac"))){1}, decorationpart (infsupdec (0.0, 0.0, "trv")){1}));
%!test
%! assert (isequal (absrev (infsupdec (-1.9, 0.2, "com")), infsupdec (-0.2, 0.2, "trv")));
%! assert (isequal (decorationpart (absrev (infsupdec (-1.9, 0.2, "com"))){1}, decorationpart (infsupdec (-0.2, 0.2, "trv")){1}));
%!test
%! assert (isequal (absrev (infsupdec (0.0, 0.2, "def")), infsupdec (-0.2, 0.2, "trv")));
%! assert (isequal (decorationpart (absrev (infsupdec (0.0, 0.2, "def"))){1}, decorationpart (infsupdec (-0.2, 0.2, "trv")){1}));
%!test
%! assert (isequal (absrev (infsupdec (-1.5, inf, "def")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (absrev (infsupdec (-1.5, inf, "def"))){1}, decorationpart (infsupdec (entire, "trv")){1}));

## minimal_absRev_dec_bin_test

%!test
%! assert (isequal (absrev (infsupdec (empty, "trv"), infsupdec (-1.1, 5.0, "com")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (absrev (infsupdec (empty, "trv"), infsupdec (-1.1, 5.0, "com"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (absrev (infsupdec (-1.1, -0.4, "dac"), infsupdec (-1.1, 5.0, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (absrev (infsupdec (-1.1, -0.4, "dac"), infsupdec (-1.1, 5.0, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (absrev (infsupdec (0.0, inf, "def"), infsupdec (-1.1, 5.0, "def")), infsupdec (-1.1, 5.0, "trv")));
%! assert (isequal (decorationpart (absrev (infsupdec (0.0, inf, "def"), infsupdec (-1.1, 5.0, "def"))){1}, decorationpart (infsupdec (-1.1, 5.0, "trv")){1}));
%!test
%! assert (isequal (absrev (infsupdec (1.1, 2.1, "dac"), infsupdec (-1.0, 5.0, "def")), infsupdec (1.1, 2.1, "trv")));
%! assert (isequal (decorationpart (absrev (infsupdec (1.1, 2.1, "dac"), infsupdec (-1.0, 5.0, "def"))){1}, decorationpart (infsupdec (1.1, 2.1, "trv")){1}));
%!test
%! assert (isequal (absrev (infsupdec (-1.1, 2.0, "com"), infsupdec (-1.1, 5.0, "def")), infsupdec (-1.1, 2.0, "trv")));
%! assert (isequal (decorationpart (absrev (infsupdec (-1.1, 2.0, "com"), infsupdec (-1.1, 5.0, "def"))){1}, decorationpart (infsupdec (-1.1, 2.0, "trv")){1}));
%!test
%! assert (isequal (absrev (infsupdec (-1.1, 0.0, "def"), infsupdec (-1.1, 5.0, "def")), infsupdec (0.0, 0.0, "trv")));
%! assert (isequal (decorationpart (absrev (infsupdec (-1.1, 0.0, "def"), infsupdec (-1.1, 5.0, "def"))){1}, decorationpart (infsupdec (0.0, 0.0, "trv")){1}));
%!test
%! assert (isequal (absrev (infsupdec (-1.9, 0.2, "dac"), infsupdec (-1.1, 5.0, "def")), infsupdec (-0.2, 0.2, "trv")));
%! assert (isequal (decorationpart (absrev (infsupdec (-1.9, 0.2, "dac"), infsupdec (-1.1, 5.0, "def"))){1}, decorationpart (infsupdec (-0.2, 0.2, "trv")){1}));

## minimal_pownRev_test

%!test
%! assert (isequal (pownrev (infsup, 0), infsup));
%!test
%! assert (isequal (pownrev (infsup (1.0, 1.0), 0), infsup (-inf, inf)));
%!test
%! assert (isequal (pownrev (infsup (-1.0, 5.0), 0), infsup (-inf, inf)));
%!test
%! assert (isequal (pownrev (infsup (-1.0, 0.0), 0), infsup));
%!test
%! assert (isequal (pownrev (infsup (-1.0, -0.0), 0), infsup));
%!test
%! assert (isequal (pownrev (infsup (1.1, 10.0), 0), infsup));
%!test
%! assert (isequal (pownrev (infsup, 1), infsup));
%!test
%! assert (isequal (pownrev (infsup (-inf, inf), 1), infsup (-inf, inf)));
%!test
%! assert (isequal (pownrev (infsup (0.0, 0.0), 1), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pownrev (infsup (-0.0, -0.0), 1), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pownrev (infsup (13.1, 13.1), 1), infsup (13.1, 13.1)));
%!test
%! assert (isequal (pownrev (infsup (-7451.145, -7451.145), 1), infsup (-7451.145, -7451.145)));
%!test
%! assert (isequal (pownrev (infsup (1.797693134862315708e+308, 1.797693134862315708e+308), 1), infsup (1.797693134862315708e+308, 1.797693134862315708e+308)));
%!test
%! assert (isequal (pownrev (infsup (-1.797693134862315708e+308, -1.797693134862315708e+308), 1), infsup (-1.797693134862315708e+308, -1.797693134862315708e+308)));
%!test
%! assert (isequal (pownrev (infsup (0.0, inf), 1), infsup (0.0, inf)));
%!test
%! assert (isequal (pownrev (infsup (-0.0, inf), 1), infsup (0.0, inf)));
%!test
%! assert (isequal (pownrev (infsup (-inf, 0.0), 1), infsup (-inf, 0.0)));
%!test
%! assert (isequal (pownrev (infsup (-inf, -0.0), 1), infsup (-inf, 0.0)));
%!test
%! assert (isequal (pownrev (infsup (-324.3, 2.5), 1), infsup (-324.3, 2.5)));
%!test
%! assert (isequal (pownrev (infsup (0.01, 2.33), 1), infsup (0.01, 2.33)));
%!test
%! assert (isequal (pownrev (infsup (-1.9, -0.33), 1), infsup (-1.9, -0.33)));
%!test
%! assert (isequal (pownrev (infsup, 2), infsup));
%!test
%! assert (isequal (pownrev (infsup (-5.0, -1.0), 2), infsup));
%!test
%! assert (isequal (pownrev (infsup (0.0, inf), 2), infsup (-inf, inf)));
%!test
%! assert (isequal (pownrev (infsup (-0.0, inf), 2), infsup (-inf, inf)));
%!test
%! assert (isequal (pownrev (infsup (0.0, 0.0), 2), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pownrev (infsup (-0.0, -0.0), 2), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pownrev (infsup (1.716099999999999852e+02, 1.716100000000000136e+02), 2), infsup (-1.310000000000000142e+01, 1.310000000000000142e+01)));
%!test
%! assert (isequal (pownrev (infsup (5.551956181102500111e+07, 5.551956181102500856e+07), 2), infsup (-7.451145000000001346e+03, 7.451145000000001346e+03)));
%!test
%! assert (isequal (pownrev (infsup (1.797693134862315708e+308, 1.797693134862315708e+308), 2), infsup (-1.340780792994259710e+154, 1.340780792994259710e+154)));
%!test
%! assert (isequal (pownrev (infsup (0.0, 1.051704900000000198e+05), 2), infsup (-3.243000000000000682e+02, 3.243000000000000682e+02)));
%!test
%! assert (isequal (pownrev (infsup (-0.0, 1.051704900000000198e+05), 2), infsup (-3.243000000000000682e+02, 3.243000000000000682e+02)));
%!test
%! assert (isequal (pownrev (infsup (9.999999999999999124e-05, 5.428900000000000503e+00), 2), infsup (-2.330000000000000515e+00, 2.330000000000000515e+00)));
%!test
%! assert (isequal (pownrev (infsup (1.088999999999999968e-01, 3.609999999999999876e+00), 2), infsup (-1.900000000000000133e+00, 1.900000000000000133e+00)));
%!test
%! assert (isequal (pownrev (infsup, 8), infsup));
%!test
%! assert (isequal (pownrev (infsup (-inf, inf), 8), infsup (-inf, inf)));
%!test
%! assert (isequal (pownrev (infsup (0.0, inf), 8), infsup (-inf, inf)));
%!test
%! assert (isequal (pownrev (infsup (-0.0, inf), 8), infsup (-inf, inf)));
%!test
%! assert (isequal (pownrev (infsup (0.0, 0.0), 8), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pownrev (infsup (-0.0, -0.0), 8), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pownrev (infsup (8.673020346900621653e+08, 8.673020346900622845e+08), 8), infsup (-1.310000000000000142e+01, 1.310000000000000142e+01)));
%!test
%! assert (isequal (pownrev (infsup (9.501323805961964567e+30, 9.501323805961965692e+30), 8), infsup (-7.451145000000001346e+03, 7.451145000000001346e+03)));
%!test
%! assert (isequal (pownrev (infsup (1.797693134862315708e+308, 1.797693134862315708e+308), 8), infsup (-3.402823669209384635e+38, 3.402823669209384635e+38)));
%!test
%! assert (isequal (pownrev (infsup (0.0, 1.223420037986718843e+20), 8), infsup (-3.243000000000000682e+02, 3.243000000000000682e+02)));
%!test
%! assert (isequal (pownrev (infsup (-0.0, 1.223420037986718843e+20), 8), infsup (-3.243000000000000682e+02, 3.243000000000000682e+02)));
%!test
%! assert (isequal (pownrev (infsup (1.000000000000000102e-16, 8.686550888106663706e+02), 8), infsup (-2.330000000000000515e+00, 2.330000000000000515e+00)));
%!test
%! assert (isequal (pownrev (infsup (1.406408618241000491e-04, 1.698356304099999647e+02), 8), infsup (-1.900000000000000133e+00, 1.900000000000000133e+00)));
%!test
%! assert (isequal (pownrev (infsup, 3), infsup));
%!test
%! assert (isequal (pownrev (infsup (-inf, inf), 3), infsup (-inf, inf)));
%!test
%! assert (isequal (pownrev (infsup (0.0, 0.0), 3), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pownrev (infsup (-0.0, -0.0), 3), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pownrev (infsup (2.248090999999999440e+03, 2.248090999999999894e+03), 3), infsup (1.309999999999999787e+01, 1.310000000000000142e+01)));
%!test
%! assert (isequal (pownrev (infsup (-4.136843053904099731e+11, -4.136843053904099121e+11), 3), infsup (-7.451145000000001346e+03, -7.451144999999999527e+03)));
%!test
%! assert (isequal (pownrev (infsup (1.797693134862315708e+308, 1.797693134862315708e+308), 3), infsup (5.643803094122361304e+102, 5.643803094122362298e+102)));
%!test
%! assert (isequal (pownrev (infsup (-1.797693134862315708e+308, -1.797693134862315708e+308), 3), infsup (-5.643803094122362298e+102, -5.643803094122361304e+102)));
%!test
%! assert (isequal (pownrev (infsup (0.0, inf), 3), infsup (0.0, inf)));
%!test
%! assert (isequal (pownrev (infsup (-0.0, inf), 3), infsup (0.0, inf)));
%!test
%! assert (isequal (pownrev (infsup (-inf, 0.0), 3), infsup (-inf, 0.0)));
%!test
%! assert (isequal (pownrev (infsup (-inf, -0.0), 3), infsup (-inf, 0.0)));
%!test
%! assert (isequal (pownrev (infsup (-3.410678990700000525e+07, 1.562500000000000000e+01), 3), infsup (-3.243000000000000682e+02, 2.500000000000000000e+00)));
%!test
%! assert (isequal (pownrev (infsup (9.999999999999999547e-07, 1.264933700000000272e+01), 3), infsup (9.999999999999998473e-03, 2.330000000000000515e+00)));
%!test
%! assert (isequal (pownrev (infsup (-6.858999999999999098e+00, -3.593700000000000366e-02), 3), infsup (-1.900000000000000133e+00, -3.299999999999999600e-01)));
%!test
%! assert (isequal (pownrev (infsup, 7), infsup));
%!test
%! assert (isequal (pownrev (infsup (-inf, inf), 7), infsup (-inf, inf)));
%!test
%! assert (isequal (pownrev (infsup (0.0, 0.0), 7), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pownrev (infsup (-0.0, -0.0), 7), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pownrev (infsup (6.620626219008108228e+07, 6.620626219008108974e+07), 7), infsup (1.309999999999999787e+01, 1.310000000000000142e+01)));
%!test
%! assert (isequal (pownrev (infsup (-1.275149497957960280e+27, -1.275149497957960005e+27), 7), infsup (-7.451145000000001346e+03, -7.451144999999999527e+03)));
%!test
%! assert (isequal (pownrev (infsup (1.797693134862315708e+308, 1.797693134862315708e+308), 7), infsup (1.087396515837748951e+44, 1.087396515837749149e+44)));
%!test
%! assert (isequal (pownrev (infsup (-1.797693134862315708e+308, -1.797693134862315708e+308), 7), infsup (-1.087396515837749149e+44, -1.087396515837748951e+44)));
%!test
%! assert (isequal (pownrev (infsup (0.0, inf), 7), infsup (0.0, inf)));
%!test
%! assert (isequal (pownrev (infsup (-0.0, inf), 7), infsup (0.0, inf)));
%!test
%! assert (isequal (pownrev (infsup (-inf, 0.0), 7), infsup (-inf, 0.0)));
%!test
%! assert (isequal (pownrev (infsup (-inf, -0.0), 7), infsup (-inf, 0.0)));
%!test
%! assert (isequal (pownrev (infsup (-3.772494720896449920e+17, 6.103515625000000000e+02), 7), infsup (-3.243000000000000682e+02, 2.500000000000000000e+00)));
%!test
%! assert (isequal (pownrev (infsup (9.999999999999999988e-15, 3.728133428371958757e+02), 7), infsup (9.999999999999998473e-03, 2.330000000000000515e+00)));
%!test
%! assert (isequal (pownrev (infsup (-8.938717389999997920e+01, -4.261844297700001028e-04), 7), infsup (-1.900000000000000133e+00, -3.299999999999999600e-01)));
%!test
%! assert (isequal (pownrev (infsup, -2), infsup));
%!test
%! assert (isequal (pownrev (infsup (0.0, inf), -2), infsup (-inf, inf)));
%!test
%! assert (isequal (pownrev (infsup (-0.0, inf), -2), infsup (-inf, inf)));
%!test
%! assert (isequal (pownrev (infsup (0.0, 0.0), -2), infsup));
%!test
%! assert (isequal (pownrev (infsup (-0.0, -0.0), -2), infsup));
%!test
%! assert (isequal (pownrev (infsup (-10.0, 0.0), -2), infsup));
%!test
%! assert (isequal (pownrev (infsup (-10.0, -0.0), -2), infsup));
%!test
%! assert (isequal (pownrev (infsup (5.827166249053085390e-03, 5.827166249053086257e-03), -2), infsup (-1.310000000000000142e+01, 1.310000000000000142e+01)));
%!test
%! assert (isequal (pownrev (infsup (1.801166953377180740e-08, 1.801166953377181071e-08), -2), infsup (-7.451145000000001346e+03, 7.451145000000001346e+03)));
%!test
%! assert (isequal (pownrev (infsup (0.000000000000000000e+00, 4.940656458412465442e-324), -2), infsup (-inf, inf)));
%!test
%! assert (isequal (pownrev (infsup (9.508370646556841917e-06, inf), -2), infsup (-3.243000000000000682e+02, 3.243000000000000682e+02)));
%!test
%! assert (isequal (pownrev (infsup (1.841993774061043421e-01, 1.000000000000000000e+04), -2), infsup (-2.330000000000000515e+00, 2.330000000000000515e+00)));
%!test
%! assert (isequal (pownrev (infsup (2.770083102493074989e-01, 9.182736455463727410e+00), -2), infsup (-1.900000000000000133e+00, 1.900000000000000133e+00)));
%!test
%! assert (isequal (pownrev (infsup, -8), infsup));
%!test
%! assert (isequal (pownrev (infsup (0.0, inf), -8), infsup (-inf, inf)));
%!test
%! assert (isequal (pownrev (infsup (-0.0, inf), -8), infsup (-inf, inf)));
%!test
%! assert (isequal (pownrev (infsup (0.0, 0.0), -8), infsup));
%!test
%! assert (isequal (pownrev (infsup (-0.0, -0.0), -8), infsup));
%!test
%! assert (isequal (pownrev (infsup (1.153000869365374417e-09, 1.153000869365374624e-09), -8), infsup (-1.310000000000000142e+01, 1.310000000000000142e+01)));
%!test
%! assert (isequal (pownrev (infsup (1.052484917283328578e-31, 1.052484917283328797e-31), -8), infsup (-7.451145000000001346e+03, 7.451145000000001346e+03)));
%!test
%! assert (isequal (pownrev (infsup (0.000000000000000000e+00, 4.940656458412465442e-324), -8), infsup (-inf, inf)));
%!test
%! assert (isequal (pownrev (infsup (8.173807596331487643e-21, inf), -8), infsup (-3.243000000000000682e+02, 3.243000000000000682e+02)));
%!test
%! assert (isequal (pownrev (infsup (1.151204906160357110e-03, 1.000000000000000000e+16), -8), infsup (-2.330000000000000515e+00, 2.330000000000000515e+00)));
%!test
%! assert (isequal (pownrev (infsup (5.888045974722156024e-03, 7.110309102419345436e+03), -8), infsup (-1.900000000000000133e+00, 1.900000000000000133e+00)));
%!test
%! assert (isequal (pownrev (infsup, -1), infsup));
%!test
%! assert (isequal (pownrev (infsup (-inf, inf), -1), infsup (-inf, inf)));
%!test
%! assert (isequal (pownrev (infsup (0.0, 0.0), -1), infsup));
%!test
%! assert (isequal (pownrev (infsup (-0.0, -0.0), -1), infsup));
%!test
%! assert (isequal (pownrev (infsup (7.633587786259540819e-02, 7.633587786259542207e-02), -1), infsup (1.309999999999999787e+01, 1.310000000000000320e+01)));
%!test
%! assert (isequal (pownrev (infsup (-1.342075613882161712e-04, -1.342075613882161441e-04), -1), infsup (-7.451145000000002256e+03, -7.451144999999999527e+03)));
%!test
%! assert (isequal (pownrev (infsup (5.562684646268003458e-309, 5.562684646268008398e-309), -1), infsup (1.797693134862314311e+308, inf)));
%!test
%! assert (isequal (pownrev (infsup (-5.562684646268008398e-309, -5.562684646268003458e-309), -1), infsup (-inf, -1.797693134862314311e+308)));
%!test
%! assert (isequal (pownrev (infsup (0.0, inf), -1), infsup (0.0, inf)));
%!test
%! assert (isequal (pownrev (infsup (-0.0, inf), -1), infsup (0.0, inf)));
%!test
%! assert (isequal (pownrev (infsup (-inf, 0.0), -1), infsup (-inf, 0.0)));
%!test
%! assert (isequal (pownrev (infsup (-inf, -0.0), -1), infsup (-inf, 0.0)));
%!test
%! assert (isequal (pownrev (infsup (4.291845493562231328e-01, 1.000000000000000000e+02), -1), infsup (9.999999999999998473e-03, 2.330000000000000515e+00)));
%!test
%! assert (isequal (pownrev (infsup (-3.030303030303030276e+00, -5.263157894736841813e-01), -1), infsup (-1.900000000000000133e+00, -3.299999999999999600e-01)));
%!test
%! assert (isequal (pownrev (infsup, -3), infsup));
%!test
%! assert (isequal (pownrev (infsup (-inf, inf), -3), infsup (-inf, inf)));
%!test
%! assert (isequal (pownrev (infsup (0.0, 0.0), -3), infsup));
%!test
%! assert (isequal (pownrev (infsup (-0.0, -0.0), -3), infsup));
%!test
%! assert (isequal (pownrev (infsup (4.448218510727546177e-04, 4.448218510727546720e-04), -3), infsup (1.309999999999999787e+01, 1.310000000000000142e+01)));
%!test
%! assert (isequal (pownrev (infsup (-2.417302244657943502e-12, -2.417302244657943098e-12), -3), infsup (-7.451145000000001346e+03, -7.451144999999999527e+03)));
%!test
%! assert (isequal (pownrev (infsup (0.000000000000000000e+00, 4.940656458412465442e-324), -3), infsup (5.871356456934583070e+107, inf)));
%!test
%! assert (isequal (pownrev (infsup (-4.940656458412465442e-324, -0.000000000000000000e+00), -3), infsup (-inf, -5.871356456934583070e+107)));
%!test
%! assert (isequal (pownrev (infsup (0.0, inf), -3), infsup (0.0, inf)));
%!test
%! assert (isequal (pownrev (infsup (-0.0, inf), -3), infsup (0.0, inf)));
%!test
%! assert (isequal (pownrev (infsup (-inf, 0.0), -3), infsup (-inf, 0.0)));
%!test
%! assert (isequal (pownrev (infsup (-inf, -0.0), -3), infsup (-inf, 0.0)));
%!test
%! assert (isequal (pownrev (infsup (7.905552678373577169e-02, 1.000000000000000000e+06), -3), infsup (9.999999999999998473e-03, 2.330000000000000515e+00)));
%!test
%! assert (isequal (pownrev (infsup (-2.782647410746584171e+01, -1.457938474996355316e-01), -3), infsup (-1.900000000000000133e+00, -3.299999999999999600e-01)));
%!test
%! assert (isequal (pownrev (infsup, -7), infsup));
%!test
%! assert (isequal (pownrev (infsup (-inf, inf), -7), infsup (-inf, inf)));
%!test
%! assert (isequal (pownrev (infsup (0.0, 0.0), -7), infsup));
%!test
%! assert (isequal (pownrev (infsup (-0.0, -0.0), -7), infsup));
%!test
%! assert (isequal (pownrev (infsup (1.510431138868640339e-08, 1.510431138868640670e-08), -7), infsup (1.309999999999999787e+01, 1.310000000000000142e+01)));
%!test
%! assert (isequal (pownrev (infsup (-7.842217728991088300e-28, -7.842217728991087403e-28), -7), infsup (-7.451145000000001346e+03, -7.451144999999999527e+03)));
%!test
%! assert (isequal (pownrev (infsup (0.000000000000000000e+00, 4.940656458412465442e-324), -7), infsup (1.536746355637629315e+46, inf)));
%!test
%! assert (isequal (pownrev (infsup (-4.940656458412465442e-324, -0.000000000000000000e+00), -7), infsup (-inf, -1.536746355637629315e+46)));
%!test
%! assert (isequal (pownrev (infsup (0.0, inf), -7), infsup (0.0, inf)));
%!test
%! assert (isequal (pownrev (infsup (-0.0, inf), -7), infsup (0.0, inf)));
%!test
%! assert (isequal (pownrev (infsup (-inf, 0.0), -7), infsup (-inf, 0.0)));
%!test
%! assert (isequal (pownrev (infsup (-inf, -0.0), -7), infsup (-inf, 0.0)));
%!test
%! assert (isequal (pownrev (infsup (2.682307431353632161e-03, 1.000000000000000000e+14), -7), infsup (9.999999999999998473e-03, 2.330000000000000515e+00)));
%!test
%! assert (isequal (pownrev (infsup (-2.346402003798384158e+03, -1.118728735197209619e-02), -7), infsup (-1.900000000000000133e+00, -3.299999999999999600e-01)));

## minimal_pownRevBin_test

%!test
%! assert (isequal (pownrev (infsup, infsup (1.0, 1.0), 0), infsup));
%!test
%! assert (isequal (pownrev (infsup (1.0, 1.0), infsup (1.0, 1.0), 0), infsup (1.0, 1.0)));
%!test
%! assert (isequal (pownrev (infsup (-1.0, 5.0), infsup (-51.0, 12.0), 0), infsup (-51.0, 12.0)));
%!test
%! assert (isequal (pownrev (infsup (-1.0, 0.0), infsup (5.0, 10.0), 0), infsup));
%!test
%! assert (isequal (pownrev (infsup (-1.0, -0.0), infsup (-1.0, 1.0), 0), infsup));
%!test
%! assert (isequal (pownrev (infsup (1.1, 10.0), infsup (1.0, 41.0), 0), infsup));
%!test
%! assert (isequal (pownrev (infsup, infsup (0.0, 100.1), 1), infsup));
%!test
%! assert (isequal (pownrev (infsup (-inf, inf), infsup (-5.1, 10.0), 1), infsup (-5.1, 10.0)));
%!test
%! assert (isequal (pownrev (infsup (0.0, 0.0), infsup (-10.0, 5.1), 1), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pownrev (infsup (-0.0, -0.0), infsup (1.0, 5.0), 1), infsup));
%!test
%! assert (isequal (pownrev (infsup, infsup (5.0, 17.1), 2), infsup));
%!test
%! assert (isequal (pownrev (infsup (-5.0, -1.0), infsup (5.0, 17.1), 2), infsup));
%!test
%! assert (isequal (pownrev (infsup (0.0, inf), infsup (5.6, 27.544), 2), infsup (5.6, 27.544)));
%!test
%! assert (isequal (pownrev (infsup (0.0, 0.0), infsup (1.0, 2.0), 2), infsup));
%!test
%! assert (isequal (pownrev (infsup (9.999999999999999124e-05, 5.428900000000000503e+00), infsup (1.0, inf), 2), infsup (1.0, 2.330000000000000515e+00)));
%!test
%! assert (isequal (pownrev (infsup (1.088999999999999968e-01, 3.609999999999999876e+00), infsup (-inf, -1.0), 2), infsup (-1.900000000000000133e+00, -1.0)));
%!test
%! assert (isequal (pownrev (infsup, infsup (-23.0, -1.0), 3), infsup));
%!test
%! assert (isequal (pownrev (infsup (-inf, inf), infsup (-23.0, -1.0), 3), infsup (-23.0, -1.0)));
%!test
%! assert (isequal (pownrev (infsup (0.0, 0.0), infsup (1.0, 2.0), 3), infsup));
%!test
%! assert (isequal (pownrev (infsup (9.999999999999999547e-07, 1.264933700000000272e+01), infsup (1.0, inf), 3), infsup (1.0, 2.330000000000000515e+00)));
%!test
%! assert (isequal (pownrev (infsup (-6.858999999999999098e+00, -3.593700000000000366e-02), infsup (-inf, -1.0), 3), infsup (-1.900000000000000133e+00, -1.0)));
%!test
%! assert (isequal (pownrev (infsup, infsup (-3.0, 17.3), -2), infsup));
%!test
%! assert (isequal (pownrev (infsup (0.0, inf), infsup (-5.1, -0.1), -2), infsup (-5.1, -0.1)));
%!test
%! assert (isequal (pownrev (infsup (0.0, 0.0), infsup (27.2, 55.1), -2), infsup));
%!test
%! assert (isequal (pownrev (infsup (9.508370646556841917e-06, inf), infsup (-inf, -1.797693134862315708e+308), -2), infsup));
%!test
%! assert (isequal (pownrev (infsup (1.841993774061043421e-01, 1.000000000000000000e+04), infsup (1.0, inf), -2), infsup (1.0, 2.330000000000000515e+00)));
%!test
%! assert (isequal (pownrev (infsup (2.770083102493074989e-01, 9.182736455463727410e+00), infsup (-inf, -1.0), -2), infsup (-1.900000000000000133e+00, -1.0)));
%!test
%! assert (isequal (pownrev (infsup, infsup (-5.1, 55.5), -1), infsup));
%!test
%! assert (isequal (pownrev (infsup (-inf, inf), infsup (-5.1, 55.5), -1), infsup (-5.1, 55.5)));
%!test
%! assert (isequal (pownrev (infsup (0.0, 0.0), infsup (-5.1, 55.5), -1), infsup));
%!test
%! assert (isequal (pownrev (infsup (-inf, -0.0), infsup (-1.0, 1.0), -1), infsup (-1.0, 0.0)));
%!test
%! assert (isequal (pownrev (infsup (4.291845493562231328e-01, 1.000000000000000000e+02), infsup (-1.0, 0.0), -1), infsup));
%!test
%! assert (isequal (pownrev (infsup, infsup (-5.1, 55.5), -3), infsup));
%!test
%! assert (isequal (pownrev (infsup (-inf, inf), infsup (-5.1, 55.5), -3), infsup (-5.1, 55.5)));
%!test
%! assert (isequal (pownrev (infsup (0.0, 0.0), infsup (-5.1, 55.5), -3), infsup));
%!test
%! assert (isequal (pownrev (infsup (-inf, 0.0), infsup (5.1, 55.5), -3), infsup));
%!test
%! assert (isequal (pownrev (infsup (-inf, -0.0), infsup (-32.0, 1.1), -3), infsup (-32.0, 0.0)));

## minimal_pownRev_dec_test

%!test
%! assert (isequal (pownrev (infsupdec (empty, "trv"), 0), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (empty, "trv"), 0)){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (1.0, 1.0, "com"), 0), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (1.0, 1.0, "com"), 0)){1}, decorationpart (infsupdec (entire, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (-1.0, 5.0, "dac"), 0), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (-1.0, 5.0, "dac"), 0)){1}, decorationpart (infsupdec (entire, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (-1.0, 0.0, "def"), 0), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (-1.0, 0.0, "def"), 0)){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (-1.0, -0.0, "dac"), 0), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (-1.0, -0.0, "dac"), 0)){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (1.1, 10.0, "com"), 0), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (1.1, 10.0, "com"), 0)){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (empty, "trv"), 1), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (empty, "trv"), 1)){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (entire, "def"), 1), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (entire, "def"), 1)){1}, decorationpart (infsupdec (entire, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (0.0, 0.0, "com"), 1), infsupdec (0.0, 0.0, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (0.0, 0.0, "com"), 1)){1}, decorationpart (infsupdec (0.0, 0.0, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (-0.0, -0.0, "dac"), 1), infsupdec (0.0, 0.0, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (-0.0, -0.0, "dac"), 1)){1}, decorationpart (infsupdec (0.0, 0.0, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (13.1, 13.1, "def"), 1), infsupdec (13.1, 13.1, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (13.1, 13.1, "def"), 1)){1}, decorationpart (infsupdec (13.1, 13.1, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (-7451.145, -7451.145, "dac"), 1), infsupdec (-7451.145, -7451.145, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (-7451.145, -7451.145, "dac"), 1)){1}, decorationpart (infsupdec (-7451.145, -7451.145, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (1.797693134862315708e+308, 1.797693134862315708e+308, "com"), 1), infsupdec (1.797693134862315708e+308, 1.797693134862315708e+308, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (1.797693134862315708e+308, 1.797693134862315708e+308, "com"), 1)){1}, decorationpart (infsupdec (1.797693134862315708e+308, 1.797693134862315708e+308, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (-1.797693134862315708e+308, -1.797693134862315708e+308, "com"), 1), infsupdec (-1.797693134862315708e+308, -1.797693134862315708e+308, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (-1.797693134862315708e+308, -1.797693134862315708e+308, "com"), 1)){1}, decorationpart (infsupdec (-1.797693134862315708e+308, -1.797693134862315708e+308, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (0.0, inf, "dac"), 1), infsupdec (0.0, inf, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (0.0, inf, "dac"), 1)){1}, decorationpart (infsupdec (0.0, inf, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (-0.0, inf, "dac"), 1), infsupdec (0.0, inf, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (-0.0, inf, "dac"), 1)){1}, decorationpart (infsupdec (0.0, inf, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (-inf, 0.0, "def"), 1), infsupdec (-inf, 0.0, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (-inf, 0.0, "def"), 1)){1}, decorationpart (infsupdec (-inf, 0.0, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (-inf, -0.0, "def"), 1), infsupdec (-inf, 0.0, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (-inf, -0.0, "def"), 1)){1}, decorationpart (infsupdec (-inf, 0.0, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (-324.3, 2.5, "dac"), 1), infsupdec (-324.3, 2.5, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (-324.3, 2.5, "dac"), 1)){1}, decorationpart (infsupdec (-324.3, 2.5, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (0.01, 2.33, "com"), 1), infsupdec (0.01, 2.33, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (0.01, 2.33, "com"), 1)){1}, decorationpart (infsupdec (0.01, 2.33, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (-1.9, -0.33, "def"), 1), infsupdec (-1.9, -0.33, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (-1.9, -0.33, "def"), 1)){1}, decorationpart (infsupdec (-1.9, -0.33, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (empty, "trv"), 2), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (empty, "trv"), 2)){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (0.0, inf, "dac"), 2), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (0.0, inf, "dac"), 2)){1}, decorationpart (infsupdec (entire, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (-0.0, inf, "def"), 2), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (-0.0, inf, "def"), 2)){1}, decorationpart (infsupdec (entire, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (0.0, 0.0, "com"), 2), infsupdec (0.0, 0.0, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (0.0, 0.0, "com"), 2)){1}, decorationpart (infsupdec (0.0, 0.0, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (-0.0, -0.0, "dac"), 2), infsupdec (0.0, 0.0, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (-0.0, -0.0, "dac"), 2)){1}, decorationpart (infsupdec (0.0, 0.0, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (1.716099999999999852e+02, 1.716100000000000136e+02, "def"), 2), infsupdec (-1.310000000000000142e+01, 1.310000000000000142e+01, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (1.716099999999999852e+02, 1.716100000000000136e+02, "def"), 2)){1}, decorationpart (infsupdec (-1.310000000000000142e+01, 1.310000000000000142e+01, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (5.551956181102500111e+07, 5.551956181102500856e+07, "def"), 2), infsupdec (-7.451145000000001346e+03, 7.451145000000001346e+03, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (5.551956181102500111e+07, 5.551956181102500856e+07, "def"), 2)){1}, decorationpart (infsupdec (-7.451145000000001346e+03, 7.451145000000001346e+03, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (1.797693134862315708e+308, 1.797693134862315708e+308, "dac"), 2), infsupdec (-1.340780792994259710e+154, 1.340780792994259710e+154, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (1.797693134862315708e+308, 1.797693134862315708e+308, "dac"), 2)){1}, decorationpart (infsupdec (-1.340780792994259710e+154, 1.340780792994259710e+154, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (0.0, 1.051704900000000198e+05, "dac"), 2), infsupdec (-3.243000000000000682e+02, 3.243000000000000682e+02, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (0.0, 1.051704900000000198e+05, "dac"), 2)){1}, decorationpart (infsupdec (-3.243000000000000682e+02, 3.243000000000000682e+02, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (-0.0, 1.051704900000000198e+05, "def"), 2), infsupdec (-3.243000000000000682e+02, 3.243000000000000682e+02, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (-0.0, 1.051704900000000198e+05, "def"), 2)){1}, decorationpart (infsupdec (-3.243000000000000682e+02, 3.243000000000000682e+02, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (9.999999999999999124e-05, 5.428900000000000503e+00, "com"), 2), infsupdec (-2.330000000000000515e+00, 2.330000000000000515e+00, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (9.999999999999999124e-05, 5.428900000000000503e+00, "com"), 2)){1}, decorationpart (infsupdec (-2.330000000000000515e+00, 2.330000000000000515e+00, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (1.088999999999999968e-01, 3.609999999999999876e+00, "def"), 2), infsupdec (-1.900000000000000133e+00, 1.900000000000000133e+00, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (1.088999999999999968e-01, 3.609999999999999876e+00, "def"), 2)){1}, decorationpart (infsupdec (-1.900000000000000133e+00, 1.900000000000000133e+00, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (empty, "trv"), 8), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (empty, "trv"), 8)){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (entire, "def"), 8), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (entire, "def"), 8)){1}, decorationpart (infsupdec (entire, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (0.0, inf, "dac"), 8), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (0.0, inf, "dac"), 8)){1}, decorationpart (infsupdec (entire, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (-0.0, inf, "dac"), 8), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (-0.0, inf, "dac"), 8)){1}, decorationpart (infsupdec (entire, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (0.0, 0.0, "def"), 8), infsupdec (0.0, 0.0, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (0.0, 0.0, "def"), 8)){1}, decorationpart (infsupdec (0.0, 0.0, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (-0.0, -0.0, "dac"), 8), infsupdec (0.0, 0.0, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (-0.0, -0.0, "dac"), 8)){1}, decorationpart (infsupdec (0.0, 0.0, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (8.673020346900621653e+08, 8.673020346900622845e+08, "com"), 8), infsupdec (-1.310000000000000142e+01, 1.310000000000000142e+01, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (8.673020346900621653e+08, 8.673020346900622845e+08, "com"), 8)){1}, decorationpart (infsupdec (-1.310000000000000142e+01, 1.310000000000000142e+01, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (9.501323805961964567e+30, 9.501323805961965692e+30, "dac"), 8), infsupdec (-7.451145000000001346e+03, 7.451145000000001346e+03, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (9.501323805961964567e+30, 9.501323805961965692e+30, "dac"), 8)){1}, decorationpart (infsupdec (-7.451145000000001346e+03, 7.451145000000001346e+03, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (1.797693134862315708e+308, 1.797693134862315708e+308, "def"), 8), infsupdec (-3.402823669209384635e+38, 3.402823669209384635e+38, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (1.797693134862315708e+308, 1.797693134862315708e+308, "def"), 8)){1}, decorationpart (infsupdec (-3.402823669209384635e+38, 3.402823669209384635e+38, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (0.0, 1.223420037986718843e+20, "dac"), 8), infsupdec (-3.243000000000000682e+02, 3.243000000000000682e+02, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (0.0, 1.223420037986718843e+20, "dac"), 8)){1}, decorationpart (infsupdec (-3.243000000000000682e+02, 3.243000000000000682e+02, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (-0.0, 1.223420037986718843e+20, "def"), 8), infsupdec (-3.243000000000000682e+02, 3.243000000000000682e+02, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (-0.0, 1.223420037986718843e+20, "def"), 8)){1}, decorationpart (infsupdec (-3.243000000000000682e+02, 3.243000000000000682e+02, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (1.000000000000000102e-16, 8.686550888106663706e+02, "com"), 8), infsupdec (-2.330000000000000515e+00, 2.330000000000000515e+00, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (1.000000000000000102e-16, 8.686550888106663706e+02, "com"), 8)){1}, decorationpart (infsupdec (-2.330000000000000515e+00, 2.330000000000000515e+00, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (1.406408618241000491e-04, 1.698356304099999647e+02, "dac"), 8), infsupdec (-1.900000000000000133e+00, 1.900000000000000133e+00, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (1.406408618241000491e-04, 1.698356304099999647e+02, "dac"), 8)){1}, decorationpart (infsupdec (-1.900000000000000133e+00, 1.900000000000000133e+00, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (empty, "trv"), 3), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (empty, "trv"), 3)){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (entire, "def"), 3), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (entire, "def"), 3)){1}, decorationpart (infsupdec (entire, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (0.0, 0.0, "dac"), 3), infsupdec (0.0, 0.0, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (0.0, 0.0, "dac"), 3)){1}, decorationpart (infsupdec (0.0, 0.0, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (-0.0, -0.0, "def"), 3), infsupdec (0.0, 0.0, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (-0.0, -0.0, "def"), 3)){1}, decorationpart (infsupdec (0.0, 0.0, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (2.248090999999999440e+03, 2.248090999999999894e+03, "com"), 3), infsupdec (1.309999999999999787e+01, 1.310000000000000142e+01, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (2.248090999999999440e+03, 2.248090999999999894e+03, "com"), 3)){1}, decorationpart (infsupdec (1.309999999999999787e+01, 1.310000000000000142e+01, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (-4.136843053904099731e+11, -4.136843053904099121e+11, "def"), 3), infsupdec (-7.451145000000001346e+03, -7.451144999999999527e+03, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (-4.136843053904099731e+11, -4.136843053904099121e+11, "def"), 3)){1}, decorationpart (infsupdec (-7.451145000000001346e+03, -7.451144999999999527e+03, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (1.797693134862315708e+308, 1.797693134862315708e+308, "dac"), 3), infsupdec (5.643803094122361304e+102, 5.643803094122362298e+102, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (1.797693134862315708e+308, 1.797693134862315708e+308, "dac"), 3)){1}, decorationpart (infsupdec (5.643803094122361304e+102, 5.643803094122362298e+102, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (-1.797693134862315708e+308, -1.797693134862315708e+308, "com"), 3), infsupdec (-5.643803094122362298e+102, -5.643803094122361304e+102, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (-1.797693134862315708e+308, -1.797693134862315708e+308, "com"), 3)){1}, decorationpart (infsupdec (-5.643803094122362298e+102, -5.643803094122361304e+102, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (0.0, inf, "def"), 3), infsupdec (0.0, inf, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (0.0, inf, "def"), 3)){1}, decorationpart (infsupdec (0.0, inf, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (-0.0, inf, "def"), 3), infsupdec (0.0, inf, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (-0.0, inf, "def"), 3)){1}, decorationpart (infsupdec (0.0, inf, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (-inf, 0.0, "dac"), 3), infsupdec (-inf, 0.0, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (-inf, 0.0, "dac"), 3)){1}, decorationpart (infsupdec (-inf, 0.0, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (-inf, -0.0, "def"), 3), infsupdec (-inf, 0.0, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (-inf, -0.0, "def"), 3)){1}, decorationpart (infsupdec (-inf, 0.0, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (-3.410678990700000525e+07, 1.562500000000000000e+01, "com"), 3), infsupdec (-3.243000000000000682e+02, 2.500000000000000000e+00, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (-3.410678990700000525e+07, 1.562500000000000000e+01, "com"), 3)){1}, decorationpart (infsupdec (-3.243000000000000682e+02, 2.500000000000000000e+00, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (9.999999999999999547e-07, 1.264933700000000272e+01, "dac"), 3), infsupdec (9.999999999999998473e-03, 2.330000000000000515e+00, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (9.999999999999999547e-07, 1.264933700000000272e+01, "dac"), 3)){1}, decorationpart (infsupdec (9.999999999999998473e-03, 2.330000000000000515e+00, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (-6.858999999999999098e+00, -3.593700000000000366e-02, "def"), 3), infsupdec (-1.900000000000000133e+00, -3.299999999999999600e-01, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (-6.858999999999999098e+00, -3.593700000000000366e-02, "def"), 3)){1}, decorationpart (infsupdec (-1.900000000000000133e+00, -3.299999999999999600e-01, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (empty, "trv"), 7), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (empty, "trv"), 7)){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (entire, "def"), 7), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (entire, "def"), 7)){1}, decorationpart (infsupdec (entire, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (0.0, 0.0, "com"), 7), infsupdec (0.0, 0.0, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (0.0, 0.0, "com"), 7)){1}, decorationpart (infsupdec (0.0, 0.0, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (-0.0, -0.0, "dac"), 7), infsupdec (0.0, 0.0, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (-0.0, -0.0, "dac"), 7)){1}, decorationpart (infsupdec (0.0, 0.0, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (6.620626219008108228e+07, 6.620626219008108974e+07, "def"), 7), infsupdec (1.309999999999999787e+01, 1.310000000000000142e+01, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (6.620626219008108228e+07, 6.620626219008108974e+07, "def"), 7)){1}, decorationpart (infsupdec (1.309999999999999787e+01, 1.310000000000000142e+01, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (-1.275149497957960280e+27, -1.275149497957960005e+27, "dac"), 7), infsupdec (-7.451145000000001346e+03, -7.451144999999999527e+03, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (-1.275149497957960280e+27, -1.275149497957960005e+27, "dac"), 7)){1}, decorationpart (infsupdec (-7.451145000000001346e+03, -7.451144999999999527e+03, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (1.797693134862315708e+308, 1.797693134862315708e+308, "com"), 7), infsupdec (1.087396515837748951e+44, 1.087396515837749149e+44, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (1.797693134862315708e+308, 1.797693134862315708e+308, "com"), 7)){1}, decorationpart (infsupdec (1.087396515837748951e+44, 1.087396515837749149e+44, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (-1.797693134862315708e+308, -1.797693134862315708e+308, "def"), 7), infsupdec (-1.087396515837749149e+44, -1.087396515837748951e+44, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (-1.797693134862315708e+308, -1.797693134862315708e+308, "def"), 7)){1}, decorationpart (infsupdec (-1.087396515837749149e+44, -1.087396515837748951e+44, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (0.0, inf, "dac"), 7), infsupdec (0.0, inf, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (0.0, inf, "dac"), 7)){1}, decorationpart (infsupdec (0.0, inf, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (-0.0, inf, "dac"), 7), infsupdec (0.0, inf, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (-0.0, inf, "dac"), 7)){1}, decorationpart (infsupdec (0.0, inf, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (-inf, 0.0, "def"), 7), infsupdec (-inf, 0.0, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (-inf, 0.0, "def"), 7)){1}, decorationpart (infsupdec (-inf, 0.0, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (-inf, -0.0, "def"), 7), infsupdec (-inf, 0.0, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (-inf, -0.0, "def"), 7)){1}, decorationpart (infsupdec (-inf, 0.0, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (-3.772494720896449920e+17, 6.103515625000000000e+02, "dac"), 7), infsupdec (-3.243000000000000682e+02, 2.500000000000000000e+00, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (-3.772494720896449920e+17, 6.103515625000000000e+02, "dac"), 7)){1}, decorationpart (infsupdec (-3.243000000000000682e+02, 2.500000000000000000e+00, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (9.999999999999999988e-15, 3.728133428371958757e+02, "com"), 7), infsupdec (9.999999999999998473e-03, 2.330000000000000515e+00, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (9.999999999999999988e-15, 3.728133428371958757e+02, "com"), 7)){1}, decorationpart (infsupdec (9.999999999999998473e-03, 2.330000000000000515e+00, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (-8.938717389999997920e+01, -4.261844297700001028e-04, "def"), 7), infsupdec (-1.900000000000000133e+00, -3.299999999999999600e-01, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (-8.938717389999997920e+01, -4.261844297700001028e-04, "def"), 7)){1}, decorationpart (infsupdec (-1.900000000000000133e+00, -3.299999999999999600e-01, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (empty, "trv"), -2), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (empty, "trv"), -2)){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (0.0, inf, "dac"), -2), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (0.0, inf, "dac"), -2)){1}, decorationpart (infsupdec (entire, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (-0.0, inf, "dac"), -2), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (-0.0, inf, "dac"), -2)){1}, decorationpart (infsupdec (entire, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (0.0, 0.0, "def"), -2), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (0.0, 0.0, "def"), -2)){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (-0.0, -0.0, "com"), -2), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (-0.0, -0.0, "com"), -2)){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (-10.0, 0.0, "dac"), -2), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (-10.0, 0.0, "dac"), -2)){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (-10.0, -0.0, "def"), -2), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (-10.0, -0.0, "def"), -2)){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (5.827166249053085390e-03, 5.827166249053086257e-03, "dac"), -2), infsupdec (-1.310000000000000142e+01, 1.310000000000000142e+01, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (5.827166249053085390e-03, 5.827166249053086257e-03, "dac"), -2)){1}, decorationpart (infsupdec (-1.310000000000000142e+01, 1.310000000000000142e+01, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (1.801166953377180740e-08, 1.801166953377181071e-08, "def"), -2), infsupdec (-7.451145000000001346e+03, 7.451145000000001346e+03, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (1.801166953377180740e-08, 1.801166953377181071e-08, "def"), -2)){1}, decorationpart (infsupdec (-7.451145000000001346e+03, 7.451145000000001346e+03, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (0.000000000000000000e+00, 4.940656458412465442e-324, "com"), -2), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (0.000000000000000000e+00, 4.940656458412465442e-324, "com"), -2)){1}, decorationpart (infsupdec (entire, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (9.508370646556841917e-06, inf, "dac"), -2), infsupdec (-3.243000000000000682e+02, 3.243000000000000682e+02, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (9.508370646556841917e-06, inf, "dac"), -2)){1}, decorationpart (infsupdec (-3.243000000000000682e+02, 3.243000000000000682e+02, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (1.841993774061043421e-01, 1.000000000000000000e+04, "def"), -2), infsupdec (-2.330000000000000515e+00, 2.330000000000000515e+00, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (1.841993774061043421e-01, 1.000000000000000000e+04, "def"), -2)){1}, decorationpart (infsupdec (-2.330000000000000515e+00, 2.330000000000000515e+00, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (2.770083102493074989e-01, 9.182736455463727410e+00, "com"), -2), infsupdec (-1.900000000000000133e+00, 1.900000000000000133e+00, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (2.770083102493074989e-01, 9.182736455463727410e+00, "com"), -2)){1}, decorationpart (infsupdec (-1.900000000000000133e+00, 1.900000000000000133e+00, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (empty, "trv"), -8), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (empty, "trv"), -8)){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (0.0, inf, "def"), -8), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (0.0, inf, "def"), -8)){1}, decorationpart (infsupdec (entire, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (-0.0, inf, "dac"), -8), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (-0.0, inf, "dac"), -8)){1}, decorationpart (infsupdec (entire, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (0.0, 0.0, "def"), -8), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (0.0, 0.0, "def"), -8)){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (-0.0, -0.0, "dac"), -8), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (-0.0, -0.0, "dac"), -8)){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (1.153000869365374417e-09, 1.153000869365374624e-09, "com"), -8), infsupdec (-1.310000000000000142e+01, 1.310000000000000142e+01, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (1.153000869365374417e-09, 1.153000869365374624e-09, "com"), -8)){1}, decorationpart (infsupdec (-1.310000000000000142e+01, 1.310000000000000142e+01, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (1.052484917283328578e-31, 1.052484917283328797e-31, "def"), -8), infsupdec (-7.451145000000001346e+03, 7.451145000000001346e+03, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (1.052484917283328578e-31, 1.052484917283328797e-31, "def"), -8)){1}, decorationpart (infsupdec (-7.451145000000001346e+03, 7.451145000000001346e+03, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (0.000000000000000000e+00, 4.940656458412465442e-324, "dac"), -8), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (0.000000000000000000e+00, 4.940656458412465442e-324, "dac"), -8)){1}, decorationpart (infsupdec (entire, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (8.173807596331487643e-21, inf, "def"), -8), infsupdec (-3.243000000000000682e+02, 3.243000000000000682e+02, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (8.173807596331487643e-21, inf, "def"), -8)){1}, decorationpart (infsupdec (-3.243000000000000682e+02, 3.243000000000000682e+02, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (1.151204906160357110e-03, 1.000000000000000000e+16, "com"), -8), infsupdec (-2.330000000000000515e+00, 2.330000000000000515e+00, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (1.151204906160357110e-03, 1.000000000000000000e+16, "com"), -8)){1}, decorationpart (infsupdec (-2.330000000000000515e+00, 2.330000000000000515e+00, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (5.888045974722156024e-03, 7.110309102419345436e+03, "def"), -8), infsupdec (-1.900000000000000133e+00, 1.900000000000000133e+00, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (5.888045974722156024e-03, 7.110309102419345436e+03, "def"), -8)){1}, decorationpart (infsupdec (-1.900000000000000133e+00, 1.900000000000000133e+00, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (empty, "trv"), -1), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (empty, "trv"), -1)){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (entire, "def"), -1), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (entire, "def"), -1)){1}, decorationpart (infsupdec (entire, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (0.0, 0.0, "dac"), -1), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (0.0, 0.0, "dac"), -1)){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (-0.0, -0.0, "dac"), -1), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (-0.0, -0.0, "dac"), -1)){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (7.633587786259540819e-02, 7.633587786259542207e-02, "def"), -1), infsupdec (1.309999999999999787e+01, 1.310000000000000320e+01, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (7.633587786259540819e-02, 7.633587786259542207e-02, "def"), -1)){1}, decorationpart (infsupdec (1.309999999999999787e+01, 1.310000000000000320e+01, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (-1.342075613882161712e-04, -1.342075613882161441e-04, "dac"), -1), infsupdec (-7.451145000000002256e+03, -7.451144999999999527e+03, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (-1.342075613882161712e-04, -1.342075613882161441e-04, "dac"), -1)){1}, decorationpart (infsupdec (-7.451145000000002256e+03, -7.451144999999999527e+03, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (5.562684646268003458e-309, 5.562684646268008398e-309, "dac"), -1), infsupdec (1.797693134862314311e+308, inf, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (5.562684646268003458e-309, 5.562684646268008398e-309, "dac"), -1)){1}, decorationpart (infsupdec (1.797693134862314311e+308, inf, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (-5.562684646268008398e-309, -5.562684646268003458e-309, "def"), -1), infsupdec (-inf, -1.797693134862314311e+308, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (-5.562684646268008398e-309, -5.562684646268003458e-309, "def"), -1)){1}, decorationpart (infsupdec (-inf, -1.797693134862314311e+308, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (0.0, inf, "dac"), -1), infsupdec (0.0, inf, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (0.0, inf, "dac"), -1)){1}, decorationpart (infsupdec (0.0, inf, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (-0.0, inf, "dac"), -1), infsupdec (0.0, inf, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (-0.0, inf, "dac"), -1)){1}, decorationpart (infsupdec (0.0, inf, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (-inf, 0.0, "dac"), -1), infsupdec (-inf, 0.0, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (-inf, 0.0, "dac"), -1)){1}, decorationpart (infsupdec (-inf, 0.0, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (-inf, -0.0, "def"), -1), infsupdec (-inf, 0.0, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (-inf, -0.0, "def"), -1)){1}, decorationpart (infsupdec (-inf, 0.0, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (4.291845493562231328e-01, 1.000000000000000000e+02, "com"), -1), infsupdec (9.999999999999998473e-03, 2.330000000000000515e+00, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (4.291845493562231328e-01, 1.000000000000000000e+02, "com"), -1)){1}, decorationpart (infsupdec (9.999999999999998473e-03, 2.330000000000000515e+00, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (-3.030303030303030276e+00, -5.263157894736841813e-01, "com"), -1), infsupdec (-1.900000000000000133e+00, -3.299999999999999600e-01, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (-3.030303030303030276e+00, -5.263157894736841813e-01, "com"), -1)){1}, decorationpart (infsupdec (-1.900000000000000133e+00, -3.299999999999999600e-01, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (empty, "trv"), -3), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (empty, "trv"), -3)){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (entire, "def"), -3), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (entire, "def"), -3)){1}, decorationpart (infsupdec (entire, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (0.0, 0.0, "def"), -3), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (0.0, 0.0, "def"), -3)){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (-0.0, -0.0, "dac"), -3), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (-0.0, -0.0, "dac"), -3)){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (4.448218510727546177e-04, 4.448218510727546720e-04, "com"), -3), infsupdec (1.309999999999999787e+01, 1.310000000000000142e+01, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (4.448218510727546177e-04, 4.448218510727546720e-04, "com"), -3)){1}, decorationpart (infsupdec (1.309999999999999787e+01, 1.310000000000000142e+01, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (-2.417302244657943502e-12, -2.417302244657943098e-12, "def"), -3), infsupdec (-7.451145000000001346e+03, -7.451144999999999527e+03, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (-2.417302244657943502e-12, -2.417302244657943098e-12, "def"), -3)){1}, decorationpart (infsupdec (-7.451145000000001346e+03, -7.451144999999999527e+03, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (0.000000000000000000e+00, 4.940656458412465442e-324, "dac"), -3), infsupdec (5.871356456934583070e+107, inf, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (0.000000000000000000e+00, 4.940656458412465442e-324, "dac"), -3)){1}, decorationpart (infsupdec (5.871356456934583070e+107, inf, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (-4.940656458412465442e-324, -0.000000000000000000e+00, "def"), -3), infsupdec (-inf, -5.871356456934583070e+107, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (-4.940656458412465442e-324, -0.000000000000000000e+00, "def"), -3)){1}, decorationpart (infsupdec (-inf, -5.871356456934583070e+107, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (0.0, inf, "dac"), -3), infsupdec (0.0, inf, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (0.0, inf, "dac"), -3)){1}, decorationpart (infsupdec (0.0, inf, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (-0.0, inf, "dac"), -3), infsupdec (0.0, inf, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (-0.0, inf, "dac"), -3)){1}, decorationpart (infsupdec (0.0, inf, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (-inf, 0.0, "def"), -3), infsupdec (-inf, 0.0, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (-inf, 0.0, "def"), -3)){1}, decorationpart (infsupdec (-inf, 0.0, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (-inf, -0.0, "def"), -3), infsupdec (-inf, 0.0, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (-inf, -0.0, "def"), -3)){1}, decorationpart (infsupdec (-inf, 0.0, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (7.905552678373577169e-02, 1.000000000000000000e+06, "com"), -3), infsupdec (9.999999999999998473e-03, 2.330000000000000515e+00, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (7.905552678373577169e-02, 1.000000000000000000e+06, "com"), -3)){1}, decorationpart (infsupdec (9.999999999999998473e-03, 2.330000000000000515e+00, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (-2.782647410746584171e+01, -1.457938474996355316e-01, "def"), -3), infsupdec (-1.900000000000000133e+00, -3.299999999999999600e-01, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (-2.782647410746584171e+01, -1.457938474996355316e-01, "def"), -3)){1}, decorationpart (infsupdec (-1.900000000000000133e+00, -3.299999999999999600e-01, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (empty, "trv"), -7), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (empty, "trv"), -7)){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (entire, "def"), -7), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (entire, "def"), -7)){1}, decorationpart (infsupdec (entire, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (0.0, 0.0, "com"), -7), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (0.0, 0.0, "com"), -7)){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (-0.0, -0.0, "def"), -7), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (-0.0, -0.0, "def"), -7)){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (1.510431138868640339e-08, 1.510431138868640670e-08, "dac"), -7), infsupdec (1.309999999999999787e+01, 1.310000000000000142e+01, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (1.510431138868640339e-08, 1.510431138868640670e-08, "dac"), -7)){1}, decorationpart (infsupdec (1.309999999999999787e+01, 1.310000000000000142e+01, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (-7.842217728991088300e-28, -7.842217728991087403e-28, "dac"), -7), infsupdec (-7.451145000000001346e+03, -7.451144999999999527e+03, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (-7.842217728991088300e-28, -7.842217728991087403e-28, "dac"), -7)){1}, decorationpart (infsupdec (-7.451145000000001346e+03, -7.451144999999999527e+03, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (0.000000000000000000e+00, 4.940656458412465442e-324, "def"), -7), infsupdec (1.536746355637629315e+46, inf, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (0.000000000000000000e+00, 4.940656458412465442e-324, "def"), -7)){1}, decorationpart (infsupdec (1.536746355637629315e+46, inf, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (-4.940656458412465442e-324, -0.000000000000000000e+00, "def"), -7), infsupdec (-inf, -1.536746355637629315e+46, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (-4.940656458412465442e-324, -0.000000000000000000e+00, "def"), -7)){1}, decorationpart (infsupdec (-inf, -1.536746355637629315e+46, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (0.0, inf, "dac"), -7), infsupdec (0.0, inf, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (0.0, inf, "dac"), -7)){1}, decorationpart (infsupdec (0.0, inf, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (-0.0, inf, "def"), -7), infsupdec (0.0, inf, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (-0.0, inf, "def"), -7)){1}, decorationpart (infsupdec (0.0, inf, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (-inf, 0.0, "dac"), -7), infsupdec (-inf, 0.0, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (-inf, 0.0, "dac"), -7)){1}, decorationpart (infsupdec (-inf, 0.0, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (-inf, -0.0, "def"), -7), infsupdec (-inf, 0.0, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (-inf, -0.0, "def"), -7)){1}, decorationpart (infsupdec (-inf, 0.0, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (2.682307431353632161e-03, 1.000000000000000000e+14, "com"), -7), infsupdec (9.999999999999998473e-03, 2.330000000000000515e+00, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (2.682307431353632161e-03, 1.000000000000000000e+14, "com"), -7)){1}, decorationpart (infsupdec (9.999999999999998473e-03, 2.330000000000000515e+00, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (-2.346402003798384158e+03, -1.118728735197209619e-02, "com"), -7), infsupdec (-1.900000000000000133e+00, -3.299999999999999600e-01, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (-2.346402003798384158e+03, -1.118728735197209619e-02, "com"), -7)){1}, decorationpart (infsupdec (-1.900000000000000133e+00, -3.299999999999999600e-01, "trv")){1}));

## minimal_pownRev_dec_bin_test

%!test
%! assert (isequal (pownrev (infsupdec (empty, "trv"), infsupdec (1.0, 1.0, "def"), 0), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (empty, "trv"), infsupdec (1.0, 1.0, "def"), 0)){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (1.0, 1.0, "dac"), infsupdec (1.0, 1.0, "dac"), 0), infsupdec (1.0, 1.0, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (1.0, 1.0, "dac"), infsupdec (1.0, 1.0, "dac"), 0)){1}, decorationpart (infsupdec (1.0, 1.0, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (-1.0, 5.0, "def"), infsupdec (-51.0, 12.0, "dac"), 0), infsupdec (-51.0, 12.0, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (-1.0, 5.0, "def"), infsupdec (-51.0, 12.0, "dac"), 0)){1}, decorationpart (infsupdec (-51.0, 12.0, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (-1.0, 0.0, "com"), infsupdec (5.0, 10.0, "dac"), 0), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (-1.0, 0.0, "com"), infsupdec (5.0, 10.0, "dac"), 0)){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (-1.0, -0.0, "dac"), infsupdec (-1.0, 1.0, "def"), 0), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (-1.0, -0.0, "dac"), infsupdec (-1.0, 1.0, "def"), 0)){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (1.1, 10.0, "def"), infsupdec (1.0, 41.0, "dac"), 0), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (1.1, 10.0, "def"), infsupdec (1.0, 41.0, "dac"), 0)){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (empty, "trv"), infsupdec (0.0, 100.1, "dac"), 1), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (empty, "trv"), infsupdec (0.0, 100.1, "dac"), 1)){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (entire, "def"), infsupdec (-5.1, 10.0, "def"), 1), infsupdec (-5.1, 10.0, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (entire, "def"), infsupdec (-5.1, 10.0, "def"), 1)){1}, decorationpart (infsupdec (-5.1, 10.0, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (0.0, 0.0, "com"), infsupdec (-10.0, 5.1, "dac"), 1), infsupdec (0.0, 0.0, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (0.0, 0.0, "com"), infsupdec (-10.0, 5.1, "dac"), 1)){1}, decorationpart (infsupdec (0.0, 0.0, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (-0.0, -0.0, "def"), infsupdec (1.0, 5.0, "dac"), 1), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (-0.0, -0.0, "def"), infsupdec (1.0, 5.0, "dac"), 1)){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (empty, "trv"), infsupdec (5.0, 17.1, "def"), 2), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (empty, "trv"), infsupdec (5.0, 17.1, "def"), 2)){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (0.0, inf, "dac"), infsupdec (5.6, 27.544, "dac"), 2), infsupdec (5.6, 27.544, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (0.0, inf, "dac"), infsupdec (5.6, 27.544, "dac"), 2)){1}, decorationpart (infsupdec (5.6, 27.544, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (0.0, 0.0, "def"), infsupdec (1.0, 2.0, "def"), 2), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (0.0, 0.0, "def"), infsupdec (1.0, 2.0, "def"), 2)){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (9.999999999999999124e-05, 5.428900000000000503e+00, "com"), infsupdec (1.0, inf, "def"), 2), infsupdec (1.0, 2.330000000000000515e+00, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (9.999999999999999124e-05, 5.428900000000000503e+00, "com"), infsupdec (1.0, inf, "def"), 2)){1}, decorationpart (infsupdec (1.0, 2.330000000000000515e+00, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (1.088999999999999968e-01, 3.609999999999999876e+00, "dac"), infsupdec (-inf, -1.0, "def"), 2), infsupdec (-1.900000000000000133e+00, -1.0, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (1.088999999999999968e-01, 3.609999999999999876e+00, "dac"), infsupdec (-inf, -1.0, "def"), 2)){1}, decorationpart (infsupdec (-1.900000000000000133e+00, -1.0, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (empty, "trv"), infsupdec (-23.0, -1.0, "dac"), 3), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (empty, "trv"), infsupdec (-23.0, -1.0, "dac"), 3)){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (entire, "def"), infsupdec (-23.0, -1.0, "com"), 3), infsupdec (-23.0, -1.0, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (entire, "def"), infsupdec (-23.0, -1.0, "com"), 3)){1}, decorationpart (infsupdec (-23.0, -1.0, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (0.0, 0.0, "def"), infsupdec (1.0, 2.0, "dac"), 3), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (0.0, 0.0, "def"), infsupdec (1.0, 2.0, "dac"), 3)){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (9.999999999999999547e-07, 1.264933700000000272e+01, "com"), infsupdec (1.0, inf, "dac"), 3), infsupdec (1.0, 2.330000000000000515e+00, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (9.999999999999999547e-07, 1.264933700000000272e+01, "com"), infsupdec (1.0, inf, "dac"), 3)){1}, decorationpart (infsupdec (1.0, 2.330000000000000515e+00, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (-6.858999999999999098e+00, -3.593700000000000366e-02, "com"), infsupdec (-inf, -1.0, "dac"), 3), infsupdec (-1.900000000000000133e+00, -1.0, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (-6.858999999999999098e+00, -3.593700000000000366e-02, "com"), infsupdec (-inf, -1.0, "dac"), 3)){1}, decorationpart (infsupdec (-1.900000000000000133e+00, -1.0, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (empty, "trv"), infsupdec (-3.0, 17.3, "def"), -2), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (empty, "trv"), infsupdec (-3.0, 17.3, "def"), -2)){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (0.0, inf, "dac"), infsupdec (-5.1, -0.1, "dac"), -2), infsupdec (-5.1, -0.1, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (0.0, inf, "dac"), infsupdec (-5.1, -0.1, "dac"), -2)){1}, decorationpart (infsupdec (-5.1, -0.1, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (0.0, 0.0, "def"), infsupdec (27.2, 55.1, "dac"), -2), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (0.0, 0.0, "def"), infsupdec (27.2, 55.1, "dac"), -2)){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (9.508370646556841917e-06, inf, "def"), infsupdec (-inf, -1.797693134862315708e+308, "dac"), -2), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (9.508370646556841917e-06, inf, "def"), infsupdec (-inf, -1.797693134862315708e+308, "dac"), -2)){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (1.841993774061043421e-01, 1.000000000000000000e+04, "com"), infsupdec (1.0, inf, "dac"), -2), infsupdec (1.0, 2.330000000000000515e+00, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (1.841993774061043421e-01, 1.000000000000000000e+04, "com"), infsupdec (1.0, inf, "dac"), -2)){1}, decorationpart (infsupdec (1.0, 2.330000000000000515e+00, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (2.770083102493074989e-01, 9.182736455463727410e+00, "com"), infsupdec (-inf, -1.0, "dac"), -2), infsupdec (-1.900000000000000133e+00, -1.0, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (2.770083102493074989e-01, 9.182736455463727410e+00, "com"), infsupdec (-inf, -1.0, "dac"), -2)){1}, decorationpart (infsupdec (-1.900000000000000133e+00, -1.0, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (empty, "trv"), infsupdec (-5.1, 55.5, "def"), -1), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (empty, "trv"), infsupdec (-5.1, 55.5, "def"), -1)){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (entire, "def"), infsupdec (-5.1, 55.5, "dac"), -1), infsupdec (-5.1, 55.5, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (entire, "def"), infsupdec (-5.1, 55.5, "dac"), -1)){1}, decorationpart (infsupdec (-5.1, 55.5, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (0.0, 0.0, "dac"), infsupdec (-5.1, 55.5, "def"), -1), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (0.0, 0.0, "dac"), infsupdec (-5.1, 55.5, "def"), -1)){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (-inf, -0.0, "dac"), infsupdec (-1.0, 1.0, "com"), -1), infsupdec (-1.0, 0.0, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (-inf, -0.0, "dac"), infsupdec (-1.0, 1.0, "com"), -1)){1}, decorationpart (infsupdec (-1.0, 0.0, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (4.291845493562231328e-01, 1.000000000000000000e+02, "def"), infsupdec (-1.0, 0.0, "dac"), -1), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (4.291845493562231328e-01, 1.000000000000000000e+02, "def"), infsupdec (-1.0, 0.0, "dac"), -1)){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (empty, "trv"), infsupdec (-5.1, 55.5, "dac"), -3), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (empty, "trv"), infsupdec (-5.1, 55.5, "dac"), -3)){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (entire, "def"), infsupdec (-5.1, 55.5, "def"), -3), infsupdec (-5.1, 55.5, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (entire, "def"), infsupdec (-5.1, 55.5, "def"), -3)){1}, decorationpart (infsupdec (-5.1, 55.5, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (0.0, 0.0, "def"), infsupdec (-5.1, 55.5, "def"), -3), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (0.0, 0.0, "def"), infsupdec (-5.1, 55.5, "def"), -3)){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (-inf, 0.0, "dac"), infsupdec (5.1, 55.5, "com"), -3), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (-inf, 0.0, "dac"), infsupdec (5.1, 55.5, "com"), -3)){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (pownrev (infsupdec (-inf, -0.0, "dac"), infsupdec (-32.0, 1.1, "def"), -3), infsupdec (-32.0, 0.0, "trv")));
%! assert (isequal (decorationpart (pownrev (infsupdec (-inf, -0.0, "dac"), infsupdec (-32.0, 1.1, "def"), -3)){1}, decorationpart (infsupdec (-32.0, 0.0, "trv")){1}));

## minimal_sinRev_test

%!test
%! assert (isequal (sinrev (infsup), infsup));
%!test
%! assert (isequal (sinrev (infsup (-2.0, -1.1)), infsup));
%!test
%! assert (isequal (sinrev (infsup (1.1, 2.0)), infsup));
%!test
%! assert (isequal (sinrev (infsup (-1.0, 1.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (sinrev (infsup (0.0, 0.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (sinrev (infsup (1.224646799147352961e-16, 1.224646799147353207e-16)), infsup (-inf, inf)));

## minimal_sinRevBin_test

%!test
%! assert (isequal (sinrev (infsup, infsup (-1.2, 12.1)), infsup));
%!test
%! assert (isequal (sinrev (infsup (-2.0, -1.1), infsup (-5.0, 5.0)), infsup));
%!test
%! assert (isequal (sinrev (infsup (1.1, 2.0), infsup (-5.0, 5.0)), infsup));
%!test
%! assert (isequal (sinrev (infsup (-1.0, 1.0), infsup (-1.2, 12.1)), infsup (-1.2, 12.1)));
%!test
%! assert (isequal (sinrev (infsup (0.0, 0.0), infsup (-1.0, 1.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (sinrev (infsup (-0.0, -0.0), infsup (2.0, 2.5)), infsup));
%!test
%! assert (isequal (sinrev (infsup (-0.0, -0.0), infsup (3.0, 3.5)), infsup (3.141592653589793116e+00, 3.141592653589793560e+00)));
%!test
%! assert (isequal (sinrev (infsup (9.999999999999998890e-01, 1.000000000000000000e+00), infsup (1.57, 1.58)), infsup (1.570796311893735364e+00, 1.570796341696058196e+00)));
%!test
%! assert (isequal (sinrev (infsup (0.0, 1.000000000000000000e+00), infsup (-0.1, 1.58)), infsup (0.0, 1.58)));
%!test
%! assert (isequal (sinrev (infsup (1.224646799147352961e-16, 1.224646799147353207e-16), infsup (3.14, 3.15)), infsup (3.141592653589792672e+00, 3.141592653589793560e+00)));
%!test
%! assert (isequal (sinrev (infsup (-3.216245299353273201e-16, -3.216245299353272708e-16), infsup (3.14, 3.15)), infsup (3.141592653589793116e+00, 3.141592653589794004e+00)));
%!test
%! assert (isequal (sinrev (infsup (-3.216245299353273201e-16, 1.224646799147353207e-16), infsup (3.14, 3.15)), infsup (3.141592653589792672e+00, 3.141592653589794004e+00)));
%!test
%! assert (isequal (sinrev (infsup (0.0, 1.0), infsup (-0.1, 3.15)), infsup (0.0, 3.141592653589793560e+00)));
%!test
%! assert (isequal (sinrev (infsup (0.0, 1.0), infsup (-0.1, 3.15)), infsup (-0.0, 3.141592653589793560e+00)));
%!test
%! assert (isequal (sinrev (infsup (-3.216245299353273201e-16, 1.0), infsup (-0.1, 3.15)), infsup (-3.216245299353273694e-16, 3.141592653589794004e+00)));
%!test
%! assert (isequal (sinrev (infsup (-3.216245299353273201e-16, 1.0), infsup (0.0, 3.15)), infsup (0.0, 3.141592653589794004e+00)));
%!test
%! assert (isequal (sinrev (infsup (1.224646799147352961e-16, 1.000000000000000000e+00), infsup (3.14, 3.15)), infsup (3.14, 3.141592653589793560e+00)));
%!test
%! assert (isequal (sinrev (infsup (-3.216245299353273201e-16, 1.000000000000000000e+00), infsup (1.57, 3.15)), infsup (1.57, 3.141592653589794004e+00)));
%!test
%! assert (isequal (sinrev (infsup (1.224646799147352961e-16, 1.224646799147353207e-16), infsup (-inf, 3.15)), infsup (-inf, 3.141592653589793560e+00)));
%!test
%! assert (isequal (sinrev (infsup (-3.216245299353273201e-16, -3.216245299353272708e-16), infsup (3.14, inf)), infsup (3.141592653589793116e+00, inf)));

## minimal_sinRev_dec_test

%!test
%! assert (isequal (sinrev (infsupdec (empty, "trv")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (sinrev (infsupdec (empty, "trv"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (sinrev (infsupdec (-2.0, -1.1, "com")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (sinrev (infsupdec (-2.0, -1.1, "com"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (sinrev (infsupdec (1.1, 2.0, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (sinrev (infsupdec (1.1, 2.0, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (sinrev (infsupdec (-1.0, 1.0, "com")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (sinrev (infsupdec (-1.0, 1.0, "com"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%!test
%! assert (isequal (sinrev (infsupdec (0.0, 0.0, "dac")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (sinrev (infsupdec (0.0, 0.0, "dac"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%!test
%! assert (isequal (sinrev (infsupdec (1.224646799147352961e-16, 1.224646799147353207e-16, "def")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (sinrev (infsupdec (1.224646799147352961e-16, 1.224646799147353207e-16, "def"))){1}, decorationpart (infsupdec (entire, "trv")){1}));

## minimal_sinRev_dec_bin_test

%!test
%! assert (isequal (sinrev (infsupdec (empty, "trv"), infsupdec (-1.2, 12.1, "com")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (sinrev (infsupdec (empty, "trv"), infsupdec (-1.2, 12.1, "com"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (sinrev (infsupdec (-2.0, -1.1, "def"), infsupdec (-5.0, 5.0, "def")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (sinrev (infsupdec (-2.0, -1.1, "def"), infsupdec (-5.0, 5.0, "def"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (sinrev (infsupdec (1.1, 2.0, "dac"), infsupdec (-5.0, 5.0, "com")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (sinrev (infsupdec (1.1, 2.0, "dac"), infsupdec (-5.0, 5.0, "com"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (sinrev (infsupdec (-1.0, 1.0, "com"), infsupdec (-1.2, 12.1, "def")), infsupdec (-1.2, 12.1, "trv")));
%! assert (isequal (decorationpart (sinrev (infsupdec (-1.0, 1.0, "com"), infsupdec (-1.2, 12.1, "def"))){1}, decorationpart (infsupdec (-1.2, 12.1, "trv")){1}));
%!test
%! assert (isequal (sinrev (infsupdec (0.0, 0.0, "dac"), infsupdec (-1.0, 1.0, "def")), infsupdec (0.0, 0.0, "trv")));
%! assert (isequal (decorationpart (sinrev (infsupdec (0.0, 0.0, "dac"), infsupdec (-1.0, 1.0, "def"))){1}, decorationpart (infsupdec (0.0, 0.0, "trv")){1}));
%!test
%! assert (isequal (sinrev (infsupdec (-0.0, -0.0, "def"), infsupdec (2.0, 2.5, "trv")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (sinrev (infsupdec (-0.0, -0.0, "def"), infsupdec (2.0, 2.5, "trv"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (sinrev (infsupdec (-0.0, -0.0, "def"), infsupdec (3.0, 3.5, "dac")), infsupdec (3.141592653589793116e+00, 3.141592653589793560e+00, "trv")));
%! assert (isequal (decorationpart (sinrev (infsupdec (-0.0, -0.0, "def"), infsupdec (3.0, 3.5, "dac"))){1}, decorationpart (infsupdec (3.141592653589793116e+00, 3.141592653589793560e+00, "trv")){1}));
%!test
%! assert (isequal (sinrev (infsupdec (9.999999999999998890e-01, 1.000000000000000000e+00, "dac"), infsupdec (1.57, 1.58, "dac")), infsupdec (1.570796311893735364e+00, 1.570796341696058196e+00, "trv")));
%! assert (isequal (decorationpart (sinrev (infsupdec (9.999999999999998890e-01, 1.000000000000000000e+00, "dac"), infsupdec (1.57, 1.58, "dac"))){1}, decorationpart (infsupdec (1.570796311893735364e+00, 1.570796341696058196e+00, "trv")){1}));
%!test
%! assert (isequal (sinrev (infsupdec (0.0, 1.000000000000000000e+00, "com"), infsupdec (-0.1, 1.58, "dac")), infsupdec (0.0, 1.58, "trv")));
%! assert (isequal (decorationpart (sinrev (infsupdec (0.0, 1.000000000000000000e+00, "com"), infsupdec (-0.1, 1.58, "dac"))){1}, decorationpart (infsupdec (0.0, 1.58, "trv")){1}));
%!test
%! assert (isequal (sinrev (infsupdec (1.224646799147352961e-16, 1.224646799147353207e-16, "com"), infsupdec (3.14, 3.15, "def")), infsupdec (3.141592653589792672e+00, 3.141592653589793560e+00, "trv")));
%! assert (isequal (decorationpart (sinrev (infsupdec (1.224646799147352961e-16, 1.224646799147353207e-16, "com"), infsupdec (3.14, 3.15, "def"))){1}, decorationpart (infsupdec (3.141592653589792672e+00, 3.141592653589793560e+00, "trv")){1}));
%!test
%! assert (isequal (sinrev (infsupdec (-3.216245299353273201e-16, -3.216245299353272708e-16, "com"), infsupdec (3.14, 3.15, "dac")), infsupdec (3.141592653589793116e+00, 3.141592653589794004e+00, "trv")));
%! assert (isequal (decorationpart (sinrev (infsupdec (-3.216245299353273201e-16, -3.216245299353272708e-16, "com"), infsupdec (3.14, 3.15, "dac"))){1}, decorationpart (infsupdec (3.141592653589793116e+00, 3.141592653589794004e+00, "trv")){1}));
%!test
%! assert (isequal (sinrev (infsupdec (-3.216245299353273201e-16, 1.224646799147353207e-16, "dac"), infsupdec (3.14, 3.15, "com")), infsupdec (3.141592653589792672e+00, 3.141592653589794004e+00, "trv")));
%! assert (isequal (decorationpart (sinrev (infsupdec (-3.216245299353273201e-16, 1.224646799147353207e-16, "dac"), infsupdec (3.14, 3.15, "com"))){1}, decorationpart (infsupdec (3.141592653589792672e+00, 3.141592653589794004e+00, "trv")){1}));
%!test
%! assert (isequal (sinrev (infsupdec (0.0, 1.0, "def"), infsupdec (-0.1, 3.15, "def")), infsupdec (0.0, 3.141592653589793560e+00, "trv")));
%! assert (isequal (decorationpart (sinrev (infsupdec (0.0, 1.0, "def"), infsupdec (-0.1, 3.15, "def"))){1}, decorationpart (infsupdec (0.0, 3.141592653589793560e+00, "trv")){1}));
%!test
%! assert (isequal (sinrev (infsupdec (0.0, 1.0, "dac"), infsupdec (-0.1, 3.15, "com")), infsupdec (-0.0, 3.141592653589793560e+00, "trv")));
%! assert (isequal (decorationpart (sinrev (infsupdec (0.0, 1.0, "dac"), infsupdec (-0.1, 3.15, "com"))){1}, decorationpart (infsupdec (-0.0, 3.141592653589793560e+00, "trv")){1}));
%!test
%! assert (isequal (sinrev (infsupdec (-3.216245299353273201e-16, 1.0, "def"), infsupdec (-0.1, 3.15, "def")), infsupdec (-3.216245299353273694e-16, 3.141592653589794004e+00, "trv")));
%! assert (isequal (decorationpart (sinrev (infsupdec (-3.216245299353273201e-16, 1.0, "def"), infsupdec (-0.1, 3.15, "def"))){1}, decorationpart (infsupdec (-3.216245299353273694e-16, 3.141592653589794004e+00, "trv")){1}));
%!test
%! assert (isequal (sinrev (infsupdec (-3.216245299353273201e-16, 1.0, "com"), infsupdec (0.0, 3.15, "dac")), infsupdec (0.0, 3.141592653589794004e+00, "trv")));
%! assert (isequal (decorationpart (sinrev (infsupdec (-3.216245299353273201e-16, 1.0, "com"), infsupdec (0.0, 3.15, "dac"))){1}, decorationpart (infsupdec (0.0, 3.141592653589794004e+00, "trv")){1}));
%!test
%! assert (isequal (sinrev (infsupdec (1.224646799147352961e-16, 1.000000000000000000e+00, "def"), infsupdec (3.14, 3.15, "com")), infsupdec (3.14, 3.141592653589793560e+00, "trv")));
%! assert (isequal (decorationpart (sinrev (infsupdec (1.224646799147352961e-16, 1.000000000000000000e+00, "def"), infsupdec (3.14, 3.15, "com"))){1}, decorationpart (infsupdec (3.14, 3.141592653589793560e+00, "trv")){1}));
%!test
%! assert (isequal (sinrev (infsupdec (-3.216245299353273201e-16, 1.000000000000000000e+00, "dac"), infsupdec (1.57, 3.15, "com")), infsupdec (1.57, 3.141592653589794004e+00, "trv")));
%! assert (isequal (decorationpart (sinrev (infsupdec (-3.216245299353273201e-16, 1.000000000000000000e+00, "dac"), infsupdec (1.57, 3.15, "com"))){1}, decorationpart (infsupdec (1.57, 3.141592653589794004e+00, "trv")){1}));
%!test
%! assert (isequal (sinrev (infsupdec (1.224646799147352961e-16, 1.224646799147353207e-16, "com"), infsupdec (-inf, 3.15, "dac")), infsupdec (-inf, 3.141592653589793560e+00, "trv")));
%! assert (isequal (decorationpart (sinrev (infsupdec (1.224646799147352961e-16, 1.224646799147353207e-16, "com"), infsupdec (-inf, 3.15, "dac"))){1}, decorationpart (infsupdec (-inf, 3.141592653589793560e+00, "trv")){1}));
%!test
%! assert (isequal (sinrev (infsupdec (-3.216245299353273201e-16, -3.216245299353272708e-16, "com"), infsupdec (3.14, inf, "dac")), infsupdec (3.141592653589793116e+00, inf, "trv")));
%! assert (isequal (decorationpart (sinrev (infsupdec (-3.216245299353273201e-16, -3.216245299353272708e-16, "com"), infsupdec (3.14, inf, "dac"))){1}, decorationpart (infsupdec (3.141592653589793116e+00, inf, "trv")){1}));

## minimal_cosRev_test

%!test
%! assert (isequal (cosrev (infsup), infsup));
%!test
%! assert (isequal (cosrev (infsup (-2.0, -1.1)), infsup));
%!test
%! assert (isequal (cosrev (infsup (1.1, 2.0)), infsup));
%!test
%! assert (isequal (cosrev (infsup (-1.0, 1.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (cosrev (infsup (0.0, 0.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (cosrev (infsup (1.224646799147352961e-16, 1.224646799147353207e-16)), infsup (-inf, inf)));

## minimal_cosRevBin_test

%!test
%! assert (isequal (cosrev (infsup, infsup (-1.2, 12.1)), infsup));
%!test
%! assert (isequal (cosrev (infsup (-2.0, -1.1), infsup (-5.0, 5.0)), infsup));
%!test
%! assert (isequal (cosrev (infsup (1.1, 2.0), infsup (-5.0, 5.0)), infsup));
%!test
%! assert (isequal (cosrev (infsup (-1.0, 1.0), infsup (-1.2, 12.1)), infsup (-1.2, 12.1)));
%!test
%! assert (isequal (cosrev (infsup (1.0, 1.0), infsup (-0.1, 0.1)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (cosrev (infsup (-1.0, -1.0), infsup (3.14, 3.15)), infsup (3.141592653589793116e+00, 3.141592653589794004e+00)));
%!test
%! assert (isequal (cosrev (infsup (6.123233995736764803e-17, 6.123233995736766036e-17), infsup (1.57, 1.58)), infsup (1.570796326794896336e+00, 1.570796326794896780e+00)));
%!test
%! assert (isequal (cosrev (infsup (-1.608122649676636601e-16, -1.608122649676636354e-16), infsup (1.57, 1.58)), infsup (1.570796326794896558e+00, 1.570796326794897002e+00)));
%!test
%! assert (isequal (cosrev (infsup (-1.608122649676636601e-16, 6.123233995736766036e-17), infsup (1.57, 1.58)), infsup (1.570796326794896336e+00, 1.570796326794897002e+00)));
%!test
%! assert (isequal (cosrev (infsup (6.123233995736764803e-17, 1.0), infsup (-2.0, 2.0)), infsup (-1.570796326794896780e+00, 1.570796326794896780e+00)));
%!test
%! assert (isequal (cosrev (infsup (6.123233995736764803e-17, 1.0), infsup (0.0, 2.0)), infsup (0.0, 1.570796326794896780e+00)));
%!test
%! assert (isequal (cosrev (infsup (-1.608122649676636601e-16, 1.0), infsup (-0.1, 1.5708)), infsup (-0.1, 1.570796326794897002e+00)));
%!test
%! assert (isequal (cosrev (infsup (-1.000000000000000000e+00, -9.999999999999998890e-01), infsup (3.14, 3.15)), infsup (3.141592638688631922e+00, 3.141592668490955198e+00)));
%!test
%! assert (isequal (cosrev (infsup (-1.000000000000000000e+00, -9.999999999999998890e-01), infsup (-3.15, -3.14)), infsup (-3.141592668490955198e+00, -3.141592638688631922e+00)));
%!test
%! assert (isequal (cosrev (infsup (-1.000000000000000000e+00, -9.999999999999998890e-01), infsup (9.42, 9.45)), infsup (9.424777945868218154e+00, 9.424777975670542318e+00)));
%!test
%! assert (isequal (cosrev (infsup (7.648421872844883840e-01, 1.0), infsup (-1.0, 0.1)), infsup (-7.000000000000000666e-01, 0.1)));
%!test
%! assert (isequal (cosrev (infsup (-4.161468365471424069e-01, 5.403023058681397650e-01), infsup (0.0, 2.1)), infsup (9.999999999999998890e-01, 2.000000000000000444e+00)));
%!test
%! assert (isequal (cosrev (infsup (1.224646799147352961e-16, 1.224646799147353207e-16), infsup (-inf, 1.58)), infsup (-inf, 1.570796326794896558e+00)));
%!test
%! assert (isequal (cosrev (infsup (1.224646799147352961e-16, 1.224646799147353207e-16), infsup (-inf, 1.5)), infsup (-inf, -1.570796326794896336e+00)));
%!test
%! assert (isequal (cosrev (infsup (-3.216245299353273201e-16, -3.216245299353272708e-16), infsup (-1.58, inf)), infsup (-1.570796326794897002e+00, inf)));
%!test
%! assert (isequal (cosrev (infsup (-3.216245299353273201e-16, -3.216245299353272708e-16), infsup (-1.5, inf)), infsup (1.570796326794896780e+00, inf)));

## minimal_cosRev_dec_test

%!test
%! assert (isequal (cosrev (infsupdec (empty, "trv")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (cosrev (infsupdec (empty, "trv"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (cosrev (infsupdec (-2.0, -1.1, "def")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (cosrev (infsupdec (-2.0, -1.1, "def"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (cosrev (infsupdec (1.1, 2.0, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (cosrev (infsupdec (1.1, 2.0, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (cosrev (infsupdec (-1.0, 1.0, "com")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (cosrev (infsupdec (-1.0, 1.0, "com"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%!test
%! assert (isequal (cosrev (infsupdec (0.0, 0.0, "def")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (cosrev (infsupdec (0.0, 0.0, "def"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%!test
%! assert (isequal (cosrev (infsupdec (1.224646799147352961e-16, 1.224646799147353207e-16, "dac")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (cosrev (infsupdec (1.224646799147352961e-16, 1.224646799147353207e-16, "dac"))){1}, decorationpart (infsupdec (entire, "trv")){1}));

## minimal_cosRev_dec_bin_test

%!test
%! assert (isequal (cosrev (infsupdec (empty, "trv"), infsupdec (-1.2, 12.1, "def")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (cosrev (infsupdec (empty, "trv"), infsupdec (-1.2, 12.1, "def"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (cosrev (infsupdec (-2.0, -1.1, "dac"), infsupdec (-5.0, 5.0, "com")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (cosrev (infsupdec (-2.0, -1.1, "dac"), infsupdec (-5.0, 5.0, "com"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (cosrev (infsupdec (1.1, 2.0, "dac"), infsupdec (-5.0, 5.0, "com")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (cosrev (infsupdec (1.1, 2.0, "dac"), infsupdec (-5.0, 5.0, "com"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (cosrev (infsupdec (-1.0, 1.0, "dac"), infsupdec (-1.2, 12.1, "def")), infsupdec (-1.2, 12.1, "trv")));
%! assert (isequal (decorationpart (cosrev (infsupdec (-1.0, 1.0, "dac"), infsupdec (-1.2, 12.1, "def"))){1}, decorationpart (infsupdec (-1.2, 12.1, "trv")){1}));
%!test
%! assert (isequal (cosrev (infsupdec (1.0, 1.0, "def"), infsupdec (-0.1, 0.1, "dac")), infsupdec (0.0, 0.0, "trv")));
%! assert (isequal (decorationpart (cosrev (infsupdec (1.0, 1.0, "def"), infsupdec (-0.1, 0.1, "dac"))){1}, decorationpart (infsupdec (0.0, 0.0, "trv")){1}));
%!test
%! assert (isequal (cosrev (infsupdec (-1.0, -1.0, "com"), infsupdec (3.14, 3.15, "dac")), infsupdec (3.141592653589793116e+00, 3.141592653589794004e+00, "trv")));
%! assert (isequal (decorationpart (cosrev (infsupdec (-1.0, -1.0, "com"), infsupdec (3.14, 3.15, "dac"))){1}, decorationpart (infsupdec (3.141592653589793116e+00, 3.141592653589794004e+00, "trv")){1}));
%!test
%! assert (isequal (cosrev (infsupdec (6.123233995736764803e-17, 6.123233995736766036e-17, "def"), infsupdec (1.57, 1.58, "def")), infsupdec (1.570796326794896336e+00, 1.570796326794896780e+00, "trv")));
%! assert (isequal (decorationpart (cosrev (infsupdec (6.123233995736764803e-17, 6.123233995736766036e-17, "def"), infsupdec (1.57, 1.58, "def"))){1}, decorationpart (infsupdec (1.570796326794896336e+00, 1.570796326794896780e+00, "trv")){1}));
%!test
%! assert (isequal (cosrev (infsupdec (-1.608122649676636601e-16, -1.608122649676636354e-16, "dac"), infsupdec (1.57, 1.58, "dac")), infsupdec (1.570796326794896558e+00, 1.570796326794897002e+00, "trv")));
%! assert (isequal (decorationpart (cosrev (infsupdec (-1.608122649676636601e-16, -1.608122649676636354e-16, "dac"), infsupdec (1.57, 1.58, "dac"))){1}, decorationpart (infsupdec (1.570796326794896558e+00, 1.570796326794897002e+00, "trv")){1}));
%!test
%! assert (isequal (cosrev (infsupdec (-1.608122649676636601e-16, 6.123233995736766036e-17, "com"), infsupdec (1.57, 1.58, "dac")), infsupdec (1.570796326794896336e+00, 1.570796326794897002e+00, "trv")));
%! assert (isequal (decorationpart (cosrev (infsupdec (-1.608122649676636601e-16, 6.123233995736766036e-17, "com"), infsupdec (1.57, 1.58, "dac"))){1}, decorationpart (infsupdec (1.570796326794896336e+00, 1.570796326794897002e+00, "trv")){1}));
%!test
%! assert (isequal (cosrev (infsupdec (6.123233995736764803e-17, 1.0, "def"), infsupdec (-2.0, 2.0, "com")), infsupdec (-1.570796326794896780e+00, 1.570796326794896780e+00, "trv")));
%! assert (isequal (decorationpart (cosrev (infsupdec (6.123233995736764803e-17, 1.0, "def"), infsupdec (-2.0, 2.0, "com"))){1}, decorationpart (infsupdec (-1.570796326794896780e+00, 1.570796326794896780e+00, "trv")){1}));
%!test
%! assert (isequal (cosrev (infsupdec (6.123233995736764803e-17, 1.0, "dac"), infsupdec (0.0, 2.0, "def")), infsupdec (0.0, 1.570796326794896780e+00, "trv")));
%! assert (isequal (decorationpart (cosrev (infsupdec (6.123233995736764803e-17, 1.0, "dac"), infsupdec (0.0, 2.0, "def"))){1}, decorationpart (infsupdec (0.0, 1.570796326794896780e+00, "trv")){1}));
%!test
%! assert (isequal (cosrev (infsupdec (-1.608122649676636601e-16, 1.0, "def"), infsupdec (-0.1, 1.5708, "dac")), infsupdec (-0.1, 1.570796326794897002e+00, "trv")));
%! assert (isequal (decorationpart (cosrev (infsupdec (-1.608122649676636601e-16, 1.0, "def"), infsupdec (-0.1, 1.5708, "dac"))){1}, decorationpart (infsupdec (-0.1, 1.570796326794897002e+00, "trv")){1}));
%!test
%! assert (isequal (cosrev (infsupdec (-1.000000000000000000e+00, -9.999999999999998890e-01, "dac"), infsupdec (3.14, 3.15, "def")), infsupdec (3.141592638688631922e+00, 3.141592668490955198e+00, "trv")));
%! assert (isequal (decorationpart (cosrev (infsupdec (-1.000000000000000000e+00, -9.999999999999998890e-01, "dac"), infsupdec (3.14, 3.15, "def"))){1}, decorationpart (infsupdec (3.141592638688631922e+00, 3.141592668490955198e+00, "trv")){1}));
%!test
%! assert (isequal (cosrev (infsupdec (-1.000000000000000000e+00, -9.999999999999998890e-01, "def"), infsupdec (-3.15, -3.14, "com")), infsupdec (-3.141592668490955198e+00, -3.141592638688631922e+00, "trv")));
%! assert (isequal (decorationpart (cosrev (infsupdec (-1.000000000000000000e+00, -9.999999999999998890e-01, "def"), infsupdec (-3.15, -3.14, "com"))){1}, decorationpart (infsupdec (-3.141592668490955198e+00, -3.141592638688631922e+00, "trv")){1}));
%!test
%! assert (isequal (cosrev (infsupdec (-1.000000000000000000e+00, -9.999999999999998890e-01, "def"), infsupdec (9.42, 9.45, "dac")), infsupdec (9.424777945868218154e+00, 9.424777975670542318e+00, "trv")));
%! assert (isequal (decorationpart (cosrev (infsupdec (-1.000000000000000000e+00, -9.999999999999998890e-01, "def"), infsupdec (9.42, 9.45, "dac"))){1}, decorationpart (infsupdec (9.424777945868218154e+00, 9.424777975670542318e+00, "trv")){1}));
%!test
%! assert (isequal (cosrev (infsupdec (7.648421872844883840e-01, 1.0, "dac"), infsupdec (-1.0, 0.1, "def")), infsupdec (-7.000000000000000666e-01, 0.1, "trv")));
%! assert (isequal (decorationpart (cosrev (infsupdec (7.648421872844883840e-01, 1.0, "dac"), infsupdec (-1.0, 0.1, "def"))){1}, decorationpart (infsupdec (-7.000000000000000666e-01, 0.1, "trv")){1}));
%!test
%! assert (isequal (cosrev (infsupdec (-4.161468365471424069e-01, 5.403023058681397650e-01, "com"), infsupdec (0.0, 2.1, "dac")), infsupdec (9.999999999999998890e-01, 2.000000000000000444e+00, "trv")));
%! assert (isequal (decorationpart (cosrev (infsupdec (-4.161468365471424069e-01, 5.403023058681397650e-01, "com"), infsupdec (0.0, 2.1, "dac"))){1}, decorationpart (infsupdec (9.999999999999998890e-01, 2.000000000000000444e+00, "trv")){1}));
%!test
%! assert (isequal (cosrev (infsupdec (1.224646799147352961e-16, 1.224646799147353207e-16, "com"), infsupdec (-inf, 1.58, "dac")), infsupdec (-inf, 1.570796326794896558e+00, "trv")));
%! assert (isequal (decorationpart (cosrev (infsupdec (1.224646799147352961e-16, 1.224646799147353207e-16, "com"), infsupdec (-inf, 1.58, "dac"))){1}, decorationpart (infsupdec (-inf, 1.570796326794896558e+00, "trv")){1}));
%!test
%! assert (isequal (cosrev (infsupdec (1.224646799147352961e-16, 1.224646799147353207e-16, "def"), infsupdec (-inf, 1.5, "dac")), infsupdec (-inf, -1.570796326794896336e+00, "trv")));
%! assert (isequal (decorationpart (cosrev (infsupdec (1.224646799147352961e-16, 1.224646799147353207e-16, "def"), infsupdec (-inf, 1.5, "dac"))){1}, decorationpart (infsupdec (-inf, -1.570796326794896336e+00, "trv")){1}));
%!test
%! assert (isequal (cosrev (infsupdec (-3.216245299353273201e-16, -3.216245299353272708e-16, "dac"), infsupdec (-1.58, inf, "dac")), infsupdec (-1.570796326794897002e+00, inf, "trv")));
%! assert (isequal (decorationpart (cosrev (infsupdec (-3.216245299353273201e-16, -3.216245299353272708e-16, "dac"), infsupdec (-1.58, inf, "dac"))){1}, decorationpart (infsupdec (-1.570796326794897002e+00, inf, "trv")){1}));
%!test
%! assert (isequal (cosrev (infsupdec (-3.216245299353273201e-16, -3.216245299353272708e-16, "def"), infsupdec (-1.5, inf, "dac")), infsupdec (1.570796326794896780e+00, inf, "trv")));
%! assert (isequal (decorationpart (cosrev (infsupdec (-3.216245299353273201e-16, -3.216245299353272708e-16, "def"), infsupdec (-1.5, inf, "dac"))){1}, decorationpart (infsupdec (1.570796326794896780e+00, inf, "trv")){1}));

## minimal_tanRev_test

%!test
%! assert (isequal (tanrev (infsup), infsup));
%!test
%! assert (isequal (tanrev (infsup (-1.0, 1.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (tanrev (infsup (-156.0, -12.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (tanrev (infsup (0.0, 0.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (tanrev (infsup (1.224646799147352961e-16, 1.224646799147353207e-16)), infsup (-inf, inf)));

## minimal_tanRevBin_test

%!test
%! assert (isequal (tanrev (infsup, infsup (-1.5708, 1.5708)), infsup));
%!test
%! assert (isequal (tanrev (infsup (-inf, inf), infsup (-1.5708, 1.5708)), infsup (-1.5708, 1.5708)));
%!test
%! assert (isequal (tanrev (infsup (0.0, 0.0), infsup (-1.5708, 1.5708)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (tanrev (infsup (1.633123935319536800e+16, 1.633123935319537000e+16), infsup (-1.5708, 1.5708)), infsup (-1.570796326794897224e+00, 1.570796326794896780e+00)));
%!test
%! assert (isequal (tanrev (infsup (-1.224646799147353207e-16, -1.224646799147352961e-16), infsup (3.14, 3.15)), infsup (3.141592653589792672e+00, 3.141592653589793560e+00)));
%!test
%! assert (isequal (tanrev (infsup (3.216245299353272708e-16, 3.216245299353273201e-16), infsup (-3.15, 3.15)), infsup (-3.141592653589793560e+00, 3.141592653589794004e+00)));
%!test
%! assert (isequal (tanrev (infsup (-1.633123935309004800e+16, 1.633123935309004800e+16), infsup (-inf, 1.5707965)), infsup (-inf, 1.570796499999999929e+00)));
%!test
%! assert (isequal (tanrev (infsup (-1.633123935309004800e+16, 1.633123935309004800e+16), infsup (-1.5707965, inf)), infsup (-1.570796499999999929e+00, inf)));
%!test
%! assert (isequal (tanrev (infsup (-1.633123935309004800e+16, 1.633123935309004800e+16), infsup (-1.5707965, 1.5707965)), infsup (-1.570796499999999929e+00, 1.570796499999999929e+00)));
%!test
%! assert (isequal (tanrev (infsup (-1.633123935319537000e+16, 1.633123935319537000e+16), infsup (-1.5707965, 1.5707965)), infsup (-1.5707965, 1.5707965)));

## minimal_tanRev_dec_test

%!test
%! assert (isequal (tanrev (infsupdec (empty, "trv")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (tanrev (infsupdec (empty, "trv"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (tanrev (infsupdec (-1.0, 1.0, "com")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (tanrev (infsupdec (-1.0, 1.0, "com"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%!test
%! assert (isequal (tanrev (infsupdec (-156.0, -12.0, "dac")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (tanrev (infsupdec (-156.0, -12.0, "dac"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%!test
%! assert (isequal (tanrev (infsupdec (0.0, 0.0, "def")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (tanrev (infsupdec (0.0, 0.0, "def"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%!test
%! assert (isequal (tanrev (infsupdec (1.224646799147352961e-16, 1.224646799147353207e-16, "com")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (tanrev (infsupdec (1.224646799147352961e-16, 1.224646799147353207e-16, "com"))){1}, decorationpart (infsupdec (entire, "trv")){1}));

## minimal_tanRev_dec_bin_test

%!test
%! assert (isequal (tanrev (infsupdec (empty, "trv"), infsupdec (-1.5708, 1.5708, "def")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (tanrev (infsupdec (empty, "trv"), infsupdec (-1.5708, 1.5708, "def"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (tanrev (infsupdec (entire, "def"), infsupdec (-1.5708, 1.5708, "dac")), infsupdec (-1.5708, 1.5708, "trv")));
%! assert (isequal (decorationpart (tanrev (infsupdec (entire, "def"), infsupdec (-1.5708, 1.5708, "dac"))){1}, decorationpart (infsupdec (-1.5708, 1.5708, "trv")){1}));
%!test
%! assert (isequal (tanrev (infsupdec (0.0, 0.0, "com"), infsupdec (-1.5708, 1.5708, "def")), infsupdec (0.0, 0.0, "trv")));
%! assert (isequal (decorationpart (tanrev (infsupdec (0.0, 0.0, "com"), infsupdec (-1.5708, 1.5708, "def"))){1}, decorationpart (infsupdec (0.0, 0.0, "trv")){1}));
%!test
%! assert (isequal (tanrev (infsupdec (1.633123935319536800e+16, 1.633123935319537000e+16, "dac"), infsupdec (-1.5708, 1.5708, "def")), infsupdec (-1.570796326794897224e+00, 1.570796326794896780e+00, "trv")));
%! assert (isequal (decorationpart (tanrev (infsupdec (1.633123935319536800e+16, 1.633123935319537000e+16, "dac"), infsupdec (-1.5708, 1.5708, "def"))){1}, decorationpart (infsupdec (-1.570796326794897224e+00, 1.570796326794896780e+00, "trv")){1}));
%!test
%! assert (isequal (tanrev (infsupdec (-1.224646799147353207e-16, -1.224646799147352961e-16, "def"), infsupdec (3.14, 3.15, "dac")), infsupdec (3.141592653589792672e+00, 3.141592653589793560e+00, "trv")));
%! assert (isequal (decorationpart (tanrev (infsupdec (-1.224646799147353207e-16, -1.224646799147352961e-16, "def"), infsupdec (3.14, 3.15, "dac"))){1}, decorationpart (infsupdec (3.141592653589792672e+00, 3.141592653589793560e+00, "trv")){1}));
%!test
%! assert (isequal (tanrev (infsupdec (3.216245299353272708e-16, 3.216245299353273201e-16, "com"), infsupdec (-3.15, 3.15, "com")), infsupdec (-3.141592653589793560e+00, 3.141592653589794004e+00, "trv")));
%! assert (isequal (decorationpart (tanrev (infsupdec (3.216245299353272708e-16, 3.216245299353273201e-16, "com"), infsupdec (-3.15, 3.15, "com"))){1}, decorationpart (infsupdec (-3.141592653589793560e+00, 3.141592653589794004e+00, "trv")){1}));
%!test
%! assert (isequal (tanrev (infsupdec (-1.633123935309004800e+16, 1.633123935309004800e+16, "def"), infsupdec (-inf, 1.5707965, "def")), infsupdec (-inf, 1.570796499999999929e+00, "trv")));
%! assert (isequal (decorationpart (tanrev (infsupdec (-1.633123935309004800e+16, 1.633123935309004800e+16, "def"), infsupdec (-inf, 1.5707965, "def"))){1}, decorationpart (infsupdec (-inf, 1.570796499999999929e+00, "trv")){1}));
%!test
%! assert (isequal (tanrev (infsupdec (-1.633123935309004800e+16, 1.633123935309004800e+16, "com"), infsupdec (-1.5707965, inf, "dac")), infsupdec (-1.570796499999999929e+00, inf, "trv")));
%! assert (isequal (decorationpart (tanrev (infsupdec (-1.633123935309004800e+16, 1.633123935309004800e+16, "com"), infsupdec (-1.5707965, inf, "dac"))){1}, decorationpart (infsupdec (-1.570796499999999929e+00, inf, "trv")){1}));
%!test
%! assert (isequal (tanrev (infsupdec (-1.633123935309004800e+16, 1.633123935309004800e+16, "com"), infsupdec (-1.5707965, 1.5707965, "com")), infsupdec (-1.570796499999999929e+00, 1.570796499999999929e+00, "trv")));
%! assert (isequal (decorationpart (tanrev (infsupdec (-1.633123935309004800e+16, 1.633123935309004800e+16, "com"), infsupdec (-1.5707965, 1.5707965, "com"))){1}, decorationpart (infsupdec (-1.570796499999999929e+00, 1.570796499999999929e+00, "trv")){1}));
%!test
%! assert (isequal (tanrev (infsupdec (-1.633123935319537000e+16, 1.633123935319537000e+16, "dac"), infsupdec (-1.5707965, 1.5707965, "def")), infsupdec (-1.5707965, 1.5707965, "trv")));
%! assert (isequal (decorationpart (tanrev (infsupdec (-1.633123935319537000e+16, 1.633123935319537000e+16, "dac"), infsupdec (-1.5707965, 1.5707965, "def"))){1}, decorationpart (infsupdec (-1.5707965, 1.5707965, "trv")){1}));

## minimal_coshRev_test

%!test
%! assert (isequal (coshrev (infsup), infsup));
%!test
%! assert (isequal (coshrev (infsup (1.0, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (coshrev (infsup (0.0, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (coshrev (infsup (1.0, 1.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (coshrev (infsup (1.543080634815243712e+00, 1.705784684221513993e+130)), infsup (-3.005632345000000782e+02, 3.005632345000000782e+02)));

## minimal_coshRevBin_test

%!test
%! assert (isequal (coshrev (infsup, infsup (0.0, inf)), infsup));
%!test
%! assert (isequal (coshrev (infsup (1.0, inf), infsup (0.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (coshrev (infsup (0.0, inf), infsup (1.0, 2.0)), infsup (1.0, 2.0)));
%!test
%! assert (isequal (coshrev (infsup (1.0, 1.0), infsup (1.0, inf)), infsup));
%!test
%! assert (isequal (coshrev (infsup (1.543080634815243712e+00, 1.705784684221513993e+130), infsup (-inf, 0.0)), infsup (-3.005632345000000782e+02, -9.999999999999998890e-01)));

## minimal_coshRev_dec_test

%!test
%! assert (isequal (coshrev (infsupdec (empty, "trv")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (coshrev (infsupdec (empty, "trv"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (coshrev (infsupdec (1.0, inf, "dac")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (coshrev (infsupdec (1.0, inf, "dac"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%!test
%! assert (isequal (coshrev (infsupdec (0.0, inf, "dac")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (coshrev (infsupdec (0.0, inf, "dac"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%!test
%! assert (isequal (coshrev (infsupdec (1.0, 1.0, "def")), infsupdec (0.0, 0.0, "trv")));
%! assert (isequal (decorationpart (coshrev (infsupdec (1.0, 1.0, "def"))){1}, decorationpart (infsupdec (0.0, 0.0, "trv")){1}));
%!test
%! assert (isequal (coshrev (infsupdec (1.543080634815243712e+00, 1.705784684221513993e+130, "com")), infsupdec (-3.005632345000000782e+02, 3.005632345000000782e+02, "trv")));
%! assert (isequal (decorationpart (coshrev (infsupdec (1.543080634815243712e+00, 1.705784684221513993e+130, "com"))){1}, decorationpart (infsupdec (-3.005632345000000782e+02, 3.005632345000000782e+02, "trv")){1}));

## minimal_coshRev_dec_bin_test

%!test
%! assert (isequal (coshrev (infsupdec (empty, "trv"), infsupdec (0.0, inf, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (coshrev (infsupdec (empty, "trv"), infsupdec (0.0, inf, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (coshrev (infsupdec (1.0, inf, "def"), infsupdec (0.0, inf, "dac")), infsupdec (0.0, inf, "trv")));
%! assert (isequal (decorationpart (coshrev (infsupdec (1.0, inf, "def"), infsupdec (0.0, inf, "dac"))){1}, decorationpart (infsupdec (0.0, inf, "trv")){1}));
%!test
%! assert (isequal (coshrev (infsupdec (0.0, inf, "def"), infsupdec (1.0, 2.0, "com")), infsupdec (1.0, 2.0, "trv")));
%! assert (isequal (decorationpart (coshrev (infsupdec (0.0, inf, "def"), infsupdec (1.0, 2.0, "com"))){1}, decorationpart (infsupdec (1.0, 2.0, "trv")){1}));
%!test
%! assert (isequal (coshrev (infsupdec (1.0, 1.0, "dac"), infsupdec (1.0, inf, "def")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (coshrev (infsupdec (1.0, 1.0, "dac"), infsupdec (1.0, inf, "def"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (coshrev (infsupdec (1.543080634815243712e+00, 1.705784684221513993e+130, "com"), infsupdec (-inf, 0.0, "dac")), infsupdec (-3.005632345000000782e+02, -9.999999999999998890e-01, "trv")));
%! assert (isequal (decorationpart (coshrev (infsupdec (1.543080634815243712e+00, 1.705784684221513993e+130, "com"), infsupdec (-inf, 0.0, "dac"))){1}, decorationpart (infsupdec (-3.005632345000000782e+02, -9.999999999999998890e-01, "trv")){1}));

## minimal_mulRev_test

%!test
%! assert (isequal (mulrev (infsup, infsup (1.0, 2.0)), infsup));
%!test
%! assert (isequal (mulrev (infsup (1.0, 2.0), infsup), infsup));
%!test
%! assert (isequal (mulrev (infsup, infsup), infsup));
%!test
%! assert (isequal (mulrev (infsup (-2.0, -0.1), infsup (-2.1, -0.4)), infsup (2.000000000000000111e-01, 2.100000000000000000e+01)));
%!test
%! assert (isequal (mulrev (infsup (-2.0, 0.0), infsup (-2.1, -0.4)), infsup (2.000000000000000111e-01, inf)));
%!test
%! assert (isequal (mulrev (infsup (-2.0, 1.1), infsup (-2.1, -0.4)), infsup (-inf, inf)));
%!test
%! assert (isequal (mulrev (infsup (0.0, 1.1), infsup (-2.1, -0.4)), infsup (-inf, -3.636363636363635909e-01)));
%!test
%! assert (isequal (mulrev (infsup (0.01, 1.1), infsup (-2.1, -0.4)), infsup (-2.100000000000000284e+02, -3.636363636363635909e-01)));
%!test
%! assert (isequal (mulrev (infsup (0.0, 0.0), infsup (-2.1, -0.4)), infsup));
%!test
%! assert (isequal (mulrev (infsup (-inf, -0.1), infsup (-2.1, -0.4)), infsup (0.0, 2.100000000000000000e+01)));
%!test
%! assert (isequal (mulrev (infsup (-inf, 0.0), infsup (-2.1, -0.4)), infsup (0.0, inf)));
%!test
%! assert (isequal (mulrev (infsup (-inf, 1.1), infsup (-2.1, -0.4)), infsup (-inf, inf)));
%!test
%! assert (isequal (mulrev (infsup (-2.0, inf), infsup (-2.1, -0.4)), infsup (-inf, inf)));
%!test
%! assert (isequal (mulrev (infsup (0.0, inf), infsup (-2.1, -0.4)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (mulrev (infsup (0.01, inf), infsup (-2.1, -0.4)), infsup (-2.100000000000000284e+02, 0.0)));
%!test
%! assert (isequal (mulrev (infsup (-inf, inf), infsup (-2.1, -0.4)), infsup (-inf, inf)));
%!test
%! assert (isequal (mulrev (infsup (-2.0, -0.1), infsup (-2.1, 0.0)), infsup (0.0, 2.100000000000000000e+01)));
%!test
%! assert (isequal (mulrev (infsup (-2.0, 0.0), infsup (-2.1, 0.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (mulrev (infsup (-2.0, 1.1), infsup (-2.1, 0.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (mulrev (infsup (0.0, 1.1), infsup (-2.1, 0.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (mulrev (infsup (0.01, 1.1), infsup (-2.1, 0.0)), infsup (-2.100000000000000284e+02, 0.0)));
%!test
%! assert (isequal (mulrev (infsup (0.0, 0.0), infsup (-2.1, 0.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (mulrev (infsup (-inf, -0.1), infsup (-2.1, 0.0)), infsup (0.0, 2.100000000000000000e+01)));
%!test
%! assert (isequal (mulrev (infsup (-inf, 0.0), infsup (-2.1, 0.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (mulrev (infsup (-inf, 1.1), infsup (-2.1, 0.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (mulrev (infsup (-2.0, inf), infsup (-2.1, 0.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (mulrev (infsup (0.0, inf), infsup (-2.1, 0.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (mulrev (infsup (0.01, inf), infsup (-2.1, 0.0)), infsup (-2.100000000000000284e+02, 0.0)));
%!test
%! assert (isequal (mulrev (infsup (-inf, inf), infsup (-2.1, 0.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (mulrev (infsup (-2.0, -0.1), infsup (-2.1, 0.12)), infsup (-1.199999999999999956e+00, 2.100000000000000000e+01)));
%!test
%! assert (isequal (mulrev (infsup (-2.0, 0.0), infsup (-2.1, 0.12)), infsup (-inf, inf)));
%!test
%! assert (isequal (mulrev (infsup (-2.0, 1.1), infsup (-2.1, 0.12)), infsup (-inf, inf)));
%!test
%! assert (isequal (mulrev (infsup (0.0, 1.1), infsup (-2.1, 0.12)), infsup (-inf, inf)));
%!test
%! assert (isequal (mulrev (infsup (0.01, 1.1), infsup (-2.1, 0.12)), infsup (-2.100000000000000284e+02, 1.200000000000000000e+01)));
%!test
%! assert (isequal (mulrev (infsup (0.0, 0.0), infsup (-2.1, 0.12)), infsup (-inf, inf)));
%!test
%! assert (isequal (mulrev (infsup (-inf, -0.1), infsup (-2.1, 0.12)), infsup (-1.199999999999999956e+00, 2.100000000000000000e+01)));
%!test
%! assert (isequal (mulrev (infsup (-inf, 0.0), infsup (-2.1, 0.12)), infsup (-inf, inf)));
%!test
%! assert (isequal (mulrev (infsup (-inf, 1.1), infsup (-2.1, 0.12)), infsup (-inf, inf)));
%!test
%! assert (isequal (mulrev (infsup (-2.0, inf), infsup (-2.1, 0.12)), infsup (-inf, inf)));
%!test
%! assert (isequal (mulrev (infsup (0.0, inf), infsup (-2.1, 0.12)), infsup (-inf, inf)));
%!test
%! assert (isequal (mulrev (infsup (0.01, inf), infsup (-2.1, 0.12)), infsup (-2.100000000000000284e+02, 1.200000000000000000e+01)));
%!test
%! assert (isequal (mulrev (infsup (-inf, inf), infsup (-2.1, 0.12)), infsup (-inf, inf)));
%!test
%! assert (isequal (mulrev (infsup (-2.0, -0.1), infsup (0.0, 0.12)), infsup (-1.199999999999999956e+00, 0.0)));
%!test
%! assert (isequal (mulrev (infsup (-2.0, 0.0), infsup (0.0, 0.12)), infsup (-inf, inf)));
%!test
%! assert (isequal (mulrev (infsup (-2.0, 1.1), infsup (0.0, 0.12)), infsup (-inf, inf)));
%!test
%! assert (isequal (mulrev (infsup (0.0, 1.1), infsup (0.0, 0.12)), infsup (-inf, inf)));
%!test
%! assert (isequal (mulrev (infsup (0.01, 1.1), infsup (0.0, 0.12)), infsup (0.0, 1.200000000000000000e+01)));
%!test
%! assert (isequal (mulrev (infsup (0.0, 0.0), infsup (0.0, 0.12)), infsup (-inf, inf)));
%!test
%! assert (isequal (mulrev (infsup (-inf, -0.1), infsup (0.0, 0.12)), infsup (-1.199999999999999956e+00, 0.0)));
%!test
%! assert (isequal (mulrev (infsup (-inf, 0.0), infsup (0.0, 0.12)), infsup (-inf, inf)));
%!test
%! assert (isequal (mulrev (infsup (-inf, 1.1), infsup (0.0, 0.12)), infsup (-inf, inf)));
%!test
%! assert (isequal (mulrev (infsup (-2.0, inf), infsup (0.0, 0.12)), infsup (-inf, inf)));
%!test
%! assert (isequal (mulrev (infsup (0.0, inf), infsup (0.0, 0.12)), infsup (-inf, inf)));
%!test
%! assert (isequal (mulrev (infsup (0.01, inf), infsup (0.0, 0.12)), infsup (0.0, 1.200000000000000000e+01)));
%!test
%! assert (isequal (mulrev (infsup (-inf, inf), infsup (0.0, 0.12)), infsup (-inf, inf)));
%!test
%! assert (isequal (mulrev (infsup (-2.0, -0.1), infsup (0.01, 0.12)), infsup (-1.199999999999999956e+00, -5.000000000000000104e-03)));
%!test
%! assert (isequal (mulrev (infsup (-2.0, 0.0), infsup (0.01, 0.12)), infsup (-inf, -5.000000000000000104e-03)));
%!test
%! assert (isequal (mulrev (infsup (-2.0, 1.1), infsup (0.01, 0.12)), infsup (-inf, inf)));
%!test
%! assert (isequal (mulrev (infsup (0.0, 1.1), infsup (0.01, 0.12)), infsup (9.090909090909088733e-03, inf)));
%!test
%! assert (isequal (mulrev (infsup (0.01, 1.1), infsup (0.01, 0.12)), infsup (9.090909090909088733e-03, 1.200000000000000000e+01)));
%!test
%! assert (isequal (mulrev (infsup (0.0, 0.0), infsup (0.01, 0.12)), infsup));
%!test
%! assert (isequal (mulrev (infsup (-inf, -0.1), infsup (0.01, 0.12)), infsup (-1.199999999999999956e+00, 0.0)));
%!test
%! assert (isequal (mulrev (infsup (-inf, 0.0), infsup (0.01, 0.12)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (mulrev (infsup (-inf, 1.1), infsup (0.01, 0.12)), infsup (-inf, inf)));
%!test
%! assert (isequal (mulrev (infsup (-2.0, inf), infsup (0.01, 0.12)), infsup (-inf, inf)));
%!test
%! assert (isequal (mulrev (infsup (0.0, inf), infsup (0.01, 0.12)), infsup (0.0, inf)));
%!test
%! assert (isequal (mulrev (infsup (0.01, inf), infsup (0.01, 0.12)), infsup (0.0, 1.200000000000000000e+01)));
%!test
%! assert (isequal (mulrev (infsup (-inf, inf), infsup (0.01, 0.12)), infsup (-inf, inf)));
%!test
%! assert (isequal (mulrev (infsup (-2.0, -0.1), infsup (0.0, 0.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (mulrev (infsup (-2.0, 0.0), infsup (0.0, 0.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (mulrev (infsup (-2.0, 1.1), infsup (0.0, 0.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (mulrev (infsup (0.0, 1.1), infsup (0.0, 0.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (mulrev (infsup (0.01, 1.1), infsup (0.0, 0.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (mulrev (infsup (0.0, 0.0), infsup (0.0, 0.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (mulrev (infsup (-inf, -0.1), infsup (0.0, 0.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (mulrev (infsup (-inf, 0.0), infsup (0.0, 0.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (mulrev (infsup (-inf, 1.1), infsup (0.0, 0.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (mulrev (infsup (-2.0, inf), infsup (0.0, 0.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (mulrev (infsup (0.0, inf), infsup (0.0, 0.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (mulrev (infsup (0.01, inf), infsup (0.0, 0.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (mulrev (infsup (-inf, inf), infsup (0.0, 0.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (mulrev (infsup (-2.0, -0.1), infsup (-inf, -0.1)), infsup (5.000000000000000278e-02, inf)));
%!test
%! assert (isequal (mulrev (infsup (-2.0, 0.0), infsup (-inf, -0.1)), infsup (5.000000000000000278e-02, inf)));
%!test
%! assert (isequal (mulrev (infsup (-2.0, 1.1), infsup (-inf, -0.1)), infsup (-inf, inf)));
%!test
%! assert (isequal (mulrev (infsup (0.0, 1.1), infsup (-inf, -0.1)), infsup (-inf, -9.090909090909089774e-02)));
%!test
%! assert (isequal (mulrev (infsup (0.01, 1.1), infsup (-inf, -0.1)), infsup (-inf, -9.090909090909089774e-02)));
%!test
%! assert (isequal (mulrev (infsup (0.0, 0.0), infsup (-inf, -0.1)), infsup));
%!test
%! assert (isequal (mulrev (infsup (-inf, -0.1), infsup (-inf, -0.1)), infsup (0.0, inf)));
%!test
%! assert (isequal (mulrev (infsup (-inf, 0.0), infsup (-inf, -0.1)), infsup (0.0, inf)));
%!test
%! assert (isequal (mulrev (infsup (-inf, 1.1), infsup (-inf, -0.1)), infsup (-inf, inf)));
%!test
%! assert (isequal (mulrev (infsup (-2.0, inf), infsup (-inf, -0.1)), infsup (-inf, inf)));
%!test
%! assert (isequal (mulrev (infsup (0.0, inf), infsup (-inf, -0.1)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (mulrev (infsup (0.01, inf), infsup (-inf, -0.1)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (mulrev (infsup (-inf, inf), infsup (-inf, -0.1)), infsup (-inf, inf)));
%!test
%! assert (isequal (mulrev (infsup (-2.0, -0.1), infsup (-inf, 0.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (mulrev (infsup (-2.0, 0.0), infsup (-inf, 0.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (mulrev (infsup (-2.0, 1.1), infsup (-inf, 0.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (mulrev (infsup (0.0, 1.1), infsup (-inf, 0.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (mulrev (infsup (0.01, 1.1), infsup (-inf, 0.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (mulrev (infsup (0.0, 0.0), infsup (-inf, 0.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (mulrev (infsup (-inf, -0.1), infsup (-inf, 0.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (mulrev (infsup (-inf, 0.0), infsup (-inf, 0.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (mulrev (infsup (-inf, 1.1), infsup (-inf, 0.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (mulrev (infsup (-2.0, inf), infsup (-inf, 0.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (mulrev (infsup (0.0, inf), infsup (-inf, 0.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (mulrev (infsup (0.01, inf), infsup (-inf, 0.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (mulrev (infsup (-inf, inf), infsup (-inf, 0.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (mulrev (infsup (-2.0, -0.1), infsup (-inf, 0.3)), infsup (-3.000000000000000000e+00, inf)));
%!test
%! assert (isequal (mulrev (infsup (-2.0, 0.0), infsup (-inf, 0.3)), infsup (-inf, inf)));
%!test
%! assert (isequal (mulrev (infsup (-2.0, 1.1), infsup (-inf, 0.3)), infsup (-inf, inf)));
%!test
%! assert (isequal (mulrev (infsup (0.0, 1.1), infsup (-inf, 0.3)), infsup (-inf, inf)));
%!test
%! assert (isequal (mulrev (infsup (0.01, 1.1), infsup (-inf, 0.3)), infsup (-inf, 3.000000000000000000e+01)));
%!test
%! assert (isequal (mulrev (infsup (0.0, 0.0), infsup (-inf, 0.3)), infsup (-inf, inf)));
%!test
%! assert (isequal (mulrev (infsup (-inf, -0.1), infsup (-inf, 0.3)), infsup (-3.000000000000000000e+00, inf)));
%!test
%! assert (isequal (mulrev (infsup (-inf, 0.0), infsup (-inf, 0.3)), infsup (-inf, inf)));
%!test
%! assert (isequal (mulrev (infsup (-inf, 1.1), infsup (-inf, 0.3)), infsup (-inf, inf)));
%!test
%! assert (isequal (mulrev (infsup (-2.0, inf), infsup (-inf, 0.3)), infsup (-inf, inf)));
%!test
%! assert (isequal (mulrev (infsup (0.0, inf), infsup (-inf, 0.3)), infsup (-inf, inf)));
%!test
%! assert (isequal (mulrev (infsup (0.01, inf), infsup (-inf, 0.3)), infsup (-inf, 3.000000000000000000e+01)));
%!test
%! assert (isequal (mulrev (infsup (-inf, inf), infsup (-inf, 0.3)), infsup (-inf, inf)));
%!test
%! assert (isequal (mulrev (infsup (-2.0, -0.1), infsup (-0.21, inf)), infsup (-inf, 2.100000000000000089e+00)));
%!test
%! assert (isequal (mulrev (infsup (-2.0, 0.0), infsup (-0.21, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (mulrev (infsup (-2.0, 1.1), infsup (-0.21, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (mulrev (infsup (0.0, 1.1), infsup (-0.21, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (mulrev (infsup (0.01, 1.1), infsup (-0.21, inf)), infsup (-2.100000000000000000e+01, inf)));
%!test
%! assert (isequal (mulrev (infsup (0.0, 0.0), infsup (-0.21, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (mulrev (infsup (-inf, -0.1), infsup (-0.21, inf)), infsup (-inf, 2.100000000000000089e+00)));
%!test
%! assert (isequal (mulrev (infsup (-inf, 0.0), infsup (-0.21, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (mulrev (infsup (-inf, 1.1), infsup (-0.21, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (mulrev (infsup (-2.0, inf), infsup (-0.21, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (mulrev (infsup (0.0, inf), infsup (-0.21, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (mulrev (infsup (0.01, inf), infsup (-0.21, inf)), infsup (-2.100000000000000000e+01, inf)));
%!test
%! assert (isequal (mulrev (infsup (-inf, inf), infsup (-0.21, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (mulrev (infsup (-2.0, -0.1), infsup (0.0, inf)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (mulrev (infsup (-2.0, 0.0), infsup (0.0, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (mulrev (infsup (-2.0, 1.1), infsup (0.0, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (mulrev (infsup (0.0, 1.1), infsup (0.0, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (mulrev (infsup (0.01, 1.1), infsup (0.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (mulrev (infsup (0.0, 0.0), infsup (0.0, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (mulrev (infsup (-inf, -0.1), infsup (0.0, inf)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (mulrev (infsup (-inf, 0.0), infsup (0.0, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (mulrev (infsup (-inf, 1.1), infsup (0.0, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (mulrev (infsup (-2.0, inf), infsup (0.0, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (mulrev (infsup (0.0, inf), infsup (0.0, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (mulrev (infsup (0.01, inf), infsup (0.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (mulrev (infsup (-inf, inf), infsup (0.0, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (mulrev (infsup (-2.0, -0.1), infsup (0.04, inf)), infsup (-inf, -2.000000000000000042e-02)));
%!test
%! assert (isequal (mulrev (infsup (-2.0, 0.0), infsup (0.04, inf)), infsup (-inf, -2.000000000000000042e-02)));
%!test
%! assert (isequal (mulrev (infsup (-2.0, 1.1), infsup (0.04, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (mulrev (infsup (0.0, 1.1), infsup (0.04, inf)), infsup (3.636363636363635493e-02, inf)));
%!test
%! assert (isequal (mulrev (infsup (0.01, 1.1), infsup (0.04, inf)), infsup (3.636363636363635493e-02, inf)));
%!test
%! assert (isequal (mulrev (infsup (0.0, 0.0), infsup (0.04, inf)), infsup));
%!test
%! assert (isequal (mulrev (infsup (-inf, -0.1), infsup (0.04, inf)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (mulrev (infsup (-inf, 0.0), infsup (0.04, inf)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (mulrev (infsup (-inf, 1.1), infsup (0.04, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (mulrev (infsup (-2.0, inf), infsup (0.04, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (mulrev (infsup (0.0, inf), infsup (0.04, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (mulrev (infsup (0.01, inf), infsup (0.04, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (mulrev (infsup (-inf, inf), infsup (0.04, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (mulrev (infsup (-2.0, -0.1), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (mulrev (infsup (-2.0, 0.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (mulrev (infsup (-2.0, 1.1), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (mulrev (infsup (0.0, 1.1), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (mulrev (infsup (0.01, 1.1), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (mulrev (infsup (0.0, 0.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (mulrev (infsup (-inf, -0.1), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (mulrev (infsup (-inf, 0.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (mulrev (infsup (-inf, 1.1), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (mulrev (infsup (-2.0, inf), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (mulrev (infsup (0.0, inf), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (mulrev (infsup (0.01, inf), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (mulrev (infsup (-inf, inf), infsup (-inf, inf)), infsup (-inf, inf)));

## minimal_mulRevTen_test

%!test
%! assert (isequal (mulrev (infsup (-2.0, -0.1), infsup (-2.1, -0.4), infsup (-2.1, -0.4)), infsup));
%!test
%! assert (isequal (mulrev (infsup (-2.0, 1.1), infsup (-2.1, -0.4), infsup (-2.1, -0.4)), infsup (-2.1, -0.4)));
%!test
%! assert (isequal (mulrev (infsup (0.01, 1.1), infsup (-2.1, 0.0), infsup (-2.1, 0.0)), infsup (-2.1, 0.0)));
%!test
%! assert (isequal (mulrev (infsup (-inf, -0.1), infsup (0.0, 0.12), infsup (0.0, 0.12)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (mulrev (infsup (-2.0, 1.1), infsup (0.04, inf), infsup (0.04, inf)), infsup (0.04, inf)));

## minimal_mulRev_dec_test

%!test
%! assert (isequal (mulrev (infsupdec (-2.0, -0.1, "dac"), infsupdec (-2.1, -0.4, "dac")), infsupdec (2.000000000000000111e-01, 2.100000000000000000e+01, "trv")));
%! assert (isequal (decorationpart (mulrev (infsupdec (-2.0, -0.1, "dac"), infsupdec (-2.1, -0.4, "dac"))){1}, decorationpart (infsupdec (2.000000000000000111e-01, 2.100000000000000000e+01, "trv")){1}));
%!test
%! assert (isequal (mulrev (infsupdec (-2.0, -0.1, "def"), infsupdec (-2.1, 0.0, "def")), infsupdec (0.0, 2.100000000000000000e+01, "trv")));
%! assert (isequal (decorationpart (mulrev (infsupdec (-2.0, -0.1, "def"), infsupdec (-2.1, 0.0, "def"))){1}, decorationpart (infsupdec (0.0, 2.100000000000000000e+01, "trv")){1}));
%!test
%! assert (isequal (mulrev (infsupdec (-2.0, -0.1, "com"), infsupdec (-2.1, 0.12, "dac")), infsupdec (-1.199999999999999956e+00, 2.100000000000000000e+01, "trv")));
%! assert (isequal (decorationpart (mulrev (infsupdec (-2.0, -0.1, "com"), infsupdec (-2.1, 0.12, "dac"))){1}, decorationpart (infsupdec (-1.199999999999999956e+00, 2.100000000000000000e+01, "trv")){1}));
%!test
%! assert (isequal (mulrev (infsupdec (-inf, -0.1, "dac"), infsupdec (0.0, 0.12, "com")), infsupdec (-1.199999999999999956e+00, 0.0, "trv")));
%! assert (isequal (decorationpart (mulrev (infsupdec (-inf, -0.1, "dac"), infsupdec (0.0, 0.12, "com"))){1}, decorationpart (infsupdec (-1.199999999999999956e+00, 0.0, "trv")){1}));
%!test
%! assert (isequal (mulrev (infsupdec (0.01, 1.1, "def"), infsupdec (0.01, 0.12, "dac")), infsupdec (9.090909090909088733e-03, 1.200000000000000000e+01, "trv")));
%! assert (isequal (decorationpart (mulrev (infsupdec (0.01, 1.1, "def"), infsupdec (0.01, 0.12, "dac"))){1}, decorationpart (infsupdec (9.090909090909088733e-03, 1.200000000000000000e+01, "trv")){1}));
%!test
%! assert (isequal (mulrev (infsupdec (0.01, 1.1, "dac"), infsupdec (-inf, 0.3, "def")), infsupdec (-inf, 3.000000000000000000e+01, "trv")));
%! assert (isequal (decorationpart (mulrev (infsupdec (0.01, 1.1, "dac"), infsupdec (-inf, 0.3, "def"))){1}, decorationpart (infsupdec (-inf, 3.000000000000000000e+01, "trv")){1}));
%!test
%! assert (isequal (mulrev (infsupdec (-inf, -0.1, "trv"), infsupdec (-0.21, inf, "dac")), infsupdec (-inf, 2.100000000000000089e+00, "trv")));
%! assert (isequal (decorationpart (mulrev (infsupdec (-inf, -0.1, "trv"), infsupdec (-0.21, inf, "dac"))){1}, decorationpart (infsupdec (-inf, 2.100000000000000089e+00, "trv")){1}));

## minimal_mulRev_dec_ten_test

%!test
%! assert (isequal (mulrev (infsupdec (-2.0, -0.1, "dac"), infsupdec (-2.1, -0.4, "dac"), infsupdec (-2.1, -0.4, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (mulrev (infsupdec (-2.0, -0.1, "dac"), infsupdec (-2.1, -0.4, "dac"), infsupdec (-2.1, -0.4, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (mulrev (infsupdec (-2.0, 1.1, "def"), infsupdec (-2.1, -0.4, "com"), infsupdec (-2.1, -0.4, "com")), infsupdec (-2.1, -0.4, "trv")));
%! assert (isequal (decorationpart (mulrev (infsupdec (-2.0, 1.1, "def"), infsupdec (-2.1, -0.4, "com"), infsupdec (-2.1, -0.4, "com"))){1}, decorationpart (infsupdec (-2.1, -0.4, "trv")){1}));
%!test
%! assert (isequal (mulrev (infsupdec (0.01, 1.1, "com"), infsupdec (-2.1, 0.0, "dac"), infsupdec (-2.1, 0.0, "dac")), infsupdec (-2.1, 0.0, "trv")));
%! assert (isequal (decorationpart (mulrev (infsupdec (0.01, 1.1, "com"), infsupdec (-2.1, 0.0, "dac"), infsupdec (-2.1, 0.0, "dac"))){1}, decorationpart (infsupdec (-2.1, 0.0, "trv")){1}));
%!test
%! assert (isequal (mulrev (infsupdec (-inf, -0.1, "dac"), infsupdec (0.0, 0.12, "com"), infsupdec (0.0, 0.12, "com")), infsupdec (0.0, 0.0, "trv")));
%! assert (isequal (decorationpart (mulrev (infsupdec (-inf, -0.1, "dac"), infsupdec (0.0, 0.12, "com"), infsupdec (0.0, 0.12, "com"))){1}, decorationpart (infsupdec (0.0, 0.0, "trv")){1}));
%!test
%! assert (isequal (mulrev (infsupdec (-2.0, 1.1, "def"), infsupdec (0.04, inf, "dac"), infsupdec (0.04, inf, "dac")), infsupdec (0.04, inf, "trv")));
%! assert (isequal (decorationpart (mulrev (infsupdec (-2.0, 1.1, "def"), infsupdec (0.04, inf, "dac"), infsupdec (0.04, inf, "dac"))){1}, decorationpart (infsupdec (0.04, inf, "trv")){1}));
