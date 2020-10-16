## Copyright (C) 2013,2014 Markus Bergholz
## Parts Copyright (C) 2013-2016 Philip Nienhuis
##
## This program is free software; you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 3 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with Octave; see the file COPYING.  If not, see
## <http://www.gnu.org/licenses/>.

## -*- texinfo -*- 
## @deftypefn {Function File} [ @var{raw}, @var{xls}, @var rstatus} ] = __OCT_xlsx2oct__ (@var{xlsx}, @var{wsh}, @var{range}, @spsh_opts)
## Internal function for reading data from an xlsx worksheet
##
## @seealso{}
## @end deftypefn

## Author: Markus Bergholz <markuman+xlsread@gmail.com>
## Created: 2013-10-04

function [ raw, xls, rstatus ] = __OCT_xlsx2oct__ (xls, wsh, crange='', spsh_opts)

  ## spsh_opts is guaranteed to be filled by caller

  ## If a worksheet if given, check if it's given by a name (string) or a number
  if (ischar (wsh))
    ## Search for requested sheet name
    id = find (strcmp (xls.sheets.sh_names, wsh));
    if (isempty (id))
      error ("xls2oct: cannot find sheet '%s' in file %s", wsh, xls.filename);
    else
      wsh = id;
    endif
  elseif (wsh > numel (xls.sheets.sh_names))
    error ("xls2oct: worksheet number %d > number of worksheets in file (%d)", wsh, numel (xls.sheets.sh_names));
  elseif (wsh < 1)
    warning ("xls2oct: illegal worksheet number (%d) - worksheet #1 assumed\n", wsh);
  endif

  ## Prepare to open requested worksheet file in subdir xl/ . 
  ## Note: Windows accepts forward slashes
  rawsheet = fopen (sprintf ('%s/xl/worksheets/sheet%d.xml', xls.workbook, wsh));
  if (rawsheet <= 0)
    # Try to open sheet from r:id in worksheets.rels.xml
    wsh       = xls.sheets.rels( xls.sheets.rels(:,1) == id ,2);
    rawsheet  = fopen (sprintf ('%s/xl/worksheets/sheet%d.xml', xls.workbook, wsh));
    if (rawsheet <= 0)
      error ("Couldn't open worksheet xml file sheet%d.xml\n", wsh);
    endif
  else
    ## Get data
    rawdata = fread (rawsheet, "char=>char").';
    fclose (rawsheet);
    ## Strings
    try
      fid = fopen (sprintf ("%s/xl/sharedStrings.xml", xls.workbook));
      strings = fread (fid, "char=>char").';
      fclose (fid);
    catch
      ## No sharedStrings.xml; implies no "fixed" strings (computed strings can
      ## still be present)
      strings = "";
    end_try_catch
  endif
  rstatus = 0;

  ## General note for tuning: '"([^"]*)"' (w/o single quotes) could be faster
  ## than '"(.*?)"'
  ## (http://stackoverflow.com/questions/2503413/regular-expression-to-stop-at-first-match comment #7)

  ## As to requested subranges: it's complicated to extract just part of a sheet;
  ## either way the entire sheet would need to be scanned for cell addresses
  ## before one can know what part of the sheet XML the requested range lives.
  ## In addition the endpoint cells of that range may not exist in the sheet XML
  ## (e.g., if they're empty).
  ## So we read *all* data and in the end just return the requested rectangle.

  ## 'val' are the actual values. 'valraw' are the corresponding(!) cell
  ## positions (e.g. B3).  They're extracted separately to avoid (rare cases of)
  ## out-of-phase regexp results that would screw up reshape().

  ## Below are loads of nested IFs. They're needed to catch empty previous
  ## results, even empty sheets.

  ## In below regexps, we ignore "cm"  and "ph" tags immediately after <c and
  ## a "vm" tag immediately after <t> tag. As soon as we hit them in the wild
  ## these can be added (at the cost of speed performance).

  ## 1. Get pure numbers, including booleans, double and boolean formula
  ## results, from cells w/o 's=""' tag
  val = cell2mat (regexp (rawdata, '<c r="\w+"(?: t="[bn]+")?>(?:<f.+?(?:</f>|/>))?<v(?:.*?)>(.*?)</v>', "tokens"));
  if (! isempty (val))
    valraw = cell2mat (regexp (rawdata, '<c r="(\w+)"(?: t="[bn]+")?>(?:<f.+?(?:</f>|/>))?<v(?:.*?)>.*?</v>', "tokens"));
  endif

  ## If val is still empty, try another regexpression (PRN: will this ever
  ## work? haven't seen such cells)
  if (numel (val) == 0)
    val = cell2mat (regexp (rawdata, '<c r="\w+" s="\d+"(?! t="s")><v(?:.*?)>(.*?)</v>', "tokens"));
    if (! isempty (val))
      valraw = cell2mat (regexp (rawdata, '<c r="(\w+)" s="\d+"(?! t="s")><v(?:.*?)>.*?</v>', "tokens"));
    endif
  endif

  ## If 'val' exist, check if there are tagged s="NUMBERS" values
  if (numel (regexp (rawdata, ' s="', "once")) > 0)
    ## Time/date values. Exclude formulas (having <f> </f>  of <f  /> tags),
    ## strings  ('t="s"') and error results ('t="e"')
    valp =            cell2mat (regexp (rawdata, '<c r="\w+" s="\d+"(?: t="[^se]*")?><v(?:.*?)>(.*?)</v>', "tokens"));
    if (! isempty (valp))
      valrawp = cell2mat(regexp (rawdata, '<c r="(\w+)" s="\d+"(?: t="[^se]*")?><v(?:.*?)>.*?</v>', "tokens"));
      if (! isempty (val))
        val =    [val    valp];
        valraw = [valraw valrawp];
      else
        val = valp;
        valraw = valrawp;
        clear valp valrawp ;
      endif
    endif
  endif
  ## Turn strings into numbers
  if (! isempty (val))
    val = num2cell (str2double (val));
  endif

  ## 2. String / text formulas (cached results are in this sheet; fixed strings
  ## in <sharedStrings.xml>)
  ## 2.A Formulas
  if (spsh_opts.formulas_as_text)

    ## Get formulas themselves as text strings. Formulas have no 't="s"' attribute. Keep starting '>' for next line
    valf1 = cell2mat (regexp (rawdata,     '<c r="\w+"(?: s="\d+")?(?: t="\w+")?><f(?: .*?)*(>.*?)</f>(?:<v(?:.*?)>.*?</v>)?', "tokens"));
    if (! isempty (valf1))
      valf1 = regexprep (valf1, '^>', '=');
      valrawf1 = cell2mat(regexp (rawdata, '<c r="(\w+)"(?: s="\d+")?(?: t="\w+")?><f(?: .*?)*>.*?</f>(?:<v(?:.*?)>.*?</v>)?', "tokens"));
      if (isempty (val))
        val = valf1;
      else
        ##  Formulas start with '=' so:
        val = [val valf1];
        valraw = [valraw valrawf1];
      endif
    endif
    clear valf1 valrawf1 ;
  else
    ## Get (cached) formula results. Watch out! as soon as a "t" attibute equals "b" or is missing it is a number
    ## First the non-numeric formula results
    valf2 = cell2mat (regexp (rawdata, '<c r="\w+" s="\d+" t="(?:[^sb]?|str)">(?:<f.+?(?:</f>|/>))<v(?:.*?)>(.*?)</v>', "tokens"));
    if (! isempty (valf2))
      valrawf2 = cell2mat(regexp (rawdata, '<c r="(\w+)" s="\d+" t="(?:[^sb]?|str)">(?:<f.+?(?:</f>|/>))<v(?:.*?)>.*?</v>', "tokens"));
      if (isempty (val))
        val = valf2;
        valraw = valrawf2;
      else
        val = [val valf2];
        valraw = [valraw valrawf2];
      endif
    endif
    clear valf2 valrawf2 ;
    ## Next the numeric formula results. These need additional conversion
    valf3 = cell2mat (regexp (rawdata, '<c r="\w+" s="\d+"(?: t="b")?>(?:<f.+?(?:</f>|/>))<v(?:.*?)>(.*?)</v>', "tokens"));
    if (! isempty (valf3))
      valrawf3 = cell2mat(regexp (rawdata, '<c r="(\w+)" s="\d+"(?: t="b")?>(?:<f.+?(?:</f>|/>))<v(?:.*?)>.*?</v>', "tokens"));
      if (isempty (val))
        val = num2cell(str2double (valf3));
        valraw = valrawf3;
      else
        val = [val num2cell(str2double (valf3))];
        valraw = [valraw valrawf3];
      endif
    endif
    clear valf3 valrawf3 ;
  endif

  ## 2.B. Strings
  if (! isempty (strings))
    ## Extract string values. May be much more than present in current sheet
    strings = regexp (strings, '<si[^>]*>.*?</si>', "match");
    if (! isempty (strings))
      for n = 1:columns(strings)
        ctext{1,n} = cell2mat (cell2mat (regexp (strings{1,n}, '<t[^>]*>(.*?)</t>', "tokens")));
      end
      ## Pointers into sharedStrings.xml. "Hard" (fixed) strings have 't="s"' attribute
      ## For reasons known only to M$ those pointers are zero-based, so:
      vals = str2double (cell2mat (regexp (rawdata, '<c r="\w+"(?: s="\d+")? t="s"><v(?:.*?)>(\d+)</v>', "tokens"))) + 1;
      if (! isempty (vals) && isfinite (vals))
        ## Get actual values. Watch out for empty strings
        vals = ctext(vals);
        ids = cellfun (@isempty, vals);
        if (any (ids))
          vals(ids) = {""};
        endif
        ## Cell addresses
        valraws = cell2mat (regexp (rawdata, '<c r="(\w+)"(?: s="\d+")? t="s"><v(?:.*?)>\d+</v>', "tokens"));
        if (isempty (val))
          val = vals;
          valraw = valraws;
        else
          val = [val vals];
          valraw = [valraw valraws];
        endif
      endif
    endif
    clear vals valraws ;
  endif

  ## If val is empty, sheet is empty
  if (isempty (val))
    xls.limits = [];
    raw = {};
    return
  endif

  ## 3. Prepare for assigning extracted values to output cell array
  ## Get the row numbers (currently supported from 1 to 999999)
  vi.row = str2double (cell2mat (regexp (valraw, '(\d+|\d+\d+|\d+\d+\d+|\d+\d+\d+\d+|\d+\d+\d+\d+\+d|\d+\d+\d+\d+\d+\d+)?', "match"))')';

  ## Get the column characters (A to ZZZ) (that are more than 18k supported cols)
  vi.alph = cell2mat (regexp (valraw, '([A-Za-z]+|[A-Za-z]+[A-Za-z]+|[A-Za-z]+[A-Za-z]+[A-Za-z]+)?', "match"));

  ## Free memory; might be useful while reading huge files
  clear valraw ;

  ## If missed formular indices
  idx.all = cell2mat (regexp (rawdata, '<c r="(\w+)"[^>]*><f', "tokens"));
  if (0 < numel (idx.all))
    idx.num = str2double (cell2mat (regexp (idx.all, '(\d+|\d+\d+|\d+\d+\d+|\d+\d+\d+\d+|\d+\d+\d+\d+\+d|\d+\d+\d+\d+\d+\d+)?', "match"))')';
    idx.alph = cell2mat (regexp (idx.all, '([A-Za-z]+|[A-Za-z]+[A-Za-z]+|[A-Za-z]+[A-Za-z]+[A-Za-z]+)?', "match"));
    idx.alph = double (cell2mat (cellfun (@col2num, vi.alph, "UniformOutput", 0)));
  else
    ## To prevent warnings or errors while calculating corresponding NaN matrix
    idx.num = [];
    idx.alph = [];
  end
  ## Transform column character to column number
  ## A -> 1; C -> 3, AB -> 28 ...
  vi.col = double (cell2mat (cellfun (@col2num, vi.alph, "UniformOutput", 0)));

  ## Find data rectangle limits
  idx.mincol = min ([idx.alph vi.col]);
  idx.minrow = min ([idx.num  vi.row]);
  idx.maxrow = max ([idx.num  vi.row]);
  idx.maxcol = max ([idx.alph vi.col]);

  ## Convey limits of data rectangle to xls2oct. Must be done here as first start
  xls.limits = [idx.mincol, idx.maxcol; idx.minrow, idx.maxrow];

  ## column adjustment when first number or formula don't begin in first column
  if (1 < idx.mincol)
        vi.col = vi.col - (idx.mincol - 1);
  endif
  ## row adjustment when first number or formular don't begin in first row
  if (1 < idx.minrow)
        vi.row = vi.row - (idx.minrow - 1);
  endif
  ## Initialize output cell array
  raw = cell (idx.maxrow - idx.minrow + 1, idx.maxcol - idx.mincol + 1);

  ## get logical indices for 'val' from 'valraw' positions in NaN matrix
  vi.idx = sub2ind (size (raw), (vi.row), (vi.col));
  ## set values to the corresponding indizes in final cell matrix
  raw(vi.idx) = val;

  ## Process requested cell range argument
  if (! isempty (crange))
    ## Extract only the requested cell rectangle (see comments higher up)
    [~, nr, nc, tr, lc] = parse_sp_range (crange);
    xls.limits = [max(idx.mincol, lc), min(idx.maxcol, lc+nc-1); ...
                  max(idx.minrow, tr), min(idx.maxrow, tr+nr-1)];
    ## Correct spreadsheet locations for lower right shift of raw
    rc = idx.minrow - 1;
    cc = idx.mincol - 1;
    raw = raw(xls.limits(2, 1)-rc : xls.limits(2, 2)-rc, ...
              xls.limits(1, 1)-cc : xls.limits(1, 2)-cc);
  endif

  if (! isempty (val))
    rstatus = 1;
  endif

endfunction
