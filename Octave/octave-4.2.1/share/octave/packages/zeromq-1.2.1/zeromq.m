## Copyright (C) 2016 john donoghue
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
## @deftypefn {Package} {} zeromq
## The zeromq package provides GNU Octave bindings to the ZeroMQ library to provide
## fast distributed messaging options using IPC, TCP, TIPC and multicasting.
##
## The usage is very close to the ZeroMQ library C language bindings for the socket 
## creation and manipulation with the exception of creating a zeromq context, 
## which is automatically done in the bindings internals.
##
## For example, a basic client that does a request / reply from a server on port
## local port 5555 (available as zmq_example1.m):
##
## @example
## 
## % Create socket and connect to server
## requester = zmq_socket (ZMQ_REQ);
## zmq_connect (requester, "tcp://localhost:5555");
##
## % send some data
## zmq_send (requester, uint8("Hello"), 5, 0); 
## % try to read up to 10 bytes of reply data.
## recieved = zmq_recv (requester, 10, 0);
##     
## zmq_close (requester);
## @end example
##
## Implemented functions are:
##
## @table @asis
## @item zmq_bind
## Bind a zeromq socket to an endpoint.
## @item zmq_close
## Close a zeromq socket.
## @item zmq_connect
## Connect a zeromq socket to an endpoint
## @item zmq_disconnect
## Disonnect a zeromq socket from an endpoint
## @item zmq_errno
## Get system errno value.
## @item zmq_getsockopt
## Get current value of a zeromq socket option.
## @item zmq_poll
## Poll a socket or sockets for a timeout or incoming data available.
## @item zmq_recv
## Attempt to read data from a zeromq socket.
## @item zmq_send
## Attempt to send data from a zeromq socket.
## @item zmq_setsockopt
## Set a zeromq socket option.
## @item zmq_strerror
## Get the last zmq error string.
## @item zmq_unbind
## Unbind a previously bound zeromq socket.
## @item zmq_version
## Get the zeromq library version numbers.
## @end table
##
## Example code files for zeromq usage:
##
## @table @asis
## @item zmq_example1
## Simple client REQ socket example that attempts to connect to a server and
## send a hello command and get back the reponse.
## @item zmq_example2
## Simple server REP socket example that creates the server that the client 
## from example 1 will connect to and reponds back to client 'requests'
## @item zmq_example3
## Simple server PUB socket example that creates 'weather' server sends
## weather updates for random zip codes.
## @item zmq_example4
## Simple client SUB socket example that creates client that connects to the 'weather' 
## server and subscribes for weather updates from zipcode 10001.
## @end table
##
## View example code using @code{edit examples/example_name}
## 
## ie: 
## @example
## edit examples/zmq_example1
## @end example
##
##
## @seealso{http://zeromq.org, examples/zmq_example1.m, examples/zmq_example2.m examples/zmq_example3.m,  examples/zmq_example4.m}
## @end deftypefn

 
%!assert (1)
