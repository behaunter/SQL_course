SELECT * FROM qa32e_readonly.products;

-- 4.Report the products that have not been sold,
select 
t1.productName
from qa32e_readonly.products t1
inner join qa32e_readonly.orderdetails t2
on t1.productCode = t2.productCode
inner join orders t3
on t2.orderNumber = t3.orderNumber
where t3.status != 'Shipped';

select 
t1.firstName,
t1.lastName,
t2.city
from qa32e_readonly.employees t1
inner join offices t2
on t1.officeCode = t2.officeCode
where city = 'Boston';

-- Report the number of orders 'On Hold' for each customer

select 
-- count((select t1.orderNumber  from qa32e_readonly.orders where status = 'On Hold')),
COALESCE(COUNT(t1.orderNumber), 0),
t1.orderNumber,
t2.customerName
from qa32e_readonly.orders t1
right join customers t2
on t1.customerNumber = t2.customerNumber
where status = 'On Hold';

select  distinct
t2.customerName,
count(t1.orderNumber),
t1.status
from qa32e_readonly.orders t1
inner join customers t2
on t1.customerNumber = t2.customerNumber
where status = 'On hold'
group by t2.customerName;

 -- How many orders have been placed by Herkku Gifts?
 select  distinct
t2.customerName,
count(t1.orderNumber)
from qa32e_readonly.orders t1
inner join customers t2
on t1.customerNumber = t2.customerNumber
where customerName = 'Herkku Gifts';

-- 1. Report the account representative for each customer.
 select 
 t1.customerName,
 t2.lastName
 from customers t1
 left join employees t2
 on t1.salesRepEmployeeNumber = t2.employeeNumber;
 
--  2. Report total payments for Atelier graphique
select 
t1.customerName,
t2.amount
from customers t1
inner join payments t2
on t1.customerNumber = t2.customerNumber;



-- 6. List the products ordered on a Monday

select 
t1.productName,
t3.orderDate
from products t1
inner join orderdetails t2
on t1.productCode = t2.productCode
inner join orders t3
on t2.orderNumber = t3.orderNumber
WHERE DAYOFYEAR(t3.orderDate) = 2;


--  List the names of products sold at less than 80% of the MSRP

select 
t1.productName
from products t1
inner join orderdetails t2
on t1.productCode = t2.productCode
inner join orders t3
on t2.orderNumber = t3.orderNumber
where  (((t1.MSRP - t1.buyPrice) / t1.buyPrice) * 100) <= 80
and t3.status = 'Shipped';


-- 2. List products ending in 'ship'
select productName from products 
where productName like  '%ship';

-- 8. List the products with a product code beginning with S700
select productCode,
count(productCode) from products
where productCode regexp'^S700';

use qa32e_readonly;
-- 3. Report the total payments by date
select 
paymentDate,
sum(amount)
 from payments
group by paymentDate;

-- 5. List the amount paid by each customer.
select 
t1.amount,
t2.customerName
from payments t1
right join customers t2
on t1.customerNumber = t2.customerNumber;

-- 7. Who are the employees in Boston?
select 
t1.lastName,
t1.firstName,
t2.city
from employees t1
inner join offices t2
on t1.officeCode = t2.officeCode
where t2.city = "Boston";

-- 8. Report those payments greater than $100,000. Sort the report so the customer who made the
-- highest payment appears first.
select * from payments
where amount > 100000
order by amount desc;

-- 9. List the value of 'On Hold' orders.
select 
t1.orderNumber,
t2.priceEach
 from orders t1
inner join orderdetails t2
on t1.orderNumber = t2.orderNumber
where t1.status = "On hold";

-- 1. List products sold by order date.
select 
t3.productName
 from orders t1
inner join orderdetails t2
on t1.orderNumber = t2.orderNumber
inner join products t3
on t2.productCode = t3.productCode
group by orderDate;

-- 2. List the order dates in descending order for orders for the 1940 Ford Pickup Truck
select 
t3.productName,
t1.orderDate
 from orders t1
inner join orderdetails t2
on t1.orderNumber = t2.orderNumber
inner join products t3
on t2.productCode = t3.productCode
where productName = "1940 Ford Pickup Truck"
order by orderDate desc;

-- 5. Reports those products that have been sold with a markup of 100% or more (i.e., the
-- priceEach is at least twice the buyPrice)
select 
t1.productName,
t1.buyPrice,
t2.priceEach
from products t1
inner join orderdetails t2
on t1.productCode = t2.productCode
inner join orders t3
on t2.orderNumber = t3.orderNumber
where t2.priceEach >= t1.buyPrice *2
and t3.status = 'Shipped';

-- 7. What is the quantity on hand for products listed on 'On Hold' orders?
select 
count(t1.productName) as productsOnHold
from products t1
inner join orderdetails t2
on t1.productCode = t2.productCode
inner join orders t3
on t2.orderNumber = t3.orderNumber
where t3.status = "On hold";


 
