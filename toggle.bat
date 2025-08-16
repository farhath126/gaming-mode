@echo off
setlocal

if not exist mode.txt (
    echo TRADING > mode.txt
)

set /p current_mode=<mode.txt

echo.%current_mode% | find /i "TRADING" > nul

if not errorlevel 1 (

    echo Current mode is: TRADING
    echo Switching to GAMING mode...
    call gaming.bat
    echo GAMING > mode.txt
    echo Switched. Mode is now set to GAMING.
) else (

    echo Current mode is: GAMING
    echo Switching to TRADING mode...
    call trading.bat
    echo TRADING > mode.txt
    echo Switched. Mode is now set to TRADING.
)

endlocal
echo.
pause
