#1

SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')

#2

SELECT name FROM world
WHERE gdp/population >
(SELECT gdp/population FROM world
WHERE name = 'United Kingdom')
AND continent = 'Europe'

#3

SELECT name,continent FROM world
WHERE continent =
(SELECT continent FROM world
WHERE name = 'Belize')
OR continent = 
(SELECT continent FROM world
WHERE name = 'Belgium')

#4

SELECT name,population FROM world
WHERE population>
(SELECT population FROM world
WHERE name = 'Canada') 
AND population <
(SELECT population FROM world
WHERE name = 'Poland')

#5

SELECT name FROM world
WHERE gdp > ALL
(SELECT gdp FROM world
WHERE continent = 'Europe'
AND gdp>0)

#6

SELECT continent, name, area FROM world x
  WHERE area >= ALL
    (SELECT area FROM world y
        WHERE y.continent=x.continent
          AND area>0)

#7

SELECT name,continent,population FROM world x
WHERE 25000000 >= ALL
(SELECT population FROM world y
WHERE y.continent = x.continent)

#8

SELECT name,continent FROM world x
WHERE population > ALL
(SELECT population*3 FROM world y
WHERE y.continent = x.continent
AND y.name <> x.name)