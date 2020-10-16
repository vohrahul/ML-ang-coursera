## DO NOT EDIT!  Generated automatically from test/pow_rev.itl
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

## minimal.powRev1_test
##
## The following tests use boundaries for the first parameter whose reciprocal
## can be computed without round-off error in a binary floating-point context.
## Thus, an implementation should be able to compute tight results with the
## formula x = z ^ (1 / y) for the intervals used here.
## 
## The test values are structured according to table B.1 in
## Heimlich, Oliver. 2011. “The General Interval Power Function.”
## Diplomarbeit, Institute for Computer Science, University of Würzburg.
## http://exp.ln0.de/heimlich-power-2011.htm.
##
%!# Empty intervals
%!test
%! assert (isequal (powrev1 (infsup, infsup, infsup), infsup));
%!test
%! assert (isequal (powrev1 (infsup, infsup (-inf, inf), infsup), infsup));
%!test
%! assert (isequal (powrev1 (infsup (-inf, inf), infsup, infsup), infsup));
%!test
%! assert (isequal (powrev1 (infsup (-inf, inf), infsup (-inf, inf), infsup), infsup));
%!test
%! assert (isequal (powrev1 (infsup, infsup, infsup (-inf, inf)), infsup));
%!test
%! assert (isequal (powrev1 (infsup, infsup (-inf, inf), infsup (-inf, inf)), infsup));
%!test
%! assert (isequal (powrev1 (infsup (-inf, inf), infsup, infsup (-inf, inf)), infsup));
%!# Entire range
%!test
%! assert (isequal (powrev1 (infsup (-inf, inf), infsup (-inf, inf), infsup (-inf, inf)), infsup (0.0, inf)));
%!# Outside of the function's domain
%!test
%! assert (isequal (powrev1 (infsup (-inf, inf), infsup (-inf, inf), infsup (-inf, -1.0)), infsup));
%!test
%! assert (isequal (powrev1 (infsup (-inf, -1.0), infsup (-inf, inf), infsup (-inf, 0.0)), infsup));
%!test
%! assert (isequal (powrev1 (infsup (-inf, 0.0), infsup (-inf, inf), infsup (-inf, 0.0)), infsup));
%!test
%! assert (isequal (powrev1 (infsup (-inf, 0.0), infsup (-inf, 0.0), infsup (-inf, inf)), infsup));
%!test
%! assert (isequal (powrev1 (infsup (-inf, 0.0), infsup (-inf, 0.9), infsup (0.0, 1.0)), infsup));
%!test
%! assert (isequal (powrev1 (infsup (-inf, 0.0), infsup (1.1, inf), infsup (1.0, inf)), infsup));
%!test
%! assert (isequal (powrev1 (infsup (0.0, inf), infsup (1.1, inf), infsup (0.0, 1.0)), infsup));
%!test
%! assert (isequal (powrev1 (infsup (0.0, inf), infsup (-inf, 0.9), infsup (1.0, inf)), infsup));
%!test
%! assert (isequal (powrev1 (infsup (0.0, 0.0), infsup (1.0, 1.0), infsup (-inf, 0.0)), infsup));
%!# 0^y = 0
%!test
%! assert (isequal (powrev1 (infsup (-inf, inf), infsup (0.0, 0.0), infsup (-inf, inf)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, inf), infsup (-inf, 0.0), infsup (-inf, inf)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (powrev1 (infsup (0.0, inf), infsup (-inf, 0.0), infsup (-inf, inf)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (powrev1 (infsup (0.0, inf), infsup (0.0, 0.0), infsup (-inf, inf)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (powrev1 (infsup (1.0, 2.0), infsup (0.0, 0.0), infsup (-inf, inf)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (powrev1 (infsup (1.0, 1.0), infsup (0.0, 0.0), infsup (0.0, 0.0)), infsup (0.0, 0.0)));
%!# 1^y = x^0 = 1
%!test
%! assert (isequal (powrev1 (infsup (-inf, inf), infsup (1.0, 1.0), infsup (1.0, 1.0)), infsup (1.0, 1.0)));
%!test
%! assert (isequal (powrev1 (infsup (0.0, 0.0), infsup (1.0, 1.0), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (0.0, 0.0), infsup (1.0, 1.0), infsup (2.0, 3.0)), infsup (2.0, 3.0)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, inf), infsup (1.0, 1.0), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, inf), infsup (1.0, 1.0), infsup (20.0, 30.0)), infsup (20.0, 30.0)));
%!test
%! assert (isequal (powrev1 (infsup (0.0, 0.0), infsup (1.0, 1.0), infsup (1.0, 1.0)), infsup (1.0, 1.0)));
%!# y < 0, z overlaps/starts [0,1]
%!test
%! assert (isequal (powrev1 (infsup (-4.0, -2.0), infsup (0.0, 0.5), infsup (-inf, inf)), infsup (1.189207115002721027e+00, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, -2.0), infsup (0.0, 0.5), infsup (-inf, inf)), infsup (1.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-4.0, -2.0), infsup (-inf, 0.5), infsup (-inf, inf)), infsup (1.189207115002721027e+00, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, -2.0), infsup (-inf, 0.5), infsup (-inf, inf)), infsup (1.0, inf)));
%!# y < 0, z containedBy [0, 1]
%!test
%! assert (isequal (powrev1 (infsup (-4.0, -2.0), infsup (0.25, 0.5), infsup (-inf, inf)), infsup (1.189207115002721027e+00, 2.0)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, -2.0), infsup (0.25, 0.5), infsup (-inf, inf)), infsup (1.0, 2.0)));
%!# y < 0, z finishes [0, 1]
%!test
%! assert (isequal (powrev1 (infsup (-4.0, -2.0), infsup (0.25, 1.0), infsup (-inf, inf)), infsup (1.0, 2.0)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, -2.0), infsup (0.25, 1.0), infsup (-inf, inf)), infsup (1.0, 2.0)));
%!test
%! assert (isequal (powrev1 (infsup (-4.0, -2.0), infsup (1.0, 1.0), infsup (-inf, inf)), infsup (1.0, 1.0)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, -2.0), infsup (1.0, 1.0), infsup (-inf, inf)), infsup (1.0, 1.0)));
%!# y < 0, z equals/finishedBy [0, 1]
%!test
%! assert (isequal (powrev1 (infsup (-4.0, -2.0), infsup (0.0, 1.0), infsup (-inf, inf)), infsup (1.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, -2.0), infsup (0.0, 1.0), infsup (-inf, inf)), infsup (1.0, inf)));
%!# y < 0, z contains/startedBy [0, 1]
%!test
%! assert (isequal (powrev1 (infsup (-4.0, -2.0), infsup (0.0, 2.0), infsup (-inf, inf)), infsup (7.071067811865474617e-01, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, -2.0), infsup (0.0, 2.0), infsup (-inf, inf)), infsup (7.071067811865474617e-01, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-4.0, -2.0), infsup (0.0, inf), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, -2.0), infsup (0.0, inf), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-4.0, -2.0), infsup (-inf, 2.0), infsup (-inf, inf)), infsup (7.071067811865474617e-01, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, -2.0), infsup (-inf, 2.0), infsup (-inf, inf)), infsup (7.071067811865474617e-01, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-4.0, -2.0), infsup (-inf, inf), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, -2.0), infsup (-inf, inf), infsup (-inf, inf)), infsup (0.0, inf)));
%!# y < 0, z overlappedBy [0, 1]
%!test
%! assert (isequal (powrev1 (infsup (-4.0, -2.0), infsup (0.5, 2.0), infsup (-inf, inf)), infsup (7.071067811865474617e-01, 1.414213562373095145e+00)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, -2.0), infsup (0.5, 2.0), infsup (-inf, inf)), infsup (7.071067811865474617e-01, 1.414213562373095145e+00)));
%!test
%! assert (isequal (powrev1 (infsup (-4.0, -2.0), infsup (0.5, inf), infsup (-inf, inf)), infsup (0.0, 1.414213562373095145e+00)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, -2.0), infsup (0.5, inf), infsup (-inf, inf)), infsup (0.0, 1.414213562373095145e+00)));
%!# y < 0, z metBy [0, 1]
%!test
%! assert (isequal (powrev1 (infsup (-4.0, -2.0), infsup (1.0, 2.0), infsup (-inf, inf)), infsup (7.071067811865474617e-01, 1.0)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, -2.0), infsup (1.0, 2.0), infsup (-inf, inf)), infsup (7.071067811865474617e-01, 1.0)));
%!test
%! assert (isequal (powrev1 (infsup (-4.0, -2.0), infsup (1.0, inf), infsup (-inf, inf)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, -2.0), infsup (1.0, inf), infsup (-inf, inf)), infsup (0.0, 1.0)));
%!# y < 0, z after [0, 1]
%!test
%! assert (isequal (powrev1 (infsup (-4.0, -2.0), infsup (2.0, 4.0), infsup (-inf, inf)), infsup (0.5, 8.408964152537146131e-01)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, -2.0), infsup (2.0, 4.0), infsup (-inf, inf)), infsup (0.5, 1.0)));
%!test
%! assert (isequal (powrev1 (infsup (-4.0, -2.0), infsup (2.0, inf), infsup (-inf, inf)), infsup (0.0, 8.408964152537146131e-01)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, -2.0), infsup (2.0, inf), infsup (-inf, inf)), infsup (0.0, 1.0)));
%!# y = 0, z overlaps/starts [0,1]
%!test
%! assert (isequal (powrev1 (infsup (0.0, 0.0), infsup (0.0, 0.5), infsup (-inf, inf)), infsup));
%!test
%! assert (isequal (powrev1 (infsup (0.0, 0.0), infsup (-inf, 0.5), infsup (-inf, inf)), infsup));
%!# y = 0, z containedBy [0, 1]
%!test
%! assert (isequal (powrev1 (infsup (0.0, 0.0), infsup (0.25, 0.5), infsup (-inf, inf)), infsup));
%!# y = 0, z finishes [0, 1]
%!test
%! assert (isequal (powrev1 (infsup (0.0, 0.0), infsup (0.25, 1.0), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (0.0, 0.0), infsup (1.0, 1.0), infsup (-inf, inf)), infsup (0.0, inf)));
%!# y = 0, z equals/finishedBy [0, 1]
%!test
%! assert (isequal (powrev1 (infsup (0.0, 0.0), infsup (0.0, 1.0), infsup (-inf, inf)), infsup (0.0, inf)));
%!# y = 0, z contains/startedBy [0, 1]
%!test
%! assert (isequal (powrev1 (infsup (0.0, 0.0), infsup (0.0, 2.0), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (0.0, 0.0), infsup (0.0, inf), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (0.0, 0.0), infsup (-inf, 2.0), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (0.0, 0.0), infsup (-inf, inf), infsup (-inf, inf)), infsup (0.0, inf)));
%!# y = 0, z overlappedBy [0, 1]
%!test
%! assert (isequal (powrev1 (infsup (0.0, 0.0), infsup (0.5, 2.0), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (0.0, 0.0), infsup (0.5, inf), infsup (-inf, inf)), infsup (0.0, inf)));
%!# y = 0, z metBy [0, 1]
%!test
%! assert (isequal (powrev1 (infsup (0.0, 0.0), infsup (1.0, 2.0), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (0.0, 0.0), infsup (1.0, inf), infsup (-inf, inf)), infsup (0.0, inf)));
%!# y = 0, z after [0, 1]
%!test
%! assert (isequal (powrev1 (infsup (0.0, 0.0), infsup (2.0, 4.0), infsup (-inf, inf)), infsup));
%!test
%! assert (isequal (powrev1 (infsup (0.0, 0.0), infsup (2.0, inf), infsup (-inf, inf)), infsup));
%!# y finishedBy 0, z overlaps/starts [0,1]
%!test
%! assert (isequal (powrev1 (infsup (-4.0, 0.0), infsup (0.0, 0.5), infsup (-inf, inf)), infsup (1.189207115002721027e+00, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, 0.0), infsup (0.0, 0.5), infsup (-inf, inf)), infsup (1.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-4.0, 0.0), infsup (-inf, 0.5), infsup (-inf, inf)), infsup (1.189207115002721027e+00, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, 0.0), infsup (-inf, 0.5), infsup (-inf, inf)), infsup (1.0, inf)));
%!# y finishedBy 0, z containedBy [0, 1]
%!test
%! assert (isequal (powrev1 (infsup (-4.0, 0.0), infsup (0.25, 0.5), infsup (-inf, inf)), infsup (1.189207115002721027e+00, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, 0.0), infsup (0.25, 0.5), infsup (-inf, inf)), infsup (1.0, inf)));
%!# y finishedBy 0, z finishes [0, 1]
%!test
%! assert (isequal (powrev1 (infsup (-4.0, 0.0), infsup (0.25, 1.0), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, 0.0), infsup (0.25, 1.0), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-4.0, 0.0), infsup (1.0, 1.0), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, 0.0), infsup (1.0, 1.0), infsup (-inf, inf)), infsup (0.0, inf)));
%!# y finishedBy 0, z equals/finishedBy [0, 1]
%!test
%! assert (isequal (powrev1 (infsup (-4.0, 0.0), infsup (0.0, 1.0), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, 0.0), infsup (0.0, 1.0), infsup (-inf, inf)), infsup (0.0, inf)));
%!# y finishedBy 0, z contains/startedBy [0, 1]
%!test
%! assert (isequal (powrev1 (infsup (-4.0, 0.0), infsup (0.0, 2.0), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, 0.0), infsup (0.0, 2.0), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-4.0, 0.0), infsup (0.0, inf), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, 0.0), infsup (0.0, inf), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-4.0, 0.0), infsup (-inf, 2.0), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, 0.0), infsup (-inf, 2.0), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-4.0, 0.0), infsup (-inf, inf), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, 0.0), infsup (-inf, inf), infsup (-inf, inf)), infsup (0.0, inf)));
%!# y finishedBy 0, z overlappedBy [0, 1]
%!test
%! assert (isequal (powrev1 (infsup (-4.0, 0.0), infsup (0.5, 2.0), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, 0.0), infsup (0.5, 2.0), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-4.0, 0.0), infsup (0.5, inf), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, 0.0), infsup (0.5, inf), infsup (-inf, inf)), infsup (0.0, inf)));
%!# y finishedBy 0, z metBy [0, 1]
%!test
%! assert (isequal (powrev1 (infsup (-4.0, 0.0), infsup (1.0, 2.0), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, 0.0), infsup (1.0, 2.0), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-4.0, 0.0), infsup (1.0, inf), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, 0.0), infsup (1.0, inf), infsup (-inf, inf)), infsup (0.0, inf)));
%!# y finishedBy 0, z after [0, 1]
%!test
%! assert (isequal (powrev1 (infsup (-4.0, 0.0), infsup (2.0, 4.0), infsup (-inf, inf)), infsup (0.0, 8.408964152537146131e-01)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, 0.0), infsup (2.0, 4.0), infsup (-inf, inf)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (powrev1 (infsup (-4.0, 0.0), infsup (2.0, inf), infsup (-inf, inf)), infsup (0.0, 8.408964152537146131e-01)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, 0.0), infsup (2.0, inf), infsup (-inf, inf)), infsup (0.0, 1.0)));
%!# y contains 0, z overlaps/starts [0,1]
%!test
%! assert (isequal (powrev1 (infsup (-4.0, 4.0), infsup (0.0, 0.5), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, 4.0), infsup (0.0, 0.5), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-4.0, 4.0), infsup (-inf, 0.5), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, 4.0), infsup (-inf, 0.5), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-4.0, inf), infsup (0.0, 0.5), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, inf), infsup (0.0, 0.5), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-4.0, inf), infsup (-inf, 0.5), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, inf), infsup (-inf, 0.5), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-4.0, 4.0), infsup (0.0, 0.5), infsup (0.0, 1.0)), infsup (0.0, 8.408964152537146131e-01)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, 4.0), infsup (0.0, 0.5), infsup (0.0, 1.0)), infsup (0.0, 8.408964152537146131e-01)));
%!test
%! assert (isequal (powrev1 (infsup (-4.0, 4.0), infsup (-inf, 0.5), infsup (0.0, 1.0)), infsup (0.0, 8.408964152537146131e-01)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, 4.0), infsup (-inf, 0.5), infsup (0.0, 1.0)), infsup (0.0, 8.408964152537146131e-01)));
%!test
%! assert (isequal (powrev1 (infsup (-4.0, inf), infsup (0.0, 0.5), infsup (0.0, 1.0)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, inf), infsup (0.0, 0.5), infsup (0.0, 1.0)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (powrev1 (infsup (-4.0, inf), infsup (-inf, 0.5), infsup (0.0, 1.0)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, inf), infsup (-inf, 0.5), infsup (0.0, 1.0)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (powrev1 (infsup (-4.0, 4.0), infsup (0.0, 0.5), infsup (1.0, inf)), infsup (1.189207115002721027e+00, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, 4.0), infsup (0.0, 0.5), infsup (1.0, inf)), infsup (1.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-4.0, 4.0), infsup (-inf, 0.5), infsup (1.0, inf)), infsup (1.189207115002721027e+00, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, 4.0), infsup (-inf, 0.5), infsup (1.0, inf)), infsup (1.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-4.0, inf), infsup (0.0, 0.5), infsup (1.0, inf)), infsup (1.189207115002721027e+00, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, inf), infsup (0.0, 0.5), infsup (1.0, inf)), infsup (1.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-4.0, inf), infsup (-inf, 0.5), infsup (1.0, inf)), infsup (1.189207115002721027e+00, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, inf), infsup (-inf, 0.5), infsup (1.0, inf)), infsup (1.0, inf)));
%!# y contains 0, z containedBy [0, 1]
%!test
%! assert (isequal (powrev1 (infsup (-4.0, 4.0), infsup (0.25, 0.5), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, 4.0), infsup (0.25, 0.5), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-4.0, inf), infsup (0.25, 0.5), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, inf), infsup (0.25, 0.5), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-4.0, 4.0), infsup (0.25, 0.5), infsup (0.0, 1.0)), infsup (0.0, 8.408964152537146131e-01)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, 4.0), infsup (0.25, 0.5), infsup (0.0, 1.0)), infsup (0.0, 8.408964152537146131e-01)));
%!test
%! assert (isequal (powrev1 (infsup (-4.0, inf), infsup (0.25, 0.5), infsup (0.0, 1.0)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, inf), infsup (0.25, 0.5), infsup (0.0, 1.0)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (powrev1 (infsup (-4.0, 4.0), infsup (0.25, 0.5), infsup (1.0, inf)), infsup (1.189207115002721027e+00, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, 4.0), infsup (0.25, 0.5), infsup (1.0, inf)), infsup (1.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-4.0, inf), infsup (0.25, 0.5), infsup (1.0, inf)), infsup (1.189207115002721027e+00, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, inf), infsup (0.25, 0.5), infsup (1.0, inf)), infsup (1.0, inf)));
%!# y contains 0, z finishes [0, 1]
%!test
%! assert (isequal (powrev1 (infsup (-4.0, 4.0), infsup (0.25, 1.0), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, 4.0), infsup (0.25, 1.0), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-4.0, 4.0), infsup (1.0, 1.0), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, 4.0), infsup (1.0, 1.0), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-4.0, inf), infsup (0.25, 1.0), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, inf), infsup (0.25, 1.0), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-4.0, inf), infsup (1.0, 1.0), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, inf), infsup (1.0, 1.0), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-4.0, 4.0), infsup (0.25, 1.0), infsup (0.0, 1.0)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, 4.0), infsup (0.25, 1.0), infsup (0.0, 1.0)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (powrev1 (infsup (-4.0, 4.0), infsup (1.0, 1.0), infsup (0.0, 1.0)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, 4.0), infsup (1.0, 1.0), infsup (0.0, 1.0)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (powrev1 (infsup (-4.0, inf), infsup (0.25, 1.0), infsup (0.0, 1.0)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, inf), infsup (0.25, 1.0), infsup (0.0, 1.0)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (powrev1 (infsup (-4.0, inf), infsup (1.0, 1.0), infsup (0.0, 1.0)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, inf), infsup (1.0, 1.0), infsup (0.0, 1.0)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (powrev1 (infsup (-4.0, 4.0), infsup (0.25, 1.0), infsup (1.0, inf)), infsup (1.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, 4.0), infsup (0.25, 1.0), infsup (1.0, inf)), infsup (1.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-4.0, 4.0), infsup (1.0, 1.0), infsup (1.0, inf)), infsup (1.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, 4.0), infsup (1.0, 1.0), infsup (1.0, inf)), infsup (1.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-4.0, inf), infsup (0.25, 1.0), infsup (1.0, inf)), infsup (1.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, inf), infsup (0.25, 1.0), infsup (1.0, inf)), infsup (1.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-4.0, inf), infsup (1.0, 1.0), infsup (1.0, inf)), infsup (1.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, inf), infsup (1.0, 1.0), infsup (1.0, inf)), infsup (1.0, inf)));
%!# y contains 0, z equals/contains [0, 1]
%!test
%! assert (isequal (powrev1 (infsup (-4.0, 4.0), infsup (0.0, 1.0), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, 4.0), infsup (0.0, 1.0), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-4.0, inf), infsup (0.0, 1.0), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, inf), infsup (0.0, 1.0), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-4.0, 4.0), infsup (0.0, 1.0), infsup (0.0, 1.0)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, 4.0), infsup (0.0, 1.0), infsup (0.0, 1.0)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (powrev1 (infsup (-4.0, inf), infsup (0.0, 1.0), infsup (0.0, 1.0)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, inf), infsup (0.0, 1.0), infsup (0.0, 1.0)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (powrev1 (infsup (-4.0, 4.0), infsup (0.0, 1.0), infsup (1.0, inf)), infsup (1.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, 4.0), infsup (0.0, 1.0), infsup (1.0, inf)), infsup (1.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-4.0, inf), infsup (0.0, 1.0), infsup (1.0, inf)), infsup (1.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, inf), infsup (0.0, 1.0), infsup (1.0, inf)), infsup (1.0, inf)));
%!# y contains 0, z contains/startedBy [0, 1]
%!test
%! assert (isequal (powrev1 (infsup (-4.0, 4.0), infsup (0.0, 2.0), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, 4.0), infsup (0.0, 2.0), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-4.0, 4.0), infsup (0.0, inf), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, 4.0), infsup (0.0, inf), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-4.0, 4.0), infsup (-inf, 2.0), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, 4.0), infsup (-inf, 2.0), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-4.0, 4.0), infsup (-inf, inf), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, 4.0), infsup (-inf, inf), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-4.0, inf), infsup (0.0, 2.0), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, inf), infsup (0.0, 2.0), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-4.0, inf), infsup (0.0, inf), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, inf), infsup (0.0, inf), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-4.0, inf), infsup (-inf, 2.0), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, inf), infsup (-inf, 2.0), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-4.0, inf), infsup (-inf, inf), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, inf), infsup (-inf, inf), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-4.0, 4.0), infsup (0.0, 2.0), infsup (0.0, 1.0)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, 4.0), infsup (0.0, 2.0), infsup (0.0, 1.0)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (powrev1 (infsup (-4.0, 4.0), infsup (0.0, inf), infsup (0.0, 1.0)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, 4.0), infsup (0.0, inf), infsup (0.0, 1.0)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (powrev1 (infsup (-4.0, 4.0), infsup (-inf, 2.0), infsup (0.0, 1.0)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, 4.0), infsup (-inf, 2.0), infsup (0.0, 1.0)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (powrev1 (infsup (-4.0, 4.0), infsup (-inf, inf), infsup (0.0, 1.0)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, 4.0), infsup (-inf, inf), infsup (0.0, 1.0)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (powrev1 (infsup (-4.0, inf), infsup (0.0, 2.0), infsup (0.0, 1.0)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, inf), infsup (0.0, 2.0), infsup (0.0, 1.0)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (powrev1 (infsup (-4.0, inf), infsup (0.0, inf), infsup (0.0, 1.0)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, inf), infsup (0.0, inf), infsup (0.0, 1.0)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (powrev1 (infsup (-4.0, inf), infsup (-inf, 2.0), infsup (0.0, 1.0)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, inf), infsup (-inf, 2.0), infsup (0.0, 1.0)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (powrev1 (infsup (-4.0, inf), infsup (-inf, inf), infsup (0.0, 1.0)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, inf), infsup (-inf, inf), infsup (0.0, 1.0)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (powrev1 (infsup (-4.0, 4.0), infsup (0.0, 2.0), infsup (1.0, inf)), infsup (1.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, 4.0), infsup (0.0, 2.0), infsup (1.0, inf)), infsup (1.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-4.0, 4.0), infsup (0.0, inf), infsup (1.0, inf)), infsup (1.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, 4.0), infsup (0.0, inf), infsup (1.0, inf)), infsup (1.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-4.0, 4.0), infsup (-inf, 2.0), infsup (1.0, inf)), infsup (1.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, 4.0), infsup (-inf, 2.0), infsup (1.0, inf)), infsup (1.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-4.0, 4.0), infsup (-inf, inf), infsup (1.0, inf)), infsup (1.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, 4.0), infsup (-inf, inf), infsup (1.0, inf)), infsup (1.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-4.0, inf), infsup (0.0, 2.0), infsup (1.0, inf)), infsup (1.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, inf), infsup (0.0, 2.0), infsup (1.0, inf)), infsup (1.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-4.0, inf), infsup (0.0, inf), infsup (1.0, inf)), infsup (1.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, inf), infsup (0.0, inf), infsup (1.0, inf)), infsup (1.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-4.0, inf), infsup (-inf, 2.0), infsup (1.0, inf)), infsup (1.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, inf), infsup (-inf, 2.0), infsup (1.0, inf)), infsup (1.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-4.0, inf), infsup (-inf, inf), infsup (1.0, inf)), infsup (1.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, inf), infsup (-inf, inf), infsup (1.0, inf)), infsup (1.0, inf)));
%!# y contains 0, z overlappedBy [0, 1]
%!test
%! assert (isequal (powrev1 (infsup (-4.0, 4.0), infsup (0.5, 2.0), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, 4.0), infsup (0.5, 2.0), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-4.0, 4.0), infsup (0.5, inf), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, 4.0), infsup (0.5, inf), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-4.0, inf), infsup (0.5, 2.0), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, inf), infsup (0.5, 2.0), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-4.0, inf), infsup (0.5, inf), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, inf), infsup (0.5, inf), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-4.0, 4.0), infsup (0.5, 2.0), infsup (0.0, 1.0)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, 4.0), infsup (0.5, 2.0), infsup (0.0, 1.0)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (powrev1 (infsup (-4.0, 4.0), infsup (0.5, inf), infsup (0.0, 1.0)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, 4.0), infsup (0.5, inf), infsup (0.0, 1.0)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (powrev1 (infsup (-4.0, inf), infsup (0.5, 2.0), infsup (0.0, 1.0)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, inf), infsup (0.5, 2.0), infsup (0.0, 1.0)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (powrev1 (infsup (-4.0, inf), infsup (0.5, inf), infsup (0.0, 1.0)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, inf), infsup (0.5, inf), infsup (0.0, 1.0)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (powrev1 (infsup (-4.0, 4.0), infsup (0.5, 2.0), infsup (1.0, inf)), infsup (1.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, 4.0), infsup (0.5, 2.0), infsup (1.0, inf)), infsup (1.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-4.0, 4.0), infsup (0.5, inf), infsup (1.0, inf)), infsup (1.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, 4.0), infsup (0.5, inf), infsup (1.0, inf)), infsup (1.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-4.0, inf), infsup (0.5, 2.0), infsup (1.0, inf)), infsup (1.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, inf), infsup (0.5, 2.0), infsup (1.0, inf)), infsup (1.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-4.0, inf), infsup (0.5, inf), infsup (1.0, inf)), infsup (1.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, inf), infsup (0.5, inf), infsup (1.0, inf)), infsup (1.0, inf)));
%!# y contains 0, z metBy [0, 1]
%!test
%! assert (isequal (powrev1 (infsup (-4.0, 4.0), infsup (1.0, 2.0), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, 4.0), infsup (1.0, 2.0), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-4.0, 4.0), infsup (1.0, inf), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, 4.0), infsup (1.0, inf), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-4.0, inf), infsup (1.0, 2.0), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, inf), infsup (1.0, 2.0), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-4.0, inf), infsup (1.0, inf), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, inf), infsup (1.0, inf), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-4.0, 4.0), infsup (1.0, 2.0), infsup (0.0, 1.0)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, 4.0), infsup (1.0, 2.0), infsup (0.0, 1.0)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (powrev1 (infsup (-4.0, 4.0), infsup (1.0, inf), infsup (0.0, 1.0)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, 4.0), infsup (1.0, inf), infsup (0.0, 1.0)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (powrev1 (infsup (-4.0, inf), infsup (1.0, 2.0), infsup (0.0, 1.0)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, inf), infsup (1.0, 2.0), infsup (0.0, 1.0)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (powrev1 (infsup (-4.0, inf), infsup (1.0, inf), infsup (0.0, 1.0)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, inf), infsup (1.0, inf), infsup (0.0, 1.0)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (powrev1 (infsup (-4.0, 4.0), infsup (1.0, 2.0), infsup (1.0, inf)), infsup (1.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, 4.0), infsup (1.0, 2.0), infsup (1.0, inf)), infsup (1.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-4.0, 4.0), infsup (1.0, inf), infsup (1.0, inf)), infsup (1.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, 4.0), infsup (1.0, inf), infsup (1.0, inf)), infsup (1.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-4.0, inf), infsup (1.0, 2.0), infsup (1.0, inf)), infsup (1.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, inf), infsup (1.0, 2.0), infsup (1.0, inf)), infsup (1.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-4.0, inf), infsup (1.0, inf), infsup (1.0, inf)), infsup (1.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, inf), infsup (1.0, inf), infsup (1.0, inf)), infsup (1.0, inf)));
%!# y contains 0, z after [0, 1]
%!test
%! assert (isequal (powrev1 (infsup (-4.0, 4.0), infsup (2.0, 4.0), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, 4.0), infsup (2.0, 4.0), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-4.0, 4.0), infsup (2.0, inf), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, 4.0), infsup (2.0, inf), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-4.0, inf), infsup (2.0, 4.0), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, inf), infsup (2.0, 4.0), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-4.0, inf), infsup (2.0, inf), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, inf), infsup (2.0, inf), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-4.0, 4.0), infsup (2.0, 4.0), infsup (0.0, 1.0)), infsup (0.0, 8.408964152537146131e-01)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, 4.0), infsup (2.0, 4.0), infsup (0.0, 1.0)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (powrev1 (infsup (-4.0, 4.0), infsup (2.0, inf), infsup (0.0, 1.0)), infsup (0.0, 8.408964152537146131e-01)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, 4.0), infsup (2.0, inf), infsup (0.0, 1.0)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (powrev1 (infsup (-4.0, inf), infsup (2.0, 4.0), infsup (0.0, 1.0)), infsup (0.0, 8.408964152537146131e-01)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, inf), infsup (2.0, 4.0), infsup (0.0, 1.0)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (powrev1 (infsup (-4.0, inf), infsup (2.0, inf), infsup (0.0, 1.0)), infsup (0.0, 8.408964152537146131e-01)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, inf), infsup (2.0, inf), infsup (0.0, 1.0)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (powrev1 (infsup (-4.0, 4.0), infsup (2.0, 4.0), infsup (1.0, inf)), infsup (1.189207115002721027e+00, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, 4.0), infsup (2.0, 4.0), infsup (1.0, inf)), infsup (1.189207115002721027e+00, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-4.0, 4.0), infsup (2.0, inf), infsup (1.0, inf)), infsup (1.189207115002721027e+00, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, 4.0), infsup (2.0, inf), infsup (1.0, inf)), infsup (1.189207115002721027e+00, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-4.0, inf), infsup (2.0, 4.0), infsup (1.0, inf)), infsup (1.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, inf), infsup (2.0, 4.0), infsup (1.0, inf)), infsup (1.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-4.0, inf), infsup (2.0, inf), infsup (1.0, inf)), infsup (1.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (-inf, inf), infsup (2.0, inf), infsup (1.0, inf)), infsup (1.0, inf)));
%!# y startedBy 0, z overlaps/starts [0,1]
%!test
%! assert (isequal (powrev1 (infsup (0.0, 4.0), infsup (0.0, 0.5), infsup (-inf, inf)), infsup (0.0, 8.408964152537146131e-01)));
%!test
%! assert (isequal (powrev1 (infsup (0.0, 4.0), infsup (-inf, 0.5), infsup (-inf, inf)), infsup (0.0, 8.408964152537146131e-01)));
%!test
%! assert (isequal (powrev1 (infsup (0.0, inf), infsup (0.0, 0.5), infsup (-inf, inf)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (powrev1 (infsup (0.0, inf), infsup (-inf, 0.5), infsup (-inf, inf)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (powrev1 (infsup (0.0, 4.0), infsup (0.0, 0.5), infsup (0.0, 1.0)), infsup (0.0, 8.408964152537146131e-01)));
%!test
%! assert (isequal (powrev1 (infsup (0.0, 4.0), infsup (-inf, 0.5), infsup (0.0, 1.0)), infsup (0.0, 8.408964152537146131e-01)));
%!test
%! assert (isequal (powrev1 (infsup (0.0, inf), infsup (0.0, 0.5), infsup (0.0, 1.0)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (powrev1 (infsup (0.0, inf), infsup (-inf, 0.5), infsup (0.0, 1.0)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (powrev1 (infsup (0.0, 4.0), infsup (0.0, 0.5), infsup (1.0, inf)), infsup));
%!test
%! assert (isequal (powrev1 (infsup (0.0, 4.0), infsup (-inf, 0.5), infsup (1.0, inf)), infsup));
%!test
%! assert (isequal (powrev1 (infsup (0.0, inf), infsup (0.0, 0.5), infsup (1.0, inf)), infsup));
%!test
%! assert (isequal (powrev1 (infsup (0.0, inf), infsup (-inf, 0.5), infsup (1.0, inf)), infsup));
%!# y startedBy 0, z containedBy [0, 1]
%!test
%! assert (isequal (powrev1 (infsup (0.0, 4.0), infsup (0.25, 0.5), infsup (-inf, inf)), infsup (0.0, 8.408964152537146131e-01)));
%!test
%! assert (isequal (powrev1 (infsup (0.0, inf), infsup (0.25, 0.5), infsup (-inf, inf)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (powrev1 (infsup (0.0, 4.0), infsup (0.25, 0.5), infsup (0.0, 1.0)), infsup (0.0, 8.408964152537146131e-01)));
%!test
%! assert (isequal (powrev1 (infsup (0.0, inf), infsup (0.25, 0.5), infsup (0.0, 1.0)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (powrev1 (infsup (0.0, 4.0), infsup (0.25, 0.5), infsup (1.0, inf)), infsup));
%!test
%! assert (isequal (powrev1 (infsup (0.0, inf), infsup (0.25, 0.5), infsup (1.0, inf)), infsup));
%!# y startedBy 0, z finishes [0, 1]
%!test
%! assert (isequal (powrev1 (infsup (0.0, 4.0), infsup (0.25, 1.0), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (0.0, 4.0), infsup (1.0, 1.0), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (0.0, inf), infsup (0.25, 1.0), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (0.0, inf), infsup (1.0, 1.0), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (0.0, 4.0), infsup (0.25, 1.0), infsup (0.0, 1.0)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (powrev1 (infsup (0.0, 4.0), infsup (1.0, 1.0), infsup (0.0, 1.0)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (powrev1 (infsup (0.0, inf), infsup (0.25, 1.0), infsup (0.0, 1.0)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (powrev1 (infsup (0.0, inf), infsup (1.0, 1.0), infsup (0.0, 1.0)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (powrev1 (infsup (0.0, 4.0), infsup (0.25, 1.0), infsup (1.0, inf)), infsup (1.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (0.0, 4.0), infsup (1.0, 1.0), infsup (1.0, inf)), infsup (1.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (0.0, inf), infsup (0.25, 1.0), infsup (1.0, inf)), infsup (1.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (0.0, inf), infsup (1.0, 1.0), infsup (1.0, inf)), infsup (1.0, inf)));
%!# y startedBy 0, z equals/contains [0, 1]
%!test
%! assert (isequal (powrev1 (infsup (0.0, 4.0), infsup (0.0, 1.0), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (0.0, inf), infsup (0.0, 1.0), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (0.0, 4.0), infsup (0.0, 1.0), infsup (0.0, 1.0)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (powrev1 (infsup (0.0, inf), infsup (0.0, 1.0), infsup (0.0, 1.0)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (powrev1 (infsup (0.0, 4.0), infsup (0.0, 1.0), infsup (1.0, inf)), infsup (1.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (0.0, inf), infsup (0.0, 1.0), infsup (1.0, inf)), infsup (1.0, inf)));
%!# y startedBy 0, z contains/startedBy [0, 1]
%!test
%! assert (isequal (powrev1 (infsup (0.0, 4.0), infsup (0.0, 2.0), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (0.0, 4.0), infsup (0.0, inf), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (0.0, 4.0), infsup (-inf, 2.0), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (0.0, 4.0), infsup (-inf, inf), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (0.0, inf), infsup (0.0, 2.0), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (0.0, inf), infsup (0.0, inf), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (0.0, inf), infsup (-inf, 2.0), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (0.0, inf), infsup (-inf, inf), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (0.0, 4.0), infsup (0.0, 2.0), infsup (0.0, 1.0)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (powrev1 (infsup (0.0, 4.0), infsup (0.0, inf), infsup (0.0, 1.0)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (powrev1 (infsup (0.0, 4.0), infsup (-inf, 2.0), infsup (0.0, 1.0)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (powrev1 (infsup (0.0, 4.0), infsup (-inf, inf), infsup (0.0, 1.0)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (powrev1 (infsup (0.0, inf), infsup (0.0, 2.0), infsup (0.0, 1.0)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (powrev1 (infsup (0.0, inf), infsup (0.0, inf), infsup (0.0, 1.0)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (powrev1 (infsup (0.0, inf), infsup (-inf, 2.0), infsup (0.0, 1.0)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (powrev1 (infsup (0.0, inf), infsup (-inf, inf), infsup (0.0, 1.0)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (powrev1 (infsup (0.0, 4.0), infsup (0.0, 2.0), infsup (1.0, inf)), infsup (1.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (0.0, 4.0), infsup (0.0, inf), infsup (1.0, inf)), infsup (1.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (0.0, 4.0), infsup (-inf, 2.0), infsup (1.0, inf)), infsup (1.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (0.0, 4.0), infsup (-inf, inf), infsup (1.0, inf)), infsup (1.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (0.0, inf), infsup (0.0, 2.0), infsup (1.0, inf)), infsup (1.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (0.0, inf), infsup (0.0, inf), infsup (1.0, inf)), infsup (1.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (0.0, inf), infsup (-inf, 2.0), infsup (1.0, inf)), infsup (1.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (0.0, inf), infsup (-inf, inf), infsup (1.0, inf)), infsup (1.0, inf)));
%!# y startedBy 0, z overlappedBy [0, 1]
%!test
%! assert (isequal (powrev1 (infsup (0.0, 4.0), infsup (0.5, 2.0), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (0.0, 4.0), infsup (0.5, inf), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (0.0, inf), infsup (0.5, 2.0), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (0.0, inf), infsup (0.5, inf), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (0.0, 4.0), infsup (0.5, 2.0), infsup (0.0, 1.0)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (powrev1 (infsup (0.0, 4.0), infsup (0.5, inf), infsup (0.0, 1.0)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (powrev1 (infsup (0.0, inf), infsup (0.5, 2.0), infsup (0.0, 1.0)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (powrev1 (infsup (0.0, inf), infsup (0.5, inf), infsup (0.0, 1.0)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (powrev1 (infsup (0.0, 4.0), infsup (0.5, 2.0), infsup (1.0, inf)), infsup (1.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (0.0, 4.0), infsup (0.5, inf), infsup (1.0, inf)), infsup (1.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (0.0, inf), infsup (0.5, 2.0), infsup (1.0, inf)), infsup (1.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (0.0, inf), infsup (0.5, inf), infsup (1.0, inf)), infsup (1.0, inf)));
%!# y startedBy 0, z metBy [0, 1]
%!test
%! assert (isequal (powrev1 (infsup (0.0, 4.0), infsup (1.0, 2.0), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (0.0, 4.0), infsup (1.0, inf), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (0.0, inf), infsup (1.0, 2.0), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (0.0, inf), infsup (1.0, inf), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (0.0, 4.0), infsup (1.0, 2.0), infsup (0.0, 1.0)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (powrev1 (infsup (0.0, 4.0), infsup (1.0, inf), infsup (0.0, 1.0)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (powrev1 (infsup (0.0, inf), infsup (1.0, 2.0), infsup (0.0, 1.0)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (powrev1 (infsup (0.0, inf), infsup (1.0, inf), infsup (0.0, 1.0)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (powrev1 (infsup (0.0, 4.0), infsup (1.0, 2.0), infsup (1.0, inf)), infsup (1.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (0.0, 4.0), infsup (1.0, inf), infsup (1.0, inf)), infsup (1.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (0.0, inf), infsup (1.0, 2.0), infsup (1.0, inf)), infsup (1.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (0.0, inf), infsup (1.0, inf), infsup (1.0, inf)), infsup (1.0, inf)));
%!# y startedBy 0, z after [0, 1]
%!test
%! assert (isequal (powrev1 (infsup (0.0, 4.0), infsup (2.0, 4.0), infsup (-inf, inf)), infsup (1.189207115002721027e+00, inf)));
%!test
%! assert (isequal (powrev1 (infsup (0.0, 4.0), infsup (2.0, inf), infsup (-inf, inf)), infsup (1.189207115002721027e+00, inf)));
%!test
%! assert (isequal (powrev1 (infsup (0.0, inf), infsup (2.0, 4.0), infsup (-inf, inf)), infsup (1.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (0.0, inf), infsup (2.0, inf), infsup (-inf, inf)), infsup (1.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (0.0, 4.0), infsup (2.0, 4.0), infsup (0.0, 1.0)), infsup));
%!test
%! assert (isequal (powrev1 (infsup (0.0, 4.0), infsup (2.0, inf), infsup (0.0, 1.0)), infsup));
%!test
%! assert (isequal (powrev1 (infsup (0.0, inf), infsup (2.0, 4.0), infsup (0.0, 1.0)), infsup));
%!test
%! assert (isequal (powrev1 (infsup (0.0, inf), infsup (2.0, inf), infsup (0.0, 1.0)), infsup));
%!test
%! assert (isequal (powrev1 (infsup (0.0, 4.0), infsup (2.0, 4.0), infsup (1.0, inf)), infsup (1.189207115002721027e+00, inf)));
%!test
%! assert (isequal (powrev1 (infsup (0.0, 4.0), infsup (2.0, inf), infsup (1.0, inf)), infsup (1.189207115002721027e+00, inf)));
%!test
%! assert (isequal (powrev1 (infsup (0.0, inf), infsup (2.0, 4.0), infsup (1.0, inf)), infsup (1.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (0.0, inf), infsup (2.0, inf), infsup (1.0, inf)), infsup (1.0, inf)));
%!# y after 0, z overlaps/starts [0,1]
%!test
%! assert (isequal (powrev1 (infsup (2.0, 4.0), infsup (0.0, 0.5), infsup (-inf, inf)), infsup (0.0, 8.408964152537146131e-01)));
%!test
%! assert (isequal (powrev1 (infsup (2.0, 4.0), infsup (-inf, 0.5), infsup (-inf, inf)), infsup (0.0, 8.408964152537146131e-01)));
%!test
%! assert (isequal (powrev1 (infsup (2.0, inf), infsup (0.0, 0.5), infsup (-inf, inf)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (powrev1 (infsup (2.0, inf), infsup (-inf, 0.5), infsup (-inf, inf)), infsup (0.0, 1.0)));
%!# y after 0, z containedBy [0, 1]
%!test
%! assert (isequal (powrev1 (infsup (2.0, 4.0), infsup (0.25, 0.5), infsup (-inf, inf)), infsup (0.5, 8.408964152537146131e-01)));
%!test
%! assert (isequal (powrev1 (infsup (2.0, inf), infsup (0.25, 0.5), infsup (-inf, inf)), infsup (0.5, 1.0)));
%!# y after 0, z finishes [0, 1]
%!test
%! assert (isequal (powrev1 (infsup (2.0, 4.0), infsup (0.25, 1.0), infsup (-inf, inf)), infsup (0.5, 1.0)));
%!test
%! assert (isequal (powrev1 (infsup (2.0, 4.0), infsup (1.0, 1.0), infsup (-inf, inf)), infsup (1.0, 1.0)));
%!test
%! assert (isequal (powrev1 (infsup (2.0, inf), infsup (0.25, 1.0), infsup (-inf, inf)), infsup (0.5, 1.0)));
%!test
%! assert (isequal (powrev1 (infsup (2.0, inf), infsup (1.0, 1.0), infsup (-inf, inf)), infsup (1.0, 1.0)));
%!# y after 0, z equals/contains [0, 1]
%!test
%! assert (isequal (powrev1 (infsup (2.0, 4.0), infsup (0.0, 1.0), infsup (-inf, inf)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (powrev1 (infsup (2.0, inf), infsup (0.0, 1.0), infsup (-inf, inf)), infsup (0.0, 1.0)));
%!# y after 0, z contains/startedBy [0, 1]
%!test
%! assert (isequal (powrev1 (infsup (2.0, 4.0), infsup (0.0, 2.0), infsup (-inf, inf)), infsup (0.0, 1.414213562373095145e+00)));
%!test
%! assert (isequal (powrev1 (infsup (2.0, 4.0), infsup (0.0, inf), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (2.0, 4.0), infsup (-inf, 2.0), infsup (-inf, inf)), infsup (0.0, 1.414213562373095145e+00)));
%!test
%! assert (isequal (powrev1 (infsup (2.0, 4.0), infsup (-inf, inf), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (2.0, inf), infsup (0.0, 2.0), infsup (-inf, inf)), infsup (0.0, 1.414213562373095145e+00)));
%!test
%! assert (isequal (powrev1 (infsup (2.0, inf), infsup (0.0, inf), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (2.0, inf), infsup (-inf, 2.0), infsup (-inf, inf)), infsup (0.0, 1.414213562373095145e+00)));
%!test
%! assert (isequal (powrev1 (infsup (2.0, inf), infsup (-inf, inf), infsup (-inf, inf)), infsup (0.0, inf)));
%!# y after 0, z overlappedBy [0, 1]
%!test
%! assert (isequal (powrev1 (infsup (2.0, 4.0), infsup (0.5, 2.0), infsup (-inf, inf)), infsup (7.071067811865474617e-01, 1.414213562373095145e+00)));
%!test
%! assert (isequal (powrev1 (infsup (2.0, 4.0), infsup (0.5, inf), infsup (-inf, inf)), infsup (7.071067811865474617e-01, inf)));
%!test
%! assert (isequal (powrev1 (infsup (2.0, inf), infsup (0.5, 2.0), infsup (-inf, inf)), infsup (7.071067811865474617e-01, 1.414213562373095145e+00)));
%!test
%! assert (isequal (powrev1 (infsup (2.0, inf), infsup (0.5, inf), infsup (-inf, inf)), infsup (7.071067811865474617e-01, inf)));
%!# y after 0, z metBy [0, 1]
%!test
%! assert (isequal (powrev1 (infsup (2.0, 4.0), infsup (1.0, 2.0), infsup (-inf, inf)), infsup (1.0, 1.414213562373095145e+00)));
%!test
%! assert (isequal (powrev1 (infsup (2.0, 4.0), infsup (1.0, inf), infsup (-inf, inf)), infsup (1.0, inf)));
%!test
%! assert (isequal (powrev1 (infsup (2.0, inf), infsup (1.0, 2.0), infsup (-inf, inf)), infsup (1.0, 1.414213562373095145e+00)));
%!test
%! assert (isequal (powrev1 (infsup (2.0, inf), infsup (1.0, inf), infsup (-inf, inf)), infsup (1.0, inf)));
%!# y after 0, z after [0, 1]
%!test
%! assert (isequal (powrev1 (infsup (2.0, 4.0), infsup (2.0, 4.0), infsup (-inf, inf)), infsup (1.189207115002721027e+00, 2.0)));
%!test
%! assert (isequal (powrev1 (infsup (2.0, 4.0), infsup (2.0, inf), infsup (-inf, inf)), infsup (1.189207115002721027e+00, inf)));
%!test
%! assert (isequal (powrev1 (infsup (2.0, inf), infsup (2.0, 4.0), infsup (-inf, inf)), infsup (1.0, 2.0)));
%!test
%! assert (isequal (powrev1 (infsup (2.0, inf), infsup (2.0, inf), infsup (-inf, inf)), infsup (1.0, inf)));

## minimal.powRev2_test
##
## The following tests use boundaries for the first and second parameter
## whose binary logarithm can be computed without round-off error in a
## binary floating-point context.
## Thus, an implementation should be able to compute tight results with the
## formula y = log2 z / log2 x for the intervals used here.
## Implementations which use natural logarithm would introduce additional
## errors.
## 
## The test values are structured according to table B.2 in
## Heimlich, Oliver. 2011. “The General Interval Power Function.”
## Diplomarbeit, Institute for Computer Science, University of Würzburg.
## http://exp.ln0.de/heimlich-power-2011.htm.
##
%!# Empty intervals
%!test
%! assert (isequal (powrev2 (infsup, infsup, infsup), infsup));
%!test
%! assert (isequal (powrev2 (infsup, infsup (-inf, inf), infsup), infsup));
%!test
%! assert (isequal (powrev2 (infsup (-inf, inf), infsup, infsup), infsup));
%!test
%! assert (isequal (powrev2 (infsup (-inf, inf), infsup (-inf, inf), infsup), infsup));
%!test
%! assert (isequal (powrev2 (infsup, infsup, infsup (-inf, inf)), infsup));
%!test
%! assert (isequal (powrev2 (infsup, infsup (-inf, inf), infsup (-inf, inf)), infsup));
%!test
%! assert (isequal (powrev2 (infsup (-inf, inf), infsup, infsup (-inf, inf)), infsup));
%!# Entire range
%!test
%! assert (isequal (powrev2 (infsup (-inf, inf), infsup (-inf, inf), infsup (-inf, inf)), infsup (-inf, inf)));
%!# Outside of the function's domain
%!test
%! assert (isequal (powrev2 (infsup (0.0, 0.0), infsup (-inf, -0.1), infsup (-inf, inf)), infsup));
%!test
%! assert (isequal (powrev2 (infsup (0.0, 0.0), infsup (0.1, inf), infsup (-inf, inf)), infsup));
%!test
%! assert (isequal (powrev2 (infsup (0.0, 0.0), infsup (0.0, 0.0), infsup (-inf, 0.0)), infsup));
%!test
%! assert (isequal (powrev2 (infsup (-inf, 0.9), infsup (0.0, 0.9), infsup (-inf, 0.0)), infsup));
%!test
%! assert (isequal (powrev2 (infsup (1.1, inf), infsup (1.1, inf), infsup (-inf, 0.0)), infsup));
%!test
%! assert (isequal (powrev2 (infsup (-inf, 0.9), infsup (1.1, inf), infsup (0.0, inf)), infsup));
%!test
%! assert (isequal (powrev2 (infsup (1.1, inf), infsup (0.0, 0.9), infsup (0.0, inf)), infsup));
%!# 0^y = 0
%!test
%! assert (isequal (powrev2 (infsup (0.0, 0.0), infsup (0.0, 0.0), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev2 (infsup (-inf, 0.0), infsup (-inf, 0.0), infsup (0.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev2 (infsup (-inf, 0.0), infsup (-inf, 0.0), infsup (1.0, 2.0)), infsup (1.0, 2.0)));
%!test
%! assert (isequal (powrev2 (infsup (-inf, inf), infsup (0.0, 0.0), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev2 (infsup (-inf, inf), infsup (-inf, 0.0), infsup (0.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev2 (infsup (-inf, inf), infsup (-inf, 0.0), infsup (1.0, 2.0)), infsup (1.0, 2.0)));
%!test
%! assert (isequal (powrev2 (infsup (0.0, 0.0), infsup (-inf, inf), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev2 (infsup (-inf, 0.0), infsup (-inf, inf), infsup (0.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev2 (infsup (-inf, 0.0), infsup (-inf, inf), infsup (1.0, 2.0)), infsup (1.0, 2.0)));
%!# 1^y = x^0 = 1
%!test
%! assert (isequal (powrev2 (infsup (1.0, 1.0), infsup (-inf, inf), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (powrev2 (infsup (1.0, 1.0), infsup (1.0, 1.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (powrev2 (infsup (1.0, 1.0), infsup (1.0, 1.0), infsup (2.0, 3.0)), infsup (2.0, 3.0)));
%!test
%! assert (isequal (powrev2 (infsup (-inf, inf), infsup (1.0, 1.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (powrev2 (infsup (-inf, inf), infsup (1.0, 1.0), infsup (2.0, 3.0)), infsup (2.0, 3.0)));
%!test
%! assert (isequal (powrev2 (infsup (2.0, 3.0), infsup (1.0, 1.0), infsup (-inf, inf)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (powrev2 (infsup (2.0, 3.0), infsup (1.0, 1.0), infsup (2.0, 3.0)), infsup));
%!# x overlaps/starts [0, 1], z overlaps/starts [0, 1]
%!test
%! assert (isequal (powrev2 (infsup (0.0, 0.5), infsup (0.0, 0.5), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev2 (infsup (0.0, 0.5), infsup (0.0, 0.5), infsup (-inf, 0.0)), infsup));
%!# x overlaps/starts [0, 1], z containedBy [0, 1]
%!test
%! assert (isequal (powrev2 (infsup (0.0, 0.5), infsup (0.25, 0.5), infsup (-inf, inf)), infsup (0.0, 2.0)));
%!# x overlaps/starts [0, 1], z finishes [0, 1]
%!test
%! assert (isequal (powrev2 (infsup (0.0, 0.25), infsup (0.5, 1.0), infsup (-inf, inf)), infsup (0.0, 0.5)));
%!test
%! assert (isequal (powrev2 (infsup (0.0, 0.25), infsup (1.0, 1.0), infsup (-inf, inf)), infsup (0.0, 0.0)));
%!# x overlaps/starts [0, 1], z equals/finishedBy [0, 1]
%!test
%! assert (isequal (powrev2 (infsup (0.0, 0.25), infsup (0.0, 1.0), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev2 (infsup (0.0, 0.25), infsup (0.0, 1.0), infsup (-inf, 0.0)), infsup (0.0, 0.0)));
%!# x overlaps/starts [0, 1], z contains/startedBy [0, 1]
%!test
%! assert (isequal (powrev2 (infsup (0.0, 0.25), infsup (0.0, 2.0), infsup (-inf, inf)), infsup (-0.5, inf)));
%!test
%! assert (isequal (powrev2 (infsup (0.0, 0.25), infsup (0.0, inf), infsup (-inf, inf)), infsup (-inf, inf)));
%!# x overlaps/starts [0, 1], z overlappedBy [0, 1]
%!test
%! assert (isequal (powrev2 (infsup (0.0, 0.25), infsup (0.5, 2.0), infsup (-inf, inf)), infsup (-0.5, 0.5)));
%!test
%! assert (isequal (powrev2 (infsup (0.0, 0.25), infsup (0.5, inf), infsup (-inf, inf)), infsup (-inf, 0.5)));
%!# x overlaps/starts [0, 1], z metBy [0, 1]
%!test
%! assert (isequal (powrev2 (infsup (0.0, 0.25), infsup (1.0, 2.0), infsup (-inf, inf)), infsup (-0.5, 0.0)));
%!test
%! assert (isequal (powrev2 (infsup (0.0, 0.25), infsup (1.0, 2.0), infsup (0.0, inf)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (powrev2 (infsup (0.0, 0.25), infsup (1.0, inf), infsup (-inf, inf)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (powrev2 (infsup (0.0, 0.25), infsup (1.0, inf), infsup (0.0, inf)), infsup (0.0, 0.0)));
%!# x overlaps/starts [0, 1], z after [0, 1]
%!test
%! assert (isequal (powrev2 (infsup (0.0, 0.25), infsup (2.0, 4.0), infsup (-inf, inf)), infsup (-1.0, 0.0)));
%!test
%! assert (isequal (powrev2 (infsup (0.0, 0.25), infsup (2.0, 4.0), infsup (0.0, inf)), infsup));
%!test
%! assert (isequal (powrev2 (infsup (0.0, 0.25), infsup (2.0, inf), infsup (-inf, inf)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (powrev2 (infsup (0.0, 0.25), infsup (2.0, inf), infsup (0.0, inf)), infsup));
%!# x containedBy [0, 1], z overlaps/starts [0, 1]
%!test
%! assert (isequal (powrev2 (infsup (0.25, 0.5), infsup (0.0, 0.5), infsup (-inf, inf)), infsup (0.5, inf)));
%!# x containedBy [0, 1], z containedBy [0, 1]
%!test
%! assert (isequal (powrev2 (infsup (0.25, 0.5), infsup (0.25, 0.5), infsup (-inf, inf)), infsup (0.5, 2.0)));
%!# x containedBy [0, 1], z finishes [0, 1]
%!test
%! assert (isequal (powrev2 (infsup (0.25, 0.5), infsup (0.5, 1.0), infsup (-inf, inf)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (powrev2 (infsup (0.25, 0.5), infsup (1.0, 1.0), infsup (-inf, inf)), infsup (0.0, 0.0)));
%!# x containedBy [0, 1], z equals/finishedBy [0, 1]
%!test
%! assert (isequal (powrev2 (infsup (0.25, 0.5), infsup (0.0, 1.0), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev2 (infsup (0.25, 0.5), infsup (0.0, 1.0), infsup (-inf, 0.0)), infsup (0.0, 0.0)));
%!# x containedBy [0, 1], z contains/startedBy [0, 1]
%!test
%! assert (isequal (powrev2 (infsup (0.25, 0.5), infsup (0.0, 2.0), infsup (-inf, inf)), infsup (-1.0, inf)));
%!test
%! assert (isequal (powrev2 (infsup (0.25, 0.5), infsup (0.0, inf), infsup (-inf, inf)), infsup (-inf, inf)));
%!# x containedBy [0, 1], z overlappedBy [0, 1]
%!test
%! assert (isequal (powrev2 (infsup (0.25, 0.5), infsup (0.5, 2.0), infsup (-inf, inf)), infsup (-1.0, 1.0)));
%!test
%! assert (isequal (powrev2 (infsup (0.25, 0.5), infsup (0.5, inf), infsup (-inf, inf)), infsup (-inf, 1.0)));
%!# x containedBy [0, 1], z metBy [0, 1]
%!test
%! assert (isequal (powrev2 (infsup (0.25, 0.5), infsup (1.0, 2.0), infsup (-inf, inf)), infsup (-1.0, 0.0)));
%!test
%! assert (isequal (powrev2 (infsup (0.25, 0.5), infsup (1.0, inf), infsup (-inf, inf)), infsup (-inf, 0.0)));
%!# x containedBy [0, 1], z after [0, 1]
%!test
%! assert (isequal (powrev2 (infsup (0.25, 0.5), infsup (2.0, 4.0), infsup (-inf, inf)), infsup (-2.0, -0.5)));
%!test
%! assert (isequal (powrev2 (infsup (0.25, 0.5), infsup (2.0, inf), infsup (-inf, inf)), infsup (-inf, inf)));
%!# x finishes [0, 1], z overlaps/starts [0, 1]
%!test
%! assert (isequal (powrev2 (infsup (0.25, 1.0), infsup (0.0, 0.5), infsup (-inf, inf)), infsup (0.5, inf)));
%!test
%! assert (isequal (powrev2 (infsup (1.0, 1.0), infsup (0.0, 0.5), infsup (-inf, inf)), infsup));
%!# x finishes [0, 1], z containedBy [0, 1]
%!test
%! assert (isequal (powrev2 (infsup (0.25, 1.0), infsup (0.25, 0.5), infsup (-inf, inf)), infsup (0.5, inf)));
%!test
%! assert (isequal (powrev2 (infsup (1.0, 1.0), infsup (0.25, 0.5), infsup (-inf, inf)), infsup));
%!# x finishes [0, 1], z finishes [0, 1]
%!test
%! assert (isequal (powrev2 (infsup (0.25, 1.0), infsup (0.5, 1.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (powrev2 (infsup (0.25, 1.0), infsup (1.0, 1.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (powrev2 (infsup (1.0, 1.0), infsup (0.5, 1.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (powrev2 (infsup (1.0, 1.0), infsup (1.0, 1.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!# x finishes [0, 1], z equals/finishedBy [0, 1]
%!test
%! assert (isequal (powrev2 (infsup (0.25, 1.0), infsup (0.0, 1.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (powrev2 (infsup (1.0, 1.0), infsup (0.0, 1.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!# x finishes [0, 1], z contains/startedBy [0, 1]
%!test
%! assert (isequal (powrev2 (infsup (0.25, 1.0), infsup (0.0, 2.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (powrev2 (infsup (1.0, 1.0), infsup (0.0, 2.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (powrev2 (infsup (0.25, 1.0), infsup (0.0, inf), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (powrev2 (infsup (1.0, 1.0), infsup (0.0, inf), infsup (-inf, inf)), infsup (-inf, inf)));
%!# x finishes [0, 1], z overlappedBy [0, 1]
%!test
%! assert (isequal (powrev2 (infsup (0.25, 1.0), infsup (0.5, 2.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (powrev2 (infsup (1.0, 1.0), infsup (0.5, 2.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (powrev2 (infsup (0.25, 1.0), infsup (0.5, inf), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (powrev2 (infsup (1.0, 1.0), infsup (0.5, inf), infsup (-inf, inf)), infsup (-inf, inf)));
%!# x finishes [0, 1], z metBy [0, 1]
%!test
%! assert (isequal (powrev2 (infsup (0.25, 1.0), infsup (1.0, 2.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (powrev2 (infsup (1.0, 1.0), infsup (1.0, 2.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (powrev2 (infsup (0.25, 1.0), infsup (1.0, inf), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (powrev2 (infsup (1.0, 1.0), infsup (1.0, inf), infsup (-inf, inf)), infsup (-inf, inf)));
%!# x finishes [0, 1], z after [0, 1]
%!test
%! assert (isequal (powrev2 (infsup (0.25, 1.0), infsup (2.0, 4.0), infsup (-inf, inf)), infsup (-inf, -0.5)));
%!test
%! assert (isequal (powrev2 (infsup (1.0, 1.0), infsup (2.0, 4.0), infsup (-inf, inf)), infsup));
%!test
%! assert (isequal (powrev2 (infsup (0.25, 1.0), infsup (2.0, inf), infsup (-inf, inf)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (powrev2 (infsup (1.0, 1.0), infsup (2.0, inf), infsup (-inf, inf)), infsup));
%!# x equals/finishedBy [0, 1], z overlaps/starts [0, 1]
%!test
%! assert (isequal (powrev2 (infsup (0.0, 1.0), infsup (0.0, 0.5), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev2 (infsup (0.0, 1.0), infsup (0.0, 0.5), infsup (-inf, 0.0)), infsup));
%!test
%! assert (isequal (powrev2 (infsup (0.0, 1.0), infsup (0.0, 0.5), infsup (0.0, inf)), infsup (0.0, inf)));
%!# x equals/finishedBy [0, 1], z containedBy [0, 1]
%!test
%! assert (isequal (powrev2 (infsup (0.0, 1.0), infsup (0.25, 0.5), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev2 (infsup (0.0, 1.0), infsup (0.25, 0.5), infsup (-inf, 0.0)), infsup));
%!test
%! assert (isequal (powrev2 (infsup (0.0, 1.0), infsup (0.25, 0.5), infsup (0.0, inf)), infsup (0.0, inf)));
%!# x equals/finishedBy [0, 1], z finishes [0, 1]
%!test
%! assert (isequal (powrev2 (infsup (0.0, 1.0), infsup (0.5, 1.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (powrev2 (infsup (0.0, 1.0), infsup (1.0, 1.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (powrev2 (infsup (0.0, 1.0), infsup (0.5, 1.0), infsup (-inf, 0.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (powrev2 (infsup (0.0, 1.0), infsup (1.0, 1.0), infsup (-inf, 0.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (powrev2 (infsup (0.0, 1.0), infsup (0.5, 1.0), infsup (0.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev2 (infsup (0.0, 1.0), infsup (1.0, 1.0), infsup (0.0, inf)), infsup (0.0, inf)));
%!# x equals/finishedBy [0, 1], z equals/finishedBy [0, 1]
%!test
%! assert (isequal (powrev2 (infsup (0.0, 1.0), infsup (0.0, 1.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (powrev2 (infsup (0.0, 1.0), infsup (0.0, 1.0), infsup (-inf, 0.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (powrev2 (infsup (0.0, 1.0), infsup (0.0, 1.0), infsup (0.0, inf)), infsup (0.0, inf)));
%!# x equals/finishedBy [0, 1], z contains/startedBy [0, 1]
%!test
%! assert (isequal (powrev2 (infsup (0.0, 1.0), infsup (0.0, 2.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (powrev2 (infsup (0.0, 1.0), infsup (0.0, 2.0), infsup (-inf, 0.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (powrev2 (infsup (0.0, 1.0), infsup (0.0, 2.0), infsup (0.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev2 (infsup (0.0, 1.0), infsup (0.0, inf), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (powrev2 (infsup (0.0, 1.0), infsup (0.0, inf), infsup (-inf, 0.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (powrev2 (infsup (0.0, 1.0), infsup (0.0, inf), infsup (0.0, inf)), infsup (0.0, inf)));
%!# x equals/finishedBy [0, 1], z overlappedBy [0, 1]
%!test
%! assert (isequal (powrev2 (infsup (0.0, 1.0), infsup (0.5, 2.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (powrev2 (infsup (0.0, 1.0), infsup (0.5, 2.0), infsup (-inf, 0.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (powrev2 (infsup (0.0, 1.0), infsup (0.5, 2.0), infsup (0.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev2 (infsup (0.0, 1.0), infsup (0.5, inf), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (powrev2 (infsup (0.0, 1.0), infsup (0.5, inf), infsup (-inf, 0.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (powrev2 (infsup (0.0, 1.0), infsup (0.5, inf), infsup (0.0, inf)), infsup (0.0, inf)));
%!# x equals/finishedBy [0, 1], z metBy [0, 1]
%!test
%! assert (isequal (powrev2 (infsup (0.0, 1.0), infsup (1.0, 2.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (powrev2 (infsup (0.0, 1.0), infsup (1.0, 2.0), infsup (-inf, 0.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (powrev2 (infsup (0.0, 1.0), infsup (1.0, 2.0), infsup (0.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev2 (infsup (0.0, 1.0), infsup (1.0, inf), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (powrev2 (infsup (0.0, 1.0), infsup (1.0, inf), infsup (-inf, 0.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (powrev2 (infsup (0.0, 1.0), infsup (1.0, inf), infsup (0.0, inf)), infsup (0.0, inf)));
%!# x equals/finishedBy [0, 1], z after [0, 1]
%!test
%! assert (isequal (powrev2 (infsup (0.0, 1.0), infsup (2.0, 4.0), infsup (-inf, inf)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (powrev2 (infsup (0.0, 1.0), infsup (2.0, 4.0), infsup (-inf, 0.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (powrev2 (infsup (0.0, 1.0), infsup (2.0, 4.0), infsup (0.0, inf)), infsup));
%!test
%! assert (isequal (powrev2 (infsup (0.0, 1.0), infsup (2.0, inf), infsup (-inf, inf)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (powrev2 (infsup (0.0, 1.0), infsup (2.0, inf), infsup (-inf, 0.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (powrev2 (infsup (0.0, 1.0), infsup (2.0, inf), infsup (0.0, inf)), infsup));
%!# x contains/startedBy [0, 1], z overlaps/starts [0, 1]
%!test
%! assert (isequal (powrev2 (infsup (0.0, 2.0), infsup (0.0, 0.5), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (powrev2 (infsup (0.0, 2.0), infsup (0.0, 0.5), infsup (-inf, 0.0)), infsup (-inf, -1.0)));
%!test
%! assert (isequal (powrev2 (infsup (0.0, 2.0), infsup (0.0, 0.5), infsup (0.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev2 (infsup (0.0, inf), infsup (0.0, 0.5), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (powrev2 (infsup (0.0, inf), infsup (0.0, 0.5), infsup (-inf, 0.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (powrev2 (infsup (0.0, inf), infsup (0.0, 0.5), infsup (0.0, inf)), infsup (0.0, inf)));
%!# x contains/startedBy [0, 1], z containedBy [0, 1]
%!test
%! assert (isequal (powrev2 (infsup (0.0, 2.0), infsup (0.25, 0.5), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (powrev2 (infsup (0.0, 2.0), infsup (0.25, 0.5), infsup (-inf, 0.0)), infsup (-inf, -1.0)));
%!test
%! assert (isequal (powrev2 (infsup (0.0, 2.0), infsup (0.25, 0.5), infsup (0.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev2 (infsup (0.0, inf), infsup (0.25, 0.5), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (powrev2 (infsup (0.0, inf), infsup (0.25, 0.5), infsup (-inf, 0.0)), infsup (-inf, -0.0)));
%!test
%! assert (isequal (powrev2 (infsup (0.0, inf), infsup (0.25, 0.5), infsup (0.0, inf)), infsup (0.0, inf)));
%!# x contains/startedBy [0, 1], z finishes [0, 1]
%!test
%! assert (isequal (powrev2 (infsup (0.0, 2.0), infsup (0.5, 1.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (powrev2 (infsup (0.0, 2.0), infsup (1.0, 1.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (powrev2 (infsup (0.0, 2.0), infsup (0.5, 1.0), infsup (-inf, 0.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (powrev2 (infsup (0.0, 2.0), infsup (1.0, 1.0), infsup (-inf, 0.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (powrev2 (infsup (0.0, 2.0), infsup (0.5, 1.0), infsup (0.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev2 (infsup (0.0, 2.0), infsup (1.0, 1.0), infsup (0.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev2 (infsup (0.0, inf), infsup (0.5, 1.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (powrev2 (infsup (0.0, inf), infsup (1.0, 1.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (powrev2 (infsup (0.0, inf), infsup (0.5, 1.0), infsup (-inf, 0.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (powrev2 (infsup (0.0, inf), infsup (1.0, 1.0), infsup (-inf, 0.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (powrev2 (infsup (0.0, inf), infsup (0.5, 1.0), infsup (0.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev2 (infsup (0.0, inf), infsup (1.0, 1.0), infsup (0.0, inf)), infsup (0.0, inf)));
%!# x contains/startedBy [0, 1], z equals/finishedBy [0, 1]
%!test
%! assert (isequal (powrev2 (infsup (0.0, 2.0), infsup (0.0, 1.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (powrev2 (infsup (0.0, 2.0), infsup (0.0, 1.0), infsup (-inf, 0.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (powrev2 (infsup (0.0, 2.0), infsup (0.0, 1.0), infsup (0.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev2 (infsup (0.0, inf), infsup (0.0, 1.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (powrev2 (infsup (0.0, inf), infsup (0.0, 1.0), infsup (-inf, 0.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (powrev2 (infsup (0.0, inf), infsup (0.0, 1.0), infsup (0.0, inf)), infsup (0.0, inf)));
%!# x contains/startedBy [0, 1], z contains/startedBy [0, 1]
%!test
%! assert (isequal (powrev2 (infsup (0.0, 2.0), infsup (0.0, 2.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (powrev2 (infsup (0.0, 2.0), infsup (0.0, 2.0), infsup (-inf, 0.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (powrev2 (infsup (0.0, 2.0), infsup (0.0, 2.0), infsup (0.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev2 (infsup (0.0, inf), infsup (0.0, 2.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (powrev2 (infsup (0.0, inf), infsup (0.0, 2.0), infsup (-inf, 0.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (powrev2 (infsup (0.0, inf), infsup (0.0, 2.0), infsup (0.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev2 (infsup (0.0, 2.0), infsup (0.0, inf), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (powrev2 (infsup (0.0, 2.0), infsup (0.0, inf), infsup (-inf, 0.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (powrev2 (infsup (0.0, 2.0), infsup (0.0, inf), infsup (0.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev2 (infsup (0.0, inf), infsup (0.0, inf), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (powrev2 (infsup (0.0, inf), infsup (0.0, inf), infsup (-inf, 0.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (powrev2 (infsup (0.0, inf), infsup (0.0, inf), infsup (0.0, inf)), infsup (0.0, inf)));
%!# x contains/startedBy [0, 1], z overlappedBy [0, 1]
%!test
%! assert (isequal (powrev2 (infsup (0.0, 2.0), infsup (0.5, 2.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (powrev2 (infsup (0.0, 2.0), infsup (0.5, 2.0), infsup (-inf, 0.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (powrev2 (infsup (0.0, 2.0), infsup (0.5, 2.0), infsup (0.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev2 (infsup (0.0, inf), infsup (0.5, 2.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (powrev2 (infsup (0.0, inf), infsup (0.5, 2.0), infsup (-inf, 0.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (powrev2 (infsup (0.0, inf), infsup (0.5, 2.0), infsup (0.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev2 (infsup (0.0, 2.0), infsup (0.5, inf), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (powrev2 (infsup (0.0, 2.0), infsup (0.5, inf), infsup (-inf, 0.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (powrev2 (infsup (0.0, 2.0), infsup (0.5, inf), infsup (0.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev2 (infsup (0.0, inf), infsup (0.5, inf), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (powrev2 (infsup (0.0, inf), infsup (0.5, inf), infsup (-inf, 0.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (powrev2 (infsup (0.0, inf), infsup (0.5, inf), infsup (0.0, inf)), infsup (0.0, inf)));
%!# x contains/startedBy [0, 1], z metBy [0, 1]
%!test
%! assert (isequal (powrev2 (infsup (0.0, 2.0), infsup (1.0, 2.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (powrev2 (infsup (0.0, 2.0), infsup (1.0, 2.0), infsup (-inf, 0.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (powrev2 (infsup (0.0, 2.0), infsup (1.0, 2.0), infsup (0.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev2 (infsup (0.0, inf), infsup (1.0, 2.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (powrev2 (infsup (0.0, inf), infsup (1.0, 2.0), infsup (-inf, 0.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (powrev2 (infsup (0.0, inf), infsup (1.0, 2.0), infsup (0.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev2 (infsup (0.0, 2.0), infsup (1.0, inf), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (powrev2 (infsup (0.0, 2.0), infsup (1.0, inf), infsup (-inf, 0.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (powrev2 (infsup (0.0, 2.0), infsup (1.0, inf), infsup (0.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev2 (infsup (0.0, inf), infsup (1.0, inf), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (powrev2 (infsup (0.0, inf), infsup (1.0, inf), infsup (-inf, 0.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (powrev2 (infsup (0.0, inf), infsup (1.0, inf), infsup (0.0, inf)), infsup (0.0, inf)));
%!# x contains/startedBy [0, 1], z after [0, 1]
%!test
%! assert (isequal (powrev2 (infsup (0.0, 2.0), infsup (2.0, 4.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (powrev2 (infsup (0.0, 2.0), infsup (2.0, 4.0), infsup (-inf, 0.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (powrev2 (infsup (0.0, 2.0), infsup (2.0, 4.0), infsup (0.0, inf)), infsup (1.0, inf)));
%!test
%! assert (isequal (powrev2 (infsup (0.0, inf), infsup (2.0, 4.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (powrev2 (infsup (0.0, inf), infsup (2.0, 4.0), infsup (-inf, 0.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (powrev2 (infsup (0.0, inf), infsup (2.0, 4.0), infsup (0.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev2 (infsup (0.0, 2.0), infsup (2.0, inf), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (powrev2 (infsup (0.0, 2.0), infsup (2.0, inf), infsup (-inf, 0.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (powrev2 (infsup (0.0, 2.0), infsup (2.0, inf), infsup (0.0, inf)), infsup (1.0, inf)));
%!test
%! assert (isequal (powrev2 (infsup (0.0, inf), infsup (2.0, inf), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (powrev2 (infsup (0.0, inf), infsup (2.0, inf), infsup (-inf, 0.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (powrev2 (infsup (0.0, inf), infsup (2.0, inf), infsup (0.0, inf)), infsup (0.0, inf)));
%!# x overlappedBy [0, 1], z overlaps/starts [0, 1]
%!test
%! assert (isequal (powrev2 (infsup (0.5, 2.0), infsup (0.0, 0.5), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (powrev2 (infsup (0.5, 2.0), infsup (0.0, 0.5), infsup (-inf, 0.0)), infsup (-inf, -1.0)));
%!test
%! assert (isequal (powrev2 (infsup (0.5, 2.0), infsup (0.0, 0.5), infsup (0.0, inf)), infsup (1.0, inf)));
%!test
%! assert (isequal (powrev2 (infsup (0.5, inf), infsup (0.0, 0.5), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (powrev2 (infsup (0.5, inf), infsup (0.0, 0.5), infsup (-inf, 0.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (powrev2 (infsup (0.5, inf), infsup (0.0, 0.5), infsup (0.0, inf)), infsup (1.0, inf)));
%!# x overlappedBy [0, 1], z containedBy [0, 1]
%!test
%! assert (isequal (powrev2 (infsup (0.5, 2.0), infsup (0.25, 0.5), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (powrev2 (infsup (0.5, 2.0), infsup (0.25, 0.5), infsup (-inf, 0.0)), infsup (-inf, -1.0)));
%!test
%! assert (isequal (powrev2 (infsup (0.5, 2.0), infsup (0.25, 0.5), infsup (0.0, inf)), infsup (1.0, inf)));
%!test
%! assert (isequal (powrev2 (infsup (0.5, inf), infsup (0.25, 0.5), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (powrev2 (infsup (0.5, inf), infsup (0.25, 0.5), infsup (-inf, 0.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (powrev2 (infsup (0.5, inf), infsup (0.25, 0.5), infsup (0.0, inf)), infsup (1.0, inf)));
%!# x overlappedBy [0, 1], z finishes [0, 1]
%!test
%! assert (isequal (powrev2 (infsup (0.5, 2.0), infsup (0.5, 1.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (powrev2 (infsup (0.5, 2.0), infsup (1.0, 1.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (powrev2 (infsup (0.5, 2.0), infsup (0.5, 1.0), infsup (-inf, 0.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (powrev2 (infsup (0.5, 2.0), infsup (1.0, 1.0), infsup (-inf, 0.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (powrev2 (infsup (0.5, 2.0), infsup (0.5, 1.0), infsup (0.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev2 (infsup (0.5, 2.0), infsup (1.0, 1.0), infsup (0.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev2 (infsup (0.5, inf), infsup (0.5, 1.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (powrev2 (infsup (0.5, inf), infsup (1.0, 1.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (powrev2 (infsup (0.5, inf), infsup (0.5, 1.0), infsup (-inf, 0.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (powrev2 (infsup (0.5, inf), infsup (1.0, 1.0), infsup (-inf, 0.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (powrev2 (infsup (0.5, inf), infsup (0.5, 1.0), infsup (0.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev2 (infsup (0.5, inf), infsup (1.0, 1.0), infsup (0.0, inf)), infsup (0.0, inf)));
%!# x overlappedBy [0, 1], z equals/finishedBy [0, 1]
%!test
%! assert (isequal (powrev2 (infsup (0.5, 2.0), infsup (0.0, 1.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (powrev2 (infsup (0.5, 2.0), infsup (0.0, 1.0), infsup (-inf, 0.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (powrev2 (infsup (0.5, 2.0), infsup (0.0, 1.0), infsup (0.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev2 (infsup (0.5, inf), infsup (0.0, 1.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (powrev2 (infsup (0.5, inf), infsup (0.0, 1.0), infsup (-inf, 0.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (powrev2 (infsup (0.5, inf), infsup (0.0, 1.0), infsup (0.0, inf)), infsup (0.0, inf)));
%!# x overlappedBy [0, 1], z contains/startedBy [0, 1]
%!test
%! assert (isequal (powrev2 (infsup (0.5, 2.0), infsup (0.0, 2.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (powrev2 (infsup (0.5, 2.0), infsup (0.0, 2.0), infsup (-inf, 0.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (powrev2 (infsup (0.5, 2.0), infsup (0.0, 2.0), infsup (0.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev2 (infsup (0.5, inf), infsup (0.0, 2.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (powrev2 (infsup (0.5, inf), infsup (0.0, 2.0), infsup (-inf, 0.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (powrev2 (infsup (0.5, inf), infsup (0.0, 2.0), infsup (0.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev2 (infsup (0.5, 2.0), infsup (0.0, inf), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (powrev2 (infsup (0.5, 2.0), infsup (0.0, inf), infsup (-inf, 0.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (powrev2 (infsup (0.5, 2.0), infsup (0.0, inf), infsup (0.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev2 (infsup (0.5, inf), infsup (0.0, inf), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (powrev2 (infsup (0.5, inf), infsup (0.0, inf), infsup (-inf, 0.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (powrev2 (infsup (0.5, inf), infsup (0.0, inf), infsup (0.0, inf)), infsup (0.0, inf)));
%!# x overlappedBy [0, 1], z overlappedBy [0, 1]
%!test
%! assert (isequal (powrev2 (infsup (0.5, 2.0), infsup (0.5, 2.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (powrev2 (infsup (0.5, 2.0), infsup (0.5, 2.0), infsup (-inf, 0.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (powrev2 (infsup (0.5, 2.0), infsup (0.5, 2.0), infsup (0.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev2 (infsup (0.5, inf), infsup (0.5, 2.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (powrev2 (infsup (0.5, inf), infsup (0.5, 2.0), infsup (-inf, 0.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (powrev2 (infsup (0.5, inf), infsup (0.5, 2.0), infsup (0.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev2 (infsup (0.5, 2.0), infsup (0.5, inf), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (powrev2 (infsup (0.5, 2.0), infsup (0.5, inf), infsup (-inf, 0.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (powrev2 (infsup (0.5, 2.0), infsup (0.5, inf), infsup (0.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev2 (infsup (0.5, inf), infsup (0.5, inf), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (powrev2 (infsup (0.5, inf), infsup (0.5, inf), infsup (-inf, 0.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (powrev2 (infsup (0.5, inf), infsup (0.5, inf), infsup (0.0, inf)), infsup (0.0, inf)));
%!# x overlappedBy [0, 1], z metBy [0, 1]
%!test
%! assert (isequal (powrev2 (infsup (0.5, 2.0), infsup (1.0, 2.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (powrev2 (infsup (0.5, 2.0), infsup (1.0, 2.0), infsup (-inf, 0.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (powrev2 (infsup (0.5, 2.0), infsup (1.0, 2.0), infsup (0.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev2 (infsup (0.5, inf), infsup (1.0, 2.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (powrev2 (infsup (0.5, inf), infsup (1.0, 2.0), infsup (-inf, 0.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (powrev2 (infsup (0.5, inf), infsup (1.0, 2.0), infsup (0.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev2 (infsup (0.5, 2.0), infsup (1.0, inf), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (powrev2 (infsup (0.5, 2.0), infsup (1.0, inf), infsup (-inf, 0.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (powrev2 (infsup (0.5, 2.0), infsup (1.0, inf), infsup (0.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev2 (infsup (0.5, inf), infsup (1.0, inf), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (powrev2 (infsup (0.5, inf), infsup (1.0, inf), infsup (-inf, 0.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (powrev2 (infsup (0.5, inf), infsup (1.0, inf), infsup (0.0, inf)), infsup (0.0, inf)));
%!# x overlappedBy [0, 1], z after [0, 1]
%!test
%! assert (isequal (powrev2 (infsup (0.5, 2.0), infsup (2.0, 4.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (powrev2 (infsup (0.5, 2.0), infsup (2.0, 4.0), infsup (-inf, 0.0)), infsup (-inf, -1.0)));
%!test
%! assert (isequal (powrev2 (infsup (0.5, 2.0), infsup (2.0, 4.0), infsup (0.0, inf)), infsup (1.0, inf)));
%!test
%! assert (isequal (powrev2 (infsup (0.5, inf), infsup (2.0, 4.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (powrev2 (infsup (0.5, inf), infsup (2.0, 4.0), infsup (-inf, 0.0)), infsup (-inf, -1.0)));
%!test
%! assert (isequal (powrev2 (infsup (0.5, inf), infsup (2.0, 4.0), infsup (0.0, inf)), infsup (0.0, inf)));
%!# x metBy [0, 1], z overlaps/starts [0, 1]
%!test
%! assert (isequal (powrev2 (infsup (1.0, 2.0), infsup (0.0, 0.5), infsup (-inf, inf)), infsup (-inf, -1.0)));
%!test
%! assert (isequal (powrev2 (infsup (1.0, 2.0), infsup (0.0, 0.5), infsup (-inf, 0.0)), infsup (-inf, -1.0)));
%!test
%! assert (isequal (powrev2 (infsup (1.0, 2.0), infsup (0.0, 0.5), infsup (0.0, inf)), infsup));
%!test
%! assert (isequal (powrev2 (infsup (1.0, inf), infsup (0.0, 0.5), infsup (-inf, inf)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (powrev2 (infsup (1.0, inf), infsup (0.0, 0.5), infsup (-inf, 0.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (powrev2 (infsup (1.0, inf), infsup (0.0, 0.5), infsup (0.0, inf)), infsup));
%!# x metBy [0, 1], z containedBy [0, 1]
%!test
%! assert (isequal (powrev2 (infsup (1.0, 2.0), infsup (0.25, 0.5), infsup (-inf, inf)), infsup (-inf, -1.0)));
%!test
%! assert (isequal (powrev2 (infsup (1.0, 2.0), infsup (0.25, 0.5), infsup (-inf, 0.0)), infsup (-inf, -1.0)));
%!test
%! assert (isequal (powrev2 (infsup (1.0, 2.0), infsup (0.25, 0.5), infsup (0.0, inf)), infsup));
%!test
%! assert (isequal (powrev2 (infsup (1.0, inf), infsup (0.25, 0.5), infsup (-inf, inf)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (powrev2 (infsup (1.0, inf), infsup (0.25, 0.5), infsup (-inf, 0.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (powrev2 (infsup (1.0, inf), infsup (0.25, 0.5), infsup (0.0, inf)), infsup));
%!# x metBy [0, 1], z finishes [0, 1]
%!test
%! assert (isequal (powrev2 (infsup (1.0, 2.0), infsup (0.5, 1.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (powrev2 (infsup (1.0, 2.0), infsup (1.0, 1.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (powrev2 (infsup (1.0, 2.0), infsup (0.5, 1.0), infsup (-inf, 0.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (powrev2 (infsup (1.0, 2.0), infsup (1.0, 1.0), infsup (-inf, 0.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (powrev2 (infsup (1.0, 2.0), infsup (0.5, 1.0), infsup (0.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev2 (infsup (1.0, 2.0), infsup (1.0, 1.0), infsup (0.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev2 (infsup (1.0, inf), infsup (0.5, 1.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (powrev2 (infsup (1.0, inf), infsup (1.0, 1.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (powrev2 (infsup (1.0, inf), infsup (0.5, 1.0), infsup (-inf, 0.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (powrev2 (infsup (1.0, inf), infsup (1.0, 1.0), infsup (-inf, 0.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (powrev2 (infsup (1.0, inf), infsup (0.5, 1.0), infsup (0.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev2 (infsup (1.0, inf), infsup (1.0, 1.0), infsup (0.0, inf)), infsup (0.0, inf)));
%!# x metBy [0, 1], z equals/finishedBy [0, 1]
%!test
%! assert (isequal (powrev2 (infsup (1.0, 2.0), infsup (0.0, 1.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (powrev2 (infsup (1.0, 2.0), infsup (0.0, 1.0), infsup (-inf, 0.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (powrev2 (infsup (1.0, 2.0), infsup (0.0, 1.0), infsup (0.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev2 (infsup (1.0, inf), infsup (0.0, 1.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (powrev2 (infsup (1.0, inf), infsup (0.0, 1.0), infsup (-inf, 0.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (powrev2 (infsup (1.0, inf), infsup (0.0, 1.0), infsup (0.0, inf)), infsup (0.0, inf)));
%!# x metBy [0, 1], z contains/startedBy [0, 1]
%!test
%! assert (isequal (powrev2 (infsup (1.0, 2.0), infsup (0.0, 2.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (powrev2 (infsup (1.0, 2.0), infsup (0.0, 2.0), infsup (-inf, 0.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (powrev2 (infsup (1.0, 2.0), infsup (0.0, 2.0), infsup (0.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev2 (infsup (1.0, inf), infsup (0.0, 2.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (powrev2 (infsup (1.0, inf), infsup (0.0, 2.0), infsup (-inf, 0.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (powrev2 (infsup (1.0, inf), infsup (0.0, 2.0), infsup (0.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev2 (infsup (1.0, 2.0), infsup (0.0, inf), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (powrev2 (infsup (1.0, 2.0), infsup (0.0, inf), infsup (-inf, 0.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (powrev2 (infsup (1.0, 2.0), infsup (0.0, inf), infsup (0.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev2 (infsup (1.0, inf), infsup (0.0, inf), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (powrev2 (infsup (1.0, inf), infsup (0.0, inf), infsup (-inf, 0.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (powrev2 (infsup (1.0, inf), infsup (0.0, inf), infsup (0.0, inf)), infsup (0.0, inf)));
%!# x metBy [0, 1], z overlappedBy [0, 1]
%!test
%! assert (isequal (powrev2 (infsup (1.0, 2.0), infsup (0.5, 2.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (powrev2 (infsup (1.0, 2.0), infsup (0.5, 2.0), infsup (-inf, 0.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (powrev2 (infsup (1.0, 2.0), infsup (0.5, 2.0), infsup (0.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev2 (infsup (1.0, inf), infsup (0.5, 2.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (powrev2 (infsup (1.0, inf), infsup (0.5, 2.0), infsup (-inf, 0.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (powrev2 (infsup (1.0, inf), infsup (0.5, 2.0), infsup (0.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev2 (infsup (1.0, 2.0), infsup (0.5, inf), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (powrev2 (infsup (1.0, 2.0), infsup (0.5, inf), infsup (-inf, 0.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (powrev2 (infsup (1.0, 2.0), infsup (0.5, inf), infsup (0.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev2 (infsup (1.0, inf), infsup (0.5, inf), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (powrev2 (infsup (1.0, inf), infsup (0.5, inf), infsup (-inf, 0.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (powrev2 (infsup (1.0, inf), infsup (0.5, inf), infsup (0.0, inf)), infsup (0.0, inf)));
%!# x metBy [0, 1], z metBy [0, 1]
%!test
%! assert (isequal (powrev2 (infsup (1.0, 2.0), infsup (1.0, 2.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (powrev2 (infsup (1.0, 2.0), infsup (1.0, inf), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (powrev2 (infsup (1.0, inf), infsup (1.0, inf), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (powrev2 (infsup (1.0, inf), infsup (1.0, 2.0), infsup (-inf, inf)), infsup (-inf, inf)));
%!test
%! assert (isequal (powrev2 (infsup (1.0, 2.0), infsup (1.0, 2.0), infsup (-inf, 0.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (powrev2 (infsup (1.0, inf), infsup (1.0, 2.0), infsup (-inf, 0.0)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (powrev2 (infsup (1.0, 2.0), infsup (1.0, 2.0), infsup (0.0, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev2 (infsup (1.0, inf), infsup (1.0, 2.0), infsup (0.0, inf)), infsup (0.0, inf)));
%!# x metBy [0, 1], z after [0, 1]
%!test
%! assert (isequal (powrev2 (infsup (1.0, 2.0), infsup (2.0, 4.0), infsup (-inf, inf)), infsup (1.0, inf)));
%!test
%! assert (isequal (powrev2 (infsup (1.0, inf), infsup (2.0, 4.0), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev2 (infsup (1.0, 2.0), infsup (2.0, 4.0), infsup (-inf, 0.0)), infsup));
%!test
%! assert (isequal (powrev2 (infsup (1.0, inf), infsup (2.0, 4.0), infsup (-inf, 0.0)), infsup));
%!test
%! assert (isequal (powrev2 (infsup (1.0, 2.0), infsup (2.0, 4.0), infsup (0.0, inf)), infsup (1.0, inf)));
%!test
%! assert (isequal (powrev2 (infsup (1.0, inf), infsup (2.0, 4.0), infsup (0.0, inf)), infsup (0.0, inf)));
%!# x after [0, 1], z overlaps/starts [0, 1]
%!test
%! assert (isequal (powrev2 (infsup (2.0, 4.0), infsup (0.0, 0.5), infsup (-inf, inf)), infsup (-inf, -0.5)));
%!test
%! assert (isequal (powrev2 (infsup (2.0, inf), infsup (0.0, 0.5), infsup (-inf, inf)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (powrev2 (infsup (2.0, inf), infsup (0.0, 0.5), infsup (0.0, inf)), infsup));
%!# x after [0, 1], z containedBy [0, 1]
%!test
%! assert (isequal (powrev2 (infsup (2.0, 4.0), infsup (0.25, 0.5), infsup (-inf, inf)), infsup (-2.0, -0.5)));
%!test
%! assert (isequal (powrev2 (infsup (2.0, inf), infsup (0.25, 0.5), infsup (-inf, inf)), infsup (-2.0, 0.0)));
%!test
%! assert (isequal (powrev2 (infsup (2.0, inf), infsup (0.25, 0.5), infsup (0.0, inf)), infsup));
%!# x after [0, 1], z finishes [0, 1]
%!test
%! assert (isequal (powrev2 (infsup (2.0, 4.0), infsup (0.5, 1.0), infsup (-inf, inf)), infsup (-1.0, 0.0)));
%!test
%! assert (isequal (powrev2 (infsup (2.0, inf), infsup (0.5, 1.0), infsup (-inf, inf)), infsup (-1.0, 0.0)));
%!test
%! assert (isequal (powrev2 (infsup (2.0, 4.0), infsup (1.0, 1.0), infsup (-inf, inf)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (powrev2 (infsup (2.0, inf), infsup (1.0, 1.0), infsup (-inf, inf)), infsup (0.0, 0.0)));
%!# x after [0, 1], z equals/finishedBy [0, 1]
%!test
%! assert (isequal (powrev2 (infsup (2.0, 4.0), infsup (0.0, 1.0), infsup (-inf, inf)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (powrev2 (infsup (2.0, inf), infsup (0.0, 1.0), infsup (-inf, inf)), infsup (-inf, 0.0)));
%!test
%! assert (isequal (powrev2 (infsup (2.0, 4.0), infsup (0.0, 1.0), infsup (0.0, inf)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (powrev2 (infsup (2.0, inf), infsup (0.0, 1.0), infsup (0.0, inf)), infsup (0.0, 0.0)));
%!# x after [0, 1], z contains/startedBy [0, 1]
%!test
%! assert (isequal (powrev2 (infsup (2.0, 4.0), infsup (0.0, 2.0), infsup (-inf, inf)), infsup (-inf, 1.0)));
%!test
%! assert (isequal (powrev2 (infsup (2.0, inf), infsup (0.0, 2.0), infsup (-inf, inf)), infsup (-inf, 1.0)));
%!# x after [0, 1], z overlappedBy [0, 1]
%!test
%! assert (isequal (powrev2 (infsup (2.0, 4.0), infsup (0.5, 2.0), infsup (-inf, inf)), infsup (-1.0, 1.0)));
%!test
%! assert (isequal (powrev2 (infsup (2.0, inf), infsup (0.5, 2.0), infsup (-inf, inf)), infsup (-1.0, 1.0)));
%!# x after [0, 1], z metBy [0, 1]
%!test
%! assert (isequal (powrev2 (infsup (2.0, 4.0), infsup (1.0, 2.0), infsup (-inf, inf)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (powrev2 (infsup (2.0, inf), infsup (1.0, 2.0), infsup (-inf, inf)), infsup (0.0, 1.0)));
%!test
%! assert (isequal (powrev2 (infsup (2.0, 4.0), infsup (1.0, 2.0), infsup (-inf, 0.0)), infsup (0.0, 0.0)));
%!test
%! assert (isequal (powrev2 (infsup (2.0, inf), infsup (1.0, 2.0), infsup (-inf, 0.0)), infsup (0.0, 0.0)));
%!# x after [0, 1], z after [0, 1]
%!test
%! assert (isequal (powrev2 (infsup (2.0, 4.0), infsup (2.0, 4.0), infsup (-inf, inf)), infsup (0.5, 2.0)));
%!test
%! assert (isequal (powrev2 (infsup (2.0, inf), infsup (2.0, 4.0), infsup (-inf, inf)), infsup (0.0, 2.0)));
%!test
%! assert (isequal (powrev2 (infsup (2.0, inf), infsup (2.0, 4.0), infsup (-inf, 0.0)), infsup));
%!test
%! assert (isequal (powrev2 (infsup (2.0, 4.0), infsup (2.0, inf), infsup (-inf, inf)), infsup (0.5, inf)));
%!test
%! assert (isequal (powrev2 (infsup (2.0, inf), infsup (2.0, inf), infsup (-inf, inf)), infsup (0.0, inf)));
%!test
%! assert (isequal (powrev2 (infsup (2.0, inf), infsup (2.0, inf), infsup (-inf, 0.0)), infsup));
