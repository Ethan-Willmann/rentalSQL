/*
Ethan Willmann
1693457
November 18, 2024

This SQL file creates a database storing information
about customers, rentals, and canoes for a canoe rental company
*/

CREATE DATABASE RentalWE57;

USE RentalWE57;

/*
delete tables if they already exist 
for running query multiple times
*/
DROP TABLE IF EXISTS RentalLine_T;
DROP TABLE IF EXISTS Rental_T;
DROP TABLE IF EXISTS Payment_T;
DROP TABLE IF EXISTS Customer_T;
DROP TABLE IF EXISTS Canoe_T;

/*
Create the tables
*/

CREATE TABLE Canoe_T
	(CanoeID MEDIUMINT UNSIGNED NOT NULL,
	 CanoeDescription VARCHAR(500) NOT NULL,
	 

CONSTRAINT Canoe_T PRIMARY KEY (CanoeID));


CREATE TABLE Customer_T
	(CustomerID MEDIUMINT UNSIGNED NOT NULL,
	 Fname VARCHAR(20),
     Lname VARCHAR(20),
     Email VARCHAR(320),
     Phone VARCHAR(30),
     Address VARCHAR(200),
     City VARCHAR(50),
     Country VARCHAR(2),
     PostalCode VARCHAR(20),

CONSTRAINT Customer_T PRIMARY KEY (CustomerID));


CREATE TABLE Payment_T
	(PaymentID MEDIUMINT UNSIGNED AUTO_INCREMENT NOT NULL,
	 CreditCardNo VARCHAR(25),
	 ExpDate DATE,  
     NameOnCard VARCHAR(50),

CONSTRAINT Payment_T PRIMARY KEY (PaymentID));


CREATE TABLE Rental_T
	(RentalID MEDIUMINT UNSIGNED AUTO_INCREMENT NOT NULL,
     PaymentID MEDIUMINT UNSIGNED NOT NULL,
     CustomerID MEDIUMINT UNSIGNED NOT NULL,
	 RentDate DATE NOT NULL,
     DepositAmt DECIMAL(6,2) NOT NULL,
	

CONSTRAINT Rental_T PRIMARY KEY (RentalID),
FOREIGN KEY (CustomerID) REFERENCES Customer_T(CustomerID),
FOREIGN KEY (PaymentID) REFERENCES Payment_T(PaymentID));


CREATE TABLE RentalLine_T
	(RentalID MEDIUMINT UNSIGNED NOT NULL,
     CanoeID MEDIUMINT UNSIGNED NOT NULL,
	 ReturnDate DATE,
     DamageCharge DECIMAL(6,2) NOT NULL,
     RentalFee DECIMAL(6,2) NOT NULL,
	

CONSTRAINT RentalLine_T PRIMARY KEY (CanoeID, RentalID),
FOREIGN KEY (CanoeID) REFERENCES Canoe_T(CanoeID),
FOREIGN KEY (RentalID) REFERENCES Rental_T(RentalID));



/*Description for all tables*/

DESCRIBE Payment_T;
DESCRIBE Customer_T;
DESCRIBE Rental_T;
DESCRIBE RentalLine_T;
DESCRIBE Canoe_T;

/*Data for Canoe_T table*/

Insert into Canoe_T (CanoeID, CanoeDescription)
values (1, '8 person wood');

Insert into Canoe_T (CanoeID, CanoeDescription)
values (2, '4 person metal');

Insert into Canoe_T (CanoeID, CanoeDescription)
values (3, '4 person wood');

Insert into Canoe_T (CanoeID, CanoeDescription)
values (4, '4 person wood');

Insert into Canoe_T (CanoeID, CanoeDescription)
values (5, '4 person metal');

Insert into Canoe_T (CanoeID, CanoeDescription)
values (6, '8 person wood');

Insert into Canoe_T (CanoeID, CanoeDescription)
values (7, '4 person wood');

Insert into Canoe_T (CanoeID, CanoeDescription)
values (8, '4 person metal');

Insert into Canoe_T (CanoeID, CanoeDescription)
values (9, '8 person metal');

Insert into Canoe_T (CanoeID, CanoeDescription)
values (10, '4 person wood');

/*Data for Payment_T table*/

Insert into Payment_T (CreditCardNo, ExpDate, NameOnCard)
values ('0000000000000000', '2026-08-01', 'John Williams');

Insert into Payment_T (CreditCardNo, ExpDate, NameOnCard)
values ('111111111111111', '2026-11-01', 'Bob Jones');

Insert into Payment_T (CreditCardNo, ExpDate, NameOnCard)
values ('22222222222222222', '2027-05-01', 'Sue Todd');

Insert into Payment_T (CreditCardNo, ExpDate, NameOnCard)
values ('33333333333', '2027-04-01', 'Rick Grimes');

/*Data for Customer_T table*/

Insert into Customer_T (CustomerID, Fname, Lname, Email, Phone, Address, City, Country, PostalCode)
values (1, 'John', 'Williams', 'jwill@gmail.com', '+1 (816)-111-1111', '0000 NE 0th St.
', 'Kansas City', 'US', '64118-6234');

Insert into Customer_T (CustomerID, Fname, Lname, Email, Phone, Address, City, Country, PostalCode)
values (2, 'Bob', 'Jones', 'bobj@yahoo.com', '+1 (489)-222-2222', '1111 NW 1nd St.
', 'Vancouver', 'CA', '12345-9876');

Insert into Customer_T (CustomerID, Fname, Lname, Email, Phone, Address, City, Country, PostalCode)
values (3, 'Sue', 'Todd', 'suetodd@gmail.com', '+52 (345)-333-3333', '2222 N 2nd Terr.
', 'Mexico City', 'MX', '22222-2222');

Insert into Customer_T (CustomerID, Fname, Lname, Email, Phone, Address, City, Country, PostalCode)
values (4, 'Rick', 'Grimes', 'rkgrimes@gmail.com', '+55 (898)-444-4444', '3333 NW 3rd St.
', 'São Paulo', 'BR', '33333-3333');

/*Data for Rental_T table*/

Insert into Rental_T (PaymentID, CustomerID, RentDate, DepositAmt)
values (2, 1, '2024-04-17', 0.00);

Insert into Rental_T (PaymentID, CustomerID, RentDate, DepositAmt)
values (1, 1, '2024-05-05', 0.00);

Insert into Rental_T (PaymentID, CustomerID, RentDate, DepositAmt)
values (3, 2, '2024-05-11', 200.00);

Insert into Rental_T (PaymentID, CustomerID, RentDate, DepositAmt)
values (4, 3, '2024-10-30', 75.00);

/*Data for RentalLine_T table*/

Insert into RentalLine_T (RentalID, CanoeID, ReturnDate, DamageCharge, RentalFee)
values (1, 4, '2024-04-20', 0.00, 400.00);

Insert into RentalLine_T (RentalID, CanoeID, ReturnDate, DamageCharge, RentalFee)
values (2, 3, '2024-05-10', 0.00, 200.00);

Insert into RentalLine_T (RentalID, CanoeID, ReturnDate, DamageCharge, RentalFee)
values (2, 10, '2024-05-12', 25.00, 300.00);

Insert into RentalLine_T (RentalID, CanoeID, ReturnDate, DamageCharge, RentalFee)
values (3, 9, '2024-07-30', 150.00, 100.00);

Insert into RentalLine_T (RentalID, CanoeID, ReturnDate, DamageCharge, RentalFee)
values (3, 5, NULL, 0.00, 200.00);

Insert into RentalLine_T (RentalID, CanoeID, ReturnDate, DamageCharge, RentalFee)
values (4, 9, '2024-10-30', 35.00, 100);



COMMIT;

SELECT * FROM Payment_T;
SELECT * FROM Customer_T;
SELECT * FROM Rental_T;
SELECT * FROM RentalLine_T;
SELECT * FROM Canoe_T;


