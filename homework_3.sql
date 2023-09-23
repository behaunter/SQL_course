create table staff(
id integer,
name varchar(64),
surname varchar(64),
age integer,
position varchar(64)
);

select * from staff;

insert into staff (id,name,surname,age,position) values (1, 'Alex', 'Alexeev', 24, 'worker'),
  (2, 'Oleg', 'Olegov', 36, 'administration'),
  (3, 'Anna', 'Ivanova', 28, 'security'),
  (4, 'Maria', 'Petrova', 32, 'worker'),
  (5, 'Dmitry', 'Smirnov', 45, 'administration'),
  (6, 'Elena', 'Kozlova', 29, 'security'),
  (7, 'Ivan', 'Sokolov', 31, 'worker'),
  (8, 'Olga', 'Morozova', 27, 'administration'),
  (9, 'Sergei', 'Kuznetsov', 40, 'security'),
  (10, 'Natalia', 'Orlova', 33, 'worker');
  
  ALTER TABLE staff
  ADD salary int;

UPDATE staff
SET salary =
CASE 
	WHEN position = 'worker'
    THEN 1000
	WHEN position = 'administration'
    THEN  5000
	WHEN position = 'security'
    THEN  2500
END;

update staff
SET salary = salary * 2 ;
                          
DELETE FROM staff
WHERE age >= 45;

create view worker_type as
select *
from staff
where position = 'worker';

create view administration_type as
select *
from staff
where position = 'administration';

create view security_type as
select *
from staff
where position = 'security';

select * from administration_type;

CREATE TABLE new_staff AS
SELECT
name,
surname,
position
FROM staff
WHERE position = 'administration';

select * from new_staff;

ALTER TABLE new_staff
DROP COLUMN position;


