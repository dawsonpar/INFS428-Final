-- Create a query that displays data for the Employee ID, Employee Last Name, Employee First Name, and
-- Date to summarize which guards worked on New Year’s Day. (If necessary, you can specify a different
-- day depending on your data.)

SELECT g.gID, g.gLName as Lastname, g.gFName as Firstname, s.date
FROM shift as s, guard as g
WHERE s.gID = g.gID
AND s.date = "2023-01-01";

-- Create a query that summarizes the shifts worked by guards during a specific period of time (you
-- decide). Display data for the Employee ID, Employee Last Name, Employee First Name, Date, Total
-- Number of Hours, Tax %, Total Pay

SELECT g.gID, g.gLName as Lastname, g.gFName as Firstname, s.date, EXTRACT(HOUR FROM (clockOutTime - clockInTime)) AS hours_worked,
create_tax_percent(g.city, g.state) as TaxPercent, EXTRACT(HOUR FROM (clockOutTime - clockInTime)) * g.payRate as total_pay
FROM shift as s, guard as g
WHERE s.gID = g.gID





-- Query 2
-- Create a query for popular deliveries. It should display data for the Metal Type, Shape, and Quantity
-- Delivered. Be sure to sort your output with most popular at the top. 

SELECT p.metalType, p.shape, SUM(d.quantity) AS 'Delivered Quantity'
FROM delivery d
JOIN product p ON d.pID = p.pID
WHERE d.deliveryType = 'delivery'
GROUP BY p.metalType, p.shape
ORDER BY 'Delivered Quantity' DESC;
