## Copyright (C) 2012-2016 Philip Nienhuis <pr.nienhuis at users.sf.net>
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
## @deftypefn {Function File} io_ods_testscript (@var{intf1})
## @deftypefnx {Function File} io_ods_testscript (@var{intf1}, @var{fname})
## @deftypefnx {Function File} io_ods_testscript (@var{intf1}, @var{fname}, @var{intf2})
## Try to check proper operation of ODS spreadsheet scripts using
## interface @var{intf1}.
##
## @var{intf1} can be one of OTK, JOD, UNO, or OCT.  No checks
## are made as to whether the requested interface is supported at all.  If
## @var{fname} is supplied, that filename is used for the tests, otherwise
## filename "io-test.ods" is chosen by default.  This parameter is required
## to have e.g., JOD distinguish between testing (reading) .ods (ODS 1.2)
## and .sxc (old OpenOffice.org & StarOffice) files (that UNO can write).
##
## If @var{intf2} is supplied, that interface will be used for writing the
## spreadsheet file and @var{intf1} will be used for reading.  The OCT
## interface doesn't have write support (yet), so it will read spreadsheet
## files made by OTK (if supported) unless another interface is supplied
## for @var{intf2}.
##
## As the tests are meant to be run interactively, no output arguments are
## returned. The results of all test steps are printed on the terminal.
##
## @seealso {test_spsh, io_xls_testscript}
##
## @end deftypefn

## Author: Philip Nienhuis
## Created: 2012-02-25

function rslts = io_ods_testscript (intf, fname="io-test.ods", intf2='')

  printf ("\nTesting .ods interface %s using file %s...\n", upper (intf), fname);
  
  isuno = false; dly = 0.25;
  if (isempty (intf2))
    intf2 = intf;
  else
    printf ("(Writing files is done with interface %s)\n", upper (intf2));
  endif
  rslts = repmat ({"-"}, 1, 11);
  rslts{1} = upper (intf);
  [~, ~, ext] = fileparts (fname);
  rslts{11} = ext;
  if (strcmpi (intf, "uno") || strcmpi (intf2, "uno"));
    isuno = true;
  endif
  
  ## 1. Initialize test arrays
  printf ("\n 1. Initialize arrays.\n");
  arr1 = [ 1 2; 3 4.5];
  arr2 = {"r1c1", "=c2+sin(d3)"; "", "r2c2"; true, -83.4; "> < & \" '", " "};
  opts = struct ("formulas_as_text", 0);

  try
    ## 2. Insert empty sheet
    printf ("\n 2. Insert first empty sheet.\n");
    odswrite (fname, {""}, "EmptySheet", "b4", intf2); 
    pause (dly);

    ## 3. Add data to test sheet
    printf ("\n 3. Add data to test sheet.\n");
    odswrite (fname, arr1, "Testsheet", "c2:d3", intf2); if (isuno); pause (dly); endif
    odswrite (fname, arr2, "Testsheet", "d4:z20", intf2);
    pause (dly);

    ## 4. Insert another sheet
    printf ("\n 4. Add another sheet with just one number in A1.\n");
    odswrite (fname, [1], "JustOne", "A1", intf2);
    pause (dly);

    ## 5. Get sheet info & find sheet with data and data range
    printf ("\n 5. Explore sheet info.\n");
    [~, shts] = odsfinfo (fname, intf);
    shnr = find (strcmp ("Testsheet", shts(:, 1)));                 # Note case!
    crange = shts{shnr, 2};
    pause (dly);

    ## 6. Read data back
    printf ("\n 6. Read data back.\n");
    [num, txt, raw, lims] = odsread (fname, shnr, crange, intf);
    pause (dly);

    ## First check: has anything been read at all?
    if (isempty (raw))
      printf ("No data at all have been read... test failed.\n");
      return
    elseif (isempty (num))
      printf ("No numeric data have been read... test failed.\n");
      return
    elseif (isempty (txt))
      printf ("No text data have been read... test failed.\n");
      return
    endif

    ## 7. Here come the tests, part 1
    printf ("\n 7. Tests part 1 (basic I/O):\n");
    try
      printf ("    ...Numeric array... ");
      assert (num(1:2, 1:3), [1, 2, NaN; 3, 4.5, NaN], 1e-10);
      rslts{2} = "+";
      assert (num(4:5, 1:3), [NaN, NaN, NaN; NaN, 1, -83.4], 1e-10);
      rslts{3} = "+";
      assert (num(3, 1:2), [NaN, NaN], 1e-10);
      rslts{4} = "+";
      # Just check if it's numeric, the value depends too much on cached results
      assert (isnumeric (num(3,3)), true);
      rslts{5} = "+";
      printf ("matches.\n");
    catch
      printf ("Hmmm.... error, see 'num'\n");
      num
    end_try_catch
    try
      printf ("    ...Cellstr array... ");
      assert (txt{1, 1}, "r1c1");
      rslts{6} = "+";
      assert (txt{2, 2}, "r2c2");
      rslts{7} = "+";
      printf ("matches...\n");
      printf ("    ...special characters... ");
      assert (txt{4, 1}, "> < & \" '");
      rslts(8) = "+";
      printf ("matches.\n");
    catch
      printf ("Hmmm.... error, see 'txt'\n"); 
      txt
    end_try_catch
    try
      printf ("    ...Boolean... "); 
      assert (islogical (raw{5, 2}), true);                ## Fails on older JOD
      rslts{9} = "+";
      printf ("recovered.\n");
    catch
      if (size (raw, 1) < 5 || size (raw, 2) < 2)
        printf ("Too little data read, boolean value not in expected data limits.\n");
      elseif (isnumeric (raw{5, 2}))
        printf ("recovered as numeric '1' rather than logical TRUE\n");
        rslts{9} = "o";
      else
        printf ("Hmmm.... error, see 'raw'\n");
        raw
      endif
    end_try_catch
    pause (dly);

    ## Check if formulas_as_text works:
    printf ("\n 8. Repeat reading, now return formulas as text\n");
    opts.formulas_as_text = 1;
    ods = odsopen (fname, 0, intf);
    raw = ods2oct (ods, shnr, crange, opts);
    ods = odsclose (ods);
    clear ods;

    ## 9. Here come the tests, part 2. Fails on COM
    printf (["\n 9. Tests part 2 (read back as formula):\n" ...
             "    (Note: just a check for a string rather than a numerical value)\n"] );

    try
      # Just check if it contains a '+' character
      assert ( (ischar (raw{3, 3}) && (! isempty (strfind (raw{3, 3}, "+")))), true); 
      rslts{10} = "+";
      printf ("    ...OK, formula recovered ('%s').\n", raw{3, 3});
    catch
      printf ("Hmmm.... error, see 'raw(3, 3)'");
      if (isempty (raw{3, 3}))
        printf (" (<empty>, should be a string like '=c2+d2')\n");
      elseif (isnumeric (raw{3, 3}))
        printf (" (equals %f, should be a string like '=c2+d2')\n", raw{3, 3}); 
      else
        printf ("\n"); 
      endif
    end_try_catch

    ## 10. Clean up
    printf ("\n10. Cleaning up.....");
    delete (fname);
    printf (" OK\n");
  catch
    ## Just to preserve rslts array
    printf ("\n%s\n\n", lasterr ());
  end_try_catch
  
  endfunction
