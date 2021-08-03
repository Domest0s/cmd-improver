@echo off
setlocal

pushd %projectPath%\prescan

for /F %%A in ('hg status --unknown --no-status ^| findstr /B testdata') do ( del %%A )
hg revert --no-backup --include testdata\* > NUL

popd

endlocal