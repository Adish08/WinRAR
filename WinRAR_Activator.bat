@echo off
:: ==========================================
:: Auto-Elevate: Request Administrator Privileges
:: ==========================================
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else (
    goto gotAdmin
)

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
    "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    if exist "%temp%\getadmin.vbs" del "%temp%\getadmin.vbs"
    pushd "%CD%"
    CD /D "%~dp0%"

:: ==========================================
:: WinRAR Activator by Adish
:: ==========================================
setlocal enabledelayedexpansion
echo.
echo ***********************************
echo      WinRAR Activator by Adish     
echo ***********************************
echo.

:: Check for WinRAR installation in default directories
set "WinRARPath=%ProgramFiles%\WinRAR"
if not exist "%WinRARPath%" (
    set "WinRARPath=%ProgramFiles(x86)%\WinRAR"
)
if not exist "%WinRARPath%" (
    echo [*] ERROR: WinRAR installation not found in default directories.
    echo [*] Please modify the script to specify a custom path if needed.
    pause
    exit /b 1
)
echo [*] Activating WinRAR. Please wait...
echo.

:: Create registration key file
(
    echo RAR registration data
    echo WinRAR Official
    echo Unlimited Company License
    echo UID=764af7a365b9cc2800b9
    echo 641221225000b9159c62ab3736619039a6690a972a954ad239af05
    echo 07c1ac4383c129894fd560fce6cb5ffde62890079861be57638717
    echo 7131ced835ed65cc743d9777f2ea71a8e32c7e593cf66794343565
    echo b41bcf56929486b8bcdac33d50ecf7739960e1a7f85e330ac24af0
    echo cb11ed6fe8d15c22842718a50074ecf691e073d8bfdc0e4b6e9092
    echo 0c17f1f30844937f2ab000335773972ed5676439aec1fe5b601c96
    echo 6445f5a3abb8ee3b6e7f04533b5630222e65e0cae70d1245876275
) > "%WinRARPath%\rarreg.key" 2>nul

:: Verify creation
if exist "%WinRARPath%\rarreg.key" (
    echo.
    echo [+] SUCCESS: WinRAR Activated!
    echo [*] License key installed in: "%WinRARPath%"
    echo.
    echo You can now use WinRAR without limitations!
) else (
    echo.
    echo [*] ERROR: Failed to create registration key.
    echo [*] Access denied. Make sure to run the script as Administrator.
)
pause
endlocal
