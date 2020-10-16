## Copyright 2014-2016 Oliver Heimlich
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
## @defmethod {@@infsupdec} interior (@var{A}, @var{B})
## 
## Evaluate interior comparison on intervals.
##
## True, if all numbers from @var{A} are also contained in @var{B}, but are no
## boundaries of @var{B}.  False, if @var{A} contains a number which is not a
## member in @var{B} or which is a boundary of @var{B}.
##
## Evaluated on interval matrices, this functions is applied element-wise.
##
## @seealso{@@infsupdec/eq, @@infsupdec/subset, @@infsupdec/disjoint}
## @end defmethod

## Author: Oliver Heimlich
## Keywords: interval
## Created: 2014-10-13

function result = interior (a, b)

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

result = interior (a.infsup, b.infsup);
result(isnai (a) | isnai (b)) = false;

endfunction

%!assert (interior (infsupdec (1, 2), infsupdec (0, 3)));
