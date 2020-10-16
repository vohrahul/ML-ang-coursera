## Copyright (C) 2009-2016 Philip Nienhuis
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
## @deftypefn {Function File} [@var{numarr}, @var{txtarr}, @var{rawarr},  @var{limits}] = odsread (@var{filename})
## @deftypefnx {Function File} [@var{numarr}, @var{txtarr}, @var{rawarr}, @var{limits}] = odsread (@var{filename}, @var{wsh})
## @deftypefnx {Function File} [@var{numarr}, @var{txtarr}, @var{rawarr}, @var{limits}] = odsread (@var{filename}, @var{wsh}, @var{range})
## @deftypefnx {Function File} [@var{numarr}, @var{txtarr}, @var{rawarr}, @var{limits}] = odsread (@var{filename}, @var{wsh}, @var{range}, @var{reqintf})
##
## Read data contained in cell range @var{range} in worksheet @var{wsh}
## in OpenOffice_org Calc spreadsheet file @var{filename}.  Reading
## Gnumeric xml files is also supported.
##
## @var{filename} should include the filename extension (e.g., .ods).
##
## @var{wsh} is either numerical or text, in the latter case it is 
## case-sensitive and it should conform to OpenOffice.org Calc or
## Gnumeric sheet name requirements.
## Note that in case of a numerical @var{wsh} this number refers to the
## position in the worksheet stack, counted from the left in a Calc
## window.  The default is numerical 1, i.e. the leftmost worksheet
## in the Calc file.
##
## @var{range} is expected to be a regular spreadsheet range format,
## or "" (empty string, indicating all data in a worksheet).
## If no range is specified the occupied cell range will have to be
## determined behind the scenes first; this can take some time.
## Instead of a spreadsheet range a Named range defined in the
## spreadsheet file can be used as well. In that case the Named range
## should be specified as 3rd argument and the value of 2nd argument
## @var{wsh} doesn't matter as the worksheet associated with the
## specified Named range will be used.
##
## If only the first argument is specified, odsread will try to read
## all contents from the first = leftmost (or the only) worksheet (as
## if a range of @'' (empty string) was specified).
## 
## If only two arguments are specified, odsread assumes the second
## argument to be @var{wsh} and to refer to a worksheet.  In that case
## odsread tries to read all data contained in that worksheet.
##
## The optional last argument @var{reqintf} can be used to override 
## the automatic selection by odsread of one interface out of the
## supported ones: Java/ODFtoolkit ('OTK'), Java/jOpenDocument 
## ('JOD'), Java/UNO bridge ('UNO'), or native Octave (OCT). Octave
## selects one of these, preferrably in the order above, based on
## presence of support software and the file at hand.
##
## Return argument @var{numarr} contains the numeric data, optional
## return arguments @var{txtarr} and @var{rawarr} contain text strings
## and the raw spreadsheet cell data, respectively, and @var{limits} is
## a struct containing the data origins of the various returned arrays.
##
## Erroneous data and empty cells are set to NaN in @var{numarr} and
## turn up empty in @var{txtarr} and @var{rawarr}.  Date/time values
## in date/time formatted cells are returned as numerical values in
## @var{obj} with base 1-1-0000.  Note that OpenOfice.org and MS-Excel
## have different date base values (epoch; 1/1/0000 & 1/1/1900, resp.)
## and internal representation so MS-Excel spreadsheets rewritten into
## .ods format by OpenOffice.org Calc may have different date base
## values than expected.
## As there's no gnumeric formula evaluator and gnumeric doesn't store
## cached formula results, formulas are returned as text strings when
## reading from Gnumeric files.
##
## @var{numarr} and @var{txtarr} are trimmed from empty outer rows
## and columns, so any returned array may turn out to be smaller than
## requested in @var{range}.
##
## When reading from merged cells, all array elements NOT corresponding 
## to the leftmost or upper spreadsheet cell will be treated as if the
## "corresponding" cells are empty.
##
## A native Octave interface (OCT) is available, but presently still
## experimental; it offers .gnumeric read support as well.
## For ODS only the supported Java-based interfaces offer more flexibility
## and better speed.  For those you need a Java JRE or JDK and one or both
## of jopendocument-<version>.jar or preferrably: (odfdom.jar (versions
## 0.7.5 or 0.8.6-0.8.8) & xercesImpl.jar v. 2.9.1) in your javaclasspath.
## There is also experimental support invoking OpenOffice.org/LibreOffice
## or clones through a Java/UNO bridge.  For Octave older than 3.8.0 the
## octave-forge Java package >= 1.2.9 is required then; newer Octave versions
## should have Java support built-in.
##
## odsread,m is just a wrapper for a collection of scripts that find out
## the interface to be used and do the actual reading.  For each call
## to odsread the interface must be started and the spreadsheet file read into
## memory.  When reading multiple ranges (in optionally multiple worksheets)
## a significant speed boost can be obtained by invoking those scripts
## directly (odsopen / ods2oct [/ parsecell] / ... / odsclose).  This also 
## offers more flexibility (e.g. formula results or the formulas
## themselves; stripping output arrays from empty enveloping rows/columns).
##
## Examples:
##
## @example
##   A = odsread ('test4.ods', '2nd_sheet', 'C3:AB40');
##   (which returns the numeric contents in range C3:AB40 in worksheet
##   '2nd_sheet' from file test4.ods into numeric array A) 
## @end example
##
## @example
##   [An, Tn, Ra, limits] = odsread ('Sales2009.ods', 'Third_sheet');
##   (which returns all data in worksheet 'Third_sheet' in file test4.ods
##   into array An, the text data into array Tn, the raw cell data into
##   cell array Ra and the ranges from where the actual data came in limits)
## @end example
##
## @seealso {odsopen, ods2oct, oct2ods, odsclose, odswrite, odsfinfo, parsecell}
##
## @end deftypefn

## Author: Philip Nienhuis <prnienhuis at users.sf.net>
## Created: 2009-12-12

function [ numarr, txtarr, rawarr, lim ] = odsread (filename, wsh=1, datrange=[], reqintf=[])

  if (! ischar (filename))
    error ("odsread: filename (text string) expected for argument #1, not a %s\n", class (filename));
  endif
  if (nargin < 1 || ! (strcmpi (".ods", filename(end-3:end)) || ...
                       strcmpi (".sxc", filename(end-3:end)) || ...
                       strcmpi (".gnumeric", filename(end-8:end))))
    error ("odsread: filename (incl. suffix) of a supported file type is required\n");
  endif

  ods = odsopen (filename, 0, reqintf);
  
  if (~isempty (ods))

    [rawarr, ods, rstatus] = ods2oct (ods, wsh, datrange);

    if (rstatus)
      [numarr, txtarr, lim] = parsecell (rawarr, ods.limits);
    else
      warning (sprintf ("No data read from %s.\n", filename));
      numarr = [];
    endif
  
    ods = odsclose (ods);

  endif

endfunction
