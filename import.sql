USE TitanicDB;
LOAD DATA LOCAL INFILE 'train.csv'
INTO TABLE PassengerRaw
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
IGNORE 1 ROWS
(PassengerId, Survived, Pclass, Name, Sex, Age, SibSp, Parch, Ticket, Fare, Cabin, Embarked);