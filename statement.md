# Project Statement: Smart Banking & Transaction Simulator

## 1. Problem Statement
Managing personal finances and banking transactions requires a secure, reliable, and efficient system. Traditional manual record-keeping or poorly designed legacy systems are prone to errors, data inconsistencies, and security risks. There is a need for a robust, automated object-oriented application that can securely handle multiple account types, process financial transactions with strict validation, and maintain reliable audit logs to ensure data integrity.

## 2. Scope of the Project
This project focuses on building a core retail banking simulation using Java. It covers the complete lifecycle of bank accounts, including account creation (Savings and Current), secure transaction processing (deposits, withdrawals, and peer-to-peer transfers), and automated statement generation. The system operates as a standalone application utilizing Java Collections and Object-Oriented principles. It simulates internal banking workflows, enforces strict exception handling, and uses persistent File I/O for data storage across sessions without requiring external database dependencies. It does not integrate with live external third-party payment gateways.

## 3. Target Users
* **Bank Customers:** Individuals and business clients who need a secure and user-friendly platform to check account balances, safely execute cash deposits, withdrawals, fund transfers, and view or export statement records.
* **Bank Administrators / Tellers:** Authorized bank staff responsible for onboarding new customer accounts, overseeing global transaction audit logs, inspecting individual accounts, applying monthly interest accruals, and maintaining system integrity.

## 4. High-Level Features
* **Multi-Tier Account Management:** Support for Savings Accounts (enforcing minimum balances and monthly interest yields) and Current Accounts (with commercial overdraft facilities).
* **Secure Transaction Engine:** Real-time processing of deposits, withdrawals, and atomic inter-account peer-to-peer (P2P) transfers with deadlock-free concurrent locking.
* **Audit & Statement Logging:** Automated immutable logging of every financial operation with unique reference numbers, timestamps, and balance-after-transaction tracking.
* **Custom Exception Hierarchy:** Granular checked exceptions handling domain edge cases such as insufficient funds, overdraft breaches, non-existent accounts, and invalid input formats.
* **File-Based State Persistence:** Reliable object serialization ensuring accounts, customers, and transaction histories survive restarts.
* **Rich Interactive Terminal UI:** Dual-portal console interface (Customer and Admin) styled with ANSI colors, tables, and formatted ASCII banners.
