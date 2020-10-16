## Copyright (C) 2004 Josep Mones i Teixidor <jmones@puntbarra.com>
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
## @deftypefn  {Function File} {} bwmorph (@var{bw}, @var{operation})
## @deftypefnx {Function File} {} bwmorph (@var{bw}, @var{operation}, @var{n})
## Perform morphological operation on binary image.
##
## For a binary image @var{bw}, performs the morphological @var{operation},
## @var{n} times. All possible values of @var{operation} are listed on the
## table below. By default, @var{n} is 1.  If @var{n} is @code{Inf}, the
## operation is continually performed until it no longer changes the image.
##
## In some operations, @var{bw} can be a binary matrix with any number of
## dimensions (see details on the table of operations).
##
## Note that the output will always be of class logical, independently of
## the class of @var{bw}.
##
## @table @samp
## @item bothat
## Performs a bottom hat operation, a closing operation (which is a
## dilation followed by an erosion) and finally subtracts the original
## image (see @code{imbothat}).  @var{bw} can have any number of
## dimensions, and @code{strel ("hypercube", ndims (@var{bw}), 3)} is
## used as structuring element.
##
## @item bridge
## Performs a bridge operation. Sets a pixel to 1 if it has two nonzero
## neighbours which are not connected, so it "bridges" them. There are
## 119 3-by-3 patterns which trigger setting a pixel to 1.
##
## @item clean
## Performs an isolated pixel remove operation.  Sets a pixel to 0 if all
## of its eight-connected neighbours are 0.  @var{bw} can have any number
## of dimensions in which case connectivity is @code{(3^ndims(@var{bw})) -1},
## i.e., all of the elements around it.
##
## @item close
## Performs closing operation, which is a dilation followed by erosion
## (see @code{imclose}).  @var{bw} can have any number of dimensions,
## and @code{strel ("hypercube", ndims (@var{bw}), 3)} is used as
## structuring element.
##
## @item diag
## Performs a diagonal fill operation. Sets a pixel to 1 if that
## eliminates eight-connectivity of the background.
##
## @item dilate
## Performs a dilation operation (see @code{imdilate}).  @var{bw} can have
## any number of dimensions, and
## @code{strel ("hypercube", ndims (@var{bw}), 3)} is used as
## structuring element.
##
## @item erode
## Performs an erosion operation (see @code{imerode}).  @var{bw} can have
## any number of dimensions, and
## @code{strel ("hypercube", ndims (@var{bw}), 3)} is used as
## structuring element.
##
## @item fill
## Performs a interior fill operation. Sets a pixel to 1 if all
## four-connected pixels are 1.  @var{bw} can have any number
## of dimensions in which case connectivity is @code{(2*ndims(@var{bw}))}.
##
## @item hbreak
## Performs a H-break operation. Breaks (sets to 0) pixels that are
## H-connected.
##
## @item majority
## Performs a majority black operation.  Sets a pixel to 1 if the majority
## of the pixels (5 or more for a two dimensional image) in a 3-by-3 window
## is 1. If not set to 0.  @var{bw} can have any number of dimensions in
## which case the window has dimensions @code{repmat (3, 1, ndims (@var{bw}))}.
##
## @item open
## Performs an opening operation, which is an erosion followed by a
## dilation (see @code{imopen}).  @var{bw} can have any number of
## dimensions, and @code{strel ("hypercube", ndims (@var{bw}), 3)}
## is used as structuring element.
##
## @item remove
## Performs a iterior pixel remove operation.  Sets a pixel to 0 if
## all of its four-connected neighbours are 1.  @var{bw} can have any number
## of dimensions in which case connectivity is @code{(2*ndims(@var{bw}))}.
##
## @item shrink
## Performs a shrink operation. Sets pixels to 0 such that an object
## without holes erodes to a single pixel (set to 1) at or near its
## center of mass. An object with holes erodes to a connected ring lying
## midway between each hole and its nearest outer boundary. It preserves
## Euler number.
##
## @item skel
## Performs a skeletonization operation. It calculates a "median axis
## skeleton" so that points of this skeleton are at the same distance of
## its nearby borders. It preserver Euler number. Please read
## compatibility notes for more info.
##
## It uses the same algorithm as skel-pratt but this could change for
## compatibility in the future.
##
## @item skel-lantuejoul
## Performs a skeletonization operation as described in Gonzalez & Woods
## "Digital Image Processing" pp 538-540. The text references Lantuejoul
## as author of this algorithm.
##
## It has the beauty of being a clean and simple approach, but skeletons
## are thicker than they need to and, in addition, not guaranteed to be
## connected.
##
## This algorithm is iterative. It will be applied the minimum value of
## @var{n} times or number of iterations specified in algorithm
## description. It's most useful to run this algorithm with @code{n=Inf}.
##
## @var{bw} can have any number of dimensions.
##
## @item skel-pratt
## Performs a skeletonization operation as described by William K. Pratt
## in "Digital Image Processing".
##
## @item spur
## Performs a remove spur operation. It sets pixel to 0 if it has only
## one eight-connected pixel in its neighbourhood.
##
## @item thicken
## Performs a thickening operation. This operation "thickens" objects
## avoiding their fusion. Its implemented as a thinning of the
## background. That is, thinning on negated image. Finally a diagonal
## fill operation is performed to avoid "eight-connecting" objects.
##
## @item thin
## Performs a thinning operation. When n=Inf, thinning sets pixels to 0
## such that an object without holes is converted to a stroke
## equidistant from its nearest outer boundaries. If the object has
## holes it creates a ring midway between each hole and its near outer
## boundary. This differ from shrink in that shrink converts objects
## without holes to a single pixels and thin to a stroke. It preserves
## Euler number.
##
## @item tophat
## Performs a top hat operation, a opening operation (which is an
## erosion followed by a dilation) and finally subtracts the original
## image (see @code{imtophat}).  @var{bw} can have any number of
## dimensions, and @code{strel ("hypercube", ndims (@var{bw}), 3)}
## is used as structuring element.
## @end table
##
## Some useful concepts to understand operators:
##
## Operations are defined on 3-by-3 blocks of data, where the pixel in
## the center of the block. Those pixels are numerated as follows:
##
## @multitable @columnfractions 0.05 0.05 0.05
## @item X3 @tab X2 @tab X1
## @item X4 @tab  X @tab X0
## @item X5 @tab X6 @tab X7
## @end multitable
##
## @strong{Neighbourhood definitions used in operation descriptions:}
## @table @code
## @item 'four-connected'
## It refers to pixels which are connected horizontally or vertically to
## X: X1, X3, X5 and X7.
## @item 'eight-connected'
## It refers to all pixels which are connected to X: X0, X1, X2, X3, X4,
## X5, X6 and X7.
## @end table
## 
## @strong{Compatibility notes:}
## @table @code
## @item 'skel'
## Algorithm used here is described in Pratt's book. When applying it to
## the "circles" image in MATLAB documentation, results are not the
## same. Perhaps MATLAB uses Blum's algorithm (for further info please
## read comments in code).
## @item 'skel-pratt'
## This option is not available in MATLAB.
## @item 'skel-lantuejoul'
## This option is not available in MATLAB.
## @item 'thicken'
## This implementation also thickens image borders. This can easily be
## avoided i necessary. MATLAB documentation doesn't state how it behaves.
## @end table
##
## References:
## W. K. Pratt, "Digital Image Processing"
## Gonzalez and Woods, "Digital Image Processing"
##
## @seealso{imdilate, imerode, imtophat, imbothat, makelut, applylut}
## @end deftypefn

function bw2 = bwmorph (bw, operation, n = 1)
  if (nargin < 2 || nargin > 3)
    print_usage ();
  elseif (! isimage (bw))
    error ("bwmorph: BW must be a binary image");
  elseif (! ischar (operation))
    error ("bwmorph: OPERATION must be a string");
  elseif (! isnumeric (n) || ! isscalar (n))
    error ("bwmorph: N must be a scalar number");
  endif

  ## For undocumented Matlab compatibility
  if (n < 0)
    n = 1;
  endif

  ## Anything is valid, just convert it to logical
  bw = logical (bw);

  ## Some operations have no effect after being applied the first time.
  ## Those will set this to true and later set N to 1 (only exception is
  ## if N is set to 0 but even then we can't skip since we will display
  ## the image or return it depending on nargout)
  loop_once = false;

  post_morph = []; # post processing command (only if needed)

  switch (tolower (operation))
    case "bothat"
      loop_once = true;
      se = strel ("hypercube", ndims (bw), 3);
      morph = @(x) imbothat (x, se);

#    case "branchpoints"
#      ## not implemented

    case "bridge"
      loop_once = true;
      ## see __bridge_lut_fun__ for rules
      ## lut = makelut ("__bridge_lut_fun__", 3);
      lut = logical ([0;0;0;0;0;0;0;0;0;0;0;0;1;1;0;0;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;
                      0;1;0;0;0;1;0;0;1;1;0;0;1;1;0;0;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;
                      0;0;1;1;1;1;1;1;0;0;0;0;1;1;0;0;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;
                      1;1;1;1;1;1;1;1;1;1;0;0;1;1;0;0;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;
                      0;1;1;1;1;1;1;1;0;0;0;0;1;1;0;0;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;
                      0;1;0;0;0;1;0;0;0;0;0;0;0;0;0;0;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;
                      0;1;1;1;1;1;1;1;0;0;0;0;1;1;0;0;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;
                      0;1;0;0;0;1;0;0;0;0;0;0;0;0;0;0;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;
                      0;1;1;1;0;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;
                      0;1;0;0;0;1;0;0;1;1;0;0;1;1;0;0;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;
                      0;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;
                      1;1;1;1;1;1;1;1;1;1;0;0;1;1;0;0;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;
                      0;1;1;1;1;1;1;1;0;0;0;0;1;1;0;0;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;
                      0;1;0;0;0;1;0;0;0;0;0;0;0;0;0;0;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;
                      0;1;1;1;1;1;1;1;0;0;0;0;1;1;0;0;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;
                      0;1;0;0;0;1;0;0;0;0;0;0;0;0;0;0;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1]);
      morph = @(x) applylut (x, lut);

    case "clean"
      ## Remove elements that are surrounded by false elements. So we
      ## create a hypercube kernel of side length 3 and values 1, and
      ## center value with the connectivity value. After convolution,
      ## only true elements with another one surrounding it, will have
      ## values above the connectivity (remember that the input matrix
      ## is binary).
      loop_once = true;
      kernel       = ones (repmat (3, 1, ndims (bw)));
      connectivity = numel (kernel) -1;
      kernel(ceil (numel (kernel) /2)) = connectivity; # n-dimensional center
      morph = @(x) convn (x, kernel, "same") > connectivity;

    case "close"
      loop_once = true;
      se = strel ("hypercube", ndims (bw), 3);
      morph = @(x) imclose (x, se);

    case "diag"
      ## see __diagonal_fill_lut_fun__ for rules
      ## lut = makelut ("__diagonal_fill_lut_fun__", 3);
      lut = logical ([0;0;0;0;0;0;0;0;0;0;1;0;0;0;1;0;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;
                      0;0;1;1;0;0;0;0;0;0;1;1;0;0;1;0;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;
                      0;0;0;0;0;0;0;0;0;0;1;0;0;0;1;0;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;
                      0;0;1;1;0;0;0;0;0;0;1;1;0;0;1;0;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;
                      0;0;0;0;0;0;0;0;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;
                      1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;
                      0;0;0;0;0;0;0;0;0;0;1;0;0;0;1;0;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;
                      1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;
                      0;0;0;0;0;0;0;0;0;0;1;0;0;0;1;0;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;
                      0;0;1;1;0;0;0;0;0;0;1;1;0;0;1;0;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;
                      0;0;0;0;0;0;0;0;0;0;1;0;0;0;1;0;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;
                      0;0;1;1;0;0;0;0;0;0;1;1;0;0;1;0;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;
                      0;0;0;0;0;0;0;0;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;
                      0;0;1;1;0;0;0;0;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;
                      0;0;0;0;0;0;0;0;0;0;1;0;0;0;1;0;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;
                      0;0;1;1;0;0;0;0;0;0;1;1;0;0;1;0;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1]);
      morph = @(x) applylut (x, lut);

    case "dilate"
      se = strel ("hypercube", ndims (bw), 3);
      morph = @(x) imdilate (x, se);

#    case "endpoints"
#      ## not implemented

    case "erode"
      ## Matlab bwmorph acts different than their imerode. I'm unsure
      ## the cause of the bug but it seems to manifest on the image border
      ## only. It may be they have implemented this routines in both the
      ## im* functions, and in bwmorph. The rest of bwmorph that uses
      ## erosion (open, close, bothat, and tophat a least), suffer the
      ## same problem. We do not replicate the bug and use imerode.
      ## In 2013, Mathworks has confirmed this bug and will try to fix it
      ## for their next releases. So, do NOT fix this for "compatibility".
      se = strel ("hypercube", ndims (bw), 3);
      morph = @(x) imerode (x, se);

    case "fill"
      ## Fill elements that are surrounded by true elements (with
      ## connectivity 4 and its equivalent to N dimensions).
      ## So we create a hypercube kernel with the connected pixels as 1
      ## and the center with the connectivity value. After convolution,
      ## only true elements, or elements surrounded by true elements
      ## will have a values >= connectivity.
      loop_once = true;
      kernel = conndef (ndims (bw), "minimal");
      connectivity = nnz (kernel) -1;
      kernel(ceil (numel (kernel) /2)) = connectivity;
      morph = @(x) convn (x, kernel, "same") >= connectivity;

    case "hbreak"
      loop_once = true;
      ## lut = makelut (inline ("x(2,2)&&!(all(x==[1,1,1;0,1,0;1,1,1])||all(x==[1,0,1;1,1,1;1,0,1]))", "x"), 3);
      ## which is the same as
      lut = repmat ([false(16, 1); true(16, 1)], 16, 1); # identity
      lut([382 472]) = false; # the 2 exceptions
      morph = @(x) applylut (x, lut);

    case "majority"
      ## If the majority of the elements surrounding an element is true,
      ## it changes to true. We do this using convolution, with an
      ## hypercube kernel, any value of the convolution above the half
      ## number of elements becomes tru
      kernel   = ones (repmat (3, 1, ndims (bw)));
      majority = numel (kernel) /2;
      morph    = @(x) convn (x, kernel, "same") >= majority;

    case "open"
      loop_once = true;
      se = strel ("hypercube", ndims (bw), 3);
      morph = @(x) imopen (x, se);

    case "remove"
      ## Remove elements that are surrounded by true elements by 4 connectivity.
      ## We create a 4 connectivity kernel with -1 values, and a center with
      ## the number of -1 values. Only true elements can have positives values,
      ## with a maximum of 4 (or whatever is the connectivity value for that
      ## number of dimensions) from the kernel center, and -1 per each of the
      ## connectivity. If all are true, its value will go down to 0.
      loop_once = true;
      kernel = - conndef (ndims (bw), "minimal");
      kernel(ceil (numel (kernel) /2)) = nnz (kernel) -1;
      morph = @(x) convn (x, kernel, "same") > 0;

    case "shrink"
      ## lut1 = makelut ("__conditional_mark_patterns_lut_fun__", 3, "S");
      lut1 = logical ([0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;1;1;1;1;0;1;1;1;1;0;1;0;0;1;1;
                       0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;1;0;0;1;1;0;1;1;0;0;0;0;0;0;0;1;
                       0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;1;0;0;0;0;0;0;0;1;1;0;1;0;0;0;1;
                       0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;1;
                       0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;1;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;
                       0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;1;0;0;0;0;0;0;0;0;0;0;0;
                       0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;1;0;0;0;0;0;0;0;1;1;0;1;0;0;0;1;
                       0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;1;0;0;0;0;0;0;0;0;0;0;0;
                       0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;1;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;
                       0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;1;0;1;1;1;0;1;1;0;0;0;0;0;0;0;1;
                       0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;
                       0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;1;
                       0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;1;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;
                       0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;1;0;0;0;1;0;1;1;0;0;0;0;0;0;0;0;
                       0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;1;0;0;0;0;0;0;0;1;1;0;1;0;0;0;1;
                       0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;1;0;0;0;1;0;1;1;1;1;0;0;1;1;0;0]);
      ## lut2 = makelut (inline ("!m(2,2)||__unconditional_mark_patterns_lut_fun__(m,'S')", "m"), 3);
      lut2 = logical ([1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;0;0;1;0;1;0;0;0;1;0;0;0;0;0;1;0;
                       1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;0;0;0;1;0;0;0;0;0;0;1;1;0;0;1;0;
                       1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;0;0;0;0;0;1;1;1;0;0;0;0;1;1;0;1;
                       1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;0;1;1;1;1;1;1;1;0;1;1;1;0;1;0;1;
                       1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;0;0;0;0;0;1;0;1;0;0;1;1;1;1;1;1;
                       1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;0;1;1;1;1;1;1;1;1;1;0;0;1;1;0;1;
                       1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;0;0;0;0;1;1;0;1;0;0;1;0;1;1;0;1;
                       1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;0;1;1;1;0;1;0;1;1;1;0;1;0;1;0;1;
                       1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;0;0;1;0;1;0;1;0;1;1;1;1;1;1;1;
                       1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;0;1;1;0;0;1;0;1;0;0;1;0;1;1;1;1;
                       1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;0;1;1;1;1;1;1;1;0;1;1;1;1;1;1;1;
                       1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;0;1;1;1;1;1;1;1;0;1;1;1;1;1;1;1;
                       1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;0;1;0;0;0;1;0;1;0;0;1;0;1;1;1;1;
                       1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;
                       1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;0;1;1;1;1;1;1;1;0;1;1;1;1;1;1;1;
                       1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1]);
      morph = @(x) x & applylut (applylut (x, lut1), lut2);

    case {"skel", "skel-pratt"}
      ## WARNING: Result doesn't look as MATLAB's sample. It has been
      ## WARNING: coded following Pratt's guidelines for what he calls
      ## WARNING: is a "reasonably close approximation". I couldn't find
      ## WARNING: any bug.
      ## WARNING: Perhaps MATLAB uses Blum's algorithm (which Pratt
      ## WARNING: refers to) in: H. Blum, "A Transformation for
      ## WARNING: Extracting New Descriptors of Shape", Symposium Models
      ## WARNING: for Perception of Speech and Visual Form, W.
      ## WARNING: Whaten-Dunn, Ed. MIT Press, Cambridge, MA, 1967.

      ## lut1 = makelut ("__conditional_mark_patterns_lut_fun__", 3, "K");
      lut1 = logical ([0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;1;0;0;1;0;0;0;0;1;
                       0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;1;0;0;0;0;1;0;0;0;0;0;0;0;1;
                       0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;1;0;1;0;0;0;1;
                       0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;1;
                       0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;1;0;0;0;0;0;0;0;
                       0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;1;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;
                       0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;1;0;1;0;0;0;1;
                       0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;1;
                       0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;
                       0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;1;0;1;1;0;0;0;0;0;0;0;1;
                       0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;
                       0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;1;
                       0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;
                       0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;1;0;1;1;0;0;0;0;0;0;0;1;
                       0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;1;0;0;0;0;0;0;0;1;1;0;1;0;0;0;1;
                       0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;1;0;0;0;1;0;1;1;1;1;0;1;1;1;1;0]);

      ## lut2 = makelut (inline ("!m(2,2)||__unconditional_mark_patterns_lut_fun__(m,'K')", "m") ,3);
      lut2 = logical([1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;0;1;1;0;1;0;0;0;1;0;1;1;0;0;0;1;
                      1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;0;1;0;0;0;1;1;0;0;1;1;0;0;1;1;
                      1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;0;0;0;0;1;0;1;0;0;0;1;0;1;0;1;
                      1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;0;1;1;1;0;1;1;1;0;1;1;1;0;1;1;1;
                      1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;0;0;0;0;1;0;1;1;0;1;1;1;1;1;1;
                      1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;0;0;1;1;1;1;1;1;1;1;1;1;1;
                      1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;0;0;0;0;0;1;0;1;1;1;1;1;1;1;1;1;
                      1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;0;1;1;1;0;1;1;1;1;1;1;1;1;1;1;1;
                      1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;0;0;0;0;1;0;1;0;0;1;1;1;1;1;1;
                      1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;0;0;0;0;0;1;1;1;0;0;1;1;1;1;1;1;
                      1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;0;1;1;1;1;1;1;1;0;1;1;1;1;1;1;1;
                      1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;0;1;1;1;1;1;1;1;0;1;1;1;1;1;1;1;
                      1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;0;0;0;0;0;1;0;1;0;0;1;1;1;1;1;1;
                      1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;
                      1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;0;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;
                      1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1]);
      morph = @(x) x & applylut (applylut (x, lut1), lut2);
      post_morph = @(x) bwmorph (x, "bridge");

    case "skel-lantuejoul"
      ## This transform does not fit well in the same loop as the others,
      ## since each iteration requires values from the previous one. Because
      ## of this, we will set n to 0 in the end. However, we must take care
      ## to not touch the input image if n already is zero.
      if (n > 0)
        se = strel ("hypercube", ndims (bw), 3);
        bw_tmp = false (size (bw)); # skeleton result
        i = 1;
        while (i <= n)
          if (! any (bw(:)))
            ## If erosion from the previous result is 0-matrix then we are
            ## over because the top-hat transform below will also be a 0-matrix
            ## and we will be |= to a 0-matrix.
            break
          endif
          ebw     = imerode (bw, se);
          ## the right hand side of |= is the top-hat transform. However,
          ## we are not using imtophat because we will also want the output
          ## of the erosion for the next iteration. This saves us calling
          ## imerode twice for the same thing.
          bw_tmp |= bw & ! imdilate (ebw, se);
          bw      = ebw;
          i++;
        endwhile
        bw = bw_tmp;
        n = 0;  # don't do anything else
      endif

    case "spur"
      ## lut = makelut(inline("xor(x(2,2),(sum((x&[0,1,0;1,0,1;0,1,0])(:))==0)&&(sum((x&[1,0,1;0,0,0;1,0,1])(:))==1)&&x(2,2))","x"),3);
      ## which is the same as
      lut = repmat ([false(16, 1); true(16,1)], 16, 1); # identity
      lut([18, 21, 81, 273]) = false; # 4 qualifying patterns
      morph = @(x) applylut (x, lut);

    case "thicken"
      ## This implementation also "thickens" the border. To avoid this,
      ## a simple solution could be to add a border of 1 to the reversed
      ## image.
      bw = bwmorph (! bw, "thin", n);
      loop_once = true;
      morph = @(x) bwmorph (x, "diag");

    case "thin"
      ## lut1 = makelut ("__conditional_mark_patterns_lut_fun__", 3, "T");
      lut1 = logical ([0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;1;0;0;1;1;0;0;1;1;
                       0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;1;1;0;0;1;1;0;0;0;0;0;0;0;1;
                       0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;1;0;1;0;0;0;1;
                       0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;1;
                       0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;1;0;0;0;0;0;0;0;
                       0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;1;0;0;0;1;0;0;0;0;0;0;0;0;0;0;0;
                       0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;1;1;0;1;0;0;0;1;
                       0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;1;0;0;0;0;0;0;0;0;0;0;0;
                       0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;
                       0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;1;1;1;0;1;1;0;0;0;0;0;0;0;1;
                       0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;
                       0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;1;
                       0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;
                       0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;1;0;0;0;1;0;1;1;0;0;0;0;0;0;0;0;
                       0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;1;0;0;0;0;0;0;0;1;1;0;1;0;0;0;1;
                       0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;1;0;0;0;1;0;1;1;1;1;0;0;1;1;0;0]);
      ## lut2 = makelut (inline ("!m(2,2)||__unconditional_mark_patterns_lut_fun__(m,'T')", "m"), 3);
      lut2 = logical ([1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;0;0;1;1;1;0;1;0;1;1;0;0;0;0;1;0;
                       1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;0;0;0;1;1;0;0;0;0;0;1;1;0;0;1;0;
                       1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;0;0;0;0;0;1;1;1;1;0;0;0;1;1;0;1;
                       1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;0;1;1;1;1;1;1;1;0;1;1;1;0;1;0;1;
                       1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;0;0;0;0;0;1;0;1;0;0;1;1;1;1;1;1;
                       1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;0;1;1;1;1;1;1;1;1;1;0;0;1;1;0;1;
                       1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;0;0;0;1;1;0;1;0;0;1;0;1;1;0;1;
                       1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;0;1;1;1;0;1;0;1;1;1;0;1;0;1;0;1;
                       1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;0;0;1;0;1;0;1;0;1;1;1;1;1;1;1;
                       1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;0;0;1;0;1;0;0;1;0;1;1;1;1;
                       1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;0;1;1;1;1;1;1;1;0;1;1;1;1;1;1;1;
                       1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;0;1;1;1;1;1;1;1;0;1;1;1;1;1;1;1;
                       1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;0;0;0;1;0;1;0;0;1;0;1;1;1;1;
                       1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;
                       1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;0;1;1;1;1;1;1;1;0;1;1;1;1;1;1;1;
                       1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1]);
      morph = @(x) x & applylut (applylut (x, lut1), lut2);

    case "tophat"
      ## top hat filtering has no effect after being performed once
      ## (inherits this behaviour from closing and opening)
      loop_once = true;
      se = strel ("hypercube", ndims (bw), 3);
      morph = @(x) imtophat (x, se);

    otherwise
      error ("bwmorph: unknown OPERATION '%s' requested", operation);
  endswitch

  if (loop_once && n > 1)
    n = 1;
  endif

  bw2_tmp = bw; ## make sure bw2_tmp will exist later, even if n == 0
  i = 1;
  while (i <= n) ## a for loop wouldn't work because n can be Inf
    bw2_tmp = morph (bw);
    if (isequal (bw, bw2_tmp))
      ## if it doesn't change we don't need to process it further
      break
    endif
    bw = bw2_tmp;
    i++;
  endwhile

  ## process post processing commands if needed
  if (! isempty (post_morph) && n > 0)
    bw2_tmp = post_morph (bw2_tmp);
  endif

  if (nargout > 0)
    bw2 = bw2_tmp;
  else
    imshow (bw2_tmp);
  endif

endfunction

%!demo
%! bwmorph (true (11), "shrink", Inf)
%! # Should return 0 matrix with 1 pixel set to 1 at (6,6)

## Test skel-lantuejoul using Gozalez&Woods example (fig 8.39)
%!test
%! slBW = logical ([  0   0   0   0   0   0   0
%!                    0   1   0   0   0   0   0
%!                    0   0   1   1   0   0   0
%!                    0   0   1   1   0   0   0
%!                    0   0   1   1   1   0   0
%!                    0   0   1   1   1   0   0
%!                    0   1   1   1   1   1   0
%!                    0   1   1   1   1   1   0
%!                    0   1   1   1   1   1   0
%!                    0   1   1   1   1   1   0
%!                    0   1   1   1   1   1   0
%!                    0   0   0   0   0   0   0]);
%!
%! rslBW = logical ([ 0   0   0   0   0   0   0
%!                    0   1   0   0   0   0   0
%!                    0   0   1   1   0   0   0
%!                    0   0   1   1   0   0   0
%!                    0   0   0   0   0   0   0
%!                    0   0   0   1   0   0   0
%!                    0   0   0   1   0   0   0
%!                    0   0   0   0   0   0   0
%!                    0   0   0   1   0   0   0
%!                    0   0   0   0   0   0   0
%!                    0   0   0   0   0   0   0
%!                    0   0   0   0   0   0   0]);
%! assert (bwmorph (slBW, "skel-lantuejoul",   1), [rslBW(1:5,:); false(7, 7)]);
%! assert (bwmorph (slBW, "skel-lantuejoul",   2), [rslBW(1:8,:); false(4, 7)]);
%! assert (bwmorph (slBW, "skel-lantuejoul",   3), rslBW);
%! assert (bwmorph (slBW, "skel-lantuejoul", Inf), rslBW);

## Test for bug #39293
%!test
%! bw = [
%!   0   1   1   1   1   1
%!   0   1   1   1   1   1
%!   0   1   1   1   1   1
%!   1   1   1   1   1   1
%!   1   1   1   1   1   1
%!   1   1   1   1   1   1
%!   1   1   1   1   1   0
%!   1   1   1   1   1   0
%!   1   1   1   1   1   0];
%!
%! final = logical ([
%!   0   1   0   0   0   1
%!   0   0   1   0   1   0
%!   0   0   0   1   0   0
%!   0   0   0   1   0   0
%!   0   0   1   1   0   0
%!   0   0   1   0   0   0
%!   0   0   1   0   0   0
%!   0   1   0   1   0   0
%!   1   0   0   0   1   0]);
%! assert (bwmorph (bw, "skel", Inf), final)
%! assert (bwmorph (bw, "skel", 3), final)

%!error bwmorph ("not a matrix", "dilate")

## this makes sense to be an error but for Matlab compatibility, it is not
%!assert (bwmorph (magic (10), "dilate"), imdilate (logical (magic (10)), ones (3)));

%!test
%! in = logical ([1  1  0  0  1  0  1  0  0  0  1  1  1  0  1  1  0  1  0  0
%!                1  1  1  0  1  0  1  1  1  1  0  1  0  1  0  0  0  0  0  0
%!                0  1  1  1  0  1  1  0  0  0  1  1  0  0  1  1  0  0  1  0
%!                0  0  0  0  0  1  1  1  1  0  0  1  1  1  1  1  1  0  0  1
%!                0  1  0  0  1  1  0  1  1  0  0  0  0  0  1  1  0  0  1  0
%!                0  0  1  1  1  1  1  0  0  1  0  1  1  1  0  0  1  0  0  1
%!                0  1  1  1  1  1  1  0  1  1  1  0  0  0  1  0  0  1  0  0
%!                1  0  1  1  1  0  1  1  0  1  0  0  1  1  1  0  0  1  0  0
%!                1  0  1  1  1  0  1  0  0  1  0  0  1  1  0  0  1  1  1  0
%!                1  0  1  1  1  1  0  0  0  1  0  0  0  0  0  0  1  1  0  0
%!                1  1  1  1  1  1  0  1  0  1  0  0  0  0  0  0  1  0  1  1
%!                0  1  0  1  1  0  0  1  1  1  0  0  0  0  0  0  0  1  0  0
%!                0  0  1  1  0  1  1  1  1  0  0  1  0  0  0  0  1  0  1  1
%!                0  0  1  1  0  0  1  1  1  0  0  0  1  1  1  1  0  0  0  0
%!                0  0  1  0  0  0  0  0  0  1  0  0  1  1  1  1  0  0  0  0
%!                0  0  0  0  0  0  1  1  1  0  0  0  1  1  1  1  1  0  0  0
%!                0  1  0  0  0  1  1  0  1  1  0  0  1  1  1  0  1  1  1  1
%!                1  0  0  1  0  1  1  0  1  0  0  0  0  0  0  1  0  1  1  1
%!                0  0  1  1  0  1  1  1  1  0  0  0  0  1  1  0  1  1  1  1
%!                0  1  1  0  0  1  0  0  1  1  0  0  1  0  0  1  0  0  0  1]);
%! se = strel ("arbitrary", ones (3));
%!
%! assert (bwmorph (in, "dilate"), imdilate (in, se));
%! assert (bwmorph (in, "dilate", 3), imdilate (imdilate (imdilate (in, se), se), se));
%! assert (bwmorph (in, "bothat"), imbothat (in, se));
%! assert (bwmorph (in, "tophat"), imtophat (in, se));
%! assert (bwmorph (in, "open"), imopen (in, se));
%! assert (bwmorph (in, "close"), imclose (in, se));

%!assert (bwmorph ([1 0 0; 1 0 1; 0 0 1], "bridge"), logical ([1 1 0; 1 1 1; 0 1 1]));
%!assert (bwmorph ([0 0 0; 1 0 1; 0 0 1], "clean"), logical ([0 0 0; 0 0 1; 0 0 1]));
%!assert (bwmorph ([0 0 0; 0 1 0; 0 0 0], "clean"), false (3));
%!assert (bwmorph ([0 1 0; 1 0 0; 0 0 0], "diag"), logical ([1 1 0; 1 1 0; 0 0 0]));

%!test
%! in  = logical ([0  1  0  1  0
%!                 1  1  1  0  1
%!                 1  0  0  1  0
%!                 1  1  1  0  1
%!                 1  1  1  1  1]);
%! out = logical ([0  1  0  1  0
%!                 1  1  1  1  1
%!                 1  0  0  1  0
%!                 1  1  1  1  1
%!                 1  1  1  1  1]);
%! assert (bwmorph (in, "fill"), out);

%!assert (bwmorph ([1 1 1; 0 1 0; 1 1 1], "hbreak"), logical ([1 1 1; 0 0 0; 1 1 1]));

%!test
%! in  = logical ([0  1  0  0  0
%!                 1  0  0  1  0
%!                 1  0  1  0  0
%!                 1  1  1  1  1
%!                 1  1  1  1  1]);
%!
%! out = logical ([0  1  0  0   0
%!                 1  0  0  1  0
%!                 1  0  1  0  0
%!                 1  1  0  1  1
%!                 1  1  1  1  1]);
%! assert (bwmorph (in, "remove"), out);
%!
%! out = logical ([0  1  0  0  0
%!                 1  0  0  1  0
%!                 1  0  1  0  0
%!                 1  1  0  1  1
%!                 1  1  1  1  1]);
%! assert (bwmorph (in, "remove", Inf), out);
%!
%! ## tests for spur are failing (matlab incompatible)
%! out = logical ([0  1  0  0  0
%!                 1  0  0  0  0
%!                 1  0  1  0  0
%!                 1  1  1  1  1
%!                 1  1  1  1  1]);
%! assert (bwmorph (in, "spur"), out);
%!
%! out = logical ([0  1  0  0  0
%!                 1  0  0  0  0
%!                 1  0  0  0  0
%!                 1  1  1  1  1
%!                 1  1  1  1  1]);
%! assert (bwmorph (in, "spur", Inf), out);

## bug #44396
%!test
%! in = [
%!   0   0   0   1   0
%!   1   1   1   1   0
%!   0   0   1   1   0
%!   0   0   1   1   0
%!   0   0   0   1   0];
%! out = [
%!   0   0   0   0   0
%!   0   1   1   0   0
%!   0   0   0   1   0
%!   0   0   0   0   0
%!   0   0   0   0   0];
%! assert (bwmorph (in, "shrink"), logical (out));

