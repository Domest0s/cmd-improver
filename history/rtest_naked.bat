@echo off

setlocal

for /F "tokens=3 " %%T  in ("%*") do (%projectPath%\build_debug\bin\%%T.exe --log_level=test_suite --detect_memory_leaks=0)

endlocal