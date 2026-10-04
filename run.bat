@echo off
if not exist bin\com\vityarthi\banking\Main.class (
    echo Binary not found. Compiling first...
    call build.bat
)
echo Launching Smart Banking & Transaction Simulator...
java -cp bin com.vityarthi.banking.Main
