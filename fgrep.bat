@echo off
setlocal

FINDSTR /P /N /R /A:0D /C:"%*" *.*

for /F %%A in ('DIR /B /A:D * 2^>NUL ^| findstr /V "build_ install_ prescanext prescandata .hg" ') do ( ^
  FINDSTR /P /N /R /A:0D /C:"%*" %%A\*.* ^
  & for /F %%B in ('DIR /B /A:D %%A 2^>NUL ^| findstr /V .hg') do (
    FINDSTR /S /P /N /R /A:0D /C:"%*" %%A\%%B\*.* ^
  )
)

endlocal
