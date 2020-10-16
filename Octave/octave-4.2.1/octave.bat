@echo off
Rem   Find Octave's install directory through cmd.exe variables.
Rem   This batch file should reside in Octaves installation subdir!
Rem
Rem   This trick finds the location where the batch file resides.
Rem   Note: the result ends with a backslash
set OCT_HOME=%~dp0
Rem Coonvert to 8.3 format so dont have to worry about spaces
for %%I in ("%OCT_HOME%") do set OCT_HOME=%%~sI

Rem   Set up PATH. Make sure the octave bin dir
Rem   comes first.

set PATH=%OCT_HOME%qt5\bin;%OCT_HOME%bin;%PATH%

Rem   Set up any environment vars we may need

set TERM=cygwin
set GNUTERM=windows
set GS=gs.exe

Rem set home if not already set
if "%HOME%"=="" set HOME=%USERPROFILE%
if "%HOME%"=="" set HOME=%HOMEDRIVE%%HOMEPATH%
Rem set HOME to 8.3 format
for %%I in ("%HOME%") do set HOME=%%~sI

Rem   Check for args to see if we are told to start GUI
Rem   with the --force-gui option or not (--no-gui)
Rem   Otherwise assume starting as command line
set GUI_MODE=1
:checkargs
if -%1-==-- goto noargs
  if NOT %1==--force-gui goto notguiarg
    set GUI_MODE=1
:notguiarg
  if NOT %1==--no-gui goto notnoguiarg
    set GUI_MODE=0
:notnoguiarg
  shift
  goto  checkargs
:noargs

Rem   Start Octave (this detaches and immediately returns):
if %GUI_MODE%==1 (
start octave-gui.exe %*
) else (
start octave-cli.exe %*
)

Rem   Close the batch file's cmd.exe window
exit
