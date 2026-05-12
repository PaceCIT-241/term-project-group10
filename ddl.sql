CREATE DATABASE IF NOT EXISTS TitanicDB;
USE TitanicDB;
-- Create tables
CREATE TABLE PassengerRaw (
    PassengerId INT,
    Survived TINYINT,
    Pclass INT,
    Name VARCHAR(200),
    Sex VARCHAR(10),
    Age DECIMAL(4,1),
    SibSp INT,
    Parch INT,
    Ticket VARCHAR(50),
    Fare DECIMAL(10,2),
    Cabin VARCHAR(20),
    Embarked CHAR(1)
);

CREATE TABLE Ticket (
    TicketID INT AUTO_INCREMENT PRIMARY KEY,
    TicketNumber VARCHAR(50),
    Pclass INT,
    Fare DECIMAL(10,2)
);

CREATE TABLE Cabin (
    CabinID INT AUTO_INCREMENT PRIMARY KEY,
    CabinCode VARCHAR(20)
);

CREATE TABLE EmbarkationPort (
    PortCode CHAR(1) PRIMARY KEY,
    PortName VARCHAR(50)
);

CREATE TABLE Passenger (
    PassengerID INT AUTO_INCREMENT PRIMARY KEY,
    Survival TINYINT,
    Sex VARCHAR(10),
    Age DECIMAL(4,1),
    SibSp INT,
    Parch INT,
    TicketID INT,
    CabinID INT,
    Embarked CHAR(1),
    FOREIGN KEY (TicketID) REFERENCES Ticket(TicketID),
    FOREIGN KEY (CabinID) REFERENCES Cabin(CabinID),
    FOREIGN KEY (Embarked) REFERENCES EmbarkationPort(PortCode)
);