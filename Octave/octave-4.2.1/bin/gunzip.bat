@echo off
set BINPATH=%~dp0
%BINPATH%bash -c 'gunzip %*'
