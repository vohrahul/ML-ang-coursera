## Copyright (C) 2015-2016 Philip Nienhuis
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
## @deftypefn {Function File} {@var{retval} =} __OCT_ods_getnmranges__ (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Philip Nienhuis <prnienhuis@users.sf.net>
## Created: 2015-09-19

function [nmr] = __OCT_ods_getnmranges__ (ods)

    fid = fopen (sprintf ("%s/content.xml", ods.workbook), "r");
    rxml = fread (fid, Inf, "char=>char").';
    fclose (fid);
    rxml = getxmlnode (rxml, "table:database-ranges", 1, 1);

    if (isempty (rxml))
      nmr = zeros (0, 3);
      return
    else
      nmr = cell (numel (strfind (rxml, "table:name=")), 3);
      en = 1;
      for ii=1:size (nmr, 1)
        [node, ~, en] = getxmlnode (rxml, "table:database-range", en);
        nmr{ii, 1} = getxmlattv (node, "table:name");
        ref = getxmlattv (node, "table:target-range-address");
        ref = reshape (strsplit (ref, {'.', ':'}), [], 2);
        nmr{ii, 2} = ref{1, 1};
        nmr{ii, 3} = strjoin (ref(2, :), ':');
      endfor
    endif

endfunction
