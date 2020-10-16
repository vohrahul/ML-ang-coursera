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

## -*- texinfo -*-
## @documentencoding UTF-8
## @defmethod {@@infsupdec} resize (@var{X}, @var{M})
## @defmethodx {@@infsupdec} resize (@var{X}, @var{M}, @var{N})
## @defmethodx {@@infsupdec} resize (@var{X}, [@var{M} @var{N}])
##
## Resize interval matrix @var{X} cutting off elements as necessary.
##
## In the result, element with certain indices is equal to the corresponding
## element of @var{X} if the indices are within the bounds of @var{X};
## otherwise, the element is set to zero.
##
## If only @var{M} is supplied, and it is a scalar, the dimension of the result
## is @var{M}-by-@var{M}.  If @var{M} and @var{N} are all scalars, then the
## dimensions of the result are @var{M}-by-@var{N}.  If given a vector as
## input, then the dimensions of the result are given by the elements of that
## vector.
##
## @example
## @group
## resize (infsupdec (magic (3)), 4, 2)
##   @result{} ans = 4×2 interval matrix
##      [8]_com   [1]_com
##      [3]_com   [5]_com
##      [4]_com   [9]_com
##      [0]_com   [0]_com
## @end group
## @end example
## @seealso{@@infsupdec/reshape, @@infsup/cat, @@infsupdec/postpad, @@infsupdec/prepad}
## @end defmethod

## Author: Oliver Heimlich
## Keywords: interval
## Created: 2015-04-19

function x = resize (x, m, n)

if (not (isa (x, "infsupdec")))
    print_usage ();
    return
endif

x.dec(x.dec == 0) = uint8 (255);

switch nargin
    case 2
        x.infsup = resize (x.infsup, m);
        x.dec = resize (x.dec, m);
    case 3
        x.infsup = resize (x.infsup, m, n);
        x.dec = resize (x.dec, m, n);
    otherwise
        print_usage ();
        return
endswitch

x.dec(x.dec == 0) = _com (); # any new elements are [0]_com
x.dec(x.dec == uint8 (255)) = uint8 (0);

endfunction

%!assert (isequal (resize (infsupdec (magic (3)), 4, 2), infsupdec([8, 1; 3, 5; 4, 9; 0, 0])));