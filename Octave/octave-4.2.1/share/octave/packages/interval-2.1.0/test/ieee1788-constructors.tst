## DO NOT EDIT!  Generated automatically from test/ieee1788-constructors.itl
## by the Interval Testing Framework for IEEE 1788.
## https://github.com/nehmeier/ITF1788/tree/92558f7e942665a78f2e883dbe7af52320100fba
##
## 
## Test Cases for interval constructors from IEEE Std 1788-2015
## 
## Copyright 2016 Oliver Heimlich
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

## IEEE1788.a
%!# According to the examples in Section 7.4.2, unbounded intervals can be constructed with non-common inputs.
%!test
%! assert (isequal (infsup (-inf, inf), infsup (-inf, inf)));

## IEEE1788.b
%!# Examples from Sections 9.7.1 and 9.8
%!test
%! assert (isequal (infsup ("[1.2345]"), infsup (1.234499999999999931e+00, 1.234500000000000153e+00)));
%!test
%! assert (isequal (infsup ("[1,+infinity]"), infsup (1.0, inf)));
%!test
%! assert (isequal (infsupdec ("[1,1e3]_com"), infsupdec (1.0, 1000.0, "com")));
%! assert (isequal (decorationpart (infsupdec ("[1,1e3]_com")){1}, decorationpart (infsupdec (1.0, 1000.0, "com")){1}));
%!test
%! assert (isequal (infsupdec ("[1,1E3]_COM"), infsupdec (1.0, 1000.0, "com")));
%! assert (isequal (decorationpart (infsupdec ("[1,1E3]_COM")){1}, decorationpart (infsupdec (1.0, 1000.0, "com")){1}));

## IEEE1788.c
%!# Examples from Table 9.4
%!test
%! assert (isequal (infsup ("[1.e-3, 1.1e-3]"), infsup (9.999999999999998040e-04, 1.100000000000000066e-03)));
%!test
%! assert (isequal (infsup ("[-0x1.3p-1, 2/3]"), infsup (-5.937500000000000000e-01, 6.666666666666667407e-01)));
%!test
%! assert (isequal (infsup ("[3.56]"), infsup (3.559999999999999609e+00, 3.560000000000000053e+00)));
%!test
%! assert (isequal (infsup ("3.56?1"), infsup (3.549999999999999822e+00, 3.570000000000000284e+00)));
%!test
%! assert (isequal (infsup ("3.56?1e2"), infsup (355.0, 357.0)));
%!test
%! assert (isequal (infsup ("3.560?2"), infsup (3.557999999999999829e+00, 3.562000000000000277e+00)));
%!test
%! assert (isequal (infsup ("3.56?"), infsup (3.554999999999999716e+00, 3.565000000000000391e+00)));
%!test
%! assert (isequal (infsup ("3.560?2u"), infsup (3.559999999999999609e+00, 3.562000000000000277e+00)));
%!test
%! assert (isequal (infsup ("-10?"), infsup (-10.5, -9.5)));
%!test
%! assert (isequal (infsup ("-10?u"), infsup (-10.0, -9.5)));
%!test
%! assert (isequal (infsup ("-10?12"), infsup (-22.0, 2.0)));

## IEEE1788.d
%!# Examples from Section 10.5.1
%!test
%! assert (isequal (infsup ("[1.234e5,Inf]"), infsup (123400.0, inf)));
%!test
%! assert (isequal (infsup ("3.1416?1"), infsup (3.141499999999999737e+00, 3.141700000000000159e+00)));
%!test
%! assert (isequal (infsup ("[Empty]"), infsup));

## IEEE1788.e
%!# Example from Section 11.3
%!test
%! assert (isequal (infsupdec (2, 1), nai));

## IEEE1788.e
%!# Examples from Table 12.1
%!test
%! assert (isequal (infsupdec ("[ ]"), infsupdec (empty, "trv")));
%! assert (isequal (decorationpart (infsupdec ("[ ]")){1}, decorationpart (infsupdec (empty, "trv")){1}));
%!test
%! assert (isequal (infsupdec ("[entire]"), infsupdec (-inf, inf, "dac")));
%! assert (isequal (decorationpart (infsupdec ("[entire]")){1}, decorationpart (infsupdec (-inf, inf, "dac")){1}));
%!test
%! assert (isequal (infsupdec ("[1.e-3, 1.1e-3]"), infsupdec (9.999999999999998040e-04, 1.100000000000000066e-03, "com")));
%! assert (isequal (decorationpart (infsupdec ("[1.e-3, 1.1e-3]")){1}, decorationpart (infsupdec (9.999999999999998040e-04, 1.100000000000000066e-03, "com")){1}));
%!test
%! assert (isequal (infsupdec ("[-Inf, 2/3]"), infsupdec (-inf, 6.666666666666667407e-01, "dac")));
%! assert (isequal (decorationpart (infsupdec ("[-Inf, 2/3]")){1}, decorationpart (infsupdec (-inf, 6.666666666666667407e-01, "dac")){1}));
%!test
%! assert (isequal (infsupdec ("[0x1.3p-1,]"), infsupdec (5.937500000000000000e-01, inf, "dac")));
%! assert (isequal (decorationpart (infsupdec ("[0x1.3p-1,]")){1}, decorationpart (infsupdec (5.937500000000000000e-01, inf, "dac")){1}));
%!test
%! assert (isequal (infsupdec ("[,]"), infsupdec (entire, "dac")));
%! assert (isequal (decorationpart (infsupdec ("[,]")){1}, decorationpart (infsupdec (entire, "dac")){1}));
%!test
%! assert (isequal (infsupdec ("3.56?1"), infsupdec (3.549999999999999822e+00, 3.570000000000000284e+00, "com")));
%! assert (isequal (decorationpart (infsupdec ("3.56?1")){1}, decorationpart (infsupdec (3.549999999999999822e+00, 3.570000000000000284e+00, "com")){1}));
%!test
%! assert (isequal (infsupdec ("3.56?1e2"), infsupdec (355.0, 357.0, "com")));
%! assert (isequal (decorationpart (infsupdec ("3.56?1e2")){1}, decorationpart (infsupdec (355.0, 357.0, "com")){1}));
%!test
%! assert (isequal (infsupdec ("3.560?2"), infsupdec (3.557999999999999829e+00, 3.562000000000000277e+00, "com")));
%! assert (isequal (decorationpart (infsupdec ("3.560?2")){1}, decorationpart (infsupdec (3.557999999999999829e+00, 3.562000000000000277e+00, "com")){1}));
%!test
%! assert (isequal (infsupdec ("3.56?"), infsupdec (3.554999999999999716e+00, 3.565000000000000391e+00, "com")));
%! assert (isequal (decorationpart (infsupdec ("3.56?")){1}, decorationpart (infsupdec (3.554999999999999716e+00, 3.565000000000000391e+00, "com")){1}));
%!test
%! assert (isequal (infsupdec ("3.560?2u"), infsupdec (3.559999999999999609e+00, 3.562000000000000277e+00, "com")));
%! assert (isequal (decorationpart (infsupdec ("3.560?2u")){1}, decorationpart (infsupdec (3.559999999999999609e+00, 3.562000000000000277e+00, "com")){1}));
%!test
%! assert (isequal (infsupdec ("-10?"), infsupdec (-10.5, -9.5, "com")));
%! assert (isequal (decorationpart (infsupdec ("-10?")){1}, decorationpart (infsupdec (-10.5, -9.5, "com")){1}));
%!test
%! assert (isequal (infsupdec ("-10?u"), infsupdec (-10.0, -9.5, "com")));
%! assert (isequal (decorationpart (infsupdec ("-10?u")){1}, decorationpart (infsupdec (-10.0, -9.5, "com")){1}));
%!test
%! assert (isequal (infsupdec ("-10?12"), infsupdec (-22.0, 2.0, "com")));
%! assert (isequal (decorationpart (infsupdec ("-10?12")){1}, decorationpart (infsupdec (-22.0, 2.0, "com")){1}));
%!test
%! assert (isequal (infsupdec ("-10??u"), infsupdec (-10.0, inf, "dac")));
%! assert (isequal (decorationpart (infsupdec ("-10??u")){1}, decorationpart (infsupdec (-10.0, inf, "dac")){1}));
%!test
%! assert (isequal (infsupdec ("-10??"), infsupdec (-inf, inf, "dac")));
%! assert (isequal (decorationpart (infsupdec ("-10??")){1}, decorationpart (infsupdec (-inf, inf, "dac")){1}));
%!test
%! assert (isequal (infsupdec ("[nai]"), nai));
%!test
%! assert (isequal (infsupdec ("3.56?1_def"), infsupdec (3.549999999999999822e+00, 3.570000000000000284e+00, "def")));
%! assert (isequal (decorationpart (infsupdec ("3.56?1_def")){1}, decorationpart (infsupdec (3.549999999999999822e+00, 3.570000000000000284e+00, "def")){1}));

## IEEE1788.f
%!# Examples from Section 12.11.3
%!test
%! assert (isequal (infsup ("[]"), infsup));
%!test
%! assert (isequal (infsup ("[empty]"), infsup));
%!test
%! assert (isequal (infsup ("[ empty ]"), infsup));
%!test
%! assert (isequal (infsup ("[,]"), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup ("[ entire ]"), infsup (-inf, inf)));
