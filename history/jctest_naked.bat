@echo off
setlocal

set /A nCores = %NUMBER_OF_PROCESSORS% / 2

REM take build mode (release/debug) from the prescan.cfg file 
for /F "tokens=3 " %%T  in ('findstr /R /C:"^buildmode" %projectPath%\prescan.cfg') do (
  set buildmode=%%T
)

pushd %projectPath%\build_%buildmode%
  if not %1.==. (
    if not "%1"=="all" (
      echo %cRed% Don't be pipiska! %cDef%
      exit /B
    )
    echo running ALL C++ Unit tests on branch %cMagenta%%branchName%%cDef% with %cMagenta%%nCores%%cDef% threads:
    ctest --build-config %buildmode% -j %nCores% --log_level=test_suite --detect_memory_leaks=0
  ) else (
    echo running C++ Unit tests on branch %cMagenta%%branchName%%cDef% with %cMagenta%%nCores%%cDef% threads:
    ctest --build-config %buildmode% -j %nCores% --log_level=test_suite --detect_memory_leaks=0 ^
      --exclude-regex ""^^^(pscoeffgen^|osgtoprotobuf^|visviewer^|modelgenerators^|test_WheelContacts^|PBCameraPluginTest^|submodelipctest^|test_OpenScenarioImporter^)""
  )
popd

REM Clean up

pushd %projectPath%\prescan
  for /F %%A in ('hg status --unknown --no-status ^| findstr /B testdata') do ( del %%A )
  hg revert --no-backup --include testdata\* > NUL
popd

endlocal
