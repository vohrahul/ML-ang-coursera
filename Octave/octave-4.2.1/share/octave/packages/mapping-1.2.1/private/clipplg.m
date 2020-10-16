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
## @deftypefn {Function File} [@var{val}, @var{npts}, @var{pptr}] = clipplg (@var{val}, @var{npts}, @var{pptr}, @var{sbox}[, @var{styp]})
## Undocumented internal function for clipping polygons & interpolating Z & M
## values.
##
## @seealso{}
## @end deftypefn

## Author: Philip Nienhuis <prnienhuis@users.sf.net>
## Created: 2014-11-18
## Updates:
## 2014-11-22 Create stanza for finding back vertices and interpolating Z & M
## 2014-11-25 Fix interpolating M & Z values, properly treat new corner points
##            of clipped polygons
## 2014-11-26 Update tnpt and tnpr arrays
## 2015-07-10 Provision for segments crossed twice by clipping polygon

function [val, tnpt, tnpr] = clipplg (val, tnpt, tnpr, sbox, styp=5)

  ## Indices to start of each subfeature, plus end+1
  tnprt = [(tnpr + 1) tnpt+1];

  ## Initialize total number of clipped vertices
  tnptclp = 0;
  tnprclp = cell (numel (tnpr, 1));

  for kk=1:numel (tnpr)
    ## Work from end back to start of subfeatures to avoid mixing up index arrays
    jj = numel (tnpr) - kk + 1;
    ## Select rows belonging to this partial feature. First save non-selected rows
    b_val = e_val = [];
    if (jj > 1)
      ## There's one or more subfeatures lower down
      b_val = val(1:tnprt(jj)-1, :);
    endif
    if (jj < numel (tnpr))
      ## There's one or more subfeatures higher up
      e_val = val(tnprt(jj+1):end, :);
    endif
    tval = val(tnprt(jj):tnprt(jj+1)-1, :);
    ## oc_polybool is in OF geometry package
    [X, Y, npol, b, c] = oc_polybool (tval(:, 1:2), sbox, 'AND');

    ## Initialize new number of points & new part pointers in clipped polygon(s)
    nptclp = 0;
    nprclp = 0;
    valn = [];
    if (npol)
      ## Make an XY matrix, remove NaNs on upper and lower row
      valc = [X Y](2:end-1, :);
      ## Augment NaNs for Z and M, and augment type + shape record index columns
      ncl = size (valc, 1);
      valc = [ valc NaN(ncl, 2) tval(1, 5)*ones(ncl, 1) tval(1, 6)*ones(ncl, 1) ];
      ## Pointers to subpolygons resulting from clipping
      ipt = find (isnan (valc(:, 1)))';
      ipt = [ 0 ipt (size (valc, 1) + 1) ];
      ## For each new polygon...
      for ipol=1:npol
        valn = valc(ipt(ipol)+1:ipt(ipol+1)-1, :);
        ## Update total number of points in clipped polygon(s)
        nptclp += size (valn, 1);
        tnptclp += size (valn, 1);
        ## Add a new 0-based pointer to next part
        nprclp = [ nprclp nptclp ];
        ## Compute all interdistances. distancePoints is in OF geometry package
        ## Avoid polygon end point ( = start point)
        dsts = distancePoints (valn(1:end-1, 1:2), tval(1:end-1, 1:2));
        ## Find matching points in sub and out polygon (row, col)
        [rw, cl] = ind2sub (size (dsts), find (abs (dsts) < eps));
        ## Transfer known Z and M-values
        valn(rw, 3:4) = tval(cl, 3:4);
        ## cl indices refer to original shape, rw indices to clipped shape
        if (numel (cl) >= 1)
          ## Separate polygon segments clipped, or vertex on bounding box side
          ## For each valn row coords not in tval, interpolate Z and M values
          im = setdiff ([1:size(valn, 1)-1], rw);
          ## mi equals cl filled with zeros for non-matches, to easen indexing
          mi = zeros (1, size (valn, 1) - 1);
          mi(rw) = cl; 
          ## Find direction of polyline
          pdir = find (abs (diff (rw)) - 1 < eps);
          if (isempty (pdir))
            ## Single point within bounding box. Direction doesn't matter then
            drctn = 1;
          else
            drctn = sign (diff (rw([pdir pdir+1])))(1);
          endif
          for ii=1:numel (im)
            ## Get matching outer vertex. Below IF-ELSEIF order = critical to
            ## avoid index out-of-range errors
            if (im(ii) == 1)
              ## Clipped off outer vertex = previous in tval. diff(cl) = direction
              intpl = true;
              idx = mi(im(ii)+1) - drctn;
              ovtx = tval(idx, :);
              cvtx = tval(mi(im(ii)+1), :);
            elseif ((! ismember (im(ii)-1, rw)) && (! ismember (im(ii)+1, rw)))
              ## Probably a corner point. Just retain NaN values
              intpl = false;
            elseif (! ismember (im(ii)-1, rw))
              ## Clipped off outer vertex = previous in tval. diff(cl) = direction
              intpl = true;
              idx = mi(im(ii)+1) - drctn;
              ovtx = tval(idx, :);
              cvtx = tval(mi(im(ii)+1), :);
            elseif (! ismember (im(ii)+1, rw))
              ## Clipped off outer vertex = next in tval. diff(cl) = direction
              intpl = true;
              idx = mi(im(ii)-1) + drctn;
              ovtx = tval(idx, :);
              cvtx = tval(mi(im(ii)-1), :);
            endif
            ## Parent points found, now interpolate M and Z (if appropriate)
            if (intpl && styp > 5)
              ## Compute missing M and Z values. Invoke largest diff of X/Y coordinates
              difx = abs (cvtx(1) - ovtx(1));
              dify = abs (cvtx(2) - ovtx(2));
              if (difx > dify)
                ## X distance is greater
                fac = (valn(im(ii), 1) - cvtx(1)) / difx;
              else
                ## Y distance is greater
                fac = (valn(im(ii), 2) - cvtx(2)) / dify;
              endif
              fac = abs(fac);
              ## FIXME a debug stmt to detect wrong interpolation => wrong vertices
              if (fac > 1.0)
                printf ("Oops - fac > 1..\n");
           %     keyboard
              endif
              if (isfinite (ovtx(3)))
                valn(im(ii), 3) = fac * (ovtx(3) - cvtx(3)) + cvtx(3); ## Z-value
              endif
              if (isfinite (ovtx(4)))
                valn(im(ii), 4) = fac * (ovtx(4) - cvtx(4)) + cvtx(4); ## M-value
              endif
            endif
          endfor
          ## Remove last nprclp entry and temporarily store it in a cell arr
          tnprclp(jj) = nprclp;

        elseif (numel (cl) == 0)
          ## One polygon segment clipped twice. Simply assign nearest Z & M values
          ## FIXME proper interpolation required
          ## Find points interpolated on segment(s); they're not in sbox
          [im, ix] = min (distancePoints (sbox(1:end-1, :), valn(1:end-1, 1:2)));
          im = find (im > 0);
          ix = ix(im);
          ## Find nearest polygon points (could be on another polygon segment !)
          [~, ix] = min (distancePoints (tval(1:end-1, 1:2), valn(im, 1:2)));
          ## Assign Z and M values
          valn(im, 3:4) = tval(ix, 3:4);
          ## Remove last nprclp entry and temporarily store it in a cell arr
          tnprclp(jj) = nprclp;

        endif
        ## Last row of polygon equals first
        valn(end, :) = valn(1, :);
        ## Augment new polygon after (yet untouched) previous polygons
        b_val = [ b_val; valn ];

      endfor                                                ## clipped subpolygons

    else
      ## No intersection at all. Just drop tval
      % tnprclp = {};
    endif

    val = [b_val ; e_val];
    tnprt(jj+1:end) -= tnprt(jj+1) - tnprt(jj) - size (valn, 1);
    if (isempty (valn))
      ## This subfeature has no points in boundingbox +> drop from list
      tnprt(jj+1) = [];
    endif

  endfor

  ## Adapt & clean up npt
  tnpt = tnptclp;
  ## Adapt & clean up npr. Concatenate all pointers created by oc_polybool
  tnpr = [ tnprclp{1} ];
  for ii=2:numel (tnprclp)
    ## Skip empty entries
    if (! isempty (tnprclp{ii}))
      tnpr = [tnpr(1:end-1) (tnprclp{ii} + tnpr(end)) ];
    endif
  endfor
  if (! isempty (tnpr))
    tnpr(end) = [];
  endif

endfunction
