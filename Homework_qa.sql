use qa32e_readonly;
SELECT * FROM qa32e_readonly.payments
where amount > (2* (select avg(amount) from qa32e_readonly.payments));
SELECT * FROM qa32e_readonly.payments;

SELECT * FROM qa32e_readonly.customers;
-- Report the name and city of customers who don't have sales representatives? 
SELECT 
customerName,
city
FROM qa32e_readonly.customers
where salesRepEmployeeNumber is null;

use qa32e_readonly;

-- 1.	Prepare a list of offices sorted by country, state, city.
select * from offices
ORDER BY state,city,country;

-- 2. How many employees are there in the company?
select * from employees;
select count(employeeNumber)
from employees;

-- 3. What is the total of payments received?
select * from payments;
SELECT SUM(amount)
FROM payments;

-- 4. List the product lines that contain 'Cars'.
SELECT * FROM productlines
WHERE productline LIKE '%Cars%';

-- 5. Report total payments for October 28, 2004.
SELECT SUM(amount)
FROM payments
where paymentDate = '2004-10-28';

-- 6.Report those payments greater than $100,000.
SELECT *
FROM payments
where amount > 100000;

-- 7. List the products in each product line.
select productName , productLine from products
order by productLine;

-- 8. How many products in each product line?
SELECT productline, 
COUNT(productName) AS product_count
FROM products
GROUP BY productline;

-- 9. What is the minimum payment received?
SELECT MIN(amount)
FROM payments;

-- 10. List all payments greater than twice the average payment.
SELECT * FROM qa32e_readonly.payments
where amount > (2* (select avg(amount) from qa32e_readonly.payments));

-- 11. What is the average percentage markup of the MSRP on buyPrice?
SELECT AVG(((MSRP - buyPrice) / buyPrice) * 100) AS average_markup_percentage
FROM products;

-- 12. How many distinct products does ClassicModels sell?
SELECT COUNT(distinct productName) FROM qa32e_readonly.products
where productLine = 'Classic Cars';

-- 13. Report the name and city of customers who don't have sales representatives?
SELECT 
customerName,
city
FROM qa32e_readonly.customers
where salesRepEmployeeNumber is null;

-- 14. What are the names of executives with VP or Manager in their title? Use the CONCAT function
-- to combine the employee's first name and last name into a single field for reporting.
SELECT CONCAT(firstName, ' ', lastName) AS full_name
FROM employees
where jobTitle LIKE '%VP%' OR  jobTitle LIKE '%Manager%';

-- 15. Which orders have a value greater than $5,000?
select t1.orderNumber,
t2.priceEach * t2.quantityOrdered as priceTotal
from orders t1
inner join orderdetails t2
on t1.orderNumber = t2.orderNumber
having priceTotal > 5000;