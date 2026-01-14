CREATE TABLE Customers (
    Customer_ID INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    Date_of_Birth DATE NOT NULL,
    Address NVARCHAR(255),
    Phone NVARCHAR(15),
    Email NVARCHAR(100),
    CONSTRAINT chk_email CHECK (Email LIKE '%_@__%.__%'),
    CONSTRAINT chk_phone CHECK (Phone LIKE '[0-9]%')
);

SELECT*FROM Customers;
INSERT INTO Customers (Name, Date_of_Birth, Address, Phone, Email) VALUES
('Ahmed Mohamed Elsayed', '2006-05-5', '15 Nile St, Cairo', '01143964880', 'ahmedmohammed.tech@gmail.com'),
('Rasha Mohamed Omar', '1982-8-10', '7 Street 9, Alexandria', '01122334455', 'rash.omer@gmail.com'),
('gana alla badran', '2006-07-12', '20 Tahrir St, Giza', '01099887766', 'gana.alla@yahoo.com'),
('basant Mostafa Ali', '2000-01-15', '5 Port Said St, Mansoura', '01211223344', 'basant.@gmail.com'),
('Omar Sherif Naguib', '1992-03-10', '12 Ramses St, Cairo', '01011223344', 'omar.sherif@edu.com');

DELETE FROM Customers;
select*from Customers;
DROP TABLE Customers;


     




CREATE TABLE Branches (
    Branch_ID INT IDENTITY(1,1) PRIMARY KEY,
    Branch_Name NVARCHAR(100) NOT NULL,
    City NVARCHAR(50),
    Phone NVARCHAR(15),
    Address NVARCHAR(255),
    Branch_Manager NVARCHAR(100)
);

INSERT INTO Branches (Branch_Name, City, Phone, Address, Branch_Manager) VALUES
('Cairo Main Branch', 'Cairo', '0223344556', '1 Tahrir Square, Cairo', 'Ahmed Abdullah'),
('Alexandria Branch', 'Alexandria', '0345566778', '12 San Stefano St, Alexandria', 'Mona Said'),
('Giza Branch', 'Giza', '0234455667', '8 Faisal St, Giza', 'Khaled Fouad'),
('Mansoura Branch', 'Mansoura', '0501234567', '3 El Tahrir St, Mansoura', 'Fatma Nabil');

select*from Branches;



CREATE TABLE Employees (
    Employee_ID INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    Role NVARCHAR(50) NOT NULL,
    Phone NVARCHAR(15),
    Email NVARCHAR(100),
    Branch_ID INT,
    FOREIGN KEY (Branch_ID) REFERENCES Branches(Branch_ID)
);

INSERT INTO Employees (Name, Role, Phone, Email, Branch_ID) VALUES
('Saeed Hassan', 'Cashier', '01012345678', 'saeed.hassan@example.com', 1),
('Menna Allah Ibrahim', 'Manager', '01123456789', 'menna.ibrahim@example.com', 2),
('Ashraf Abdelrahman', 'Teller', '01234567891', 'ashraf.abdelrahman@example.com', 3),
('Salma Mostafa', 'Cashier', '01233445566', 'salma.mostafa@example.com', 4);


select*from Employees







CREATE TABLE Accounts (
    Account_ID INT IDENTITY(1,1) PRIMARY KEY,
    Customer_ID INT,
    Branch_ID INT,
    Account_Type NVARCHAR(50),
    Balance DECIMAL(15,2) DEFAULT 0,
    Open_Date DATE,
    FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID),
    FOREIGN KEY (Branch_ID) REFERENCES Branches(Branch_ID),
    CONSTRAINT chk_balance CHECK (Balance >= 0),
    CONSTRAINT chk_open_date CHECK (Open_Date <= GETDATE())
);

select*from Accounts;
INSERT INTO Accounts (Customer_ID, Branch_ID, Account_Type, Balance, Open_Date) VALUES
(1, 1, 'Saving', 5000.00, '2023-03-01'),
(2, 2, 'Current', 12000.00, '2022-11-15'),
(3, 3, 'Saving', 7500.00, '2021-06-20'),
(4, 4, 'Current', 3000.00, '2023-01-10'),
(5, 1, 'Saving', 10000.00, '2022-09-05');


select*from Accounts;















CREATE TABLE Transactions (
    Transaction_ID INT IDENTITY(1,1) PRIMARY KEY,
    Account_ID INT,
    Target_Account_ID INT NULL,
    Transaction_Date DATETIME DEFAULT GETDATE(),
    Amount DECIMAL(15,2) NOT NULL,
    Transaction_Type NVARCHAR(20) NOT NULL,
    Status NVARCHAR(20) DEFAULT 'Completed',
    Employee_ID INT,
    Branch_ID INT,
    FOREIGN KEY (Account_ID) REFERENCES Accounts(Account_ID),
    FOREIGN KEY (Target_Account_ID) REFERENCES Accounts(Account_ID),
    FOREIGN KEY (Employee_ID) REFERENCES Employees(Employee_ID),
    FOREIGN KEY (Branch_ID) REFERENCES Branches(Branch_ID),
    CONSTRAINT chk_amount_positive CHECK (Amount > 0),
    CONSTRAINT chk_transaction_type CHECK (Transaction_Type IN ('Deposit','Withdrawal','Transfer'))
);


INSERT INTO Transactions (Account_ID, Transaction_Date, Amount, Transaction_Type, Status, Employee_ID, Branch_ID, Target_Account_ID) VALUES
(1, '2025-12-01 10:30:00', 2000.00, 'Deposit', 'Completed', 1, 1, NULL),
(2, '2025-12-05 14:45:00', 500.00, 'Withdrawal', 'Completed', 2, 2, NULL),
(3, '2025-12-07 09:20:00', 1000.00, 'Deposit', 'Completed', 3, 3, NULL),
(1, '2025-12-10 16:00:00', 1000.00, 'Transfer', 'Completed', 1, 1, 2),
(5, '2025-12-12 11:00:00', 1500.00, 'Deposit', 'Completed', 1, 1, NULL);

select*from Transactions;
