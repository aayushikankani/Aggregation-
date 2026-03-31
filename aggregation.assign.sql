use world;
show tables;
select * from city;
select * from country;
select * from countrylanguage;

-- Question 1 : Count how many cities are there in each country?

select co.Name,count(CountryCode) as total_cities
from city ct
left join country co
on ct.CountryCode = co.Code
group by ct.CountryCode;

-- Question 2 : Display all continents having more than 30 countries.

select count(Continent) as total_country,Continent
from country
group by Continent
Having count(Continent) > 30;

-- Question 3 : List regions whose total population exceeds 200 million.

select region , population
from country
where population > 20000000;

-- Question 4 : Find the top 5 continents by average GNP per country.

select Continent, avg(GNP) as Avg_GNP
from country
group by Continent
order by Continent asc
limit 5;

-- Question 5 : Find the total number of official languages spoken in each continent.

select  count(IsOfficial) as total_Offical_language, Continent
from countrylanguage cl
left join country c
on c.Code = cl.CountryCode
where IsOfficial = 'T'
group by Continent;

-- Question 6 : Find the maximum and minimum GNP for each continent.
select max(GNP) , MIN(GNP),Continent
FROM country
group by Continent;


-- Question 7 : Find the country with the highest average city population.

select avg(ct.Population) as avg_population, c.Name
from city ct
join country c
on ct.CountryCode = c.Code
group by Name
order by avg(ct.Population) desc
limit 1;




-- Question 8 : List continents where the average city population is greater than 200,000.


select avg(ct.Population) as avg_popu,c.Continent
from city ct
left join country c
on ct.CountryCode = c.Code
group by Continent
having avg_popu > 200000;

-- Question 9 : Find the total population and average life expectancy for each continent, ordered by average life expectancy descending.


select sum(Population) as total_population ,avg(LifeExpectancy) as avg_LIfeExpectancy,Continent
from country
group by Continent
order by avg(LifeExpectancy) desc;


-- Question 10 : Find the top 3 continents with the highest average life expectancy, but only include those where the total population is over 200 million.

select Continent, sum(Population) as total_popuation,avg(LifeExpectancy) as avg_LifeExpectancy
from Country 
group by Continent
having sum(Population) > 20000000
limit 3;





