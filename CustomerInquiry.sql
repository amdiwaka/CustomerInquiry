create database CustomerDatabase;

Use CustomerDatabase;

CREATE TABLE Customers(  
[ID] [bigint] IDENTITY(1,1) NOT NULL,  
[Name] [nvarchar](30) NULL,  
[Email] [nvarchar](25) NULL,  
[MobileNo] [bigint] NULL
CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED  
(  
   [ID] ASC  
))  
GO

CREATE TABLE Transactions(  
[Transaction_ID] [bigint] IDENTITY(1,1) NOT NULL,
[Customer_ID] [bigint] NOT NULL,  
[Date] [datetime] NULL,  
[Amount] [decimal](7,2) NULL,  
[Currency_Code] [nvarchar](10) NULL,
[Status] [nvarchar](15) NULL
CONSTRAINT PK_Transaction PRIMARY KEY(Transaction_ID)
CONSTRAINT FK_Transaction FOREIGN KEY(Customer_ID) REFERENCES Customers(ID));
GO


GO  
SET IDENTITY_INSERT Customers ON  
GO
INSERT INTO Customers(ID, Name, Email, MobileNo) VALUES (1, N'Gnanavel Sekar', N'sg@email.com', 0123456789)  
GO 		  
INSERT INTO Customers (ID, Name, Email, MobileNo) VALUES (3, N'Robert', N'rob@email.com', 0123456789)  
GO		  
INSERT INTO Customers (ID, Name, Email, MobileNo) VALUES (4, N'Ramar', N'ram@email.com', 0123456789)  
GO	  
INSERT INTO Customers (ID, Name, Email, MobileNo) VALUES (10002, N'Subash', N'sub@email.com', 0123456789)  
GO	  
INSERT INTO Customers (ID, Name, Email, MobileNo) VALUES (10003, N'kul', N'k@email.com', 0123456789)  
GO	  
INSERT INTO Customers (ID, Name, Email, MobileNo) VALUES (10004, N'Karthi', N'kar@email.com', 0123456789)  
GO	  
INSERT INTO Customers (ID, Name, Email, MobileNo) VALUES (10005, N'Sharma', N'sha@email.com', 0123456789)  
GO	  
INSERT INTO Customers (ID, Name, Email, MobileNo) VALUES (10006, N'Ammaiyappan', N'amma@email.com', 0123456789)  
GO	  
INSERT INTO Customers (ID, Name, Email, MobileNo) VALUES (10007, N'Manoj', N'man@email.com', 0123456789)  
GO	  
INSERT INTO Customers (ID, Name, Email, MobileNo) VALUES (10008, N'Mr.Blue', N'blue@email.com', 0123456789)  
GO
SET IDENTITY_INSERT Customers OFF  
GO


GO  
SET IDENTITY_INSERT Transactions ON  
GO
INSERT INTO Transactions(Transaction_ID, CUstomer_ID, Date, Amount, Currency_Code, Status) VALUES (100,1,'2018-12-01 19:05',10231,'INR','Success')  	  
GO
INSERT INTO Transactions (Transaction_ID, CUstomer_ID, Date, Amount, Currency_Code, Status) VALUES (101,3, '2018-08-02 19:05', 43242,'INR', 'Failed')  		  
GO
INSERT INTO Transactions (Transaction_ID, CUstomer_ID, Date, Amount, Currency_Code, Status) VALUES (102,4, '2018-11-03 19:05', 64635,'INR', 'Canceled')
GO
INSERT INTO Transactions (Transaction_ID, CUstomer_ID, Date, Amount, Currency_Code, Status) VALUES (103,10002, '2018-05-04 19:05', 23423,'INR', 'Failed')    		  
GO
INSERT INTO Transactions (Transaction_ID, CUstomer_ID, Date, Amount, Currency_Code, Status) VALUES (104,10003,'2018-01-05 19:05', 5434,'USD', 'Failed')
GO
INSERT INTO Transactions (Transaction_ID, CUstomer_ID, Date, Amount, Currency_Code, Status) VALUES (105,10004,'2018-09-06 19:05', 7432,'THB', 'Success')
GO
INSERT INTO Transactions (Transaction_ID, CUstomer_ID, Date, Amount, Currency_Code, Status) VALUES (107,10005,'2018-12-07 19:05', 14356,'JPY', 'Success')
GO
INSERT INTO Transactions (Transaction_ID, CUstomer_ID, Date, Amount, Currency_Code, Status) VALUES (108,10006,'2018-06-08 19:05', 74255,'INR', 'Success')
GO
INSERT INTO Transactions (Transaction_ID, CUstomer_ID, Date, Amount, Currency_Code, Status) VALUES (109,10007,'2018-03-09 19:05', 65422,'USD', 'Canceled')
GO
INSERT INTO Transactions (Transaction_ID, CUstomer_ID, Date, Amount, Currency_Code, Status) VALUES (110,10008,'2018-12-10 19:05', 85432,'THB', 'Canceled')
GO


GO  
SET IDENTITY_INSERT Transactions ON  
GO
INSERT INTO Transactions (Transaction_ID, CUstomer_ID, Date, Amount, Currency_Code, Status) VALUES (111,4,'2018-01-01 19:05', 32114,'USD', 'Success')
GO
INSERT INTO Transactions (Transaction_ID, CUstomer_ID, Date, Amount, Currency_Code, Status) VALUES (112,10008,'2018-02-01 19:05', 96342,'THB', 'Success')
GO
INSERT INTO Transactions (Transaction_ID, CUstomer_ID, Date, Amount, Currency_Code, Status) VALUES (113,1,'2018-03-05 19:05', 23674,'INR', 'Failed')
GO
INSERT INTO Transactions (Transaction_ID, CUstomer_ID, Date, Amount, Currency_Code, Status) VALUES (114,10007,'2018-07-10 19:05', 34175,'JPY', 'Success')
GO
SET IDENTITY_INSERT Transactions OFF  
GO 


Alter table Customers
 Add Unique (Email)