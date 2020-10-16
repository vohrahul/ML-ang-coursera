## Copyright (C) 2016 Olaf Till <i7tiol@t-online.de>
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
## along with this program; If not, see <http://www.gnu.org/licenses/>.

## undocumented internal function

function parallel_net = __optimget_parallel_net__ (settings, default)

  min_version = "3.0.4";

  parallel_net = optimget (settings, "parallel_net", default);

  if (isempty (parallel_net))
    return;
  endif

  if (! isa (parallel_net, "pconnections"))
    error ("option 'parallel_net', if not empty, must be set to parallel connections object");
  endif

  ## Check version of parallel package.
  if (! exist ("__parallel_package_version__", "file") || ...
      compare_versions (__parallel_package_version__ (),
                          min_version, "<"))

    parallel_net = [];

    warning ("optim:parallel_net",
             "option 'parallel_net' ignored, since no loaded parallel package of at least version %s found",
             min_version);

  elseif (! exist ("netarrayfun", "file"))

    parallel_net = [];

    warning ("optim:parallel_net",
             "option 'parallel_net' ignored, since function netarrayfun not in path; maybe its installation has benn disabled at your system");

  else

    ## Check if anonymous functions with 'varargin' are saved
    ## correctly, bug #45972. The delay caused by writing and reading
    ## a file should be avoided later, replacing this test with a
    ## version check. But as yet there is no Octave version which has
    ## the patch applied.

    tp_filename = "test.dat";

    f = @ (x, y, varargin) x + y + varargin{1};
  
    unwind_protect

      save ("-binary", tp_filename, "f");

      tp = load (tp_filename);

      try

        assert (f (1, 2, 3), tp.f (1, 2, 3));

        ok = true;

      catch

        ok = false;

      end_try_catch

      if (! ok)

        parallel_net = [];

        warning ("optim:parallel_net",
                 "option 'parallel_net' ignored, since in this version of Octave bug #45972 or a similar bug is not fixed");

      endif

    unwind_protect_cleanup

      unlink (tp_filename);

    end_unwind_protect

  endif

endfunction
