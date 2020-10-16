## DO NOT EDIT!  Generated automatically from test/libieeep1788_tests_cancel.itl
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

## minimal_cancelPlus_test

%!test
%! assert (isequal (cancelplus (infsup (-inf, -1.0), infsup), infsup (-inf, inf)));
%!test
%! assert (isequal (cancelplus (infsup (-1.0, inf), infsup), infsup (-inf, inf)));
%!test
%! assert (isequal (cancelplus (infsup (-inf, inf), infsup), infsup (-inf, inf)));
%!test
%! assert (isequal (cancelplus (infsup (-inf, -1.0), infsup (-5.0, 1.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (cancelplus (infsup (-1.0, inf), infsup (-5.0, 1.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (cancelplus (infsup (-inf, inf), infsup (-5.0, 1.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (cancelplus (infsup (-inf, -1.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (cancelplus (infsup (-1.0, inf), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (cancelplus (infsup, infsup (1.0, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (cancelplus (infsup, infsup (-inf, 1.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (cancelplus (infsup, infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (cancelplus (infsup (-1.0, 5.0), infsup (1.0, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (cancelplus (infsup (-1.0, 5.0), infsup (-inf, 1.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (cancelplus (infsup (-1.0, 5.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (cancelplus (infsup (-inf, inf), infsup (1.0, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (cancelplus (infsup (-inf, inf), infsup (-inf, 1.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (cancelplus (infsup (-inf, inf), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (cancelplus (infsup (-5.0, -1.0), infsup (1.0, 5.1)), infsup (-inf, inf)));
%!test
%! assert (isequal (cancelplus (infsup (-5.0, -1.0), infsup (0.9, 5.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (cancelplus (infsup (-5.0, -1.0), infsup (0.9, 5.1)), infsup (-inf, inf)));
%!test
%! assert (isequal (cancelplus (infsup (-10.0, 5.0), infsup (-5.0, 10.1)), infsup (-inf, inf)));
%!test
%! assert (isequal (cancelplus (infsup (-10.0, 5.0), infsup (-5.1, 10.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (cancelplus (infsup (-10.0, 5.0), infsup (-5.1, 10.1)), infsup (-inf, inf)));
%!test
%! assert (isequal (cancelplus (infsup (1.0, 5.0), infsup (-5.0, -0.9)), infsup (-inf, inf)));
%!test
%! assert (isequal (cancelplus (infsup (1.0, 5.0), infsup (-5.1, -1.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (cancelplus (infsup (1.0, 5.0), infsup (-5.1, -0.9)), infsup (-inf, inf)));
%!test
%! assert (isequal (cancelplus (infsup (-10.0, -1.0), infsup), infsup (-inf, inf)));
%!test
%! assert (isequal (cancelplus (infsup (-10.0, 5.0), infsup), infsup (-inf, inf)));
%!test
%! assert (isequal (cancelplus (infsup (1.0, 5.0), infsup), infsup (-inf, inf)));
%!test
%! assert (isequal (cancelplus (infsup, infsup), infsup));
%!test
%! assert (isequal (cancelplus (infsup, infsup (1.0, 10.0)), infsup));
%!test
%! assert (isequal (cancelplus (infsup, infsup (-5.0, 10.0)), infsup));
%!test
%! assert (isequal (cancelplus (infsup, infsup (-5.0, -1.0)), infsup));
%!test
%! assert (isequal (cancelplus (infsup (-5.1, -0.0), infsup (0.0, 5.0)), infsup (-9.999999999999964473e-02, 0.0)));
%!test
%! assert (isequal (cancelplus (infsup (-5.1, -1.0), infsup (1.0, 5.0)), infsup (-9.999999999999964473e-02, 0.0)));
%!test
%! assert (isequal (cancelplus (infsup (-5.0, -0.9), infsup (1.0, 5.0)), infsup (0.0, 9.999999999999997780e-02)));
%!test
%! assert (isequal (cancelplus (infsup (-5.1, -0.9), infsup (1.0, 5.0)), infsup (-9.999999999999964473e-02, 9.999999999999997780e-02)));
%!test
%! assert (isequal (cancelplus (infsup (-5.0, -1.0), infsup (1.0, 5.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (cancelplus (infsup (-10.1, 5.0), infsup (-5.0, 10.0)), infsup (-9.999999999999964473e-02, 0.0)));
%!test
%! assert (isequal (cancelplus (infsup (-10.0, 5.1), infsup (-5.0, 10.0)), infsup (0.0, 9.999999999999964473e-02)));
%!test
%! assert (isequal (cancelplus (infsup (-10.1, 5.1), infsup (-5.0, 10.0)), infsup (-9.999999999999964473e-02, 9.999999999999964473e-02)));
%!test
%! assert (isequal (cancelplus (infsup (-10.0, 5.0), infsup (-5.0, 10.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (cancelplus (infsup (0.9, 5.0), infsup (-5.0, -1.0)), infsup (-9.999999999999997780e-02, 0.0)));
%!test
%! assert (isequal (cancelplus (infsup (1.0, 5.1), infsup (-5.0, -1.0)), infsup (0.0, 9.999999999999964473e-02)));
%!test
%! assert (isequal (cancelplus (infsup (0.0, 5.1), infsup (-5.0, -0.0)), infsup (0.0, 9.999999999999964473e-02)));
%!test
%! assert (isequal (cancelplus (infsup (0.9, 5.1), infsup (-5.0, -1.0)), infsup (-9.999999999999997780e-02, 9.999999999999964473e-02)));
%!test
%! assert (isequal (cancelplus (infsup (1.0, 5.0), infsup (-5.0, -1.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (cancelplus (infsup (0.0, 5.0), infsup (-5.0, -0.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (cancelplus (infsup (1.999999999999996447e+00, 1.999999999999996447e+00), infsup (-1.000000000000000056e-01, -1.000000000000000056e-01)), infsup (1.899999999999996358e+00, 1.899999999999996581e+00)));
%!test
%! assert (isequal (cancelplus (infsup (-1.000000000000000056e-01, 1.999999999999996447e+00), infsup (-1.000000000000000056e-01, 0.01)), infsup (-9.000000000000001055e-02, 1.899999999999996581e+00)));
%!test
%! assert (isequal (cancelplus (infsup (1.797693134862315708e+308, 1.797693134862315708e+308), infsup (1.797693134862315708e+308, 1.797693134862315708e+308)), infsup (1.797693134862315708e+308, inf)));
%!test
%! assert (isequal (cancelplus (infsup (-1.797693134862315708e+308, 1.797693134862315708e+308), infsup (-1.797693134862315708e+308, 1.797693134862315708e+308)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (cancelplus (infsup (-1.797693134862315708e+308, 1.797693134862315708e+308), infsup (-1.797693134862315509e+308, 1.797693134862315708e+308)), infsup (0.0, 1.995840309534719812e+292)));
%!test
%! assert (isequal (cancelplus (infsup (-1.797693134862315708e+308, 1.797693134862315708e+308), infsup (-1.797693134862315708e+308, 1.797693134862315509e+308)), infsup (-1.995840309534719812e+292, 0.0)));
%!test
%! assert (isequal (cancelplus (infsup (-1.797693134862315708e+308, 1.797693134862315509e+308), infsup (-1.797693134862315708e+308, 1.797693134862315708e+308)), infsup (-inf, inf)));
%!test
%! assert (isequal (cancelplus (infsup (-1.797693134862315509e+308, 1.797693134862315708e+308), infsup (-1.797693134862315708e+308, 1.797693134862315708e+308)), infsup (-inf, inf)));
%!test
%! assert (isequal (cancelplus (infsup (-1.000000000000000000e+00, 2.220446049250312834e-16), infsup (-1.000000000000000000e+00, 2.220446049250312588e-16)), infsup (-9.999999999999998890e-01, -9.999999999999997780e-01)));
%!test
%! assert (isequal (cancelplus (infsup (-1.000000000000000000e+00, 2.220446049250312588e-16), infsup (-1.000000000000000000e+00, 2.220446049250312834e-16)), infsup (-inf, inf)));

## minimal_cancelPlus_dec_test

%!test
%! assert (isequal (cancelplus (infsupdec (-inf, -1.0, "dac"), infsupdec (empty, "trv")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (cancelplus (infsupdec (-inf, -1.0, "dac"), infsupdec (empty, "trv"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%!test
%! assert (isequal (cancelplus (infsupdec (-1.0, inf, "def"), infsupdec (empty, "trv")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (cancelplus (infsupdec (-1.0, inf, "def"), infsupdec (empty, "trv"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%!test
%! assert (isequal (cancelplus (infsupdec (entire, "def"), infsupdec (empty, "trv")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (cancelplus (infsupdec (entire, "def"), infsupdec (empty, "trv"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%!test
%! assert (isequal (cancelplus (infsupdec (-inf, -1.0, "dac"), infsupdec (-5.0, 1.0, "com")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (cancelplus (infsupdec (-inf, -1.0, "dac"), infsupdec (-5.0, 1.0, "com"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%!test
%! assert (isequal (cancelplus (infsupdec (-1.0, inf, "trv"), infsupdec (-5.0, 1.0, "def")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (cancelplus (infsupdec (-1.0, inf, "trv"), infsupdec (-5.0, 1.0, "def"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%!test
%! assert (isequal (cancelplus (infsupdec (entire, "def"), infsupdec (-5.0, 1.0, "def")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (cancelplus (infsupdec (entire, "def"), infsupdec (-5.0, 1.0, "def"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%!test
%! assert (isequal (cancelplus (infsupdec (-inf, -1.0, "dac"), infsupdec (entire, "def")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (cancelplus (infsupdec (-inf, -1.0, "dac"), infsupdec (entire, "def"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%!test
%! assert (isequal (cancelplus (infsupdec (-1.0, inf, "def"), infsupdec (entire, "def")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (cancelplus (infsupdec (-1.0, inf, "def"), infsupdec (entire, "def"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%!test
%! assert (isequal (cancelplus (infsupdec (empty, "trv"), infsupdec (1.0, inf, "def")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (cancelplus (infsupdec (empty, "trv"), infsupdec (1.0, inf, "def"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%!test
%! assert (isequal (cancelplus (infsupdec (empty, "trv"), infsupdec (-inf, 1.0, "trv")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (cancelplus (infsupdec (empty, "trv"), infsupdec (-inf, 1.0, "trv"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%!test
%! assert (isequal (cancelplus (infsupdec (empty, "trv"), infsupdec (entire, "def")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (cancelplus (infsupdec (empty, "trv"), infsupdec (entire, "def"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%!test
%! assert (isequal (cancelplus (infsupdec (-1.0, 5.0, "dac"), infsupdec (1.0, inf, "dac")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (cancelplus (infsupdec (-1.0, 5.0, "dac"), infsupdec (1.0, inf, "dac"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%!test
%! assert (isequal (cancelplus (infsupdec (-1.0, 5.0, "def"), infsupdec (-inf, 1.0, "dac")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (cancelplus (infsupdec (-1.0, 5.0, "def"), infsupdec (-inf, 1.0, "dac"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%!test
%! assert (isequal (cancelplus (infsupdec (-1.0, 5.0, "com"), infsupdec (entire, "def")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (cancelplus (infsupdec (-1.0, 5.0, "com"), infsupdec (entire, "def"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%!test
%! assert (isequal (cancelplus (infsupdec (entire, "def"), infsupdec (1.0, inf, "dac")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (cancelplus (infsupdec (entire, "def"), infsupdec (1.0, inf, "dac"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%!test
%! assert (isequal (cancelplus (infsupdec (entire, "def"), infsupdec (-inf, 1.0, "def")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (cancelplus (infsupdec (entire, "def"), infsupdec (-inf, 1.0, "def"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%!test
%! assert (isequal (cancelplus (infsupdec (entire, "def"), infsupdec (entire, "def")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (cancelplus (infsupdec (entire, "def"), infsupdec (entire, "def"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%!test
%! assert (isequal (cancelplus (infsupdec (-5.0, -1.0, "com"), infsupdec (1.0, 5.1, "def")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (cancelplus (infsupdec (-5.0, -1.0, "com"), infsupdec (1.0, 5.1, "def"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%!test
%! assert (isequal (cancelplus (infsupdec (-5.0, -1.0, "dac"), infsupdec (0.9, 5.0, "def")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (cancelplus (infsupdec (-5.0, -1.0, "dac"), infsupdec (0.9, 5.0, "def"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%!test
%! assert (isequal (cancelplus (infsupdec (-5.0, -1.0, "def"), infsupdec (0.9, 5.1, "def")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (cancelplus (infsupdec (-5.0, -1.0, "def"), infsupdec (0.9, 5.1, "def"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%!test
%! assert (isequal (cancelplus (infsupdec (-10.0, 5.0, "trv"), infsupdec (-5.0, 10.1, "dac")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (cancelplus (infsupdec (-10.0, 5.0, "trv"), infsupdec (-5.0, 10.1, "dac"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%!test
%! assert (isequal (cancelplus (infsupdec (-10.0, 5.0, "com"), infsupdec (-5.1, 10.0, "dac")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (cancelplus (infsupdec (-10.0, 5.0, "com"), infsupdec (-5.1, 10.0, "dac"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%!test
%! assert (isequal (cancelplus (infsupdec (-10.0, 5.0, "dac"), infsupdec (-5.1, 10.1, "dac")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (cancelplus (infsupdec (-10.0, 5.0, "dac"), infsupdec (-5.1, 10.1, "dac"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%!test
%! assert (isequal (cancelplus (infsupdec (1.0, 5.0, "def"), infsupdec (-5.0, -0.9, "com")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (cancelplus (infsupdec (1.0, 5.0, "def"), infsupdec (-5.0, -0.9, "com"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%!test
%! assert (isequal (cancelplus (infsupdec (1.0, 5.0, "trv"), infsupdec (-5.1, -1.0, "com")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (cancelplus (infsupdec (1.0, 5.0, "trv"), infsupdec (-5.1, -1.0, "com"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%!test
%! assert (isequal (cancelplus (infsupdec (1.0, 5.0, "dac"), infsupdec (-5.1, -0.9, "com")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (cancelplus (infsupdec (1.0, 5.0, "dac"), infsupdec (-5.1, -0.9, "com"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%!test
%! assert (isequal (cancelplus (infsupdec (-10.0, -1.0, "trv"), infsupdec (empty, "trv")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (cancelplus (infsupdec (-10.0, -1.0, "trv"), infsupdec (empty, "trv"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%!test
%! assert (isequal (cancelplus (infsupdec (-10.0, 5.0, "def"), infsupdec (empty, "trv")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (cancelplus (infsupdec (-10.0, 5.0, "def"), infsupdec (empty, "trv"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%!test
%! assert (isequal (cancelplus (infsupdec (1.0, 5.0, "com"), infsupdec (empty, "trv")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (cancelplus (infsupdec (1.0, 5.0, "com"), infsupdec (empty, "trv"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%!test
%! assert (isequal (cancelplus (infsupdec (empty, "trv"), infsupdec (empty, "trv")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (cancelplus (infsupdec (empty, "trv"), infsupdec (empty, "trv"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (cancelplus (infsupdec (empty, "trv"), infsupdec (1.0, 10.0, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (cancelplus (infsupdec (empty, "trv"), infsupdec (1.0, 10.0, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (cancelplus (infsupdec (empty, "trv"), infsupdec (-5.0, 10.0, "def")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (cancelplus (infsupdec (empty, "trv"), infsupdec (-5.0, 10.0, "def"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (cancelplus (infsupdec (empty, "trv"), infsupdec (-5.0, -1.0, "com")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (cancelplus (infsupdec (empty, "trv"), infsupdec (-5.0, -1.0, "com"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (cancelplus (infsupdec (-5.1, -0.0, "com"), infsupdec (0.0, 5.0, "com")), infsupdec (-9.999999999999964473e-02, 0.0, "trv")));
%! assert (isequal (decorationpart (cancelplus (infsupdec (-5.1, -0.0, "com"), infsupdec (0.0, 5.0, "com"))){1}, decorationpart (infsupdec (-9.999999999999964473e-02, 0.0, "trv")){1}));
%!test
%! assert (isequal (cancelplus (infsupdec (-5.1, -1.0, "com"), infsupdec (1.0, 5.0, "dac")), infsupdec (-9.999999999999964473e-02, 0.0, "trv")));
%! assert (isequal (decorationpart (cancelplus (infsupdec (-5.1, -1.0, "com"), infsupdec (1.0, 5.0, "dac"))){1}, decorationpart (infsupdec (-9.999999999999964473e-02, 0.0, "trv")){1}));
%!test
%! assert (isequal (cancelplus (infsupdec (-5.0, -0.9, "com"), infsupdec (1.0, 5.0, "def")), infsupdec (0.0, 9.999999999999997780e-02, "trv")));
%! assert (isequal (decorationpart (cancelplus (infsupdec (-5.0, -0.9, "com"), infsupdec (1.0, 5.0, "def"))){1}, decorationpart (infsupdec (0.0, 9.999999999999997780e-02, "trv")){1}));
%!test
%! assert (isequal (cancelplus (infsupdec (-5.1, -0.9, "dac"), infsupdec (1.0, 5.0, "trv")), infsupdec (-9.999999999999964473e-02, 9.999999999999997780e-02, "trv")));
%! assert (isequal (decorationpart (cancelplus (infsupdec (-5.1, -0.9, "dac"), infsupdec (1.0, 5.0, "trv"))){1}, decorationpart (infsupdec (-9.999999999999964473e-02, 9.999999999999997780e-02, "trv")){1}));
%!test
%! assert (isequal (cancelplus (infsupdec (-5.0, -1.0, "dac"), infsupdec (1.0, 5.0, "com")), infsupdec (0.0, 0.0, "trv")));
%! assert (isequal (decorationpart (cancelplus (infsupdec (-5.0, -1.0, "dac"), infsupdec (1.0, 5.0, "com"))){1}, decorationpart (infsupdec (0.0, 0.0, "trv")){1}));
%!test
%! assert (isequal (cancelplus (infsupdec (-10.1, 5.0, "dac"), infsupdec (-5.0, 10.0, "dac")), infsupdec (-9.999999999999964473e-02, 0.0, "trv")));
%! assert (isequal (decorationpart (cancelplus (infsupdec (-10.1, 5.0, "dac"), infsupdec (-5.0, 10.0, "dac"))){1}, decorationpart (infsupdec (-9.999999999999964473e-02, 0.0, "trv")){1}));
%!test
%! assert (isequal (cancelplus (infsupdec (-10.0, 5.1, "def"), infsupdec (-5.0, 10.0, "def")), infsupdec (0.0, 9.999999999999964473e-02, "trv")));
%! assert (isequal (decorationpart (cancelplus (infsupdec (-10.0, 5.1, "def"), infsupdec (-5.0, 10.0, "def"))){1}, decorationpart (infsupdec (0.0, 9.999999999999964473e-02, "trv")){1}));
%!test
%! assert (isequal (cancelplus (infsupdec (-10.1, 5.1, "def"), infsupdec (-5.0, 10.0, "trv")), infsupdec (-9.999999999999964473e-02, 9.999999999999964473e-02, "trv")));
%! assert (isequal (decorationpart (cancelplus (infsupdec (-10.1, 5.1, "def"), infsupdec (-5.0, 10.0, "trv"))){1}, decorationpart (infsupdec (-9.999999999999964473e-02, 9.999999999999964473e-02, "trv")){1}));
%!test
%! assert (isequal (cancelplus (infsupdec (-10.0, 5.0, "def"), infsupdec (-5.0, 10.0, "com")), infsupdec (0.0, 0.0, "trv")));
%! assert (isequal (decorationpart (cancelplus (infsupdec (-10.0, 5.0, "def"), infsupdec (-5.0, 10.0, "com"))){1}, decorationpart (infsupdec (0.0, 0.0, "trv")){1}));
%!test
%! assert (isequal (cancelplus (infsupdec (0.9, 5.0, "trv"), infsupdec (-5.0, -1.0, "dac")), infsupdec (-9.999999999999997780e-02, 0.0, "trv")));
%! assert (isequal (decorationpart (cancelplus (infsupdec (0.9, 5.0, "trv"), infsupdec (-5.0, -1.0, "dac"))){1}, decorationpart (infsupdec (-9.999999999999997780e-02, 0.0, "trv")){1}));
%!test
%! assert (isequal (cancelplus (infsupdec (1.0, 5.1, "trv"), infsupdec (-5.0, -1.0, "def")), infsupdec (0.0, 9.999999999999964473e-02, "trv")));
%! assert (isequal (decorationpart (cancelplus (infsupdec (1.0, 5.1, "trv"), infsupdec (-5.0, -1.0, "def"))){1}, decorationpart (infsupdec (0.0, 9.999999999999964473e-02, "trv")){1}));
%!test
%! assert (isequal (cancelplus (infsupdec (0.0, 5.1, "trv"), infsupdec (-5.0, -0.0, "trv")), infsupdec (0.0, 9.999999999999964473e-02, "trv")));
%! assert (isequal (decorationpart (cancelplus (infsupdec (0.0, 5.1, "trv"), infsupdec (-5.0, -0.0, "trv"))){1}, decorationpart (infsupdec (0.0, 9.999999999999964473e-02, "trv")){1}));
%!test
%! assert (isequal (cancelplus (infsupdec (0.9, 5.1, "com"), infsupdec (-5.0, -1.0, "com")), infsupdec (-9.999999999999997780e-02, 9.999999999999964473e-02, "trv")));
%! assert (isequal (decorationpart (cancelplus (infsupdec (0.9, 5.1, "com"), infsupdec (-5.0, -1.0, "com"))){1}, decorationpart (infsupdec (-9.999999999999997780e-02, 9.999999999999964473e-02, "trv")){1}));
%!test
%! assert (isequal (cancelplus (infsupdec (1.0, 5.0, "dac"), infsupdec (-5.0, -1.0, "dac")), infsupdec (0.0, 0.0, "trv")));
%! assert (isequal (decorationpart (cancelplus (infsupdec (1.0, 5.0, "dac"), infsupdec (-5.0, -1.0, "dac"))){1}, decorationpart (infsupdec (0.0, 0.0, "trv")){1}));
%!test
%! assert (isequal (cancelplus (infsupdec (0.0, 5.0, "def"), infsupdec (-5.0, -0.0, "trv")), infsupdec (0.0, 0.0, "trv")));
%! assert (isequal (decorationpart (cancelplus (infsupdec (0.0, 5.0, "def"), infsupdec (-5.0, -0.0, "trv"))){1}, decorationpart (infsupdec (0.0, 0.0, "trv")){1}));
%!test
%! assert (isequal (cancelplus (infsupdec (1.999999999999996447e+00, 1.999999999999996447e+00, "com"), infsupdec (-1.000000000000000056e-01, -1.000000000000000056e-01, "com")), infsupdec (1.899999999999996358e+00, 1.899999999999996581e+00, "trv")));
%! assert (isequal (decorationpart (cancelplus (infsupdec (1.999999999999996447e+00, 1.999999999999996447e+00, "com"), infsupdec (-1.000000000000000056e-01, -1.000000000000000056e-01, "com"))){1}, decorationpart (infsupdec (1.899999999999996358e+00, 1.899999999999996581e+00, "trv")){1}));
%!test
%! assert (isequal (cancelplus (infsupdec (-1.000000000000000056e-01, 1.999999999999996447e+00, "dac"), infsupdec (-1.000000000000000056e-01, 0.01, "com")), infsupdec (-9.000000000000001055e-02, 1.899999999999996581e+00, "trv")));
%! assert (isequal (decorationpart (cancelplus (infsupdec (-1.000000000000000056e-01, 1.999999999999996447e+00, "dac"), infsupdec (-1.000000000000000056e-01, 0.01, "com"))){1}, decorationpart (infsupdec (-9.000000000000001055e-02, 1.899999999999996581e+00, "trv")){1}));
%!test
%! assert (isequal (cancelplus (infsupdec (1.797693134862315708e+308, 1.797693134862315708e+308, "com"), infsupdec (1.797693134862315708e+308, 1.797693134862315708e+308, "com")), infsupdec (1.797693134862315708e+308, inf, "trv")));
%! assert (isequal (decorationpart (cancelplus (infsupdec (1.797693134862315708e+308, 1.797693134862315708e+308, "com"), infsupdec (1.797693134862315708e+308, 1.797693134862315708e+308, "com"))){1}, decorationpart (infsupdec (1.797693134862315708e+308, inf, "trv")){1}));
%!test
%! assert (isequal (cancelplus (infsupdec (-1.797693134862315708e+308, 1.797693134862315708e+308, "com"), infsupdec (-1.797693134862315708e+308, 1.797693134862315708e+308, "com")), infsupdec (0.0, 0.0, "trv")));
%! assert (isequal (decorationpart (cancelplus (infsupdec (-1.797693134862315708e+308, 1.797693134862315708e+308, "com"), infsupdec (-1.797693134862315708e+308, 1.797693134862315708e+308, "com"))){1}, decorationpart (infsupdec (0.0, 0.0, "trv")){1}));
%!test
%! assert (isequal (cancelplus (infsupdec (-1.797693134862315708e+308, 1.797693134862315708e+308, "dac"), infsupdec (-1.797693134862315509e+308, 1.797693134862315708e+308, "com")), infsupdec (0.0, 1.995840309534719812e+292, "trv")));
%! assert (isequal (decorationpart (cancelplus (infsupdec (-1.797693134862315708e+308, 1.797693134862315708e+308, "dac"), infsupdec (-1.797693134862315509e+308, 1.797693134862315708e+308, "com"))){1}, decorationpart (infsupdec (0.0, 1.995840309534719812e+292, "trv")){1}));
%!test
%! assert (isequal (cancelplus (infsupdec (-1.797693134862315708e+308, 1.797693134862315708e+308, "dac"), infsupdec (-1.797693134862315708e+308, 1.797693134862315509e+308, "com")), infsupdec (-1.995840309534719812e+292, 0.0, "trv")));
%! assert (isequal (decorationpart (cancelplus (infsupdec (-1.797693134862315708e+308, 1.797693134862315708e+308, "dac"), infsupdec (-1.797693134862315708e+308, 1.797693134862315509e+308, "com"))){1}, decorationpart (infsupdec (-1.995840309534719812e+292, 0.0, "trv")){1}));
%!test
%! assert (isequal (cancelplus (infsupdec (-1.797693134862315708e+308, 1.797693134862315509e+308, "com"), infsupdec (-1.797693134862315708e+308, 1.797693134862315708e+308, "com")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (cancelplus (infsupdec (-1.797693134862315708e+308, 1.797693134862315509e+308, "com"), infsupdec (-1.797693134862315708e+308, 1.797693134862315708e+308, "com"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%!test
%! assert (isequal (cancelplus (infsupdec (-1.797693134862315509e+308, 1.797693134862315708e+308, "com"), infsupdec (-1.797693134862315708e+308, 1.797693134862315708e+308, "com")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (cancelplus (infsupdec (-1.797693134862315509e+308, 1.797693134862315708e+308, "com"), infsupdec (-1.797693134862315708e+308, 1.797693134862315708e+308, "com"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%!test
%! assert (isequal (cancelplus (infsupdec (-1.000000000000000000e+00, 2.220446049250312834e-16, "dac"), infsupdec (-1.000000000000000000e+00, 2.220446049250312588e-16, "com")), infsupdec (-9.999999999999998890e-01, -9.999999999999997780e-01, "trv")));
%! assert (isequal (decorationpart (cancelplus (infsupdec (-1.000000000000000000e+00, 2.220446049250312834e-16, "dac"), infsupdec (-1.000000000000000000e+00, 2.220446049250312588e-16, "com"))){1}, decorationpart (infsupdec (-9.999999999999998890e-01, -9.999999999999997780e-01, "trv")){1}));
%!test
%! assert (isequal (cancelplus (infsupdec (-1.000000000000000000e+00, 2.220446049250312588e-16, "def"), infsupdec (-1.000000000000000000e+00, 2.220446049250312834e-16, "com")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (cancelplus (infsupdec (-1.000000000000000000e+00, 2.220446049250312588e-16, "def"), infsupdec (-1.000000000000000000e+00, 2.220446049250312834e-16, "com"))){1}, decorationpart (infsupdec (entire, "trv")){1}));

## minimal_cancelMinus_test

%!test
%! assert (isequal (cancelminus (infsup (-inf, -1.0), infsup), infsup (-inf, inf)));
%!test
%! assert (isequal (cancelminus (infsup (-1.0, inf), infsup), infsup (-inf, inf)));
%!test
%! assert (isequal (cancelminus (infsup (-inf, inf), infsup), infsup (-inf, inf)));
%!test
%! assert (isequal (cancelminus (infsup (-inf, -1.0), infsup (-1.0, 5.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (cancelminus (infsup (-1.0, inf), infsup (-1.0, 5.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (cancelminus (infsup (-inf, inf), infsup (-1.0, 5.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (cancelminus (infsup (-inf, -1.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (cancelminus (infsup (-1.0, inf), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (cancelminus (infsup, infsup (-inf, -1.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (cancelminus (infsup, infsup (-1.0, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (cancelminus (infsup, infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (cancelminus (infsup (-1.0, 5.0), infsup (-inf, -1.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (cancelminus (infsup (-1.0, 5.0), infsup (-1.0, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (cancelminus (infsup (-1.0, 5.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (cancelminus (infsup (-inf, inf), infsup (-inf, -1.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (cancelminus (infsup (-inf, inf), infsup (-1.0, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (cancelminus (infsup (-inf, inf), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (cancelminus (infsup (-5.0, -1.0), infsup (-5.1, -1.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (cancelminus (infsup (-5.0, -1.0), infsup (-5.0, -0.9)), infsup (-inf, inf)));
%!test
%! assert (isequal (cancelminus (infsup (-5.0, -1.0), infsup (-5.1, -0.9)), infsup (-inf, inf)));
%!test
%! assert (isequal (cancelminus (infsup (-10.0, 5.0), infsup (-10.1, 5.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (cancelminus (infsup (-10.0, 5.0), infsup (-10.0, 5.1)), infsup (-inf, inf)));
%!test
%! assert (isequal (cancelminus (infsup (-10.0, 5.0), infsup (-10.1, 5.1)), infsup (-inf, inf)));
%!test
%! assert (isequal (cancelminus (infsup (1.0, 5.0), infsup (0.9, 5.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (cancelminus (infsup (1.0, 5.0), infsup (1.0, 5.1)), infsup (-inf, inf)));
%!test
%! assert (isequal (cancelminus (infsup (1.0, 5.0), infsup (0.9, 5.1)), infsup (-inf, inf)));
%!test
%! assert (isequal (cancelminus (infsup (-10.0, -1.0), infsup), infsup (-inf, inf)));
%!test
%! assert (isequal (cancelminus (infsup (-10.0, 5.0), infsup), infsup (-inf, inf)));
%!test
%! assert (isequal (cancelminus (infsup (1.0, 5.0), infsup), infsup (-inf, inf)));
%!test
%! assert (isequal (cancelminus (infsup, infsup), infsup));
%!test
%! assert (isequal (cancelminus (infsup, infsup (-10.0, -1.0)), infsup));
%!test
%! assert (isequal (cancelminus (infsup, infsup (-10.0, 5.0)), infsup));
%!test
%! assert (isequal (cancelminus (infsup, infsup (1.0, 5.0)), infsup));
%!test
%! assert (isequal (cancelminus (infsup (-5.1, -0.0), infsup (-5.0, 0.0)), infsup (-9.999999999999964473e-02, 0.0)));
%!test
%! assert (isequal (cancelminus (infsup (-5.1, -1.0), infsup (-5.0, -1.0)), infsup (-9.999999999999964473e-02, 0.0)));
%!test
%! assert (isequal (cancelminus (infsup (-5.0, -0.9), infsup (-5.0, -1.0)), infsup (0.0, 9.999999999999997780e-02)));
%!test
%! assert (isequal (cancelminus (infsup (-5.1, -0.9), infsup (-5.0, -1.0)), infsup (-9.999999999999964473e-02, 9.999999999999997780e-02)));
%!test
%! assert (isequal (cancelminus (infsup (-5.0, -1.0), infsup (-5.0, -1.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (cancelminus (infsup (-10.1, 5.0), infsup (-10.0, 5.0)), infsup (-9.999999999999964473e-02, 0.0)));
%!test
%! assert (isequal (cancelminus (infsup (-10.0, 5.1), infsup (-10.0, 5.0)), infsup (0.0, 9.999999999999964473e-02)));
%!test
%! assert (isequal (cancelminus (infsup (-10.1, 5.1), infsup (-10.0, 5.0)), infsup (-9.999999999999964473e-02, 9.999999999999964473e-02)));
%!test
%! assert (isequal (cancelminus (infsup (-10.0, 5.0), infsup (-10.0, 5.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (cancelminus (infsup (0.9, 5.0), infsup (1.0, 5.0)), infsup (-9.999999999999997780e-02, 0.0)));
%!test
%! assert (isequal (cancelminus (infsup (-0.0, 5.1), infsup (0.0, 5.0)), infsup (0.0, 9.999999999999964473e-02)));
%!test
%! assert (isequal (cancelminus (infsup (1.0, 5.1), infsup (1.0, 5.0)), infsup (0.0, 9.999999999999964473e-02)));
%!test
%! assert (isequal (cancelminus (infsup (0.9, 5.1), infsup (1.0, 5.0)), infsup (-9.999999999999997780e-02, 9.999999999999964473e-02)));
%!test
%! assert (isequal (cancelminus (infsup (1.0, 5.0), infsup (1.0, 5.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (cancelminus (infsup (-5.0, 1.0), infsup (-1.0, 5.0)), infsup (-4.0, -4.0)));
%!test
%! assert (isequal (cancelminus (infsup (-5.0, 0.0), infsup (-0.0, 5.0)), infsup (-5.0, -5.0)));
%!test
%! assert (isequal (cancelminus (infsup (1.999999999999996447e+00, 1.999999999999996447e+00), infsup (1.000000000000000056e-01, 1.000000000000000056e-01)), infsup (1.899999999999996358e+00, 1.899999999999996581e+00)));
%!test
%! assert (isequal (cancelminus (infsup (-1.000000000000000056e-01, 1.999999999999996447e+00), infsup (-0.01, 1.000000000000000056e-01)), infsup (-9.000000000000001055e-02, 1.899999999999996581e+00)));
%!test
%! assert (isequal (cancelminus (infsup (1.797693134862315708e+308, 1.797693134862315708e+308), infsup (-1.797693134862315708e+308, -1.797693134862315708e+308)), infsup (1.797693134862315708e+308, inf)));
%!test
%! assert (isequal (cancelminus (infsup (-1.797693134862315708e+308, 1.797693134862315708e+308), infsup (-1.797693134862315708e+308, 1.797693134862315708e+308)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (cancelminus (infsup (-1.797693134862315708e+308, 1.797693134862315708e+308), infsup (-1.797693134862315708e+308, 1.797693134862315509e+308)), infsup (0.0, 1.995840309534719812e+292)));
%!test
%! assert (isequal (cancelminus (infsup (-1.797693134862315708e+308, 1.797693134862315708e+308), infsup (-1.797693134862315509e+308, 1.797693134862315708e+308)), infsup (-1.995840309534719812e+292, 0.0)));
%!test
%! assert (isequal (cancelminus (infsup (-1.797693134862315708e+308, 1.797693134862315509e+308), infsup (-1.797693134862315708e+308, 1.797693134862315708e+308)), infsup (-inf, inf)));
%!test
%! assert (isequal (cancelminus (infsup (-1.797693134862315509e+308, 1.797693134862315708e+308), infsup (-1.797693134862315708e+308, 1.797693134862315708e+308)), infsup (-inf, inf)));
%!test
%! assert (isequal (cancelminus (infsup (4.940656458412465442e-324, 4.940656458412465442e-324), infsup (4.940656458412465442e-324, 4.940656458412465442e-324)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (cancelminus (infsup (4.940656458412465442e-324, 4.940656458412465442e-324), infsup (-4.940656458412465442e-324, -4.940656458412465442e-324)), infsup (9.881312916824930884e-324, 9.881312916824930884e-324)));
%!test
%! assert (isequal (cancelminus (infsup (2.225073858507201383e-308, 2.225073858507202371e-308), infsup (2.225073858507201383e-308, 2.225073858507201877e-308)), infsup (0.0, 4.940656458412465442e-324)));
%!test
%! assert (isequal (cancelminus (infsup (2.225073858507201383e-308, 2.225073858507201877e-308), infsup (2.225073858507201383e-308, 2.225073858507202371e-308)), infsup (-inf, inf)));
%!test
%! assert (isequal (cancelminus (infsup (-1.000000000000000000e+00, 2.220446049250312834e-16), infsup (-2.220446049250312588e-16, 1.000000000000000000e+00)), infsup (-9.999999999999998890e-01, -9.999999999999997780e-01)));
%!test
%! assert (isequal (cancelminus (infsup (-1.000000000000000000e+00, 2.220446049250312588e-16), infsup (-2.220446049250312834e-16, 1.000000000000000000e+00)), infsup (-inf, inf)));

## minimal_cancelMinus_dec_test

%!test
%! assert (isequal (cancelminus (infsupdec (-inf, -1.0, "dac"), infsupdec (empty, "trv")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (cancelminus (infsupdec (-inf, -1.0, "dac"), infsupdec (empty, "trv"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%!test
%! assert (isequal (cancelminus (infsupdec (-1.0, inf, "def"), infsupdec (empty, "trv")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (cancelminus (infsupdec (-1.0, inf, "def"), infsupdec (empty, "trv"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%!test
%! assert (isequal (cancelminus (infsupdec (entire, "def"), infsupdec (empty, "trv")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (cancelminus (infsupdec (entire, "def"), infsupdec (empty, "trv"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%!test
%! assert (isequal (cancelminus (infsupdec (-inf, -1.0, "trv"), infsupdec (-1.0, 5.0, "dac")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (cancelminus (infsupdec (-inf, -1.0, "trv"), infsupdec (-1.0, 5.0, "dac"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%!test
%! assert (isequal (cancelminus (infsupdec (-1.0, inf, "dac"), infsupdec (-1.0, 5.0, "com")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (cancelminus (infsupdec (-1.0, inf, "dac"), infsupdec (-1.0, 5.0, "com"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%!test
%! assert (isequal (cancelminus (infsupdec (entire, "def"), infsupdec (-1.0, 5.0, "def")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (cancelminus (infsupdec (entire, "def"), infsupdec (-1.0, 5.0, "def"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%!test
%! assert (isequal (cancelminus (infsupdec (-inf, -1.0, "def"), infsupdec (entire, "def")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (cancelminus (infsupdec (-inf, -1.0, "def"), infsupdec (entire, "def"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%!test
%! assert (isequal (cancelminus (infsupdec (-1.0, inf, "trv"), infsupdec (entire, "def")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (cancelminus (infsupdec (-1.0, inf, "trv"), infsupdec (entire, "def"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%!test
%! assert (isequal (cancelminus (infsupdec (empty, "trv"), infsupdec (-inf, -1.0, "dac")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (cancelminus (infsupdec (empty, "trv"), infsupdec (-inf, -1.0, "dac"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%!test
%! assert (isequal (cancelminus (infsupdec (empty, "trv"), infsupdec (-1.0, inf, "dac")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (cancelminus (infsupdec (empty, "trv"), infsupdec (-1.0, inf, "dac"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%!test
%! assert (isequal (cancelminus (infsupdec (empty, "trv"), infsupdec (entire, "def")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (cancelminus (infsupdec (empty, "trv"), infsupdec (entire, "def"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%!test
%! assert (isequal (cancelminus (infsupdec (-1.0, 5.0, "dac"), infsupdec (-inf, -1.0, "def")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (cancelminus (infsupdec (-1.0, 5.0, "dac"), infsupdec (-inf, -1.0, "def"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%!test
%! assert (isequal (cancelminus (infsupdec (-1.0, 5.0, "def"), infsupdec (-1.0, inf, "trv")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (cancelminus (infsupdec (-1.0, 5.0, "def"), infsupdec (-1.0, inf, "trv"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%!test
%! assert (isequal (cancelminus (infsupdec (-1.0, 5.0, "com"), infsupdec (entire, "def")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (cancelminus (infsupdec (-1.0, 5.0, "com"), infsupdec (entire, "def"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%!test
%! assert (isequal (cancelminus (infsupdec (entire, "def"), infsupdec (-inf, -1.0, "dac")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (cancelminus (infsupdec (entire, "def"), infsupdec (-inf, -1.0, "dac"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%!test
%! assert (isequal (cancelminus (infsupdec (entire, "def"), infsupdec (-1.0, inf, "def")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (cancelminus (infsupdec (entire, "def"), infsupdec (-1.0, inf, "def"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%!test
%! assert (isequal (cancelminus (infsupdec (entire, "def"), infsupdec (entire, "def")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (cancelminus (infsupdec (entire, "def"), infsupdec (entire, "def"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%!test
%! assert (isequal (cancelminus (infsupdec (-5.0, -1.0, "com"), infsupdec (-5.1, -1.0, "trv")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (cancelminus (infsupdec (-5.0, -1.0, "com"), infsupdec (-5.1, -1.0, "trv"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%!test
%! assert (isequal (cancelminus (infsupdec (-5.0, -1.0, "dac"), infsupdec (-5.0, -0.9, "def")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (cancelminus (infsupdec (-5.0, -1.0, "dac"), infsupdec (-5.0, -0.9, "def"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%!test
%! assert (isequal (cancelminus (infsupdec (-5.0, -1.0, "def"), infsupdec (-5.1, -0.9, "dac")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (cancelminus (infsupdec (-5.0, -1.0, "def"), infsupdec (-5.1, -0.9, "dac"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%!test
%! assert (isequal (cancelminus (infsupdec (-10.0, 5.0, "trv"), infsupdec (-10.1, 5.0, "com")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (cancelminus (infsupdec (-10.0, 5.0, "trv"), infsupdec (-10.1, 5.0, "com"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%!test
%! assert (isequal (cancelminus (infsupdec (-10.0, 5.0, "com"), infsupdec (-10.0, 5.1, "com")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (cancelminus (infsupdec (-10.0, 5.0, "com"), infsupdec (-10.0, 5.1, "com"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%!test
%! assert (isequal (cancelminus (infsupdec (-10.0, 5.0, "dac"), infsupdec (-10.1, 5.1, "trv")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (cancelminus (infsupdec (-10.0, 5.0, "dac"), infsupdec (-10.1, 5.1, "trv"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%!test
%! assert (isequal (cancelminus (infsupdec (1.0, 5.0, "def"), infsupdec (0.9, 5.0, "def")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (cancelminus (infsupdec (1.0, 5.0, "def"), infsupdec (0.9, 5.0, "def"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%!test
%! assert (isequal (cancelminus (infsupdec (1.0, 5.0, "trv"), infsupdec (1.0, 5.1, "dac")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (cancelminus (infsupdec (1.0, 5.0, "trv"), infsupdec (1.0, 5.1, "dac"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%!test
%! assert (isequal (cancelminus (infsupdec (1.0, 5.0, "com"), infsupdec (0.9, 5.1, "dac")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (cancelminus (infsupdec (1.0, 5.0, "com"), infsupdec (0.9, 5.1, "dac"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%!test
%! assert (isequal (cancelminus (infsupdec (-10.0, -1.0, "com"), infsupdec (empty, "trv")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (cancelminus (infsupdec (-10.0, -1.0, "com"), infsupdec (empty, "trv"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%!test
%! assert (isequal (cancelminus (infsupdec (-10.0, 5.0, "dac"), infsupdec (empty, "trv")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (cancelminus (infsupdec (-10.0, 5.0, "dac"), infsupdec (empty, "trv"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%!test
%! assert (isequal (cancelminus (infsupdec (1.0, 5.0, "def"), infsupdec (empty, "trv")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (cancelminus (infsupdec (1.0, 5.0, "def"), infsupdec (empty, "trv"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%!test
%! assert (isequal (cancelminus (infsupdec (empty, "trv"), infsupdec (empty, "trv")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (cancelminus (infsupdec (empty, "trv"), infsupdec (empty, "trv"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (cancelminus (infsupdec (empty, "trv"), infsupdec (-10.0, -1.0, "com")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (cancelminus (infsupdec (empty, "trv"), infsupdec (-10.0, -1.0, "com"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (cancelminus (infsupdec (empty, "trv"), infsupdec (-10.0, 5.0, "dac")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (cancelminus (infsupdec (empty, "trv"), infsupdec (-10.0, 5.0, "dac"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (cancelminus (infsupdec (empty, "trv"), infsupdec (1.0, 5.0, "def")), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (cancelminus (infsupdec (empty, "trv"), infsupdec (1.0, 5.0, "def"))){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (cancelminus (infsupdec (-5.1, -0.0, "com"), infsupdec (-5.0, 0.0, "com")), infsupdec (-9.999999999999964473e-02, 0.0, "trv")));
%! assert (isequal (decorationpart (cancelminus (infsupdec (-5.1, -0.0, "com"), infsupdec (-5.0, 0.0, "com"))){1}, decorationpart (infsupdec (-9.999999999999964473e-02, 0.0, "trv")){1}));
%!test
%! assert (isequal (cancelminus (infsupdec (-5.1, -1.0, "dac"), infsupdec (-5.0, -1.0, "com")), infsupdec (-9.999999999999964473e-02, 0.0, "trv")));
%! assert (isequal (decorationpart (cancelminus (infsupdec (-5.1, -1.0, "dac"), infsupdec (-5.0, -1.0, "com"))){1}, decorationpart (infsupdec (-9.999999999999964473e-02, 0.0, "trv")){1}));
%!test
%! assert (isequal (cancelminus (infsupdec (-5.0, -0.9, "def"), infsupdec (-5.0, -1.0, "com")), infsupdec (0.0, 9.999999999999997780e-02, "trv")));
%! assert (isequal (decorationpart (cancelminus (infsupdec (-5.0, -0.9, "def"), infsupdec (-5.0, -1.0, "com"))){1}, decorationpart (infsupdec (0.0, 9.999999999999997780e-02, "trv")){1}));
%!test
%! assert (isequal (cancelminus (infsupdec (-5.1, -0.9, "trv"), infsupdec (-5.0, -1.0, "com")), infsupdec (-9.999999999999964473e-02, 9.999999999999997780e-02, "trv")));
%! assert (isequal (decorationpart (cancelminus (infsupdec (-5.1, -0.9, "trv"), infsupdec (-5.0, -1.0, "com"))){1}, decorationpart (infsupdec (-9.999999999999964473e-02, 9.999999999999997780e-02, "trv")){1}));
%!test
%! assert (isequal (cancelminus (infsupdec (-5.0, -1.0, "com"), infsupdec (-5.0, -1.0, "dac")), infsupdec (0.0, 0.0, "trv")));
%! assert (isequal (decorationpart (cancelminus (infsupdec (-5.0, -1.0, "com"), infsupdec (-5.0, -1.0, "dac"))){1}, decorationpart (infsupdec (0.0, 0.0, "trv")){1}));
%!test
%! assert (isequal (cancelminus (infsupdec (-10.1, 5.0, "dac"), infsupdec (-10.0, 5.0, "dac")), infsupdec (-9.999999999999964473e-02, 0.0, "trv")));
%! assert (isequal (decorationpart (cancelminus (infsupdec (-10.1, 5.0, "dac"), infsupdec (-10.0, 5.0, "dac"))){1}, decorationpart (infsupdec (-9.999999999999964473e-02, 0.0, "trv")){1}));
%!test
%! assert (isequal (cancelminus (infsupdec (-10.0, 5.1, "def"), infsupdec (-10.0, 5.0, "dac")), infsupdec (0.0, 9.999999999999964473e-02, "trv")));
%! assert (isequal (decorationpart (cancelminus (infsupdec (-10.0, 5.1, "def"), infsupdec (-10.0, 5.0, "dac"))){1}, decorationpart (infsupdec (0.0, 9.999999999999964473e-02, "trv")){1}));
%!test
%! assert (isequal (cancelminus (infsupdec (-10.1, 5.1, "trv"), infsupdec (-10.0, 5.0, "def")), infsupdec (-9.999999999999964473e-02, 9.999999999999964473e-02, "trv")));
%! assert (isequal (decorationpart (cancelminus (infsupdec (-10.1, 5.1, "trv"), infsupdec (-10.0, 5.0, "def"))){1}, decorationpart (infsupdec (-9.999999999999964473e-02, 9.999999999999964473e-02, "trv")){1}));
%!test
%! assert (isequal (cancelminus (infsupdec (-10.0, 5.0, "com"), infsupdec (-10.0, 5.0, "def")), infsupdec (0.0, 0.0, "trv")));
%! assert (isequal (decorationpart (cancelminus (infsupdec (-10.0, 5.0, "com"), infsupdec (-10.0, 5.0, "def"))){1}, decorationpart (infsupdec (0.0, 0.0, "trv")){1}));
%!test
%! assert (isequal (cancelminus (infsupdec (0.9, 5.0, "dac"), infsupdec (1.0, 5.0, "def")), infsupdec (-9.999999999999997780e-02, 0.0, "trv")));
%! assert (isequal (decorationpart (cancelminus (infsupdec (0.9, 5.0, "dac"), infsupdec (1.0, 5.0, "def"))){1}, decorationpart (infsupdec (-9.999999999999997780e-02, 0.0, "trv")){1}));
%!test
%! assert (isequal (cancelminus (infsupdec (-0.0, 5.1, "def"), infsupdec (0.0, 5.0, "def")), infsupdec (0.0, 9.999999999999964473e-02, "trv")));
%! assert (isequal (decorationpart (cancelminus (infsupdec (-0.0, 5.1, "def"), infsupdec (0.0, 5.0, "def"))){1}, decorationpart (infsupdec (0.0, 9.999999999999964473e-02, "trv")){1}));
%!test
%! assert (isequal (cancelminus (infsupdec (1.0, 5.1, "trv"), infsupdec (1.0, 5.0, "trv")), infsupdec (0.0, 9.999999999999964473e-02, "trv")));
%! assert (isequal (decorationpart (cancelminus (infsupdec (1.0, 5.1, "trv"), infsupdec (1.0, 5.0, "trv"))){1}, decorationpart (infsupdec (0.0, 9.999999999999964473e-02, "trv")){1}));
%!test
%! assert (isequal (cancelminus (infsupdec (0.9, 5.1, "com"), infsupdec (1.0, 5.0, "trv")), infsupdec (-9.999999999999997780e-02, 9.999999999999964473e-02, "trv")));
%! assert (isequal (decorationpart (cancelminus (infsupdec (0.9, 5.1, "com"), infsupdec (1.0, 5.0, "trv"))){1}, decorationpart (infsupdec (-9.999999999999997780e-02, 9.999999999999964473e-02, "trv")){1}));
%!test
%! assert (isequal (cancelminus (infsupdec (1.0, 5.0, "dac"), infsupdec (1.0, 5.0, "com")), infsupdec (0.0, 0.0, "trv")));
%! assert (isequal (decorationpart (cancelminus (infsupdec (1.0, 5.0, "dac"), infsupdec (1.0, 5.0, "com"))){1}, decorationpart (infsupdec (0.0, 0.0, "trv")){1}));
%!test
%! assert (isequal (cancelminus (infsupdec (-5.0, 1.0, "def"), infsupdec (-1.0, 5.0, "def")), infsupdec (-4.0, -4.0, "trv")));
%! assert (isequal (decorationpart (cancelminus (infsupdec (-5.0, 1.0, "def"), infsupdec (-1.0, 5.0, "def"))){1}, decorationpart (infsupdec (-4.0, -4.0, "trv")){1}));
%!test
%! assert (isequal (cancelminus (infsupdec (-5.0, 0.0, "trv"), infsupdec (-0.0, 5.0, "trv")), infsupdec (-5.0, -5.0, "trv")));
%! assert (isequal (decorationpart (cancelminus (infsupdec (-5.0, 0.0, "trv"), infsupdec (-0.0, 5.0, "trv"))){1}, decorationpart (infsupdec (-5.0, -5.0, "trv")){1}));
%!test
%! assert (isequal (cancelminus (infsupdec (1.999999999999996447e+00, 1.999999999999996447e+00, "com"), infsupdec (1.000000000000000056e-01, 1.000000000000000056e-01, "com")), infsupdec (1.899999999999996358e+00, 1.899999999999996581e+00, "trv")));
%! assert (isequal (decorationpart (cancelminus (infsupdec (1.999999999999996447e+00, 1.999999999999996447e+00, "com"), infsupdec (1.000000000000000056e-01, 1.000000000000000056e-01, "com"))){1}, decorationpart (infsupdec (1.899999999999996358e+00, 1.899999999999996581e+00, "trv")){1}));
%!test
%! assert (isequal (cancelminus (infsupdec (-1.000000000000000056e-01, 1.999999999999996447e+00, "def"), infsupdec (-0.01, 1.000000000000000056e-01, "dac")), infsupdec (-9.000000000000001055e-02, 1.899999999999996581e+00, "trv")));
%! assert (isequal (decorationpart (cancelminus (infsupdec (-1.000000000000000056e-01, 1.999999999999996447e+00, "def"), infsupdec (-0.01, 1.000000000000000056e-01, "dac"))){1}, decorationpart (infsupdec (-9.000000000000001055e-02, 1.899999999999996581e+00, "trv")){1}));
%!test
%! assert (isequal (cancelminus (infsupdec (1.797693134862315708e+308, 1.797693134862315708e+308, "com"), infsupdec (-1.797693134862315708e+308, -1.797693134862315708e+308, "com")), infsupdec (1.797693134862315708e+308, inf, "trv")));
%! assert (isequal (decorationpart (cancelminus (infsupdec (1.797693134862315708e+308, 1.797693134862315708e+308, "com"), infsupdec (-1.797693134862315708e+308, -1.797693134862315708e+308, "com"))){1}, decorationpart (infsupdec (1.797693134862315708e+308, inf, "trv")){1}));
%!test
%! assert (isequal (cancelminus (infsupdec (-1.797693134862315708e+308, 1.797693134862315708e+308, "com"), infsupdec (-1.797693134862315708e+308, 1.797693134862315708e+308, "com")), infsupdec (0.0, 0.0, "trv")));
%! assert (isequal (decorationpart (cancelminus (infsupdec (-1.797693134862315708e+308, 1.797693134862315708e+308, "com"), infsupdec (-1.797693134862315708e+308, 1.797693134862315708e+308, "com"))){1}, decorationpart (infsupdec (0.0, 0.0, "trv")){1}));
%!test
%! assert (isequal (cancelminus (infsupdec (-1.797693134862315708e+308, 1.797693134862315708e+308, "com"), infsupdec (-1.797693134862315708e+308, 1.797693134862315509e+308, "com")), infsupdec (0.0, 1.995840309534719812e+292, "trv")));
%! assert (isequal (decorationpart (cancelminus (infsupdec (-1.797693134862315708e+308, 1.797693134862315708e+308, "com"), infsupdec (-1.797693134862315708e+308, 1.797693134862315509e+308, "com"))){1}, decorationpart (infsupdec (0.0, 1.995840309534719812e+292, "trv")){1}));
%!test
%! assert (isequal (cancelminus (infsupdec (-1.797693134862315708e+308, 1.797693134862315708e+308, "com"), infsupdec (-1.797693134862315509e+308, 1.797693134862315708e+308, "com")), infsupdec (-1.995840309534719812e+292, 0.0, "trv")));
%! assert (isequal (decorationpart (cancelminus (infsupdec (-1.797693134862315708e+308, 1.797693134862315708e+308, "com"), infsupdec (-1.797693134862315509e+308, 1.797693134862315708e+308, "com"))){1}, decorationpart (infsupdec (-1.995840309534719812e+292, 0.0, "trv")){1}));
%!test
%! assert (isequal (cancelminus (infsupdec (-1.797693134862315708e+308, 1.797693134862315509e+308, "com"), infsupdec (-1.797693134862315708e+308, 1.797693134862315708e+308, "com")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (cancelminus (infsupdec (-1.797693134862315708e+308, 1.797693134862315509e+308, "com"), infsupdec (-1.797693134862315708e+308, 1.797693134862315708e+308, "com"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%!test
%! assert (isequal (cancelminus (infsupdec (-1.797693134862315509e+308, 1.797693134862315708e+308, "com"), infsupdec (-1.797693134862315708e+308, 1.797693134862315708e+308, "com")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (cancelminus (infsupdec (-1.797693134862315509e+308, 1.797693134862315708e+308, "com"), infsupdec (-1.797693134862315708e+308, 1.797693134862315708e+308, "com"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%!test
%! assert (isequal (cancelminus (infsupdec (4.940656458412465442e-324, 4.940656458412465442e-324, "com"), infsupdec (4.940656458412465442e-324, 4.940656458412465442e-324, "com")), infsupdec (0.0, 0.0, "trv")));
%! assert (isequal (decorationpart (cancelminus (infsupdec (4.940656458412465442e-324, 4.940656458412465442e-324, "com"), infsupdec (4.940656458412465442e-324, 4.940656458412465442e-324, "com"))){1}, decorationpart (infsupdec (0.0, 0.0, "trv")){1}));
%!test
%! assert (isequal (cancelminus (infsupdec (4.940656458412465442e-324, 4.940656458412465442e-324, "com"), infsupdec (-4.940656458412465442e-324, -4.940656458412465442e-324, "dac")), infsupdec (9.881312916824930884e-324, 9.881312916824930884e-324, "trv")));
%! assert (isequal (decorationpart (cancelminus (infsupdec (4.940656458412465442e-324, 4.940656458412465442e-324, "com"), infsupdec (-4.940656458412465442e-324, -4.940656458412465442e-324, "dac"))){1}, decorationpart (infsupdec (9.881312916824930884e-324, 9.881312916824930884e-324, "trv")){1}));
%!test
%! assert (isequal (cancelminus (infsupdec (2.225073858507201383e-308, 2.225073858507202371e-308, "dac"), infsupdec (2.225073858507201383e-308, 2.225073858507201877e-308, "dac")), infsupdec (0.0, 4.940656458412465442e-324, "trv")));
%! assert (isequal (decorationpart (cancelminus (infsupdec (2.225073858507201383e-308, 2.225073858507202371e-308, "dac"), infsupdec (2.225073858507201383e-308, 2.225073858507201877e-308, "dac"))){1}, decorationpart (infsupdec (0.0, 4.940656458412465442e-324, "trv")){1}));
%!test
%! assert (isequal (cancelminus (infsupdec (2.225073858507201383e-308, 2.225073858507201877e-308, "def"), infsupdec (2.225073858507201383e-308, 2.225073858507202371e-308, "com")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (cancelminus (infsupdec (2.225073858507201383e-308, 2.225073858507201877e-308, "def"), infsupdec (2.225073858507201383e-308, 2.225073858507202371e-308, "com"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
%!test
%! assert (isequal (cancelminus (infsupdec (-1.000000000000000000e+00, 2.220446049250312834e-16, "com"), infsupdec (-2.220446049250312588e-16, 1.000000000000000000e+00, "dac")), infsupdec (-9.999999999999998890e-01, -9.999999999999997780e-01, "trv")));
%! assert (isequal (decorationpart (cancelminus (infsupdec (-1.000000000000000000e+00, 2.220446049250312834e-16, "com"), infsupdec (-2.220446049250312588e-16, 1.000000000000000000e+00, "dac"))){1}, decorationpart (infsupdec (-9.999999999999998890e-01, -9.999999999999997780e-01, "trv")){1}));
%!test
%! assert (isequal (cancelminus (infsupdec (-1.000000000000000000e+00, 2.220446049250312588e-16, "def"), infsupdec (-2.220446049250312834e-16, 1.000000000000000000e+00, "dac")), infsupdec (entire, "trv")));
%! assert (isequal (decorationpart (cancelminus (infsupdec (-1.000000000000000000e+00, 2.220446049250312588e-16, "def"), infsupdec (-2.220446049250312834e-16, 1.000000000000000000e+00, "dac"))){1}, decorationpart (infsupdec (entire, "trv")){1}));
