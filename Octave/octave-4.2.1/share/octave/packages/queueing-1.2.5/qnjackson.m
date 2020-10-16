## Copyright (C) 2008, 2009, 2010, 2011, 2012, 2014 Moreno Marzolla
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
## @deftypefn {Function File} {[@var{U}, @var{R}, @var{Q}, @var{X}] =} qnjackson (@var{lambda}, @var{S}, @var{P} )
## @deftypefnx {Function File} {[@var{U}, @var{R}, @var{Q}, @var{X}] =} qnjackson (@var{lambda}, @var{S}, @var{P}, @var{m} )
## @deftypefnx {Function File} {@var{pr} =} qnjackson (@var{lambda}, @var{S}, @var{P}, @var{m}, @var{k})
##
## This function is deprecated. Please use @code{qnos} instead.
##
## @seealso{qnos}
##
## @end deftypefn

## Author: Moreno Marzolla <moreno.marzolla(at)unibo.it>
## Web: http://www.moreno.marzolla.name/

function [U_or_pi R Q X] = qnjackson( lambda, S, P, m, k )
  persistent warned = false;
  if (!warned)
    warned = true;
    warning("qn:deprecated-function",
	    "qnjackson is deprecated. Please use qnos insgead");
  endif
  if ( nargin < 3 || nargin > 5 )
    print_usage();
  endif
  ( isvector(lambda) && all(lambda>=0) ) || ...
      error( "lambda must be a vector >= 0" );
  lambda=lambda(:)'; # make lambda a row vector
  N = length(lambda);
  isvector(S) || ...
      error( "S must be a vector" );
  S = S(:)'; # make S a row vector
  size_equal(lambda,S) || ...
      error( "lambda and S must of be of the same length" );
  all(S>0) || ...
      error( "S must be >0" );
  [N,N] == size(P) || ...
      error(" P must be a matrix of size length(lambda) x length(lambda)" );  
  all(all(P>=0)) && all(sum(P,2)<=1) || ...
      error( "P is not a transition probability matrix" );

  if ( nargin < 4 || isempty(m) )
    m = ones(1,N);
  else
    [errorcode, lambda, m] = common_size(lambda, m);
    ( isvector(m) && (errorcode==0) ) || ...
        error("m and lambda must have the same length" );
  endif

  ## Compute the arrival rates using the traffic equation:
  l = sum(lambda)*qnosvisits( P, lambda );
  ## Check ergodicity
  for i=1:N
    if ( m(i)>0 && l(i)>=m(i)/S(i) )      
      error( "Server %d not ergodic: arrival rate=%f, service rate=%f", i, l(i), m(i)/S(i) );
    endif
  endfor

  U_or_pi = zeros(1,N);

  if ( nargin == 5 )

    ( isvector(k) && size_equal(lambda,k) ) || ...
        error( "k must be a vector of the same size as lambda" );
    all(k>=0) || ...
        error( "k must be nonnegative" );

    ## compute occupancy probability
    rho = l .* S ./ m;      
    i = find(m==1); # M/M/1 queues
    U_or_pi(i) = (1-rho(i)).*rho(i).^k(i);
    for i=find(m>1) # M/M/k queues
      k = [0:m(i)-1];
      pizero = 1 / (sum( (m(i)*rho(i)).^k ./ factorial(k)) + ...
                    (m(i)*rho(i))^m(i) / (factorial(m(i))*(1-rho(i))) ...
                    );      
      ## Compute the marginal probabilities
      U_or_pi(i) = pizero * (m(i)^min(k(i),m(i))) * (rho(i)^k(i)) / ...
          factorial(min(m(i),k(i)));
    endfor
    i = find(m<1); # infinite server nodes
    U_or_pi(i) = exp(-rho(i)).*rho(i).^k(i)./factorial(k(i));

  else 

    ## Compute steady-state parameters
    U_or_pi = R = Q = X = zeros(1,N); # Initialize vectors
    ## single server nodes
    i = find( m==1 );
    [U_or_pi(i) R(i) Q(i) X(i)] = qnmm1(l(i),1./S(i));
    ## multi server nodes  
    i = find( m>1 );
    [U_or_pi(i) R(i) Q(i) X(i)] = qnmmm(l(i),1./S(i),m(i));
    ## infinite server nodes
    i = find( m<1 );
    [U_or_pi(i) R(i) Q(i) X(i)] = qnmminf(l(i),1./S(i));

  endif
endfunction
