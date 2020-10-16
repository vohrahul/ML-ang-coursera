function output = get (varargin)

  output = com_get (varargin{:});

endfunction

%!test
%! wshell = actxserver ("WScript.Shell");
%! assert(wshell.CurrentDirectory, get(wshell, "CurrentDirectory"));
%! delete (wshell)


