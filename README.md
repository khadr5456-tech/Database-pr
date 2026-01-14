Bank Management System – Detailed Description

This Bank Management System is designed to handle all essential banking operations and maintain accurate records of customers, accounts, transactions, branches, and employees.

Customers: Each customer can have one or more bank accounts. Customer details include Customer_ID, Name, Date_of_Birth, Address, Phone, and Email. The system ensures that customer information is stored securely and can be retrieved easily.

Accounts: Each account is linked to a specific customer and one branch, while a customer may hold multiple accounts. Account details include Account_ID, Customer_ID, Branch_ID, Account_Type, Balance, and Open_Date. This allows tracking of account balances, types, and opening dates efficiently.

Transactions: Every transaction is associated with a single account, processed by an employee, and occurs in a specific branch. Transaction details include Transaction_ID, Account_ID, Target_Account_ID, Transaction_Date, Amount, Transaction_Type, Status, Employee_ID, and Branch_ID. The system records each transaction accurately, ensuring proper tracking of deposits, withdrawals, and transfers.

Branches: Each branch manages multiple accounts, employees, and transactions. Branch details include Branch_ID, Branch_Name, City, Phone, Address, and Branch_Manager. This helps in monitoring branch performance and operations efficiently.

Employees: Each employee works in one branch but can handle many transactions. Employee details include Employee_ID, Name, Role, Phone, Email, and Branch_ID. The system tracks employee activities and ensures accountability in transaction processing.

System Features: The system integrates all entities to track relationships between customers, accounts, transactions, branches, and employees. It ensures accurate and efficient management of banking operations, helping in auditing, reporting, and daily banking tasks.
