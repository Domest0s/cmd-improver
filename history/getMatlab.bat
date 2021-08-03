@echo off
SETLOCAL ENABLEDELAYEDEXPANSION
set MATLAB_EXE=C:\Program Files\MATLAB\R2013b\bin\matlab.exe

IF NOT EXIST "!MATLAB_EXE!" (
	echo Matlab not found @!MATLAB_EXE!, change MATLAB_EXE variable
	exit /B
)

:try_again
!MATLAB_EXE! -r "grabsimulinklicense"

echo Waiting 5 seconds for Matlab to start up
timeout /t 5 /NOBREAK

@tasklist /FI "IMAGENAME eq MATLAB.exe" /v | @findstr /c:"License Manager Error"
IF "%ERRORLEVEL%"=="0" (
    taskkill /FI "IMAGENAME eq Matlab.exe"
    echo Will try to run matlab soon again...
    timeout /t 10 /NOBREAK
    goto :try_again
)

echo Matlab license acquired!
echo 
timeout /T 1 /NOBREAK
echo 
timeout /T 1 /NOBREAK
echo 

ENDLOCAL
