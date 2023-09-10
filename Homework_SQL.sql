use hr;

select * from employees;

select * from employees
where job_id = 'IT_PROG';

select * from employees
where salary > 10000;

select * from employees
where salary between 10000 and 20000 ;

select * from employees
where department_id not in (30,60,100) ;

select * from employees
where last_name like '%a';

select salary from employees
where first_name = 'Lex' and last_name = 'De Haan';

select * from departments;

select * from departments
where department_id = 90;

select * from departments
where location_id = 1700;