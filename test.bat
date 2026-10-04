@echo off
if not exist bin\com\vityarthi\banking\BankingTestSuite.class (
    echo Binary not found. Compiling first...
    call build.bat
)
echo Running Test Suite...
java -cp bin com.vityarthi.banking.BankingTestSuite
