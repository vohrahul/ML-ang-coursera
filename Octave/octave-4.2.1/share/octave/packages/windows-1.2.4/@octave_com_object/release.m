function release (varargin)

  com_release (varargin{:});

endfunction

%!test
%! wshell = actxserver ("WScript.Shell");
%! release (wshell);
%! delete (wshell)


