@ECHO off

ECHO Patching cmd ...

PROMPT $E[32mJohn$S$E[37m$P$G $E[0m

:: ********* COLORS definition *********

SET cDef=[0m
:: dimm colors
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


:: statement (ECHO ^| set /p=mytext) prints mytext without linefeed
:: 2>NUL is used to supress annoying File Not Found error message from STDERR
DOSKEY ls=(ECHO ^| set /p=%%cCyan%%) ^
& (DIR /B /P /A:D $* 2^>NUL) ^
& (ECHO ^| set /p=%%cYellow%%) ^
& (DIR /B /P /A:-D $* 2^>NUL) ^
& (ECHO ^| set/p=%%cDef%%)

DOSKEY findfile = dir /b/s $*
DOSKEY pwd=ECHO %%CD%%
DOSKEY np = notepad++.exe $*

:: change starting directory 
CD /D D:\workdir

:: set default foreground color back
ECHO | set/p=%cDef%