@echo off
cls
echo [35mPatching cmd ...
chcp 1252

:: set the prompt string
PROMPT $E[32mJohn $E[97m$P$G$S$E[0m

:: convenient commands:
DOSKEY ls=(ECHO ^| set /p=[36m) ^& (DIR /B /A:D $*) ^& (ECHO ^| set /p=[33m) ^& (DIR /B /A:-D $*) ^& (ECHO ^| set/p=[0m)
DOSKEY pwd=ECHO %%CD%%
:: change starting directory 
cd /D D:\workdir

:: set default color back
echo [0m