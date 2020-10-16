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
## @deftypefn {Function File} {@var{h} =} drawCircle3d (@var{circle2d}, @var{normal})
## @deftypefnx {Function File} {@var{h} =} drawCircle3d (@var{xc}, @var{yc}, @var{zc}, @var{r}, @var{theta}, @var{phi}, @var{psi})
## Draw a 3D circle
##
##   Possible calls for the function:
##   drawCircle3d([XC YC ZC R THETA PHI])
##   drawCircle3d([XC YC ZC R], [THETA PHI])
##
##   where XC, YC, ZY are coordinates of circle center, R is the circle
##   radius, PHI and THETA are 3D angles in degrees of the normal to the
##   plane containing the circle:
##   * THETA between 0 and 180 degrees, corresponding to the colatitude
##       (angle with Oz axis).
##   * PHI between 0 and 360 degrees corresponding to the longitude (angle
##       with Ox axis)
##
##   drawCircle3d([XC YC ZC R THETA PHI PSI])
##   drawCircle3d([XC YC ZC R], [THETA PHI PSI])
##   drawCircle3d([XC YC ZC R], THETA, PHI)
##   drawCircle3d([XC YC ZC], R, THETA, PHI)
##   drawCircle3d([XC YC ZC R], THETA, PHI, PSI)
##   drawCircle3d([XC YC ZC], R, THETA, PHI, PSI)
##   drawCircle3d(XC, YC, ZC, R, THETA, PHI)
##   drawCircle3d(XC, YC, ZC, R, THETA, PHI, PSI)
##   Are other possible syntaxes for this function.
##
##   H = drawCircle3d(...)
##   return handle on the created LINE object
##
##   Example
##  @example
##     # display 3 mutually orthogonal 3D circles
##     figure; hold on;
##     drawCircle3d([10 20 30 50  0  0], 'LineWidth', 2, 'Color', 'b');
##     drawCircle3d([10 20 30 50 90  0], 'LineWidth', 2, 'Color', 'r');
##     drawCircle3d([10 20 30 50 90 90], 'LineWidth', 2, 'Color', 'g');
##     axis equal;
##     axis([-50 100 -50 100 -50 100]);
##     view([-10 20])
##
##     # Draw several circles at once
##     center = [10 20 30];
##     circ1 = [center 50  0  0];
##     circ2 = [center 50 90  0];
##     circ3 = [center 50 90 90];
##     figure; hold on;
##     drawCircle3d([circ1 ; circ2 ; circ3]);
##     axis equal;
## @end example
#
## @seealso{circles3d, drawCircleArc3d, drawEllipse3d, drawSphere}
## @end deftypefn

function varargout = drawCircle3d(varargin)
  #   Possible calls for the function, with number of arguments :
  #   drawCircle3d([XC YC ZC R THETA PHI])            1
  #   drawCircle3d([XC YC ZC R THETA PHI PSI])        1
  #   drawCircle3d([XC YC ZC R], [THETA PHI])         2
  #   drawCircle3d([XC YC ZC R], [THETA PHI PSI])     2
  #   drawCircle3d([XC YC ZC R], THETA, PHI)          3
  #   drawCircle3d([XC YC ZC], R, THETA, PHI)         4
  #   drawCircle3d([XC YC ZC R], THETA, PHI, PSI)     4
  #   drawCircle3d([XC YC ZC], R, THETA, PHI, PSI)    5
  #   drawCircle3d(XC, YC, ZC, R, THETA, PHI)         6
  #   drawCircle3d(XC, YC, ZC, R, THETA, PHI, PSI)    7


  # extract drawing options
  ind = find(cellfun(@ischar, varargin), 1, 'first');

  options = {};
  if ~isempty(ind)
      options = varargin(ind:end);
      varargin(ind:end) = [];
  end

  # Extract circle data
  if length(varargin) == 1
      # get center and radius
      circle = varargin{1};
      xc = circle(:,1);
      yc = circle(:,2);
      zc = circle(:,3);
      r  = circle(:,4);

      # get colatitude of normal
      if size(circle, 2) >= 5
          theta = circle(:,5);
      else
          theta = zeros(size(circle, 1), 1);
      end

      # get azimut of normal
      if size(circle, 2)>=6
          phi     = circle(:,6);
      else
          phi = zeros(size(circle, 1), 1);
      end

      # get roll
      if size(circle, 2)==7
          psi = circle(:,7);
      else
          psi = zeros(size(circle, 1), 1);
      end

  elseif length(varargin) == 2
      # get center and radius
      circle = varargin{1};
      xc = circle(:,1);
      yc = circle(:,2);
      zc = circle(:,3);
      r  = circle(:,4);

      # get angle of normal
      angle   = varargin{2};
      theta   = angle(:,1);
      phi     = angle(:,2);

      # get roll
      if size(angle, 2)==3
          psi = angle(:,3);
      else
          psi = zeros(size(angle, 1), 1);
      end

  elseif length(varargin) == 3
      # get center and radius
      circle = varargin{1};
      xc = circle(:,1);
      yc = circle(:,2);
      zc = circle(:,3);
      r  = circle(:,4);

      # get angle of normal and roll
      theta   = varargin{2};
      phi     = varargin{3};
      psi     = zeros(size(phi, 1), 1);

  elseif length(varargin) == 4
      # get center and radius
      circle = varargin{1};
      xc = circle(:,1);
      yc = circle(:,2);
      zc = circle(:,3);

      if size(circle, 2)==4
          r   = circle(:,4);
          theta   = varargin{2};
          phi     = varargin{3};
          psi     = varargin{4};
      else
          r   = varargin{2};
          theta   = varargin{3};
          phi     = varargin{4};
          psi     = zeros(size(phi, 1), 1);
      end

  elseif length(varargin) == 5
      # get center and radius
      circle = varargin{1};
      xc = circle(:,1);
      yc = circle(:,2);
      zc = circle(:,3);
      r  = varargin{2};
      theta   = varargin{3};
      phi     = varargin{4};
      psi     = varargin{5};

  elseif length(varargin) == 6
      xc      = varargin{1};
      yc      = varargin{2};
      zc      = varargin{3};
      r       = varargin{4};
      theta   = varargin{5};
      phi     = varargin{6};
      psi     = zeros(size(phi, 1), 1);

  elseif length(varargin) == 7
      xc      = varargin{1};
      yc      = varargin{2};
      zc      = varargin{3};
      r       = varargin{4};
      theta   = varargin{5};
      phi     = varargin{6};
      psi     = varargin{7};

  else
      error('drawCircle3d: please specify center and radius');
  end

  # circle parametrisation (by using N=60, some vertices are located at
  # special angles like 45�, 30�...)
  Nt  = 60;
  t   = linspace(0, 2*pi, Nt+1);

  nCircles = length(xc);
  h = zeros(nCircles, 1);

  for i = 1:nCircles
      # compute position of circle points
      x       = r(i) * cos(t)';
      y       = r(i) * sin(t)';
      z       = zeros(length(t), 1);
      circle0 = [x y z];

      # compute transformation from local basis to world basis
      trans   = localToGlobal3d(xc(i), yc(i), zc(i), theta(i), phi(i), psi(i));

      # compute points of transformed circle
      circle  = transformPoint3d(circle0, trans);

      # draw the curve of circle points
      h(i) = drawPolyline3d(circle, options{:});
  end


  if nargout > 0
      varargout = {h};
  end

endfunction

%!demo
%!     # display 3 mutually orthogonal 3D circles
%!     figure; hold on;
%!     drawCircle3d([10 20 30 50  0  0], 'LineWidth', 2, 'Color', 'b');
%!     drawCircle3d([10 20 30 50 90  0], 'LineWidth', 2, 'Color', 'r');
%!     drawCircle3d([10 20 30 50 90 90], 'LineWidth', 2, 'Color', 'g');
%!     axis square equal;
%!     axis([-50 100 -50 100 -50 100]);
%!     view([-10 20])
%!
%!     # Draw several circles at once
%!     center = [10 20 30];
%!     circ1 = [center 50  0  0];
%!     circ2 = [center 50 90  0];
%!     circ3 = [center 50 90 90];
%!     figure; hold on;
%!     drawCircle3d([circ1 ; circ2 ; circ3]);
%!     axis square equal;
