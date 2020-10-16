## Copyright (C) 2008 Bill Denney <bill@denney.ws>
## Copyright (C) 2013 Carnë Draug <carandraug@octave.org>
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
## @deftypefn  {Function File} {} minute (@var{date})
## @deftypefnx {Function File} {} minute (@var{date}, @var{f})
## Return minutes of a date.
##
## For a given @var{date} in a serial date number or date string format,
## returns its minutes.  The optional variable @var{f}, specifies the
## format string used to interpret date strings.
##
## @seealso{date, datevec, now, hour, second}
## @end deftypefn

function t = minute (varargin)

  if (nargin < 1 || nargin > 2)
    print_usage ();
  elseif (nargin >= 2 && ! ischar (varargin{2}))
    error ("minute: F must be a string");
  endif

  t = datevec (varargin{:})(:,5);
endfunction

%!assert (minute (451482.906781456), 45)
%!assert (minute ("1967-09-21 11:56:34", "yyyy-mm-dd HH:MM:SS"), 56)
