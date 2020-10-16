## Copyright (C) 2008 Sylvain Pelissier <sylvain.pelissier@gmail.com>
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
## @deftypefn {Function File} {@var{intrlvd} =} randdeintrlv (@var{data}, @var{state})
## Restore elements of @var{data} with a random permutation.
## @seealso{randintrlv, intrlv, deintrlv}
## @end deftypefn

function deintrlvd = randdeintrlv (data, state)

  if (nargin != 2)
    print_usage ();
  endif

  if (isvector (data))
    l = length (data);
  else
    l = size (data, 1);
  endif
  rand ("state", state);
  deintrlvd = deintrlv (data, randperm (l));

endfunction

%% Test input validation
%!error randdeintrlv ()
%!error randdeintrlv (1)
%!error randdeintrlv (1, 2, 3)
