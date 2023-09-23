use airport;
SELECT * FROM tickets;

SELECT 
id,
service_class,
price,
CASE 
	WHEN price >= 10000 AND price <= 11000
    THEN 'economy'
	WHEN price >= 20000 AND price <= 30000
    THEN 'premium_economy'
	WHEN price >= 100000
    THEN 'business'
	ELSE 'not_categorized'
END as price_category
FROM tickets;

SELECT * FROM airliners;

SELECT 
side_number,
production_year,
CASE 
	WHEN production_year < 2000 
    THEN 'Old'
	WHEN production_year >= 2000 AND production_year <= 2010
    THEN 'Mid'
	WHEN production_year > 2010
    THEN 'New'
END as year_category
FROM airliners
WHERE distance <= 10000
ORDER BY year_category ASC;

SELECT * FROM tickets;

SELECT 
id,
trip_id,
price,
CASE 
	WHEN service_class = 'Economy' 
    THEN price - (price / 15)
	WHEN service_class = 'Business' 
    THEN price - (price / 10)
	WHEN service_class = 'PremiumEconomy' 
    THEN price - (price / 20)
END as newprice
FROM tickets
WHERE trip_id in ('LL4S1G8PQW','SE4S0HRRU','JQF04Q8I9G');

use hr;
select * from employees
where first_name like 'D%'
ORDER BY last_name;