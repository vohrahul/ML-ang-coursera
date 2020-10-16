## Copyright (C) 2010-2016 Olaf Till <i7tiol@t-online.de>
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
## @deftypefn {Function File} {[@var{p}, @var{resid}, @var{cvg}, @var{outp}] =} nonlin_residmin (@var{f}, @var{pin})
## @deftypefnx {Function File} {[@var{p}, @var{resid}, @var{cvg}, @var{outp}] =} nonlin_residmin (@var{f}, @var{pin}, @var{settings})
## Frontend for nonlinear minimization of residuals returned by a model
## function.
##
## The functions supplied by the user have a minimal
## interface; any additionally needed constants (e.g. observed values)
## can be supplied by wrapping the user functions into anonymous
## functions.
##
## The following description applies to usage with vector-based
## parameter handling. Differences in usage for structure-based
## parameter handling will be explained separately.
##
## @var{f}: function returning the array of residuals. It gets a column
## vector of real parameters as argument. In gradient determination,
## this function may be called with an informational second argument,
## whose content depends on the function for gradient determination.
##
## @var{pin}: real column vector of initial parameters.
##
## @var{settings}: structure whose fields stand for optional settings
## referred to below. The fields can be set by @code{optimset()}.
##
## The returned values are the column vector of final parameters
## @var{p}, the final array of residuals @var{resid}, an integer
## @var{cvg} indicating if and how optimization succeeded or failed, and
## a structure @var{outp} with additional information, curently with the
## fields: @code{niter}, the number of iterations and
## @code{user_interaction}, information on user stops (see settings).
## The backend may define additional fields. If the backend supports it,
## @var{outp} has a field @code{lambda} with determined Lagrange
## multipliers of any constraints, seperated into subfields @code{lower}
## and @code{upper} for bounds, @code{eqlin} and @code{ineqlin} for
## linear equality and inequality constraints (except bounds),
## respectively, and @code{eqnonlin} and @code{ineqnonlin} for general
## equality and inequality constraints, respectively. @var{cvg} is
## greater than zero for success and less than or equal to zero for
## failure; its possible values depend on the used backend and currently
## can be @code{0} (maximum number of iterations exceeded), @code{2}
## (parameter change less than specified precision in two consecutive
## iterations), or @code{3} (improvement in objective function -- e.g.
## sum of squares -- less than specified), or @code{-1} (algorithm
## aborted by a user function).
##
## @c The following block will be cut out in the package info file.
## @c BEGIN_CUT_TEXINFO
##
## For settings, type @code{optim_doc ("nonlin_residmin")}.
##
## For desription of structure-based parameter handling, type
## @code{optim_doc ("parameter structures")}.
##
## For description of individual backends (currently only one), type
## @code{optim_doc ("residual optimization")} and choose the backend in
## the menu.
##
## @c END_CUT_TEXINFO
##
## @seealso {nonlin_curvefit}
## @end deftypefn

## PKG_ADD: [~] = __all_opts__ ("nonlin_residmin");

function [p, resid, cvg, outp] = nonlin_residmin (varargin)

  if (nargin == 1)
    p = __nonlin_residmin__ (varargin{1});
    return;
  endif

  if (nargin < 2 || nargin > 3)
    print_usage ();
  endif

  if (nargin == 2)
    varargin{3} = struct ();
  endif

  varargin{4} = struct ();

  [p, resid, cvg, outp] = __nonlin_residmin__ (varargin{:});

endfunction

%!demo
%!  ## Example for linear inequality constraints
%!  ## (see also the same example in 'demo nonlin_curvefit')
%!
%!  ## independents
%!  indep = 1:5;
%!  ## residual function:
%!  f = @ (p) p(1) * exp (p(2) * indep) - [1, 2, 4, 7, 14];
%!  ## initial values:
%!  init = [.25; .25];
%!  ## linear constraints, A.' * parametervector + B >= 0
%!  A = [1; -1]; B = 0; # p(1) >= p(2);
%!  settings = optimset ("inequc", {A, B});
%!
%!  ## start optimization
%!  [p, residuals, cvg, outp] = nonlin_residmin (f, init, settings)
