@echo off
setlocal

if "%1"=="matlab" (
  set language=matlab
  goto:parse_module
)

if "%1"=="python" (
  set language=python
  goto:parse_module
) else (
  goto:error_message
)

:parse_module
  set moduleName=%2
  if NOT EXIST %projectPath%\prescan\core\modules\%moduleName% (
    echo Error: module %moduleName% does not exist!
    goto:error_message
  )

python %projectPath%\prescan\buildtools\dmapi_generator\generate.py^
  --%language%^
  --output-dir %projectPath%\prescan\core\modules\%moduleName%\%language%_interface^
  %projectPath%\prescan\core\modules\%moduleName%\src\interface\wrappers\OpenScenario.json

exit /B

:error_message
  echo Error: Invalid input. Valid input is "matlab/python module_name"

endlocal