use hr;

select * from employees;

select 
t1.job_id
from employees t1
inner join employees t2
on t1.employee_id = t2.manager_id
where t1.salary > t2.salary;

select 
t1.first_name,
t1.last_name,
t3.city
from employees t1
inner join departments t2
on t1.department_id = t2.department_id
inner join locations t3
on t2.location_id = t3.location_id
where city in ('Seattle','Toronto');

select 
t1.first_name,
t1.last_name,
t2.department_name,
t3.job_title
from employees t1
inner join departments t2
on t1.department_id = t2.department_id
inner join jobs t3
on t1.job_id = t3.job_id;

