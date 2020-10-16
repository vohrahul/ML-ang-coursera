## Copyright (C) 2008, 2009, 2010, 2011, 2012, 2016 Moreno Marzolla
##
## This file is part of the queueing toolbox.
##
## The queueing toolbox is free software: you can redistribute it and/or
## modify it under the terms of the GNU General Public License as
## published by the Free Software Foundation, either version 3 of the
## License, or (at your option) any later version.
##
## The queueing toolbox is distributed in the hope that it will be
## useful, but WITHOUT ANY WARRANTY; without even the implied warranty
## of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
## General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with the queueing toolbox. If not, see <http://www.gnu.org/licenses/>.

## -*- texinfo -*-
##
## @deftypefn {Function File} {pop_mix =} qncmpopmix (@var{k}, @var{N})
##
## @cindex population mix
## @cindex closed network, multiple classes
##
## Return the set of population mixes for a closed multiclass queueing
## network with exactly @var{k} customers. Specifically, given a
## closed multiclass QN with @math{C} customer classes, where there
## are @code{@var{N}(c)} class @math{c} requests, a @math{k}-mix
## @var{mix} is a @math{C}-dimensional vector with the following
## properties:
##
## @example
## @group
## all( mix >= 0 );
## all( mix <= N );
## sum( mix ) == k;
## @end group
## @end example
## 
## @var{pop_mix} is a matrix with @math{C} columns, such
## that each row represents a valid mix.
##
## @strong{INPUTS}
##
## @table @code
##
## @item @var{k}
## Size of the requested mix (scalar, @code{@var{k} @geq{} 0}).
##
## @item @var{N}(c)
## number of class @math{c} requests (@code{@var{k} @leq{} sum(@var{N})}).
## 
## @end table
##
## @strong{OUTPUTS}
##
## @table @code
##
## @item @var{pop_mix}(i,c)
## number of class @math{c} requests in the @math{i}-th population
## mix. The number of mixes is @code{rows(@var{pop_mix})}.
##
## @end table
##
## If you are interested in the number of @math{k}-mixes only, you can
## use the funcion @code{qnmvapop}.
##
## @seealso{qncmnpop}
##
## @end deftypefn

## Author: Moreno Marzolla <moreno.marzolla(at)unibo.it>
## Web: http://www.moreno.marzolla.name/

function pop_mix = qncmpopmix( k, population )

  if ( nargin != 2 ) 
    print_usage();
  endif

  isvector( population ) && all( population>=0 ) || ...
      error( "N must be an array >=0" );
  R = length(population); # number of classes
  ( isscalar(k) && k >= 0 && k <= sum(population) ) || ...
      error( "k must be a scalar <= %d", sum(population));
  N = zeros(1, R);
  const = min(k, population);
  mp = 0;
  pop_mix = []; # Init result
  while ( N(R) <= const(R) )
    x=k-mp;
    ## Fill the current configuration
    i=1;
    while ( x>0 && i<=R )
      N(i) = min(x,const(i));
      x = x-N(i);
      mp = mp+N(i);
      i = i+1;
    endwhile

    ## here the configuration is filled. add it to the set of mixes
    assert( sum(N), k );
    pop_mix = [pop_mix; N]; ## FIXME: pop_mix is continuously resized

    ## advance to the next feasible configuration
    i = 1;
    sw = true;
    while sw
      if ( ( mp==k || N(i)==const(i)) && ( i<R ) )
        mp = mp-N(i);
        N(i) = 0;
        i=i+1;
      else
        N(i)=N(i)+1;
        mp=mp+1;
        sw = false;
      endif
    endwhile
  endwhile
endfunction
%!test
%! N = [2 3 4];
%! f = qncmpopmix( 1, N );
%! assert( f, [1 0 0; 0 1 0; 0 0 1] );
%! f = qncmpopmix( 2, N );
%! assert( f, [2 0 0; 1 1 0; 0 2 0; 1 0 1; 0 1 1; 0 0 2] );
%! f = qncmpopmix( 3, N );
%! assert( f, [2 1 0; 1 2 0; 0 3 0; 2 0 1; 1 1 1; 0 2 1; 1 0 2; 0 1 2; 0 0 3] );

%!test
%! N = [2 1];
%! f = qncmpopmix( 1, N );
%! assert( f, [1 0; 0 1] );
%! f = qncmpopmix( 2, N );
%! assert( f,  [2 0; 1 1] );

