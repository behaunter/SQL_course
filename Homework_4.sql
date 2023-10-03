use learn;
select * from students;

ALTER TABLE students
MODIFY COLUMN gender VARCHAR(1);

ALTER TABLE students
CHANGE name firstname VARCHAR(64);

select * from students
where avg_mark > 4;

select * from students
where avg_mark not between 3.0 and 4.0;

select * from students
where firstname like 'I%';

select * from students
where avg_mark in (2.2,3.1,4.7);

create view men as
select * 
from students
where gender = 'M';

select * from men;

create view women as
select * 
from students
where gender = 'F';

select * from women;

select distinct avg_mark
from students;

set sql_safe_updates=0;

ALTER TABLE students
DROP CHECK students_chk_1;

alter table students
modify column avg_mark numeric(3,1);

   update students
		set avg_mark = avg_mark * 10;
        
select * from students;

	update students
		set lastname = 'Sidorov'
        where firstname = 'Oleg' and lastname = 'Petrov';
        
        update students
set avg_mark = avg_mark + 10
WHERE avg_mark <= 31;

select * from students;
        
