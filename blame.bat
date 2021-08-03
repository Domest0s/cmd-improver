@echo off

FOR /F "tokens=1-5 delims=\" %%A in ("%*") do (^
  (pushd %%A\%%B\%%C\%%D\%%E) ^
& (thg.exe blame "%*") ^
&  popd)

