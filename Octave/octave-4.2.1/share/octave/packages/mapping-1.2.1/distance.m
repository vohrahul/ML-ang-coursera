## Copyright (C) 2004 Andrew Collier <abcollier@users.sourceforge.net>
## Copyright (C) 2011 Alexander Barth <abarth93@users.sourceforge.net>
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
## @deftypefn {Function File}  {} [@var{dist},@var{az}] = distance(@var{pt1}, @var{pt2})
## @deftypefnx {Function File} {} [@var{dist},@var{az}] = distance(@var{pt1}, @var{pt2},@var{units})
## @deftypefnx {Function File} {} [@var{dist},@var{az}] = distance(@var{lat1},@var{lon1},@var{lat2},@var{lon2})
## @deftypefnx {Function File} {} [@var{dist},@var{az}] = distance(@var{lat1},@var{lon1},@var{lat2},@var{lon2},@var{units})
##
## Calculates the great circle distance @var{dist} between @var{pt1} and @var{pt2} and optionally the azimuth @var{az}.
## @var{pt1} and @var{pt2} are two-column matrices of the form [latitude longitude].
## The coordinates can also be given by the parameters @var{lat1}, @var{lon1}, @var{lat2} and @var{lon2}.
## Units can be either 'degrees' (the default) or 'radians'.
##
##
## @example
## >> distance([37,-76], [37,-9]) 
## ans = 52.309
## >> distance([37,-76], [67,-76])
## ans = 30.000
## >> distance(0,0, 0,pi,'radians') 
## ans = 3.1416
## @end example
##
## @seealso{azimuth,elevation}
## @end deftypefn

## Author: Andrew Collier <abcollier@users.sourceforge.net>
## Adapted-by: Alexander Barth <abarth93@users.sourceforge.net>

## Uses "cosine formula".

function [dist,az] = distance(varargin)
  ## default units are degrees

  units = 'degrees';

  [reg,prop] = parseparams(varargin);

  if length(reg) == 2
    pt1 = reg{1};
    pt2 = reg{2};

    a = pt1(:,1);
    b = pt2(:,1);
    C = pt2(:,2) - pt1(:,2);
  elseif length(reg) == 4
    a = reg{1};
    b = reg{3};
    C = reg{4} - reg{2};
  else
     error('Wrong number of type of arguments');
  end

  if length(prop) == 1
    units = prop{1};

    if (~strcmp(units,'degrees') && ~strcmp(units,'radians'))
      error('Only degrees and radians are allowed as units');
    end
  elseif length(prop) > 1
    error('Wrong number of type of arguments');
  end

  if (strcmp(units,'degrees'))
    a = deg2rad(a);
    b = deg2rad(b);
    C = deg2rad(C);
  end

  dist = acos(sin(b) .* sin(a) + cos(b) .* cos(a) .* cos(C));

  if (strcmp(units,'degrees'))
     dist = rad2deg(dist);
  end

  if nargout == 2
    az = atan2(sin(C) , cos(a) .* tan(b) - sin(a) .* cos(C) );

    ## bring the angle in the interval [0 2*pi[

    az = mod(az,2*pi);

    ## convert to degrees if desired

    if (strcmp(units,'degrees'))
       az = rad2deg(az);
    end
  end

endfunction

%!assert(distance([37,-76], [37,-9]), 52.30942093, 1e-7)

%!test
%! [d,az] = distance(0,0, 0,pi,'radians');
%! assert(d,pi,1e-7)
%! assert(az,pi/2,1e-7)
