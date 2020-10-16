function resu = nth_element(df, n, dim)
  %# function resu = nth_element(x, n, dim)
  %# This is a wrapper for the real nth_element

  %% Copyright (C) 2009-2012 Pascal Dupuis <Pascal.Dupuis@uclouvain.be>
  %%
  %% This file is part of Octave.
  %%
  %% Octave is free software; you can redistribute it and/or
  %% modify it under the terms of the GNU General Public
  %% License as published by the Free Software Foundation;
  %% either version 2, or (at your option) any later version.
  %%
  %% Octave is distributed in the hope that it will be useful,
  %% but WITHOUT ANY WARRANTY; without even the implied
  %% warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
  %% PURPOSE.  See the GNU General Public License for more
  %% details.
  %%
  %% You should have received a copy of the GNU General Public
  %% License along with Octave; see the file COPYING.  If not,
  %% write to the Free Software Foundation, 51 Franklin Street -
  %% Fifth Floor, Boston, MA 02110-1301, USA.
  
  %#
  %# $Id$
  %#

  if (~isa (df, 'dataframe'))
    resu = []; return;
  endif

  if (nargin < 3)
     %# default: operates on the first non-singleton dimensio
     resu = df._cnt;
     dim = find (resu > 1); 
     dim = dim(1)
  endif

   switch dim
    case {1}
      resu = df_colmeta (df);
      for indi = (1:df._cnt(2))
        resu._data{indi} = feval (@nth_element, df._data{indi}(:, df._rep{indi}), n, dim);
        resu._rep{indi} = 1:size (resu._data{indi}, 2);
      endfor
      resu._cnt(1) = max (cellfun ('size', resu._data, 1));
      if (resu._cnt(1) == df._cnt(1))
        %# the func was not contracting
        resu._ridx = df._ridx;
        resu._name{1} = resu._name{1}; resu._over{1} = resu._over{1};
      endif
    case {2}
      error ('Operation not implemented');
    case {3}
      resu = df_allmeta(df);
      for indi = (1:df._cnt(2))
        resu._data{indi} = feval (@nth_element, df._data{indi}(:, df._rep{indi}), n, dim-1);
        resu._rep{indi} = 1:size (resu._data{indi}, 2);
      endfor
    otherwise
      error ("Invalid dimension %d", dim); 
  endswitch
  
  resu = df_thirddim (resu);
  
endfunction
