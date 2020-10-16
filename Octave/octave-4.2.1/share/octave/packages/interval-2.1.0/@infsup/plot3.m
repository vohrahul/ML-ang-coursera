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
## @defmethod {@@infsup} plot3 (@var{X}, @var{Y}, @var{Z})
## @defmethodx {@@infsup} plot3 (@var{X}, @var{Y}, @var{Z}, @var{COLOR})
## @defmethodx {@@infsup} plot3 (@var{X}, @var{Y}, @var{Z}, @var{COLOR}, @var{EDGECOLOR})
## 
## Create a 3D-plot of intervals.
##
## If either of @var{X}, @var{Y} or @var{Z} is an empty interval, nothing is
## plotted.  If all are singleton intervals, a single point is plotted.  If
## two intervals are a singleton interval, a line is plotted.  If one interval
## is a singleton interval, a rectangle is plotted.  If neither of @var{X},
## @var{Y} and @var{Z} is a singleton interval, a cuboid is plotted.
##
## When interval matrices of equal size are given, each triple of elements is
## printed separately.
##
## No connection of the interval areas is plotted, because that kind of
## interpolation would be wrong in general (in the sense that the actual values
## are enclosed by the plot).
##
## If no @var{COLOR} is given, the current @command{colormap} is used.  Use
## @var{COLOR} = @option{none} to disable plotting of filled rectangles.  If an
## optional parameter @var{EDGECOLOR} is given, rectangles and cuboids will
## have visible edges in a distinct color.
##
## @end defmethod

## Author: Oliver Heimlich
## Keywords: interval
## Created: 2015-05-17

function plot3 (x, y, z, color, edgecolor)

if (nargin < 3 || nargin > 5)
    print_usage ();
    return
endif

warning ("off", "interval:ImplicitPromote", "local");
if (not (isa (x, "infsupdec")))
    x = infsupdec (x);
endif
if (not (isa (y, "infsupdec")))
    y = infsupdec (y);
endif
if (not (isa (z, "infsupdec")))
    z = infsupdec (z);
endif

if (nargin < 4 || isempty (color))
    color = 'interp';
    if (nargin < 5)
        # will only be used for lines and dots
        edgecolor = colormap ()(1, :);
    endif
elseif (nargin < 5)
    # will only be used for lines and dots
    edgecolor = color;
endif

oldhold = ishold ();
if (not (oldhold))
    clf
    hold on
endif

pointsize = 3;
edgewidth = 2;

unwind_protect

    empty = isempty (x) | isempty (y) | isempty (z);
    number_of_singletons = issingleton (x) + issingleton (y) + issingleton (z);
    points = number_of_singletons == 3;
    lines = number_of_singletons == 2 & not (empty);
    boxes = number_of_singletons <= 1 & not (empty);
    
    if (any (points(:)))
        scatter3 (x.inf(points), y.inf(points), z.inf(points), ...
                  pointsize, ...
                  edgecolor, ...
                  'filled');
    endif
    
    if (any (lines(:)))
        x_line = [vec(x.inf(lines)), vec(x.sup(lines))]';
        y_line = [vec(y.inf(lines)), vec(y.sup(lines))]';
        z_line = [vec(z.inf(lines)), vec(z.sup(lines))]';
        line (x_line, y_line, z_line, ...
              'linewidth', edgewidth, ...
              'color', edgecolor);
    endif
    
    ##                 + z
    ##                 | 
    ##
    ##                 B--------D
    ##                /|       /|
    ##               / |      / |   
    ##              /  A-----/--C  -+
    ##             F--------H  /    y
    ##             | /      | /
    ##             |/       |/
    ##             E--------G
    ##
    ##           /
    ##          + x
    
    ## The variables A through H help indexing the relevant rows in vertices.
    [A, B, C, D, E, F, G, H] = num2cell ((0 : 7) * sum (sum (boxes))) {:};
    vertices = [vec(x.inf(boxes)), vec(y.inf(boxes)), vec(z.inf(boxes)); ...
                vec(x.inf(boxes)), vec(y.inf(boxes)), vec(z.sup(boxes)); ...
                vec(x.inf(boxes)), vec(y.sup(boxes)), vec(z.inf(boxes)); ...
                vec(x.inf(boxes)), vec(y.sup(boxes)), vec(z.sup(boxes)); ...
                vec(x.sup(boxes)), vec(y.inf(boxes)), vec(z.inf(boxes)); ...
                vec(x.sup(boxes)), vec(y.inf(boxes)), vec(z.sup(boxes)); ...
                vec(x.sup(boxes)), vec(y.sup(boxes)), vec(z.inf(boxes)); ...
                vec(x.sup(boxes)), vec(y.sup(boxes)), vec(z.sup(boxes))];
    
    if (any (boxes(:)))
        ## To support gnuplot as a plotting backend, we have to use
        ## triangular instead of rectangular patches (see bug #45594).
        faces = zeros (0, 3);
        ## x-y rectangle at z.inf
        select = vec (find (x.inf(boxes) < x.sup(boxes) & ...
                            y.inf(boxes) < y.sup(boxes)));
        faces = [faces; ...
                 A+select, C+select, G+select; ...
                 G+select, E+select, A+select];
        ## x-z rectangle at y.inf
        select = vec (find (x.inf(boxes) < x.sup(boxes) & ...
                            z.inf(boxes) < z.sup(boxes)));
        faces = [faces; ...
                 A+select, E+select, F+select; ...
                 F+select, B+select, A+select];
        ## y-z rectangle at x.inf
        select = vec (find (y.inf(boxes) < y.sup(boxes) & ...
                            z.inf(boxes) < z.sup(boxes)));
        faces = [faces; ...
                 A+select, B+select, D+select; ...
                 D+select, C+select, A+select];
    
        ## The cuboids have 6 sides instead of only one
        select = vec (find (x.inf(boxes) < x.sup(boxes) & ...
                            y.inf(boxes) < y.sup(boxes) & ...
                            z.inf(boxes) < z.sup(boxes)));
        faces = [faces; ...
                 ## x-y rectangle at z.sup
                 B+select, F+select, H+select; ...
                 H+select, D+select, B+select; ...
                 ## x-z rectangle at y.sup
                 C+select, D+select, H+select;
                 H+select, G+select, C+select; ...
                 ## y-z rectangle at x.inf
                 E+select, G+select, H+select; ...
                 H+select, F+select, E+select];
    
        patch ('Vertices', vertices, ...
               'Faces', faces, ...
               'EdgeColor', 'none', ...
               'FaceColor', color, ...
               'FaceVertexCData', vertices (:, 3));
        
        ## Draw edges for the rectangles.
        ##
        ##         B    B--------D   D
        ##        /|    |        |  /|
        ##       / |    |        | / |
        ##      /  A    A--------C/  C       or       A--------C
        ##     F  / F--------H   H  /                /        /
        ##     | /  |        |   | /                /        /
        ##     |/   |        |   |/                /        /
        ##     E    E--------G   G                E--------G
        ##
        ## Note: The edges A-B, C-D, E-F, and G-H may be drawn twice.
        ## However, the benefit is that this approach produces only closed 
        ## routes between the points, which is beneficial since it prevents
        ## graphics artifacts from line endings. Line endings might be rendered
        ## differently and we want to prevent that.
        if (nargin >= 5)
            faces = zeros (0, 4);
            ## x-y rectangle at z.inf
            select = vec (find (x.inf(boxes) < x.sup(boxes) & ...
                                y.inf(boxes) < y.sup(boxes) & ...
                                z.inf(boxes) == z.sup(boxes)));
            faces = [faces; ...
                     A+select, C+select, G+select, E+select];
            ## x-z rectangle at y.inf
            select = vec (find (x.inf(boxes) < x.sup(boxes) & ...
                                z.inf(boxes) < z.sup(boxes)));
            faces = [faces; ...
                     A+select, E+select, F+select, B+select];
            ## y-z rectangle at x.inf
            select = vec (find (y.inf(boxes) < y.sup(boxes) & ...
                                z.inf(boxes) < z.sup(boxes)));
            faces = [faces; ...
                     A+select, B+select, D+select, C+select];
            ## The cuboids have 6 sides instead of only one.
            ## It suffices to draw edges for 2 more sides (4 sides in total).
            select = vec (find (x.inf(boxes) < x.sup(boxes) & ...
                                y.inf(boxes) < y.sup(boxes) & ...
                                z.inf(boxes) < z.sup(boxes)));
            faces = [faces; ...
                 ## x-z rectangle at y.sup
                 C+select, D+select, H+select, G+select; ...
                 ## y-z rectangle at x.inf
                 E+select, G+select, H+select, F+select];
            
            patch ('Vertices', vertices, ...
                   'Faces', faces, ...
                   'EdgeColor', edgecolor, ...
                   'LineWidth', edgewidth, ...
                   'FaceColor', 'none');
        endif
    endif

unwind_protect_cleanup
    ## Reset hold state and set the viewpoint for 3-D graphs (the latter would
    ## not happen automatically since above functions operate on 2-D objects).
    if (not (oldhold))
        hold off
        view (3)
    endif
end_unwind_protect

endfunction

%!# this test is rather pointless
%!test
%!  clf
%!  plot3 (empty (), empty (), empty ());
%!  close

%!demo
%!  clf
%!  colormap hot
%!  x = y = z = (1 : 3) + infsup ("[0, 1]");
%!  plot3 (x, y, z);
%!  grid on

%!demo
%!  clf
%!  colormap jet
%!  z = 1 : 8;
%!  x = y = infsup ("[-1, 1]") ./ z;
%!  plot3 (x, y, z);
%!  grid on

%!demo
%!  clf
%!  [x, y] = meshgrid (mince (infsup ("[-5, 5]"), 20), ...
%!                     mince (infsup ("[0.1, 5]"), 10));
%!  z = log (hypot (x, y));
%!  blue = [38 139 210]/255; base2 = [238 232 213]/255;
%!  plot3 (x, y, z, base2, blue);
%!  view (330, 12)

%!demo
%!  clf
%!  [x, y] = meshgrid (midrad (-10 : 0.5 : 10, .25));
%!  z = sin (hypot (x, y)) .* hypot (x, y);
%!  plot3 (mid (x), mid (y), z);
%!  grid on
