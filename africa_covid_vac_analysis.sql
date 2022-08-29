-- Fetching the data for the first table (Covid)

SELECT * 
FROM covid_africa;



-- fetching the data for the second table (Vaccination)

SELECT * 
FROM vaccination_africa;



-- Updating dosesAdministered column, filling empty cells with 0, representing 0 dosesAdministered

UPDATE vaccination_africa 
SET Doses_administered = 0 
WHERE Doses_administered is NULL;

SELECT * 
FROM vaccination_africa;



-- Updating group_of_doses column, replacing "Not Started" with 0

UPDATE vaccination_africa 
SET group_of_doses = "0" 
WHERE group_of_doses = "Not Started";

SELECT * 
FROM vaccination_africa;



-- Top 10 most populated countries 

SELECT covid_africa.Country, covid_africa.population 
FROM covid_africa 
ORDER by covid_africa.Population 
DESC LIMIT 10;



-- Finding main ratios

SELECT 
MIN(covid_africa.Total_Cases_per_million_population) as Min_population_ratio,
MAX(covid_africa.total_cases_per_million_population) as Max_population_ratio,
MIN(covid_africa.deaths_per_million_population) AS Min_death_ratio,
MAX(covid_africa.deaths_per_million_population) AS Max_death_ratio,
MIN(covid_africa.tests_per_milion_population) AS Min_test_ratio,
MAX(covid_africa.tests_per_milion_population) AS Max_test_ratio
FROM covid_africa;



-- Finding Top 10 countries with the most Covid-19 cases in Africa

SELECT covid_africa.Country, total_cases 
FROM covid_africa 
ORDER by total_cases 
DESC LIMIT 10;



-- Finding Top 10 countries with the most covid 19 deaths in Africa

SELECT covid_africa.Country, covid_africa.Total_Deaths 
FROM covid_africa 
ORDER by total_deaths 
DESC LIMIT 10;



-- Finding Top 10 countries with the most covid 19 recovered cases in africa

SELECT covid_africa.Country, covid_africa.Total_Recovered 
FROM covid_africa 
ORDER by total_recovered 
DESC LIMIT 10;



-- Finding Top 10  countries with the most number of total tests 

SELECT covid_africa.Country, covid_africa.Total_Tests 
FROM covid_africa 
ORDER by total_tests 
DESC LIMIT 10;



-- Finding Top 10 countries with the most doses administered

SELECT vaccination_africa.Country, vaccination_africa.doses_administered 
FROM vaccination_africa 
ORDER by doses_administered 
DESC LIMIT 10;



--Finding Group of doses 

SELECT 
DISTINCT vaccination_africa.group_of_doses
FROM vaccination_africa;



-- Finding each Gropu of doses frequency

SELECT 
group_of_doses, 
COUNT(group_of_doses) as Frequency
FROM vaccination_africa
GROUP by group_of_doses
ORDER by Frequency DESC;



-- Finding vaccination situation of top 10 countries with the most active cases

SELECT 
covid_africa.country,
covid_africa.active_cases,
vaccination_africa.Group_of_Doses
FROM covid_africa
JOIN vaccination_africa 
ON covid_africa.country = vaccination_africa.country
order by covid_africa.active_cases DESC
LIMIT 10;



-- Finding vaccination situation of top ten countries with the most recovered cases

SELECT 
covid_africa.country,
covid_africa.Total_Recovered,
vaccination_africa.Group_of_Doses
FROM covid_africa
JOIN vaccination_africa 
ON covid_africa.country = vaccination_africa.country
order by covid_africa.Total_Recovered DESC
LIMIT 10;



-- Finding countries with total data over world average

-- Finding countries with Total cases per million population over world average

SELECT 
covid_africa.country,
total_cases_per_million_population
FROM covid_africa
WHERE total_cases_per_million_population > 30656
ORDER by total_cases_per_million_population DESC;



-- Finding Countries with Total deaths per million population over world average

SELECT 
covid_africa.country,
deaths_per_million_population
FROM covid_africa
where deaths_per_million_population > 625
ORDER by deaths_per_million_population DESC;


-- Finding Countries with Total tests per million population over world average

SELECT 
covid_africa.country,
tests_per_milion_population
FROM covid_africa
where tests_per_milion_population > 14495409
ORDER by tests_per_milion_population DESC;


