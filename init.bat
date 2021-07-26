@ECHO off

:: modify this session
:: ===================
ECHO Patching cmd ...
PROMPT $E[32mJohn$S$E[37m$P$G $E[0m

:: ********* COLOR definitions *********
SET cDef=[0m
:: dimm colors:
SET cBlack=[30m 
SET cRed=[31m
SET cGreen=[32m
SET cYellow=[33m
SET cBlue=[34m
SET cMagenta=[35m
SET cCyan=[36m
SET cWhite=[37m

CHCP 1252
PROMPT $E[32mJohn $E[97m$P$G$E[0m

:: change starting directory 
CD /D D:\workdir

:: set default foreground color back
ECHO | set/p=%cDef%


:: define aliases and commands
:: ===========================

:: statement (ECHO ^| set /p=mytext) prints mytext without linefeed
:: 2>NUL is used to supress annoying File Not Found error message from STDERR
DOSKEY ls=(ECHO ^| set /p=%%cCyan%%) ^
& (DIR /B /P /A:D $* 2^>NUL) ^
& (ECHO ^| set /p=%%cYellow%%) ^
& (DIR /B /P /A:-D $* 2^>NUL) ^
& (ECHO ^| set/p=%%cDef%%)

:: copy current directory to the clipboard
DOSKEY cdclip = ECHO ^| set/p=%%CD%% ^| CLIP

DOSKEY findfile = dir /b/s $*
DOSKEY pwd=ECHO %%CD%%
:: an alias to notepad++.exe
DOSKEY np = notepad++.exe $*

:: search file command with different filters
DOSKEY cmakeGrep = FINDSTR /P /N /S /R /A:0D /C:"$*" *CMakeLists.txt
DOSKEY mGrep = FINDSTR /P /N /S /R /A:0D /C:"$*" *.m
DOSKEY cGrep = FINDSTR /P /N /S /R /A:0D /C:"$*" *.h *.cpp *.txt

:: feed line from fgrep.bat to command ocode to open file in Visual Code with cursor in the right line
DOSKEY ocode = FOR /F "eol=: tokens=1,2 delims=:" %%i in ("$*") do @code --goto %%i:%%j
:: feed line from fgrep.bat to command nake to acquire an absolute path to the file
DOSKEY nake = FOR /F "eol=: tokens=1 delims=:" %%i in ("$*") do @echo ^| set/p=%%CD%%\%%i ^| clip
