@echo off
setlocal

pushd %projectPath%
  psb.bat env --cmd rtest_naked.bat %*
popd

endlocal