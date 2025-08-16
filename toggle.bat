@echo off
setlocal

REM --- FINAL TOGGLE SCRIPT - USING A MORE ROBUST CHECK ---

REM If mode.txt does not exist, create it with TRADING as the default.
if not exist mode.txt (
    echo TRADING > mode.txt
)

REM Read the current mode from the file.
set /p current_mode=<mode.txt

REM --- THE FIX: Use 'find' to check the mode ---
REM This is not sensitive to whitespace or encoding issues.
echo.%current_mode% | find /i "TRADING" > nul

if not errorlevel 1 (
    REM 'find' was successful (errorlevel is 0), which means "TRADING" was found.
    REM Time to switch to GAMING.
    echo Current mode is: TRADING
    echo Switching to GAMING mode...
    call gaming.bat
    echo GAMING > mode.txt
    echo Switched. Mode is now set to GAMING.
) else (
    REM 'find' failed (errorlevel is 1), so "TRADING" was not found.
    REM We assume it's GAMING mode, so switch to TRADING.
    echo Current mode is: GAMING
    echo Switching to TRADING mode...
    call trading.bat
    echo TRADING > mode.txt
    echo Switched. Mode is now set to TRADING.
)

endlocal
echo.
pause
