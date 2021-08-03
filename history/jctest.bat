@echo off
setlocal

pushd %projectPath%
  psb.bat env --cmd jctest_naked.bat %*
popd

endlocal