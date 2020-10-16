function resu = numel(df)
  %# function resu = numel(df)
  %# This is numel operator for a dataframe object.

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

  switch nargin
    case 1
      resu = prod (df._cnt);
    otherwise
      error (print_usage ());
  endswitch

endfunction

function usage = print_usage()
  usage = strcat ('Invalid call to numel.  Correct usage is: ', ' ', ...
                  '-- Overloaded Function:  numel (A)');
endfunction
