## Copyright (C) 2015 Markus Bergholz <markuman@gmail.com>
##
## This program is free software; you can redistribute it and/or modify it under
## the terms of the GNU General Public License as published by the Free Software
## Foundation; either version 3 of the License, or (at your option) any later
## version.
##
## This program is distributed in the hope that it will be useful, but WITHOUT
## ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
## FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more
## details.
##
## You should have received a copy of the GNU General Public License along with
## this program; if not, see <http://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn  {Function File} {} roundn (@var{X})
## @deftypefnx {Function File} {} roundn (@var{X}, @var{n})
## Round to multiples of 10.
##
## Returns the double nearest to multiply of 10^@var{n}, while @var{n}
## has to be an integer scalar.  @var{n} defaults to zero.
##
## When @var{X} is an integer, it rounds to the nearest decimal power.
##
## @seealso{round ceil floor fix roundb}
## @end deftypefn

function ret = roundn (x, n = 0)
  if (nargin < 1 || nargin > 2)
    print_usage ();
  endif

  if (mod (x, 1) != 0)
    ret = round (10^abs (n) * x) / (10^abs (n));
  else
    ret = round (x / 10^abs (n)) * 10 ^ abs (n);
  endif
endfunction

%!assert (roundn (pi), 3)
%!assert (roundn (e, -2), 2.7200)
%!assert (roundn (pi, 4), 3.1416)
%!assert (roundn (e, 3), 2.718)
%!assert (roundn ([0.197608841252122, 0.384415323084123; 0.213847642260694, 0.464622347858917], 2), [0.20, 0.38; 0.21, 0.46])
%!assert (roundn (401189, 3), 401000)
%!assert (roundn (5), 5)
%!assert (roundn (-5), -5)
