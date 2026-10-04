# Smart Banking & Transaction Simulator

[![Java Version](https://img.shields.io/badge/Java-17%2B-blue.svg)](https://www.oracle.com/java/)
[![Build Status](https://img.shields.io/badge/Build-Passing-brightgreen.svg)]()
[![Tests](https://img.shields.io/badge/Tests-10%2F10%20Passed-success.svg)]()
[![Architecture](https://img.shields.io/badge/Architecture-Layered%20OOP-orange.svg)]()

> An enterprise-grade, object-oriented retail core banking simulator implemented in Java, featuring dual customer/admin roles, thread-safe financial transactions, deadlock-free P2P transfers, customizable account tiers, automatic interest computation, persistent audit logging, and statement exporting.

---

## 1. Project Overview

The **Smart Banking & Transaction Simulator** provides an end-to-end simulation of a modern financial core banking system. Built from the ground up using core Java and Object-Oriented principles, the simulator manages the lifecycle of customer accounts, enforces financial constraints (such as minimum balances and overdraft allowances), guarantees atomic fund transfers, and maintains persistent audit ledgers.

---

## 2. Key Features

- **Multi-Type Account Hierarchy**:
  - **Savings Account (`SavingsAccount`)**: Minimum balance maintenance (`₹500.0`), annual interest accrual (`4.0% p.a.`), and monthly interest batch computation.
  - **Current Account (`CurrentAccount`)**: Configurable business overdraft limit (`₹5,000.0+`) permitting negative ledger balances up to the authorized threshold.
- **Thread-Safe & Deadlock-Free Transaction Engine**:
  - Cash deposits, ATM cash withdrawals, and peer-to-peer (P2P) transfers.
  - Consistent lock-ordering mechanism preventing deadlocks during concurrent inter-account transfers.
- **Granular Exception Handling**:
  - Domain-specific checked exceptions: `InsufficientFundsException`, `OverdraftLimitExceededException`, `AccountNotFoundException`, `InvalidTransactionException`, and `AuthenticationException`.
- **Comprehensive Audit & Statement Engine**:
  - Real-time immutable transaction ledger recording timestamps, transaction IDs, types, amounts, and ledger balances.
  - Interactive mini-statements (last 5 transactions) and detailed account statements with financial breakdowns.
  - Export full statements directly to text files on disk (`statements/statement_<acc>.txt`).
- **File-Based Persistence**:
  - Automatic Java serialization (`data/bank_state.dat`) preserving all customer records, accounts, and transactions across application reboots.
- **Rich Terminal Interface (CLI)**:
  - Colored ANSI terminal styling, formatted tabular reports, ASCII art banners, and validation guards for user input.
  - Separate secure portals for **Customers** and **Bank Administrators/Tellers**.

---

## 3. Technologies & Subject Concepts Used

| Technology / Concept | Implementation in Project |
| :--- | :--- |
| **Language** | Java (Standard Edition 17+ / tested on Java 26) |
| **OOP Principles** | Abstraction (`Account`), Inheritance (`SavingsAccount`, `CurrentAccount`), Polymorphism, Encapsulation |
| **Collections Framework** | `ConcurrentHashMap`, `ArrayList`, `List`, `Map`, `Optional`, Java Streams API |
| **Concurrency & Thread Safety**| Synchronized methods, lock-ordering algorithm, atomic sequence generators (`AtomicLong`) |
| **Exception Handling** | Custom checked banking exception hierarchy with detailed contextual diagnostics |
| **I/O & Persistence** | Java Object Serialization (`ObjectInputStream`/`ObjectOutputStream`), file exports |
| **Build & Test** | Standalone zero-dependency batch/PowerShell scripts & Maven `pom.xml` |

---

## 4. Project Structure

```
Programming in Java - Evaluated Project/
├── src/
│   ├── main/java/com/vityarthi/banking/
│   │   ├── Main.java                          # Bootstrap entry point
│   │   ├── model/
│   │   │   ├── Account.java                   # Abstract base account entity
│   │   │   ├── SavingsAccount.java            # Savings account with interest & min balance
│   │   │   ├── CurrentAccount.java            # Current account with overdraft facility
│   │   │   ├── Customer.java                  # Customer profile and authentication
│   │   │   ├── Transaction.java               # Immutable financial transaction record
│   │   │   ├── AccountType.java               # Enum: SAVINGS, CURRENT
│   │   │   ├── TransactionType.java           # Enum: DEPOSIT, WITHDRAWAL, TRANSFER, etc.
│   │   │   └── TransactionStatus.java         # Enum: SUCCESS, FAILED, REVERSED
│   │   ├── service/
│   │   │   ├── BankingService.java            # Core business service interface
│   │   │   ├── BankingServiceImpl.java        # Thread-safe service implementation
│   │   │   ├── AuthService.java               # Customer PIN & Admin credentials handler
│   │   │   └── StatementGenerator.java        # Tabular statements & file exporter
│   │   ├── repository/
│   │   │   ├── BankRepository.java            # Persistence repository interface
│   │   │   └── FileBankRepository.java        # File storage & serialization engine
│   │   ├── exception/
│   │   │   ├── BankingException.java          # Base checked exception
│   │   │   ├── InsufficientFundsException.java# Savings min balance violation
│   │   │   ├── OverdraftLimitExceededException.java # Overdraft breach
│   │   │   ├── AccountNotFoundException.java  # Missing account lookup
│   │   │   ├── InvalidTransactionException.java # Validation failures
│   │   │   └── AuthenticationException.java   # PIN / credential failures
│   │   ├── ui/
│   │   │   ├── ConsoleUI.java                 # Interactive terminal UI
│   │   │   └── ConsoleFormatter.java          # ANSI color schemes & table formatting
│   │   └── util/
│   │       ├── IdGenerator.java               # Atomic identifier generator
│   │       └── ValidationUtils.java           # Input pattern validators
│   └── test/java/com/vityarthi/banking/
│       └── BankingTestSuite.java              # 10 automated unit & integration tests
├── data/                                      # Persistent storage directory
├── docs/                                      # Full evaluation project report
│   └── PROJECT_REPORT.md                      # Complete 15-section report ready for submission
├── statement.md                               # Problem statement & scope specification
├── README.md                                  # Repository documentation
├── pom.xml                                    # Standard Maven build descriptor
├── build.bat                                  # Automated compilation script
├── run.bat                                    # Application launcher
└── test.bat                                   # Automated test runner
```

---

## 5. Quick Start: Install & Run

### Prerequisites
- Any Java Development Kit (JDK 17 or higher). Verify with:
  ```powershell
  java -version
  javac -version
  ```

### Method 1: Using Provided Windows Batch Scripts (Recommended)

1. **Compile the source code**:
   ```cmd
   build.bat
   ```
2. **Launch the simulator**:
   ```cmd
   run.bat
   ```
3. **Run the automated test suite**:
   ```cmd
   test.bat
   ```

### Method 2: Manual Terminal Execution (PowerShell / Command Prompt)

1. **Compile**:
   ```powershell
   javac -d bin (Get-ChildItem -Path src/main/java, src/test/java -Filter *.java -Recurse | ForEach-Object { $_.FullName })
   ```
2. **Run Application**:
   ```powershell
   java -cp bin com.vityarthi.banking.Main
   ```
3. **Run Automated Tests**:
   ```powershell
   java -cp bin com.vityarthi.banking.BankingTestSuite
   ```

---

## 6. Preloaded Demo Credentials

For quick evaluation and testing, the application initializes with demo accounts:

| Role | Account / User | PIN / Password | Account Type | Opening Balance | Available Limits |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **Customer** | `SB-10001` (Aarav Sharma) | `1234` | Savings | ₹15,000.00 | Min Balance: ₹500 |
| **Customer** | `SB-10002` (Priya Patel) | `4321` | Savings | ₹8,500.00 | Min Balance: ₹500 |
| **Customer** | `CA-10003` (Vikram Malhotra)| `5678` | Current | ₹45,000.00 | Overdraft: ₹10,000 |
| **Admin** | `admin` | `admin` | System Admin | N/A | Full Administrative Access |

---

## 7. Testing Instructions & Results

The test suite exercises all critical business logic, security constraints, and data integrity:

```
==============================================================
        RUNNING SMART BANKING SIMULATOR TEST SUITE
==============================================================

 [PASS] Test 1: Validation Rules (Email, Phone, PIN)
 [PASS] Test 2: Savings Account Minimum Balance Enforcement
 [PASS] Test 3: Current Account Overdraft Facility Limits
 [PASS] Test 4: Cash Deposit Operations
 [PASS] Test 5: Insufficient Funds Exception on Excessive Withdrawal
 [PASS] Test 6: Overdraft Limit Exceeded Exception
 [PASS] Test 7: Atomic Inter-Account Fund Transfer
 [PASS] Test 8: Monthly Interest Accrual Calculation
 [PASS] Test 9: Authentication & Security PIN Verification
 [PASS] Test 10: State Persistence & File Storage Recovery

==============================================================
 TEST SUMMARY: Total: 10 | Passed: 10 | Failed: 0
==============================================================
```

---

## 8. CLI Interface Preview

```
  ███████╗███╗   ███╗ █████╗ ██████╗ ████████╗    ██████╗  █████╗ ███╗   ██╗██╗  ██╗
  ██╔════╝████╗ ████║██╔══██╗██╔══██╗╚══██╔══╝    ██╔══██╗██╔══██╗████╗  ██║██║ ██╔╝
  ███████╗██╔████╔██║███████║██████╔╝   ██║       ██████╔╝███████║██╔██╗ ██║█████╔╝ 
  ╚════██║██║╚██╔╝██║██╔══██║██╔══██╗   ██║       ██╔══██╗██╔══██║██║╚██╗██║██╔═██╗ 
  ███████║██║ ╚═╝ ██║██║  ██║██║  ██║   ██║       ██████╔╝██║  ██║██║ ╚████║██║  ██╗
  ╚══════╝╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝       ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝  ╚═╝
        >>> SMART BANKING & FINANCIAL TRANSACTION SIMULATION SYSTEM <<<

╔══════════════════════════════════════════════════════════════════════════╗
║                       MAIN MENU - SELECT PORTAL                          ║
╚══════════════════════════════════════════════════════════════════════════╝
 1. Customer Portal (Login with Account Number & PIN)
 2. Bank Teller / Admin Portal (Staff Management & Audit)
 3. About System & Demo Credentials
 4. Exit Application
────────────────────────────────────────────────────────────────────────────
Select an option (1-4): 
```
#   j a v a - v i t y a r t h i - p r o j e c t  
 #   j a v a - v i t y a r t h i - p r o j e c t  
 #   j a v a - v i t y a r t h i - p r o j e c t  
 