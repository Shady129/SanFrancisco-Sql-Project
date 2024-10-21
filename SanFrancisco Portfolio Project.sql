--Show all columns and rows in the table.

SELECT * FROM Salaries;

--Show only the EmployeeName and JobTitle columns.

SELECT EmployeeName, JobTitle FROM Salaries;


--Show the number of employees in the table.

SELECT count(EmployeeName) AS 'Number OF Employees' FROM Salaries;


--Show the unique job titles in the table.

SELECT DISTINCT JobTitle FROM Salaries;

--Show the job title and overtime pay for all employees with 
-- overtime pay greater than 50000.

SELECT JobTitle,  OvertimePay FROM Salaries
WHERE OvertimePay > 5000;


--Show the average base pay for all employees


select AVG(BasePay) as "Avg BasePay" from salaries;


--Show the number of the employees for each job title

SELECT  COUNT(Id) AS 'Number OF The Employees', JobTitle
FROM Salaries
GROUP BY JobTitle;

--Show the top 10 highest paid employees.

SELECT  TOP 10 EmployeeName, TotalPay FROM Salaries
ORDER BY TotalPay DESC;

--Show the average of BasePay, OvertimePay, and OtherPay for each employee:
select EmployeeName, (BasePay + OvertimePay + OtherPay)/3 as avg_of_bp_op_otherpay from salaries



--Show all employees who have the word "Manager" in their job title.

SELECT  EmployeeName,JobTitle  FROM Salaries
WHERE JobTitle LIKE '%Manager%';


--Show all employees with a job title not equal to "Manager".

SELECT  EmployeeName,JobTitle  FROM Salaries
WHERE JobTitle <> 'Manager';



--Show all employees with a total pay between 50,000 and 75,000.

SELECT EmployeeName, TotalPay FROM Salaries
WHERE TotalPay between 50000 and 75000;

SELECT EmployeeName, TotalPay FROM Salaries
WHERE TotalPay >= 50000 and TotalPay <= 75000;


-- Show all employees with a base pay less than 50,000 or a total pay greater than 100,000.

SELECT EmployeeName, BasePay FROM Salaries
WHERE  50000 < BasePay OR TotalPay > 100000;


--Show all employees with a total pay benefits value between 125,000 and 150,000
--and a job title containing the word "Director".

SELECT EmployeeName, TotalPayBenefits FROM Salaries
WHERE TotalPayBenefits >= 125000 AND TotalPayBenefits <= 150000 AND
JobTitle LIKE '%Director%';

--Show all employees ordered by their total pay benefits in descending order.

SELECT EmployeeName, TotalPayBenefits FROM Salaries
ORDER BY TotalPayBenefits DESC;


--Show all job titles with an average base pay of 
--at least 100,000 and order them by the average base pay in descending order.

SELECT JobTitle, AVG(BasePay) As 'Average Base Pay'  FROM Salaries
GROUP BY JobTitle
HAVING AVG(BasePay) >= 100000
ORDER BY 'Average Base Pay' DESC;

--Delete the column.
ALTER TABLE Salaries
DROP COLUMN Notes;

--Update the base pay of all employees with 
--the job title containing "Manager" by increasing it by 10%.

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









