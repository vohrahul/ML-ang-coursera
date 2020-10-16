## Copyright (C) 2012-2016 Philip Nienhuis
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
## @deftypefn {Function File} io_xls_testscript (@var{intf1})
## @deftypefnx {Function File} io_xls_testscript (@var{intf1}, @var{fname})
## @deftypefnx {Function File} io_xls_testscript (@var{intf1}, @var{fname}, @var{intf2})
## Try to check proper operation of XLS / XLSX spreadsheet scripts using
## interface @var{intf1}.
##
## @var{intf1} can be one of COM, POI, JXL, OXS, UNO, or OCT.  No checks
## are made as to whether the requested interface is supported at all.  If
## @var{fname} is supplied, that filename is used for the tests, otherwise
## filename "io-test.xls" is chosen by default.  This parameter is required
## to have e.g., POI distinguish between testing .xls (BIFF8) and .xlsx
## (OOXML) files.
##
## If @var{intf2} is supplied, that interface will be used for writing the
## spreadsheet file and @var{intf1} will be used for reading.  The OCT
## interface doesn't have write support (yet), so it will read spreadsheet
## files made by POI (if supported) unless another interface is supplied
## for @var{intf2}.
##
## As the tests are meant to be run interactively, no output arguments are
## returned. The results of all test steps are printed on the terminal.
##
## @seealso {test_spsh, io_ods_testscript}
##
## @end deftypefn

## Author: Philip Nienhuis <pr.nienhuis at users.sf.net>
## Created: 2012-02-25

function rslts = io_xls_testscript (intf, fname="io-test.xls", intf2=[])

  printf ("\nTesting .xls interface %s using file %s...\n", upper (intf), fname);

  isuno = false;
  dly = 0.25;

  ## If no intf2 is supplied, write with intf1
  if (isempty (intf2))
    intf2 = intf;
  endif
  rslts = repmat ({"-"}, 1, 11);
  rslts{1} = upper (intf);
  [~, ~, ext] = fileparts (fname);
  rslts{11} = ext;
  ## Allow the OS some delay to accomodate for file operations (zipping etc.)
  if (strcmpi (intf, "uno") || strcmpi (intf2, "uno") ||
      strcmpi (intf, "oct") || strcmpi (intf2, "oct"));
    isuno = true;
  endif

  ## 1. Initialize test arrays
  printf ("\n 1. Initialize arrays.\n");
  arr1 = [ 1 2; 3 4.5];
  arr2 = {"r1c1", "=c2+d2"; "", "r2c2"; true, -83.4; "> < & \" '", " "};
  opts = struct ("formulas_as_text", 0);

  try
    ## 2. Insert empty sheet
    printf ("\n 2. Insert first empty sheet.\n");
    xlswrite (fname, {""}, "EmptySheet", "b4", intf2); 
    if (isuno)
      pause (dly);
    endif

    ## 3. Add data to test sheet
    printf ("\n 3. Add data to test sheet.\n");
    xlswrite (fname, arr1, "Testsheet", "c2:d3", intf2);
    if (isuno)
      pause (dly);
    endif
    xlswrite (fname, arr2, "Testsheet", "d4:z20", intf2);
    if (isuno)
      pause (dly);
      if (strcmpi (intf, "oct") || strcmpi (intf2, "oct"))
        ## Some more delay to give zip a breath
        pause (dly); pause (dly);
      endif
    endif

    ## 4. Insert another sheet
    printf ("\n 4. Add another sheet with just one number in A1.\n");
    xlswrite (fname, [1], "JustOne", "A1", intf2);
    if (isuno)
      pause (dly);
    endif

    ## 5. Get sheet info & find sheet with data and data range
    printf ("\n 5. Explore sheet info.\n");
    [~, shts] = xlsfinfo (fname, intf);
    if (isuno)
      pause (dly);
    endif
    shnr = find (strcmp ("Testsheet", shts(:, 1)));      ## Note case!
    if (isempty (shnr))
      printf ("Worksheet with data not found - not properly written ... test failed.\n");
      return
    endif
    crange = shts{shnr, 2};                       ## Range can be unreliable
    if (strcmpi (crange, "A1:A1"))
      crange = "";
    endif

    ## 6. Read data back
    printf ("\n 6. Read data back.\n");
    [num, txt, raw, lims] = xlsread (fname, shnr, crange, intf);
    if (isuno)
      pause (dly);
    endif

    ## First check: has anything been read at all?x
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
    err = 0;
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
      printf ("matches...\n");
    catch
      printf ("Hmmm.... error, see 'num'\n");
      err = 1;
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
      printf ("matches...\n");
    catch
      printf ("Hmmm.... error, see 'txt'\n");
      err = 1;
    end_try_catch
    try
      printf ("    ...Boolean... ");
      assert (islogical (raw{5, 2}), true);              ## Fails on COM
      rslts{9} = "+";
      printf ("recovered...\n");
    catch
      try
        if (isnumeric (raw{5, 2}))
          printf ("returned as numeric '1' rather than logical TRUE.\n");
          rslts{9} = "o";
        else
          printf ("Hmmm.... error, see 'raw{5, 2}'\n");
        endif
      catch
        err = 1;
        printf ("Hmmm.... error....\n");
      end_try_catch
    end_try_catch
    if (err)
      ## Echo array to screen
      printf ("These are the data read back:\n");
      raw
      printf ("...and this what they should look like:\n");
      printf ("%s\n", ...
      "{\n  [1,1] =  1\n  [2,1] =  3\n  [3,1] = [](0x0)\n  [4,1] = [](0x0)\n  [5,1] = [](0x0)\n  [1,2] =  2\n  [2,2] =  4.5000\n  [3,2] = r1c1\n  [4,2] =\n  [5,2] =  1\n  [1,3] = [](0x0)\n  [2,3] = [](0x0)\n  [3,3] =  3\n  [4,3] = r2c2\n  [5,3] = -83.400\n}");
    endif

    ## Check if "formulas_as_text" option works:
    printf ("\n 8. Repeat reading, now return formulas as text\n");
    opts.formulas_as_text = 1;
    xls = xlsopen (fname, 0, intf);
    if (isuno)
      pause (dly);
    endif
    raw = xls2oct (xls, shnr, crange, opts);
    if (isuno)
      pause (dly);
    endif
    xls = xlsclose (xls);
    if (isuno)
      pause (dly);
    endif
    clear xls;

    ## 9. Here come the tests, part 2.
    printf ("\n 9. Tests part 2 (read back formula):\n");

    try
      # Just check if it contains any string
      assert ( (ischar (raw{3, 3}) && ! isempty (raw(3, 3)) && raw{3, 3}(1) == "="), true); 
      rslts{10} = "+";
      printf ("    ...OK, formula recovered ('%s').\n", raw{3, 3});
    catch
      printf ("Hmmm.... error, see 'raw(3, 3)'");
      if (size (raw, 1) >= 3 && size (raw, 2) >= 3)
        if (isempty (raw{3, 3}))
          printf (" (empty, should be a string like '=c2+d2')\n");
        elseif (isnumeric (raw{3, 3}))
          printf (" (equals %f, should be a string like '=c2+d2')\n", raw{3, 3}); 
        else
          printf ("\n");
        endif
      else
        printf (".. raw{3, 3} doesn't even exist, array too small... Test failed.\n");
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
