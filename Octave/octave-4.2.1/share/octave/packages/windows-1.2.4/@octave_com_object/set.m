function output = set (varargin)

  output = com_set (varargin{:});

endfunction

%!test
%! wshell = actxserver ("WScript.Shell");
%! currdir = pwd ();
%! set(wshell, "CurrentDirectory", getenv("SYSTEMROOT"));
%! assert(pwd(), getenv("SYSTEMROOT"));
%! cd(currdir);
%! delete (wshell)


