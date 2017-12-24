@ECHO off

ECHO Patching cmd ...

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
DOSKEY ls=(ECHO ^| set /p=%%cCyan%%) ^
& (DIR /B /A:D $*) ^
& (ECHO ^| set /p=%%cYellow%%) ^
& (for %%i in (*) do @echo %%i) ^
& (ECHO ^| set/p=%%cDef%%)

DOSKEY pwd=ECHO %%CD%%

:: change starting directory 
CD /D D:\workdir

:: set default foreground color back
ECHO | set/p=%cDef%