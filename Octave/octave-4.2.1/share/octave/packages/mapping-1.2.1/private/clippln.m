## Copyright (C) 2014 Philip Nienhuis
## 
## This program is free software; you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <http://www.gnu.org/licenses/>.

## -*- texinfo -*- 
## @deftypefn {Function File} [@var{val}, @var{npts}, @var{pprt}] = clipplg (@var{val}, @var{npts}, @var{pprt}, @var{sbox}, @var{styp})
## Undocumented internal function for clipping (poly)lines within a bounding
## box and interpolating M and Z-values.
##
## @seealso{}
## @end deftypefn

## Author: Philip Nienhuis <prnienhuis@users.sf.net>
## Created: 2014-12-01

function [val, tnpt, tnpr] = clippln (val, tnpt, tnpr, sbox, styp=3)

  ## Backup
  btnpr = tnpr;
  ## Prepare augmented npr array for easier indexing into subfeatures
  ttnpr = [tnpr tnpt];
  ctnpr = {};
  ## Initialize output array
  valt = [];

  ## First step is to check all polyline vertices whether they lie in sbox
  [aa, bb] = inpolygon (val(:, 1), val(:, 2), sbox(:, 1), sbox(:, 2));
  if (any (aa) || any (bb))
    ## So there are. Morph bounding box into something that OF geometry likes:
    ## Parametric representation of bounding box. "createLine" is in OF geometry
    ssbox = createLine (sbox(1:4, :), sbox (2:5, :)); 
## Create sbx from sbox ([minx max miny maxy])
sbx = [min(sbox(:, 1)), max(sbox(:, 1)), min(sbox(:, 2)), max(sbox(:, 2))];
    ## For those points ON the boundary no interpolation is needed.
    ## First treat those points requiring interpolation (1st inside,
    ## 2nd outside or vice versa)
    for ll=1:numel (tnpr)
      ## Start at end of polyline-part to avoid mixing up tnpr pointers
      ii = numel (tnpr) - ll + 1;
      nprt = [];
      ## Select polyline part
      valn = val(ttnpr(ii)+1:ttnpr(ii+1), :);
      a = aa(ttnpr(ii)+1:ttnpr(ii+1));
      if (any (a))
        b = bb(ttnpr(ii)+1:ttnpr(ii+1));
        da = diff (a);
        idx = find (da);
        ## Find out which bounding box segments have been crossed where
        ## 1. Parametric representation of line
        lines = createLine (valn(idx, 1:2), valn(idx+1, 1:2));
        ## 2. Compute intersections. clipLine & distancePoints are in OF geometry
        for jj=1:numel (idx)
          ## Start at end of polyline-part to avoid mixing up tnpr pointers
          kk = numel (idx) - jj + 1;
          ## Skip points on border
          if (! b(idx(kk)+1))
            intsc = reshape (clipLine (lines(kk, :), sbx), 2, 2)';
            dst = distancePoints (intsc, valn(idx(kk):idx(kk)+1, 1:2));
            ## If segment goes out, take nearest point to valn(idx(kk)+1)
            if (da(idx(kk)) < 1)
              [~, ix] = min (dst(:, 2));
            else
              [~, ix] = min (dst(:, 1));
            endif
            fac = dst(ix, 2) / sum (dst(2, :));
            intsc = intsc (ix, :);
            ## Insert new intersection point
            valn(idx(kk)+2:end+1, :) = valn(idx(kk)+1:end, :);
            valn(idx(kk)+1, 1:2) = intsc(1:2);
            if (styp > 3)
              valn(idx(kk)+1, 3:4) = valn(idx(kk)+2, 3:4) + fac * ...
                                     (valn(idx(kk), 3:4) - valn(idx(kk)+2, 3:4));
            else
              valn(idx(kk)+1, 3:4) = [NaN NaN];
            endif
            ## Also update a, b, da and idx. Also mark first point outside sbox
            aa(ttnpr(ii)+idx(kk):ttnpr(ii)+idx(kk)+1) = 1;
            a = [ a(1:idx(kk)); 1; a(idx(kk)+1:end) ];
            b = [ b(1:idx(kk)); 1; b(idx(kk)+1:end) ];
          endif
          if (da(idx(kk)) < 0)
            ## Segment leaves bbox. Replace first outer point with NaN row
            valn(idx(kk)+2, :) = NaN (1, 6);
            ## Be sure to include NaN row
            a(idx(kk)+2) = 1;
          endif
        endfor
        ## Update valt, ttnpr
        valn = valn(find(a), :);
        if (! isempty (valn))
          ## Remove last NaN row if present
          if (all (isnan (valn(end, 1:2))))
            valn(end,:) = [];
          endif
          isn = 1;
          while (! isempty (isn))
            isn = find (isnan (valn(:, 1)));
            if (! isempty (isn))
              ## Insert new subfeature pointer. npart pointers are 0-based
              nprt = [ nprt isn(1) ];
              valn(isn(1), :) = [];
            endif
          endwhile
          ## Build up new points from top down
          valt = [ valn; valt ];
          ## nprt only gets non-empty if a polyline part was split up
          ## FIXME moet net als bij polygons
          ttnpr = [ ttnpr(1:ii) (nprt+ttnpr(ii)-1) ttnpr(ii+1:end) ];
        endif
      endif
    endfor
    tnpt = size (valt, 1);
    tnpr = ttnpr(1:end-1);
  endif

  ## There's still the possibility of segments crossing through Bounding Box
  ## w/o having points inside. Search these segments one by one
  cc = find (! aa);
  if (numel (cc) > 1)
    ## Find discontinuities; and merge wit tnpr (multipart) discontinuities
    ci = find (diff(cc) > 1)';
    ## Make sure to only include multipart discontinuities within range of cc
    ctnpr = unique ([max(btnpr, cc(1)-1) cc(ci)' min(cc(end), size (val, 1))]);
    ## Create sbx from sbox ([minx max miny maxy])
    sbx = [min(sbox(:, 1)), max(sbox(:, 1)), min(sbox(:, 2)), max(sbox(:, 2))];
    for ic=1:numel (ctnpr) - 1
      valc = val(ctnpr(ic)+1:ctnpr(ic+1), :);
      ## Eliminate segments that lie to one outside of the bounding box.
      ## Step 1: assess which side of the bounding box the segments lie
      f1 = valc(:, 1) < min (sbox(:, 1));
      f2 = valc(:, 1) > max (sbox(:, 1));
      f3 = valc(:, 2) < min (sbox(:, 2));
      f4 = valc(:, 2) > max (sbox(:, 2));
      ff = [f1'; f2' ; f3' ; f4']';
      ## Step 2: find those segments that cross > 2 extended sbox boundary line
      dd = find (sum ([abs(diff(f1)'); abs(diff(f2)'); ...
                       abs(diff(f3)'); abs(diff(f4)')]) > 1);
      ## If there are any vertices changing orientation w.r.t. bounding box:
      if (! isempty (dd))
        ## Create array of lines potentially crossing sbox
        lines = [];
        for ii=1:numel (dd)
          lines = [ lines; createLine(valc(dd(ii), 1:2), valc(dd(ii)+1, 1:2))];
        endfor
        ## For each of that segment, try to compute intersections with sbox
        for ii=1:numel (dd)
          ## clipLine is in OF geometry
          jntsc = reshape (clipLine (lines, sbx), 2, 2)';
          ## Check if there are any intersections at all
          if (! any (isnan (jntsc)))
            valn = [ jntsc NaN(2, 4) ];
            ## Interpolate M and Z values. valc(dd(ii)+1) also required ...
            dist = distancePoints (valc(dd(ii):dd(ii)+1, 1:2), valn(:, 1:2));
            ## ... for length of original segment:
            sl = sum (dist(:, 1));
            ## Find closest point of original segment
            valn(1, 3:4) = valc(dd(ii), 3:4) + dist(1, 1) / sl * ...
                           (valc(dd(ii)+1, 3:4) - valc(dd(ii), 3:4));
            valn(2, 3:4) = valc(dd(ii), 3:4) + dist(1, 2) / sl * ...
                           (valc(dd(ii)+1, 3:4) - valc(dd(ii), 3:4));
            ## Adapt tnpr
            tnpr = [ tnpr size(valt, 1) ];
            valt = [ valt; valn ];
          endif
        endfor
        tnpr = unique (tnpr);
      endif
    endfor
  endif
  
  valt(:, 5:6) = repmat (val(1, 5:6), size (valt, 1), 1);
  val = valt;

endfunction
