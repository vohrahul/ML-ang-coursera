@echo off

set OCTAVE_HOME=%~dp0
Rem convert to 8.3 format
for %%I in ("%OCTAVE_HOME%") do set OCTAVE_HOME=%%~sI

Rem   Set up PATH. Make sure the octave bin dir
Rem   comes first.

set PATH=%OCTAVE_HOME%qt5\bin;%OCTAVE_HOME%bin;%PATH%
set TERM=cygwin
set GS=gs.exe
set GNUTERM=windows

Rem set home if not already set
if "%HOME%"=="" set HOME=%USERPROFILE%
if "%HOME%"=="" set HOME=%HOMEDRIVE%%HOMEPATH%

Rem set HOME to 8.3 format
for %%I in ("%HOME%") do set HOME=%%~sI

%OCTAVE_HOME%\bin\bash.exe --login -i

