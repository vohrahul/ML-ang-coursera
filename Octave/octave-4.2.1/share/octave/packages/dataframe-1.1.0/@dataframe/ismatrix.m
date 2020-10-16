function resu = ismatrix(df)
  %# function resu = ismatrix(df)
  %# returns true if the dataframe can be converted to a matrix

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

  df_is_num  = isnumeric(df._data{1});
  df_is_char = ischar(df._data{1});
  for indi = df._cnt(2):-1:2,
    df_is_num  = df_is_num & isnumeric(df._data{indi});
    df_is_char = df_is_char & ischar(df._data{indi});
  endfor
  
  resu = df_is_num | df_is_char;

endfunction