USE TitanicDB;

-- Populate Ticket table
INSERT INTO Ticket (TicketNumber, Pclass, Fare)
SELECT DISTINCT Ticket, Pclass, Fare
FROM PassengerRaw;

-- Populate Cabin table
INSERT INTO Cabin (CabinCode)
SELECT DISTINCT Cabin
FROM PassengerRaw
WHERE Cabin IS NOT NULL AND Cabin <> '';

--Populate EmbarkationPort table
INSERT INTO EmbarkationPort (PortCode, PortName)
SELECT DISTINCT Embarked,
       CASE Embarked
           WHEN 'C' THEN 'Cherbourg'
           WHEN 'Q' THEN 'Queenstown'
           WHEN 'S' THEN 'Southampton'
           ELSE 'Unknown'
       END
FROM PassengerRaw
WHERE Embarked IS NOT NULL AND Embarked <> '';

-- Populate Passenger table
INSERT INTO Passenger (
    Survival, Sex, Age, SibSp, Parch,
    TicketID, CabinID, Embarked
)
SELECT
    pr.Survived,
    pr.Sex,
    pr.Age,
    pr.SibSp,
    pr.Parch,
    t.TicketID,
    c.CabinID,
    pr.Embarked
FROM PassengerRaw pr
JOIN Ticket t ON pr.Ticket = t.TicketNumber
LEFT JOIN Cabin c ON pr.Cabin = c.CabinCode;