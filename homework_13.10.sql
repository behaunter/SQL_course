use shop;

select * from customers ;
select * from orders ;
select * from sellers ;

select 
t1.CNAME ,
t2.AMT
from customers t1
inner join orders t2
on t1.CUST_ID = t2.CUST_ID
where AMT > 1000;

-- методом вложения

SELECT 
    CNAME,
    AMT
FROM customers
INNER JOIN orders
ON customers.CUST_ID = orders.CUST_ID
WHERE customers.CUST_ID IN (
    SELECT DISTINCT CUST_ID
    FROM orders
    WHERE AMT > 1000
);

select 
t1.SNAME ,
 CASE
        WHEN t1.COMM IS NOT NULL THEN t1.COMM - t2.COMM
        ELSE NULL
    END AS difference
from sellers t1
LEFT JOIN sellers t2
ON t1.SELL_ID = t2.BOSS_ID  ;

select 
t2.CUST_ID,
t2.SELL_ID,
t1.CNAME,
t3.SNAME
from customers t1
inner join orders t2
on t1.CUST_ID = t2.CUST_ID
inner join sellers t3
on t2.SELL_ID = t3.SELL_ID
where t1.CITY = t3.CITY;

