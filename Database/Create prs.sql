USE master
GO

CREATE DATABASE PRS
GO 

DROP DATABASE IF EXISTS PRS;
GO

USE PRS
GO

SELECT * FROM Users;
SELECT * FROM Vendor;
SELECT * FROM Product;
SELECT * FROM Request;
SELECT * FROM RequestLine;

CREATE TABLE Users
(
	Id			INT				    NOT NULL IDENTITY PRIMARY KEY
	UserName    NVARCHAR(30)		NOT NULL UNIQUE,
	Password 	NVARCHAR(30)		NOT NULL,
	FirstName	NVARCHAR(30)		NOT NULL,
	LastName    NVARCHAR(30)        NOT NULL,
	Phone       VARCHAR(12)        NULL,
	Email       VARCHAR(255)       NULL,
	IsReviewer  BIT               NOT NULL,
	IsAdmin     BIT               NOT NULL,
);

CREATE TABLE Vendor
(

	Id			INT			    NOT NULL IDENTITY PRIMARY KEY,
	Code        VARCHAR(30)		NOT NULL UNIQUE,
	Name 	    VARCHAR(30)		NOT NULL,
	Address	    VARCHAR(30)		NOT NULL,
	City        VARCHAR(30)     NOT NULL,
	State       VARCHAR(2)      NULL,
	Zip         VARCHAR(5)      NULL,
	Phone       VARCHAR(12)     NULL,
	Email       VARCHAR(255)    NULL,
);

CREATE TABLE Product
(

	Id			INT			    NOT NULL IDENTITY PRIMARY KEY,
	PartNbr     VARCHAR(30)		NOT NULL UNIQUE,
	Name 	    VARCHAR(30)		NOT NULL,
	Price	    DECIMAL(11,2)	NOT NULL,
	Unit        VARCHAR(30)     NOT NULL,
	PhotoPath   VARCHAR(255)    NULL,
	VendorId    INT            NOT NULL REFERENCES Vendor(ID)
	
);


CREATE TABLE Request
(

	Id			    INT			    NOT NULL IDENTITY PRIMARY KEY,
	Description     VARCHAR(80)		NOT NULL,
	Justification 	VARCHAR(80)		NOT NULL,
	RejectionReason	VARCHAR(80)	    NULL,
	DeliveryMode    VARCHAR(20)     NOT NULL  DEFAULT 'Pickup',
	SubmittedDate   DATE             NOT NULL DEFAULT GETDATE(),
	DateNeeded      DATE            NOT NULL,
	Status          VARCHAR(10)     NOT NULL,
	Total           DECIMAL(11,2)   NOT NULL,
	UserId          INT             NOT NULL REFERENCES Users(Id)
	
);

CREATE TABLE RequestLine
(
    ID          INT  NOT NULL IDENTITY PRIMARY KEY,
	RequestId   INT  NOT NULL REFERENCES Request(Id),
	ProductId   INT  NOT NULL REFERENCES Product(ID),
	Quantity    INT  NOT NULL

);

-- Hello this is Ike