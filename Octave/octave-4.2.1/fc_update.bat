@echo off

set ROOT_DIR=%~dp0
echo "Updating fc-cache (may take a while) ..."
%ROOT_DIR%\bin\fc-cache.exe -v
echo "Done."

