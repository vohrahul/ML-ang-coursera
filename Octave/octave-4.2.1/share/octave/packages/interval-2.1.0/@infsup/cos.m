## Copyright 2014-2016 Oliver Heimlich
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
## along with this program; if not, see <http://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @documentencoding UTF-8
## @defmethod {@@infsup} cos (@var{X})
## 
## Compute the cosine in radians.
##
## Accuracy: The result is a tight enclosure.
##
## @example
## @group
## cos (infsup (1))
##   @result{} ans ⊂ [0.5403, 0.54031]
## @end group
## @end example
## @seealso{@@infsup/acos, @@infsup/sec, @@infsup/cosh}
## @end defmethod

## Author: Oliver Heimlich
## Keywords: interval
## Created: 2014-10-05

function x = cos (x)

if (nargin ~= 1)
    print_usage ();
    return
endif

l = u = sinsignl = sinsignu = zeros (size (x.inf));

## Check, if wid (x) is certainly greater than 2*pi. This can save the
## computation if some cosine values.
width = mpfr_function_d ('minus', -inf, x.sup, x.inf);
persistent pi = infsup ("pi");
persistent twopi = 2 .* pi;
certainlyfullperiod = width >= sup (twopi);
l(certainlyfullperiod) = -1;
u(certainlyfullperiod) = 1;

possiblynotfullperiod = not (certainlyfullperiod);
if (__check_crlibm__ ())
    l(possiblynotfullperiod) = min (...
        crlibm_function ('cos', -inf, x.inf(possiblynotfullperiod)), ...
        crlibm_function ('cos', -inf, x.sup(possiblynotfullperiod)));
    u(possiblynotfullperiod) = max (...
        crlibm_function ('cos', inf, x.inf(possiblynotfullperiod)), ...
        crlibm_function ('cos', inf, x.sup(possiblynotfullperiod)));

    ## We use sign (-sin) to know the gradient at the boundaries.
    sinsignl(possiblynotfullperiod) = sign (...
        -crlibm_function ('sin', .5, x.inf(possiblynotfullperiod)));
    sinsignu(possiblynotfullperiod) = sign (...
        -crlibm_function ('sin', .5, x.sup(possiblynotfullperiod)));
else
    l(possiblynotfullperiod) = min (...
        mpfr_function_d ('cos', -inf, x.inf(possiblynotfullperiod)), ...
        mpfr_function_d ('cos', -inf, x.sup(possiblynotfullperiod)));
    u(possiblynotfullperiod) = max (...
        mpfr_function_d ('cos', inf, x.inf(possiblynotfullperiod)), ...
        mpfr_function_d ('cos', inf, x.sup(possiblynotfullperiod)));

    ## We use sign (-sin) to know the gradient at the boundaries.
    sinsignl(possiblynotfullperiod) = sign (...
        -mpfr_function_d ('sin', .5, x.inf(possiblynotfullperiod)));
    sinsignu(possiblynotfullperiod) = sign (...
        -mpfr_function_d ('sin', .5, x.sup(possiblynotfullperiod)));
endif

## In case of sign (-sin) == 0, we conservatively use sign (-sin) of nextout.
sinsignl(sinsignl == 0) = (-1) .* sign (l(sinsignl == 0));
sinsignu(sinsignu == 0) = sign (u(sinsignu == 0));

containsinf = possiblynotfullperiod & ((sinsignl == -1 & sinsignu == 1) | ...
                                       (sinsignl == sinsignu & ...
                                            width >= sup (pi))) ...
                                    & ne (0, x);
l(containsinf) = -1;

containssup = possiblynotfullperiod & ((sinsignl == 1 & sinsignu == -1) | ...
                                       (sinsignl == sinsignu & ...
                                            width >= sup (pi)));
u(containssup) = 1;

emptyresult = isempty (x);
l(emptyresult) = inf;
u(emptyresult) = -inf;

l(l == 0) = -0;

x.inf = l;
x.sup = u;

endfunction

%!# from the documentation string
%!assert (cos (infsup (1)) == "[0x1.14A280FB5068Bp-1, 0x1.14A280FB5068Cp-1]");
