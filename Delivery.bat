@echo off

:: Check if the correct command is provided
if "%1" NEQ "install" (
    echo Invalid command. Use: Delivery.bat install [-r|-f]
    exit /b
)

:: Check if the second argument is provided
if "%2"=="" (
    echo Please specify the option: -r for Rush or -f for Fast.
    exit /b
)

if "%2"=="-r" (
    echo Installing Rush...
    powershell -Command "iwr https://raw.githubusercontent.com/shreyashsaitwal/rush-cli/main/scripts/install/install.ps1 -useb | iex"
    if %ERRORLEVEL% EQU 0 (
        echo Rush installed successfully.
    ) else (
        echo Failed to install Rush.
    )
    exit /b
)

if "%2"=="-f" (
    echo Installing Fast...
    powershell -Command "iwr https://raw.githubusercontent.com/jewelshkjony/fast-cli/main/scripts/install/win.ps1 -useb | iex"
    if %ERRORLEVEL% EQU 0 (
        echo Fast installed successfully.
    ) else (
        echo Failed to install Fast.
    )
    exit /b
)

:: If an invalid option is specified
echo Invalid option specified. Use: -r for Rush or -f for Fast.
