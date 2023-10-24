use uni;

-- Вывести имя студента и имена  старост, которые есть на курсах, которые он проходит

SELECT 
t1.name StudentName,
 t4.name HeadmanName
FROM Students t1
JOIN Students2Courses t2
ON t1.id = t2.student_id
JOIN Courses t3
ON t2.course_id = t3.id
JOIN Students t4
 ON t3.headman_id = t4.id;
 

-- 2.Используем БД shop :
-- Выведите имена покупателей, которые сделали заказ.
-- Предусмотрите в выборке также имена продавцов.
-- Примечание: покупатели и продавцы должны быть из разных городов.
-- В выборке должно присутствовать два атрибута — cname, sname.

use shop;
select * from customers;
select * from orders;
select * from sellers;

select 
t1.CNAME,
t3.SNAME
 from customers t1
inner join orders t2
on t1.CUST_ID = t2.CUST_ID
inner join sellers t3
on t2.SELL_ID = t3.SELL_ID
where t1.city != t3.city;



-- 3..Используем БД shop :
-- Вывести имена покупателей которые ничего никогда не покупали.
-- Решить задачу двумя способами : через join и через подзапрос

select 
t1.CNAME
from customers t1
left join orders t2
on t1.CUST_ID = t2.CUST_ID
where t2.order_id is NULL;

SELECT CNAME
FROM customers
WHERE CUST_ID NOT IN (SELECT DISTINCT CUST_ID FROM ORDERS);
 