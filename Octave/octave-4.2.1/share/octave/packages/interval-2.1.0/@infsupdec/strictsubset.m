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

## -*- texinfo -*-
## @documentencoding UTF-8
## @defmethod {@@infsupdec} strictsubset (@var{A}, @var{B})
## 
## Evaluate strict subset comparison on intervals.
##
## True, if all numbers from @var{A} are also contained in @var{B} and @var{B}
## contains a number that is not in @var{A}.
## False, if @var{A} contains a number which is not a member in @var{B} or if
## @var{A} and @var{B} are equal.
##
## Evaluated on interval matrices, this functions is applied element-wise.
##
## @seealso{@@infsupdec/subset, @@infsupdec/eq, @@infsupdec/interior}
## @end defmethod

## Author: Oliver Heimlich
## Keywords: interval
## Created: 2016-05-16

function result = strictsubset (a, b)

if (nargin ~= 2)
    print_usage ();
    return
endif

if (not (isa (a, "infsupdec")))
    a = infsupdec (a);
endif
if (not (isa (b, "infsupdec")))
    b = infsupdec (b);
endif

result = strictsubset (a.infsup, b.infsup);
result(isnai (a) | isnai (b)) = false;

endfunction

%!assert (strictsubset (infsupdec (1, 2), infsupdec (1, 3)));
%!assert (strictsubset (infsupdec (2, 3), infsupdec (1, 3)));
%!assert (not (strictsubset (infsupdec (1, 2), infsupdec (1, 2))));
%!assert (not (strictsubset (infsupdec (1, 3), infsupdec (1, 2))));
%!assert (strictsubset (infsupdec (), infsupdec (1, 3)));
%!assert (not (strictsubset (infsupdec (), infsupdec ())));
%!assert (strictsubset (infsupdec (), infsupdec (-inf, inf)));
%!assert (strictsubset (infsupdec (0, inf), infsupdec (-inf, inf)));
%!assert (strictsubset (infsupdec (-inf, 0), infsupdec (-inf, inf)));
%!assert (not (strictsubset (infsupdec (-inf, inf), infsupdec (-inf, inf))));

