function output = invoke (varargin)

  output = com_invoke (varargin{:});

endfunction

%!test
%! wshell = actxserver ("WScript.Shell");
%! assert(invoke(wshell, "CurrentDirectory"), pwd ());
%! % get all methods available for the object
%! assert(!isempty(invoke(wshell)));
%! delete (wshell)

