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
## @defmethod {@@infsupdec} log1p (@var{X})
## 
## Compute @code{log (1 + @var{X})} accurately in the neighborhood of zero.
##
## The function is only defined where @var{X} is greater than -1.
##
## Accuracy: The result is a tight enclosure.
##
## @example
## @group
## log1p (infsupdec (eps))
##   @result{} ans ⊂ [2.2204e-16, 2.2205e-16]_com
## @end group
## @end example
## @seealso{@@infsup/exp, @@infsup/log}
## @end defmethod

## Author: Oliver Heimlich
## Keywords: interval
## Created: 2015-02-20

function result = log1p (x)

if (nargin ~= 1)
    print_usage ();
    return
endif

result = newdec (log1p (x.infsup));

## log1p is continuous everywhere, but defined for x > -1 only
persistent domain_hull = infsup (-1, inf);
result.dec(not (interior (x.infsup, domain_hull))) = _trv ();

result.dec = min (result.dec, x.dec);

endfunction

%!# from the documentation string
%!assert (isequal (log1p (infsupdec (eps)), infsupdec ("[0x1.FFFFFFFFFFFFFp-53, 0x1p-52]")));
