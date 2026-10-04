@echo off
echo ========================================================
echo   Compiling Smart Banking and Transaction Simulator...
echo ========================================================

if not exist bin mkdir bin

javac -d bin src\main\java\com\vityarthi\banking\*.java src\main\java\com\vityarthi\banking\model\*.java src\main\java\com\vityarthi\banking\service\*.java src\main\java\com\vityarthi\banking\repository\*.java src\main\java\com\vityarthi\banking\exception\*.java src\main\java\com\vityarthi\banking\ui\*.java src\main\java\com\vityarthi\banking\util\*.java src\test\java\com\vityarthi\banking\*.java

if %ERRORLEVEL% equ 0 (
    echo [SUCCESS] Compilation completed successfully into bin/ directory!
) else (
    echo [ERROR] Compilation failed with error code %ERRORLEVEL%.
    exit /b %ERRORLEVEL%
)
