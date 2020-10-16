function delete (varargin)

  com_delete (varargin{:});

endfunction

%!test
%! wshell = actxserver ("WScript.Shell");
%! delete (wshell)
