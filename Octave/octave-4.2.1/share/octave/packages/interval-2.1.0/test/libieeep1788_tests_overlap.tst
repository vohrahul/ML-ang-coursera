## DO NOT EDIT!  Generated automatically from test/libieeep1788_tests_overlap.itl
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

## minimal_overlap_test

%!test
%! assert (isequal (overlap (infsup, infsup), "bothEmpty"));
%!test
%! assert (isequal (overlap (infsup, infsup (1.0, 2.0)), "firstEmpty"));
%!test
%! assert (isequal (overlap (infsup (1.0, 2.0), infsup), "secondEmpty"));
%!test
%! assert (isequal (overlap (infsup (-inf, 2.0), infsup (3.0, inf)), "before"));
%!test
%! assert (isequal (overlap (infsup (-inf, 2.0), infsup (3.0, 4.0)), "before"));
%!test
%! assert (isequal (overlap (infsup (2.0, 2.0), infsup (3.0, 4.0)), "before"));
%!test
%! assert (isequal (overlap (infsup (1.0, 2.0), infsup (3.0, 4.0)), "before"));
%!test
%! assert (isequal (overlap (infsup (1.0, 2.0), infsup (3.0, 3.0)), "before"));
%!test
%! assert (isequal (overlap (infsup (2.0, 2.0), infsup (3.0, 3.0)), "before"));
%!test
%! assert (isequal (overlap (infsup (2.0, 2.0), infsup (3.0, inf)), "before"));
%!test
%! assert (isequal (overlap (infsup (-inf, 2.0), infsup (2.0, 3.0)), "meets"));
%!test
%! assert (isequal (overlap (infsup (1.0, 2.0), infsup (2.0, 3.0)), "meets"));
%!test
%! assert (isequal (overlap (infsup (1.0, 2.0), infsup (2.0, inf)), "meets"));
%!test
%! assert (isequal (overlap (infsup (1.0, 2.0), infsup (1.5, 2.5)), "overlaps"));
%!test
%! assert (isequal (overlap (infsup (1.0, 2.0), infsup (1.0, inf)), "starts"));
%!test
%! assert (isequal (overlap (infsup (1.0, 2.0), infsup (1.0, 3.0)), "starts"));
%!test
%! assert (isequal (overlap (infsup (1.0, 1.0), infsup (1.0, 3.0)), "starts"));
%!test
%! assert (isequal (overlap (infsup (1.0, 2.0), infsup (-inf, inf)), "containedBy"));
%!test
%! assert (isequal (overlap (infsup (1.0, 2.0), infsup (-inf, 3.0)), "containedBy"));
%!test
%! assert (isequal (overlap (infsup (1.0, 2.0), infsup (0.0, 3.0)), "containedBy"));
%!test
%! assert (isequal (overlap (infsup (2.0, 2.0), infsup (0.0, 3.0)), "containedBy"));
%!test
%! assert (isequal (overlap (infsup (2.0, 2.0), infsup (0.0, inf)), "containedBy"));
%!test
%! assert (isequal (overlap (infsup (1.0, 2.0), infsup (-inf, 2.0)), "finishes"));
%!test
%! assert (isequal (overlap (infsup (1.0, 2.0), infsup (0.0, 2.0)), "finishes"));
%!test
%! assert (isequal (overlap (infsup (2.0, 2.0), infsup (0.0, 2.0)), "finishes"));
%!test
%! assert (isequal (overlap (infsup (1.0, 2.0), infsup (1.0, 2.0)), "equals"));
%!test
%! assert (isequal (overlap (infsup (1.0, 1.0), infsup (1.0, 1.0)), "equals"));
%!test
%! assert (isequal (overlap (infsup (-inf, 1.0), infsup (-inf, 1.0)), "equals"));
%!test
%! assert (isequal (overlap (infsup (-inf, inf), infsup (-inf, inf)), "equals"));
%!test
%! assert (isequal (overlap (infsup (3.0, 4.0), infsup (2.0, 2.0)), "after"));
%!test
%! assert (isequal (overlap (infsup (3.0, 4.0), infsup (1.0, 2.0)), "after"));
%!test
%! assert (isequal (overlap (infsup (3.0, 3.0), infsup (1.0, 2.0)), "after"));
%!test
%! assert (isequal (overlap (infsup (3.0, 3.0), infsup (2.0, 2.0)), "after"));
%!test
%! assert (isequal (overlap (infsup (3.0, inf), infsup (2.0, 2.0)), "after"));
%!test
%! assert (isequal (overlap (infsup (2.0, 3.0), infsup (1.0, 2.0)), "metBy"));
%!test
%! assert (isequal (overlap (infsup (2.0, 3.0), infsup (-inf, 2.0)), "metBy"));
%!test
%! assert (isequal (overlap (infsup (1.5, 2.5), infsup (1.0, 2.0)), "overlappedBy"));
%!test
%! assert (isequal (overlap (infsup (1.5, 2.5), infsup (-inf, 2.0)), "overlappedBy"));
%!test
%! assert (isequal (overlap (infsup (1.0, inf), infsup (1.0, 2.0)), "startedBy"));
%!test
%! assert (isequal (overlap (infsup (1.0, 3.0), infsup (1.0, 2.0)), "startedBy"));
%!test
%! assert (isequal (overlap (infsup (1.0, 3.0), infsup (1.0, 1.0)), "startedBy"));
%!test
%! assert (isequal (overlap (infsup (-inf, 3.0), infsup (1.0, 2.0)), "contains"));
%!test
%! assert (isequal (overlap (infsup (-inf, inf), infsup (1.0, 2.0)), "contains"));
%!test
%! assert (isequal (overlap (infsup (0.0, 3.0), infsup (1.0, 2.0)), "contains"));
%!test
%! assert (isequal (overlap (infsup (0.0, 3.0), infsup (2.0, 2.0)), "contains"));
%!test
%! assert (isequal (overlap (infsup (-inf, 2.0), infsup (1.0, 2.0)), "finishedBy"));
%!test
%! assert (isequal (overlap (infsup (0.0, 2.0), infsup (1.0, 2.0)), "finishedBy"));
%!test
%! assert (isequal (overlap (infsup (0.0, 2.0), infsup (2.0, 2.0)), "finishedBy"));

## minimal_overlap_dec_test

%!test
%! assert (isequal (overlap (infsupdec (empty, "trv"), infsupdec (empty, "trv")), "bothEmpty"));
%!test
%! assert (isequal (overlap (infsupdec (empty, "trv"), infsupdec (1.0, 2.0, "com")), "firstEmpty"));
%!test
%! assert (isequal (overlap (infsupdec (1.0, 2.0, "def"), infsupdec (empty, "trv")), "secondEmpty"));
%!test
%! assert (isequal (overlap (infsupdec (2.0, 2.0, "def"), infsupdec (3.0, 4.0, "def")), "before"));
%!test
%! assert (isequal (overlap (infsupdec (1.0, 2.0, "dac"), infsupdec (3.0, 4.0, "com")), "before"));
%!test
%! assert (isequal (overlap (infsupdec (1.0, 2.0, "com"), infsupdec (3.0, 3.0, "trv")), "before"));
%!test
%! assert (isequal (overlap (infsupdec (2.0, 2.0, "trv"), infsupdec (3.0, 3.0, "def")), "before"));
%!test
%! assert (isequal (overlap (infsupdec (1.0, 2.0, "def"), infsupdec (2.0, 3.0, "def")), "meets"));
%!test
%! assert (isequal (overlap (infsupdec (1.0, 2.0, "dac"), infsupdec (1.5, 2.5, "def")), "overlaps"));
%!test
%! assert (isequal (overlap (infsupdec (1.0, 2.0, "def"), infsupdec (1.0, 3.0, "com")), "starts"));
%!test
%! assert (isequal (overlap (infsupdec (1.0, 1.0, "trv"), infsupdec (1.0, 3.0, "def")), "starts"));
%!test
%! assert (isequal (overlap (infsupdec (1.0, 2.0, "def"), infsupdec (0.0, 3.0, "dac")), "containedBy"));
%!test
%! assert (isequal (overlap (infsupdec (2.0, 2.0, "trv"), infsupdec (0.0, 3.0, "def")), "containedBy"));
%!test
%! assert (isequal (overlap (infsupdec (1.0, 2.0, "trv"), infsupdec (0.0, 2.0, "com")), "finishes"));
%!test
%! assert (isequal (overlap (infsupdec (2.0, 2.0, "def"), infsupdec (0.0, 2.0, "dac")), "finishes"));
%!test
%! assert (isequal (overlap (infsupdec (1.0, 2.0, "def"), infsupdec (1.0, 2.0, "def")), "equals"));
%!test
%! assert (isequal (overlap (infsupdec (1.0, 1.0, "dac"), infsupdec (1.0, 1.0, "dac")), "equals"));
%!test
%! assert (isequal (overlap (infsupdec (3.0, 4.0, "trv"), infsupdec (2.0, 2.0, "trv")), "after"));
%!test
%! assert (isequal (overlap (infsupdec (3.0, 4.0, "def"), infsupdec (1.0, 2.0, "def")), "after"));
%!test
%! assert (isequal (overlap (infsupdec (3.0, 3.0, "com"), infsupdec (1.0, 2.0, "dac")), "after"));
%!test
%! assert (isequal (overlap (infsupdec (3.0, 3.0, "def"), infsupdec (2.0, 2.0, "trv")), "after"));
%!test
%! assert (isequal (overlap (infsupdec (2.0, 3.0, "def"), infsupdec (1.0, 2.0, "trv")), "metBy"));
%!test
%! assert (isequal (overlap (infsupdec (1.5, 2.5, "com"), infsupdec (1.0, 2.0, "com")), "overlappedBy"));
%!test
%! assert (isequal (overlap (infsupdec (1.0, 3.0, "dac"), infsupdec (1.0, 2.0, "def")), "startedBy"));
%!test
%! assert (isequal (overlap (infsupdec (1.0, 3.0, "com"), infsupdec (1.0, 1.0, "dac")), "startedBy"));
%!test
%! assert (isequal (overlap (infsupdec (0.0, 3.0, "com"), infsupdec (1.0, 2.0, "dac")), "contains"));
%!test
%! assert (isequal (overlap (infsupdec (0.0, 3.0, "com"), infsupdec (2.0, 2.0, "def")), "contains"));
%!test
%! assert (isequal (overlap (infsupdec (0.0, 2.0, "def"), infsupdec (1.0, 2.0, "trv")), "finishedBy"));
%!test
%! assert (isequal (overlap (infsupdec (0.0, 2.0, "dac"), infsupdec (2.0, 2.0, "def")), "finishedBy"));
