--Show all columns and rows in the table.

SELECT EmployeeName, JobTitle, BasePay, OvertimePay
FROM Salaries;


--Show only the EmployeeName and JobTitle columns.

SELECT EmployeeName, JobTitle FROM Salaries;


--Show the number of employees in the table.

SELECT COUNT(*) AS NumberOfEmployees
FROM Salaries;


--Show the unique job titles in the table.

SELECT DISTINCT JobTitle FROM Salaries;

--Show the job title and overtime pay for all employees with 
-- overtime pay greater than 50000.

SELECT JobTitle, OvertimePay
FROM Salaries
WHERE OvertimePay > 50000;


--Show the average base pay for all employees


select AVG(BasePay) as "Avg BasePay" from salaries
WHERE BasePay IS NOT NULL;

--Show the number of the employees for each job title

SELECT 
    JobTitle,
    COUNT(*) AS EmployeesCount
FROM Salaries
GROUP BY JobTitle
ORDER BY EmployeesCount DESC;


--Show the top 10 highest paid employees.

SELECT TOP 10 EmployeeName, JobTitle, TotalPay
FROM Salaries
WHERE TotalPay IS NOT NULL
ORDER BY TotalPay DESC;


--Show the average of BasePay, OvertimePay, and OtherPay for each employee:

SELECT 
    EmployeeName,
    (ISNULL(BasePay,0) + ISNULL(OvertimePay,0) + ISNULL(OtherPay,0)) / 3.0 
    AS AvgPay
FROM Salaries;


--Show all employees who have the word "Manager" in their job title.

SELECT  EmployeeName,JobTitle  FROM Salaries
WHERE JobTitle LIKE '%Manager%';


--Show all employees with a job title not equal to "Manager".

SELECT  EmployeeName,JobTitle  FROM Salaries
WHERE JobTitle NOT LIKE '%Manager%';


--Show all employees with a total pay between 50,000 and 75,000.

SELECT EmployeeName, TotalPay FROM Salaries
WHERE TotalPay between 50000 and 75000;

SELECT EmployeeName, TotalPay FROM Salaries
WHERE TotalPay >= 50000 and TotalPay <= 75000;


-- Show all employees with a base pay less than 50,000 or a total pay greater than 100,000.

SELECT EmployeeName, BasePay FROM Salaries
WHERE BasePay < 50000 OR TotalPay > 100000;


--Show all employees with a total pay benefits value between 125,000 and 150,000
--and a job title containing the word "Director".

SELECT EmployeeName, JobTitle, TotalPayBenefits
FROM Salaries
WHERE TotalPayBenefits BETWEEN 125000 AND 150000
AND JobTitle LIKE '%Director%';


--Show all employees ordered by their total pay benefits in descending order.

SELECT EmployeeName, TotalPayBenefits FROM Salaries
ORDER BY TotalPayBenefits DESC;


--Show all job titles with an average base pay of 
--at least 100,000 and order them by the average base pay in descending order.

SELECT JobTitle, AVG(BasePay) As 'Average Base Pay'  FROM Salaries
GROUP BY JobTitle
HAVING AVG(BasePay) >= 100000
ORDER BY AVG(BasePay) DESC;

--Delete the column.
ALTER TABLE Salaries
DROP COLUMN Notes;



--Update the base pay of all employees with 
--the job title containing "Manager" by increasing it by 10%.
-- WARNING: Data modification example
-- This query is for demonstration purposes only
-- The following queries are for learning purposes only
-- and were NOT executed on the original dataset.

UPDATE Salaries
SET BasePay = BasePay * 1.1
WHERE JobTitle LIKE '%Manager%';


--Delete all employees who have no OvertimePay.

--Check before deleting
SELECT * FROM Salaries;

DELETE FROM Salaries
WHERE OvertimePay = 0;

--Check after deleting.
SELECT * FROM Salaries;









