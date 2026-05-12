USE TitanicDB;

-- Top 100 rows
SELECT * FROM Passenger LIMIT 100;
SELECT * FROM Ticket LIMIT 100;
SELECT * FROM Cabin LIMIT 100;
SELECT * FROM EmbarkationPort LIMIT 100;

-- JOIN
SELECT
    p.PassengerID,
    p.Sex,
    p.Age,
    t.Pclass,
    t.Fare,
    e.PortName
FROM Passenger p
JOIN Ticket t ON p.TicketID = t.TicketID
LEFT JOIN EmbarkationPort e ON p.Embarked = e.PortCode
LIMIT 100;

-- Average Fare
SELECT t.Pclass, AVG(t.Fare) AS AvgFare
FROM Ticket t
GROUP BY t.Pclass;