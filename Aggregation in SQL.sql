use world;
select * from country;
select * from city;
SELECT 
    Country.Name AS Country,
    COUNT(City.ID) AS NumberOfCities
FROM 
    Country
LEFT JOIN 
    City ON Country.Code = City.CountryCode
GROUP BY 
    Country.Name
ORDER BY 
    NumberOfCities DESC;
select * from country;
SELECT 
    Continent,
    COUNT(*) AS NumberOfCountries
FROM 
    Country
GROUP BY 
    Continent
HAVING 
    COUNT(*) > 30;
SELECT 
    Region,
    SUM(Population) AS TotalPopulation
FROM 
    Country
GROUP BY 
    Region
HAVING 
    SUM(Population) > 200000000;
SELECT 
    Continent,
    AVG(GNP) AS AvgGNP
FROM 
    Country
GROUP BY 
    Continent
ORDER BY 
    AvgGNP DESC
LIMIT 5;
SELECT 
    Country.Continent,
    COUNT(CountryLanguage.Language) AS OfficialLanguages
FROM Country
JOIN CountryLanguage 
    ON Country.Code = CountryLanguage.CountryCode
WHERE CountryLanguage.IsOfficial = 'T'
GROUP BY Country.Continent;
SELECT 
    Continent,
    MAX(GNP) AS MaxGNP,
    MIN(GNP) AS MinGNP
FROM Country
GROUP BY Continent;
SELECT 
    Country.Name,
    AVG(City.Population) AS AvgCityPopulation
FROM Country
JOIN City 
    ON Country.Code = City.CountryCode
GROUP BY Country.Name
ORDER BY AvgCityPopulation DESC
LIMIT 1;
SELECT 
    Country.Continent,
    AVG(City.Population) AS AvgCityPopulation
FROM Country
JOIN City 
    ON Country.Code = City.CountryCode
GROUP BY Country.Continent
HAVING AVG(City.Population) > 200000;
SELECT 
    Continent,
    SUM(Population) AS TotalPopulation,
    AVG(LifeExpectancy) AS AvgLifeExpectancy
FROM Country
GROUP BY Continent
ORDER BY AvgLifeExpectancy DESC;
SELECT 
    Continent,
    SUM(Population) AS TotalPopulation,
    AVG(LifeExpectancy) AS AvgLifeExpectancy
FROM Country
GROUP BY Continent
HAVING SUM(Population) > 200000000
ORDER BY AvgLifeExpectancy DESC
LIMIT 3;