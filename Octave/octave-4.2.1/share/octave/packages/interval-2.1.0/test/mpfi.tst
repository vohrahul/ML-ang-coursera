## DO NOT EDIT!  Generated automatically from test/mpfi.itl
## by the Interval Testing Framework for IEEE 1788.
## https://github.com/nehmeier/ITF1788/tree/92558f7e942665a78f2e883dbe7af52320100fba
##
## Copyright 2009–2012 Spaces project, Inria Lorraine
##                     and Salsa project, INRIA Rocquencourt,
##                     and Arenaire project, Inria Rhone-Alpes, France
##                     and Lab. ANO, USTL (Univ. of Lille),  France
## Copyright 2015-2016 Oliver Heimlich
## 
## Original authors: Philippe Theveny (Philippe.Theveny@ens-lyon.fr)
##                   and Nathalie Revol (Nathalie.Revol@ens-lyon.fr)
##                   (unit tests in GNU MPFI, original license: LGPLv2.1+)
## Converted into portable ITL format by Oliver Heimlich.
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

## mpfi_abs

%!# special values
%!test
%! assert (isequal (abs (infsup (-inf, -7.0)), infsup (+7.0, inf)));
%!test
%! assert (isequal (abs (infsup (-inf, 0.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (abs (infsup (-inf, 0.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (abs (infsup (-inf, +8.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (abs (infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (abs (infsup (0.0, 0.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (abs (infsup (0.0, +8.0)), infsup (0.0, +8.0)));
%!test
%! assert (isequal (abs (infsup (0.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (abs (infsup (0.0, +8.0)), infsup (0.0, +8.0)));
%!test
%! assert (isequal (abs (infsup (0.0, inf)), infsup (0.0, inf)));
%!# regular values
%!test
%! assert (isequal (abs (infsup (7.456540443420410156e+04, 7.456540467834472656e+04)), infsup (7.456540443420410156e+04, 7.456540467834472656e+04)));
%!test
%! assert (isequal (abs (infsup (-7.456540443420410156e+04, 7.456540467834472656e+04)), infsup (0.0, 7.456540467834472656e+04)));

## mpfi_acos

%!# special values
%!test
%! assert (isequal (acos (infsup (-1.0, 0.0)), infsup (1.570796326794896558e+00, 3.141592653589793560e+00)));
%!test
%! assert (isequal (acos (infsup (0.0, 0.0)), infsup (1.570796326794896558e+00, 1.570796326794896780e+00)));
%!test
%! assert (isequal (acos (infsup (0.0, +1.0)), infsup (0.0, 1.570796326794896780e+00)));
%!# regular values
%!test
%! assert (isequal (acos (infsup (-1.0, -0.5)), infsup (2.094395102393195263e+00, 3.141592653589793560e+00)));
%!test
%! assert (isequal (acos (infsup (-0.75, -0.25)), infsup (1.823476581936975149e+00, 2.418858405776378007e+00)));
%!test
%! assert (isequal (acos (infsup (-0.5, 0.5)), infsup (1.047197551196597631e+00, 2.094395102393195707e+00)));
%!test
%! assert (isequal (acos (infsup (0.25, 0.625)), infsup (8.956647938578649049e-01, 1.318116071652817967e+00)));
%!test
%! assert (isequal (acos (infsup (-1.0, 1.0)), infsup (0.0, 3.141592653589793560e+00)));

## mpfi_acosh

%!# special values
%!test
%! assert (isequal (acosh (infsup (+1.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (acosh (infsup (+1.5, inf)), infsup (9.624236501192068305e-01, inf)));
%!# regular values
%!test
%! assert (isequal (acosh (infsup (1.0, 1.5)), infsup (0.0, 9.624236501192069415e-01)));
%!test
%! assert (isequal (acosh (infsup (1.5, 1.5)), infsup (9.624236501192068305e-01, 9.624236501192069415e-01)));
%!test
%! assert (isequal (acosh (infsup (2.0, 1000.0)), infsup (1.316957896924816573e+00, 7.600902209541988697e+00)));

## mpfi_add

%!# special values
%!test
%! assert (isequal (infsup (-inf, -7.0) + infsup (-1.0, +8.0), infsup (-inf, +1.0)));
%! assert (isequal (plus (infsup (-inf, -7.0), infsup (-1.0, +8.0)), infsup (-inf, +1.0)));
%!test
%! assert (isequal (infsup (-inf, 0.0) + infsup (+8.0, inf), infsup (-inf, inf)));
%! assert (isequal (plus (infsup (-inf, 0.0), infsup (+8.0, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-inf, +8.0) + infsup (0.0, +8.0), infsup (-inf, +16.0)));
%! assert (isequal (plus (infsup (-inf, +8.0), infsup (0.0, +8.0)), infsup (-inf, +16.0)));
%!test
%! assert (isequal (infsup (-inf, inf) + infsup (0.0, +8.0), infsup (-inf, inf)));
%! assert (isequal (plus (infsup (-inf, inf), infsup (0.0, +8.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (0.0, 0.0) + infsup (-inf, -7.0), infsup (-inf, -7.0)));
%! assert (isequal (plus (infsup (0.0, 0.0), infsup (-inf, -7.0)), infsup (-inf, -7.0)));
%!test
%! assert (isequal (infsup (0.0, +8.0) + infsup (-7.0, 0.0), infsup (-7.0, +8.0)));
%! assert (isequal (plus (infsup (0.0, +8.0), infsup (-7.0, 0.0)), infsup (-7.0, +8.0)));
%!test
%! assert (isequal (infsup (0.0, 0.0) + infsup (0.0, +8.0), infsup (0.0, +8.0)));
%! assert (isequal (plus (infsup (0.0, 0.0), infsup (0.0, +8.0)), infsup (0.0, +8.0)));
%!test
%! assert (isequal (infsup (0.0, inf) + infsup (0.0, +8.0), infsup (0.0, inf)));
%! assert (isequal (plus (infsup (0.0, inf), infsup (0.0, +8.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (infsup (0.0, 0.0) + infsup (+8.0, inf), infsup (+8.0, inf)));
%! assert (isequal (plus (infsup (0.0, 0.0), infsup (+8.0, inf)), infsup (+8.0, inf)));
%!test
%! assert (isequal (infsup (0.0, 0.0) + infsup (-inf, inf), infsup (-inf, inf)));
%! assert (isequal (plus (infsup (0.0, 0.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (0.0, +8.0) + infsup (0.0, +8.0), infsup (0.0, +16.0)));
%! assert (isequal (plus (infsup (0.0, +8.0), infsup (0.0, +8.0)), infsup (0.0, +16.0)));
%!test
%! assert (isequal (infsup (0.0, 0.0) + infsup (0.0, 0.0), infsup (0.0, 0.0)));
%! assert (isequal (plus (infsup (0.0, 0.0), infsup (0.0, 0.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (infsup (0.0, inf) + infsup (-7.0, +8.0), infsup (-7.0, inf)));
%! assert (isequal (plus (infsup (0.0, inf), infsup (-7.0, +8.0)), infsup (-7.0, inf)));
%!# regular values
%!test
%! assert (isequal (infsup (-0.375, -5.693566843317114508e-73) + infsup (-0.125, 5.659799424266695230e-73), infsup (-5.000000000000000000e-01, -3.376741905041927849e-75)));
%! assert (isequal (plus (infsup (-0.375, -5.693566843317114508e-73), infsup (-0.125, 5.659799424266695230e-73)), infsup (-5.000000000000000000e-01, -3.376741905041927849e-75)));
%!test
%! assert (isequal (infsup (-4.909093465297726553e-91, 3.202558470389760000e+14) + infsup (-4.547473508864641190e-13, 1.264629250000000000e+08), infsup (-4.547473508864642199e-13, 3.202559735019010000e+14)));
%! assert (isequal (plus (infsup (-4.909093465297726553e-91, 3.202558470389760000e+14), infsup (-4.547473508864641190e-13, 1.264629250000000000e+08)), infsup (-4.547473508864642199e-13, 3.202559735019010000e+14)));
%!test
%! assert (isequal (infsup (-4.0, +7.0) + infsup (-2.443359172835548401e+09, 3e300), infsup (-2.443359176835548401e+09, 3.000000000000000752e+300)));
%! assert (isequal (plus (infsup (-4.0, +7.0), infsup (-2.443359172835548401e+09, 3e300)), infsup (-2.443359176835548401e+09, 3.000000000000000752e+300)));
%!test
%! assert (isequal (infsup (7.205869356633318400e+16, 1.152921504606846976e+18) + infsup (2.814792717434890000e+14, 3.0e300), infsup (7.234017283807667200e+16, 3.000000000000000752e+300)));
%! assert (isequal (plus (infsup (7.205869356633318400e+16, 1.152921504606846976e+18), infsup (2.814792717434890000e+14, 3.0e300)), infsup (7.234017283807667200e+16, 3.000000000000000752e+300)));
%!# signed zeros
%!test
%! assert (isequal (infsup (+4.0, +8.0) + infsup (-4.0, -2.0), infsup (0.0, +6.0)));
%! assert (isequal (plus (infsup (+4.0, +8.0), infsup (-4.0, -2.0)), infsup (0.0, +6.0)));
%!test
%! assert (isequal (infsup (+4.0, +8.0) + infsup (-9.0, -8.0), infsup (-5.0, 0.0)));
%! assert (isequal (plus (infsup (+4.0, +8.0), infsup (-9.0, -8.0)), infsup (-5.0, 0.0)));

## mpfi_add_d

%!# special values
%!test
%! assert (isequal (infsup (-inf, -7.0) + infsup (-4.000000000000000286e-17, -4.000000000000000286e-17), infsup (-inf, -7.0)));
%! assert (isequal (plus (infsup (-inf, -7.0), infsup (-4.000000000000000286e-17, -4.000000000000000286e-17)), infsup (-inf, -7.0)));
%!test
%! assert (isequal (infsup (-inf, -7.0) + infsup (0.0, 0.0), infsup (-inf, -7.0)));
%! assert (isequal (plus (infsup (-inf, -7.0), infsup (0.0, 0.0)), infsup (-inf, -7.0)));
%!test
%! assert (isequal (infsup (-inf, -7.0) + infsup (4.000000000000000286e-17, 4.000000000000000286e-17), infsup (-inf, -6.999999999999999112e+00)));
%! assert (isequal (plus (infsup (-inf, -7.0), infsup (4.000000000000000286e-17, 4.000000000000000286e-17)), infsup (-inf, -6.999999999999999112e+00)));
%!test
%! assert (isequal (infsup (-inf, 0.0) + infsup (-8.000000000000000572e-17, -8.000000000000000572e-17), infsup (-inf, -8.0e-17)));
%! assert (isequal (plus (infsup (-inf, 0.0), infsup (-8.000000000000000572e-17, -8.000000000000000572e-17)), infsup (-inf, -8.0e-17)));
%!test
%! assert (isequal (infsup (-inf, 0.0) + infsup (0.0, 0.0), infsup (-inf, 0.0)));
%! assert (isequal (plus (infsup (-inf, 0.0), infsup (0.0, 0.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (infsup (-inf, 0.0) + infsup (8.000000000000000572e-17, 8.000000000000000572e-17), infsup (-inf, 8.000000000000000572e-17)));
%! assert (isequal (plus (infsup (-inf, 0.0), infsup (8.000000000000000572e-17, 8.000000000000000572e-17)), infsup (-inf, 8.000000000000000572e-17)));
%!test
%! assert (isequal (infsup (-inf, 8.0) + infsup (-1.600000000000000000e+18, -1.600000000000000000e+18), infsup (-inf, -1.599999999999999744e+18)));
%! assert (isequal (plus (infsup (-inf, 8.0), infsup (-1.600000000000000000e+18, -1.600000000000000000e+18)), infsup (-inf, -1.599999999999999744e+18)));
%!test
%! assert (isequal (infsup (-inf, 8.0) + infsup (0.0, 0.0), infsup (-inf, 8.0)));
%! assert (isequal (plus (infsup (-inf, 8.0), infsup (0.0, 0.0)), infsup (-inf, 8.0)));
%!test
%! assert (isequal (infsup (-inf, 8.0) + infsup (1.600000000000000000e+18, 1.600000000000000000e+18), infsup (-inf, 1.600000000000000256e+18)));
%! assert (isequal (plus (infsup (-inf, 8.0), infsup (1.600000000000000000e+18, 1.600000000000000000e+18)), infsup (-inf, 1.600000000000000256e+18)));
%!test
%! assert (isequal (infsup (-inf, inf) + infsup (-1.600000000000000114e-16, -1.600000000000000114e-16), infsup (-inf, inf)));
%! assert (isequal (plus (infsup (-inf, inf), infsup (-1.600000000000000114e-16, -1.600000000000000114e-16)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-inf, inf) + infsup (0.0e-17, 0.0e-17), infsup (-inf, inf)));
%! assert (isequal (plus (infsup (-inf, inf), infsup (0.0e-17, 0.0e-17)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-inf, inf) + infsup (1.600000000000000114e-16, 1.600000000000000114e-16), infsup (-inf, inf)));
%! assert (isequal (plus (infsup (-inf, inf), infsup (1.600000000000000114e-16, 1.600000000000000114e-16)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (0.0, 0.0) + infsup (-1.000000000000000072e-17, -1.000000000000000072e-17), infsup (-1.000000000000000072e-17, -1.000000000000000072e-17)));
%! assert (isequal (plus (infsup (0.0, 0.0), infsup (-1.000000000000000072e-17, -1.000000000000000072e-17)), infsup (-1.000000000000000072e-17, -1.000000000000000072e-17)));
%!test
%! assert (isequal (infsup (0.0, 0.0) + infsup (0.0, 0.0), infsup (0.0, 0.0)));
%! assert (isequal (plus (infsup (0.0, 0.0), infsup (0.0, 0.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (infsup (0.0, 0.0) + infsup (1.000000000000000072e-17, 1.000000000000000072e-17), infsup (1.000000000000000072e-17, 1.000000000000000072e-17)));
%! assert (isequal (plus (infsup (0.0, 0.0), infsup (1.000000000000000072e-17, 1.000000000000000072e-17)), infsup (1.000000000000000072e-17, 1.000000000000000072e-17)));
%!test
%! assert (isequal (infsup (0.0, 8.0) + infsup (-3.000000000000000061e-17, -3.000000000000000061e-17), infsup (-3.000000000000000061e-17, 8.0)));
%! assert (isequal (plus (infsup (0.0, 8.0), infsup (-3.000000000000000061e-17, -3.000000000000000061e-17)), infsup (-3.000000000000000061e-17, 8.0)));
%!test
%! assert (isequal (infsup (0.0, 8.0) + infsup (0.0, 0.0), infsup (0.0, 8.0)));
%! assert (isequal (plus (infsup (0.0, 8.0), infsup (0.0, 0.0)), infsup (0.0, 8.0)));
%!test
%! assert (isequal (infsup (0.0, 8.0) + infsup (2.999999999999999444e-17, 2.999999999999999444e-17), infsup (2.999999999999999444e-17, 8.000000000000001776e+00)));
%! assert (isequal (plus (infsup (0.0, 8.0), infsup (2.999999999999999444e-17, 2.999999999999999444e-17)), infsup (2.999999999999999444e-17, 8.000000000000001776e+00)));
%!test
%! assert (isequal (infsup (0.0, inf) + infsup (-7.000000000000000347e-17, -7.000000000000000347e-17), infsup (-7.000000000000000347e-17, inf)));
%! assert (isequal (plus (infsup (0.0, inf), infsup (-7.000000000000000347e-17, -7.000000000000000347e-17)), infsup (-7.000000000000000347e-17, inf)));
%!test
%! assert (isequal (infsup (0.0, inf) + infsup (0.0, 0.0), infsup (0.0, inf)));
%! assert (isequal (plus (infsup (0.0, inf), infsup (0.0, 0.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (infsup (0.0, inf) + infsup (6.999999999999999114e-17, 6.999999999999999114e-17), infsup (6.999999999999999114e-17, inf)));
%! assert (isequal (plus (infsup (0.0, inf), infsup (6.999999999999999114e-17, 6.999999999999999114e-17)), infsup (6.999999999999999114e-17, inf)));
%!# regular values
%!test
%! assert (isequal (infsup (-32.0, -17.0) + infsup (-3.141592653589793116e+01, -3.141592653589793116e+01), infsup (-6.341592653589793116e+01, -4.841592653589793116e+01)));
%! assert (isequal (plus (infsup (-32.0, -17.0), infsup (-3.141592653589793116e+01, -3.141592653589793116e+01)), infsup (-6.341592653589793116e+01, -4.841592653589793116e+01)));
%!test
%! assert (isequal (infsup (-3.141592653589793116e+01, -17.0) + infsup (3.141592653589793116e+01, 3.141592653589793116e+01), infsup (0.0, 1.441592653589793116e+01)));
%! assert (isequal (plus (infsup (-3.141592653589793116e+01, -17.0), infsup (3.141592653589793116e+01, 3.141592653589793116e+01)), infsup (0.0, 1.441592653589793116e+01)));
%!test
%! assert (isequal (infsup (-32.0, -1.570796326794896558e+01) + infsup (1.570796326794896558e+01, 1.570796326794896558e+01), infsup (-1.629203673205103442e+01, 0.0)));
%! assert (isequal (plus (infsup (-32.0, -1.570796326794896558e+01), infsup (1.570796326794896558e+01, 1.570796326794896558e+01)), infsup (-1.629203673205103442e+01, 0.0)));
%!test
%! assert (isequal (infsup (1.820444444444444443e+01, 3.202559735019019375e+14) + infsup (3.5, 3.5), infsup (2.170444444444444443e+01, 3.202559735019054375e+14)));
%! assert (isequal (plus (infsup (1.820444444444444443e+01, 3.202559735019019375e+14), infsup (3.5, 3.5)), infsup (2.170444444444444443e+01, 3.202559735019054375e+14)));
%!test
%! assert (isequal (infsup (7.111111111111111105e-02, 3.202559735019019375e+14) + infsup (3.5, 3.5), infsup (3.571111111111110681e+00, 3.202559735019054375e+14)));
%! assert (isequal (plus (infsup (7.111111111111111105e-02, 3.202559735019019375e+14), infsup (3.5, 3.5)), infsup (3.571111111111110681e+00, 3.202559735019054375e+14)));
%!test
%! assert (isequal (infsup (-2.550000000000000000e+02, 1.137777777777777777e+00) + infsup (256.5, 256.5), infsup (1.500000000000000000e+00, 2.576377777777777851e+02)));
%! assert (isequal (plus (infsup (-2.550000000000000000e+02, 1.137777777777777777e+00), infsup (256.5, 256.5)), infsup (1.500000000000000000e+00, 2.576377777777777851e+02)));
%!test
%! assert (isequal (infsup (-1.999999999999999778e+00, -2.713328551617526225e-166) + infsup (4097.5, 4097.5), infsup (4.095500000000000000e+03, 4.097500000000000000e+03)));
%! assert (isequal (plus (infsup (-1.999999999999999778e+00, -2.713328551617526225e-166), infsup (4097.5, 4097.5)), infsup (4.095500000000000000e+03, 4.097500000000000000e+03)));
%!test
%! assert (isequal (infsup (1.820444444444444443e+01, 3.202559735019019375e+14) + infsup (-3.5, -3.5), infsup (1.470444444444444443e+01, 3.202559735018984375e+14)));
%! assert (isequal (plus (infsup (1.820444444444444443e+01, 3.202559735019019375e+14), infsup (-3.5, -3.5)), infsup (1.470444444444444443e+01, 3.202559735018984375e+14)));
%!test
%! assert (isequal (infsup (7.111111111111111105e-02, 3.202559735019019375e+14) + infsup (-3.5, -3.5), infsup (-3.428888888888889319e+00, 3.202559735018984375e+14)));
%! assert (isequal (plus (infsup (7.111111111111111105e-02, 3.202559735019019375e+14), infsup (-3.5, -3.5)), infsup (-3.428888888888889319e+00, 3.202559735018984375e+14)));
%!test
%! assert (isequal (infsup (-2.550000000000000000e+02, 1.137777777777777777e+00) + infsup (-256.5, -256.5), infsup (-5.115000000000000000e+02, -2.553622222222222149e+02)));
%! assert (isequal (plus (infsup (-2.550000000000000000e+02, 1.137777777777777777e+00), infsup (-256.5, -256.5)), infsup (-5.115000000000000000e+02, -2.553622222222222149e+02)));
%!test
%! assert (isequal (infsup (-1.999999999999999778e+00, -2.713328551617526225e-166) + infsup (-4097.5, -4097.5), infsup (-4.099500000000000000e+03, -4.097500000000000000e+03)));
%! assert (isequal (plus (infsup (-1.999999999999999778e+00, -2.713328551617526225e-166), infsup (-4097.5, -4097.5)), infsup (-4.099500000000000000e+03, -4.097500000000000000e+03)));

## mpfi_asin

%!# special values
%!test
%! assert (isequal (asin (infsup (-1.0, 0.0)), infsup (-1.570796326794896780e+00, 0.0)));
%!test
%! assert (isequal (asin (infsup (0.0, 0.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (asin (infsup (0.0, +1.0)), infsup (0.0, 1.570796326794896780e+00)));
%!# regular values
%!test
%! assert (isequal (asin (infsup (-1.0, -0.5)), infsup (-1.570796326794896780e+00, -5.235987755982988157e-01)));
%!test
%! assert (isequal (asin (infsup (-0.75, -0.25)), infsup (-8.480620789814811156e-01, -2.526802551420786469e-01)));
%!test
%! assert (isequal (asin (infsup (-0.5, 0.5)), infsup (-5.235987755982989267e-01, 5.235987755982989267e-01)));
%!test
%! assert (isequal (asin (infsup (0.25, 0.625)), infsup (2.526802551420786469e-01, 6.751315329370316531e-01)));
%!test
%! assert (isequal (asin (infsup (-1.0, 1.0)), infsup (-1.570796326794896780e+00, 1.570796326794896780e+00)));

## mpfi_asinh

%!# special values
%!test
%! assert (isequal (asinh (infsup (-inf, -7.0)), infsup (-inf, -2.644120761058629032e+00)));
%!test
%! assert (isequal (asinh (infsup (-inf, 0.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (asinh (infsup (-inf, +8.0)), infsup (-inf, 2.776472280723718100e+00)));
%!test
%! assert (isequal (asinh (infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (asinh (infsup (-1.0, 0.0)), infsup (-8.813735870195430477e-01, 0.0)));
%!test
%! assert (isequal (asinh (infsup (0.0, 0.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (asinh (infsup (0.0, +1.0)), infsup (0.0, 8.813735870195430477e-01)));
%!test
%! assert (isequal (asinh (infsup (0.0, +8.0)), infsup (0.0, 2.776472280723718100e+00)));
%!test
%! assert (isequal (asinh (infsup (0.0, inf)), infsup (0.0, inf)));
%!# regular values
%!test
%! assert (isequal (asinh (infsup (-6.0, -4.0)), infsup (-2.491779852644912197e+00, -2.094712547261101232e+00)));
%!test
%! assert (isequal (asinh (infsup (-2.0, -0.5)), infsup (-1.443635475178810523e+00, -4.812118250596034152e-01)));
%!test
%! assert (isequal (asinh (infsup (-1.0, -0.5)), infsup (-8.813735870195430477e-01, -4.812118250596034152e-01)));
%!test
%! assert (isequal (asinh (infsup (-0.75, -0.25)), infsup (-6.931471805599453972e-01, -2.474664615472634277e-01)));
%!test
%! assert (isequal (asinh (infsup (-0.5, 0.5)), infsup (-4.812118250596034708e-01, 4.812118250596034708e-01)));
%!test
%! assert (isequal (asinh (infsup (0.25, 0.625)), infsup (2.474664615472634277e-01, 5.901436857819590820e-01)));
%!test
%! assert (isequal (asinh (infsup (-1.0, 1.0)), infsup (-8.813735870195430477e-01, 8.813735870195430477e-01)));
%!test
%! assert (isequal (asinh (infsup (0.125, 17.0)), infsup (1.246767469214427326e-01, 3.527224456199966163e+00)));
%!test
%! assert (isequal (asinh (infsup (17.0, 42.0)), infsup (3.527224456199965719e+00, 4.430958492080543820e+00)));
%!test
%! assert (isequal (asinh (infsup (-42.0, 17.0)), infsup (-4.430958492080543820e+00, 3.527224456199966163e+00)));

## mpfi_atan

%!# special values
%!test
%! assert (isequal (atan (infsup (-inf, -7.0)), infsup (-1.570796326794896780e+00, -1.428899272190732539e+00)));
%!test
%! assert (isequal (atan (infsup (-inf, 0.0)), infsup (-1.570796326794896780e+00, 0.0)));
%!test
%! assert (isequal (atan (infsup (-inf, +8.0)), infsup (-1.570796326794896780e+00, 1.446441332248135314e+00)));
%!test
%! assert (isequal (atan (infsup (-inf, inf)), infsup (-1.570796326794896780e+00, 1.570796326794896780e+00)));
%!test
%! assert (isequal (atan (infsup (-1.0, 0.0)), infsup (-7.853981633974483900e-01, 0.0)));
%!test
%! assert (isequal (atan (infsup (0.0, 0.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (atan (infsup (0.0, +1.0)), infsup (0.0, 7.853981633974483900e-01)));
%!test
%! assert (isequal (atan (infsup (0.0, +8.0)), infsup (0.0, 1.446441332248135314e+00)));
%!test
%! assert (isequal (atan (infsup (0.0, inf)), infsup (0.0, 1.570796326794896780e+00)));
%!# regular values
%!test
%! assert (isequal (atan (infsup (-6.0, -4.0)), infsup (-1.405647649380269870e+00, -1.325817663668032331e+00)));
%!test
%! assert (isequal (atan (infsup (-2.0, -0.5)), infsup (-1.107148717794090631e+00, -4.636476090008060935e-01)));
%!test
%! assert (isequal (atan (infsup (-1.0, -0.5)), infsup (-7.853981633974483900e-01, -4.636476090008060935e-01)));
%!test
%! assert (isequal (atan (infsup (-0.75, -0.25)), infsup (-6.435011087932844820e-01, -2.449786631268641435e-01)));
%!test
%! assert (isequal (atan (infsup (-0.5, 0.5)), infsup (-4.636476090008061490e-01, 4.636476090008061490e-01)));
%!test
%! assert (isequal (atan (infsup (0.25, 0.625)), infsup (2.449786631268641435e-01, 5.585993153435624414e-01)));
%!test
%! assert (isequal (atan (infsup (-1.0, 1.0)), infsup (-7.853981633974483900e-01, 7.853981633974483900e-01)));
%!test
%! assert (isequal (atan (infsup (0.125, 17.0)), infsup (1.243549945467614243e-01, 1.512040504079174008e+00)));
%!test
%! assert (isequal (atan (infsup (17.0, 42.0)), infsup (1.512040504079173786e+00, 1.546991300609826814e+00)));
%!test
%! assert (isequal (atan (infsup (-42.0, 17.0)), infsup (-1.546991300609826814e+00, 1.512040504079174008e+00)));

## mpfi_atan2

%!# special values
%!test
%! assert (isequal (atan2 (infsup (-inf, -7.0), infsup (-1.0, +8.0)), infsup (-1.712693381399060577e+00, -7.188299996216244159e-01)));
%!test
%! assert (isequal (atan2 (infsup (-inf, 0.0), infsup (+8.0, inf)), infsup (-1.570796326794896780e+00, 0.0)));
%!test
%! assert (isequal (atan2 (infsup (-inf, +8.0), infsup (0.0, +8.0)), infsup (-1.570796326794896780e+00, 1.570796326794896780e+00)));
%!test
%! assert (isequal (atan2 (infsup (-inf, inf), infsup (0.0, +8.0)), infsup (-1.570796326794896780e+00, 1.570796326794896780e+00)));
%!test
%! assert (isequal (atan2 (infsup (0.0, 0.0), infsup (-inf, -7.0)), infsup (3.141592653589793116e+00, 3.141592653589793560e+00)));
%!test
%! assert (isequal (atan2 (infsup (0.0, +8.0), infsup (-7.0, 0.0)), infsup (1.570796326794896558e+00, 3.141592653589793560e+00)));
%!test
%! assert (isequal (atan2 (infsup (0.0, 0.0), infsup (0.0, +8.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (atan2 (infsup (0.0, inf), infsup (0.0, +8.0)), infsup (0.0, 1.570796326794896780e+00)));
%!test
%! assert (isequal (atan2 (infsup (0.0, 0.0), infsup (+8.0, inf)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (atan2 (infsup (0.0, 0.0), infsup (-inf, inf)), infsup (0.0, 3.141592653589793560e+00)));
%!test
%! assert (isequal (atan2 (infsup (0.0, +8.0), infsup (-7.0, +8.0)), infsup (0.0, 3.141592653589793560e+00)));
%!test
%! assert (isequal (atan2 (infsup (0.0, 0.0), infsup (0.0, 0.0)), infsup));
%!test
%! assert (isequal (atan2 (infsup (0.0, inf), infsup (0.0, +8.0)), infsup (0.0, 1.570796326794896780e+00)));
%!# regular values
%!test
%! assert (isequal (atan2 (infsup (-17.0, -5.0), infsup (-4002.0, -1.0)), infsup (-3.140343278927514969e+00, -1.629552149510619108e+00)));
%!test
%! assert (isequal (atan2 (infsup (-17.0, -5.0), infsup (1.0, 4002.0)), infsup (-1.512040504079174008e+00, -1.249374662278356866e-03)));
%!test
%! assert (isequal (atan2 (infsup (5.0, 17.0), infsup (1.0, 4002.0)), infsup (1.249374662278356866e-03, 1.512040504079174008e+00)));
%!test
%! assert (isequal (atan2 (infsup (5.0, 17.0), infsup (-4002.0, -1.0)), infsup (1.629552149510619108e+00, 3.140343278927514969e+00)));
%!test
%! assert (isequal (atan2 (infsup (-17.0, 5.0), infsup (-4002.0, 1.0)), infsup (-3.141592653589793560e+00, 3.141592653589793560e+00)));

## mpfi_atanh

%!# special values
%!test
%! assert (isequal (atanh (infsup (-1.0, 0.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (atanh (infsup (0.0, 0.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (atanh (infsup (0.0, +1.0)), infsup (0.0, inf)));
%!# regular values
%!test
%! assert (isequal (atanh (infsup (-1.0, -0.5)), infsup (-inf, -5.493061443340547800e-01)));
%!test
%! assert (isequal (atanh (infsup (-0.75, -0.25)), infsup (-9.729550745276567270e-01, -2.554128118829953054e-01)));
%!test
%! assert (isequal (atanh (infsup (-0.5, 0.5)), infsup (-5.493061443340548911e-01, 5.493061443340548911e-01)));
%!test
%! assert (isequal (atanh (infsup (0.25, 0.625)), infsup (2.554128118829953054e-01, 7.331685343967135893e-01)));
%!test
%! assert (isequal (atanh (infsup (-1.0, 1.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (atanh (infsup (0.125, 1.0)), infsup (1.256572141404530274e-01, inf)));

## mpfi_bounded_p

%!# special values
%!test
%! assert (isequal (iscommoninterval (infsup (-inf, -8.0)), false));
%!test
%! assert (isequal (iscommoninterval (infsup (-inf, 0.0)), false));
%!test
%! assert (isequal (iscommoninterval (infsup (-inf, 5.0)), false));
%!test
%! assert (isequal (iscommoninterval (infsup (-inf, inf)), false));
%!test
%! assert (iscommoninterval (infsup (-8.0, 0.0)));
%!test
%! assert (iscommoninterval (infsup (0.0, 0.0)));
%!test
%! assert (iscommoninterval (infsup (0.0, 5.0)));
%!test
%! assert (isequal (iscommoninterval (infsup (0.0, inf)), false));
%!test
%! assert (isequal (iscommoninterval (infsup (5.0, inf)), false));
%!# regular values
%!test
%! assert (iscommoninterval (infsup (-34.0, -17.0)));
%!test
%! assert (iscommoninterval (infsup (-8.0, -1.0)));
%!test
%! assert (iscommoninterval (infsup (-34.0, 17.0)));
%!test
%! assert (iscommoninterval (infsup (-3.141592653589793116e+00, 3.141592653589793560e+00)));
%!test
%! assert (iscommoninterval (infsup (3.141592653589793116e+00, 3.141592653589793560e+00)));
%!test
%! assert (iscommoninterval (infsup (+8.0, 5.070602400912906347e+30)));
%!test
%! assert (iscommoninterval (infsup (9.999999999999998890e-01, 2.0)));

## mpfi_cbrt

%!# special values
%!test
%! assert (isequal (cbrt (infsup (-inf, -125.0)), infsup (-inf, -5.0)));
%!test
%! assert (isequal (cbrt (infsup (-inf, 0.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (cbrt (infsup (-inf, +64.0)), infsup (-inf, +4.0)));
%!test
%! assert (isequal (cbrt (infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (cbrt (infsup (0.0, 0.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (cbrt (infsup (0.0, +27.0)), infsup (0.0, +3.0)));
%!test
%! assert (isequal (cbrt (infsup (0.0, inf)), infsup (0.0, inf)));
%!# regular values
%!test
%! assert (isequal (cbrt (infsup (6.400000000000000000e+01, 1.250000000000000000e+02)), infsup (4.0, 5.0)));
%!test
%! assert (isequal (cbrt (infsup (-1.866945721837885044e-91, 2.160000000000000000e+02)), infsup (-5.715364030403196328e-31, 6.0)));
%!test
%! assert (isequal (cbrt (infsup (3.752421802055952558e-300, 2.729924395354002306e-189)), infsup (1.553950629986428998e-100, 1.397602084890329947e-63)));

## mpfi_cos

%!# special values
%!test
%! assert (isequal (cos (infsup (-inf, -7.0)), infsup (-1.0, 1.0)));
%!test
%! assert (isequal (cos (infsup (-inf, 0.0)), infsup (-1.0, 1.0)));
%!test
%! assert (isequal (cos (infsup (-inf, +8.0)), infsup (-1.0, 1.0)));
%!test
%! assert (isequal (cos (infsup (-inf, inf)), infsup (-1.0, 1.0)));
%!test
%! assert (isequal (cos (infsup (-1.0, 0.0)), infsup (5.403023058681396540e-01, 1.0)));
%!test
%! assert (isequal (cos (infsup (0.0, 0.0)), infsup (1.0, 1.0)));
%!test
%! assert (isequal (cos (infsup (0.0, +1.0)), infsup (5.403023058681396540e-01, 1.0)));
%!test
%! assert (isequal (cos (infsup (0.0, +8.0)), infsup (-1.0, 1.0)));
%!test
%! assert (isequal (cos (infsup (0.0, inf)), infsup (-1.0, 1.0)));
%!# regular values
%!test
%! assert (isequal (cos (infsup (-2.0, -0.5)), infsup (-4.161468365471424069e-01, 8.775825618903727587e-01)));
%!test
%! assert (isequal (cos (infsup (-1.0, -0.25)), infsup (5.403023058681396540e-01, 9.689124217106448445e-01)));
%!test
%! assert (isequal (cos (infsup (-0.5, 0.5)), infsup (8.775825618903726477e-01, 1.0)));
%!test
%! assert (isequal (cos (infsup (-4.5, 0.625)), infsup (-1.0, 1.0)));
%!test
%! assert (isequal (cos (infsup (1.0, 3.141592653589793116e+00)), infsup (-1.0, 5.403023058681397650e-01)));
%!test
%! assert (isequal (cos (infsup (0.125, 17.0)), infsup (-1.0, 1.0)));
%!test
%! assert (isequal (cos (infsup (17.0, 42.0)), infsup (-1.0, 1.0)));
%!test
%! assert (isequal (cos (infsup (-7.0, 1.0)), infsup (-1.0, 1.0)));
%!test
%! assert (isequal (cos (infsup (-7.0, 0.0)), infsup (-1.0, 1.0)));
%!test
%! assert (isequal (cos (infsup (-7.0, -1.0)), infsup (-1.0, 1.0)));
%!test
%! assert (isequal (cos (infsup (-7.0, -2.0)), infsup (-1.0, 1.0)));
%!test
%! assert (isequal (cos (infsup (-7.0, -3.0)), infsup (-1.0, 1.0)));
%!test
%! assert (isequal (cos (infsup (-7.0, -4.0)), infsup (-6.536436208636119405e-01, 1.0)));
%!test
%! assert (isequal (cos (infsup (-7.0, -5.0)), infsup (2.836621854632262463e-01, 1.0)));
%!test
%! assert (isequal (cos (infsup (-7.0, -6.0)), infsup (7.539022543433046009e-01, 1.0)));
%!test
%! assert (isequal (cos (infsup (-7.0, -7.0)), infsup (7.539022543433046009e-01, 7.539022543433047119e-01)));
%!test
%! assert (isequal (cos (infsup (-6.0, 1.0)), infsup (-1.0, 1.0)));
%!test
%! assert (isequal (cos (infsup (-6.0, 0.0)), infsup (-1.0, 1.0)));
%!test
%! assert (isequal (cos (infsup (-6.0, -1.0)), infsup (-1.0, 9.601702866503660783e-01)));
%!test
%! assert (isequal (cos (infsup (-6.0, -2.0)), infsup (-1.0, 9.601702866503660783e-01)));
%!test
%! assert (isequal (cos (infsup (-6.0, -3.0)), infsup (-1.0, 9.601702866503660783e-01)));
%!test
%! assert (isequal (cos (infsup (-6.0, -4.0)), infsup (-6.536436208636119405e-01, 9.601702866503660783e-01)));
%!test
%! assert (isequal (cos (infsup (-6.0, -5.0)), infsup (2.836621854632262463e-01, 9.601702866503660783e-01)));
%!test
%! assert (isequal (cos (infsup (-6.0, -6.0)), infsup (9.601702866503659672e-01, 9.601702866503660783e-01)));
%!test
%! assert (isequal (cos (infsup (-5.0, 1.0)), infsup (-1.0, 1.0)));
%!test
%! assert (isequal (cos (infsup (-5.0, 0.0)), infsup (-1.0, 1.0)));
%!test
%! assert (isequal (cos (infsup (-5.0, -1.0)), infsup (-1.0, 5.403023058681397650e-01)));
%!test
%! assert (isequal (cos (infsup (-5.0, -2.0)), infsup (-1.0, 2.836621854632263018e-01)));
%!test
%! assert (isequal (cos (infsup (-5.0, -3.0)), infsup (-1.0, 2.836621854632263018e-01)));
%!test
%! assert (isequal (cos (infsup (-5.0, -4.0)), infsup (-6.536436208636119405e-01, 2.836621854632263018e-01)));
%!test
%! assert (isequal (cos (infsup (-5.0, -5.0)), infsup (2.836621854632262463e-01, 2.836621854632263018e-01)));
%!test
%! assert (isequal (cos (infsup (-4.0, 1.0)), infsup (-1.0, 1.0)));
%!test
%! assert (isequal (cos (infsup (-4.0, 0.0)), infsup (-1.0, 1.0)));
%!test
%! assert (isequal (cos (infsup (-4.0, -1.0)), infsup (-1.0, 5.403023058681397650e-01)));
%!test
%! assert (isequal (cos (infsup (-4.0, -2.0)), infsup (-1.0, -4.161468365471423514e-01)));
%!test
%! assert (isequal (cos (infsup (-4.0, -3.0)), infsup (-1.0, -6.536436208636118295e-01)));
%!test
%! assert (isequal (cos (infsup (-4.0, -4.0)), infsup (-6.536436208636119405e-01, -6.536436208636118295e-01)));

## mpfi_cosh

%!# special values
%!test
%! assert (isequal (cosh (infsup (-inf, -7.0)), infsup (5.483170351552120110e+02, inf)));
%!test
%! assert (isequal (cosh (infsup (-inf, 0.0)), infsup (1.0, inf)));
%!test
%! assert (isequal (cosh (infsup (-inf, +8.0)), infsup (1.0, inf)));
%!test
%! assert (isequal (cosh (infsup (-inf, inf)), infsup (1.0, inf)));
%!test
%! assert (isequal (cosh (infsup (-1.0, 0.0)), infsup (1.0, 1.543080634815243934e+00)));
%!test
%! assert (isequal (cosh (infsup (0.0, 0.0)), infsup (1.0, 1.0)));
%!test
%! assert (isequal (cosh (infsup (0.0, +1.0)), infsup (1.0, 1.543080634815243934e+00)));
%!test
%! assert (isequal (cosh (infsup (0.0, +8.0)), infsup (1.0, 1.490479161252178301e+03)));
%!test
%! assert (isequal (cosh (infsup (0.0, inf)), infsup (1.0, inf)));
%!# regular values
%!test
%! assert (isequal (cosh (infsup (-0.125, 0.0)), infsup (1.0, 1.007822677825710889e+00)));
%!test
%! assert (isequal (cosh (infsup (0.0, 5.000000000000001110e-01)), infsup (1.0, 1.127625965206380920e+00)));
%!test
%! assert (isequal (cosh (infsup (-4.5, -0.625)), infsup (1.201753692975606302e+00, 4.501412014853003285e+01)));
%!test
%! assert (isequal (cosh (infsup (1.0, 3.0)), infsup (1.543080634815243712e+00, 1.006766199577776710e+01)));
%!test
%! assert (isequal (cosh (infsup (17.0, 7.090895657128239691e+02)), infsup (1.207747637678766809e+07, 4.494232837155419541e+307)));

## mpfi_cot

%!# special values
%!test
%! assert (isequal (cot (infsup (-inf, -7.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (cot (infsup (-inf, 0.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (cot (infsup (-inf, +8.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (cot (infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (cot (infsup (-8.0, 0.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (cot (infsup (-3.0, 0.0)), infsup (-inf, 7.015252551434533856e+00)));
%!test
%! assert (isequal (cot (infsup (-1.0, 0.0)), infsup (-inf, -6.420926159343306461e-01)));
%!test
%! assert (isequal (cot (infsup (0.0, +1.0)), infsup (6.420926159343306461e-01, inf)));
%!test
%! assert (isequal (cot (infsup (0.0, +3.0)), infsup (-7.015252551434533856e+00, inf)));
%!test
%! assert (isequal (cot (infsup (0.0, +8.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (cot (infsup (0.0, inf)), infsup (-inf, inf)));
%!# regular values
%!test
%! assert (isequal (cot (infsup (-3.0, -2.0)), infsup (4.576575543602857121e-01, 7.015252551434533856e+00)));
%!test
%! assert (isequal (cot (infsup (-3.0, -1.570796326794896780e+00)), infsup (1.608122649676636354e-16, 7.015252551434533856e+00)));
%!test
%! assert (isequal (cot (infsup (-2.0, 1.570796326794896780e+00)), infsup (-inf, inf)));
%!test
%! assert (isequal (cot (infsup (0.125, 0.5)), infsup (1.830487721712451776e+00, 7.958289865867011592e+00)));
%!test
%! assert (isequal (cot (infsup (0.125, 1.570796326794896780e+00)), infsup (-1.608122649676636601e-16, 7.958289865867011592e+00)));
%!test
%! assert (isequal (cot (infsup (1.570796326794896780e+00, 4.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (cot (infsup (4.0, 6.283185307179586232e+00)), infsup (-4.082809838298842500e+15, 8.636911544506166161e-01)));
%!test
%! assert (isequal (cot (infsup (3.141592653589793258e+02, 3.151592653589792690e+02)), infsup (6.420926159344081396e-01, 5.090647314608024375e+14)));

## mpfi_coth

%!# special values
%!test
%! assert (isequal (coth (infsup (-inf, -7.0)), infsup (-1.000001663058821100e+00, -1.0)));
%!test
%! assert (isequal (coth (infsup (-inf, 0.0)), infsup (-inf, -1.0)));
%!test
%! assert (isequal (coth (infsup (-inf, +8.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (coth (infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (coth (infsup (-8.0, 0.0)), infsup (-inf, -1.000000225070374560e+00)));
%!test
%! assert (isequal (coth (infsup (-3.0, 0.0)), infsup (-inf, -1.004969823313689004e+00)));
%!test
%! assert (isequal (coth (infsup (-1.0, 0.0)), infsup (-inf, -1.313035285499331239e+00)));
%!test
%! assert (isequal (coth (infsup (0.0, 0.0)), infsup));
%!test
%! assert (isequal (coth (infsup (0.0, +1.0)), infsup (1.313035285499331239e+00, inf)));
%!test
%! assert (isequal (coth (infsup (0.0, +3.0)), infsup (1.004969823313689004e+00, inf)));
%!test
%! assert (isequal (coth (infsup (0.0, +8.0)), infsup (1.000000225070374560e+00, inf)));
%!test
%! assert (isequal (coth (infsup (0.0, inf)), infsup (1.0, inf)));
%!# regular values
%!test
%! assert (isequal (coth (infsup (-3.0, 2.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (coth (infsup (-10.0, -8.0)), infsup (-1.000000225070374782e+00, -1.000000004122307162e+00)));
%!test
%! assert (isequal (coth (infsup (7.0, 17.0)), infsup (1.000000000000003331e+00, 1.000001663058821100e+00)));
%!test
%! assert (isequal (coth (infsup (1.562500000000000347e-02, 5.000000000000001110e-01)), infsup (2.163953413738652021e+00, 6.400520824856424440e+01)));

## mpfi_csc

%!# special values
%!test
%! assert (isequal (csc (infsup (-inf, -7.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (csc (infsup (-inf, 0.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (csc (infsup (-inf, 8.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (csc (infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (csc (infsup (-8.0, 0.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (csc (infsup (-3.0, 0.0)), infsup (-inf, -1.0)));
%!test
%! assert (isequal (csc (infsup (-1.0, 0.0)), infsup (-inf, -1.188395105778121019e+00)));
%!test
%! assert (isequal (csc (infsup (0.0, 0.0)), infsup));
%!test
%! assert (isequal (csc (infsup (0.0, +1.0)), infsup (1.188395105778121019e+00, inf)));
%!test
%! assert (isequal (csc (infsup (0.0, 3.0)), infsup (1.0, inf)));
%!test
%! assert (isequal (csc (infsup (0.0, 8.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (csc (infsup (0.0, inf)), infsup (-inf, inf)));
%!# regular values
%!test
%! assert (isequal (csc (infsup (-6.0, 7.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (csc (infsup (-6.0, 6.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (csc (infsup (-6.0, 5.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (csc (infsup (-6.0, 4.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (csc (infsup (-6.0, 3.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (csc (infsup (-6.0, 2.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (csc (infsup (-6.0, 1.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (csc (infsup (-6.0, 0.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (csc (infsup (-6.0, -1.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (csc (infsup (-6.0, -2.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (csc (infsup (-6.0, -3.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (csc (infsup (-6.0, -4.0)), infsup (1.0, 3.578899547254406066e+00)));
%!test
%! assert (isequal (csc (infsup (-6.0, -5.0)), infsup (1.042835212771405784e+00, 3.578899547254406066e+00)));
%!test
%! assert (isequal (csc (infsup (-6.0, -6.0)), infsup (3.578899547254405622e+00, 3.578899547254406066e+00)));
%!test
%! assert (isequal (csc (infsup (-5.0, 7.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (csc (infsup (-5.0, 6.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (csc (infsup (-5.0, 5.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (csc (infsup (-5.0, 4.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (csc (infsup (-5.0, 3.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (csc (infsup (-5.0, 2.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (csc (infsup (-5.0, 1.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (csc (infsup (-5.0, 0.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (csc (infsup (-5.0, -1.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (csc (infsup (-5.0, -2.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (csc (infsup (-5.0, -3.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (csc (infsup (-5.0, -4.0)), infsup (1.0, 1.321348708810902384e+00)));
%!test
%! assert (isequal (csc (infsup (-5.0, -5.0)), infsup (1.042835212771405784e+00, 1.042835212771406006e+00)));
%!test
%! assert (isequal (csc (infsup (-4.0, 7.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (csc (infsup (-4.0, 6.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (csc (infsup (-4.0, 5.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (csc (infsup (-4.0, 4.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (csc (infsup (-4.0, 3.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (csc (infsup (-4.0, 2.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (csc (infsup (-4.0, 1.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (csc (infsup (-4.0, 0.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (csc (infsup (-4.0, -1.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (csc (infsup (-4.0, -2.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (csc (infsup (-4.0, -3.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (csc (infsup (-4.0, -4.0)), infsup (1.321348708810902162e+00, 1.321348708810902384e+00)));
%!test
%! assert (isequal (csc (infsup (-3.0, 7.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (csc (infsup (-3.0, 6.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (csc (infsup (-3.0, 5.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (csc (infsup (-3.0, 4.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (csc (infsup (-3.0, 3.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (csc (infsup (-3.0, 2.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (csc (infsup (-3.0, 1.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (csc (infsup (-3.0, 0.0)), infsup (-inf, -1.0)));
%!test
%! assert (isequal (csc (infsup (-3.0, -1.0)), infsup (-7.086167395737186681e+00, -1.0)));
%!test
%! assert (isequal (csc (infsup (-3.0, -2.0)), infsup (-7.086167395737186681e+00, -1.099750170294616414e+00)));
%!test
%! assert (isequal (csc (infsup (-3.0, -3.0)), infsup (-7.086167395737186681e+00, -7.086167395737185792e+00)));
%!test
%! assert (isequal (csc (infsup (-2.0, 7.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (csc (infsup (-2.0, 6.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (csc (infsup (-2.0, 5.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (csc (infsup (-2.0, 4.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (csc (infsup (-2.0, 3.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (csc (infsup (-2.0, 2.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (csc (infsup (-2.0, 1.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (csc (infsup (-2.0, 0.0)), infsup (-inf, -1.0)));
%!test
%! assert (isequal (csc (infsup (-2.0, -1.0)), infsup (-1.188395105778121241e+00, -1.0)));
%!test
%! assert (isequal (csc (infsup (-2.0, -2.0)), infsup (-1.099750170294616636e+00, -1.099750170294616414e+00)));
%!test
%! assert (isequal (csc (infsup (-1.0, 7.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (csc (infsup (-1.0, 6.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (csc (infsup (-1.0, 5.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (csc (infsup (-1.0, 4.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (csc (infsup (-1.0, 3.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (csc (infsup (-1.0, 2.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (csc (infsup (-1.0, 1.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (csc (infsup (-1.0, 0.0)), infsup (-inf, -1.188395105778121019e+00)));
%!test
%! assert (isequal (csc (infsup (-1.0, -1.0)), infsup (-1.188395105778121241e+00, -1.188395105778121019e+00)));
%!test
%! assert (isequal (csc (infsup (1.0, 7.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (csc (infsup (1.0, 6.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (csc (infsup (1.0, 5.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (csc (infsup (1.0, 4.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (csc (infsup (1.0, 3.0)), infsup (1.0, 7.086167395737186681e+00)));
%!test
%! assert (isequal (csc (infsup (1.0, 2.0)), infsup (1.0, 1.188395105778121241e+00)));
%!test
%! assert (isequal (csc (infsup (1.0, 1.0)), infsup (1.188395105778121019e+00, 1.188395105778121241e+00)));
%!test
%! assert (isequal (csc (infsup (2.0, 7.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (csc (infsup (2.0, 6.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (csc (infsup (2.0, 5.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (csc (infsup (2.0, 4.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (csc (infsup (2.0, 3.0)), infsup (1.099750170294616414e+00, 7.086167395737186681e+00)));
%!test
%! assert (isequal (csc (infsup (2.0, 2.0)), infsup (1.099750170294616414e+00, 1.099750170294616636e+00)));
%!test
%! assert (isequal (csc (infsup (3.0, 7.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (csc (infsup (3.0, 6.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (csc (infsup (3.0, 5.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (csc (infsup (3.0, 4.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (csc (infsup (3.0, 3.0)), infsup (7.086167395737185792e+00, 7.086167395737186681e+00)));
%!test
%! assert (isequal (csc (infsup (4.0, 7.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (csc (infsup (4.0, 6.0)), infsup (-3.578899547254406066e+00, -1.0)));
%!test
%! assert (isequal (csc (infsup (4.0, 5.0)), infsup (-1.321348708810902384e+00, -1.0)));
%!test
%! assert (isequal (csc (infsup (4.0, 4.0)), infsup (-1.321348708810902384e+00, -1.321348708810902162e+00)));
%!test
%! assert (isequal (csc (infsup (5.0, 7.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (csc (infsup (5.0, 6.0)), infsup (-3.578899547254406066e+00, -1.042835212771405784e+00)));
%!test
%! assert (isequal (csc (infsup (5.0, 5.0)), infsup (-1.042835212771406006e+00, -1.042835212771405784e+00)));
%!test
%! assert (isequal (csc (infsup (6.0, 7.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (csc (infsup (6.0, 6.0)), infsup (-3.578899547254406066e+00, -3.578899547254405622e+00)));
%!test
%! assert (isequal (csc (infsup (7.0, 7.0)), infsup (1.522101062563730345e+00, 1.522101062563730567e+00)));

## mpfi_csch

%!# special values
%!test
%! assert (isequal (csch (infsup (-inf, -7.0)), infsup (-1.823765447622379028e-03, 0.0)));
%!test
%! assert (isequal (csch (infsup (-inf, 0.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (csch (infsup (-inf, +8.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (csch (infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (csch (infsup (-8.0, 0.0)), infsup (-inf, -6.709253313077229598e-04)));
%!test
%! assert (isequal (csch (infsup (-3.0, 0.0)), infsup (-inf, -9.982156966882273219e-02)));
%!test
%! assert (isequal (csch (infsup (-1.0, 0.0)), infsup (-inf, -8.509181282393214474e-01)));
%!test
%! assert (isequal (csch (infsup (0.0, 0.0)), infsup));
%!test
%! assert (isequal (csch (infsup (0.0, +1.0)), infsup (8.509181282393214474e-01, inf)));
%!test
%! assert (isequal (csch (infsup (0.0, +3.0)), infsup (9.982156966882273219e-02, inf)));
%!test
%! assert (isequal (csch (infsup (0.0, +8.0)), infsup (6.709253313077229598e-04, inf)));
%!test
%! assert (isequal (csch (infsup (0.0, inf)), infsup (0.0, inf)));
%!# regular values
%!test
%! assert (isequal (csch (infsup (-3.0, 2.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (csch (infsup (-10.0, -8.0)), infsup (-6.709253313077230682e-04, -9.079985971212215304e-05)));
%!test
%! assert (isequal (csch (infsup (7.0, 17.0)), infsup (8.279875437570346897e-08, 1.823765447622379028e-03)));
%!test
%! assert (isequal (csch (infsup (1.562500000000000347e-02, 5.000000000000001110e-01)), infsup (1.919034751334943056e+00, 6.399739590750608187e+01)));

## mpfi_d_div

%!# special values
%!test
%! assert (isequal (infsup (-3.999999999999999670e-17, -3.999999999999999670e-17) ./ infsup (-inf, -7.0), infsup (0.0, 5.714285714285713924e-18)));
%! assert (isequal (rdivide (infsup (-3.999999999999999670e-17, -3.999999999999999670e-17), infsup (-inf, -7.0)), infsup (0.0, 5.714285714285713924e-18)));
%!test
%! assert (isequal (infsup (0.0, 0.0) ./ infsup (-inf, -7.0), infsup (0.0, 0.0)));
%! assert (isequal (rdivide (infsup (0.0, 0.0), infsup (-inf, -7.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (infsup (3.999999999999999670e-17, 3.999999999999999670e-17) ./ infsup (-inf, -7.0), infsup (-5.714285714285713924e-18, 0.0)));
%! assert (isequal (rdivide (infsup (3.999999999999999670e-17, 3.999999999999999670e-17), infsup (-inf, -7.0)), infsup (-5.714285714285713924e-18, 0.0)));
%!test
%! assert (isequal (infsup (-8.000000000000000572e-17, -8.000000000000000572e-17) ./ infsup (-inf, 0.0), infsup (0.0, inf)));
%! assert (isequal (rdivide (infsup (-8.000000000000000572e-17, -8.000000000000000572e-17), infsup (-inf, 0.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (infsup (0.0, 0.0) ./ infsup (-inf, 0.0), infsup (0.0, 0.0)));
%! assert (isequal (rdivide (infsup (0.0, 0.0), infsup (-inf, 0.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (infsup (8.000000000000000572e-17, 8.000000000000000572e-17) ./ infsup (-inf, 0.0), infsup (-inf, 0.0)));
%! assert (isequal (rdivide (infsup (8.000000000000000572e-17, 8.000000000000000572e-17), infsup (-inf, 0.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (infsup (-1.600000000000000000e+18, -1.600000000000000000e+18) ./ infsup (-inf, 8.0), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (-1.600000000000000000e+18, -1.600000000000000000e+18), infsup (-inf, 8.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (0.0, 0.0) ./ infsup (-inf, 8.0), infsup (0.0, 0.0)));
%! assert (isequal (rdivide (infsup (0.0, 0.0), infsup (-inf, 8.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (infsup (1.600000000000000000e+18, 1.600000000000000000e+18) ./ infsup (-inf, 8.0), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (1.600000000000000000e+18, 1.600000000000000000e+18), infsup (-inf, 8.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-1.600000000000000114e-16, -1.600000000000000114e-16) ./ infsup (-inf, inf), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (-1.600000000000000114e-16, -1.600000000000000114e-16), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (0.0e-17, 0.0e-17) ./ infsup (-inf, inf), infsup (0.0, 0.0)));
%! assert (isequal (rdivide (infsup (0.0e-17, 0.0e-17), infsup (-inf, inf)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (infsup (1.600000000000000114e-16, 1.600000000000000114e-16) ./ infsup (-inf, inf), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (1.600000000000000114e-16, 1.600000000000000114e-16), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-1.000000000000000072e-17, -1.000000000000000072e-17) ./ infsup (0.0, 0.0), infsup));
%! assert (isequal (rdivide (infsup (-1.000000000000000072e-17, -1.000000000000000072e-17), infsup (0.0, 0.0)), infsup));
%!test
%! assert (isequal (infsup (0.0, 0.0) ./ infsup (0.0, 0.0), infsup));
%! assert (isequal (rdivide (infsup (0.0, 0.0), infsup (0.0, 0.0)), infsup));
%!test
%! assert (isequal (infsup (1.000000000000000072e-17, 1.000000000000000072e-17) ./ infsup (0.0, 0.0), infsup));
%! assert (isequal (rdivide (infsup (1.000000000000000072e-17, 1.000000000000000072e-17), infsup (0.0, 0.0)), infsup));
%!test
%! assert (isequal (infsup (-3.000000000000000061e-17, -3.000000000000000061e-17) ./ infsup (0.0, 7.0), infsup (-inf, -4.285714285714285251e-18)));
%! assert (isequal (rdivide (infsup (-3.000000000000000061e-17, -3.000000000000000061e-17), infsup (0.0, 7.0)), infsup (-inf, -4.285714285714285251e-18)));
%!test
%! assert (isequal (infsup (0.0, 0.0) ./ infsup (0.0, 7.0), infsup (0.0, 0.0)));
%! assert (isequal (rdivide (infsup (0.0, 0.0), infsup (0.0, 7.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (infsup (3.000000000000000061e-17, 3.000000000000000061e-17) ./ infsup (0.0, 7.0), infsup (4.285714285714285251e-18, inf)));
%! assert (isequal (rdivide (infsup (3.000000000000000061e-17, 3.000000000000000061e-17), infsup (0.0, 7.0)), infsup (4.285714285714285251e-18, inf)));
%!test
%! assert (isequal (infsup (-7.000000000000000347e-17, -7.000000000000000347e-17) ./ infsup (0.0, inf), infsup (-inf, 0.0)));
%! assert (isequal (rdivide (infsup (-7.000000000000000347e-17, -7.000000000000000347e-17), infsup (0.0, inf)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (infsup (0.0, 0.0) ./ infsup (0.0, inf), infsup (0.0, 0.0)));
%! assert (isequal (rdivide (infsup (0.0, 0.0), infsup (0.0, inf)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (infsup (6.999999999999999114e-17, 6.999999999999999114e-17) ./ infsup (0.0, inf), infsup (0.0, inf)));
%! assert (isequal (rdivide (infsup (6.999999999999999114e-17, 6.999999999999999114e-17), infsup (0.0, inf)), infsup (0.0, inf)));
%!# regular values
%!test
%! assert (isequal (infsup (-2.5, -2.5) ./ infsup (-8.0, 8.0), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (-2.5, -2.5), infsup (-8.0, 8.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-2.5, -2.5) ./ infsup (-8.0, -5.0), infsup (3.125000000000000000e-01, 0.5)));
%! assert (isequal (rdivide (infsup (-2.5, -2.5), infsup (-8.0, -5.0)), infsup (3.125000000000000000e-01, 0.5)));
%!test
%! assert (isequal (infsup (-2.5, -2.5) ./ infsup (25.0, 40.0), infsup (-1.000000000000000056e-01, -6.250000000000000000e-02)));
%! assert (isequal (rdivide (infsup (-2.5, -2.5), infsup (25.0, 40.0)), infsup (-1.000000000000000056e-01, -6.250000000000000000e-02)));
%!test
%! assert (isequal (infsup (-2.5, -2.5) ./ infsup (-16.0, -7.0), infsup (1.562500000000000000e-01, 3.571428571428571508e-01)));
%! assert (isequal (rdivide (infsup (-2.5, -2.5), infsup (-16.0, -7.0)), infsup (1.562500000000000000e-01, 3.571428571428571508e-01)));
%!test
%! assert (isequal (infsup (-2.5, -2.5) ./ infsup (11.0, 143.0), infsup (-2.272727272727272929e-01, -1.748251748251748033e-02)));
%! assert (isequal (rdivide (infsup (-2.5, -2.5), infsup (11.0, 143.0)), infsup (-2.272727272727272929e-01, -1.748251748251748033e-02)));
%!test
%! assert (isequal (infsup (33.125, 33.125) ./ infsup (8.28125, 530.0), infsup (6.250000000000000000e-02, 4.0)));
%! assert (isequal (rdivide (infsup (33.125, 33.125), infsup (8.28125, 530.0)), infsup (6.250000000000000000e-02, 4.0)));
%!test
%! assert (isequal (infsup (33.125, 33.125) ./ infsup (-530.0, -496.875), infsup (-6.666666666666667962e-02, -6.250000000000000000e-02)));
%! assert (isequal (rdivide (infsup (33.125, 33.125), infsup (-530.0, -496.875)), infsup (-6.666666666666667962e-02, -6.250000000000000000e-02)));
%!test
%! assert (isequal (infsup (33.125, 33.125) ./ infsup (54.0, 265.0), infsup (0.125, 6.134259259259259300e-01)));
%! assert (isequal (rdivide (infsup (33.125, 33.125), infsup (54.0, 265.0)), infsup (0.125, 6.134259259259259300e-01)));
%!test
%! assert (isequal (infsup (33.125, 33.125) ./ infsup (52.0, 54.0), infsup (6.134259259259258190e-01, 6.370192307692308376e-01)));
%! assert (isequal (rdivide (infsup (33.125, 33.125), infsup (52.0, 54.0)), infsup (6.134259259259258190e-01, 6.370192307692308376e-01)));

## mpfi_diam_abs

%!# special values
%!test
%! assert (isequal (wid (infsup (-inf, -8.0)), inf));
%!test
%! assert (isequal (wid (infsup (-inf, 0.0)), inf));
%!test
%! assert (isequal (wid (infsup (-inf, 5.0)), inf));
%!test
%! assert (isequal (wid (infsup (-inf, inf)), inf));
%!test
%! assert (isequal (wid (infsup (-inf, 0.0)), inf));
%!test
%! assert (isequal (wid (infsup (-8.0, 0.0)), +8));
%!test
%! assert (isequal (wid (infsup (0.0, 0.0)), -0));
%!test
%! assert (isequal (wid (infsup (0.0, 5.0)), +5));
%!test
%! assert (isequal (wid (infsup (0.0, inf)), inf));
%!# regular values
%!test
%! assert (isequal (wid (infsup (-34.0, -17.0)), 17));

## mpfi_div

%!# special values
%!test
%! assert (isequal (infsup (-inf, -7.0) ./ infsup (-1.0, +8.0), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (-inf, -7.0), infsup (-1.0, +8.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-inf, 0.0) ./ infsup (+8.0, inf), infsup (-inf, 0.0)));
%! assert (isequal (rdivide (infsup (-inf, 0.0), infsup (+8.0, inf)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (infsup (-inf, +8.0) ./ infsup (0.0, +8.0), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (-inf, +8.0), infsup (0.0, +8.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-inf, inf) ./ infsup (0.0, +8.0), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (-inf, inf), infsup (0.0, +8.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (0.0, 0.0) ./ infsup (-inf, -7.0), infsup (0.0, 0.0)));
%! assert (isequal (rdivide (infsup (0.0, 0.0), infsup (-inf, -7.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (infsup (0.0, +8.0) ./ infsup (-7.0, 0.0), infsup (-inf, 0.0)));
%! assert (isequal (rdivide (infsup (0.0, +8.0), infsup (-7.0, 0.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (infsup (0.0, 0.0) ./ infsup (0.0, +8.0), infsup (0.0, 0.0)));
%! assert (isequal (rdivide (infsup (0.0, 0.0), infsup (0.0, +8.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (infsup (0.0, inf) ./ infsup (0.0, +8.0), infsup (0.0, inf)));
%! assert (isequal (rdivide (infsup (0.0, inf), infsup (0.0, +8.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (infsup (0.0, 0.0) ./ infsup (+8.0, inf), infsup (0.0, 0.0)));
%! assert (isequal (rdivide (infsup (0.0, 0.0), infsup (+8.0, inf)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (infsup (0.0, 0.0) ./ infsup (-inf, inf), infsup (0.0, 0.0)));
%! assert (isequal (rdivide (infsup (0.0, 0.0), infsup (-inf, inf)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (infsup (0.0, +8.0) ./ infsup (-7.0, +8.0), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (0.0, +8.0), infsup (-7.0, +8.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (0.0, inf) ./ infsup (0.0, +8.0), infsup (0.0, inf)));
%! assert (isequal (rdivide (infsup (0.0, inf), infsup (0.0, +8.0)), infsup (0.0, inf)));
%!# regular value
%!test
%! assert (isequal (infsup (-1.234567890000000000e+08, -3.003000000000000000e+04) ./ infsup (-2.860000000000000000e+02, -9.000000000000000000e+00), infsup (1.050000000000000000e+02, 1.371742100000000000e+07)));
%! assert (isequal (rdivide (infsup (-1.234567890000000000e+08, -3.003000000000000000e+04), infsup (-2.860000000000000000e+02, -9.000000000000000000e+00)), infsup (1.050000000000000000e+02, 1.371742100000000000e+07)));
%!test
%! assert (isequal (infsup (-1.234567890000000000e+08, -8.022692722045614289e-02) ./ infsup (-4.655552514652689666e+01, -9.000000000000000000e+00), infsup (1.723252545599116220e-03, 1.371742100000000000e+07)));
%! assert (isequal (rdivide (infsup (-1.234567890000000000e+08, -8.022692722045614289e-02), infsup (-4.655552514652689666e+01, -9.000000000000000000e+00)), infsup (1.723252545599116220e-03, 1.371742100000000000e+07)));
%!test
%! assert (isequal (infsup (-1.011478505940748729e+00, -4.582214355468750000e-01) ./ infsup (-2.860000000000000000e+02, -2.885141339691025750e-02), infsup (1.602172851562500000e-03, 3.505819600675333447e+01)));
%! assert (isequal (rdivide (infsup (-1.011478505940748729e+00, -4.582214355468750000e-01), infsup (-2.860000000000000000e+02, -2.885141339691025750e-02)), infsup (1.602172851562500000e-03, 3.505819600675333447e+01)));
%!test
%! assert (isequal (infsup (-1.011478505940748729e+00, -8.022692722045614289e-02) ./ infsup (-2.909720321657931041e+00, -2.885141339691025750e-02), infsup (2.757204072958585953e-02, 3.505819600675333447e+01)));
%! assert (isequal (rdivide (infsup (-1.011478505940748729e+00, -8.022692722045614289e-02), infsup (-2.909720321657931041e+00, -2.885141339691025750e-02)), infsup (2.757204072958585953e-02, 3.505819600675333447e+01)));
%!test
%! assert (isequal (infsup (-3.199335425627046480e+80, -1.785000000000000000e+03) ./ infsup (-7.000000000000000000e+00, 0.0), infsup (2.550000000000000000e+02, inf)));
%! assert (isequal (rdivide (infsup (-3.199335425627046480e+80, -1.785000000000000000e+03), infsup (-7.000000000000000000e+00, 0.0)), infsup (2.550000000000000000e+02, inf)));
%!test
%! assert (isequal (infsup (-2.560000000000000000e+02, -9.207771443835954805e-01) ./ infsup (-1.486045243803458593e+00, 0.0), infsup (6.196158214045437429e-01, inf)));
%! assert (isequal (rdivide (infsup (-2.560000000000000000e+02, -9.207771443835954805e-01), infsup (-1.486045243803458593e+00, 0.0)), infsup (6.196158214045437429e-01, inf)));
%!test
%! assert (isequal (infsup (-1.148236704163043909e+00, -6.001224414812756924e-01) ./ infsup (-5.769162195036162677e-01, 2.794322589058405581e-01), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (-1.148236704163043909e+00, -6.001224414812756924e-01), infsup (-5.769162195036162677e-01, 2.794322589058405581e-01)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-100.0, -15.0) ./ infsup (0.0, +3.0), infsup (-inf, -5.0)));
%! assert (isequal (rdivide (infsup (-100.0, -15.0), infsup (0.0, +3.0)), infsup (-inf, -5.0)));
%!test
%! assert (isequal (infsup (-2.0, -1.148236704163043909e+00) ./ infsup (0.0, 5.769162195036162677e-01), infsup (-inf, -1.990300610981255991e+00)));
%! assert (isequal (rdivide (infsup (-2.0, -1.148236704163043909e+00), infsup (0.0, 5.769162195036162677e-01)), infsup (-inf, -1.990300610981255991e+00)));
%!test
%! assert (isequal (infsup (-4.886718345000000000e+09, -4.804800000000000000e+05) ./ infsup (1.035000000000000000e+03, 4.576000000000000000e+03), infsup (-4.721467000000000000e+06, -1.050000000000000000e+02)));
%! assert (isequal (rdivide (infsup (-4.886718345000000000e+09, -4.804800000000000000e+05), infsup (1.035000000000000000e+03, 4.576000000000000000e+03)), infsup (-4.721467000000000000e+06, -1.050000000000000000e+02)));
%!test
%! assert (isequal (infsup (-8.377603228949244141e-01, -3.333999742949345091e-12) ./ infsup (4.532967658553376467e+00, 9.191685613161424376e+62), infsup (-1.848149790599393216e-01, -3.627190793139666743e-75)));
%! assert (isequal (rdivide (infsup (-8.377603228949244141e-01, -3.333999742949345091e-12), infsup (4.532967658553376467e+00, 9.191685613161424376e+62)), infsup (-1.848149790599393216e-01, -3.627190793139666743e-75)));
%!test
%! assert (isequal (infsup (-4.886718345000000000e+09, -1.690035415063386504e+00) ./ infsup (7.896423339843750000e-03, 1.538379475155964848e-01), infsup (-6.188521226240000000e+11, -1.098581619396635745e+01)));
%! assert (isequal (rdivide (infsup (-4.886718345000000000e+09, -1.690035415063386504e+00), infsup (7.896423339843750000e-03, 1.538379475155964848e-01)), infsup (-6.188521226240000000e+11, -1.098581619396635745e+01)));
%!test
%! assert (isequal (infsup (-1.340416516631879063e+01, -1.690035415063386504e+00) ./ infsup (2.833104786595860292e-01, 3.938251456399270012e+01), infsup (-4.731263463934446634e+01, -4.291334450768108377e-02)));
%! assert (isequal (rdivide (infsup (-1.340416516631879063e+01, -1.690035415063386504e+00), infsup (2.833104786595860292e-01, 3.938251456399270012e+01)), infsup (-4.731263463934446634e+01, -4.291334450768108377e-02)));
%!test
%! assert (isequal (infsup (-1.234567890000000000e+08, 0.0) ./ infsup (-1.440000000000000000e+02, -9.000000000000000000e+00), infsup (0.0, 1.371742100000000000e+07)));
%! assert (isequal (rdivide (infsup (-1.234567890000000000e+08, 0.0), infsup (-1.440000000000000000e+02, -9.000000000000000000e+00)), infsup (0.0, 1.371742100000000000e+07)));
%!test
%! assert (isequal (infsup (-7.875890313239129747e-02, 0.0) ./ infsup (-3.906250000000000000e-03, -3.752026718402494930e-03), infsup (0.0, 2.099102939382174071e+01)));
%! assert (isequal (rdivide (infsup (-7.875890313239129747e-02, 0.0), infsup (-3.906250000000000000e-03, -3.752026718402494930e-03)), infsup (0.0, 2.099102939382174071e+01)));
%!test
%! assert (isequal (infsup (-6.413817828600000000e+10, 0.0) ./ infsup (-4.581298449000000000e+10, 0.0), infsup (0.0, inf)));
%! assert (isequal (rdivide (infsup (-6.413817828600000000e+10, 0.0), infsup (-4.581298449000000000e+10, 0.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (infsup (-1.148236704163043909e+00, 0.0) ./ infsup (-5.769162195036162677e-01, 2.794322589058405581e-01), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (-1.148236704163043909e+00, 0.0), infsup (-5.769162195036162677e-01, 2.794322589058405581e-01)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-6.413817828600000000e+10, 0.0) ./ infsup (0.0, 3.000000000000000000e+00), infsup (-inf, 0.0)));
%! assert (isequal (rdivide (infsup (-6.413817828600000000e+10, 0.0), infsup (0.0, 3.000000000000000000e+00)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (infsup (-1.234567890000000000e+08, 0.0) ./ infsup (9.000000000000000000e+00, 1.440000000000000000e+02), infsup (-1.371742100000000000e+07, 0.0)));
%! assert (isequal (rdivide (infsup (-1.234567890000000000e+08, 0.0), infsup (9.000000000000000000e+00, 1.440000000000000000e+02)), infsup (-1.371742100000000000e+07, 0.0)));
%!test
%! assert (isequal (infsup (-7.875890313239129747e-02, 0.0) ./ infsup (3.752026718402494930e-03, 9.000000000000000000e+00), infsup (-2.099102939382174071e+01, 0.0)));
%! assert (isequal (rdivide (infsup (-7.875890313239129747e-02, 0.0), infsup (3.752026718402494930e-03, 9.000000000000000000e+00)), infsup (-2.099102939382174071e+01, 0.0)));
%!test
%! assert (isequal (infsup (-1.234567890000000000e+08, 4.262400000000000000e+04) ./ infsup (-2.806000000000000000e+03, -9.000000000000000000e+00), infsup (-4.736000000000000000e+03, 1.371742100000000000e+07)));
%! assert (isequal (rdivide (infsup (-1.234567890000000000e+08, 4.262400000000000000e+04), infsup (-2.806000000000000000e+03, -9.000000000000000000e+00)), infsup (-4.736000000000000000e+03, 1.371742100000000000e+07)));
%!test
%! assert (isequal (infsup (-1.800000000000000000e+01, 1.600000000000000000e+01) ./ infsup (-8.063085270350000000e+11, -9.000000000000000000e+00), infsup (-1.777777777777777901e+00, 2.0)));
%! assert (isequal (rdivide (infsup (-1.800000000000000000e+01, 1.600000000000000000e+01), infsup (-8.063085270350000000e+11, -9.000000000000000000e+00)), infsup (-1.777777777777777901e+00, 2.0)));
%!test
%! assert (isequal (infsup (-1.000000000000000000e+00, 4.582214355468750000e-01) ./ infsup (-8.796093022200000000e+11, -2.860000000000000000e+02), infsup (-1.602172851562500000e-03, 3.496503496503496934e-03)));
%! assert (isequal (rdivide (infsup (-1.000000000000000000e+00, 4.582214355468750000e-01), infsup (-8.796093022200000000e+11, -2.860000000000000000e+02)), infsup (-1.602172851562500000e-03, 3.496503496503496934e-03)));
%!test
%! assert (isequal (infsup (-7.098547996011581596e-01, 6.900706076855589011e+00) ./ infsup (-1.524656123849300000e+13, -8.096558996257990914e-01), infsup (-8.523010923584831033e+00, 8.767364011418107284e-01)));
%! assert (isequal (rdivide (infsup (-7.098547996011581596e-01, 6.900706076855589011e+00), infsup (-1.524656123849300000e+13, -8.096558996257990914e-01)), infsup (-8.523010923584831033e+00, 8.767364011418107284e-01)));
%!test
%! assert (isequal (infsup (-3.199335425627046480e+80, 1.785000000000000000e+03) ./ infsup (-7.000000000000000000e+00, 0.0), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (-3.199335425627046480e+80, 1.785000000000000000e+03), infsup (-7.000000000000000000e+00, 0.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-1.148236704163043909e+00, 6.001224414812756924e-01) ./ infsup (-5.769162195036162677e-01, 2.794322589058405581e-01), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (-1.148236704163043909e+00, 6.001224414812756924e-01), infsup (-5.769162195036162677e-01, 2.794322589058405581e-01)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (0.0, +15.0) ./ infsup (-3.0, +3.0), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (0.0, +15.0), infsup (-3.0, +3.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-3.003000000000000000e+04, 8.972767232000000000e+11) ./ infsup (2.860000000000000000e+02, 3.003000000000000000e+03), infsup (-1.050000000000000000e+02, 3.137331200000000000e+09)));
%! assert (isequal (rdivide (infsup (-3.003000000000000000e+04, 8.972767232000000000e+11), infsup (2.860000000000000000e+02, 3.003000000000000000e+03)), infsup (-1.050000000000000000e+02, 3.137331200000000000e+09)));
%!test
%! assert (isequal (infsup (-1.600000000000000000e+01, 8.972767232000000000e+11) ./ infsup (2.860000000000000000e+02, 3.003000000000000000e+03), infsup (-5.594405594405595095e-02, 3.137331200000000000e+09)));
%! assert (isequal (rdivide (infsup (-1.600000000000000000e+01, 8.972767232000000000e+11), infsup (2.860000000000000000e+02, 3.003000000000000000e+03)), infsup (-5.594405594405595095e-02, 3.137331200000000000e+09)));
%!test
%! assert (isequal (infsup (-3.003000000000000000e+04, 1.024000000000000000e+03) ./ infsup (2.860000000000000000e+02, 3.003000000000000000e+03), infsup (-1.050000000000000000e+02, 3.580419580419580861e+00)));
%! assert (isequal (rdivide (infsup (-3.003000000000000000e+04, 1.024000000000000000e+03), infsup (2.860000000000000000e+02, 3.003000000000000000e+03)), infsup (-1.050000000000000000e+02, 3.580419580419580861e+00)));
%!test
%! assert (isequal (infsup (-1.094531424968872235e+00, 2.080935869470149413e+00) ./ infsup (1.149189461478033136e+00, 2.730000000000000000e+02), infsup (-9.524377499608617237e-01, 1.810785722655120944e+00)));
%! assert (isequal (rdivide (infsup (-1.094531424968872235e+00, 2.080935869470149413e+00), infsup (1.149189461478033136e+00, 2.730000000000000000e+02)), infsup (-9.524377499608617237e-01, 1.810785722655120944e+00)));
%!test
%! assert (isequal (infsup (0.0, 1.234567890000000000e+08) ./ infsup (-1.000000000000000000e+01, -9.000000000000000000e+00), infsup (-1.371742100000000000e+07, 0.0)));
%! assert (isequal (rdivide (infsup (0.0, 1.234567890000000000e+08), infsup (-1.000000000000000000e+01, -9.000000000000000000e+00)), infsup (-1.371742100000000000e+07, 0.0)));
%!test
%! assert (isequal (infsup (0.0, 1.674790800242983879e+00) ./ infsup (-9.375000000000000000e-01, -8.900092612419525651e-01), infsup (-1.881767834534572748e+00, 0.0)));
%! assert (isequal (rdivide (infsup (0.0, 1.674790800242983879e+00), infsup (-9.375000000000000000e-01, -8.900092612419525651e-01)), infsup (-1.881767834534572748e+00, 0.0)));
%!test
%! assert (isequal (infsup (0.0, 1.000000000000000000e+01) ./ infsup (-9.000000000000000000e+00, 0.0), infsup (-inf, 0.0)));
%! assert (isequal (rdivide (infsup (0.0, 1.000000000000000000e+01), infsup (-9.000000000000000000e+00, 0.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (infsup (0.0, 1.000000000000000000e+01) ./ infsup (-1.0, +1.0), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (0.0, 1.000000000000000000e+01), infsup (-1.0, +1.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (0.0, 1.234567890000000000e+08) ./ infsup (9.000000000000000000e+00, 1.000000000000000000e+01), infsup (0.0, 1.371742100000000000e+07)));
%! assert (isequal (rdivide (infsup (0.0, 1.234567890000000000e+08), infsup (9.000000000000000000e+00, 1.000000000000000000e+01)), infsup (0.0, 1.371742100000000000e+07)));
%!test
%! assert (isequal (infsup (0.0, 1.372726670594058396e+00) ./ infsup (2.225298220308889352e+00, 1.000000000000000000e+01), infsup (0.0, 6.168731265167295419e-01)));
%! assert (isequal (rdivide (infsup (0.0, 1.372726670594058396e+00), infsup (2.225298220308889352e+00, 1.000000000000000000e+01)), infsup (0.0, 6.168731265167295419e-01)));
%!test
%! assert (isequal (infsup (3.003000000000000000e+04, 1.234567890000000000e+08) ./ infsup (-2.860000000000000000e+02, -9.000000000000000000e+00), infsup (-1.371742100000000000e+07, -1.050000000000000000e+02)));
%! assert (isequal (rdivide (infsup (3.003000000000000000e+04, 1.234567890000000000e+08), infsup (-2.860000000000000000e+02, -9.000000000000000000e+00)), infsup (-1.371742100000000000e+07, -1.050000000000000000e+02)));
%!test
%! assert (isequal (infsup (4.582214355468750000e-01, 1.603374748222124779e+01) ./ infsup (-2.860000000000000000e+02, -2.286926490048424743e+00), infsup (-7.011046289416036359e+00, -1.602172851562500000e-03)));
%! assert (isequal (rdivide (infsup (4.582214355468750000e-01, 1.603374748222124779e+01), infsup (-2.860000000000000000e+02, -2.286926490048424743e+00)), infsup (-7.011046289416036359e+00, -1.602172851562500000e-03)));
%!test
%! assert (isequal (infsup (6.045543549399371441e-01, 1.234567890000000000e+08) ./ infsup (-2.113739798239034684e+01, -9.000000000000000000e+00), infsup (-1.371742100000000000e+07, -2.860117198169773861e-02)));
%! assert (isequal (rdivide (infsup (6.045543549399371441e-01, 1.234567890000000000e+08), infsup (-2.113739798239034684e+01, -9.000000000000000000e+00)), infsup (-1.371742100000000000e+07, -2.860117198169773861e-02)));
%!test
%! assert (isequal (infsup (8.802057619444758618e-01, 1.024602584497202873e+00) ./ infsup (-3.157474458321694599e-01, -1.779681367608609566e-01), infsup (-5.757224878259978418e+00, -2.787689254697360841e+00)));
%! assert (isequal (rdivide (infsup (8.802057619444758618e-01, 1.024602584497202873e+00), infsup (-3.157474458321694599e-01, -1.779681367608609566e-01)), infsup (-5.757224878259978418e+00, -2.787689254697360841e+00)));
%!test
%! assert (isequal (infsup (3.003000000000000000e+04, 6.116600000000000000e+04) ./ infsup (-2.860000000000000000e+02, 0.0), infsup (-inf, -1.050000000000000000e+02)));
%! assert (isequal (rdivide (infsup (3.003000000000000000e+04, 6.116600000000000000e+04), infsup (-2.860000000000000000e+02, 0.0)), infsup (-inf, -1.050000000000000000e+02)));
%!test
%! assert (isequal (infsup (1.037610958488276169e-01, 6.116600000000000000e+04) ./ infsup (-8.870683004794921445e-01, 0.0), infsup (-inf, -1.169708079893521518e-01)));
%! assert (isequal (rdivide (infsup (1.037610958488276169e-01, 6.116600000000000000e+04), infsup (-8.870683004794921445e-01, 0.0)), infsup (-inf, -1.169708079893521518e-01)));
%!test
%! assert (isequal (infsup (5.0, 6.0) ./ infsup (-3.157474458321694599e-01, 1.779681367608609566e-01), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (5.0, 6.0), infsup (-3.157474458321694599e-01, 1.779681367608609566e-01)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (3.003000000000000000e+04, 9.786700000000000000e+05) ./ infsup (0.0, 2.860000000000000000e+02), infsup (1.050000000000000000e+02, inf)));
%! assert (isequal (rdivide (infsup (3.003000000000000000e+04, 9.786700000000000000e+05), infsup (0.0, 2.860000000000000000e+02)), infsup (1.050000000000000000e+02, inf)));
%!test
%! assert (isequal (infsup (1.496153990149218460e+00, 9.786700000000000000e+05) ./ infsup (0.0, 1.283943542366996704e+00), infsup (1.165280201799998139e+00, inf)));
%! assert (isequal (rdivide (infsup (1.496153990149218460e+00, 9.786700000000000000e+05), infsup (0.0, 1.283943542366996704e+00)), infsup (1.165280201799998139e+00, inf)));
%!test
%! assert (isequal (infsup (1.593578642000000000e+09, 7.418529635000000000e+09) ./ infsup (3.136799000000000000e+06, 8.952689000000000000e+06), infsup (1.780000000000000000e+02, 2.365000000000000000e+03)));
%! assert (isequal (rdivide (infsup (1.593578642000000000e+09, 7.418529635000000000e+09), infsup (3.136799000000000000e+06, 8.952689000000000000e+06)), infsup (1.780000000000000000e+02, 2.365000000000000000e+03)));
%!test
%! assert (isequal (infsup (7.198359729899688961e-03, 7.418529635000000000e+09) ./ infsup (2.991484642028808594e+00, 1.424014817987124104e+01), infsup (5.054975298694381908e-04, 2.479882240000000000e+09)));
%! assert (isequal (rdivide (infsup (7.198359729899688961e-03, 7.418529635000000000e+09), infsup (2.991484642028808594e+00, 1.424014817987124104e+01)), infsup (5.054975298694381908e-04, 2.479882240000000000e+09)));
%!test
%! assert (isequal (infsup (3.710339409299194813e-01, 1.002109217638827987e+00) ./ infsup (2.286926490048424743e+00, 8.537949562072753906e+00), infsup (4.345703125000000000e-02, 4.381903930885022724e-01)));
%! assert (isequal (rdivide (infsup (3.710339409299194813e-01, 1.002109217638827987e+00), infsup (2.286926490048424743e+00, 8.537949562072753906e+00)), infsup (4.345703125000000000e-02, 4.381903930885022724e-01)));
%!test
%! assert (isequal (infsup (3.228846131764277760e-02, 3.599978364696688526e+00) ./ infsup (5.102487095624549385e-01, 7.548398876996481599e-01), infsup (4.277524524577111520e-02, 7.055340458937599202e+00)));
%! assert (isequal (rdivide (infsup (3.228846131764277760e-02, 3.599978364696688526e+00), infsup (5.102487095624549385e-01, 7.548398876996481599e-01)), infsup (4.277524524577111520e-02, 7.055340458937599202e+00)));

## mpfi_div_d

%!# special values
%!test
%! assert (isequal (infsup (-inf, -7.0) ./ infsup (-7.0, -7.0), infsup (1.0, inf)));
%! assert (isequal (rdivide (infsup (-inf, -7.0), infsup (-7.0, -7.0)), infsup (1.0, inf)));
%!test
%! assert (isequal (infsup (-inf, -7.0) ./ infsup (0.0, 0.0), infsup));
%! assert (isequal (rdivide (infsup (-inf, -7.0), infsup (0.0, 0.0)), infsup));
%!test
%! assert (isequal (infsup (-inf, -7.0) ./ infsup (7.0, 7.0), infsup (-inf, -1.0)));
%! assert (isequal (rdivide (infsup (-inf, -7.0), infsup (7.0, 7.0)), infsup (-inf, -1.0)));
%!test
%! assert (isequal (infsup (-inf, 0.0) ./ infsup (-8.000000000000000572e-17, -8.000000000000000572e-17), infsup (0.0, inf)));
%! assert (isequal (rdivide (infsup (-inf, 0.0), infsup (-8.000000000000000572e-17, -8.000000000000000572e-17)), infsup (0.0, inf)));
%!test
%! assert (isequal (infsup (-inf, 0.0) ./ infsup (8.000000000000000572e-17, 8.000000000000000572e-17), infsup (-inf, 0.0)));
%! assert (isequal (rdivide (infsup (-inf, 0.0), infsup (8.000000000000000572e-17, 8.000000000000000572e-17)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (infsup (-inf, 8.0) ./ infsup (-3.0, -3.0), infsup (-2.666666666666666963e+00, inf)));
%! assert (isequal (rdivide (infsup (-inf, 8.0), infsup (-3.0, -3.0)), infsup (-2.666666666666666963e+00, inf)));
%!test
%! assert (isequal (infsup (-inf, 8.0) ./ infsup (0.0, 0.0), infsup));
%! assert (isequal (rdivide (infsup (-inf, 8.0), infsup (0.0, 0.0)), infsup));
%!test
%! assert (isequal (infsup (-inf, 8.0) ./ infsup (3.0, 3.0), infsup (-inf, 2.666666666666666963e+00)));
%! assert (isequal (rdivide (infsup (-inf, 8.0), infsup (3.0, 3.0)), infsup (-inf, 2.666666666666666963e+00)));
%!test
%! assert (isequal (infsup (-inf, inf) ./ infsup (-1.600000000000000114e-16, -1.600000000000000114e-16), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (-inf, inf), infsup (-1.600000000000000114e-16, -1.600000000000000114e-16)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-inf, inf) ./ infsup (0.0e-17, 0.0e-17), infsup));
%! assert (isequal (rdivide (infsup (-inf, inf), infsup (0.0e-17, 0.0e-17)), infsup));
%!test
%! assert (isequal (infsup (-inf, inf) ./ infsup (1.600000000000000114e-16, 1.600000000000000114e-16), infsup (-inf, inf)));
%! assert (isequal (rdivide (infsup (-inf, inf), infsup (1.600000000000000114e-16, 1.600000000000000114e-16)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (0.0, 0.0) ./ infsup (-1.000000000000000072e-17, -1.000000000000000072e-17), infsup (0.0, 0.0)));
%! assert (isequal (rdivide (infsup (0.0, 0.0), infsup (-1.000000000000000072e-17, -1.000000000000000072e-17)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (infsup (0.0, 0.0) ./ infsup (1.000000000000000072e-17, 1.000000000000000072e-17), infsup (0.0, 0.0)));
%! assert (isequal (rdivide (infsup (0.0, 0.0), infsup (1.000000000000000072e-17, 1.000000000000000072e-17)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (infsup (0.0, 8.0) ./ infsup (-3.000000000000000061e-17, -3.000000000000000061e-17), infsup (-2.666666666666666880e+17, 0.0)));
%! assert (isequal (rdivide (infsup (0.0, 8.0), infsup (-3.000000000000000061e-17, -3.000000000000000061e-17)), infsup (-2.666666666666666880e+17, 0.0)));
%!test
%! assert (isequal (infsup (0.0, 8.0) ./ infsup (3.000000000000000061e-17, 3.000000000000000061e-17), infsup (0.0, 2.666666666666666880e+17)));
%! assert (isequal (rdivide (infsup (0.0, 8.0), infsup (3.000000000000000061e-17, 3.000000000000000061e-17)), infsup (0.0, 2.666666666666666880e+17)));
%!test
%! assert (isequal (infsup (0.0, inf) ./ infsup (-7.000000000000000347e-17, -7.000000000000000347e-17), infsup (-inf, 0.0)));
%! assert (isequal (rdivide (infsup (0.0, inf), infsup (-7.000000000000000347e-17, -7.000000000000000347e-17)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (infsup (0.0, inf) ./ infsup (6.999999999999999114e-17, 6.999999999999999114e-17), infsup (0.0, inf)));
%! assert (isequal (rdivide (infsup (0.0, inf), infsup (6.999999999999999114e-17, 6.999999999999999114e-17)), infsup (0.0, inf)));
%!# regular values
%!test
%! assert (isequal (infsup (-4.294967296000000954e+09, -5.000000000000001110e-01) ./ infsup (-1.0, -1.0), infsup (5.000000000000001110e-01, 4.294967296000000954e+09)));
%! assert (isequal (rdivide (infsup (-4.294967296000000954e+09, -5.000000000000001110e-01), infsup (-1.0, -1.0)), infsup (5.000000000000001110e-01, 4.294967296000000954e+09)));
%!test
%! assert (isequal (infsup (-4.294967296000001907e+09, -5.000000000000001110e-01) ./ infsup (5.000000000000001110e-01, 5.000000000000001110e-01), infsup (-8.589934592000001907e+09, -1.0)));
%! assert (isequal (rdivide (infsup (-4.294967296000001907e+09, -5.000000000000001110e-01), infsup (5.000000000000001110e-01, 5.000000000000001110e-01)), infsup (-8.589934592000001907e+09, -1.0)));
%!test
%! assert (isequal (infsup (-4.294967296000000954e+09, -5.000000596046448864e-01) ./ infsup (5.000000000000001110e-01, 5.000000000000001110e-01), infsup (-8.589934592000000000e+09, -1.000000119209289329e+00)));
%! assert (isequal (rdivide (infsup (-4.294967296000000954e+09, -5.000000596046448864e-01), infsup (5.000000000000001110e-01, 5.000000000000001110e-01)), infsup (-8.589934592000000000e+09, -1.000000119209289329e+00)));
%!test
%! assert (isequal (infsup (-4.294967296000001907e+09, -5.000000596046448864e-01) ./ infsup (5.000000000000001110e-01, 5.000000000000001110e-01), infsup (-8.589934592000001907e+09, -1.000000119209289329e+00)));
%! assert (isequal (rdivide (infsup (-4.294967296000001907e+09, -5.000000596046448864e-01), infsup (5.000000000000001110e-01, 5.000000000000001110e-01)), infsup (-8.589934592000001907e+09, -1.000000119209289329e+00)));
%!test
%! assert (isequal (infsup (-5.688888888888888884e-01, 4.003199668773774219e+13) ./ infsup (-5.124095576030431000e+15, -5.124095576030431000e+15), infsup (-7.812500000000000000e-03, 1.110223024625156540e-16)));
%! assert (isequal (rdivide (infsup (-5.688888888888888884e-01, 4.003199668773774219e+13), infsup (-5.124095576030431000e+15, -5.124095576030431000e+15)), infsup (-7.812500000000000000e-03, 1.110223024625156540e-16)));
%!test
%! assert (isequal (infsup (-5.688888888888888884e-01, 5.000000000000001110e-01) ./ infsup (-5.124095576030431000e+15, -5.124095576030431000e+15), infsup (-9.757819552369542371e-17, 1.110223024625156540e-16)));
%! assert (isequal (rdivide (infsup (-5.688888888888888884e-01, 5.000000000000001110e-01), infsup (-5.124095576030431000e+15, -5.124095576030431000e+15)), infsup (-9.757819552369542371e-17, 1.110223024625156540e-16)));
%!test
%! assert (isequal (infsup (-1.0, 4.003199668773774219e+13) ./ infsup (-5.124095576030431000e+15, -5.124095576030431000e+15), infsup (-7.812500000000000000e-03, 1.951563910473908228e-16)));
%! assert (isequal (rdivide (infsup (-1.0, 4.003199668773774219e+13), infsup (-5.124095576030431000e+15, -5.124095576030431000e+15)), infsup (-7.812500000000000000e-03, 1.951563910473908228e-16)));
%!test
%! assert (isequal (infsup (-1.0, 5.000000000000001110e-01) ./ infsup (-5.124095576030431000e+15, -5.124095576030431000e+15), infsup (-9.757819552369542371e-17, 1.951563910473908228e-16)));
%! assert (isequal (rdivide (infsup (-1.0, 5.000000000000001110e-01), infsup (-5.124095576030431000e+15, -5.124095576030431000e+15)), infsup (-9.757819552369542371e-17, 1.951563910473908228e-16)));

## mpfi_d_sub

%!# special values
%!test
%! assert (isequal (infsup (-4.000000000000000286e-17, -4.000000000000000286e-17) - infsup (-inf, -7.0), infsup (6.999999999999999112e+00, inf)));
%! assert (isequal (minus (infsup (-4.000000000000000286e-17, -4.000000000000000286e-17), infsup (-inf, -7.0)), infsup (6.999999999999999112e+00, inf)));
%!test
%! assert (isequal (infsup (0.0, 0.0) - infsup (-inf, -7.0), infsup (7.0, inf)));
%! assert (isequal (minus (infsup (0.0, 0.0), infsup (-inf, -7.0)), infsup (7.0, inf)));
%!test
%! assert (isequal (infsup (4.000000000000000286e-17, 4.000000000000000286e-17) - infsup (-inf, -7.0), infsup (7.0, inf)));
%! assert (isequal (minus (infsup (4.000000000000000286e-17, 4.000000000000000286e-17), infsup (-inf, -7.0)), infsup (7.0, inf)));
%!test
%! assert (isequal (infsup (-8.192000000000000586e-14, -8.192000000000000586e-14) - infsup (-inf, 0.0), infsup (-8.192000000000000586e-14, inf)));
%! assert (isequal (minus (infsup (-8.192000000000000586e-14, -8.192000000000000586e-14), infsup (-inf, 0.0)), infsup (-8.192000000000000586e-14, inf)));
%!test
%! assert (isequal (infsup (0.0, 0.0) - infsup (-inf, 0.0), infsup (0.0, inf)));
%! assert (isequal (minus (infsup (0.0, 0.0), infsup (-inf, 0.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (infsup (8.192000000000000586e-14, 8.192000000000000586e-14) - infsup (-inf, 0.0), infsup (8.192000000000000586e-14, inf)));
%! assert (isequal (minus (infsup (8.192000000000000586e-14, 8.192000000000000586e-14), infsup (-inf, 0.0)), infsup (8.192000000000000586e-14, inf)));
%!test
%! assert (isequal (infsup (-1.600000000000000000e+18, -1.600000000000000000e+18) - infsup (-inf, 8.0), infsup (-1.600000000000000256e+18, inf)));
%! assert (isequal (minus (infsup (-1.600000000000000000e+18, -1.600000000000000000e+18), infsup (-inf, 8.0)), infsup (-1.600000000000000256e+18, inf)));
%!test
%! assert (isequal (infsup (0.0, 0.0) - infsup (-inf, 8.0), infsup (-8.0, inf)));
%! assert (isequal (minus (infsup (0.0, 0.0), infsup (-inf, 8.0)), infsup (-8.0, inf)));
%!test
%! assert (isequal (infsup (1.600000000000000000e+18, 1.600000000000000000e+18) - infsup (-inf, 8.0), infsup (1.599999999999999744e+18, inf)));
%! assert (isequal (minus (infsup (1.600000000000000000e+18, 1.600000000000000000e+18), infsup (-inf, 8.0)), infsup (1.599999999999999744e+18, inf)));
%!test
%! assert (isequal (infsup (-1.600000000000000114e-16, -1.600000000000000114e-16) - infsup (-inf, inf), infsup (-inf, inf)));
%! assert (isequal (minus (infsup (-1.600000000000000114e-16, -1.600000000000000114e-16), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (0.0e-17, 0.0e-17) - infsup (-inf, inf), infsup (-inf, inf)));
%! assert (isequal (minus (infsup (0.0e-17, 0.0e-17), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (1.600000000000000114e-16, 1.600000000000000114e-16) - infsup (-inf, inf), infsup (-inf, inf)));
%! assert (isequal (minus (infsup (1.600000000000000114e-16, 1.600000000000000114e-16), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-1.000000000000000072e-17, -1.000000000000000072e-17) - infsup (0.0, 0.0), infsup (-1.000000000000000072e-17, -1.000000000000000072e-17)));
%! assert (isequal (minus (infsup (-1.000000000000000072e-17, -1.000000000000000072e-17), infsup (0.0, 0.0)), infsup (-1.000000000000000072e-17, -1.000000000000000072e-17)));
%!test
%! assert (isequal (infsup (0.0, 0.0) - infsup (0.0, 0.0), infsup (0.0, 0.0)));
%! assert (isequal (minus (infsup (0.0, 0.0), infsup (0.0, 0.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (infsup (1.000000000000000072e-17, 1.000000000000000072e-17) - infsup (0.0, 0.0), infsup (1.000000000000000072e-17, 1.000000000000000072e-17)));
%! assert (isequal (minus (infsup (1.000000000000000072e-17, 1.000000000000000072e-17), infsup (0.0, 0.0)), infsup (1.000000000000000072e-17, 1.000000000000000072e-17)));
%!test
%! assert (isequal (infsup (-3.000000000000000061e-17, -3.000000000000000061e-17) - infsup (0.0, 8.0), infsup (-8.000000000000001776e+00, -3.000000000000000061e-17)));
%! assert (isequal (minus (infsup (-3.000000000000000061e-17, -3.000000000000000061e-17), infsup (0.0, 8.0)), infsup (-8.000000000000001776e+00, -3.000000000000000061e-17)));
%!test
%! assert (isequal (infsup (0.0, 0.0) - infsup (0.0, 8.0), infsup (-8.0, 0.0)));
%! assert (isequal (minus (infsup (0.0, 0.0), infsup (0.0, 8.0)), infsup (-8.0, 0.0)));
%!test
%! assert (isequal (infsup (3.000000000000000061e-17, 3.000000000000000061e-17) - infsup (0.0, 8.0), infsup (-8.0, 3.000000000000000061e-17)));
%! assert (isequal (minus (infsup (3.000000000000000061e-17, 3.000000000000000061e-17), infsup (0.0, 8.0)), infsup (-8.0, 3.000000000000000061e-17)));
%!test
%! assert (isequal (infsup (-7.000000000000000347e-17, -7.000000000000000347e-17) - infsup (0.0, inf), infsup (-inf, -7.000000000000000347e-17)));
%! assert (isequal (minus (infsup (-7.000000000000000347e-17, -7.000000000000000347e-17), infsup (0.0, inf)), infsup (-inf, -7.000000000000000347e-17)));
%!test
%! assert (isequal (infsup (0.0, 0.0) - infsup (0.0, inf), infsup (-inf, 0.0)));
%! assert (isequal (minus (infsup (0.0, 0.0), infsup (0.0, inf)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (infsup (-6.999999999999999114e-17, -6.999999999999999114e-17) - infsup (0.0, inf), infsup (-inf, -6.999999999999999114e-17)));
%! assert (isequal (minus (infsup (-6.999999999999999114e-17, -6.999999999999999114e-17), infsup (0.0, inf)), infsup (-inf, -6.999999999999999114e-17)));
%!# regular values
%!test
%! assert (isequal (infsup (-3.141592653589793116e+01, -3.141592653589793116e+01) - infsup (17.0, 32.0), infsup (-6.341592653589793116e+01, -4.841592653589793116e+01)));
%! assert (isequal (minus (infsup (-3.141592653589793116e+01, -3.141592653589793116e+01), infsup (17.0, 32.0)), infsup (-6.341592653589793116e+01, -4.841592653589793116e+01)));
%!test
%! assert (isequal (infsup (3.141592653589793116e+01, 3.141592653589793116e+01) - infsup (17.0, 3.141592653589793116e+01), infsup (0.0, 1.441592653589793116e+01)));
%! assert (isequal (minus (infsup (3.141592653589793116e+01, 3.141592653589793116e+01), infsup (17.0, 3.141592653589793116e+01)), infsup (0.0, 1.441592653589793116e+01)));
%!test
%! assert (isequal (infsup (1.570796326794896558e+01, 1.570796326794896558e+01) - infsup (1.570796326794896558e+01, 32.0), infsup (-1.629203673205103442e+01, 0.0)));
%! assert (isequal (minus (infsup (1.570796326794896558e+01, 1.570796326794896558e+01), infsup (1.570796326794896558e+01, 32.0)), infsup (-1.629203673205103442e+01, 0.0)));
%!test
%! assert (isequal (infsup (3.5, 3.5) - infsup (-3.202559735019019375e+14, -1.820444444444444443e+01), infsup (2.170444444444444443e+01, 3.202559735019054375e+14)));
%! assert (isequal (minus (infsup (3.5, 3.5), infsup (-3.202559735019019375e+14, -1.820444444444444443e+01)), infsup (2.170444444444444443e+01, 3.202559735019054375e+14)));
%!test
%! assert (isequal (infsup (3.5, 3.5) - infsup (-3.202559735019019375e+14, -7.111111111111111105e-02), infsup (3.571111111111110681e+00, 3.202559735019054375e+14)));
%! assert (isequal (minus (infsup (3.5, 3.5), infsup (-3.202559735019019375e+14, -7.111111111111111105e-02)), infsup (3.571111111111110681e+00, 3.202559735019054375e+14)));
%!test
%! assert (isequal (infsup (256.5, 256.5) - infsup (-1.137777777777777777e+00, 2.550000000000000000e+02), infsup (1.500000000000000000e+00, 2.576377777777777851e+02)));
%! assert (isequal (minus (infsup (256.5, 256.5), infsup (-1.137777777777777777e+00, 2.550000000000000000e+02)), infsup (1.500000000000000000e+00, 2.576377777777777851e+02)));
%!test
%! assert (isequal (infsup (4097.5, 4097.5) - infsup (2.713328551617526225e-166, 1.999999999999999778e+00), infsup (4.095500000000000000e+03, 4.097500000000000000e+03)));
%! assert (isequal (minus (infsup (4097.5, 4097.5), infsup (2.713328551617526225e-166, 1.999999999999999778e+00)), infsup (4.095500000000000000e+03, 4.097500000000000000e+03)));
%!test
%! assert (isequal (infsup (-3.5, -3.5) - infsup (-3.202559735019019375e+14, -1.820444444444444443e+01), infsup (1.470444444444444443e+01, 3.202559735018984375e+14)));
%! assert (isequal (minus (infsup (-3.5, -3.5), infsup (-3.202559735019019375e+14, -1.820444444444444443e+01)), infsup (1.470444444444444443e+01, 3.202559735018984375e+14)));
%!test
%! assert (isequal (infsup (-3.5, -3.5) - infsup (-3.202559735019019375e+14, -7.111111111111111105e-02), infsup (-3.428888888888889319e+00, 3.202559735018984375e+14)));
%! assert (isequal (minus (infsup (-3.5, -3.5), infsup (-3.202559735019019375e+14, -7.111111111111111105e-02)), infsup (-3.428888888888889319e+00, 3.202559735018984375e+14)));
%!test
%! assert (isequal (infsup (-256.5, -256.5) - infsup (-1.137777777777777777e+00, 2.550000000000000000e+02), infsup (-5.115000000000000000e+02, -2.553622222222222149e+02)));
%! assert (isequal (minus (infsup (-256.5, -256.5), infsup (-1.137777777777777777e+00, 2.550000000000000000e+02)), infsup (-5.115000000000000000e+02, -2.553622222222222149e+02)));
%!test
%! assert (isequal (infsup (-4097.5, -4097.5) - infsup (2.713328551617526225e-166, 1.999999999999999778e+00), infsup (-4.099500000000000000e+03, -4.097500000000000000e+03)));
%! assert (isequal (minus (infsup (-4097.5, -4097.5), infsup (2.713328551617526225e-166, 1.999999999999999778e+00)), infsup (-4.099500000000000000e+03, -4.097500000000000000e+03)));

## mpfi_exp

%!# special values
%!test
%! assert (isequal (exp (infsup (-inf, -7.0)), infsup (0.0, 9.118819655545162437e-04)));
%!test
%! assert (isequal (exp (infsup (-inf, 0.0)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (exp (infsup (-inf, +1.0)), infsup (0.0, 2.718281828459045535e+00)));
%!test
%! assert (isequal (exp (infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (exp (infsup (0.0, 0.0)), infsup (1.0, 1.0)));
%!test
%! assert (isequal (exp (infsup (0.0, +1.0)), infsup (1.0, 2.718281828459045535e+00)));
%!test
%! assert (isequal (exp (infsup (0.0, inf)), infsup (1.0, inf)));
%!# regular values
%!test
%! assert (isequal (exp (infsup (-123.0, -17.0)), infsup (3.817497188671174176e-54, 4.139937718785166831e-08)));
%!test
%! assert (isequal (exp (infsup (-0.125, 0.25)), infsup (8.824969025845953441e-01, 1.284025416687741616e+00)));
%!test
%! assert (isequal (exp (infsup (-0.125, 0.0)), infsup (8.824969025845953441e-01, 1.0)));
%!test
%! assert (isequal (exp (infsup (0.0, 0.25)), infsup (1.0, 1.284025416687741616e+00)));
%!test
%! assert (isequal (exp (infsup (7.105427357601001859e-14, 7.815970093361102045e-14)), infsup (1.000000000000071054e+00, 1.000000000000078382e+00)));

## mpfi_exp2

%!# special values
%!test
%! assert (isequal (pow2 (infsup (-inf, -1.0)), infsup (0.0, 0.5)));
%!test
%! assert (isequal (pow2 (infsup (-inf, 0.0)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (pow2 (infsup (-inf, 1.0)), infsup (0.0, 2.0)));
%!test
%! assert (isequal (pow2 (infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (pow2 (infsup (0.0, 0.0)), infsup (1.0, 1.0)));
%!test
%! assert (isequal (pow2 (infsup (0.0, +1.0)), infsup (1.0, 2.0)));
%!test
%! assert (isequal (pow2 (infsup (0.0, inf)), infsup (1.0, inf)));
%!# regular values
%!test
%! assert (isequal (pow2 (infsup (-123.0, -17.0)), infsup (9.403954806578300064e-38, 7.629394531250000000e-06)));
%!test
%! assert (isequal (pow2 (infsup (-7.0, 7.0)), infsup (7.812500000000000000e-03, 1.280000000000000000e+02)));
%!test
%! assert (isequal (pow2 (infsup (-0.125, 0.25)), infsup (9.170040432046712153e-01, 1.189207115002721249e+00)));
%!test
%! assert (isequal (pow2 (infsup (-0.125, 0.0)), infsup (9.170040432046712153e-01, 1.0)));
%!test
%! assert (isequal (pow2 (infsup (0.0, 0.25)), infsup (1.0, 1.189207115002721249e+00)));
%!test
%! assert (isequal (pow2 (infsup (7.105427357601001859e-14, 7.815970093361102045e-14)), infsup (1.000000000000049072e+00, 1.000000000000054179e+00)));

## mpfi_expm1

%!# special values
%!test
%! assert (isequal (expm1 (infsup (-inf, -7.0)), infsup (-1.0, -9.990881180344454160e-01)));
%!test
%! assert (isequal (expm1 (infsup (-inf, 0.0)), infsup (-1.0, 0.0)));
%!test
%! assert (isequal (expm1 (infsup (-inf, 1.0)), infsup (-1.0, 1.718281828459045313e+00)));
%!test
%! assert (isequal (expm1 (infsup (-inf, inf)), infsup (-1.0, inf)));
%!test
%! assert (isequal (expm1 (infsup (0.0, 0.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (expm1 (infsup (0.0, 1.0)), infsup (0.0, 1.718281828459045313e+00)));
%!test
%! assert (isequal (expm1 (infsup (0.0, inf)), infsup (0.0, inf)));
%!# regular values
%!test
%! assert (isequal (expm1 (infsup (-36.0, -36.0)), infsup (-9.999999999999997780e-01, -9.999999999999996669e-01)));
%!test
%! assert (isequal (expm1 (infsup (-0.125, 0.25)), infsup (-1.175030974154046004e-01, 2.840254166877415054e-01)));
%!test
%! assert (isequal (expm1 (infsup (-0.125, 0.0)), infsup (-1.175030974154046004e-01, 0.0)));
%!test
%! assert (isequal (expm1 (infsup (0.0, 0.25)), infsup (0.0, 2.840254166877415054e-01)));
%!test
%! assert (isequal (expm1 (infsup (7.105427357601001859e-14, 7.815970093361102045e-14)), infsup (7.105427357601254294e-14, 7.815970093361408754e-14)));

## mpfi_hypot

%!# special values
%!test
%! assert (isequal (hypot (infsup (-inf, -7.0), infsup (-1.0, 8.0)), infsup (7.0, inf)));
%!test
%! assert (isequal (hypot (infsup (-inf, 0.0), infsup (8.0, inf)), infsup (8.0, inf)));
%!test
%! assert (isequal (hypot (infsup (-inf, 8.0), infsup (0.0, 8.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (hypot (infsup (-inf, inf), infsup (0.0, 8.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (hypot (infsup (0.0, 0.0), infsup (-inf, -7.0)), infsup (7.0, inf)));
%!test
%! assert (isequal (hypot (infsup (0.0, 3.0), infsup (-4.0, 0.0)), infsup (0.0, 5.0)));
%!test
%! assert (isequal (hypot (infsup (0.0, 0.0), infsup (0.0, 8.0)), infsup (0.0, 8.0)));
%!test
%! assert (isequal (hypot (infsup (0.0, inf), infsup (0.0, 8.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (hypot (infsup (0.0, 0.0), infsup (8.0, inf)), infsup (8.0, inf)));
%!test
%! assert (isequal (hypot (infsup (0.0, 0.0), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (hypot (infsup (0.0, 5.0), infsup (0.0, 12.0)), infsup (0.0, 13.0)));
%!test
%! assert (isequal (hypot (infsup (0.0, 0.0), infsup (0.0, 0.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (hypot (infsup (0.0, inf), infsup (-7.0, 8.0)), infsup (0.0, inf)));
%!# regular values
%!test
%! assert (isequal (hypot (infsup (-12.0, -5.0), infsup (-35.0, -12.0)), infsup (13.0, 37.0)));
%!test
%! assert (isequal (hypot (infsup (6.0, 7.0), infsup (1.0, 24.0)), infsup (6.082762530298219339e+00, 25.0)));
%!test
%! assert (isequal (hypot (infsup (-4.0, +7.0), infsup (-25.0, 3.0)), infsup (0.0, 2.596150997149434048e+01)));
%!test
%! assert (isequal (hypot (infsup (6.082762530298219339e+00, 2.596150997149434048e+01), infsup (6.082762530298219339e+00, 2.596150997149434048e+01)), infsup (8.602325267042624901e+00, 3.671511950137164604e+01)));

## mpfi_intersect

%!# special values
%!test
%! assert (isequal (intersect (infsup (-inf, -7.0), infsup (-1.0, +8.0)), infsup));
%!test
%! assert (isequal (intersect (infsup (-inf, 0.0), infsup (+8.0, inf)), infsup));
%!test
%! assert (isequal (intersect (infsup (-inf, +8.0), infsup (0.0, +8.0)), infsup (0.0, +8.0)));
%!test
%! assert (isequal (intersect (infsup (-inf, inf), infsup (0.0, +8.0)), infsup (0.0, +8.0)));
%!test
%! assert (isequal (intersect (infsup (0.0, 0.0), infsup (-inf, -7.0)), infsup));
%!test
%! assert (isequal (intersect (infsup (0.0, +8.0), infsup (-7.0, 0.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (intersect (infsup (0.0, 0.0), infsup (0.0, +8.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (intersect (infsup (0.0, inf), infsup (0.0, +8.0)), infsup (0.0, +8.0)));
%!test
%! assert (isequal (intersect (infsup (0.0, 0.0), infsup (+8.0, inf)), infsup));
%!test
%! assert (isequal (intersect (infsup (0.0, 0.0), infsup (-inf, inf)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (intersect (infsup (0.0, +8.0), infsup (-7.0, +8.0)), infsup (0.0, +8.0)));
%!test
%! assert (isequal (intersect (infsup (0.0, 0.0), infsup (0.0, 0.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (intersect (infsup (0.0, inf), infsup (0.0, +8.0)), infsup (0.0, +8.0)));
%!# regular values
%!test
%! assert (isequal (intersect (infsup (1.800000000000000000e+01, 1.440000000000000000e+02), infsup (-1.300000000000000000e+01, 5.200000000000000000e+01)), infsup (1.800000000000000000e+01, 5.200000000000000000e+01)));

## mpfi_inv

%!# special values
%!test
%! assert (isequal (1 ./ infsup (-inf, -.25), infsup (-4.0, 0.0)));
%! assert (isequal (rdivide (1, infsup (-inf, -.25)), infsup (-4.0, 0.0)));
%! assert (isequal (pown (infsup (-inf, -.25), -1), infsup (-4.0, 0.0)));
%! assert (isequal (infsup (-inf, -.25) .^ -1, infsup (-4.0, 0.0)));
%! assert (isequal (power (infsup (-inf, -.25), -1), infsup (-4.0, 0.0)));
%! assert (isequal (infsup (-inf, -.25) ^ -1, infsup (-4.0, 0.0)));
%! assert (isequal (mpower (infsup (-inf, -.25), -1), infsup (-4.0, 0.0)));
%!test
%! assert (isequal (1 ./ infsup (-inf, 0.0), infsup (-inf, 0.0)));
%! assert (isequal (rdivide (1, infsup (-inf, 0.0)), infsup (-inf, 0.0)));
%! assert (isequal (pown (infsup (-inf, 0.0), -1), infsup (-inf, 0.0)));
%! assert (isequal (infsup (-inf, 0.0) .^ -1, infsup (-inf, 0.0)));
%! assert (isequal (power (infsup (-inf, 0.0), -1), infsup (-inf, 0.0)));
%! assert (isequal (infsup (-inf, 0.0) ^ -1, infsup (-inf, 0.0)));
%! assert (isequal (mpower (infsup (-inf, 0.0), -1), infsup (-inf, 0.0)));
%!test
%! assert (isequal (1 ./ infsup (-inf, +4.0), infsup (-inf, inf)));
%! assert (isequal (rdivide (1, infsup (-inf, +4.0)), infsup (-inf, inf)));
%! assert (isequal (pown (infsup (-inf, +4.0), -1), infsup (-inf, inf)));
%! assert (isequal (infsup (-inf, +4.0) .^ -1, infsup (-inf, inf)));
%! assert (isequal (power (infsup (-inf, +4.0), -1), infsup (-inf, inf)));
%! assert (isequal (infsup (-inf, +4.0) ^ -1, infsup (-inf, inf)));
%! assert (isequal (mpower (infsup (-inf, +4.0), -1), infsup (-inf, inf)));
%!test
%! assert (isequal (1 ./ infsup (-inf, inf), infsup (-inf, inf)));
%! assert (isequal (rdivide (1, infsup (-inf, inf)), infsup (-inf, inf)));
%! assert (isequal (pown (infsup (-inf, inf), -1), infsup (-inf, inf)));
%! assert (isequal (infsup (-inf, inf) .^ -1, infsup (-inf, inf)));
%! assert (isequal (power (infsup (-inf, inf), -1), infsup (-inf, inf)));
%! assert (isequal (infsup (-inf, inf) ^ -1, infsup (-inf, inf)));
%! assert (isequal (mpower (infsup (-inf, inf), -1), infsup (-inf, inf)));
%!test
%! assert (isequal (1 ./ infsup (0.0, 0.0), infsup));
%! assert (isequal (rdivide (1, infsup (0.0, 0.0)), infsup));
%! assert (isequal (pown (infsup (0.0, 0.0), -1), infsup));
%! assert (isequal (infsup (0.0, 0.0) .^ -1, infsup));
%! assert (isequal (power (infsup (0.0, 0.0), -1), infsup));
%! assert (isequal (infsup (0.0, 0.0) ^ -1, infsup));
%! assert (isequal (mpower (infsup (0.0, 0.0), -1), infsup));
%!test
%! assert (isequal (1 ./ infsup (0.0, +2.0), infsup (+.5, inf)));
%! assert (isequal (rdivide (1, infsup (0.0, +2.0)), infsup (+.5, inf)));
%! assert (isequal (pown (infsup (0.0, +2.0), -1), infsup (+.5, inf)));
%! assert (isequal (infsup (0.0, +2.0) .^ -1, infsup (+.5, inf)));
%! assert (isequal (power (infsup (0.0, +2.0), -1), infsup (+.5, inf)));
%! assert (isequal (infsup (0.0, +2.0) ^ -1, infsup (+.5, inf)));
%! assert (isequal (mpower (infsup (0.0, +2.0), -1), infsup (+.5, inf)));
%!test
%! assert (isequal (1 ./ infsup (0.0, inf), infsup (0.0, inf)));
%! assert (isequal (rdivide (1, infsup (0.0, inf)), infsup (0.0, inf)));
%! assert (isequal (pown (infsup (0.0, inf), -1), infsup (0.0, inf)));
%! assert (isequal (infsup (0.0, inf) .^ -1, infsup (0.0, inf)));
%! assert (isequal (power (infsup (0.0, inf), -1), infsup (0.0, inf)));
%! assert (isequal (infsup (0.0, inf) ^ -1, infsup (0.0, inf)));
%! assert (isequal (mpower (infsup (0.0, inf), -1), infsup (0.0, inf)));
%!# regular values
%!test
%! assert (isequal (1 ./ infsup (-8.0, -2.0), infsup (-.5, -0.125)));
%! assert (isequal (rdivide (1, infsup (-8.0, -2.0)), infsup (-.5, -0.125)));
%! assert (isequal (pown (infsup (-8.0, -2.0), -1), infsup (-.5, -0.125)));
%! assert (isequal (infsup (-8.0, -2.0) .^ -1, infsup (-.5, -0.125)));
%! assert (isequal (power (infsup (-8.0, -2.0), -1), infsup (-.5, -0.125)));
%! assert (isequal (infsup (-8.0, -2.0) ^ -1, infsup (-.5, -0.125)));
%! assert (isequal (mpower (infsup (-8.0, -2.0), -1), infsup (-.5, -0.125)));
%!test
%! assert (isequal (1 ./ infsup (6.250000000000000000e-02, 6.329046211334584671e-01), infsup (1.580016903983283205e+00, 1.600000000000000000e+01)));
%! assert (isequal (rdivide (1, infsup (6.250000000000000000e-02, 6.329046211334584671e-01)), infsup (1.580016903983283205e+00, 1.600000000000000000e+01)));
%! assert (isequal (pown (infsup (6.250000000000000000e-02, 6.329046211334584671e-01), -1), infsup (1.580016903983283205e+00, 1.600000000000000000e+01)));
%! assert (isequal (infsup (6.250000000000000000e-02, 6.329046211334584671e-01) .^ -1, infsup (1.580016903983283205e+00, 1.600000000000000000e+01)));
%! assert (isequal (power (infsup (6.250000000000000000e-02, 6.329046211334584671e-01), -1), infsup (1.580016903983283205e+00, 1.600000000000000000e+01)));
%! assert (isequal (infsup (6.250000000000000000e-02, 6.329046211334584671e-01) ^ -1, infsup (1.580016903983283205e+00, 1.600000000000000000e+01)));
%! assert (isequal (mpower (infsup (6.250000000000000000e-02, 6.329046211334584671e-01), -1), infsup (1.580016903983283205e+00, 1.600000000000000000e+01)));
%!test
%! assert (isequal (1 ./ infsup (2.026869327694375278e-01, +64.0), infsup (0.015625, 4.933717168326436031e+00)));
%! assert (isequal (rdivide (1, infsup (2.026869327694375278e-01, +64.0)), infsup (0.015625, 4.933717168326436031e+00)));
%! assert (isequal (pown (infsup (2.026869327694375278e-01, +64.0), -1), infsup (0.015625, 4.933717168326436031e+00)));
%! assert (isequal (infsup (2.026869327694375278e-01, +64.0) .^ -1, infsup (0.015625, 4.933717168326436031e+00)));
%! assert (isequal (power (infsup (2.026869327694375278e-01, +64.0), -1), infsup (0.015625, 4.933717168326436031e+00)));
%! assert (isequal (infsup (2.026869327694375278e-01, +64.0) ^ -1, infsup (0.015625, 4.933717168326436031e+00)));
%! assert (isequal (mpower (infsup (2.026869327694375278e-01, +64.0), -1), infsup (0.015625, 4.933717168326436031e+00)));
%!test
%! assert (isequal (1 ./ infsup (-6.816974503452348788e-01, -1.950973066082791751e-01), infsup (-5.125647387884359141e+00, -1.466926419474747556e+00)));
%! assert (isequal (rdivide (1, infsup (-6.816974503452348788e-01, -1.950973066082791751e-01)), infsup (-5.125647387884359141e+00, -1.466926419474747556e+00)));
%! assert (isequal (pown (infsup (-6.816974503452348788e-01, -1.950973066082791751e-01), -1), infsup (-5.125647387884359141e+00, -1.466926419474747556e+00)));
%! assert (isequal (infsup (-6.816974503452348788e-01, -1.950973066082791751e-01) .^ -1, infsup (-5.125647387884359141e+00, -1.466926419474747556e+00)));
%! assert (isequal (power (infsup (-6.816974503452348788e-01, -1.950973066082791751e-01), -1), infsup (-5.125647387884359141e+00, -1.466926419474747556e+00)));
%! assert (isequal (infsup (-6.816974503452348788e-01, -1.950973066082791751e-01) ^ -1, infsup (-5.125647387884359141e+00, -1.466926419474747556e+00)));
%! assert (isequal (mpower (infsup (-6.816974503452348788e-01, -1.950973066082791751e-01), -1), infsup (-5.125647387884359141e+00, -1.466926419474747556e+00)));

## mpfi_is_neg

%!# special values
%!test
%! assert (precedes (infsup (-inf, -8.0), infsup (0.0, 0.0)));
%!test
%! assert (precedes (infsup (-inf, 0.0), infsup (0.0, 0.0)));
%!test
%! assert (isequal (precedes (infsup (-inf, 5.0), infsup (0.0, 0.0)), false));
%!test
%! assert (isequal (precedes (infsup (-inf, inf), infsup (0.0, 0.0)), false));
%!test
%! assert (precedes (infsup (-8.0, 0.0), infsup (0.0, 0.0)));
%!test
%! assert (precedes (infsup (0.0, 0.0), infsup (0.0, 0.0)));
%!test
%! assert (isequal (precedes (infsup (0.0, 5.0), infsup (0.0, 0.0)), false));
%!test
%! assert (isequal (precedes (infsup (0.0, inf), infsup (0.0, 0.0)), false));
%!test
%! assert (isequal (precedes (infsup (5.0, inf), infsup (0.0, 0.0)), false));
%!# regular values
%!test
%! assert (precedes (infsup (-34.0, -17.0), infsup (0.0, 0.0)));
%!test
%! assert (precedes (infsup (-8.0, -1.0), infsup (0.0, 0.0)));
%!test
%! assert (isequal (precedes (infsup (-34.0, 17.0), infsup (0.0, 0.0)), false));
%!test
%! assert (isequal (precedes (infsup (-3.141592653589793116e+00, 3.141592653589793560e+00), infsup (0.0, 0.0)), false));
%!test
%! assert (isequal (precedes (infsup (3.141592653589793116e+00, 3.141592653589793560e+00), infsup (0.0, 0.0)), false));
%!test
%! assert (isequal (precedes (infsup (+8.0, 5.070602400912906347e+30), infsup (0.0, 0.0)), false));
%!test
%! assert (isequal (precedes (infsup (9.999999999999998890e-01, 2.0), infsup (0.0, 0.0)), false));

## mpfi_is_nonneg

%!# special values
%!test
%! assert (isequal (le (infsup (0.0, 0.0), infsup (-inf, -8.0)), false));
%! assert (isequal (infsup (0.0, 0.0) <= infsup (-inf, -8.0), false));
%!test
%! assert (isequal (le (infsup (0.0, 0.0), infsup (-inf, 0.0)), false));
%! assert (isequal (infsup (0.0, 0.0) <= infsup (-inf, 0.0), false));
%!test
%! assert (isequal (le (infsup (0.0, 0.0), infsup (-inf, 5.0)), false));
%! assert (isequal (infsup (0.0, 0.0) <= infsup (-inf, 5.0), false));
%!test
%! assert (isequal (le (infsup (0.0, 0.0), infsup (-inf, inf)), false));
%! assert (isequal (infsup (0.0, 0.0) <= infsup (-inf, inf), false));
%!test
%! assert (isequal (le (infsup (0.0, 0.0), infsup (-8.0, 0.0)), false));
%! assert (isequal (infsup (0.0, 0.0) <= infsup (-8.0, 0.0), false));
%!test
%! assert (le (infsup (0.0, 0.0), infsup (0.0, 0.0)));
%! assert (infsup (0.0, 0.0) <= infsup (0.0, 0.0));
%!test
%! assert (le (infsup (0.0, 0.0), infsup (0.0, 5.0)));
%! assert (infsup (0.0, 0.0) <= infsup (0.0, 5.0));
%!test
%! assert (le (infsup (0.0, 0.0), infsup (0.0, inf)));
%! assert (infsup (0.0, 0.0) <= infsup (0.0, inf));
%!test
%! assert (le (infsup (0.0, 0.0), infsup (5.0, inf)));
%! assert (infsup (0.0, 0.0) <= infsup (5.0, inf));
%!# regular values
%!test
%! assert (isequal (le (infsup (0.0, 0.0), infsup (-34.0, -17.0)), false));
%! assert (isequal (infsup (0.0, 0.0) <= infsup (-34.0, -17.0), false));
%!test
%! assert (isequal (le (infsup (0.0, 0.0), infsup (-8.0, -1.0)), false));
%! assert (isequal (infsup (0.0, 0.0) <= infsup (-8.0, -1.0), false));
%!test
%! assert (isequal (le (infsup (0.0, 0.0), infsup (-34.0, 17.0)), false));
%! assert (isequal (infsup (0.0, 0.0) <= infsup (-34.0, 17.0), false));
%!test
%! assert (isequal (le (infsup (0.0, 0.0), infsup (-3.141592653589793116e+00, 3.141592653589793560e+00)), false));
%! assert (isequal (infsup (0.0, 0.0) <= infsup (-3.141592653589793116e+00, 3.141592653589793560e+00), false));
%!test
%! assert (le (infsup (0.0, 0.0), infsup (3.141592653589793116e+00, 3.141592653589793560e+00)));
%! assert (infsup (0.0, 0.0) <= infsup (3.141592653589793116e+00, 3.141592653589793560e+00));
%!test
%! assert (le (infsup (0.0, 0.0), infsup (+8.0, 5.070602400912906347e+30)));
%! assert (infsup (0.0, 0.0) <= infsup (+8.0, 5.070602400912906347e+30));
%!test
%! assert (le (infsup (0.0, 0.0), infsup (9.999999999999998890e-01, 2.0)));
%! assert (infsup (0.0, 0.0) <= infsup (9.999999999999998890e-01, 2.0));

## mpfi_is_nonpos

%!# special values
%!test
%! assert (le (infsup (-inf, -8.0), infsup (0.0, 0.0)));
%! assert (infsup (-inf, -8.0) <= infsup (0.0, 0.0));
%!test
%! assert (le (infsup (-inf, 0.0), infsup (0.0, 0.0)));
%! assert (infsup (-inf, 0.0) <= infsup (0.0, 0.0));
%!test
%! assert (isequal (le (infsup (-inf, 5.0), infsup (0.0, 0.0)), false));
%! assert (isequal (infsup (-inf, 5.0) <= infsup (0.0, 0.0), false));
%!test
%! assert (isequal (le (infsup (-inf, inf), infsup (0.0, 0.0)), false));
%! assert (isequal (infsup (-inf, inf) <= infsup (0.0, 0.0), false));
%!test
%! assert (le (infsup (-8.0, 0.0), infsup (0.0, 0.0)));
%! assert (infsup (-8.0, 0.0) <= infsup (0.0, 0.0));
%!test
%! assert (le (infsup (0.0, 0.0), infsup (0.0, 0.0)));
%! assert (infsup (0.0, 0.0) <= infsup (0.0, 0.0));
%!test
%! assert (isequal (le (infsup (0.0, 5.0), infsup (0.0, 0.0)), false));
%! assert (isequal (infsup (0.0, 5.0) <= infsup (0.0, 0.0), false));
%!test
%! assert (isequal (le (infsup (0.0, inf), infsup (0.0, 0.0)), false));
%! assert (isequal (infsup (0.0, inf) <= infsup (0.0, 0.0), false));
%!test
%! assert (isequal (le (infsup (5.0, inf), infsup (0.0, 0.0)), false));
%! assert (isequal (infsup (5.0, inf) <= infsup (0.0, 0.0), false));
%!# regular values
%!test
%! assert (le (infsup (-34.0, -17.0), infsup (0.0, 0.0)));
%! assert (infsup (-34.0, -17.0) <= infsup (0.0, 0.0));
%!test
%! assert (le (infsup (-8.0, -1.0), infsup (0.0, 0.0)));
%! assert (infsup (-8.0, -1.0) <= infsup (0.0, 0.0));
%!test
%! assert (isequal (le (infsup (-34.0, 17.0), infsup (0.0, 0.0)), false));
%! assert (isequal (infsup (-34.0, 17.0) <= infsup (0.0, 0.0), false));
%!test
%! assert (isequal (le (infsup (-3.141592653589793116e+00, 3.141592653589793560e+00), infsup (0.0, 0.0)), false));
%! assert (isequal (infsup (-3.141592653589793116e+00, 3.141592653589793560e+00) <= infsup (0.0, 0.0), false));
%!test
%! assert (isequal (le (infsup (3.141592653589793116e+00, 3.141592653589793560e+00), infsup (0.0, 0.0)), false));
%! assert (isequal (infsup (3.141592653589793116e+00, 3.141592653589793560e+00) <= infsup (0.0, 0.0), false));
%!test
%! assert (isequal (le (infsup (8.0, 5.070602400912906347e+30), infsup (0.0, 0.0)), false));
%! assert (isequal (infsup (8.0, 5.070602400912906347e+30) <= infsup (0.0, 0.0), false));
%!test
%! assert (isequal (le (infsup (9.999999999999998890e-01, 2.0), infsup (0.0, 0.0)), false));
%! assert (isequal (infsup (9.999999999999998890e-01, 2.0) <= infsup (0.0, 0.0), false));

## mpfi_is_pos

%!# special values
%!test
%! assert (isequal (precedes (infsup (0.0, 0.0), infsup (-inf, -8.0)), false));
%!test
%! assert (isequal (precedes (infsup (0.0, 0.0), infsup (-inf, 0.0)), false));
%!test
%! assert (isequal (precedes (infsup (0.0, 0.0), infsup (-inf, 5.0)), false));
%!test
%! assert (isequal (precedes (infsup (0.0, 0.0), infsup (-inf, inf)), false));
%!test
%! assert (isequal (precedes (infsup (0.0, 0.0), infsup (-8.0, 0.0)), false));
%!test
%! assert (precedes (infsup (0.0, 0.0), infsup (0.0, 0.0)));
%!test
%! assert (precedes (infsup (0.0, 0.0), infsup (0.0, 5.0)));
%!test
%! assert (precedes (infsup (0.0, 0.0), infsup (0.0, inf)));
%!test
%! assert (precedes (infsup (0.0, 0.0), infsup (5.0, inf)));
%!# regular values
%!test
%! assert (isequal (precedes (infsup (0.0, 0.0), infsup (-34.0, -17.0)), false));
%!test
%! assert (isequal (precedes (infsup (0.0, 0.0), infsup (-8.0, -1.0)), false));
%!test
%! assert (isequal (precedes (infsup (0.0, 0.0), infsup (-34.0, 17.0)), false));
%!test
%! assert (isequal (precedes (infsup (0.0, 0.0), infsup (-3.141592653589793116e+00, 3.141592653589793560e+00)), false));
%!test
%! assert (precedes (infsup (0.0, 0.0), infsup (3.141592653589793116e+00, 3.141592653589793560e+00)));
%!test
%! assert (precedes (infsup (0.0, 0.0), infsup (+8.0, 5.070602400912906347e+30)));
%!test
%! assert (precedes (infsup (0.0, 0.0), infsup (9.999999999999998890e-01, 2.0)));

## mpfi_is_strictly_neg

%!# special values
%!test
%! assert (strictprecedes (infsup (-inf, -8.0), infsup (0.0, 0.0)));
%!test
%! assert (isequal (strictprecedes (infsup (-inf, 0.0), infsup (0.0, 0.0)), false));
%!test
%! assert (isequal (strictprecedes (infsup (-inf, 5.0), infsup (0.0, 0.0)), false));
%!test
%! assert (isequal (strictprecedes (infsup (-inf, inf), infsup (0.0, 0.0)), false));
%!test
%! assert (isequal (strictprecedes (infsup (-8.0, 0.0), infsup (0.0, 0.0)), false));
%!test
%! assert (isequal (strictprecedes (infsup (0.0, 0.0), infsup (0.0, 0.0)), false));
%!test
%! assert (isequal (strictprecedes (infsup (0.0, 5.0), infsup (0.0, 0.0)), false));
%!test
%! assert (isequal (strictprecedes (infsup (0.0, inf), infsup (0.0, 0.0)), false));
%!test
%! assert (isequal (strictprecedes (infsup (5.0, inf), infsup (0.0, 0.0)), false));
%!# regular values
%!test
%! assert (strictprecedes (infsup (-34.0, -17.0), infsup (0.0, 0.0)));
%!test
%! assert (strictprecedes (infsup (-8.0, -1.0), infsup (0.0, 0.0)));
%!test
%! assert (isequal (strictprecedes (infsup (-34.0, 17.0), infsup (0.0, 0.0)), false));
%!test
%! assert (isequal (strictprecedes (infsup (-3.141592653589793116e+00, 3.141592653589793560e+00), infsup (0.0, 0.0)), false));
%!test
%! assert (isequal (strictprecedes (infsup (3.141592653589793116e+00, 3.141592653589793560e+00), infsup (0.0, 0.0)), false));
%!test
%! assert (isequal (strictprecedes (infsup (+8.0, 5.070602400912906347e+30), infsup (0.0, 0.0)), false));
%!test
%! assert (isequal (strictprecedes (infsup (9.999999999999998890e-01, 2.0), infsup (0.0, 0.0)), false));

## mpfi_is_strictly_pos

%!# special values
%!test
%! assert (isequal (strictprecedes (infsup (0.0, 0.0), infsup (-inf, -8.0)), false));
%!test
%! assert (isequal (strictprecedes (infsup (0.0, 0.0), infsup (-inf, 0.0)), false));
%!test
%! assert (isequal (strictprecedes (infsup (0.0, 0.0), infsup (-inf, 5.0)), false));
%!test
%! assert (isequal (strictprecedes (infsup (0.0, 0.0), infsup (-inf, inf)), false));
%!test
%! assert (isequal (strictprecedes (infsup (0.0, 0.0), infsup (-8.0, 0.0)), false));
%!test
%! assert (isequal (strictprecedes (infsup (0.0, 0.0), infsup (0.0, 0.0)), false));
%!test
%! assert (isequal (strictprecedes (infsup (0.0, 0.0), infsup (0.0, 5.0)), false));
%!test
%! assert (isequal (strictprecedes (infsup (0.0, 0.0), infsup (0.0, inf)), false));
%!test
%! assert (strictprecedes (infsup (0.0, 0.0), infsup (5.0, inf)));
%!# regular values
%!test
%! assert (isequal (strictprecedes (infsup (0.0, 0.0), infsup (-34.0, -17.0)), false));
%!test
%! assert (isequal (strictprecedes (infsup (0.0, 0.0), infsup (-8.0, -1.0)), false));
%!test
%! assert (isequal (strictprecedes (infsup (0.0, 0.0), infsup (-34.0, 17.0)), false));
%!test
%! assert (isequal (strictprecedes (infsup (0.0, 0.0), infsup (-3.141592653589793116e+00, 3.141592653589793560e+00)), false));
%!test
%! assert (strictprecedes (infsup (0.0, 0.0), infsup (3.141592653589793116e+00, 3.141592653589793560e+00)));
%!test
%! assert (strictprecedes (infsup (0.0, 0.0), infsup (+8.0, 5.070602400912906347e+30)));
%!test
%! assert (strictprecedes (infsup (0.0, 0.0), infsup (9.999999999999998890e-01, 2.0)));

## mpfi_log

%!# special values
%!test
%! assert (isequal (log (infsup (0.0, +1.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (log (infsup (0.0, inf)), infsup (-inf, inf)));
%!# regular values
%!test
%! assert (isequal (log (infsup (+1.0, +1.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (log (infsup (6.245333006274822998e+10, 3.502953474593552856e+11)), infsup (2.485768539575924052e+01, 2.658204248547260207e+01)));
%!test
%! assert (isequal (log (infsup (7.112834182118892290e-01, +1.0)), infsup (-3.406843094616900380e-01, 0.0)));
%!test
%! assert (isequal (log (infsup (+1.0, 1.164158665593125820e+09)), infsup (0.0, 2.087526448761322229e+01)));
%!test
%! assert (isequal (log (infsup (2.045368051078361511e+10, 6.649390526214926758e+11)), infsup (2.374142867931890777e+01, 2.722296122320888756e+01)));

## mpfi_log1p

%!# special values
%!test
%! assert (isequal (log1p (infsup (-1.0, 0.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (log1p (infsup (0.0, 0.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (log1p (infsup (0.0, 1.0)), infsup (0.0, 6.931471805599453972e-01)));
%!test
%! assert (isequal (log1p (infsup (0.0, inf)), infsup (0.0, inf)));
%!# regular values
%!test
%! assert (isequal (log1p (infsup (-7.112834182118892290e-01, 0.0)), infsup (-1.242309757910986745e+00, 0.0)));
%!test
%! assert (isequal (log1p (infsup (0.0, 1.164158665593125820e+09)), infsup (0.0, 2.087526448847221161e+01)));
%!test
%! assert (isequal (log1p (infsup (2.045368051078361511e+10, 6.649390526214926758e+11)), infsup (2.374142867936779666e+01, 2.722296122321039036e+01)));

## mpfi_log2

%!# special values
%!test
%! assert (isequal (log2 (infsup (0.0, +1.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (log2 (infsup (0.0, inf)), infsup (-inf, inf)));
%!# regular values
%!test
%! assert (isequal (log2 (infsup (1.0, 1.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (log2 (infsup (7.112834182118892290e-01, 1.0)), infsup (-4.915035637690611248e-01, 0.0)));
%!test
%! assert (isequal (log2 (infsup (1.0, 1.164158665593125820e+09)), infsup (0.0, 3.011664055352508385e+01)));
%!test
%! assert (isequal (log2 (infsup (2.045368051078361511e+10, 6.649390526214926758e+11)), infsup (3.425164141927239569e+01, 3.927443115503601234e+01)));

## mpfi_log10

%!# special values
%!test
%! assert (isequal (log10 (infsup (0.0, 1.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (log10 (infsup (0.0, inf)), infsup (-inf, inf)));
%!# regular values
%!test
%! assert (isequal (log10 (infsup (1.0, 1.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (log10 (infsup (6.245333006274822998e+10, 3.502953474593552856e+11)), infsup (1.079555560026529015e+01, 1.154443436915855159e+01)));
%!test
%! assert (isequal (log10 (infsup (7.112834182118892290e-01, 1.0)), infsup (-1.479573156702317926e-01, 0.0)));
%!test
%! assert (isequal (log10 (infsup (100.0, 1.164158665593125820e+09)), infsup (2.0, 9.066012175241336735e+00)));
%!test
%! assert (isequal (log10 (infsup (2.045368051078361511e+10, 6.649390526214926758e+11)), infsup (1.031077146792780930e+01, 1.182278184030581869e+01)));

## mpfi_mag

%!# special values
%!test
%! assert (isequal (mag (infsup (-inf, -8.0)), inf));
%!test
%! assert (isequal (mag (infsup (-inf, 0.0)), inf));
%!test
%! assert (isequal (mag (infsup (-inf, 5.0)), inf));
%!test
%! assert (isequal (mag (infsup (-inf, inf)), inf));
%!test
%! assert (isequal (mag (infsup (-inf, 0.0)), inf));
%!test
%! assert (isequal (mag (infsup (-8.0, 0.0)), +8));
%!test
%! assert (isequal (mag (infsup (0.0, 0.0)), +0));
%!test
%! assert (isequal (mag (infsup (0.0, 5.0)), +5));
%!test
%! assert (isequal (mag (infsup (0.0, inf)), inf));
%!# regular values
%!test
%! assert (isequal (mag (infsup (-34.0, -17.0)), 34));

## mpfi_mid

%!# special values
%!test
%! assert (isequal (mid (infsup (-8.0, 0.0)), -4));
%!test
%! assert (isequal (mid (infsup (0.0, 0.0)), +0));
%!test
%! assert (isequal (mid (infsup (0.0, 5.0)), +2.5));
%!# regular values
%!test
%! assert (isequal (mid (infsup (-34.0, -17.0)), -2.550000000000000000e+01));
%!test
%! assert (isequal (mid (infsup (-34.0, 17.0)), -8.5));
%!test
%! assert (isequal (mid (infsup (0.0, 8.006399337547525000e+13)), 4.003199668773762500e+13));
%!test
%! assert (isequal (mid (infsup (3.141592653589793116e+00, 3.141592653589793560e+00)), 3.141592653589793116e+00));
%!test
%! assert (isequal (mid (infsup (-3.141592653589793560e+00, -3.141592653589793116e+00)), -3.141592653589793116e+00));
%!test
%! assert (isequal (mid (infsup (-4.0, -9.999999999999986677e-01)), -2.499999999999999112e+00));
%!test
%! assert (isequal (mid (infsup (-8.0, -9.999999999999977796e-01)), -4.499999999999999112e+00));
%!test
%! assert (isequal (mid (infsup (-9.999999999999998890e-01, 2.0)), 0.5));

## mpfi_mig

%!# special values
%!test
%! assert (isequal (mig (infsup (-inf, -8.0)), 8));
%!test
%! assert (isequal (mig (infsup (-inf, 0.0)), +0));
%!test
%! assert (isequal (mig (infsup (-inf, 5.0)), +0));
%!test
%! assert (isequal (mig (infsup (-inf, inf)), +0));
%!test
%! assert (isequal (mig (infsup (-inf, 0.0)), +0));
%!test
%! assert (isequal (mig (infsup (-8.0, 0.0)), +0));
%!test
%! assert (isequal (mig (infsup (0.0, 0.0)), +0));
%!test
%! assert (isequal (mig (infsup (0.0, 5.0)), +0));
%!test
%! assert (isequal (mig (infsup (0.0, inf)), +0));
%!# regular values
%!test
%! assert (isequal (mig (infsup (-34.0, -17.0)), 17));

## mpfi_mul

%!# special values
%!test
%! assert (isequal (infsup (-inf, -7.0) .* infsup (-1.0, +8.0), infsup (-inf, inf)));
%! assert (isequal (times (infsup (-inf, -7.0), infsup (-1.0, +8.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-inf, 0.0) .* infsup (+8.0, inf), infsup (-inf, 0.0)));
%! assert (isequal (times (infsup (-inf, 0.0), infsup (+8.0, inf)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (infsup (-inf, +8.0) .* infsup (0.0, +8.0), infsup (-inf, +64.0)));
%! assert (isequal (times (infsup (-inf, +8.0), infsup (0.0, +8.0)), infsup (-inf, +64.0)));
%!test
%! assert (isequal (infsup (-inf, inf) .* infsup (0.0, 0.0), infsup (0.0, 0.0)));
%! assert (isequal (times (infsup (-inf, inf), infsup (0.0, 0.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (infsup (-inf, inf) .* infsup (0.0, +8.0), infsup (-inf, inf)));
%! assert (isequal (times (infsup (-inf, inf), infsup (0.0, +8.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (0.0, 0.0) .* infsup (-inf, -7.0), infsup (0.0, 0.0)));
%! assert (isequal (times (infsup (0.0, 0.0), infsup (-inf, -7.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (infsup (0.0, +8.0) .* infsup (-7.0, 0.0), infsup (-56.0, 0.0)));
%! assert (isequal (times (infsup (0.0, +8.0), infsup (-7.0, 0.0)), infsup (-56.0, 0.0)));
%!test
%! assert (isequal (infsup (0.0, 0.0) .* infsup (0.0, +8.0), infsup (0.0, 0.0)));
%! assert (isequal (times (infsup (0.0, 0.0), infsup (0.0, +8.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (infsup (0.0, inf) .* infsup (0.0, +8.0), infsup (0.0, inf)));
%! assert (isequal (times (infsup (0.0, inf), infsup (0.0, +8.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (infsup (0.0, 0.0) .* infsup (+8.0, inf), infsup (0.0, 0.0)));
%! assert (isequal (times (infsup (0.0, 0.0), infsup (+8.0, inf)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (infsup (0.0, 0.0) .* infsup (-inf, inf), infsup (0.0, 0.0)));
%! assert (isequal (times (infsup (0.0, 0.0), infsup (-inf, inf)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (infsup (0.0, +8.0) .* infsup (-7.0, +8.0), infsup (-56.0, +64.0)));
%! assert (isequal (times (infsup (0.0, +8.0), infsup (-7.0, +8.0)), infsup (-56.0, +64.0)));
%!test
%! assert (isequal (infsup (0.0, 0.0) .* infsup (0.0, 0.0), infsup (0.0, 0.0)));
%! assert (isequal (times (infsup (0.0, 0.0), infsup (0.0, 0.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (infsup (0.0, inf) .* infsup (0.0, +8.0), infsup (0.0, inf)));
%! assert (isequal (times (infsup (0.0, inf), infsup (0.0, +8.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (infsup (-3.0, +7.0) .* infsup (0.0, 0.0), infsup (0.0, 0.0)));
%! assert (isequal (times (infsup (-3.0, +7.0), infsup (0.0, 0.0)), infsup (0.0, 0.0)));
%!# regular values
%!test
%! assert (isequal (infsup (-1.300000000000000000e+01, -9.000000000000000000e+00) .* infsup (-4.000000000000000000e+00, -2.000000000000000000e+00), infsup (1.800000000000000000e+01, 5.200000000000000000e+01)));
%! assert (isequal (times (infsup (-1.300000000000000000e+01, -9.000000000000000000e+00), infsup (-4.000000000000000000e+00, -2.000000000000000000e+00)), infsup (1.800000000000000000e+01, 5.200000000000000000e+01)));
%!test
%! assert (isequal (infsup (-1.300000000000000000e+01, -8.713145944805367193e-01) .* infsup (-4.000000000000000000e+00, -4.005481558786871954e-02), infsup (3.490034540093651244e-02, 5.200000000000000000e+01)));
%! assert (isequal (times (infsup (-1.300000000000000000e+01, -8.713145944805367193e-01), infsup (-4.000000000000000000e+00, -4.005481558786871954e-02)), infsup (3.490034540093651244e-02, 5.200000000000000000e+01)));
%!test
%! assert (isequal (infsup (-8.844699037058322277e-01, -5.086643052155234157e-01) .* infsup (-3.468109146783053820e-01, -2.002700255759105596e-01), infsup (1.018702134150656358e-01, 3.067438163096523618e-01)));
%! assert (isequal (times (infsup (-8.844699037058322277e-01, -5.086643052155234157e-01), infsup (-3.468109146783053820e-01, -2.002700255759105596e-01)), infsup (1.018702134150656358e-01, 3.067438163096523618e-01)));
%!test
%! assert (isequal (infsup (-5.500000000000000000e+01, -7.000000000000000000e+00) .* infsup (-1.000000000000000000e+00, 3.400000000000000000e+01), infsup (-1.870000000000000000e+03, 5.500000000000000000e+01)));
%! assert (isequal (times (infsup (-5.500000000000000000e+01, -7.000000000000000000e+00), infsup (-1.000000000000000000e+00, 3.400000000000000000e+01)), infsup (-1.870000000000000000e+03, 5.500000000000000000e+01)));
%!test
%! assert (isequal (infsup (-8.765250686386196755e-01, -1.992187500000000000e-01) .* infsup (-1.000000000000000000e+00, 1.466715900391711624e+00), infsup (-1.285613255264199895e+00, 8.765250686386196755e-01)));
%! assert (isequal (times (infsup (-8.765250686386196755e-01, -1.992187500000000000e-01), infsup (-1.000000000000000000e+00, 1.466715900391711624e+00)), infsup (-1.285613255264199895e+00, 8.765250686386196755e-01)));
%!test
%! assert (isequal (infsup (-2.870801872541201760e+01, -1.992187500000000000e-01) .* infsup (-1.393992103870862920e+00, 1.000000000000000000e+00), infsup (-2.870801872541201760e+01, 4.001875142100123384e+01)));
%! assert (isequal (times (infsup (-2.870801872541201760e+01, -1.992187500000000000e-01), infsup (-1.393992103870862920e+00, 1.000000000000000000e+00)), infsup (-2.870801872541201760e+01, 4.001875142100123384e+01)));
%!test
%! assert (isequal (infsup (-2.870801872541201760e+01, -1.992187500000000000e-01) .* infsup (-1.393992103870862920e+00, 3.071280064782253660e+01), infsup (-8.817036561075358350e+02, 4.001875142100123384e+01)));
%! assert (isequal (times (infsup (-2.870801872541201760e+01, -1.992187500000000000e-01), infsup (-1.393992103870862920e+00, 3.071280064782253660e+01)), infsup (-8.817036561075358350e+02, 4.001875142100123384e+01)));
%!test
%! assert (isequal (infsup (-7.818749353000000000e+10, -1.000000000000000000e+00) .* infsup (1.000000000000000000e+00, 1.600000000000000000e+01), infsup (-1.250999896480000000e+12, -1.000000000000000000e+00)));
%! assert (isequal (times (infsup (-7.818749353000000000e+10, -1.000000000000000000e+00), infsup (1.000000000000000000e+00, 1.600000000000000000e+01)), infsup (-1.250999896480000000e+12, -1.000000000000000000e+00)));
%!test
%! assert (isequal (infsup (-7.139662043699290805e-01, -5.000000000000000000e-01) .* infsup (2.000000000000000000e+00, 2.046605023486218755e+00), infsup (-1.461206820462885192e+00, -1.000000000000000000e+00)));
%! assert (isequal (times (infsup (-7.139662043699290805e-01, -5.000000000000000000e-01), infsup (2.000000000000000000e+00, 2.046605023486218755e+00)), infsup (-1.461206820462885192e+00, -1.000000000000000000e+00)));
%!test
%! assert (isequal (infsup (-4.000000000000000000e+00, -4.018386156188277769e-02) .* infsup (7.388390272892536581e-01, 4.000000000000000000e+00), infsup (-1.600000000000000000e+01, -2.968940518910749907e-02)));
%! assert (isequal (times (infsup (-4.000000000000000000e+00, -4.018386156188277769e-02), infsup (7.388390272892536581e-01, 4.000000000000000000e+00)), infsup (-1.600000000000000000e+01, -2.968940518910749907e-02)));
%!test
%! assert (isequal (infsup (-7.139662043699290805e-01, -4.018386156188277769e-02) .* infsup (7.388390272892536581e-01, 2.046605023486218755e+00), infsup (-1.461206820462885192e+00, -2.968940518910749907e-02)));
%! assert (isequal (times (infsup (-7.139662043699290805e-01, -4.018386156188277769e-02), infsup (7.388390272892536581e-01, 2.046605023486218755e+00)), infsup (-1.461206820462885192e+00, -2.968940518910749907e-02)));
%!test
%! assert (isequal (infsup (-1.000000000000000000e+00, 1.700000000000000000e+01) .* infsup (-7.000000000000000000e+00, -4.000000000000000000e+00), infsup (-1.190000000000000000e+02, 7.000000000000000000e+00)));
%! assert (isequal (times (infsup (-1.000000000000000000e+00, 1.700000000000000000e+01), infsup (-7.000000000000000000e+00, -4.000000000000000000e+00)), infsup (-1.190000000000000000e+02, 7.000000000000000000e+00)));
%!test
%! assert (isequal (infsup (-1.000000000000000000e+00, 9.244364494737422611e-01) .* infsup (-2.231538914439750165e+00, -6.250000000000000000e-02), infsup (-2.062915910927172192e+00, 2.231538914439750165e+00)));
%! assert (isequal (times (infsup (-1.000000000000000000e+00, 9.244364494737422611e-01), infsup (-2.231538914439750165e+00, -6.250000000000000000e-02)), infsup (-2.062915910927172192e+00, 2.231538914439750165e+00)));
%!test
%! assert (isequal (infsup (-2.850258554165375813e+02, 1.000000000000000000e+00) .* infsup (-2.231538914439750165e+00, -6.250000000000000000e-02), infsup (-2.231538914439750165e+00, 6.360462879834815340e+02)));
%! assert (isequal (times (infsup (-2.850258554165375813e+02, 1.000000000000000000e+00), infsup (-2.231538914439750165e+00, -6.250000000000000000e-02)), infsup (-2.231538914439750165e+00, 6.360462879834815340e+02)));
%!test
%! assert (isequal (infsup (-9.244364494737422611e-01, 2.850258554165375813e+02) .* infsup (-2.231538914439750165e+00, -6.250000000000000000e-02), infsup (-6.360462879834815340e+02, 2.062915910927172192e+00)));
%! assert (isequal (times (infsup (-9.244364494737422611e-01, 2.850258554165375813e+02), infsup (-2.231538914439750165e+00, -6.250000000000000000e-02)), infsup (-6.360462879834815340e+02, 2.062915910927172192e+00)));
%!test
%! assert (isequal (infsup (-1.000000000000000000e+00, 1.600000000000000000e+01) .* infsup (-2.000000000000000000e+00, 3.000000000000000000e+00), infsup (-3.200000000000000000e+01, 4.800000000000000000e+01)));
%! assert (isequal (times (infsup (-1.000000000000000000e+00, 1.600000000000000000e+01), infsup (-2.000000000000000000e+00, 3.000000000000000000e+00)), infsup (-3.200000000000000000e+01, 4.800000000000000000e+01)));
%!test
%! assert (isequal (infsup (-1.000000000000000000e+00, 1.784754876621973685e-01) .* infsup (-1.513663759394287545e-01, 3.906250000000000000e-03), infsup (-2.701518776144904571e-02, 1.513663759394287545e-01)));
%! assert (isequal (times (infsup (-1.000000000000000000e+00, 1.784754876621973685e-01), infsup (-1.513663759394287545e-01, 3.906250000000000000e-03)), infsup (-2.701518776144904571e-02, 1.513663759394287545e-01)));
%!test
%! assert (isequal (infsup (-1.000000000000000000e+00, 4.301929436060967227e-01) .* infsup (-6.250000000000000000e-02, 1.555662705168874727e+00), infsup (-1.555662705168874727e+00, 6.692351183948216375e-01)));
%! assert (isequal (times (infsup (-1.000000000000000000e+00, 4.301929436060967227e-01), infsup (-6.250000000000000000e-02, 1.555662705168874727e+00)), infsup (-1.555662705168874727e+00, 6.692351183948216375e-01)));
%!test
%! assert (isequal (infsup (-1.085456484137515831e+00, 3.906250000000000000e-03) .* infsup (-2.468696855614667118e+00, 5.137992619868292365e-01), infsup (-5.577067404686740781e-01, 2.679663009296837206e+00)));
%! assert (isequal (times (infsup (-1.085456484137515831e+00, 3.906250000000000000e-03), infsup (-2.468696855614667118e+00, 5.137992619868292365e-01)), infsup (-5.577067404686740781e-01, 2.679663009296837206e+00)));
%!test
%! assert (isequal (infsup (-7.000000000000000000e+00, 7.000000000000000000e+00) .* infsup (1.900000000000000000e+01, 3.600000000000000000e+01), infsup (-2.520000000000000000e+02, 2.520000000000000000e+02)));
%! assert (isequal (times (infsup (-7.000000000000000000e+00, 7.000000000000000000e+00), infsup (1.900000000000000000e+01, 3.600000000000000000e+01)), infsup (-2.520000000000000000e+02, 2.520000000000000000e+02)));
%!test
%! assert (isequal (infsup (-6.563586907006095927e-01, 1.600000000000000000e+01) .* infsup (2.000000000000000000e+00, 2.201187625175617946e+00), infsup (-1.444768627646652925e+00, 3.521900200280988713e+01)));
%! assert (isequal (times (infsup (-6.563586907006095927e-01, 1.600000000000000000e+01), infsup (2.000000000000000000e+00, 2.201187625175617946e+00)), infsup (-1.444768627646652925e+00, 3.521900200280988713e+01)));
%!test
%! assert (isequal (infsup (-1.000000000000000000e+00, 1.565098315200050605e+00) .* infsup (1.110223024625156540e-16, 1.266329204122035978e+00), infsup (-1.266329204122035978e+00, 1.981929703860019654e+00)));
%! assert (isequal (times (infsup (-1.000000000000000000e+00, 1.565098315200050605e+00), infsup (1.110223024625156540e-16, 1.266329204122035978e+00)), infsup (-1.266329204122035978e+00, 1.981929703860019654e+00)));
%!test
%! assert (isequal (infsup (-1.765834301520441407e+00, 1.557480558189380915e+00) .* infsup (2.000000000000000000e+00, 3.269798648808647012e+00), infsup (-5.773922613131500903e+00, 5.092647824713375293e+00)));
%! assert (isequal (times (infsup (-1.765834301520441407e+00, 1.557480558189380915e+00), infsup (2.000000000000000000e+00, 3.269798648808647012e+00)), infsup (-5.773922613131500903e+00, 5.092647824713375293e+00)));
%!test
%! assert (isequal (infsup (1.200000000000000000e+01, 4.500000000000000000e+01) .* infsup (-1.657000000000000000e+03, -2.290000000000000000e+02), infsup (-7.456500000000000000e+04, -2.748000000000000000e+03)));
%! assert (isequal (times (infsup (1.200000000000000000e+01, 4.500000000000000000e+01), infsup (-1.657000000000000000e+03, -2.290000000000000000e+02)), infsup (-7.456500000000000000e+04, -2.748000000000000000e+03)));
%!test
%! assert (isequal (infsup (1.200000000000000000e+01, 1.120812365223437610e+03) .* infsup (-2.525625077842174805e+12, -2.290000000000000000e+02), infsup (-2.830751817163917000e+15, -2.748000000000000000e+03)));
%! assert (isequal (times (infsup (1.200000000000000000e+01, 1.120812365223437610e+03), infsup (-2.525625077842174805e+12, -2.290000000000000000e+02)), infsup (-2.830751817163917000e+15, -2.748000000000000000e+03)));
%!test
%! assert (isequal (infsup (1.122244233241161915e+01, 4.500000000000000000e+01) .* infsup (-1.657000000000000000e+03, -1.027908085677155725e+01), infsup (-7.456500000000000000e+04, -1.153563921453150130e+02)));
%! assert (isequal (times (infsup (1.122244233241161915e+01, 4.500000000000000000e+01), infsup (-1.657000000000000000e+03, -1.027908085677155725e+01)), infsup (-7.456500000000000000e+04, -1.153563921453150130e+02)));
%!test
%! assert (isequal (infsup (9.395050761055534494e-01, 1.073814051130034741e+01) .* infsup (-5.795963639761951391e+00, -9.930631723906067562e-03), infsup (-6.223787196215162965e+01, -9.329878913544592187e-03)));
%! assert (isequal (times (infsup (9.395050761055534494e-01, 1.073814051130034741e+01), infsup (-5.795963639761951391e+00, -9.930631723906067562e-03)), infsup (-6.223787196215162965e+01, -9.329878913544592187e-03)));
%!test
%! assert (isequal (infsup (1.000000000000000000e+00, 1.200000000000000000e+01) .* infsup (-2.290000000000000000e+02, 1.000000000000000000e+00), infsup (-2.748000000000000000e+03, 1.200000000000000000e+01)));
%! assert (isequal (times (infsup (1.000000000000000000e+00, 1.200000000000000000e+01), infsup (-2.290000000000000000e+02, 1.000000000000000000e+00)), infsup (-2.748000000000000000e+03, 1.200000000000000000e+01)));
%!test
%! assert (isequal (infsup (6.461498003318411065e-14, 1.922432961588749656e+00) .* infsup (-6.663688717732502154e-01, 4.294967296000000000e+09), infsup (-1.281049483673603273e+00, 8.256786698776103973e+09)));
%! assert (isequal (times (infsup (6.461498003318411065e-14, 1.922432961588749656e+00), infsup (-6.663688717732502154e-01, 4.294967296000000000e+09)), infsup (-1.281049483673603273e+00, 8.256786698776103973e+09)));
%!test
%! assert (isequal (infsup (3.000000000000000000e+00, 7.171544261033011125e+00) .* infsup (-1.000000000000000000e+00, 6.663688717732502154e-01), infsup (-7.171544261033011125e+00, 4.778893858096495251e+00)));
%! assert (isequal (times (infsup (3.000000000000000000e+00, 7.171544261033011125e+00), infsup (-1.000000000000000000e+00, 6.663688717732502154e-01)), infsup (-7.171544261033011125e+00, 4.778893858096495251e+00)));
%!test
%! assert (isequal (infsup (1.875000000000000000e-01, 6.663688717732502154e-01) .* infsup (-1.922432961588749656e+00, 7.171544261033011125e+00), infsup (-1.281049483673603273e+00, 4.778893858096495251e+00)));
%! assert (isequal (times (infsup (1.875000000000000000e-01, 6.663688717732502154e-01), infsup (-1.922432961588749656e+00, 7.171544261033011125e+00)), infsup (-1.281049483673603273e+00, 4.778893858096495251e+00)));
%!test
%! assert (isequal (infsup (3.000000000000000000e+00, 7.000000000000000000e+00) .* infsup (5.000000000000000000e+00, 1.100000000000000000e+01), infsup (1.500000000000000000e+01, 7.700000000000000000e+01)));
%! assert (isequal (times (infsup (3.000000000000000000e+00, 7.000000000000000000e+00), infsup (5.000000000000000000e+00, 1.100000000000000000e+01)), infsup (1.500000000000000000e+01, 7.700000000000000000e+01)));
%!test
%! assert (isequal (infsup (2.282104623262744436e+00, 7.000000000000000000e+00) .* infsup (3.444510241015958041e+00, 1.100000000000000000e+01), infsup (7.860732745898387108e+00, 7.700000000000000000e+01)));
%! assert (isequal (times (infsup (2.282104623262744436e+00, 7.000000000000000000e+00), infsup (3.444510241015958041e+00, 1.100000000000000000e+01)), infsup (7.860732745898387108e+00, 7.700000000000000000e+01)));
%!test
%! assert (isequal (infsup (3.000000000000000000e+00, 3.444510241015958041e+00) .* infsup (1.490116119384765625e-07, 2.282104623262744436e+00), infsup (4.470348358154296875e-07, 7.860732745898387996e+00)));
%! assert (isequal (times (infsup (3.000000000000000000e+00, 3.444510241015958041e+00), infsup (1.490116119384765625e-07, 2.282104623262744436e+00)), infsup (4.470348358154296875e-07, 7.860732745898387996e+00)));
%!test
%! assert (isequal (infsup (1.916281209173078537e-01, 2.282104623262744436e+00) .* infsup (7.650281798863103333e-01, 2.619105358145846552e+00), infsup (1.466009125604018082e-01, 5.977072446636863212e+00)));
%! assert (isequal (times (infsup (1.916281209173078537e-01, 2.282104623262744436e+00), infsup (7.650281798863103333e-01, 2.619105358145846552e+00)), infsup (1.466009125604018082e-01, 5.977072446636863212e+00)));

## mpfi_mul_d

%!# special values
%!test
%! assert (isequal (infsup (-inf, -7.0) .* infsup (-2.300000000000000000e+01, -2.300000000000000000e+01), infsup (1.610000000000000000e+02, inf)));
%! assert (isequal (times (infsup (-inf, -7.0), infsup (-2.300000000000000000e+01, -2.300000000000000000e+01)), infsup (1.610000000000000000e+02, inf)));
%!test
%! assert (isequal (infsup (-inf, -7.0) .* infsup (0.0, 0.0), infsup (0.0, 0.0)));
%! assert (isequal (times (infsup (-inf, -7.0), infsup (0.0, 0.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (infsup (-inf, -7.0) .* infsup (4.000000000000000286e-17, 4.000000000000000286e-17), infsup (-inf, -2.800000000000000139e-16)));
%! assert (isequal (times (infsup (-inf, -7.0), infsup (4.000000000000000286e-17, 4.000000000000000286e-17)), infsup (-inf, -2.800000000000000139e-16)));
%!test
%! assert (isequal (infsup (-inf, 0.0) .* infsup (-8.000000000000000572e-17, -8.000000000000000572e-17), infsup (0.0, inf)));
%! assert (isequal (times (infsup (-inf, 0.0), infsup (-8.000000000000000572e-17, -8.000000000000000572e-17)), infsup (0.0, inf)));
%!test
%! assert (isequal (infsup (-inf, 0.0) .* infsup (0.0, 0.0), infsup (0.0, 0.0)));
%! assert (isequal (times (infsup (-inf, 0.0), infsup (0.0, 0.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (infsup (-inf, 0.0) .* infsup (8.000000000000000572e-17, 8.000000000000000572e-17), infsup (-inf, 0.0)));
%! assert (isequal (times (infsup (-inf, 0.0), infsup (8.000000000000000572e-17, 8.000000000000000572e-17)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (infsup (-inf, 8.0) .* infsup (-1.600000000000000000e+18, -1.600000000000000000e+18), infsup (-1.280000000000000000e+19, inf)));
%! assert (isequal (times (infsup (-inf, 8.0), infsup (-1.600000000000000000e+18, -1.600000000000000000e+18)), infsup (-1.280000000000000000e+19, inf)));
%!test
%! assert (isequal (infsup (-inf, 8.0) .* infsup (0.0, 0.0), infsup (0.0, 0.0)));
%! assert (isequal (times (infsup (-inf, 8.0), infsup (0.0, 0.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (infsup (-inf, 8.0) .* infsup (1.600000000000000000e+18, 1.600000000000000000e+18), infsup (-inf, 1.280000000000000000e+19)));
%! assert (isequal (times (infsup (-inf, 8.0), infsup (1.600000000000000000e+18, 1.600000000000000000e+18)), infsup (-inf, 1.280000000000000000e+19)));
%!test
%! assert (isequal (infsup (-inf, inf) .* infsup (-1.600000000000000114e-16, -1.600000000000000114e-16), infsup (-inf, inf)));
%! assert (isequal (times (infsup (-inf, inf), infsup (-1.600000000000000114e-16, -1.600000000000000114e-16)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-inf, inf) .* infsup (0.0e-17, 0.0e-17), infsup (0.0, 0.0)));
%! assert (isequal (times (infsup (-inf, inf), infsup (0.0e-17, 0.0e-17)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (infsup (-inf, inf) .* infsup (1.600000000000000114e-16, 1.600000000000000114e-16), infsup (-inf, inf)));
%! assert (isequal (times (infsup (-inf, inf), infsup (1.600000000000000114e-16, 1.600000000000000114e-16)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (0.0, 0.0) .* infsup (-1.000000000000000072e-17, -1.000000000000000072e-17), infsup (0.0, 0.0)));
%! assert (isequal (times (infsup (0.0, 0.0), infsup (-1.000000000000000072e-17, -1.000000000000000072e-17)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (infsup (0.0, 0.0) .* infsup (0.0, 0.0), infsup (0.0, 0.0)));
%! assert (isequal (times (infsup (0.0, 0.0), infsup (0.0, 0.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (infsup (0.0, 0.0) .* infsup (1.000000000000000072e-17, 1.000000000000000072e-17), infsup (0.0, 0.0)));
%! assert (isequal (times (infsup (0.0, 0.0), infsup (1.000000000000000072e-17, 1.000000000000000072e-17)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (infsup (0.0, 7.0) .* infsup (-3.000000000000000061e-17, -3.000000000000000061e-17), infsup (-2.100000000000000104e-16, 0.0)));
%! assert (isequal (times (infsup (0.0, 7.0), infsup (-3.000000000000000061e-17, -3.000000000000000061e-17)), infsup (-2.100000000000000104e-16, 0.0)));
%!test
%! assert (isequal (infsup (0.0, 8.0) .* infsup (0.0, 0.0), infsup (0.0, 0.0)));
%! assert (isequal (times (infsup (0.0, 8.0), infsup (0.0, 0.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (infsup (0.0, 9.0) .* infsup (4.800000000000000097e-16, 4.800000000000000097e-16), infsup (0.0, 4.320000000000000777e-15)));
%! assert (isequal (times (infsup (0.0, 9.0), infsup (4.800000000000000097e-16, 4.800000000000000097e-16)), infsup (0.0, 4.320000000000000777e-15)));
%!test
%! assert (isequal (infsup (0.0, inf) .* infsup (-7.000000000000000347e-17, -7.000000000000000347e-17), infsup (-inf, 0.0)));
%! assert (isequal (times (infsup (0.0, inf), infsup (-7.000000000000000347e-17, -7.000000000000000347e-17)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (infsup (0.0, inf) .* infsup (0.0, 0.0), infsup (0.0, 0.0)));
%! assert (isequal (times (infsup (0.0, inf), infsup (0.0, 0.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (infsup (0.0, inf) .* infsup (6.999999999999999114e-17, 6.999999999999999114e-17), infsup (0.0, inf)));
%! assert (isequal (times (infsup (0.0, inf), infsup (6.999999999999999114e-17, 6.999999999999999114e-17)), infsup (0.0, inf)));
%!# regular values
%!test
%! assert (isequal (infsup (-2.421182400000000000e+07, -2.823443157514333837e-22) .* infsup (-1.5, -1.5), infsup (4.235164736271500755e-22, 3.631773600000000000e+07)));
%! assert (isequal (times (infsup (-2.421182400000000000e+07, -2.823443157514333837e-22), infsup (-1.5, -1.5)), infsup (4.235164736271500755e-22, 3.631773600000000000e+07)));
%!test
%! assert (isequal (infsup (-3.002399751580330000e+15, 1.250419591445233750e+128) .* infsup (-1.5, -1.5), infsup (-1.875629387167850624e+128, 4.503599627370495000e+15)));
%! assert (isequal (times (infsup (-3.002399751580330000e+15, 1.250419591445233750e+128), infsup (-1.5, -1.5)), infsup (-1.875629387167850624e+128, 4.503599627370495000e+15)));
%!test
%! assert (isequal (infsup (4.503599627370512000e+15, 1.122162325663649028e+211) .* infsup (-2.125, -2.125), infsup (-2.384594942035254185e+211, -9.570149208162338000e+15)));
%! assert (isequal (times (infsup (4.503599627370512000e+15, 1.122162325663649028e+211), infsup (-2.125, -2.125)), infsup (-2.384594942035254185e+211, -9.570149208162338000e+15)));
%!test
%! assert (isequal (infsup (-2.421182400000000000e+07, -2.823443157514333837e-22) .* infsup (1.5, 1.5), infsup (-3.631773600000000000e+07, -4.235164736271500755e-22)));
%! assert (isequal (times (infsup (-2.421182400000000000e+07, -2.823443157514333837e-22), infsup (1.5, 1.5)), infsup (-3.631773600000000000e+07, -4.235164736271500755e-22)));
%!test
%! assert (isequal (infsup (-3.002399751580330000e+15, 1.250419591445233750e+128) .* infsup (1.5, 1.5), infsup (-4.503599627370495000e+15, 1.875629387167850624e+128)));
%! assert (isequal (times (infsup (-3.002399751580330000e+15, 1.250419591445233750e+128), infsup (1.5, 1.5)), infsup (-4.503599627370495000e+15, 1.875629387167850624e+128)));
%!test
%! assert (isequal (infsup (4.503599627370512000e+15, 1.122162325663649028e+211) .* infsup (2.125, 2.125), infsup (9.570149208162338000e+15, 2.384594942035254185e+211)));
%! assert (isequal (times (infsup (4.503599627370512000e+15, 1.122162325663649028e+211), infsup (2.125, 2.125)), infsup (9.570149208162338000e+15, 2.384594942035254185e+211)));
%!test
%! assert (isequal (infsup (-1.663823876104126464e+18, -4.503599627370497000e+15) .* infsup (-1.5, -1.5), infsup (6.755399441055745000e+15, 2.495735814156189696e+18)));
%! assert (isequal (times (infsup (-1.663823876104126464e+18, -4.503599627370497000e+15), infsup (-1.5, -1.5)), infsup (6.755399441055745000e+15, 2.495735814156189696e+18)));
%!test
%! assert (isequal (infsup (-3.002399751580330000e+15, 4.503599627370497000e+15) .* infsup (-1.5, -1.5), infsup (-6.755399441055746000e+15, 4.503599627370495000e+15)));
%! assert (isequal (times (infsup (-3.002399751580330000e+15, 4.503599627370497000e+15), infsup (-1.5, -1.5)), infsup (-6.755399441055746000e+15, 4.503599627370495000e+15)));
%!test
%! assert (isequal (infsup (4.503599627370512000e+15, 4.803839602528529000e+15) .* infsup (-2.125, -2.125), infsup (-1.020815915537312600e+16, -9.570149208162338000e+15)));
%! assert (isequal (times (infsup (4.503599627370512000e+15, 4.803839602528529000e+15), infsup (-2.125, -2.125)), infsup (-1.020815915537312600e+16, -9.570149208162338000e+15)));
%!test
%! assert (isequal (infsup (-4.503599627370497000e+15, -2.823443157514333837e-22) .* infsup (1.5, 1.5), infsup (-6.755399441055746000e+15, -4.235164736271500755e-22)));
%! assert (isequal (times (infsup (-4.503599627370497000e+15, -2.823443157514333837e-22), infsup (1.5, 1.5)), infsup (-6.755399441055746000e+15, -4.235164736271500755e-22)));
%!test
%! assert (isequal (infsup (-3.002399751580331000e+15, 1.250419591445233750e+128) .* infsup (1.5, 1.5), infsup (-4.503599627370497000e+15, 1.875629387167850624e+128)));
%! assert (isequal (times (infsup (-3.002399751580331000e+15, 1.250419591445233750e+128), infsup (1.5, 1.5)), infsup (-4.503599627370497000e+15, 1.875629387167850624e+128)));
%!test
%! assert (isequal (infsup (4.503599627370497000e+15, 1.122162325663649028e+211) .* infsup (2.125, 2.125), infsup (9.570149208162306000e+15, 2.384594942035254185e+211)));
%! assert (isequal (times (infsup (4.503599627370497000e+15, 1.122162325663649028e+211), infsup (2.125, 2.125)), infsup (9.570149208162306000e+15, 2.384594942035254185e+211)));
%!test
%! assert (isequal (infsup (-4.909806652584305000e+15, -2.823443157514333837e-22) .* infsup (-1.5, -1.5), infsup (4.235164736271500755e-22, 7.364709978876458000e+15)));
%! assert (isequal (times (infsup (-4.909806652584305000e+15, -2.823443157514333837e-22), infsup (-1.5, -1.5)), infsup (4.235164736271500755e-22, 7.364709978876458000e+15)));
%!test
%! assert (isequal (infsup (-4.503599627370497000e+15, 1.250419591445233750e+128) .* infsup (-1.5, -1.5), infsup (-1.875629387167850624e+128, 6.755399441055746000e+15)));
%! assert (isequal (times (infsup (-4.503599627370497000e+15, 1.250419591445233750e+128), infsup (-1.5, -1.5)), infsup (-1.875629387167850624e+128, 6.755399441055746000e+15)));
%!test
%! assert (isequal (infsup (4.503599627370497000e+15, 1.122162325663649028e+211) .* infsup (-2.125, -2.125), infsup (-2.384594942035254185e+211, -9.570149208162306000e+15)));
%! assert (isequal (times (infsup (4.503599627370497000e+15, 1.122162325663649028e+211), infsup (-2.125, -2.125)), infsup (-2.384594942035254185e+211, -9.570149208162306000e+15)));
%!test
%! assert (isequal (infsup (-2.421182400000000000e+07, -7.058607893785835532e-22) .* infsup (1.5, 1.5), infsup (-3.631773600000000000e+07, -1.058791184067875236e-21)));
%! assert (isequal (times (infsup (-2.421182400000000000e+07, -7.058607893785835532e-22), infsup (1.5, 1.5)), infsup (-3.631773600000000000e+07, -1.058791184067875236e-21)));
%!test
%! assert (isequal (infsup (-3.002399751580330000e+15, 4.909806652584305000e+15) .* infsup (1.5, 1.5), infsup (-4.503599627370495000e+15, 7.364709978876458000e+15)));
%! assert (isequal (times (infsup (-3.002399751580330000e+15, 4.909806652584305000e+15), infsup (1.5, 1.5)), infsup (-4.503599627370495000e+15, 7.364709978876458000e+15)));
%!test
%! assert (isequal (infsup (4.503599627370512000e+15, 6.905519428634761000e+15) .* infsup (2.125, 2.125), infsup (9.570149208162338000e+15, 1.467422878584886800e+16)));
%! assert (isequal (times (infsup (4.503599627370512000e+15, 6.905519428634761000e+15), infsup (2.125, 2.125)), infsup (9.570149208162338000e+15, 1.467422878584886800e+16)));
%!test
%! assert (isequal (infsup (-4.909806652584305000e+15, -4.503599627370497000e+15) .* infsup (-1.5, -1.5), infsup (6.755399441055745000e+15, 7.364709978876458000e+15)));
%! assert (isequal (times (infsup (-4.909806652584305000e+15, -4.503599627370497000e+15), infsup (-1.5, -1.5)), infsup (6.755399441055745000e+15, 7.364709978876458000e+15)));
%!test
%! assert (isequal (infsup (-4.503599627370497000e+15, 4.503599627370497000e+15) .* infsup (-1.5, -1.5), infsup (-6.755399441055746000e+15, 6.755399441055746000e+15)));
%! assert (isequal (times (infsup (-4.503599627370497000e+15, 4.503599627370497000e+15), infsup (-1.5, -1.5)), infsup (-6.755399441055746000e+15, 6.755399441055746000e+15)));
%!test
%! assert (isequal (infsup (4.503599627370497000e+15, 4.803839602528529000e+15) .* infsup (-2.125, -2.125), infsup (-1.020815915537312600e+16, -9.570149208162306000e+15)));
%! assert (isequal (times (infsup (4.503599627370497000e+15, 4.803839602528529000e+15), infsup (-2.125, -2.125)), infsup (-1.020815915537312600e+16, -9.570149208162306000e+15)));
%!test
%! assert (isequal (infsup (-4.503599627370497000e+15, -7.058607893785835532e-22) .* infsup (1.5, 1.5), infsup (-6.755399441055746000e+15, -1.058791184067875236e-21)));
%! assert (isequal (times (infsup (-4.503599627370497000e+15, -7.058607893785835532e-22), infsup (1.5, 1.5)), infsup (-6.755399441055746000e+15, -1.058791184067875236e-21)));
%!test
%! assert (isequal (infsup (-3.002399751580331000e+15, 4.909806652584305000e+15) .* infsup (1.5, 1.5), infsup (-4.503599627370497000e+15, 7.364709978876458000e+15)));
%! assert (isequal (times (infsup (-3.002399751580331000e+15, 4.909806652584305000e+15), infsup (1.5, 1.5)), infsup (-4.503599627370497000e+15, 7.364709978876458000e+15)));
%!test
%! assert (isequal (infsup (4.503599627370497000e+15, 6.905519428634761000e+15) .* infsup (2.125, 2.125), infsup (9.570149208162306000e+15, 1.467422878584886800e+16)));
%! assert (isequal (times (infsup (4.503599627370497000e+15, 6.905519428634761000e+15), infsup (2.125, 2.125)), infsup (9.570149208162306000e+15, 1.467422878584886800e+16)));

## mpfi_neg

%!# special values
%!test
%! assert (isequal (-infsup (-inf, -7.0), infsup (+7.0, inf)));
%! assert (isequal (uminus (infsup (-inf, -7.0)), infsup (+7.0, inf)));
%!test
%! assert (isequal (-infsup (-inf, 0.0), infsup (0.0, inf)));
%! assert (isequal (uminus (infsup (-inf, 0.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (-infsup (-inf, +8.0), infsup (-8.0, inf)));
%! assert (isequal (uminus (infsup (-inf, +8.0)), infsup (-8.0, inf)));
%!test
%! assert (isequal (-infsup (-inf, inf), infsup (-inf, inf)));
%! assert (isequal (uminus (infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (-infsup (0.0, 0.0), infsup (0.0, 0.0)));
%! assert (isequal (uminus (infsup (0.0, 0.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (-infsup (0.0, +8.0), infsup (-8.0, 0.0)));
%! assert (isequal (uminus (infsup (0.0, +8.0)), infsup (-8.0, 0.0)));
%!test
%! assert (isequal (-infsup (0.0, inf), infsup (-inf, 0.0)));
%! assert (isequal (uminus (infsup (0.0, inf)), infsup (-inf, 0.0)));
%!# regular values
%!test
%! assert (isequal (-infsup (7.456540443420410156e+04, 7.456540467834472656e+04), infsup (-7.456540467834472656e+04, -7.456540443420410156e+04)));
%! assert (isequal (uminus (infsup (7.456540443420410156e+04, 7.456540467834472656e+04)), infsup (-7.456540467834472656e+04, -7.456540443420410156e+04)));

## mpfi_put_d

%!# special values
%!test
%! assert (isequal (union (infsup (0.0, 0.0), infsup (-8.0, -8.0)), infsup (-8.0, 0.0)));
%!test
%! assert (isequal (union (infsup (0.0, 0.0), infsup (0.0, 0.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (union (infsup (+5.0, +5.0), infsup (0.0, 0.0)), infsup (0.0, +5.0)));

## mpfi_sec

%!# special values
%!test
%! assert (isequal (sec (infsup (-inf, -7.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (sec (infsup (-inf, 0.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (sec (infsup (-inf, 8.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (sec (infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (sec (infsup (-8.0, 0.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (sec (infsup (-3.0, 0.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (sec (infsup (-1.0, 0.0)), infsup (1.0, 1.850815717680925676e+00)));
%!test
%! assert (isequal (sec (infsup (0.0, 0.0)), infsup (1.0, 1.0)));
%!test
%! assert (isequal (sec (infsup (0.0, +1.0)), infsup (1.0, 1.850815717680925676e+00)));
%!test
%! assert (isequal (sec (infsup (0.0, 3.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (sec (infsup (0.0, 8.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (sec (infsup (0.0, inf)), infsup (-inf, inf)));
%!# regular values
%!test
%! assert (isequal (sec (infsup (-6.0, 7.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (sec (infsup (-6.0, 6.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (sec (infsup (-6.0, 5.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (sec (infsup (-6.0, 4.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (sec (infsup (-6.0, 3.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (sec (infsup (-6.0, 2.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (sec (infsup (-6.0, 1.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (sec (infsup (-6.0, 0.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (sec (infsup (-6.0, -1.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (sec (infsup (-6.0, -2.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (sec (infsup (-6.0, -3.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (sec (infsup (-6.0, -4.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (sec (infsup (-6.0, -5.0)), infsup (1.041481926595107632e+00, 3.525320085816088689e+00)));
%!test
%! assert (isequal (sec (infsup (-6.0, -6.0)), infsup (1.041481926595107632e+00, 1.041481926595107854e+00)));
%!test
%! assert (isequal (sec (infsup (-5.0, 7.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (sec (infsup (-5.0, 6.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (sec (infsup (-5.0, 5.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (sec (infsup (-5.0, 4.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (sec (infsup (-5.0, 3.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (sec (infsup (-5.0, 2.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (sec (infsup (-5.0, 1.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (sec (infsup (-5.0, 0.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (sec (infsup (-5.0, -1.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (sec (infsup (-5.0, -2.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (sec (infsup (-5.0, -3.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (sec (infsup (-5.0, -4.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (sec (infsup (-5.0, -5.0)), infsup (3.525320085816088245e+00, 3.525320085816088689e+00)));
%!test
%! assert (isequal (sec (infsup (-4.0, 7.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (sec (infsup (-4.0, 6.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (sec (infsup (-4.0, 5.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (sec (infsup (-4.0, 4.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (sec (infsup (-4.0, 3.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (sec (infsup (-4.0, 2.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (sec (infsup (-4.0, 1.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (sec (infsup (-4.0, 0.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (sec (infsup (-4.0, -1.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (sec (infsup (-4.0, -2.0)), infsup (-2.402997961722381337e+00, -1.0)));
%!test
%! assert (isequal (sec (infsup (-4.0, -3.0)), infsup (-1.529885656466397625e+00, -1.0)));
%!test
%! assert (isequal (sec (infsup (-4.0, -4.0)), infsup (-1.529885656466397625e+00, -1.529885656466397403e+00)));
%!test
%! assert (isequal (sec (infsup (-3.0, 7.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (sec (infsup (-3.0, 6.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (sec (infsup (-3.0, 5.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (sec (infsup (-3.0, 4.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (sec (infsup (-3.0, 3.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (sec (infsup (-3.0, 2.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (sec (infsup (-3.0, 1.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (sec (infsup (-3.0, 0.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (sec (infsup (-3.0, -1.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (sec (infsup (-3.0, -2.0)), infsup (-2.402997961722381337e+00, -1.010108665907993641e+00)));
%!test
%! assert (isequal (sec (infsup (-3.0, -3.0)), infsup (-1.010108665907993863e+00, -1.010108665907993641e+00)));
%!test
%! assert (isequal (sec (infsup (-2.0, 7.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (sec (infsup (-2.0, 6.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (sec (infsup (-2.0, 5.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (sec (infsup (-2.0, 4.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (sec (infsup (-2.0, 3.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (sec (infsup (-2.0, 2.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (sec (infsup (-2.0, 1.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (sec (infsup (-2.0, 0.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (sec (infsup (-2.0, -1.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (sec (infsup (-2.0, -2.0)), infsup (-2.402997961722381337e+00, -2.402997961722380893e+00)));
%!test
%! assert (isequal (sec (infsup (-1.0, 7.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (sec (infsup (-1.0, 6.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (sec (infsup (-1.0, 5.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (sec (infsup (-1.0, 4.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (sec (infsup (-1.0, 3.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (sec (infsup (-1.0, 2.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (sec (infsup (-1.0, 1.0)), infsup (1.0, 1.850815717680925676e+00)));
%!test
%! assert (isequal (sec (infsup (-1.0, 0.0)), infsup (1.0, 1.850815717680925676e+00)));
%!test
%! assert (isequal (sec (infsup (-1.0, -1.0)), infsup (1.850815717680925454e+00, 1.850815717680925676e+00)));
%!test
%! assert (isequal (sec (infsup (1.0, 7.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (sec (infsup (1.0, 6.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (sec (infsup (1.0, 5.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (sec (infsup (1.0, 4.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (sec (infsup (1.0, 3.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (sec (infsup (1.0, 2.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (sec (infsup (1.0, 1.0)), infsup (1.850815717680925454e+00, 1.850815717680925676e+00)));
%!test
%! assert (isequal (sec (infsup (2.0, 7.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (sec (infsup (2.0, 6.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (sec (infsup (2.0, 5.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (sec (infsup (2.0, 4.0)), infsup (-2.402997961722381337e+00, -1.0)));
%!test
%! assert (isequal (sec (infsup (2.0, 3.0)), infsup (-2.402997961722381337e+00, -1.010108665907993641e+00)));
%!test
%! assert (isequal (sec (infsup (2.0, 2.0)), infsup (-2.402997961722381337e+00, -2.402997961722380893e+00)));
%!test
%! assert (isequal (sec (infsup (3.0, 7.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (sec (infsup (3.0, 6.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (sec (infsup (3.0, 5.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (sec (infsup (3.0, 4.0)), infsup (-1.529885656466397625e+00, -1.0)));
%!test
%! assert (isequal (sec (infsup (3.0, 3.0)), infsup (-1.010108665907993863e+00, -1.010108665907993641e+00)));
%!test
%! assert (isequal (sec (infsup (4.0, 7.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (sec (infsup (4.0, 6.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (sec (infsup (4.0, 5.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (sec (infsup (4.0, 4.0)), infsup (-1.529885656466397625e+00, -1.529885656466397403e+00)));
%!test
%! assert (isequal (sec (infsup (5.0, 7.0)), infsup (1.0, 3.525320085816088689e+00)));
%!test
%! assert (isequal (sec (infsup (5.0, 6.0)), infsup (1.041481926595107632e+00, 3.525320085816088689e+00)));
%!test
%! assert (isequal (sec (infsup (5.0, 5.0)), infsup (3.525320085816088245e+00, 3.525320085816088689e+00)));
%!test
%! assert (isequal (sec (infsup (6.0, 7.0)), infsup (1.0, 1.326431900473705072e+00)));
%!test
%! assert (isequal (sec (infsup (6.0, 6.0)), infsup (1.041481926595107632e+00, 1.041481926595107854e+00)));
%!test
%! assert (isequal (sec (infsup (7.0, 7.0)), infsup (1.326431900473704850e+00, 1.326431900473705072e+00)));

## mpfi_sech

%!# special values
%!test
%! assert (isequal (sech (infsup (-inf, -7.0)), infsup (0.0, 1.823762414598208018e-03)));
%!test
%! assert (isequal (sech (infsup (-inf, 0.0)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (sech (infsup (-inf, +8.0)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (sech (infsup (-inf, inf)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (sech (infsup (-1.0, 0.0)), infsup (6.480542736638853496e-01, 1.0)));
%!test
%! assert (isequal (sech (infsup (0.0, 0.0)), infsup (1.0, 1.0)));
%!test
%! assert (isequal (sech (infsup (0.0, +1.0)), infsup (6.480542736638853496e-01, 1.0)));
%!test
%! assert (isequal (sech (infsup (0.0, +8.0)), infsup (6.709251803023412583e-04, 1.0)));
%!test
%! assert (isequal (sech (infsup (0.0, inf)), infsup (0.0, 1.0)));
%!# regular values
%!test
%! assert (isequal (sech (infsup (-0.125, 0.0)), infsup (9.922380414751257316e-01, 1.0)));
%!test
%! assert (isequal (sech (infsup (0.0, 5.000000000000001110e-01)), infsup (8.868188839700738013e-01, 1.0)));
%!test
%! assert (isequal (sech (infsup (-4.5, -0.625)), infsup (2.221525149664967461e-02, 8.321172681599560139e-01)));
%!test
%! assert (isequal (sech (infsup (1.0, 3.0)), infsup (9.932792741943320680e-02, 6.480542736638854606e-01)));
%!test
%! assert (isequal (sech (infsup (17.0, 7.090895657128239691e+02)), infsup (2.225073858507384681e-308, 8.279875437570320428e-08)));

## mpfi_sin

%!# special values
%!test
%! assert (isequal (sin (infsup (-inf, -7.0)), infsup (-1.0, 1.0)));
%!test
%! assert (isequal (sin (infsup (-inf, 0.0)), infsup (-1.0, 1.0)));
%!test
%! assert (isequal (sin (infsup (-inf, +8.0)), infsup (-1.0, 1.0)));
%!test
%! assert (isequal (sin (infsup (-inf, inf)), infsup (-1.0, 1.0)));
%!test
%! assert (isequal (sin (infsup (-1.0, 0.0)), infsup (-8.414709848078966159e-01, 0.0)));
%!test
%! assert (isequal (sin (infsup (0.0, 0.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (sin (infsup (0.0, +1.0)), infsup (0.0, 8.414709848078966159e-01)));
%!test
%! assert (isequal (sin (infsup (0.0, +8.0)), infsup (-1.0, 1.0)));
%!test
%! assert (isequal (sin (infsup (0.0, inf)), infsup (-1.0, 1.0)));
%!# regular values
%!test
%! assert (isequal (sin (infsup (0.125, 17.0)), infsup (-1.0, 1.0)));
%!test
%! assert (isequal (sin (infsup (1.570796326794896558e+00, 1.570796326794896780e+00)), infsup (9.999999999999998890e-01, 1.0)));
%!test
%! assert (isequal (sin (infsup (-2.0, -0.5)), infsup (-1.0, -4.794255386042029499e-01)));
%!test
%! assert (isequal (sin (infsup (-4.5, 0.625)), infsup (-1.0, 9.775301176650971202e-01)));
%!test
%! assert (isequal (sin (infsup (-1.0, -0.25)), infsup (-8.414709848078966159e-01, -2.474039592545229094e-01)));
%!test
%! assert (isequal (sin (infsup (-0.5, 0.5)), infsup (-4.794255386042030054e-01, 4.794255386042030054e-01)));
%!test
%! assert (isequal (sin (infsup (8.538038601028318546e+24, 8.538038601028318546e+24)), infsup (2.177252852343107281e-01, 2.177252852343107559e-01)));
%!test
%! assert (isequal (sin (infsup (-7.0, 7.0)), infsup (-1.0, 1.0)));
%!test
%! assert (isequal (sin (infsup (-7.0, 6.0)), infsup (-1.0, 1.0)));
%!test
%! assert (isequal (sin (infsup (-7.0, 5.0)), infsup (-1.0, 1.0)));
%!test
%! assert (isequal (sin (infsup (-7.0, 4.0)), infsup (-1.0, 1.0)));
%!test
%! assert (isequal (sin (infsup (-7.0, 3.0)), infsup (-1.0, 1.0)));
%!test
%! assert (isequal (sin (infsup (-7.0, 2.0)), infsup (-1.0, 1.0)));
%!test
%! assert (isequal (sin (infsup (-7.0, 1.0)), infsup (-1.0, 1.0)));
%!test
%! assert (isequal (sin (infsup (-7.0, 0.0)), infsup (-1.0, 1.0)));
%!test
%! assert (isequal (sin (infsup (-7.0, -1.0)), infsup (-1.0, 1.0)));
%!test
%! assert (isequal (sin (infsup (-7.0, -2.0)), infsup (-9.092974268256817094e-01, 1.0)));
%!test
%! assert (isequal (sin (infsup (-7.0, -3.0)), infsup (-6.569865987187891720e-01, 1.0)));
%!test
%! assert (isequal (sin (infsup (-7.0, -4.0)), infsup (-6.569865987187891720e-01, 1.0)));
%!test
%! assert (isequal (sin (infsup (-7.0, -5.0)), infsup (-6.569865987187891720e-01, 9.589242746631385650e-01)));
%!test
%! assert (isequal (sin (infsup (-7.0, -6.0)), infsup (-6.569865987187891720e-01, 2.794154981989259157e-01)));
%!test
%! assert (isequal (sin (infsup (-7.0, -7.0)), infsup (-6.569865987187891720e-01, -6.569865987187890610e-01)));
%!test
%! assert (isequal (sin (infsup (-6.0, 7.0)), infsup (-1.0, 1.0)));
%!test
%! assert (isequal (sin (infsup (-6.0, 6.0)), infsup (-1.0, 1.0)));
%!test
%! assert (isequal (sin (infsup (-6.0, 5.0)), infsup (-1.0, 1.0)));
%!test
%! assert (isequal (sin (infsup (-6.0, 4.0)), infsup (-1.0, 1.0)));
%!test
%! assert (isequal (sin (infsup (-6.0, 3.0)), infsup (-1.0, 1.0)));
%!test
%! assert (isequal (sin (infsup (-6.0, 2.0)), infsup (-1.0, 1.0)));
%!test
%! assert (isequal (sin (infsup (-6.0, 1.0)), infsup (-1.0, 1.0)));
%!test
%! assert (isequal (sin (infsup (-6.0, 0.0)), infsup (-1.0, 1.0)));
%!test
%! assert (isequal (sin (infsup (-6.0, -1.0)), infsup (-1.0, 1.0)));
%!test
%! assert (isequal (sin (infsup (-6.0, -2.0)), infsup (-9.092974268256817094e-01, 1.0)));
%!test
%! assert (isequal (sin (infsup (-6.0, -3.0)), infsup (-1.411200080598672413e-01, 1.0)));
%!test
%! assert (isequal (sin (infsup (-6.0, -4.0)), infsup (2.794154981989258602e-01, 1.0)));
%!test
%! assert (isequal (sin (infsup (-6.0, -5.0)), infsup (2.794154981989258602e-01, 9.589242746631385650e-01)));
%!test
%! assert (isequal (sin (infsup (-6.0, -6.0)), infsup (2.794154981989258602e-01, 2.794154981989259157e-01)));
%!test
%! assert (isequal (sin (infsup (-5.0, 7.0)), infsup (-1.0, 1.0)));
%!test
%! assert (isequal (sin (infsup (-5.0, 6.0)), infsup (-1.0, 1.0)));
%!test
%! assert (isequal (sin (infsup (-5.0, 5.0)), infsup (-1.0, 1.0)));
%!test
%! assert (isequal (sin (infsup (-5.0, 4.0)), infsup (-1.0, 1.0)));
%!test
%! assert (isequal (sin (infsup (-5.0, 3.0)), infsup (-1.0, 1.0)));
%!test
%! assert (isequal (sin (infsup (-5.0, 2.0)), infsup (-1.0, 1.0)));
%!test
%! assert (isequal (sin (infsup (-5.0, 1.0)), infsup (-1.0, 1.0)));
%!test
%! assert (isequal (sin (infsup (-5.0, 0.0)), infsup (-1.0, 1.0)));
%!test
%! assert (isequal (sin (infsup (-5.0, -1.0)), infsup (-1.0, 1.0)));
%!test
%! assert (isequal (sin (infsup (-5.0, -2.0)), infsup (-9.092974268256817094e-01, 1.0)));
%!test
%! assert (isequal (sin (infsup (-5.0, -3.0)), infsup (-1.411200080598672413e-01, 1.0)));
%!test
%! assert (isequal (sin (infsup (-5.0, -4.0)), infsup (7.568024953079282025e-01, 1.0)));
%!test
%! assert (isequal (sin (infsup (-5.0, -5.0)), infsup (9.589242746631384540e-01, 9.589242746631385650e-01)));
%!test
%! assert (isequal (sin (infsup (-4.0, 7.0)), infsup (-1.0, 1.0)));
%!test
%! assert (isequal (sin (infsup (-4.0, 6.0)), infsup (-1.0, 1.0)));
%!test
%! assert (isequal (sin (infsup (-4.0, 5.0)), infsup (-1.0, 1.0)));
%!test
%! assert (isequal (sin (infsup (-4.0, 4.0)), infsup (-1.0, 1.0)));
%!test
%! assert (isequal (sin (infsup (-4.0, 3.0)), infsup (-1.0, 1.0)));
%!test
%! assert (isequal (sin (infsup (-4.0, 2.0)), infsup (-1.0, 1.0)));
%!test
%! assert (isequal (sin (infsup (-4.0, 1.0)), infsup (-1.0, 8.414709848078966159e-01)));
%!test
%! assert (isequal (sin (infsup (-4.0, 0.0)), infsup (-1.0, 7.568024953079283135e-01)));
%!test
%! assert (isequal (sin (infsup (-4.0, -1.0)), infsup (-1.0, 7.568024953079283135e-01)));
%!test
%! assert (isequal (sin (infsup (-4.0, -2.0)), infsup (-9.092974268256817094e-01, 7.568024953079283135e-01)));
%!test
%! assert (isequal (sin (infsup (-4.0, -3.0)), infsup (-1.411200080598672413e-01, 7.568024953079283135e-01)));
%!test
%! assert (isequal (sin (infsup (-4.0, -4.0)), infsup (7.568024953079282025e-01, 7.568024953079283135e-01)));
%!test
%! assert (isequal (sin (infsup (-3.0, 7.0)), infsup (-1.0, 1.0)));
%!test
%! assert (isequal (sin (infsup (-3.0, 6.0)), infsup (-1.0, 1.0)));
%!test
%! assert (isequal (sin (infsup (-3.0, 5.0)), infsup (-1.0, 1.0)));
%!test
%! assert (isequal (sin (infsup (-3.0, 4.0)), infsup (-1.0, 1.0)));
%!test
%! assert (isequal (sin (infsup (-3.0, 3.0)), infsup (-1.0, 1.0)));
%!test
%! assert (isequal (sin (infsup (-3.0, 2.0)), infsup (-1.0, 1.0)));
%!test
%! assert (isequal (sin (infsup (-3.0, 1.0)), infsup (-1.0, 8.414709848078966159e-01)));
%!test
%! assert (isequal (sin (infsup (-3.0, 0.0)), infsup (-1.0, 0.0)));
%!test
%! assert (isequal (sin (infsup (-3.0, -1.0)), infsup (-1.0, -1.411200080598672135e-01)));
%!test
%! assert (isequal (sin (infsup (-3.0, -2.0)), infsup (-9.092974268256817094e-01, -1.411200080598672135e-01)));
%!test
%! assert (isequal (sin (infsup (-3.0, -3.0)), infsup (-1.411200080598672413e-01, -1.411200080598672135e-01)));
%!test
%! assert (isequal (sin (infsup (-2.0, 7.0)), infsup (-1.0, 1.0)));
%!test
%! assert (isequal (sin (infsup (-2.0, 6.0)), infsup (-1.0, 1.0)));
%!test
%! assert (isequal (sin (infsup (-2.0, 5.0)), infsup (-1.0, 1.0)));
%!test
%! assert (isequal (sin (infsup (-2.0, 4.0)), infsup (-1.0, 1.0)));
%!test
%! assert (isequal (sin (infsup (-2.0, 3.0)), infsup (-1.0, 1.0)));
%!test
%! assert (isequal (sin (infsup (-2.0, 2.0)), infsup (-1.0, 1.0)));
%!test
%! assert (isequal (sin (infsup (-2.0, 1.0)), infsup (-1.0, 8.414709848078966159e-01)));
%!test
%! assert (isequal (sin (infsup (-2.0, 0.0)), infsup (-1.0, 0.0)));
%!test
%! assert (isequal (sin (infsup (-2.0, -1.0)), infsup (-1.0, -8.414709848078965049e-01)));
%!test
%! assert (isequal (sin (infsup (-2.0, -2.0)), infsup (-9.092974268256817094e-01, -9.092974268256815984e-01)));
%!test
%! assert (isequal (sin (infsup (-1.0, 7.0)), infsup (-1.0, 1.0)));
%!test
%! assert (isequal (sin (infsup (-1.0, 6.0)), infsup (-1.0, 1.0)));
%!test
%! assert (isequal (sin (infsup (-1.0, 5.0)), infsup (-1.0, 1.0)));
%!test
%! assert (isequal (sin (infsup (-1.0, 4.0)), infsup (-8.414709848078966159e-01, 1.0)));
%!test
%! assert (isequal (sin (infsup (-1.0, 3.0)), infsup (-8.414709848078966159e-01, 1.0)));
%!test
%! assert (isequal (sin (infsup (-1.0, 2.0)), infsup (-8.414709848078966159e-01, 1.0)));
%!test
%! assert (isequal (sin (infsup (-1.0, 1.0)), infsup (-8.414709848078966159e-01, 8.414709848078966159e-01)));
%!test
%! assert (isequal (sin (infsup (-1.0, 0.0)), infsup (-8.414709848078966159e-01, 0.0)));
%!test
%! assert (isequal (sin (infsup (-1.0, -1.0)), infsup (-8.414709848078966159e-01, -8.414709848078965049e-01)));
%!test
%! assert (isequal (sin (infsup (1.0, 7.0)), infsup (-1.0, 1.0)));
%!test
%! assert (isequal (sin (infsup (1.0, 6.0)), infsup (-1.0, 1.0)));
%!test
%! assert (isequal (sin (infsup (1.0, 5.0)), infsup (-1.0, 1.0)));
%!test
%! assert (isequal (sin (infsup (1.0, 4.0)), infsup (-7.568024953079283135e-01, 1.0)));
%!test
%! assert (isequal (sin (infsup (1.0, 3.0)), infsup (1.411200080598672135e-01, 1.0)));
%!test
%! assert (isequal (sin (infsup (1.0, 2.0)), infsup (8.414709848078965049e-01, 1.0)));
%!test
%! assert (isequal (sin (infsup (1.0, 1.0)), infsup (8.414709848078965049e-01, 8.414709848078966159e-01)));
%!test
%! assert (isequal (sin (infsup (2.0, 7.0)), infsup (-1.0, 9.092974268256817094e-01)));
%!test
%! assert (isequal (sin (infsup (2.0, 6.0)), infsup (-1.0, 9.092974268256817094e-01)));
%!test
%! assert (isequal (sin (infsup (2.0, 5.0)), infsup (-1.0, 9.092974268256817094e-01)));
%!test
%! assert (isequal (sin (infsup (2.0, 4.0)), infsup (-7.568024953079283135e-01, 9.092974268256817094e-01)));
%!test
%! assert (isequal (sin (infsup (2.0, 3.0)), infsup (1.411200080598672135e-01, 9.092974268256817094e-01)));
%!test
%! assert (isequal (sin (infsup (2.0, 2.0)), infsup (9.092974268256815984e-01, 9.092974268256817094e-01)));
%!test
%! assert (isequal (sin (infsup (3.0, 7.0)), infsup (-1.0, 6.569865987187891720e-01)));
%!test
%! assert (isequal (sin (infsup (3.0, 6.0)), infsup (-1.0, 1.411200080598672413e-01)));
%!test
%! assert (isequal (sin (infsup (3.0, 5.0)), infsup (-1.0, 1.411200080598672413e-01)));
%!test
%! assert (isequal (sin (infsup (3.0, 4.0)), infsup (-7.568024953079283135e-01, 1.411200080598672413e-01)));
%!test
%! assert (isequal (sin (infsup (3.0, 3.0)), infsup (1.411200080598672135e-01, 1.411200080598672413e-01)));
%!test
%! assert (isequal (sin (infsup (4.0, 7.0)), infsup (-1.0, 6.569865987187891720e-01)));
%!test
%! assert (isequal (sin (infsup (4.0, 6.0)), infsup (-1.0, -2.794154981989258602e-01)));
%!test
%! assert (isequal (sin (infsup (4.0, 5.0)), infsup (-1.0, -7.568024953079282025e-01)));
%!test
%! assert (isequal (sin (infsup (4.0, 4.0)), infsup (-7.568024953079283135e-01, -7.568024953079282025e-01)));
%!test
%! assert (isequal (sin (infsup (5.0, 7.0)), infsup (-9.589242746631385650e-01, 6.569865987187891720e-01)));
%!test
%! assert (isequal (sin (infsup (5.0, 6.0)), infsup (-9.589242746631385650e-01, -2.794154981989258602e-01)));
%!test
%! assert (isequal (sin (infsup (5.0, 5.0)), infsup (-9.589242746631385650e-01, -9.589242746631384540e-01)));
%!test
%! assert (isequal (sin (infsup (6.0, 7.0)), infsup (-2.794154981989259157e-01, 6.569865987187891720e-01)));
%!test
%! assert (isequal (sin (infsup (6.0, 6.0)), infsup (-2.794154981989259157e-01, -2.794154981989258602e-01)));
%!test
%! assert (isequal (sin (infsup (7.0, 7.0)), infsup (6.569865987187890610e-01, 6.569865987187891720e-01)));

## mpfi_sinh

%!# special values
%!test
%! assert (isequal (sinh (infsup (-inf, -7.0)), infsup (-inf, -5.483161232732464896e+02)));
%!test
%! assert (isequal (sinh (infsup (-inf, 0.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (sinh (infsup (-inf, +8.0)), infsup (-inf, 1.490478825789550228e+03)));
%!test
%! assert (isequal (sinh (infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (sinh (infsup (-1.0, 0.0)), infsup (-1.175201193643801600e+00, 0.0)));
%!test
%! assert (isequal (sinh (infsup (0.0, 0.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (sinh (infsup (0.0, +1.0)), infsup (0.0, 1.175201193643801600e+00)));
%!test
%! assert (isequal (sinh (infsup (0.0, +8.0)), infsup (0.0, 1.490478825789550228e+03)));
%!test
%! assert (isequal (sinh (infsup (0.0, inf)), infsup (0.0, inf)));
%!# regular values
%!test
%! assert (isequal (sinh (infsup (-0.125, 0.0)), infsup (-1.253257752411154613e-01, 0.0)));
%!test
%! assert (isequal (sinh (infsup (0.0, 5.000000000000001110e-01)), infsup (0.0, 5.210953054937474960e-01)));
%!test
%! assert (isequal (sinh (infsup (-4.5, -0.625)), infsup (-4.500301115199179236e+01, -6.664922644566160237e-01)));
%!test
%! assert (isequal (sinh (infsup (1.0, 3.0)), infsup (1.175201193643801378e+00, 1.001787492740990260e+01)));

## mpfi_sqr

%!# special values
%!test
%! assert (isequal (pown (infsup (-inf, -7.0), 2), infsup (+49.0, inf)));
%! assert (isequal (infsup (-inf, -7.0) .^ 2, infsup (+49.0, inf)));
%! assert (isequal (power (infsup (-inf, -7.0), 2), infsup (+49.0, inf)));
%! assert (isequal (infsup (-inf, -7.0) ^ 2, infsup (+49.0, inf)));
%! assert (isequal (mpower (infsup (-inf, -7.0), 2), infsup (+49.0, inf)));
%!test
%! assert (isequal (pown (infsup (-inf, 0.0), 2), infsup (0.0, inf)));
%! assert (isequal (infsup (-inf, 0.0) .^ 2, infsup (0.0, inf)));
%! assert (isequal (power (infsup (-inf, 0.0), 2), infsup (0.0, inf)));
%! assert (isequal (infsup (-inf, 0.0) ^ 2, infsup (0.0, inf)));
%! assert (isequal (mpower (infsup (-inf, 0.0), 2), infsup (0.0, inf)));
%!test
%! assert (isequal (pown (infsup (-inf, +8.0), 2), infsup (0.0, inf)));
%! assert (isequal (infsup (-inf, +8.0) .^ 2, infsup (0.0, inf)));
%! assert (isequal (power (infsup (-inf, +8.0), 2), infsup (0.0, inf)));
%! assert (isequal (infsup (-inf, +8.0) ^ 2, infsup (0.0, inf)));
%! assert (isequal (mpower (infsup (-inf, +8.0), 2), infsup (0.0, inf)));
%!test
%! assert (isequal (pown (infsup (-inf, inf), 2), infsup (0.0, inf)));
%! assert (isequal (infsup (-inf, inf) .^ 2, infsup (0.0, inf)));
%! assert (isequal (power (infsup (-inf, inf), 2), infsup (0.0, inf)));
%! assert (isequal (infsup (-inf, inf) ^ 2, infsup (0.0, inf)));
%! assert (isequal (mpower (infsup (-inf, inf), 2), infsup (0.0, inf)));
%!test
%! assert (isequal (pown (infsup (0.0, 0.0), 2), infsup (0.0, 0.0)));
%! assert (isequal (infsup (0.0, 0.0) .^ 2, infsup (0.0, 0.0)));
%! assert (isequal (power (infsup (0.0, 0.0), 2), infsup (0.0, 0.0)));
%! assert (isequal (infsup (0.0, 0.0) ^ 2, infsup (0.0, 0.0)));
%! assert (isequal (mpower (infsup (0.0, 0.0), 2), infsup (0.0, 0.0)));
%!test
%! assert (isequal (pown (infsup (0.0, +8.0), 2), infsup (0.0, +64.0)));
%! assert (isequal (infsup (0.0, +8.0) .^ 2, infsup (0.0, +64.0)));
%! assert (isequal (power (infsup (0.0, +8.0), 2), infsup (0.0, +64.0)));
%! assert (isequal (infsup (0.0, +8.0) ^ 2, infsup (0.0, +64.0)));
%! assert (isequal (mpower (infsup (0.0, +8.0), 2), infsup (0.0, +64.0)));
%!test
%! assert (isequal (pown (infsup (0.0, inf), 2), infsup (0.0, inf)));
%! assert (isequal (infsup (0.0, inf) .^ 2, infsup (0.0, inf)));
%! assert (isequal (power (infsup (0.0, inf), 2), infsup (0.0, inf)));
%! assert (isequal (infsup (0.0, inf) ^ 2, infsup (0.0, inf)));
%! assert (isequal (mpower (infsup (0.0, inf), 2), infsup (0.0, inf)));
%!# regular values
%!test
%! assert (isequal (pown (infsup (5.242813527584075928e-01, 1.009848281860351562e+03), 2), infsup (2.748709368501858208e-01, 1.019793552376304055e+06)));
%! assert (isequal (infsup (5.242813527584075928e-01, 1.009848281860351562e+03) .^ 2, infsup (2.748709368501858208e-01, 1.019793552376304055e+06)));
%! assert (isequal (power (infsup (5.242813527584075928e-01, 1.009848281860351562e+03), 2), infsup (2.748709368501858208e-01, 1.019793552376304055e+06)));
%! assert (isequal (infsup (5.242813527584075928e-01, 1.009848281860351562e+03) ^ 2, infsup (2.748709368501858208e-01, 1.019793552376304055e+06)));
%! assert (isequal (mpower (infsup (5.242813527584075928e-01, 1.009848281860351562e+03), 2), infsup (2.748709368501858208e-01, 1.019793552376304055e+06)));
%!test
%! assert (isequal (pown (infsup (1.020801660558309578e+02, 1.193046000000000000e+06), 2), infsup (1.042036030198602202e+04, 1.423358758116000000e+12)));
%! assert (isequal (infsup (1.020801660558309578e+02, 1.193046000000000000e+06) .^ 2, infsup (1.042036030198602202e+04, 1.423358758116000000e+12)));
%! assert (isequal (power (infsup (1.020801660558309578e+02, 1.193046000000000000e+06), 2), infsup (1.042036030198602202e+04, 1.423358758116000000e+12)));
%! assert (isequal (infsup (1.020801660558309578e+02, 1.193046000000000000e+06) ^ 2, infsup (1.042036030198602202e+04, 1.423358758116000000e+12)));
%! assert (isequal (mpower (infsup (1.020801660558309578e+02, 1.193046000000000000e+06), 2), infsup (1.042036030198602202e+04, 1.423358758116000000e+12)));
%!test
%! assert (isequal (pown (infsup (-1.392367054308168983e+00, 1.000000000000000000e+00), 2), infsup (0.0, 1.938686013922807705e+00)));
%! assert (isequal (infsup (-1.392367054308168983e+00, 1.000000000000000000e+00) .^ 2, infsup (0.0, 1.938686013922807705e+00)));
%! assert (isequal (power (infsup (-1.392367054308168983e+00, 1.000000000000000000e+00), 2), infsup (0.0, 1.938686013922807705e+00)));
%! assert (isequal (infsup (-1.392367054308168983e+00, 1.000000000000000000e+00) ^ 2, infsup (0.0, 1.938686013922807705e+00)));
%! assert (isequal (mpower (infsup (-1.392367054308168983e+00, 1.000000000000000000e+00), 2), infsup (0.0, 1.938686013922807705e+00)));
%!test
%! assert (isequal (pown (infsup (1.418084280671316311e+00, 2.688493217609218444e+00), 2), infsup (2.010963027087084409e+00, 7.227995781130768904e+00)));
%! assert (isequal (infsup (1.418084280671316311e+00, 2.688493217609218444e+00) .^ 2, infsup (2.010963027087084409e+00, 7.227995781130768904e+00)));
%! assert (isequal (power (infsup (1.418084280671316311e+00, 2.688493217609218444e+00), 2), infsup (2.010963027087084409e+00, 7.227995781130768904e+00)));
%! assert (isequal (infsup (1.418084280671316311e+00, 2.688493217609218444e+00) ^ 2, infsup (2.010963027087084409e+00, 7.227995781130768904e+00)));
%! assert (isequal (mpower (infsup (1.418084280671316311e+00, 2.688493217609218444e+00), 2), infsup (2.010963027087084409e+00, 7.227995781130768904e+00)));

## mpfi_sqrt

%!# special values
%!test
%! assert (isequal (realsqrt (infsup (0.0, 0.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (realsqrt (infsup (0.0, +9.0)), infsup (0.0, +3.0)));
%!test
%! assert (isequal (realsqrt (infsup (0.0, inf)), infsup (0.0, inf)));
%!# regular values
%!test
%! assert (isequal (realsqrt (infsup (4.368100000000000000e+04, 1.423358758116000000e+12)), infsup (2.090000000000000000e+02, 1.193046000000000000e+06)));
%!test
%! assert (isequal (realsqrt (infsup (8.929886572570981951e-01, 4.368100000000000000e+04)), infsup (9.449807708398610950e-01, 2.090000000000000000e+02)));
%!test
%! assert (isequal (realsqrt (infsup (6.665191650390625000e-01, 1.047677010367332295e+00)), infsup (8.164062500000000000e-01, 1.023560946093261537e+00)));
%!test
%! assert (isequal (realsqrt (infsup (8.929886572570981951e-01, 1.047677010367332295e+00)), infsup (9.449807708398610950e-01, 1.023560946093261537e+00)));

## mpfi_sub

%!# special values
%!test
%! assert (isequal (infsup (-inf, -7.0) - infsup (-1.0, +8.0), infsup (-inf, -6.0)));
%! assert (isequal (minus (infsup (-inf, -7.0), infsup (-1.0, +8.0)), infsup (-inf, -6.0)));
%!test
%! assert (isequal (infsup (-inf, 0.0) - infsup (+8.0, inf), infsup (-inf, -8.0)));
%! assert (isequal (minus (infsup (-inf, 0.0), infsup (+8.0, inf)), infsup (-inf, -8.0)));
%!test
%! assert (isequal (infsup (-inf, +8.0) - infsup (0.0, +8.0), infsup (-inf, +8.0)));
%! assert (isequal (minus (infsup (-inf, +8.0), infsup (0.0, +8.0)), infsup (-inf, +8.0)));
%!test
%! assert (isequal (infsup (-inf, inf) - infsup (0.0, +8.0), infsup (-inf, inf)));
%! assert (isequal (minus (infsup (-inf, inf), infsup (0.0, +8.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (0.0, 0.0) - infsup (-inf, -7.0), infsup (+7.0, inf)));
%! assert (isequal (minus (infsup (0.0, 0.0), infsup (-inf, -7.0)), infsup (+7.0, inf)));
%!test
%! assert (isequal (infsup (0.0, +8.0) - infsup (-7.0, 0.0), infsup (0.0, +15.0)));
%! assert (isequal (minus (infsup (0.0, +8.0), infsup (-7.0, 0.0)), infsup (0.0, +15.0)));
%!test
%! assert (isequal (infsup (0.0, 0.0) - infsup (0.0, +8.0), infsup (-8.0, 0.0)));
%! assert (isequal (minus (infsup (0.0, 0.0), infsup (0.0, +8.0)), infsup (-8.0, 0.0)));
%!test
%! assert (isequal (infsup (0.0, inf) - infsup (0.0, +8.0), infsup (-8.0, inf)));
%! assert (isequal (minus (infsup (0.0, inf), infsup (0.0, +8.0)), infsup (-8.0, inf)));
%!test
%! assert (isequal (infsup (0.0, 0.0) - infsup (+8.0, inf), infsup (-inf, -8.0)));
%! assert (isequal (minus (infsup (0.0, 0.0), infsup (+8.0, inf)), infsup (-inf, -8.0)));
%!test
%! assert (isequal (infsup (0.0, 0.0) - infsup (-inf, inf), infsup (-inf, inf)));
%! assert (isequal (minus (infsup (0.0, 0.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (0.0, +8.0) - infsup (-7.0, +8.0), infsup (-8.0, +15.0)));
%! assert (isequal (minus (infsup (0.0, +8.0), infsup (-7.0, +8.0)), infsup (-8.0, +15.0)));
%!test
%! assert (isequal (infsup (0.0, 0.0) - infsup (0.0, 0.0), infsup (0.0, 0.0)));
%! assert (isequal (minus (infsup (0.0, 0.0), infsup (0.0, 0.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (infsup (0.0, inf) - infsup (0.0, +8.0), infsup (-8.0, inf)));
%! assert (isequal (minus (infsup (0.0, inf), infsup (0.0, +8.0)), infsup (-8.0, inf)));
%!# regular values
%!test
%! assert (isequal (infsup (-5.0, 59.0) - infsup (17.0, 81.0), infsup (-86.0, 42.0)));
%! assert (isequal (minus (infsup (-5.0, 59.0), infsup (17.0, 81.0)), infsup (-86.0, 42.0)));
%!test
%! assert (isequal (infsup (-4.909093465297726553e-91, 3.202558470389760000e+14) - infsup (-1.264629250000000000e+08, 4.547473508864641190e-13), infsup (-4.547473508864642199e-13, 3.202559735019010000e+14)));
%! assert (isequal (minus (infsup (-4.909093465297726553e-91, 3.202558470389760000e+14), infsup (-1.264629250000000000e+08, 4.547473508864641190e-13)), infsup (-4.547473508864642199e-13, 3.202559735019010000e+14)));
%!test
%! assert (isequal (infsup (-4.0, 7.0) - infsup (-3e300, 2.443359172835548401e+09), infsup (-2.443359176835548401e+09, 3.000000000000000752e+300)));
%! assert (isequal (minus (infsup (-4.0, 7.0), infsup (-3e300, 2.443359172835548401e+09)), infsup (-2.443359176835548401e+09, 3.000000000000000752e+300)));
%!test
%! assert (isequal (infsup (-7.205869356633318400e+16, 1.152921504606846976e+18) - infsup (-3e300, 2.814792717434890000e+14), infsup (-7.234017283807668800e+16, 3.000000000000000752e+300)));
%! assert (isequal (minus (infsup (-7.205869356633318400e+16, 1.152921504606846976e+18), infsup (-3e300, 2.814792717434890000e+14)), infsup (-7.234017283807668800e+16, 3.000000000000000752e+300)));
%!test
%! assert (isequal (infsup (-5.0, 1.0) - infsup (1.0, 1.180591620717411303e+21), infsup (-1.180591620717411566e+21, 0.0)));
%! assert (isequal (minus (infsup (-5.0, 1.0), infsup (1.0, 1.180591620717411303e+21)), infsup (-1.180591620717411566e+21, 0.0)));
%!test
%! assert (isequal (infsup (5.0, 1.180591620717411303e+21) - infsup (3.0, 5.0), infsup (0.0, 1.180591620717411303e+21)));
%! assert (isequal (minus (infsup (5.0, 1.180591620717411303e+21), infsup (3.0, 5.0)), infsup (0.0, 1.180591620717411303e+21)));

## mpfi_sub_d

%!# special values
%!test
%! assert (isequal (infsup (-inf, -7.0) - infsup (-4.000000000000000286e-17, -4.000000000000000286e-17), infsup (-inf, -6.999999999999999112e+00)));
%! assert (isequal (minus (infsup (-inf, -7.0), infsup (-4.000000000000000286e-17, -4.000000000000000286e-17)), infsup (-inf, -6.999999999999999112e+00)));
%!test
%! assert (isequal (infsup (-inf, -7.0) - infsup (0.0, 0.0), infsup (-inf, -7.0)));
%! assert (isequal (minus (infsup (-inf, -7.0), infsup (0.0, 0.0)), infsup (-inf, -7.0)));
%!test
%! assert (isequal (infsup (-inf, -7.0) - infsup (4.000000000000000286e-17, 4.000000000000000286e-17), infsup (-inf, -7.0)));
%! assert (isequal (minus (infsup (-inf, -7.0), infsup (4.000000000000000286e-17, 4.000000000000000286e-17)), infsup (-inf, -7.0)));
%!test
%! assert (isequal (infsup (-inf, 0.0) - infsup (-8.000000000000000572e-17, -8.000000000000000572e-17), infsup (-inf, 8.000000000000000572e-17)));
%! assert (isequal (minus (infsup (-inf, 0.0), infsup (-8.000000000000000572e-17, -8.000000000000000572e-17)), infsup (-inf, 8.000000000000000572e-17)));
%!test
%! assert (isequal (infsup (-inf, 0.0) - infsup (0.0, 0.0), infsup (-inf, 0.0)));
%! assert (isequal (minus (infsup (-inf, 0.0), infsup (0.0, 0.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (infsup (-inf, 0.0) - infsup (8.000000000000000572e-17, 8.000000000000000572e-17), infsup (-inf, -8.0e-17)));
%! assert (isequal (minus (infsup (-inf, 0.0), infsup (8.000000000000000572e-17, 8.000000000000000572e-17)), infsup (-inf, -8.0e-17)));
%!test
%! assert (isequal (infsup (-inf, 8.0) - infsup (-1.600000000000000000e+18, -1.600000000000000000e+18), infsup (-inf, 1.600000000000000256e+18)));
%! assert (isequal (minus (infsup (-inf, 8.0), infsup (-1.600000000000000000e+18, -1.600000000000000000e+18)), infsup (-inf, 1.600000000000000256e+18)));
%!test
%! assert (isequal (infsup (-inf, 8.0) - infsup (0.0, 0.0), infsup (-inf, 8.0)));
%! assert (isequal (minus (infsup (-inf, 8.0), infsup (0.0, 0.0)), infsup (-inf, 8.0)));
%!test
%! assert (isequal (infsup (-inf, 8.0) - infsup (1.600000000000000000e+18, 1.600000000000000000e+18), infsup (-inf, -1.599999999999999744e+18)));
%! assert (isequal (minus (infsup (-inf, 8.0), infsup (1.600000000000000000e+18, 1.600000000000000000e+18)), infsup (-inf, -1.599999999999999744e+18)));
%!test
%! assert (isequal (infsup (-inf, inf) - infsup (-1.600000000000000114e-16, -1.600000000000000114e-16), infsup (-inf, inf)));
%! assert (isequal (minus (infsup (-inf, inf), infsup (-1.600000000000000114e-16, -1.600000000000000114e-16)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-inf, inf) - infsup (0.0e-17, 0.0e-17), infsup (-inf, inf)));
%! assert (isequal (minus (infsup (-inf, inf), infsup (0.0e-17, 0.0e-17)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (-inf, inf) - infsup (1.600000000000000114e-16, 1.600000000000000114e-16), infsup (-inf, inf)));
%! assert (isequal (minus (infsup (-inf, inf), infsup (1.600000000000000114e-16, 1.600000000000000114e-16)), infsup (-inf, inf)));
%!test
%! assert (isequal (infsup (0.0, 0.0) - infsup (-1.000000000000000072e-17, -1.000000000000000072e-17), infsup (1.000000000000000072e-17, 1.000000000000000072e-17)));
%! assert (isequal (minus (infsup (0.0, 0.0), infsup (-1.000000000000000072e-17, -1.000000000000000072e-17)), infsup (1.000000000000000072e-17, 1.000000000000000072e-17)));
%!test
%! assert (isequal (infsup (0.0, 0.0) - infsup (0.0, 0.0), infsup (0.0, 0.0)));
%! assert (isequal (minus (infsup (0.0, 0.0), infsup (0.0, 0.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (infsup (0.0, 0.0) - infsup (1.000000000000000072e-17, 1.000000000000000072e-17), infsup (-1.000000000000000072e-17, -1.000000000000000072e-17)));
%! assert (isequal (minus (infsup (0.0, 0.0), infsup (1.000000000000000072e-17, 1.000000000000000072e-17)), infsup (-1.000000000000000072e-17, -1.000000000000000072e-17)));
%!test
%! assert (isequal (infsup (0.0, 8.0) - infsup (-3.000000000000000061e-17, -3.000000000000000061e-17), infsup (3.000000000000000061e-17, 8.000000000000001776e+00)));
%! assert (isequal (minus (infsup (0.0, 8.0), infsup (-3.000000000000000061e-17, -3.000000000000000061e-17)), infsup (3.000000000000000061e-17, 8.000000000000001776e+00)));
%!test
%! assert (isequal (infsup (0.0, 8.0) - infsup (0.0, 0.0), infsup (0.0, 8.0)));
%! assert (isequal (minus (infsup (0.0, 8.0), infsup (0.0, 0.0)), infsup (0.0, 8.0)));
%!test
%! assert (isequal (infsup (0.0, 8.0) - infsup (3.000000000000000061e-17, 3.000000000000000061e-17), infsup (-3.000000000000000061e-17, 8.0)));
%! assert (isequal (minus (infsup (0.0, 8.0), infsup (3.000000000000000061e-17, 3.000000000000000061e-17)), infsup (-3.000000000000000061e-17, 8.0)));
%!test
%! assert (isequal (infsup (0.0, inf) - infsup (-7.000000000000000347e-17, -7.000000000000000347e-17), infsup (7.000000000000000347e-17, inf)));
%! assert (isequal (minus (infsup (0.0, inf), infsup (-7.000000000000000347e-17, -7.000000000000000347e-17)), infsup (7.000000000000000347e-17, inf)));
%!test
%! assert (isequal (infsup (0.0, inf) - infsup (0.0, 0.0), infsup (0.0, inf)));
%! assert (isequal (minus (infsup (0.0, inf), infsup (0.0, 0.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (infsup (0.0, inf) - infsup (6.999999999999999114e-17, 6.999999999999999114e-17), infsup (-6.999999999999999114e-17, inf)));
%! assert (isequal (minus (infsup (0.0, inf), infsup (6.999999999999999114e-17, 6.999999999999999114e-17)), infsup (-6.999999999999999114e-17, inf)));
%!# regular values
%!test
%! assert (isequal (infsup (-32.0, -17.0) - infsup (3.141592653589793116e+01, 3.141592653589793116e+01), infsup (-6.341592653589793116e+01, -4.841592653589793116e+01)));
%! assert (isequal (minus (infsup (-32.0, -17.0), infsup (3.141592653589793116e+01, 3.141592653589793116e+01)), infsup (-6.341592653589793116e+01, -4.841592653589793116e+01)));
%!test
%! assert (isequal (infsup (-3.141592653589793116e+01, -17.0) - infsup (-3.141592653589793116e+01, -3.141592653589793116e+01), infsup (0.0, 1.441592653589793116e+01)));
%! assert (isequal (minus (infsup (-3.141592653589793116e+01, -17.0), infsup (-3.141592653589793116e+01, -3.141592653589793116e+01)), infsup (0.0, 1.441592653589793116e+01)));
%!test
%! assert (isequal (infsup (-32.0, -1.570796326794896558e+01) - infsup (-1.570796326794896558e+01, -1.570796326794896558e+01), infsup (-1.629203673205103442e+01, 0.0)));
%! assert (isequal (minus (infsup (-32.0, -1.570796326794896558e+01), infsup (-1.570796326794896558e+01, -1.570796326794896558e+01)), infsup (-1.629203673205103442e+01, 0.0)));
%!test
%! assert (isequal (infsup (1.820444444444444443e+01, 3.202559735019019375e+14) - infsup (-3.5, -3.5), infsup (2.170444444444444443e+01, 3.202559735019054375e+14)));
%! assert (isequal (minus (infsup (1.820444444444444443e+01, 3.202559735019019375e+14), infsup (-3.5, -3.5)), infsup (2.170444444444444443e+01, 3.202559735019054375e+14)));
%!test
%! assert (isequal (infsup (7.111111111111111105e-02, 3.202559735019019375e+14) - infsup (-3.5, -3.5), infsup (3.571111111111110681e+00, 3.202559735019054375e+14)));
%! assert (isequal (minus (infsup (7.111111111111111105e-02, 3.202559735019019375e+14), infsup (-3.5, -3.5)), infsup (3.571111111111110681e+00, 3.202559735019054375e+14)));
%!test
%! assert (isequal (infsup (-2.550000000000000000e+02, 1.137777777777777777e+00) - infsup (-256.5, -256.5), infsup (1.500000000000000000e+00, 2.576377777777777851e+02)));
%! assert (isequal (minus (infsup (-2.550000000000000000e+02, 1.137777777777777777e+00), infsup (-256.5, -256.5)), infsup (1.500000000000000000e+00, 2.576377777777777851e+02)));
%!test
%! assert (isequal (infsup (-1.999999999999999778e+00, -2.713328551617526225e-166) - infsup (-4097.5, -4097.5), infsup (4.095500000000000000e+03, 4.097500000000000000e+03)));
%! assert (isequal (minus (infsup (-1.999999999999999778e+00, -2.713328551617526225e-166), infsup (-4097.5, -4097.5)), infsup (4.095500000000000000e+03, 4.097500000000000000e+03)));
%!test
%! assert (isequal (infsup (1.820444444444444443e+01, 3.202559735019019375e+14) - infsup (3.5, 3.5), infsup (1.470444444444444443e+01, 3.202559735018984375e+14)));
%! assert (isequal (minus (infsup (1.820444444444444443e+01, 3.202559735019019375e+14), infsup (3.5, 3.5)), infsup (1.470444444444444443e+01, 3.202559735018984375e+14)));
%!test
%! assert (isequal (infsup (7.111111111111111105e-02, 3.202559735019019375e+14) - infsup (3.5, 3.5), infsup (-3.428888888888889319e+00, 3.202559735018984375e+14)));
%! assert (isequal (minus (infsup (7.111111111111111105e-02, 3.202559735019019375e+14), infsup (3.5, 3.5)), infsup (-3.428888888888889319e+00, 3.202559735018984375e+14)));
%!test
%! assert (isequal (infsup (-2.550000000000000000e+02, 1.137777777777777777e+00) - infsup (256.5, 256.5), infsup (-5.115000000000000000e+02, -2.553622222222222149e+02)));
%! assert (isequal (minus (infsup (-2.550000000000000000e+02, 1.137777777777777777e+00), infsup (256.5, 256.5)), infsup (-5.115000000000000000e+02, -2.553622222222222149e+02)));
%!test
%! assert (isequal (infsup (-1.999999999999999778e+00, -2.713328551617526225e-166) - infsup (4097.5, 4097.5), infsup (-4.099500000000000000e+03, -4.097500000000000000e+03)));
%! assert (isequal (minus (infsup (-1.999999999999999778e+00, -2.713328551617526225e-166), infsup (4097.5, 4097.5)), infsup (-4.099500000000000000e+03, -4.097500000000000000e+03)));

## mpfi_tan

%!# special values
%!test
%! assert (isequal (tan (infsup (-inf, -7.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (tan (infsup (-inf, 0.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (tan (infsup (-inf, +8.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (tan (infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (tan (infsup (-1.0, 0.0)), infsup (-1.557407724654902292e+00, 0.0)));
%!test
%! assert (isequal (tan (infsup (0.0, 0.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (tan (infsup (0.0, +1.0)), infsup (0.0, 1.557407724654902292e+00)));
%!test
%! assert (isequal (tan (infsup (0.0, +8.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (tan (infsup (0.0, inf)), infsup (-inf, inf)));
%!# regular values
%!test
%! assert (isequal (tan (infsup (0.125, 17.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (tan (infsup (1.570796326794896558e+00, 1.570796326794896780e+00)), infsup (-inf, inf)));
%!test
%! assert (isequal (tan (infsup (-2.0, -0.5)), infsup (-inf, inf)));
%!test
%! assert (isequal (tan (infsup (-4.5, 0.625)), infsup (-inf, inf)));
%!test
%! assert (isequal (tan (infsup (-1.0, -0.25)), infsup (-1.557407724654902292e+00, -2.553419212210362166e-01)));
%!test
%! assert (isequal (tan (infsup (-0.5, 0.5)), infsup (-5.463024898437905952e-01, 5.463024898437905952e-01)));
%!test
%! assert (isequal (tan (infsup (8.538038601028318546e+24, 8.538038601028318546e+24)), infsup (-2.230768789827465293e-01, -2.230768789827465015e-01)));
%!test
%! assert (isequal (tan (infsup (-7.0, 7.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (tan (infsup (-7.0, 6.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (tan (infsup (-7.0, 5.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (tan (infsup (-7.0, 4.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (tan (infsup (-7.0, 3.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (tan (infsup (-7.0, 2.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (tan (infsup (-7.0, 1.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (tan (infsup (-7.0, 0.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (tan (infsup (-7.0, -1.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (tan (infsup (-7.0, -2.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (tan (infsup (-7.0, -3.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (tan (infsup (-7.0, -4.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (tan (infsup (-7.0, -5.0)), infsup (-8.714479827243187815e-01, 3.380515006246585852e+00)));
%!test
%! assert (isequal (tan (infsup (-7.0, -6.0)), infsup (-8.714479827243187815e-01, 2.910061913847492021e-01)));
%!test
%! assert (isequal (tan (infsup (-7.0, -7.0)), infsup (-8.714479827243187815e-01, -8.714479827243186705e-01)));
%!test
%! assert (isequal (tan (infsup (-6.0, 7.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (tan (infsup (-6.0, 6.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (tan (infsup (-6.0, 5.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (tan (infsup (-6.0, 4.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (tan (infsup (-6.0, 3.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (tan (infsup (-6.0, 2.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (tan (infsup (-6.0, 1.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (tan (infsup (-6.0, 0.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (tan (infsup (-6.0, -1.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (tan (infsup (-6.0, -2.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (tan (infsup (-6.0, -3.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (tan (infsup (-6.0, -4.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (tan (infsup (-6.0, -5.0)), infsup (2.910061913847491466e-01, 3.380515006246585852e+00)));
%!test
%! assert (isequal (tan (infsup (-6.0, -6.0)), infsup (2.910061913847491466e-01, 2.910061913847492021e-01)));
%!test
%! assert (isequal (tan (infsup (-5.0, 7.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (tan (infsup (-5.0, 6.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (tan (infsup (-5.0, 5.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (tan (infsup (-5.0, 4.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (tan (infsup (-5.0, 3.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (tan (infsup (-5.0, 2.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (tan (infsup (-5.0, 1.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (tan (infsup (-5.0, 0.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (tan (infsup (-5.0, -1.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (tan (infsup (-5.0, -2.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (tan (infsup (-5.0, -3.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (tan (infsup (-5.0, -4.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (tan (infsup (-5.0, -5.0)), infsup (3.380515006246585408e+00, 3.380515006246585852e+00)));
%!test
%! assert (isequal (tan (infsup (-4.0, 7.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (tan (infsup (-4.0, 6.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (tan (infsup (-4.0, 5.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (tan (infsup (-4.0, 4.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (tan (infsup (-4.0, 3.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (tan (infsup (-4.0, 2.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (tan (infsup (-4.0, 1.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (tan (infsup (-4.0, 0.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (tan (infsup (-4.0, -1.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (tan (infsup (-4.0, -2.0)), infsup (-1.157821282349577707e+00, 2.185039863261519333e+00)));
%!test
%! assert (isequal (tan (infsup (-4.0, -3.0)), infsup (-1.157821282349577707e+00, 1.425465430742778317e-01)));
%!test
%! assert (isequal (tan (infsup (-4.0, -4.0)), infsup (-1.157821282349577707e+00, -1.157821282349577485e+00)));
%!test
%! assert (isequal (tan (infsup (-3.0, 7.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (tan (infsup (-3.0, 6.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (tan (infsup (-3.0, 5.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (tan (infsup (-3.0, 4.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (tan (infsup (-3.0, 3.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (tan (infsup (-3.0, 2.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (tan (infsup (-3.0, 1.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (tan (infsup (-3.0, 0.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (tan (infsup (-3.0, -1.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (tan (infsup (-3.0, -2.0)), infsup (1.425465430742778039e-01, 2.185039863261519333e+00)));
%!test
%! assert (isequal (tan (infsup (-3.0, -3.0)), infsup (1.425465430742778039e-01, 1.425465430742778317e-01)));
%!test
%! assert (isequal (tan (infsup (-2.0, 7.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (tan (infsup (-2.0, 6.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (tan (infsup (-2.0, 5.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (tan (infsup (-2.0, 4.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (tan (infsup (-2.0, 3.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (tan (infsup (-2.0, 2.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (tan (infsup (-2.0, 1.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (tan (infsup (-2.0, 0.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (tan (infsup (-2.0, -1.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (tan (infsup (-2.0, -2.0)), infsup (2.185039863261518889e+00, 2.185039863261519333e+00)));
%!test
%! assert (isequal (tan (infsup (-1.0, 7.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (tan (infsup (-1.0, 6.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (tan (infsup (-1.0, 5.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (tan (infsup (-1.0, 4.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (tan (infsup (-1.0, 3.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (tan (infsup (-1.0, 2.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (tan (infsup (-1.0, 1.0)), infsup (-1.557407724654902292e+00, 1.557407724654902292e+00)));
%!test
%! assert (isequal (tan (infsup (-1.0, 0.0)), infsup (-1.557407724654902292e+00, 0.0)));
%!test
%! assert (isequal (tan (infsup (-1.0, -1.0)), infsup (-1.557407724654902292e+00, -1.557407724654902070e+00)));
%!test
%! assert (isequal (tan (infsup (1.0, 7.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (tan (infsup (1.0, 6.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (tan (infsup (1.0, 5.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (tan (infsup (1.0, 4.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (tan (infsup (1.0, 3.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (tan (infsup (1.0, 2.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (tan (infsup (1.0, 1.0)), infsup (1.557407724654902070e+00, 1.557407724654902292e+00)));
%!test
%! assert (isequal (tan (infsup (2.0, 7.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (tan (infsup (2.0, 6.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (tan (infsup (2.0, 5.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (tan (infsup (2.0, 4.0)), infsup (-2.185039863261519333e+00, 1.157821282349577707e+00)));
%!test
%! assert (isequal (tan (infsup (2.0, 3.0)), infsup (-2.185039863261519333e+00, -1.425465430742778039e-01)));
%!test
%! assert (isequal (tan (infsup (2.0, 2.0)), infsup (-2.185039863261519333e+00, -2.185039863261518889e+00)));
%!test
%! assert (isequal (tan (infsup (3.0, 7.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (tan (infsup (3.0, 6.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (tan (infsup (3.0, 5.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (tan (infsup (3.0, 4.0)), infsup (-1.425465430742778317e-01, 1.157821282349577707e+00)));
%!test
%! assert (isequal (tan (infsup (3.0, 3.0)), infsup (-1.425465430742778317e-01, -1.425465430742778039e-01)));
%!test
%! assert (isequal (tan (infsup (4.0, 7.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (tan (infsup (4.0, 6.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (tan (infsup (4.0, 5.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (tan (infsup (4.0, 4.0)), infsup (1.157821282349577485e+00, 1.157821282349577707e+00)));
%!test
%! assert (isequal (tan (infsup (5.0, 7.0)), infsup (-3.380515006246585852e+00, 8.714479827243187815e-01)));
%!test
%! assert (isequal (tan (infsup (5.0, 6.0)), infsup (-3.380515006246585852e+00, -2.910061913847491466e-01)));
%!test
%! assert (isequal (tan (infsup (5.0, 5.0)), infsup (-3.380515006246585852e+00, -3.380515006246585408e+00)));
%!test
%! assert (isequal (tan (infsup (6.0, 7.0)), infsup (-2.910061913847492021e-01, 8.714479827243187815e-01)));
%!test
%! assert (isequal (tan (infsup (6.0, 6.0)), infsup (-2.910061913847492021e-01, -2.910061913847491466e-01)));
%!test
%! assert (isequal (tan (infsup (7.0, 7.0)), infsup (8.714479827243186705e-01, 8.714479827243187815e-01)));

## mpfi_tanh

%!# special values
%!test
%! assert (isequal (tanh (infsup (-inf, -7.0)), infsup (-1.0, -9.999983369439445768e-01)));
%!test
%! assert (isequal (tanh (infsup (-inf, 0.0)), infsup (-1.0, 0.0)));
%!test
%! assert (isequal (tanh (infsup (-inf, 8.0)), infsup (-1.0, 9.999997749296759553e-01)));
%!test
%! assert (isequal (tanh (infsup (-inf, inf)), infsup (-1.0, +1.0)));
%!test
%! assert (isequal (tanh (infsup (-1.0, 0.0)), infsup (-7.615941559557649621e-01, 0.0)));
%!test
%! assert (isequal (tanh (infsup (0.0, 0.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (tanh (infsup (0.0, 1.0)), infsup (0.0, 7.615941559557649621e-01)));
%!test
%! assert (isequal (tanh (infsup (0.0, 8.0)), infsup (0.0, 9.999997749296759553e-01)));
%!test
%! assert (isequal (tanh (infsup (0.0, inf)), infsup (0.0, +1.0)));
%!# regular values
%!test
%! assert (isequal (tanh (infsup (-0.125, 0.0)), infsup (-1.243530017715962083e-01, 0.0)));
%!test
%! assert (isequal (tanh (infsup (0.0, 5.000000000000001110e-01)), infsup (0.0, 4.621171572600098476e-01)));
%!test
%! assert (isequal (tanh (infsup (-4.5, -0.625)), infsup (-9.997532108480275959e-01, -5.545997223493822625e-01)));
%!test
%! assert (isequal (tanh (infsup (1.0, 3.0)), infsup (7.615941559557648510e-01, 9.950547536867304643e-01)));
%!test
%! assert (isequal (tanh (infsup (17.0, 18.0)), infsup (9.999999999999965583e-01, 9.999999999999995559e-01)));

## mpfi_union

%!# special values
%!test
%! assert (isequal (union (infsup (-inf, -7.0), infsup (-1.0, +8.0)), infsup (-inf, +8.0)));
%!test
%! assert (isequal (union (infsup (-inf, 0.0), infsup (+8.0, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (union (infsup (-inf, +8.0), infsup (0.0, +8.0)), infsup (-inf, +8.0)));
%!test
%! assert (isequal (union (infsup (-inf, inf), infsup (0.0, +8.0)), infsup (-inf, inf)));
%!test
%! assert (isequal (union (infsup (0.0, 0.0), infsup (-inf, -7.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (union (infsup (0.0, +8.0), infsup (-7.0, 0.0)), infsup (-7.0, +8.0)));
%!test
%! assert (isequal (union (infsup (0.0, 0.0), infsup (0.0, +8.0)), infsup (0.0, +8.0)));
%!test
%! assert (isequal (union (infsup (0.0, inf), infsup (0.0, +8.0)), infsup (0.0, inf)));
%!test
%! assert (isequal (union (infsup (0.0, 0.0), infsup (+8.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (union (infsup (0.0, 0.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (union (infsup (0.0, +8.0), infsup (-7.0, +8.0)), infsup (-7.0, +8.0)));
%!test
%! assert (isequal (union (infsup (0.0, 0.0), infsup (0.0, 0.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (union (infsup (0.0, inf), infsup (0.0, +8.0)), infsup (0.0, inf)));
%!# regular values
%!test
%! assert (isequal (union (infsup (1.800000000000000000e+01, 1.440000000000000000e+02), infsup (-1.300000000000000000e+01, 5.200000000000000000e+01)), infsup (-1.300000000000000000e+01, 1.440000000000000000e+02)));
