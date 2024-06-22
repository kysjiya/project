Create Database OnlineBanking;

create table Registered(
 registered_id INTEGER PRIMARY KEY IDENTITY(1,1),
 username VARCHAR(200) UNIQUE,
 user_pass VARCHAR(200),
)
CREATE TABLE Account (
  account_id INTEGER PRIMARY KEY IDENTITY(1,1),
  account_type VARCHAR(50),
  balance DECIMAL(18,2),
  created_at VARCHAR(200) DEFAULT CURRENT_TIMESTAMP,
);
CREATE TABLE Accounts (
 registered_id INTEGER,
    account_id INTEGER,
    FOREIGN KEY (registered_id) REFERENCES Registered(registered_id) ON DELETE CASCADE,
    FOREIGN KEY (account_id) REFERENCES Account(account_id) ON DELETE CASCADE
);
CREATE TABLE Transactions (
  transaction_id INTEGER PRIMARY KEY IDENTITY(1,1),
  transaction_date DATE ,
  transaction_amount DECIMAL(18,2),
  transaction_type VARCHAR(50),
  transaction_password VARCHAR(256) 
);
CREATE TABLE Requests (
  request_id INTEGER PRIMARY KEY IDENTITY(1,1),
  request_date TIMESTAMP,
  request_status VARCHAR(50),
  request_type VARCHAR(50),
);
CREATE TABLE Monthly_Statements (
  month_statement_id INT PRIMARY KEY IDENTITY(1,1),
  month_statement_date DATE,
  month_statement_details VARCHAR(255),
);
CREATE TABLE Annual_Statements (
  statement_id INT PRIMARY KEY IDENTITY(1,1),
  statement_date DATE DEFAULT CURRENT_TIMESTAMP,
  statement_details VARCHAR(255),
);
CREATE TABLE transaction_foreign (
    registered_id INTEGER,
    transac_id INTEGER,
    FOREIGN KEY (registered_id) REFERENCES Registered(registered_id) ON DELETE CASCADE,
    FOREIGN KEY (transac_id) REFERENCES Transactions(transaction_id) ON DELETE CASCADE
);
CREATE TABLE request (
    registered_id INTEGER,
    req_id INTEGER,
    FOREIGN KEY (registered_id) REFERENCES Registered(registered_id) ON DELETE CASCADE,
    FOREIGN KEY (req_id) REFERENCES Requests(request_id) ON DELETE CASCADE
);
CREATE TABLE monthly (
    registered_id INTEGER,
    month_id INTEGER,
    FOREIGN KEY (registered_id) REFERENCES Registered(registered_id) ON DELETE CASCADE,
    FOREIGN KEY (month_id) REFERENCES Monthly_Statements(month_statement_id) ON DELETE CASCADE
); 
CREATE TABLE annual (
    registered_id INTEGER,
    annual_id INTEGER,
    FOREIGN KEY (registered_id) REFERENCES Registered(registered_id) ON DELETE CASCADE,
    FOREIGN KEY (annual_id) REFERENCES Annual_Statements(statement_id) ON DELETE CASCADE
);
CREATE TABLE account_number (
account_number BIGINT UNIQUE,
registered_id INTEGER,
FOREIGN KEY (registered_id) REFERENCES Registered(registered_id) ON DELETE CASCADE
);

INSERT INTO Registered (username, user_pass)
VALUES
    ('user1', 'password1'),
    ('user2', 'password2'),
    ('user3', 'password3');
	
	INSERT INTO Account (account_type, balance)
VALUES
    ('Savings', 1000.00),
    ('Current', 5000.00),
    ('Savings', 2000.00),
    ('Current', 8000.00),
    ('Savings', 3000.00);

	INSERT INTO Accounts (registered_id, account_id)
VALUES
    (1, 1),
    (1, 2),
    (2, 3),
    (2, 4),
    (3, 5);

	INSERT INTO Transactions (transaction_date, transaction_amount, transaction_type, transaction_password)
VALUES
    ('2022-01-01', 500.00, 'Deposit', 'password1'),
    ('2022-01-15', 1000.00, 'Deposit', 'password1'),
    ('2022-01-01', 2000.00, 'Deposit', 'password2'),
    ('2022-01-15', 3000.00, 'Deposit', 'password2'),
    ('2022-01-01', 400.00, 'Deposit', 'password3'),
    ('2022-01-15', 600.00, 'Deposit', 'password3');

	INSERT INTO Requests ( request_status, request_type)
VALUES
    ('Pending','Cheque Book'),
    ('Approved', 'Change of Address'),
    ('Rejected', 'Stop Payment');

	INSERT INTO Monthly_Statements (month_statement_date, month_statement_details)
VALUES
    ('2022-01-01', 'Statement for January 2022'),
    ('2022-02-01', 'Statement for February 2022'),
    ('2022-03-01', 'Statement for March 2022');

	INSERT INTO Annual_Statements (statement_date, statement_details)
VALUES
    ('2022-01-01', 'Statement for 2022'),
    ('2023-01-01', 'Statement for 2023'),
    ('2024-01-01', 'Statement for 2024');

	INSERT INTO transaction_foreign (registered_id, transac_id)
VALUES
    (1, 1),
    (1, 2),
    (2, 3),
    (2, 4),
    (3, 5),
    (3, 6);

	INSERT INTO request (registered_id, req_id)
VALUES
    (1, 1),
    (2, 2),
    (3, 3);

	-- Insert into monthly table
INSERT INTO monthly (registered_id, month_id)
VALUES (1, 1),
       (2, 2),
       (3, 3);
	  -- Insert into annual table
INSERT INTO annual (registered_id, annual_id)
VALUES (1, 1),
       (2, 2),
       (3,3);

-- Insert into account_number table
INSERT INTO account_number (account_number, registered_id)
VALUES (1234567890123456, 1),
       (1234567890123457, 2),
       (1234567890123458, 3);

