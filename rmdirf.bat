@echo off
setlocal

SET FOLDER=%1

pushd %FOLDER%
  if %errorlevel% NEQ 0 (
    exit /B
  )
  del /F/Q/S *.* > NUL
popd

rmdir /Q/S "%FOLDER%"

endlocal
