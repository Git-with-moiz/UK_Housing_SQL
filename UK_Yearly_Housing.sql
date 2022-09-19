-- Import DATASET USING MYSQL WORKBENCH
-- DATASET: housing_in_london_yearly_variables

--- Delete duplicate rows:
delete from housing_in_london_yearly_variables 
where code IN ('E12000006','E13000001','E13000002','K03000001');

-- Error when deleting primary key from the table:
Error Code: 1175. You are using safe update mode and you tried 
to update a table without a WHERE that uses a KEY column.  
To disable safe mode, toggle the option in Preferences -> SQL Editor and reconnect.

-- Deactivated the safe mode
SET SQL_SAFE_UPDATES = 0;

-- Now lets try again:
delete from housing_in_london_yearly_variables 
where code IN ('E12000006','E13000001','E13000002','K03000001','E12000007'); --- Success

-- avg_population_size as per regions between the YEAR 1999 AND 2009:
select area,
round(avg(population_size),0) as avg_population_size -- Rounded the average
from housing_in_london_yearly_variables
where date(date) >= '1999-01-01' and
      date(date) <= '2009-12-31'
group by area
order by avg_population_size desc;

-- TOP 10 most_populated regions between the YEAR 1999 AND 2009:
select area,
max(population_size) as max_population_size
from housing_in_london_yearly_variables
where date(date) >= '1999-01-01' and
      date(date) <= '2009-12-31'
group by area
order by max_population_size desc
limit 10;

-- TOP 10 most_populated regions between the YEAR 2010 AND 2019:
select area,
max(population_size) as max_population_size
from housing_in_london_yearly_variables
where date(date) >= '2010-01-01' and
      date(date) <= '2019-12-31'
group by area
order by max_population_size desc
limit 10;

-- TOP 10 highest mean_salary in the UK between the YEAR 1999 AND 2009
select area,
max(mean_salary) as highest_mean_salary
from housing_in_london_yearly_variables
where date(date) >= '1999-01-01' and
      date(date) <= '2009-12-31'
group by area
order by highest_mean_salary desc
limit 10;

-- Total Number of Jobs as per region over the period the of time:
select area,sum(number_of_jobs) as num_of_jobs_region
from housing_in_london_yearly_variables
group by area
order by num_of_jobs_region desc;

-- Highest Life_satisfaction in the UK by area
select area,max(life_satisfaction) as max_life_satisfaction
from housing_in_london_yearly_variables
group by area,life_satisfaction
order by max_life_satisfaction desc
limit 3;

--- THANK_YOU ----