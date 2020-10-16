function df = dataframe(x, varargin)
  
  %# -*- texinfo -*-
  %#  @deftypefn {Function File} @var{df} = dataframe(@var{x = []}, ...)
  %# This is the default constructor for a dataframe object, which is
  %# similar to R 'data.frame'. It's a way to group tabular data, then
  %# accessing them either as matrix or by column name.
  %# Input argument x may be: @itemize
  %# @item a dataframe => use @var{varargin} to pad it with suplemental
  %# columns
  %# @item a matrix => create column names from input name; each column
  %# is used as an entry
  %# @item a cell matrix => try to infer column names from the first row,
  %#   and row indexes and names from the two first columns;
  %# @item a file name => import data into a dataframe;
  %# @item a matrix of char => initialise colnames from them.
  %# @item a two-element cell: use the first as column as column to
  %# append to,  and the second as initialiser for the column(s)
  %# @end itemize
  %# If called with an empty value, or with the default argument, it
  %# returns an empty dataframe which can be further populated by
  %# assignement, cat, ... If called without any argument, it should
  %# return a dataframe from the whole workspace. 
  %# @*Variable input arguments are first parsed as pairs (options, values).
  %# Recognised options are: @itemize
  %# @item rownames : take the values as initialiser for row names
  %# @item colnames : take the values as initialiser for column names
  %# @item seeked : a (kept) field value which triggers start of processing.
  %# @item trigger : a (unkept) field value which triggers start of processing.
  %# @item datefmt: date format, see datestr help 
  %# Each preceeding line is silently skipped. Default: none
  %# @item unquot: a logical switch telling wheter or not strings should
  %# be unquoted before storage, default = true;
  %# @item sep: the elements separator, default '\t,'
  %# @item conv: some regexp to convert each field. This must be a
  %# two-elements cell array containing regexprep() second (@var{PAT})
  %# and third (@var{REPSTR}) arguments. In order to replace ',' by '.',
  %# use "@{',', '.'@}". In this case, the default separator is adjusted to '\t;'
  %# @end itemize
  %# The remaining data are concatenated (right-appended) to the existing ones.
  %# @end deftypefn

  %% Copyright (C) 2009-2014 Pascal Dupuis <cdemills@gmail.com>
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

if (0 == nargin)
  %# default constructor: create a scalar struct and initialise the
  %# fields in the right order
  df = struct ('_cnt',  [0 0]);
  %# do not call "struct" with the two next args: it would create an array
  df._name = {cell(0, 1), cell(1, 0)}; %# rows - cols 
  df._over = cell (1, 2);
  df._ridx = [];  
  df._data = cell (0, 0);
  df._rep = cell (0, 0);   %# a repetition index
  df._type = cell (0, 0);  %# the type of each column
  df._src = cell (0, 0);
  df._header = cell (0, 0);
  df._cmt = cell (0, 0);   %# to put comments
  df = class (df, 'dataframe');
  return
endif

if (isnull (x) && 1 == nargin)
  disp ('FIXME -- should create a dataframe from the whole workspace')
  df = dataframe ();  %# just call the default constructor
  return
endif

if (isa (x, 'dataframe'))
  %# Try to append whatever data or metadata given through varargin
  %# into this dataframe 
  df = x;
else
  df = dataframe (); %# get the right fields
  if (isa (x, 'struct'))
    %# only accept a struct if it has the same fieldnames as a dataframe
    dummy = fieldnames (x);     
    indi = fieldnames (df);
    if (size (dummy, 1) ~= size (indi, 1))
      error ('First argument of dataframe is a struct with the wrong number of fields');
    endif
    if (~all (cellfun (@strcmp, dummy, indi)))
      error ('First argument of dataframe is a struct with wrong field names');
    endif
    %# easy way to transform a struct into a dataframe object
    df = class (x, 'dataframe');
    if (1 == nargin) return; endif  
  endif
endif

%# default values
seeked = ''; trigger = ''; unquot = true; default_sep = "\t,"; sep = "";
cmt_lines = []; conv_regexp = {}; datefmt = ''; verbose = false;

if (length (varargin) > 0)      %# extract known arguments
  indi = 1;
  %# loop over possible arguments
  while (indi <= size (varargin, 2))
    if (isa (varargin{indi}, 'char'))
      switch(varargin{indi})
        case 'rownames'
          switch class (varargin{indi+1})
            case {'cell'}
              df._name{1} = varargin{indi+1};
            case {'char'}
              df._name{1} = cellstr (varargin{indi+1});
            otherwise
              df._name{1} = cellstr (num2str (varargin{indi+1}));
          endswitch
          df._name{1} = genvarname (df._name{1});
          df._over{1}(1, 1:length (df._name{1})) = false;
          df._cnt(1) = size (df._name{1}, 1);
          df._ridx = (1:df._cnt(1))';
          varargin(indi:indi+1) = [];
        case 'colnames'
          switch class(varargin{indi+1})
            case {'cell'}
              df._name{2} = varargin{indi+1};
            case {'char'}
              df._name{2} = cellstr (varargin{indi+1});
            otherwise
              df._name{2} = cellstr (num2str (varargin{indi+1}));
          endswitch
          %# detect assignment - functions calls - ranges
          dummy = cellfun ('size', cellfun (@(x) strsplit (x, ":=("), df._name{2}, ...
                                           "UniformOutput", false), 2);
          if (any (dummy > 1))
            warning ('dataframe colnames taken literally and not interpreted');
          endif
          df._name{2} = genvarname (df._name{2});
          df._over{2}(1, 1:length (df._name{2})) = false;
          varargin(indi:indi+1) = [];
        case 'seeked'
          seeked = varargin{indi + 1};
          varargin(indi:indi+1) = [];
        case 'trigger'
          trigger = varargin{indi + 1};
          varargin(indi:indi+1) = [];
        case 'unquot'
          unquot = varargin{indi + 1};
          varargin(indi:indi+1) = [];
        case 'sep'
          sep = varargin{indi + 1};
          varargin(indi:indi+1) = [];
        case 'conv'
          conv_regexp = varargin{indi + 1};
          varargin(indi:indi+1) = [];
        case 'datefmt'
          datefmt = varargin{indi + 1};
          varargin(indi:indi+1) = [];
        case 'verbose'
          verbose = varargin{indi + 1};
          varargin(indi:indi+1) = [];
        case '--'
          %# stop processing args -- take the rest as filenames
          varargin(indi) = [];
          break;
        otherwise %# FIXME: just skip it for now
          disp (sprintf ("Ignoring unkown argument %s", varargin{indi}));
          indi = indi + 1;    
      endswitch
    else
      indi = indi + 1;    %# skip it
    endif         
  endwhile
endif

if (isempty (sep))
  sep = default_sep;
  if (~isempty (conv_regexp))
    if (any (~cellfun (@isempty, (strfind (conv_regexp, ',')))))
      sep = "\t;"; %# locales where ',' is used as decimal separator
    endif
  endif
endif

if (~isempty (datefmt))
  %# replace consecutive spaces by one
  datefmt =  regexprep (datefmt, '[ ]+', ' ');
  %# is "space" used as separator ? Then we may take more than one field. 
  if (~isempty (regexp (sep, ' ')))
    datefields = 1 + length (regexp (datefmt, ' '));
  else
    datefields = 1; 
  endif
else
  datefields = 1;
endif

if (~isempty (seeked) && ~isempty (trigger))
  error ('seeked and trigger are mutuallly incompatible arguments');
endif

indi = 0;
while (indi <= size (varargin, 2))
  indi = indi + 1;
  if (~isa (x, 'dataframe'))
    if (isa (x, 'char') && size (x, 1) < 2)
      dummy = tilde_expand (x);
      try
        %# read the data frame from a file
        df._src{end+1, 1} = dummy;
        x = load (dummy);
      catch
        %# try our own method
        UTF8_BOM = char ([0xEF 0xBB 0xBF]);
        %# Is it compressed ?
        cmd = []; count = regexpi (dummy, '\.gz');
        if (length (dummy) - count == 2)
          cmd = ['gzip -dc '];
        else
          count = regexpi (dummy, '\.bz2');
          if (length (dummy) - count == 3)
            cmd = ['bzip2 -dc '];
          else
            count = regexpi (dummy, '\.xz');
            if (length (dummy) - count == 2)
              cmd = ['xz -dc '];
            else
              count = regexpi (dummy, '\.zip');
              if (length (dummy) - count == 3)
                cmd = ['unzip -p '];
              else
                count = regexpi (dummy, '\.lzo');
                if (length (dummy) - count == 3)
                  cmd = ['lzop -dc '];
                endif
              endif
            endif
          endif
        endif
        
        if (isempty (cmd)) %# direct read
          [fid, msg] = fopen (dummy, 'rt');
        else
          %# The file we read from external process must be seekable !!!
          tmpfile = tmpnam (); 
          %# quote to protect from spaces in the name
          dummy = strcat ('''', dummy, '''');
          cmd = [cmd, dummy,  ' > ',  tmpfile];
          if (exist ('OCTAVE_VERSION', 'builtin'))
            [output, status] = system (cmd);
          else
            [status, output] = system (cmd);
          endif 
          if (not (0 == status))
            disp (sprintf ("%s exited with status %d", cmd, status));
          endif
          fid = fopen (tmpfile, 'rt');
          if (exist ('OCTAVE_VERSION', 'builtin'))
            [cmd, status] = unlink (tmpfile);
          else
            delete (tmpfile)
          endif
        endif
        
        unwind_protect
          in = [];
          if (fid ~= -1)
            dummy = fgetl (fid);
            if (-1 == dummy)
              x = []; %# file is valid but empty
            else  
              if (~strcmp (dummy, UTF8_BOM))
                frewind (fid);
              endif
              %# slurp everything and convert doubles to char, avoiding
              %# problems with char > 127
              in = char (fread (fid).');
            endif 
          endif
        unwind_protect_cleanup
          if (fid ~= -1) fclose (fid); endif
        end_unwind_protect
        
        if (~isempty (in))
          %# explicit list taken from 'man pcrepattern' -- we enclose all
          %# vertical separators in case the underlying regexp engine
          %# doesn't have them all.
          eol = '(\r\n|\n|\v|\f|\r|\x85)';
          %# cut into lines -- include the EOL to have a one-to-one
            %# matching between line numbers. Use a non-greedy match.
          lines = regexp (in, ['.*?' eol], 'match');
          %# spare memory
          clear in;
          try
            dummy =  cellfun (@(x) regexp (x, eol), lines); 
          catch  
            disp('line 245 -- binary garbage in the input file ? '); keyboard
          end
          %# remove the EOL character(s)
          lines(1 == dummy) = {""};
          %# use a positive lookahead -- eol is not part of the match
          lines(dummy > 1) = cellfun (@(x) regexp (x, ['.*?(?=' eol ')'], ...
                                                   'match'), lines(dummy > 1));
          %# a field either starts at a word boundary, either by + - . for
          %# a numeric data, either by ' for a string. 
          
          %# content = cellfun(@(x) regexp(x, '(\b|[-+\.''])[^,]*(''|\b)', 'match'),\
          %# lines, 'UniformOutput', false); %# extract fields
          
          if (strfind (sep, ' '))
            content = cellfun (@(x) strsplit (x, sep, true), lines, ...
                               'UniformOutput', false); %# extract fields  
          else
            content = cellfun (@(x) strsplit (x, sep), lines, ...
                               'UniformOutput', false); %# extract fields 
          endif
          %# spare memory
          clear lines;

          indl = 1; indj = 1; dummy = []; 
          
          if (~isempty (seeked))
            while (indl <= length (content))
              dummy = content{indl};
              if (all (cellfun ('size', dummy, 2) == 0))
                indl = indl + 1; 
                continue;
              endif
              if (all (cellfun (@isempty, regexp (dummy, seeked, 'match')))) 
                if (isempty (df._header))
                  df._header =  dummy;
                else
                  df._header(end+1, 1:length (dummy)) = dummy;
                endif
                indl = indl + 1;
                continue;
              endif
              break;
            endwhile
          elseif (~isempty (trigger))
            while (indl <= length (content))
              dummy = content{indl};
              indl = indl + 1;
              if (all (cellfun ('size', dummy, 2) == 0))
                continue;
              endif
              if (isempty (df._header))
                 df._header =  dummy;
              else
                df._header(end+1, 1:length (dummy)) = dummy;
              endif
              if (all (cellfun (@isempty, regexp (dummy, trigger, 'match'))))
                continue;       
              endif
              break;
            endwhile
          else
            dummy = content{1}; %# rough guess
          endif

          if (indl > length (content))
             x = []; 
          else
            x = cell (1+length (content)-indl, size (dummy, 2)); 
            empty_lines = []; cmt_lines = [];
            while (indl <= length (content))
              dummy = content{indl};
              if (all (cellfun ('size', dummy, 2) == 0))
                empty_lines = [empty_lines indj];
                indl = indl + 1; indj = indj + 1;
                continue;
              endif
              %# does it looks like a comment line ?
              if (regexp (dummy{1}, ['^\s*' char(35)]))
                empty_lines = [empty_lines indj];
                cmt_lines = strvcat (cmt_lines, horzcat (dummy{:}));
                indl = indl + 1; indj = indj + 1;
                continue;
              endif
              
              if (all (cellfun (@isempty, regexp (dummy, trigger, 'match'))))
                %# it does not look like the trigger. Good.
                %# try to convert to float
                if (~ isempty(conv_regexp))
                  dummy = regexprep (dummy, conv_regexp{});
                endif
                the_line = cellfun (@(x) sscanf (x, "%f"), dummy, ...
                                    'UniformOutput', false);
                
                indk = 1; indm = 1;
                while (indk <= size (the_line, 2))
                  if (isempty (the_line{indk}) || any (size (the_line{indk}) > 1)) 
                    %#if indi > 1 && indk > 1, disp('line 117 '); keyboard; %#endif
                    if (isempty (dummy {indk}))
                      %# empty field, just don't care
                      indk = indk + 1; indm = indm + 1;
                      continue;
                    endif
                    if (unquot)
                      try
                        %# remove quotes and leading space(s)
                        x(indj, indm) = regexp (dummy{indk}, '[^''" ].*[^''"]', 'match'){1};
                      catch
                        %# if the previous test fails, try a simpler one
                        in = regexp (dummy{indk}, '[^'' ]+', 'match');
                        if (~isempty (in))
                          x(indj, indm) = in{1};
                        %# else
                        %#    x(indj, indk) = [];
                        endif
                      end_try_catch
                    else
                      %# no conversion possible, store and remove leading space(s)
                      x(indj, indm) = regexp (dummy{indk}, '[^ ].*', 'match');
                    endif
                  elseif (~isempty (regexp (dummy{indk}, '[/:-]')) && ...
                          ~isempty (datefmt))
                    %# does it look like a date ?
                    datetime = dummy{indk}; 
                    
                    if (datefields > 1)             
                      %# concatenate the required number of fields 
                      indc = 1;
                      for indc = (2:datefields)
                        datetime = cstrcat(datetime, ' ', dummy{indk+indc-1});
                      endfor
                    else
                      %# ensure spaces are unique
                      datetime =  regexprep (datetime, '[ ]+', ' ');
                    endif
                    
                    try
                      datetime = datevec (datetime, datefmt);
                      timeval = struct ("usec", 0, "sec", floor (datetime (6)),
                                        "min", datetime(5), "hour", datetime(4),
                                        "mday", datetime(3), "mon", datetime(2)-1,
                                        "year", datetime(1)-1900);
                      timeval.usec = 1e6*(datetime(6) - timeval.sec);
                      x(indj, indm) =  str2num (strftime ([char(37) 's'], timeval)) + ...
                                       timeval.usec * 1e-6;
                      if (datefields > 1)
                        %# skip fields successfully converted
                        indk = indk + (datefields - 1);
                      endif
                    catch
                      %# store it as is
                      x(indj, indm) = the_line{indk}; 
                    end_try_catch
                  else
                    x(indj, indm) = the_line{indk}; 
                  endif
                  indk = indk + 1; indm = indm + 1;
                endwhile
                indl = indl + 1; indj = indj + 1;
              else
                %# trigger seen again. Throw last value and abort processing.
                x(end, :) = [];
                fprintf (2, "Trigger seen a second time, stopping processing\n");
                break
              end
            endwhile
            
            if (~isempty (empty_lines))
              x(empty_lines, :) = [];
            endif
            
            %# detect empty columns
            empty_lines = find (0 == sum (cellfun ('size', x, 2)));
            if (~isempty (empty_lines))
              x(:, empty_lines) = [];
            endif
          endif
          
          clear UTF8_BOM fid indl the_line content empty_lines 
          clear datetime timeval idx count tmpfile cmd output status

        endif
      end_try_catch
    endif

    %# fallback, avoiding a recursive call
    idx.type = '()'; indj = [];
    if (~isa (x, 'char')) %# x may be a cell array, a simple matrix, ...
      indj = df._cnt(2)+(1:size (x, 2));
    else
      %# at this point, reading some filename failed
      error ("dataframe: can't open '%s' for reading data", x);
    endif;

    if (iscell (x)) %# x was filled with fields read from the CSV
      if (and (isvector (x), 2 == length (x)))
        %# use the intermediate value as destination column
        [indc, ncol] = df_name2idx (df._name{2}, x{1}, df._cnt(2), "column");
        if (ncol ~= 1)
          error (["With two-elements cell, the first should resolve " ...
                  "to a single column"]);
        endif
        try
          dummy = cellfun (@class, x{2}(2, :), 'UniformOutput', false);
        catch
          dummy = cellfun (@class, x{2}(1, :), 'UniformOutput', false);
        end_try_catch
        df = df_pad (df, 2, [length(dummy) indc], dummy);
        x = x{2}; 
        indj =  indc + (1:size (x, 2));  %# redefine target range
      elseif (isa (x{1}, 'cell'))
        x = x{1}; %# remove one cell level
      endif
      
      if (length (df._name{2}) < indj(1) || isempty (df._name{2}(indj)))
        [df._name{2}(indj, 1),  df._over{2}(1, indj)] ...
            = df_colnames (inputname(indi), indj);
        df._name{2} = genvarname (df._name{2});
      endif
      %# allow overwriting of column names
      df._over{2}(1, indj) = true;
  
    elseif (~isempty (indj))        
      %# x is an array, generates fieldnames from names given as args
      if (1 == length (df._name{2}) && length (df._name{2}) < ...
          length (indj))
        [df._name{2}(indj, 1),  df._over{2}(1, indj)] ...
            = df_colnames (char (df._name{2}), indj);
      elseif (length (df._name{2}) < indj(1) || isempty (df._name{2}(indj)))
        [df._name{2}(indj, 1),  df._over{2}(1, indj)] ...
            = df_colnames (inputname(indi), indj);
      endif
      df._name{2} = genvarname (df._name{2});
    endif
    
    if (~isempty (indj))
      %# the exact row size will be determined latter
      idx.subs = {'', indj};
      %# use direct assignement
      if (ndims (x) > 2), idx.subs{3} = 1:size (x, 3); endif
      %#      df = subsasgn(df, idx, x);        <= call directly lower level
      try
        if (verbose)
           printf ("Calling df_matassign, orig size: %s\n", disp (size (df)));
           printf ("size(x): %s\n", disp (size (x)));
        endif
        df = df_matassign (df, idx, indj, length (indj), x, trigger);
      catch
        disp ('line 443 '); keyboard
      end_try_catch
      if (~isempty (cmt_lines))
        df._cmt = vertcat (df._cmt, cellstr (cmt_lines));
        cmt_lines = [];
      endif
    else
      df._cnt(2) = length (df._name{2});
    endif
  elseif (indi > 1)
    error ('Concatenating dataframes: use cat instead');
  endif

  try
    %# loop over next variable argument
    x = varargin{1, indi};   
  catch
    %#   disp('line 197 ???');
  end_try_catch

endwhile

endfunction

function [x, y] = df_colnames(base, num)
  %# small auxiliary function to generate column names. This is required
  %# here, as only the constructor can use inputname()
  if (any ([index(base, "=")]))
    %# takes the left part as base
    x = strsplit (base, "=");
    x = deblank (x{1});
    if (isvarname (x))
      y = false;
    else
      x = 'X'; y = true; 
    endif
  else
    %# is base most probably a filename ?
    x =  regexp (base, '''[^''].*[^'']''', 'match');
    if (isempty (x))
      if (isvarname (base))
        x = base; y = false;
      else
        x = 'X'; y = true; %# this is a default value, may be changed
      endif
    else
      x = x{1}; y = true;
    endif
  endif

  if (numel (num) > 1)
    x = repmat (x, numel (num), 1);
    x = cstrcat (x, strjust (num2str (num(:)), 'left'));
    y = repmat (y, 1, numel (num));
  endif
  
  x = cellstr (x);
    
endfunction
