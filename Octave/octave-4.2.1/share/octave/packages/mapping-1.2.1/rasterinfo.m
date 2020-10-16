## Copyright (C) 2015 Philip Nienhuis
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
## @deftypefn {} {@var{rinfo} =} rasterinfo (@var{fname})
## Return various info about a GIS raster file: a.o., file type, bit
## depth, raster size, projection and geotransformation.  If the raster
## file is a geotiff file, additional info is returned.
##
## rasterinfo needs the GDAL library.
##
## @seealso{rasterread}
## @end deftypefn

## Author: Philip Nienhuis <prnienhuis@users.sf.net>
## Created: 2015-12-23

function [rinfo] = rasterinfo (fname)

  persistent HAVE_GDAL = [];
  
  ## Checks
  if (! ischar (fname))
    print_usage ();
  elseif (isempty (fname))
    print_usage ();
  elseif (exist (fname) != 2)
    error ("rasterinfo.m: file '%s' not found\n", fname);
  endif

  bands = info = {};

  ## Check if we have gdalread.oct installed (depends on GDAL)
  if (isempty (HAVE_GDAL))
    HAVE_GDAL = ! isempty (which ("gdalread"));
  endif
  if (! HAVE_GDAL)
    error ("rasterinfo.m: GDAL library is apparently not installed");
  endif

  ## Try to read data file
  [rstatus, binfo] = gdalread (fname, 0);
  if (! rstatus)
    ## Check if we have a geotiff file. If so, get extra info
    if (strcmpi (binfo.FileType, 'geotiff'))
      rinfo = imfinfo (fname);
      rinfo.FileType = binfo.FileType;
      rinfo.datatype_name = binfo.datatype_name;
      rinfo.GeoTransformation = binfo.GeoTransformation;
      rinfo.Projection = binfo.Projection;
    else
      rinfo = binfo;
      rinfo.Filename = canonicalize_file_name (fname);
      rinfo.FileSize = stat (fname).size;
      rinfo.FileModDate = strftime ("%d-%b-%y %H:%M:%S", localtime (stat (fname).mtime));
    endif
  endif

endfunction
