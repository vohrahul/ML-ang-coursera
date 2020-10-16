## Copyright (C) 2011-2016 Olaf Till <i7tiol@t-online.de>
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
## @deftypefn {Function File} {@var{info} =} residmin_stat (@var{f}, @var{p}, @var{settings})
## Frontend for computation of statistics for a residual-based
## minimization.
##
## @var{settings} is a structure whose fields can be set by
## @code{optimset}. With @var{settings} the computation of certain
## statistics is requested by setting the fields
## @code{ret_<name_of_statistic>} to @code{true}. The respective
## statistics will be returned in a structure as fields with name
## @code{<name_of_statistic>}. Depending on the requested statistic and
## on the additional information provided in @var{settings}, @var{f} and
## @var{p} may be empty. Otherwise, @var{f} is the model function of an
## optimization (the interface of @var{f} is described e.g. in
## @code{nonlin_residmin}, please see there), and @var{p} is a real
## column vector with parameters resulting from the same optimization.
##
## Currently, the following statistics (or general information) can be
## requested:
##
## @code{dfdp}: Jacobian of model function with respect to parameters.
##
## @code{covd}: Covariance matrix of data (typically guessed by applying
## a factor to the covariance matrix of the residuals).
##
## @code{covp}: Covariance matrix of final parameters.
##
## @code{corp}: Correlation matrix of final parameters.
##
## @c The following block will be cut out in the package info file.
## @c BEGIN_CUT_TEXINFO
##
## For further settings, type @code{optim_doc ("residmin_stat")}.
##
## For desription of structure-based parameter handling, type
## @code{optim_doc ("parameter structures")}.
##
## For backend information, type @code{optim_doc ("residual
## optimization")} and choose the backends type in the menu.
##
## @c END_CUT_TEXINFO
##
## @seealso {curvefit_stat}
## @end deftypefn

## PKG_ADD: [~] = __all_opts__ ("residmin_stat");

function ret = residmin_stat (varargin)

  if (nargin == 1)
    ret = __residmin_stat__ (varargin{1});
    return;
  endif

  if (nargin != 3)
    print_usage ();
  endif

  varargin{4} = struct ();

  ret = __residmin_stat__ (varargin{:});

endfunction
