@echo off
set BINPATH=%~dp0
%BINPATH%bash -c 'uncompress %*'
