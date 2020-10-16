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
## @defmethod {@@infsupdec} union (@var{A})
## @defmethodx {@@infsupdec} union (@var{A}, @var{B})
## @defmethodx {@@infsupdec} union (@var{A}, [], @var{DIM})
## 
## Build the interval hull of the union of intervals.
##
## With two arguments the union is built pair-wise.  Otherwise the union is
## computed for all interval members along dimension @var{DIM}, which defaults
## to the first non-singleton dimension.
##
## Accuracy: The result is exact.
##
## @comment DO NOT SYNCHRONIZE DOCUMENTATION STRING
## The function is a set operation and the result carries the @code{trv}
## decoration at best.
##
## @example
## @group
## x = infsupdec (1, 3);
## y = infsupdec (2, 4);
## union (x, y)
##   @result{} ans = [1, 4]_trv
## @end group
## @end example
## @seealso{hull, @@infsupdec/intersect, @@infsupdec/setdiff, @@infsupdec/setxor}
## @end defmethod

## Author: Oliver Heimlich
## Keywords: interval
## Created: 2014-10-13

function result = union (a, b, dim)

if (not (isa (a, "infsupdec")))
    a = infsupdec (a);
endif

switch (nargin)
    case 1
        result = infsupdec (union (a.infsup), "trv");
        result.dec = min (result.dec, min (a.dec));
        
    case 2
        if (not (isa (b, "infsupdec")))
            b = infsupdec (b);
        endif
        result = infsupdec (union (a.infsup, b.infsup), "trv");
        warning ("off", "Octave:broadcast", "local");
        result.dec = min (result.dec, min (a.dec, b.dec));
    case 3
        if (not (builtin ("isempty", b)))
            warning ("union: second argument is ignored");
        endif
        result = infsupdec (union (a.infsup, [], dim), "trv");
        result.dec = min (result.dec, min (a.dec, [], dim));
    otherwise
        print_usage ();
        return
endswitch

endfunction

%!# from the documentation string
%!assert (isequal (union (infsupdec (1, 3), infsupdec (2, 4)), infsupdec (1, 4, "trv")));
