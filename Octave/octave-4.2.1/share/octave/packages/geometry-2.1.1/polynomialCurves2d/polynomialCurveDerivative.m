## Copyright (C) 2004-2011 David Legland <david.legland@grignon.inra.fr>
## Copyright (C) 2004-2011 INRA - CEPIA Nantes - MIAJ (Jouy-en-Josas)
## Copyright (C) 2012 Adapted to Octave by Juan Pablo Carbajal <carbajal@ifi.uzh.ch>
## All rights reserved.
## 
## Redistribution and use in source and binary forms, with or without
## modification, are permitted provided that the following conditions are met:
## 
##     1 Redistributions of source code must retain the above copyright notice,
##       this list of conditions and the following disclaimer.
##     2 Redistributions in binary form must reproduce the above copyright
##       notice, this list of conditions and the following disclaimer in the
##       documentation and/or other materials provided with the distribution.
## 
## THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS ''AS IS''
## AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
## IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
## ARE DISCLAIMED. IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE FOR
## ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
## DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
## SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
## CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
## OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
## OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

## -*- texinfo -*-
## @deftypefn {Function File} {@var{v} =} polynomialCurveDerivative (@var{t}, @var{xcoef},@var{ycoef})
## @deftypefnx {Function File} {@var{v} =} polynomialCurveDerivative (@var{t}, @var{coefs})
## Compute derivative vector of a polynomial curve
##
##   @var{xcoef} and @var{ycoef} are row vectors of coefficients, in the form:
##       [a0 a1 a2 ... an]
##   @var{v} is a 1x2 array containing direction of derivative of polynomial
##   curve, computed for position @var{t}. If @var{t} is a vector, @var{v} has as many rows
##   as the length of @var{t}.
##
##   @var{coefs} is either a 2xN matrix (one row for the coefficients of each
##   coordinate), or a cell array.
## 
## @seealso{polynomialCurves2d, polynomialCurveNormal, polynomialCurvePoint,
##   polynomialCurveCurvature}
## @end deftypefn


function v = polynomialCurveDerivative(t, varargin)
  ## Extract input parameters

  # polynomial coefficients for each coordinate
  var = varargin{1};
  if iscell(var)
      xCoef = var{1};
      yCoef = var{2};
  elseif size(var, 1)==1
      xCoef = varargin{1};
      yCoef = varargin{2};
  else
      xCoef = var(1,:);
      yCoef = var(2,:);
  end
  # convert to Octave polynomial convention
  xCoef = xCoef(end:-1:1);
  yCoef = yCoef(end:-1:1);
      

  # compute derivative of the polynomial
  dx = polyder (xCoef);
  dy = polyder (yCoef);

  # numerical integration of the Jacobian of parametrized curve
  v = [polyval(dx, t) polyval(dy, t)];

endfunction

