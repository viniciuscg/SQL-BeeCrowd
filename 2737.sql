-- Lawyers

-- The manager of Mangojata Lawyers requested a report on the current lawyers.

-- The manager wants you to show him the name of the lawyer with the most clients, the one 
-- with the fewest and the client average considering all lawyers.

-- OBS: Before presenting the average, show a field called Average to make the report more readable. 
-- The average must be presented as an integer.

-- Schema
-- lawyers
-- Column	Type
-- register (PK)	integer
-- name	varchar
-- customers_number	integer 

-- Tables
-- lawyers
-- register	name	customers_number
-- 1648	Marty M. Harrison	5
-- 2427	Jonathan J. Blevins	15
-- 3365	Chelsey D. Sanders	20
-- 4153	Dorothy W. Ford	16
-- 5525	Penny J. Cormier	6 

-- Output Sample
-- name	customers_number
-- Chelsey D. Sanders	20
-- Marty M. Harrison	5
-- Average	12

select lawyers.name, customers_number 
from lawyers 
where customers_number = (select max(customers_number) from lawyers)
union all
select lawyers.name, MIN(customers_number) 
from lawyers 
where customers_number = (select min(customers_number) from lawyers) group by name
union all
select 'Average', round(avg(customers_number)) from lawyers;
