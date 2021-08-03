@echo off
setlocal

set args=%*
set args=%args:\=/%

echo %args%
echo | set/p=%args% | clip

endlocal