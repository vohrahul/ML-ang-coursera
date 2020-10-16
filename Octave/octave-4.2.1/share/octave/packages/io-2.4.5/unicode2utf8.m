## Copyright (C) 2016 Markus Mützel
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
## @deftypefn {} {[@var{ostr}, @var{error_flag}] =} unicode2utf8 (@var{ustr})
## Encode (1-byte) Unicode string @var{ustr} into UTF-8 @var{ostr}.
##
## UTF-8 characters with more than 2 bytes are dropped since Octave does not
## support characters >255.
## If an error occured @var{error_flag} is set to true.
## @end deftypefn

## Author: Markus Mützel <markus.muetzel@gmx.de>
## Created: 2016-10-12

function [ostr, error_flag] = unicode2utf8 (ustr="")

  error_flag = false;
  ustr = uint8 (ustr); # convert char to uint8
  ichar = 1;
  ostr = uint8 ([]);
  for (ichar = 1:numel (ustr))
    if (ustr(ichar) < 128)
      ## single byte character
      ostr(end+1) = ustr(ichar);
    elseif (ustr(ichar) < 2048)
      ## double byte character
      ostr(end+1) = 192 + bitshift (bitand (192, ustr(ichar)), -6);
      ostr(end+1) = 128 + bitand (63, ustr(ichar));
    else
      ## Should never reach here because ustr is cast to uint8
      error_flag = true;
    endif
  endfor
