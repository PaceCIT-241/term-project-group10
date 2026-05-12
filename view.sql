USE TitanicDB;
CREATE VIEW PassengerView AS
SELECT
    p.PassengerID,
    p.Sex,
    p.Age,
    t.Pclass,
    t.Fare,
    e.PortName
FROM Passenger p
JOIN Ticket t ON p.TicketID = t.TicketID
LEFT JOIN EmbarkationPort e ON p.Embarked = e.PortCode;

SELECT * FROM PassengerView LIMIT 50;