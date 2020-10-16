## Copyright (C) 2010 Søren Hauberg <soren@hauberg.org>
## Copyright (C) 2012 Jordi Gutiérrez Hermoso <jordigh@octave.org>
## Copyright (C) 2015 Hartmut Gimpel <hg_code@gmx.de>
## Copyright (C) 2015 Carnë Draug <carandraug@octave.org>
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
## @deftypefn  {Function File} {} regionprops (@var{BW})
## @deftypefnx {Function File} {} regionprops (@var{L})
## @deftypefnx {Function File} {} regionprops (@var{CC})
## @deftypefnx {Function File} {} regionprops (@dots{}, @var{properties})
## @deftypefnx {Function File} {} regionprops (@dots{}, @var{I}, @var{properties})
## Compute properties of image regions.
##
## Measures several properties for each region within an image.  Returns
## a struct array, one element per region, whose field names are the
## measured properties.
##
## Individual regions can be defined in three different ways, a binary
## image, a labelled image, or a bwconncomp struct, each providing
## different advantages.
##
## @table @asis
## @item @var{BW}
## A binary image.  Must be of class logical.  Individual regions will be
## the connected component as computed by @code{bwconnmp} using the
## maximal connectivity for the number of dimensions of @var{bw} (see
## @code{conndef} for details).  For alternative connectivities, call
## @code{bwconncomp} directly and use its output instead.
##
## @var{bw} must really be of class logical.  If not, even if it is a
## numeric array of 0's and 1's, it will be treated as a labelled image
## with a single discontinuous region.  For example:
##
## @example
## ## Handled as binary image with 3 regions
## bw = logical ([
##   1 0 1 0 1
##   1 0 1 0 1
## ]);
##
## ## Handled as labelled image with 1 region
## bw = [
##   1 0 1 0 1
##   1 0 1 0 1
## ];
## @end example
##
## @item @var{L}
## A labelled image.  Each region is the collection of all positive
## elements with the same value.  This allows computing properties of
## regions that would otherwise be considered separate or connected.
## For example:
##
## @example
## ## Recognizes 4 regions
## l = [
##   1 2 3 4
##   1 2 3 4
## ];
##
## ## Recognizes 2 (discontinuous) regions
## l = [
##   1 2 1 2
##   1 2 1 2
## ];
## @end example
##
## @item @var{CC}
## A @code{bwconnmp()} structure.  This is a struct with the following
## 4 fields: Connectivity, ImageSize, NumObjects, and PixelIdxList.  See
## @code{bwconncomp} for details.
##
## @end table
##
## The properties to be measured can be defined via a cell array or a
## comma separated list or strings.  Some of the properties are only
## supported if the matching grayscale image @var{I} is also supplied.
## Others are only supported for 2 dimensional images.  See the list
## below for details on each property limitation.  If none is specified,
## it defaults to the @qcode{"basic"} set of properties.
##
## @table @asis
## @item @qcode{"Area"}
## The number of pixels in the region.  Note that this differs from
## @code{bwarea} where each pixel has different weights.
##
## @item @qcode{"BoundingBox"}
## The smalles rectangle that encloses the region.  This is represented
## as a row vector such as
## @code{[x y z @dots{} x_length y_length z_length @dots{}]}.
##
## The first half corresponds to the lower coordinates of each dimension
## while the second half, to the length in that dimension.  For the two
## dimensional case, the first 2 elements correspond to the coordinates
## of the upper left corner of the bounding box, while the two last entries
## are the width and the height of the box.
##
## @item @qcode{"Centroid"}
## The coordinates for the region centre of mass.  This is a row vector
## with one element per dimension, such as @code{[x y z @dots{}]}.
##
## @item @qcode{"Eccentricity"}
## The eccentricity of the ellipse that has the same normalized
## second central moments as the region (value between 0 and 1).
##
## @item @qcode{"EquivDiameter"}
## The diameter of a circle with the same area as the object.
##
## @item @qcode{"EulerNumber"}
## The Euler number of the region using connectivity 8.  Only supported
## for 2D images.  See @code{bweuler} for details.
##
## @item @qcode{"Extent"}
## The area of the object divided by the area of the bounding box.
##
## @item @qcode{"Extrema"}
## Returns an 8-by-2 matrix with the extrema points of the object.
## The first column holds the returned x- and the second column the y-values.
## The order of the 8 points is: top-left, top-right, right-top, right-bottom,
## bottom-right, bottom-left, left-bottom, left-top.
##
## @item @qcode{"FilledArea"}
## The area of the object including possible holes.
##
## @item @qcode{"FilledImage"}
## A binary image with the same size as the object's bounding box that contains
## the object with all holes removed.
##
## @item @qcode{"Image"}
## An image with the same size as the bounding box that contains the original
## pixels.
##
## @item @qcode{"MajorAxisLength"}
## The length of the major axis of the ellipse that has the same
## normalized second central moments as the object.
##
## @item @qcode{"MaxIntensity"}
## The maximum intensity value inside each region.
## Requires a grayscale image @var{I}.
##
## @item @qcode{"MeanIntensity"}
## The mean intensity value inside each region.
## Requires a grayscale image @var{I}.
##
## @item @qcode{"MinIntensity"}
## The minimum intensity value inside each region.
## Requires a grayscale image @var{I}.
##
## @item @qcode{"MinorAxisLength"}
## The length of the minor axis of the ellipse that has the same
## normalized second central moments as the object.
##
## @item @qcode{"Orientation"}
## The angle between the x-axis and the major axis of the ellipse that
## has the same normalized second central moments as the object
## (value in degrees between -90 and 90).
##
## @item @qcode{"Perimeter"}
## The length of the boundary of the object.
##
## @item @qcode{"PixelIdxList"}
## The linear indices for the elements of each region in a column vector.
##
## @item @qcode{"PixelList"}
## The subscript indices for the elements of each region.  This is a p-by-Q
## matrix where p is the number of elements and Q is the number of
## dimensions.  Each row is of the form @code{[x y z @dots{}]}.
##
## @item @qcode{"PixelValues"}
## The actual pixel values inside each region in a column vector.
## Requires a grayscale image @var{I}.
##
## @item @qcode{"SubarrayIdx"}
## A cell array with subscript indices for the bounding box.  This can
## be used as @code{@var{I}(@var{props}(@var{p}).SubarrayIdx@{:@})}, where
## @var{p} is one of the regions, to extract the image in its bounding box.
##
## @item @qcode{"WeightedCentroid"}
## The coordinates for the region centre of mass when using the intensity
## of each element as weight.  This is a row vector with one element per
## dimension, such as @code{[x y z @dots{}]}.
## Requires a grayscale image @var{I}.
##
## @end table
##
## In addition, the strings @qcode{"basic"} and @qcode{"all"} can be
## used to select a subset of the properties:
##
## @table @asis
## @item @qcode{"basic"} (default)
## Compute @qcode{"Area"}, @qcode{"Centroid"}, and @qcode{"BoundingBox"}.
##
## @item @qcode{"all"}
## Computes all possible properties for the image, i.e., it will not
## compute properties that require grayscale unless the grayscale image
## is available, and it will not compute properties that are limited to
## 2 dimensions, unless the image is 2 dimensions.
##
## @end table
##
## @seealso{bwlabel, bwperim, bweuler}
## @end deftypefn

function props = regionprops (bw, varargin)
  if (nargin < 1)
    print_usage ();
  endif

  if (isstruct (bw))
    if (! isempty (setxor (fieldnames (bw), {"Connectivity", "ImageSize", ...
                                             "NumObjects", "PixelIdxList"})))
      error ("regionprops: CC is an invalid bwconnmp() struct");
    endif
    cc = bw;
  elseif (islogical (bw))
    cc = bwconncomp (bw);
  elseif (isnumeric (bw))
    if (isinteger (bw))
      if (intmin (class (bw)) < 0 && any (bw(:) < 0))
        error ("regionprops: L must be non-negative integers only");
      endif
    else
      if (any (bw(:) < 0) || any (fix (bw(:)) != bw(:)))
        error ("regionprops: L must be non-negative integers only");
      endif
    endif
    n_obj = max (bw(:));
    if (! n_obj)
      ## workaround for https://savannah.gnu.org/bugs/index.php?47287
      cc = struct ("ImageSize", size (bw), "NumObjects", n_obj,
                   "PixelIdxList", {cell(1, 0)});
    else
      l_idx = find (bw);
      cc = struct ("ImageSize", size (bw), "NumObjects", n_obj,
                   "PixelIdxList", {accumarray(bw(l_idx)(:), l_idx, [1 n_obj],
                                               @(x) {x})});
    endif
  else
    error ("regionprops: no valid BW, CC, or L input");
  endif
  is_2d = numel (cc.ImageSize) == 2;

  next_idx = 1;
  has_gray = false;
  if (numel (varargin) && isnumeric (varargin{1}))
    next_idx++;
    has_gray = true;
    img = varargin{1};
    sz  = size (img);
    if (! size_equal (sz, cc.ImageSize) || any (sz != cc.ImageSize))
      error ("regionprops: BW and I sizes must be equal");
    endif
  endif

  if (numel (varargin) >= next_idx)
    if (iscell (varargin{next_idx}))
      properties = varargin{next_idx++};
      if (numel (varargin) >= next_idx)
        print_usage ();
      endif
    else
      properties = varargin(next_idx++:end);
    endif
    if (! iscellstr (properties))
      error ("regionprops: PROPERTIES must be a string or a cell array of strings");
    endif
    properties = tolower (strrep (properties, "_", ""));
  else
    properties = {"basic"};
  endif
  properties = select_properties (properties, is_2d, has_gray);

  ## Some properties require the value of others.  In addition, most
  ## properties have common code.  Ideally, to avoid repeating
  ## computations, we would make use not only of the already measured
  ## properties. but also of their intermediary steps.  We handle this
  ## with a stack of properties that need to be measured and we push
  ## dependencies into it as we find them.  A scalar struct keeps all
  ## values whose fields are the properties and intermediary steps names.
  ##
  ## Note that we do not want to fill the return value just yet.  The
  ## reason is that props is a struct array.  Since the computation of
  ## the properties is vectorized, it would require a constant back and
  ## forth conversion between cell arrays and numeric arrays.  So we
  ## keep everything in a numeric array and everything is much faster.
  ## At the end, we put everything in place in a struct array.

  dependencies = struct (
    "area",             {{}},
    "accum_subs",       {{"area"}}, # private
    "accum_subs_nd",    {{"accum_subs"}}, # private
    "boundingbox",      {{"pixellist", "accum_subs_nd"}},
    "centroid",         {{"accum_subs_nd", "pixellist", "area"}},
    "filledarea",       {{"filledimage"}},
    "filledimage",      {{"image"}},
    "image",            {{"subarrayidx", "accum_subs", "pixelidxlist"}},
    "pixelidxlist",     {{}},
    "pixellist",        {{"pixelidxlist"}},
    "subarrayidx",      {{"boundingbox"}},
    "convexarea",       {{}},
    "convexhull",       {{}},
    "conveximage",      {{}},
    "eccentricity",     {{"minoraxislength", "majoraxislength"}},
    "equivdiameter",    {{"area"}},
    "eulernumber",      {{"image"}},
    "extent",           {{"area", "boundingbox"}},
    "extrema",          {{"area", "accum_subs_nd", "pixellist"}},
    "local_ellipse",    {{"area", "pixellist"}}, # private
    "majoraxislength",  {{"local_ellipse"}},
    "minoraxislength",  {{"local_ellipse"}},
    "orientation",      {{"local_ellipse"}},
    "perimeter",        {{}},
    "solidity",         {{}},
    "maxintensity",     {{"accum_subs", "pixelidxlist"}},
    "meanintensity",    {{"total_intensity", "area"}},
    "minintensity",     {{"accum_subs", "pixelidxlist"}},
    "pixelvalues",      {{"pixelidxlist"}},
    "total_intensity",  {{"accum_subs", "pixelidxlist"}},
    "weightedcentroid", {{"accum_subs_nd", "total_intensity", "pixellist", "pixelidxlist", "area"}}
  );

  to_measure = properties;
  values = struct ();

  ## There's too many indirectly dependent on "area", and even if not
  ## required, it will be required later to create the struct array.
  values.area = rp_area (cc);

  while (! isempty (to_measure))
    pname = to_measure{end};

    ## Already computed. Pop it and move on.
    if (isfield (values, pname))
      to_measure(end) = [];
      continue
    endif

    ## There's missing dependencies. Push them and start again.
    deps = dependencies.(pname);
    missing = deps(! isfield (values, deps));
    if (! isempty (missing))
      to_measure(end+1:end+numel(missing)) = missing;
      continue
    endif

    to_measure(end) = [];
    switch (pname)
      case "area"
        values.area = rp_area (cc);
      case "accum_subs"
        values.accum_subs = rp_accum_subs (cc, values.area);
      case "accum_subs_nd"
        values.accum_subs_nd = rp_accum_subs_nd (cc, values.accum_subs);
      case "boundingbox"
        values.boundingbox = rp_bounding_box (cc, values.pixellist,
                                              values.accum_subs_nd);
      case "centroid"
        values.centroid = rp_centroid (cc, values.pixellist, values.area,
                                       values.accum_subs_nd);
      case "filledarea"
        values.filledarea = rp_filled_area (values.filledimage);
      case "filledimage"
        values.filledimage = rp_filled_image (values.image);
      case "image"
        values.image = rp_image (cc, bw, values.pixelidxlist,
                                 values.accum_subs, values.subarrayidx);
      case "pixelidxlist"
        values.pixelidxlist = rp_pixel_idx_list (cc);
      case "pixellist"
        values.pixellist = rp_pixel_list (cc, values.pixelidxlist);
      case "subarrayidx"
        values.subarrayidx = rp_subarray_idx (cc, values.boundingbox);
      case "convexarea"
        error ("regionprops: property \"ConvexArea\" not yet implemented");
      case "convexhull"
        error ("regionprops: property \"ConvexHull\" not yet implemented");
      case "conveximage"
        error ("regionprops: property \"ConvexImage\" not yet implemented");
      case "eccentricity"
        values.eccentricity = rep_eccentricity (values.minoraxislength,
                                                values.majoraxislength);
      case "equivdiameter"
        values.equivdiameter = rp_equivdiameter (values.area);
      case "eulernumber"
        values.eulernumber = rp_euler_number (values.image);
      case "extent"
        values.extent = rp_extent (values.area, values.boundingbox);
      case "extrema"
        values.extrema = rp_extrema (cc, values.pixellist, values.area,
                                     values.accum_subs_nd);
      case "local_ellipse"
        values.local_ellipse = true;
        [values.minoraxislength, values.majoraxislength, ...
         values.orientation] = rp_local_ellipse (values.area, values.pixellist);
      case {"majoraxislength", "minoraxislength", "orientation"}
        ## Do nothing.  These are "virtual" targets which are computed
        ## in local_ellipse.
      case "perimeter"
        values.perimeter = rp_perimeter (cc, bw);
      case "solidity"
        error ("regionprops: property \"Solidity\" not yet implemented");
      case "maxintensity"
        values.maxintensity = rp_max_intensity (cc, img,
                                                values.pixelidxlist,
                                                values.accum_subs);
      case "meanintensity"
        values.meanintensity = rp_mean_intensity (cc, values.total_intensity,
                                                  values.area);
      case "minintensity"
        values.minintensity = rp_min_intensity (cc, img,
                                                values.pixelidxlist,
                                                values.accum_subs);
      case "pixelvalues"
        values.pixelvalues = rp_pixel_values (cc, img, values.pixelidxlist);
      case "total_intensity"
        values.total_intensity = rp_total_intensity (cc, img,
                                                     values.pixelidxlist,
                                                     values.accum_subs);
      case "weightedcentroid"
        values.weightedcentroid = rp_weighted_centroid (cc, img,
                                                        values.pixellist,
                                                        values.pixelidxlist,
                                                        values.total_intensity,
                                                        values.accum_subs_nd,
                                                        values.area);
      otherwise
        error ("regionprops: unknown property `%s'", pname);
    endswitch
  endwhile


  ## After we have made all the measurements, we need to pack everything
  ## into struct arrays.

  Area = values.area;
  props = repmat (struct (), cc.NumObjects, 1);
  for ip = 1:numel (properties)
    switch (properties{ip})
      case "area"
        [props.Area] = num2cell (Area){:};
      case "boundingbox"
        [props.BoundingBox] = mat2cell (values.boundingbox,
                                        ones (cc.NumObjects, 1)){:};
      case "centroid"
        [props.Centroid] = mat2cell (values.centroid,
                                     ones (cc.NumObjects, 1)){:};
      case "filledarea"
        [props.FilledArea] = num2cell (values.filledarea){:};
      case "filledimage"
        [props.FilledImage] = values.filledimage{:};
      case "image"
        [props.Image] = values.image{:};
      case "pixelidxlist"
        [props.PixelIdxList] = mat2cell (values.pixelidxlist, Area){:};
      case "pixellist"
        [props.PixelList] = mat2cell (values.pixellist, Area){:};
      case "subarrayidx"
        [props.SubarrayIdx] = values.subarrayidx{:};
#      case "convexarea"
#      case "convexhull"
#      case "conveximage"
      case "eccentricity"
        [props.Eccentricity] = num2cell (values.eccentricity){:};
      case "equivdiameter"
        [props.EquivDiameter] = num2cell (values.equivdiameter){:};
      case "eulernumber"
        [props.EulerNumber] = num2cell (values.eulernumber){:};
      case "extent"
        [props.Extent] = num2cell (values.extent){:};
      case "extrema"
        [props.Extrema] = mat2cell (values.extrema,
                                    repmat (8, 1, cc.NumObjects)){:};
      case "majoraxislength"
        [props.MajorAxisLength] = num2cell (values.majoraxislength){:};
      case "minoraxislength"
        [props.MinorAxisLength] = num2cell (values.minoraxislength){:};
      case "orientation"
        [props.Orientation] = num2cell (values.orientation){:};
      case "perimeter"
        [props.Perimeter] = num2cell (values.perimeter){:};
#      case "solidity"
      case "maxintensity"
        [props.MaxIntensity] = num2cell (values.maxintensity){:};
      case "meanintensity"
        [props.MeanIntensity] = num2cell (values.meanintensity){:};
      case "minintensity"
        [props.MinIntensity] = num2cell (values.minintensity){:};
      case "pixelvalues"
        [props.PixelValues] = mat2cell (values.pixelvalues, Area){:};
      case "weightedcentroid"
        [props.WeightedCentroid] = mat2cell (values.weightedcentroid,
                                             ones (cc.NumObjects, 1)){:};
      otherwise
        error ("regionprops: unknown property `%s'", pname);
    endswitch
  endfor

endfunction

function props = select_properties (props, is_2d, has_gray)
  persistent props_basic = {
    "area",
    "boundingbox",
    "centroid",
  };
  persistent props_2d = {
#    "convexarea",
#    "convexhull",
#    "conveximage",
    "eccentricity",
    "equivdiameter",
    "extrema",
    "majoraxislength",
    "minoraxislength",
    "orientation",
    "perimeter",
#    "solidity",
  };
  persistent props_gray = {
    "maxintensity",
    "meanintensity",
    "minintensity",
    "pixelvalues",
    "weightedcentroid",
  };
  persistent props_others = {
    "eulernumber",
    "extent", # Matlab limits Extent to 2D.  Octave does not.
    "filledarea",
    "filledimage",
    "image",
    "pixelidxlist",
    "pixellist",
    "subarrayidx",
  };
  props = props(:);
  p_basic = strcmp ("basic", props);
  p_all = strcmp ("all", props);
  props(p_basic | p_all) = [];
  if (any (p_all))
    props = vertcat (props, props_basic, props_others);
    if (is_2d)
      props = vertcat (props, props_2d);
    endif
    if (has_gray)
      props = vertcat (props, props_gray);
    endif
  elseif (any (p_basic))
    props = vertcat (props, props_basic);
  endif

  if (! is_2d)
    non_2d = ismember (props, props_2d);
    if (any (non_2d))
      warning ("regionprops: ignoring %s properties for non 2 dimensional image",
              strjoin (props(non_2d), ", "));
      props(non_2d) = [];
    endif
  endif
  if (! has_gray)
    non_val = ismember (props, props_gray);
    if (any (non_val))
      warning ("regionprops: ignoring %s properties due to missing grayscale image",
              strjoin (props(non_val), ", "));
      props(non_val) = [];
    endif
  endif
endfunction

function area = rp_area (cc)
  area = cellfun (@numel, cc.PixelIdxList(:));
endfunction

function centroid = rp_centroid (cc, pixel_list, area, subs_nd)
  nd = numel (cc.ImageSize);
  no = cc.NumObjects;
  weighted_sub = pixel_list ./ vec (repelems (area, [1:no; vec(area, 2)]));
  centroid = accumarray (subs_nd, weighted_sub(:), [no nd]);
endfunction

function bounding_box = rp_bounding_box (cc, pixel_list, subs_nd)
  nd = numel (cc.ImageSize);
  no = cc.NumObjects;
  init_corner = accumarray (subs_nd, pixel_list(:), [no nd], @min) - 0.5;
  end_corner  = accumarray (subs_nd, pixel_list(:), [no nd], @max) + 0.5;
  bounding_box = [(init_corner) (end_corner - init_corner)];
endfunction

function eccentricity = rep_eccentricity (minoraxislength, majoraxislength)
  eccentricity = sqrt (1 - (minoraxislength ./ majoraxislength).^2);
endfunction

function equivdiameter = rp_equivdiameter (area)
  equivdiameter =  sqrt (4 * area / pi);
endfunction

function euler = rp_euler_number (bb_images)
  ## TODO there should be a way to vectorize this, right?
  euler = cellfun (@bweuler, bb_images);
endfunction

function extent = rp_extent (area, bounding_box)
  bb_area = prod (bounding_box(:,(end/2)+1:end), 2);
  extent = area ./ bb_area;
endfunction

function extrema = rp_extrema (cc, pixel_list, area, subs_nd)
  ## Note that this property is limited to 2d regions
  no = cc.NumObjects;

  ## Algorithm:
  ##  1. Find the max and min values for row and column values on
  ##    each object.  That is, max and min of each column in
  ##    pixel_list, for each object.
  ##
  ##  2. Get a mask for pixel_list, for those rows and columns indices.
  ##
  ##  3. Use that mask on the other dimension to find the max and min
  ##    values for each object.
  ##
  ##  4. Assign those values to a (8*no)x2 array.
  ##
  ## This gets a bit convoluted because we do the two dimensions and
  ## all objects at the same time.

  ## In the following, "head" and "base" are the top and bottom index for
  ## each dimension.  We use the words "head" and "base" to avoid confusion
  ## with the rest where top and bottom only refer to the row dimension.
  ## So "head" has the lowest index values (rows for top left/right, and
  ## columns for left top/bottom), while "base" has the highest index
  ## values (rows for bottom left/right, and columns for right top/bottom).

  ##  1. Find the max and min values for row and column values on
  ##    each object.  That is, max and min of each column in
  ##    pixel_list, for each object.
  head = accumarray (subs_nd, pixel_list(:), [no 2], @min);
  base = accumarray (subs_nd, pixel_list(:), [no 2], @max);

  ##  2. Get a mask for pixel_list, for those rows and columns indices.
  ##
  ##  3. Use that mask on the other dimension to find the max and min
  ##    values for each object.
  ##
  ## head_head and head_base, have the lowest index (head) and the
  ## highest index (base) values, for the "head" indices.
  ## Same logic for base_head and base_base.

  px_l_sz = size (pixel_list);
  rep_extrema = @(x) reshape (repelems (x, [1:(no*2); area(:)' area(:)']),
                              px_l_sz);

  head_mask = (pixel_list == rep_extrema (head))(:, [2 1]);
  head_head = accumarray (subs_nd(head_mask), pixel_list(head_mask), [no 2], @min);
  head_base = accumarray (subs_nd(head_mask), pixel_list(head_mask), [no 2], @max);

  base_mask = (pixel_list == rep_extrema (base))(:, [2 1]);
  base_head = accumarray (subs_nd(base_mask), pixel_list(base_mask), [no 2], @min);
  base_base = accumarray (subs_nd(base_mask), pixel_list(base_mask), [no 2], @max);


  ## Adjust from idx integer to pixel border coordinates
  head -= 0.5;
  head_head -= 0.5;
  head_base += 0.5;
  base += 0.5;
  base_head -= 0.5;
  base_base += 0.5;


  ##  4. Assign those values to a (8*no)x2 array.
  nr = 8 * no;
  extrema = zeros (nr, 2);

  extrema(1:8:nr, 2) = head(:,2); # y values for top left
  extrema(2:8:nr, 2) = head(:,2); # y values for top right

  extrema(7:8:nr, 1) = head(:,1); # x values for left bottom
  extrema(8:8:nr, 1) = head(:,1); # x values for left top

  extrema(5:8:nr, 2) = base(:,2); # y values for bottom right
  extrema(6:8:nr, 2) = base(:,2); # y values for bottom left

  extrema(3:8:nr, 1) = base(:,1); # x values for right top
  extrema(4:8:nr, 1) = base(:,1); # x values for right bottom

  extrema(1:8:nr, 1) = head_head(:,1); # x value for top left
  extrema(8:8:nr, 2) = head_head(:,2); # y value for left top

  extrema(2:8:nr, 1) = head_base(:,1); # x value for top right
  extrema(7:8:nr, 2) = head_base(:,2); # y value for left bottom

  extrema(6:8:nr, 1) = base_head(:,1); # x value for bottom left
  extrema(3:8:nr, 2) = base_head(:,2); # y value for right top

  extrema(5:8:nr, 1) = base_base(:,1); # x value for bottom right
  extrema(4:8:nr, 2) = base_base(:,2); # y value for right bottom
endfunction

function filled_area = rp_filled_area (bb_filled_images)
  filled_area = cellfun ('nnz', bb_filled_images);
endfunction

function bb_filled_images = rp_filled_image (bb_images)
  ## Beware if attempting to vectorize this.  The bounding boxes of
  ## different regions may overlap, and a "hole" may be a hole for
  ## several regions (e.g., concentric circles).  There should be tests
  ## this weird cases.
  bb_filled_images = cellfun (@(x) imfill (x, "holes"), bb_images,
                              "UniformOutput", false);
endfunction

function bb_images = rp_image (cc, bw, idx, subs, subarray_idx)
  ## For this property, we must remember to remove elements from other
  ## regions (remember that bounding boxes may overlap).  We do that by
  ## creating a labelled image, extracting the bounding boxes, and then
  ## comparing elements.

  no = cc.NumObjects;
  ## If BW is numeric then it already is a labeled image.
  if (isnumeric (bw))
    L = bw;
  else
    if (no < 255)
      cls = "uint8";
    elseif (no < 65535)
      cls = "uint16"
    elseif (no < 4294967295)
      cls = "uint32";
    else
      cls = "double";
    endif
    L = zeros (cc.ImageSize, cls);
    L(idx) = subs;
  endif
  sub_structs = num2cell (struct ("type", "()", "subs", subarray_idx));
  bb_images = cellfun (@subsref, {L}, sub_structs, "UniformOutput", false);
  bb_images = cellfun (@eq, bb_images, num2cell (1:no)(:),
                       "UniformOutput", false);
endfunction

function perim = rp_perimeter (cc, bw)
  if (! islogical (bw)) # Then input was not really a bw. Create it.
    bw = false (cc.ImageSize);
    bw(cell2mat (cc.PixelIdxList(:))) = true;
  endif

  no = cc.NumObjects;
  boundaries = bwboundaries (bw, 8, "noholes");
  npx = cellfun ("size", boundaries, 1);
  dists = diff (cell2mat (boundaries));
  dists(cumsum (npx)(1:end-1),:) = [];
  dists = sqrt (sumsq (dists, 2));

  subs = repelems (1:no, [1:no; (npx-1)(:)']);
  perim = accumarray (subs(:), dists(:), [no 1]);
endfunction

function idx = rp_pixel_idx_list (cc)
  idx = cell2mat (cc.PixelIdxList(:));
endfunction

function pixel_list = rp_pixel_list (cc, idx)
  nd = numel (cc.ImageSize);
  pixel_list = cell2mat (nthargout (1:nd, @ind2sub, cc.ImageSize, idx));
  ## If idx is empty, pixel_list will have size (0x0) so we need to expand
  ## it to (0xnd).  Unfortunately, in2sub() returns (0x0) and not (0x1)
  pixel_list = postpad (pixel_list, nd, 0, 2);
  pixel_list(:,[1 2]) = pixel_list(:,[2 1]);
endfunction

function pixel_values = rp_pixel_values (cc, img, idx)
  pixel_values = img(idx);
endfunction

function max_intensity = rp_max_intensity (cc, img, idx, subs)
  max_intensity = accumarray (subs, img(idx), [cc.NumObjects 1], @max);
endfunction

function mean_intensity = rp_mean_intensity (cc, totals, area)
  mean_intensity = totals ./ area;
endfunction

function min_intensity = rp_min_intensity (cc, img, idx, subs)
  min_intensity = accumarray (subs, img(idx), [cc.NumObjects 1], @min);
endfunction

function subarray_idx = rp_subarray_idx (cc, bounding_box)
  nd = columns (bounding_box) / 2;
  bb_limits = bounding_box;
  ## Swap x y coordinates back to row and column
  bb_limits(:,[1 2 [1 2]+nd]) = bounding_box(:,[2 1 [2 1]+nd]);
  ## Set initial coordinates (it is faster to add 0.5 than to call ceil())
  bb_limits(:,1:nd) += 0.5;
  ## Set the end coordinates
  bb_limits(:,(nd+1):end) += bb_limits(:,1:nd);
  bb_limits(:,(nd+1):end) -= 1;
  subarray_idx = arrayfun (@colon, bb_limits(:,1:nd), bb_limits(:,(nd+1):end),
                           "UniformOutput", false);
  subarray_idx = mat2cell (subarray_idx, ones (cc.NumObjects, 1));
endfunction

function weighted_centroid = rp_weighted_centroid (cc, img, pixel_list,
                                                   pixel_idx_list, totals,
                                                   subs_nd, area)
  no = cc.NumObjects;
  nd = numel (cc.ImageSize);
  rep_totals = vec (repelems (totals, [1:no; vec(area, 2)]));

  ## Note that we need 1 column, even if pixel_idx_list is [], hence (:)
  ## so that we get (0x1) instead of (0x0)
  vals = img(pixel_idx_list)(:);

  weighted_pixel_list = pixel_list .* (double (vals) ./ rep_totals);
  weighted_centroid = accumarray (subs_nd, weighted_pixel_list(:), [no nd]);
endfunction


##
## Intermediary steps -- no match to specific property
##

## Creates subscripts for use with accumarray, when computing a column vector.
function subs = rp_accum_subs (cc, area)
  rn = 1:cc.NumObjects;
  R  = [rn; vec(area, 2)];
  subs = vec (repelems (rn, R));
endfunction

## Creates subscripts for use with accumarray, when computing something
## with a column per number of dimensions
function subs_nd = rp_accum_subs_nd (cc, subs)
  nd = numel (cc.ImageSize);
  no = cc.NumObjects;
  ## FIXME workaround bug #47085
  subs_nd = vec (bsxfun (@plus, subs, [0:no:(no*nd-1)]));
endfunction

## Total/Integrated density of each region.
function totals = rp_total_intensity (cc, img, idx, subs)
  totals = accumarray (subs, img(idx), [cc.NumObjects 1]);
endfunction

function [minor, major, orientation] = rp_local_ellipse (area, pixellist)
  ## FIXME: this should be vectorized.  See R.M. Haralick and Linda G.
  ##        Shapiro, "Computer and Robot Vision: Volume 1", Appendix A

  no = numel (area);

  minor = zeros (no, 1);
  major = minor;
  orientation = minor;

  c_idx = 1;
  for idx = 1:no
    sel = c_idx:(c_idx + area(idx) -1);
    X = pixellist(sel, 2);
    Y = pixellist(sel, 1);

    ## calculate (centralised) second moment of region with pixels [X, Y]

    ## This is equivalent to "cov ([X(:) Y(:)], 1)" but will work as
    ## expected even if X and Y have only one row each.
    C = center ([X(:) Y(:)], 1);
    C = C' * C / (rows (C));

    C = C + 1/12 .* eye (rows (C)); # centralised second moment of 1 pixel is 1/12
    [V, lambda] = eig (C);
    lambda_d = 4 .* sqrt (diag (lambda));
    minor(idx) = min (lambda_d);
    [major(idx), major_idx] = max (lambda_d);
    major_vec = V(:, major_idx);
    orientation(idx) = -(180/pi) .* atan (major_vec(2) ./ major_vec(1));
  endfor
endfunction


%!shared bw2d, gray2d, bw2d_over_bb, bw2d_insides
%! bw2d = logical ([
%!  0 1 0 1 1 0
%!  0 1 1 0 1 1
%!  0 1 0 0 0 0
%!  0 0 0 1 1 1
%!  0 0 1 1 0 1]);
%!
%! gray2d = [
%!  2 4 0 7 5 2
%!  3 0 4 9 3 7
%!  0 5 3 4 8 1
%!  9 2 0 5 8 6
%!  8 9 7 2 2 5];
%!
%! ## For testing overlapping bounding boxes
%! bw2d_over_bb = logical ([
%!  0 1 1 1 0 1 1
%!  1 1 0 0 0 0 1
%!  1 0 0 1 1 0 1
%!  1 0 0 1 1 0 0
%!  0 0 0 1 1 1 1]);
%!
%! ## For testing when there's regions inside regions
%! bw2d_insides = logical ([
%!  0 0 0 0 0 0 0 0
%!  0 1 1 1 1 1 1 0
%!  0 1 0 0 0 0 1 0
%!  0 1 0 1 1 0 1 0
%!  0 1 0 1 1 0 1 0
%!  0 1 0 0 0 0 1 0
%!  0 1 1 1 1 1 1 0
%!  0 0 0 0 0 0 0 0]);


%!function c = get_2d_centroid_for (idx)
%!  subs = ind2sub ([5 6], idx);
%!  m = false ([5 6]);
%!  m(idx) = true;
%!  y = sum ((1:5)' .* sum (m, 2) /sum (m(:)));
%!  x = sum ((1:6)  .* sum (m, 1) /sum (m(:)));
%!  c = [x y];
%!endfunction

%!assert (regionprops (bw2d, "Area"), struct ("Area", {8; 6}))
%!assert (regionprops (double (bw2d), "Area"), struct ("Area", {14}))
%!assert (regionprops (bwlabel (bw2d, 4), "Area"), struct ("Area", {4; 6; 4}))

## These are different from Matlab because the indices in PixelIdxList
## do not appear sorted.  This is because we get them from bwconncomp()
## which does not sort them (it seems bwconncomp in Matlab returns them
## sorted but that's undocumented, just like the order here is undocumented)
%!assert (regionprops (bw2d, "PixelIdxList"),
%!        struct ("PixelIdxList", {[6; 7; 12; 8; 16; 21; 22; 27]
%!                                 [15; 19; 20; 24; 29; 30]}))
%!assert (regionprops (bwlabel (bw2d, 4), "PixelIdxList"),
%!        struct ("PixelIdxList", {[6; 7; 8; 12]
%!                                 [15; 19; 20; 24; 29; 30]
%!                                 [16; 21; 22; 27]}))
%!assert (regionprops (bw2d, "PixelList"),
%!        struct ("PixelList", {[2 1; 2 2; 3 2; 2 3; 4 1; 5 1; 5 2; 6 2]
%!                              [3 5; 4 4; 4 5; 5 4; 6 4; 6 5]}))
%!assert (regionprops (bwlabel (bw2d, 4), "PixelList"),
%!        struct ("PixelList", {[2 1; 2 2; 2 3; 3 2]
%!                              [3 5; 4 4; 4 5; 5 4; 6 4; 6 5]
%!                              [4 1; 5 1; 5 2; 6 2]}))

## Also different from Matlab because we do not sort the values by index
%!assert (regionprops (bw2d, gray2d, "PixelValues"),
%!        struct ("PixelValues", {[4; 0; 4; 5; 7; 5; 3; 7]
%!                                [7; 5; 2; 8; 6; 5]}))

%!assert (regionprops (bw2d, gray2d, "MaxIntensity"),
%!        struct ("MaxIntensity", {7; 8}))
%!assert (regionprops (bw2d, gray2d, "MinIntensity"),
%!        struct ("MinIntensity", {0; 2}))

%!assert (regionprops (bw2d, "BoundingBox"),
%!        struct ("BoundingBox", {[1.5 0.5 5 3]; [2.5 3.5 4 2]}))

%!assert (regionprops (bw2d, "Centroid"),
%!        struct ("Centroid", {get_2d_centroid_for([6 7 8 12 16 21 22 27])
%!                             get_2d_centroid_for([15 19 20 24 29 30])}))

%!test
%! props = struct ("Area", {8; 6},
%!                 "Centroid", {get_2d_centroid_for([6 7 8 12 16 21 22 27])
%!                              get_2d_centroid_for([15 19 20 24 29 30])},
%!                 "BoundingBox", {[1.5 0.5 5 3]; [2.5 3.5 4 2]});
%! assert (regionprops (bw2d, "basic"), props)
%! assert (regionprops (bwconncomp (bw2d, 8), "basic"), props)
%! assert (regionprops (bwlabeln (bw2d, 8), "basic"), props)

%!test
%! props = struct ("Area", {4; 6; 4},
%!                 "Centroid", {get_2d_centroid_for([6 7 8 12])
%!                              get_2d_centroid_for([15 19 20 24 29 30])
%!                              get_2d_centroid_for([16 21 22 27])},
%!                 "BoundingBox", {[1.5 0.5 2 3]; [2.5 3.5 4 2]; [3.5 0.5 3 2]});
%! assert (regionprops (bwconncomp (bw2d, 4), "basic"), props)
%! assert (regionprops (bwlabeln (bw2d, 4), "basic"), props)

## This it is treated as labeled image with a single discontiguous region.
%!assert (regionprops (double (bw2d), "basic"),
%!        struct ("Area", 14,
%!                "Centroid", get_2d_centroid_for (find (bw2d)),
%!                "BoundingBox", [1.5 0.5 5 5]), eps*1000)

%!assert (regionprops ([0 0 1], "Centroid").Centroid, [3 1])
%!assert (regionprops ([0 0 1; 0 0 0], "Centroid").Centroid, [3 1])

## bug #39701
%!assert (regionprops ([0 1 1], "Centroid").Centroid, [2.5 1])
%!assert (regionprops ([0 1 1; 0 0 0], "Centroid").Centroid, [2.5 1])

%!test
%! a = zeros (2, 3, 3);
%! a(:, :, 1) = [0 1 0; 0 0 0];
%! a(:, :, 3) = a(:, :, 1);
%! c = regionprops (a, "centroid");
%! assert (c.Centroid, [2 1 2])

%!test
%! d1=2; d2=4; d3=6;
%! a = ones (d1, d2, d3);
%! c = regionprops (a, "centroid");
%! assert (c.Centroid, [mean(1:d2), mean(1:d1), mean(1:d3)], eps*1000)

%!test
%! a = [0 0 2 2; 3 3 0 0; 0 1 0 1];
%! c = regionprops (a, "centroid");
%! assert (c(1).Centroid, [3 3])
%! assert (c(2).Centroid, [3.5 1])
%! assert (c(3).Centroid, [1.5 2])

%!test
%!assert (regionprops (bw2d, gray2d, "WeightedCentroid"),
%!                     struct ("WeightedCentroid",
%!                             {sum([2 1; 2 2; 3 2; 2 3; 4 1; 5 1; 5 2; 6 2]
%!                              .* ([4; 0; 4; 5; 7; 5; 3; 7] / 35))
%!                              sum([3 5; 4 4; 4 5; 5 4; 6 4; 6 5]
%!                                  .* ([7; 5; 2; 8; 6; 5] / 33))}))

%!test
%! img = zeros (3, 9);
%! img(2, 1:9) = 0:0.1:0.8;
%! bw = im2bw (img, 0.5);
%! props = regionprops (bw, img, "WeightedCentroid");
%! ix = 7:9;
%! x = sum (img(2,ix) .* (ix)) / sum (img(2,ix));
%! assert (props(1).WeightedCentroid(1), x, 10*eps)
%! assert (props(1).WeightedCentroid(2), 2, 10*eps)

%!assert (regionprops (bw2d, gray2d, "MeanIntensity"),
%!        struct ("MeanIntensity", {mean([4 0 5 4 7 5 3 7])
%!                                  mean([7 5 2 8 6 5])}))

%!assert (regionprops (bwlabel (bw2d, 4), gray2d, "MeanIntensity"),
%!        struct ("MeanIntensity", {mean([4 0 5 4])
%!                                  mean([7 5 2 8 6 5])
%!                                  mean([7 5 3 7])}))

%!assert (regionprops (bw2d, "SubarrayIdx"),
%!        struct ("SubarrayIdx", {{[1 2 3], [2 3 4 5 6]}
%!                                {[4 5], [3 4 5 6]}}))

%!assert (regionprops (bwlabel (bw2d, 4), "SubarrayIdx"),
%!        struct ("SubarrayIdx", {{[1 2 3], [2 3]}
%!                                {[4 5], [3 4 5 6]}
%!                                {[1 2], [4 5 6]}}))

%!test
%! out = struct ("Image", {logical([1 0 1 1 0; 1 1 0 1 1; 1 0 0 0 0])
%!                         logical([0 1 1 1; 1 1 0 1])});
%! assert (regionprops (bw2d, "Image"), out)
%! assert (regionprops (bw2d, gray2d, "Image"), out)
%! assert (regionprops (bwlabel (bw2d), "Image"), out)

%!assert (regionprops (bwlabel (bw2d, 4), "Image"),
%!        struct ("Image", {logical([1 0; 1 1; 1 0])
%!                          logical([0 1 1 1; 1 1 0 1])
%!                          logical([1 1 0; 0 1 1])}))

## Test overlapping bounding boxes
%!test
%! out = struct ("Image", {logical([0 1 1 1; 1 1 0 0; 1 0 0 0; 1 0 0 0])
%!                         logical([1 1 0 0; 1 1 0 0; 1 1 1 1])
%!                         logical([1 1; 0 1; 0 1])});
%! assert (regionprops (bw2d_over_bb, "Image"), out)
%! assert (regionprops (bwlabel (bw2d_over_bb), "Image"), out)

%!test
%! out = struct ("Image", {logical([1 1 1 1 1 1
%!                                  1 0 0 0 0 1
%!                                  1 0 0 0 0 1
%!                                  1 0 0 0 0 1
%!                                  1 0 0 0 0 1
%!                                  1 1 1 1 1 1])
%!                         logical([1 1; 1 1])});
%! assert (regionprops (bw2d_insides, "Image"), out)
%! assert (regionprops (bwlabel (bw2d_insides), "Image"), out)


%!test
%! l = uint8 ([
%!   0  0  0  0  0  0
%!   0  1  1  1  1  0
%!   0  1  2  2  1  0
%!   0  1  2  2  1  0
%!   0  1  1  1  1  0
%!   0  0  0  0  0  0
%! ]);
%! assert (regionprops (l, "EulerNumber"),
%!         struct ("EulerNumber", {0; 1}))
%!
%! l = uint8 ([
%!   0  0  0  0  0  0  0
%!   0  1  1  1  1  1  0
%!   0  1  2  2  2  1  0
%!   0  1  2  3  2  1  0
%!   0  1  2  2  2  1  0
%!   0  1  1  1  1  1  0
%!   0  0  0  0  0  0  0
%! ]);
%! assert (regionprops (l, "EulerNumber"),
%!         struct ("EulerNumber", {0; 0; 1}))

%!test
%! l = uint8 ([
%!   0  0  0  0  0  0  0
%!   0  1  1  1  1  1  0
%!   0  1  0  0  0  1  0
%!   0  1  0  1  0  1  0
%!   0  1  0  0  0  1  0
%!   0  1  1  1  1  1  0
%!   0  0  0  0  0  0  0
%! ]);
%! assert (regionprops (l, "EulerNumber"),
%!         struct ("EulerNumber", 1))

%!test
%! l = uint8 ([
%!   1  1  1  1  1  1  1
%!   1  1  2  1  2  2  1
%!   1  2  1  2  1  2  1
%!   1  1  2  1  2  1  1
%!   1  2  1  2  1  2  1
%!   1  2  2  1  2  1  1
%!   1  1  1  1  1  1  1
%! ]);
%! assert (regionprops (l, "EulerNumber"),
%!         struct ("EulerNumber", {-9; -4}))

%!test
%! l = uint8 ([
%!   1  1  1  1  1  1  1
%!   1  1  4  1  5  5  1
%!   1  3  1  4  1  5  1
%!   1  1  3  1  4  1  1
%!   1  2  1  3  1  4  1
%!   1  2  2  1  3  1  1
%!   1  1  1  1  1  1  1
%! ]);
%! assert (regionprops (l, "EulerNumber"),
%!         struct ("EulerNumber", {-9; 1; 1; 1; 1}))


## Test connectivity for hole filling.
%!test
%! l = uint8 ([
%!   1  1  1  1  1  1  1
%!   0  1  2  1  2  2  1
%!   1  2  1  2  1  2  1
%!   1  1  2  1  2  1  1
%!   1  2  1  2  1  2  1
%!   1  2  2  1  2  1  1
%!   1  1  1  1  1  1  1
%! ]);
%! filled = {
%!   logical([
%!     1  1  1  1  1  1  1
%!     0  1  1  1  1  1  1
%!     1  1  1  1  1  1  1
%!     1  1  1  1  1  1  1
%!     1  1  1  1  1  1  1
%!     1  1  1  1  1  1  1
%!     1  1  1  1  1  1  1
%!   ]);
%!   logical([
%!     0  1  0  1  1
%!     1  1  1  1  1
%!     0  1  1  1  0
%!     1  1  1  1  1
%!     1  1  0  1  0
%!   ]);
%!  };
%! assert (regionprops (l, {"FilledImage", "FilledArea"}),
%!         struct ("FilledImage", filled, "FilledArea", {48; 19}))

## Disconnected regions without holes.
%!test
%! l = uint8 ([
%!   0  0  0  0  0  0  0
%!   0  1  0  1  0  1  0
%!   0  1  0  1  0  1  0
%!   0  0  0  0  0  0  0
%! ]);
%! filled = logical ([
%!   1  0  1  0  1
%!   1  0  1  0  1
%! ]);
%! assert (regionprops (l, {"FilledImage", "FilledArea"}),
%!         struct ("FilledImage", filled, "FilledArea", 6))
%!
%! l = uint8 ([
%!   2  2  2  2  2  2  2
%!   2  1  2  1  2  1  2
%!   2  1  2  1  2  1  2
%!   2  2  2  2  2  2  2
%! ]);
%! filled = {
%!   logical([
%!     1  0  1  0  1
%!     1  0  1  0  1
%!   ]);
%!   true(4, 7)
%! };
%! assert (regionprops (l, {"FilledImage", "FilledArea"}),
%!         struct ("FilledImage", filled, "FilledArea", {6; 28}))

## Concentric regions to fill holes.
%!test
%! l = uint8 ([
%!   0  0  0  0  0  0  0
%!   0  1  1  1  1  1  0
%!   0  1  2  2  2  1  0
%!   0  1  2  3  2  1  0
%!   0  1  2  2  2  1  0
%!   0  1  1  1  1  1  0
%!   0  0  0  0  0  0  0
%! ]);
%! filled = {true(5, 5); true(3, 3); true};
%! assert (regionprops (l, {"FilledImage", "FilledArea"}),
%!         struct ("FilledImage", filled, "FilledArea", {25; 9; 1}))

## Regions with overlapping holes.
%!test
%! l = uint8 ([
%!   1  1  1  2  0  0
%!   1  0  2  1  2  0
%!   1  2  0  1  0  2
%!   1  2  1  1  0  2
%!   0  1  2  2  2  2
%! ]);
%! filled = {
%!   logical([
%!     1  1  1  0
%!     1  1  1  1
%!     1  1  1  1
%!     1  1  1  1
%!     0  1  0  0
%!   ]);
%!   logical([
%!     0  0  1  0  0
%!     0  1  1  1  0
%!     1  1  1  1  1
%!     1  1  1  1  1
%!     0  1  1  1  1
%!   ])
%! };
%! assert (regionprops (l, {"FilledImage", "FilledArea"}),
%!         struct ("FilledImage", filled, "FilledArea", {16; 18}))

## 3D region to fill which requires connectivity 6 (fails with 18 or 26).
%!test
%! bw = false (5, 5, 5);
%! bw(2:4, 2:4, [1 5]) = true;
%! bw(2:4, [1 5], 2:4) = true;
%! bw([1 5], 2:4, 2:4) = true;
%! filled = bw;
%! filled(2:4, 2:4, 2:4) = true;
%! assert (regionprops (bw, {"FilledImage", "FilledArea"}),
%!         struct ("FilledImage", filled, "FilledArea", 81))


%!test
%! l = uint8 ([
%!   1  1  1  2  0  0
%!   1  0  2  1  2  0
%!   1  2  0  1  0  2
%!   1  2  1  1  0  2
%!   0  1  2  2  2  2
%! ]);
%! assert (regionprops (l, {"Extent"}), struct ("Extent", {0.55; 0.44}))


%!test
%! bw = logical ([0 0 0; 0 1 0; 0 0 0]);
%! assert (regionprops (bw, {"MinorAxisLength", "MajorAxisLength", ...
%!                           "Eccentricity"}),
%!         struct ("MajorAxisLength", 4 .* sqrt (1/12),
%!                 "MinorAxisLength", 4 .* sqrt (1/12),
%!                 "Eccentricity", 0))

%!test
%! a = eye (4);
%! t = regionprops (a, "majoraxislength");
%! assert (t.MajorAxisLength, 6.4291, 1e-3);
%! t = regionprops (a, "minoraxislength");
%! assert(t.MinorAxisLength, 1.1547 , 1e-3);
%! t = regionprops (a, "eccentricity");
%! assert (t.Eccentricity, 0.98374 , 1e-3);
%! t = regionprops (a, "orientation");
%! assert (t.Orientation, -45);
%! t = regionprops (a, "equivdiameter");
%! assert (t.EquivDiameter, 2.2568,  1e-3);

%!test
%! b = ones (5);
%! t = regionprops (b, "majoraxislength");
%! assert (t.MajorAxisLength, 5.7735 , 1e-3);
%! t = regionprops (b, "minoraxislength");
%! assert (t.MinorAxisLength, 5.7735 , 1e-3);
%! t = regionprops (b, "eccentricity");
%! assert (t.Eccentricity, 0);
%! t = regionprops (b, "orientation");
%! assert (t.Orientation, 0);
%! t = regionprops (b, "equivdiameter");
%! assert (t.EquivDiameter, 5.6419,  1e-3);

%!test
%! c = [0 0 1; 0 1 1; 1 1 0];
%! t = regionprops (c, "minoraxislength");
%! assert (t.MinorAxisLength, 1.8037 , 1e-3);
%! t = regionprops (c, "majoraxislength");
%! assert (t.MajorAxisLength, 4.1633 , 1e-3);
%! t = regionprops (c, "eccentricity");
%! assert (t.Eccentricity, 0.90128 , 1e-3);
%! t = regionprops (c, "orientation");
%! assert (t.Orientation, 45);
%! t = regionprops (c, "equivdiameter");
%! assert (t.EquivDiameter, 2.5231,  1e-3);


%!test
%! f = [0 0 0 0; 1 1 1 1; 0 1 1 1; 0 0 0 0];
%! t = regionprops (f, "Extrema");
%! shouldbe = [0.5  1.5; 4.5  1.5; 4.5 1.5; 4.5 3.5; 4.5 3.5; 1.5 3.5; 0.5 2.5; 0.5  1.5];
%! assert (t.Extrema, shouldbe,  eps);

%!test
%! bw = false (5);
%! bw([8 12 13 14 18]) = true;
%! extrema = [2 1; 3 1; 4 2; 4 3; 3 4; 2 4; 1 3; 1 2] + 0.5;
%! assert (regionprops (bw, "extrema"), struct ("Extrema", extrema))

%!test
%! ext1 = [1 0; 5 0; 6 1; 6 2; 2 3; 1 3; 1 3; 1 0] + 0.5;
%! ext2 = [3 3; 6 3; 6 3; 6 5; 6 5; 2 5; 2 5; 2 4] + 0.5;
%! assert (regionprops (bw2d, "extrema"), struct ("Extrema", {ext1; ext2}))

%!assert (regionprops (bw2d, "equivDiameter"),
%!        struct ("EquivDiameter", {sqrt(4*8/pi); sqrt(4*6/pi)}))
%!assert (regionprops (bw2d_over_bb, "equivDiameter"),
%!        struct ("EquivDiameter", {sqrt(4*7/pi); sqrt(4*8/pi); sqrt(4*4/pi)}))
%!assert (regionprops (bw2d_insides, "equivDiameter"),
%!        struct ("EquivDiameter", {sqrt(4*20/pi); sqrt(4*4/pi)}))

## Test the diameter of a circle of diameter 21.
%!test
%! I = zeros (40);
%! disk = fspecial ("disk",10);
%! disk = disk ./ max (disk(:));
%! I(10:30, 10:30) = disk;
%! bw = im2bw (I, 0.5);
%! props = regionprops (bw, "Perimeter");
%! assert (props.Perimeter, 10*4 + (sqrt (2) * 4)*4, eps*100)
%!
%! props = regionprops (bwconncomp (bw), "Perimeter");
%! assert (props.Perimeter, 10*4 + (sqrt (2) * 4)*4, eps*100)

%!assert (regionprops (bw2d, "Perimeter"),
%!        struct ("Perimeter", {(sqrt (2)*6 + 4); (sqrt (2)*3 + 4)}), eps*10)

## Test Perimeter with nested objects
%!assert (regionprops (bw2d_insides, "Perimeter"),
%!        struct ("Perimeter", {20; 4}))
%!assert (regionprops (bwconncomp (bw2d_insides), "Perimeter"),
%!        struct ("Perimeter", {20; 4}))

## Test guessing between labelled and binary image
%!assert (regionprops ([1 0 1; 1 0 1], "Area"), struct ("Area", 4))
%!assert (regionprops ([1 0 2; 1 1 2], "Area"), struct ("Area", {3; 2}))

## Test missing labels
%!assert (regionprops ([1 0 3; 1 1 3], "Area"), struct ("Area", {3; 0; 2}))

## Test dimensionality of struct array
%!assert (size (regionprops ([1 0 0; 0 0 2], "Area")), [2, 1])

%!error <L must be non-negative integers> regionprops ([1 -2   0 3])
%!error <L must be non-negative integers> regionprops ([1  1.5 0 3])

## Test for BW images with zero objects
%!test
%! im = rand (5);
%!
%! ## First do this so we get a list of all supported properties and don't
%! ## have to update the list each time.
%! bw = false (5);
%! bw(13) = true;
%! props = regionprops (bw, im, "all");
%! all_props = fieldnames (props);
%!
%! bw = false (5);
%! props = regionprops (bw, im, "all");
%! assert (size (props), [0 1])
%! assert (sort (all_props), sort (fieldnames (props)))

## Test for labeled images with zeros objects
%!test
%! im = rand (5);
%!
%! ## First do this so we get a list of all supported properties and don't
%! ## have to update the list each time.
%! labeled = zeros (5);
%! labeled(13) = 1;
%! props = regionprops (labeled, im, "all");
%! all_props = fieldnames (props);
%!
%! labeled = zeros (5);
%! props = regionprops (labeled, im, "all");
%! assert (size (props), [0 1])
%! assert (sort (all_props), sort (fieldnames (props)))

## Test for bwconncomp struct with zeros objects
%!test
%! im = rand (5);
%!
%! ## First do this so we get a list of all supported properties and don't
%! ## have to update the list each time.
%! bw = false (5);
%! bw(13) = true;
%! props = regionprops (bwconncomp (bw), im, "all");
%! all_props = fieldnames (props);
%!
%! bw = false (5);
%! props = regionprops (bwconncomp (bw), im, "all");
%! assert (size (props), [0 1])
%! assert (sort (all_props), sort (fieldnames (props)))

## Test warnings about invalid props for nd images and missing grayscale
%!warning <ignoring perimeter, extrema properties for non 2 dimensional image>
%!        regionprops (rand (5, 5, 5) > 0.5, {"perimeter", "extrema"});
%!warning <ignoring minintensity, weightedcentroid properties due to missing grayscale image>
%!        regionprops (rand (5, 5) > 0.5, {"minintensity", "weightedcentroid"});

## Input check for labeled images
%!error <L must be non-negative integers only>
%!      regionprops ([0 -1 3 4; 0 -1 3 4])
%!error <L must be non-negative integers only>
%!      regionprops ([0 1.5 3 4; 0 1.5 3 4])
%!error <L must be non-negative integers only>
%!      regionprops (int8 ([0 -1 3 4; 0 -1 3 4]))

%!error <not yet implemented> regionprops (rand (5, 5) > 0.5, "ConvexArea")
%!error <not yet implemented> regionprops (rand (5, 5) > 0.5, "ConvexHull")
%!error <not yet implemented> regionprops (rand (5, 5) > 0.5, "ConvexImage")
%!error <not yet implemented> regionprops (rand (5, 5) > 0.5, "Solidity")
