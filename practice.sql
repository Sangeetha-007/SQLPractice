SELECT* FROM CITY WHERE CountryCode='USA' AND population>100000;

SELECT NAME FROM CITY WHERE CountryCode='USA' AND POPULATION>120000;

SELECT* FROM CITY WHERE CountryCode='JPN';

SELECT DISTINCT CITY FROM STATION WHERE MOD(STATION.ID,2)=0 ORDER BY CITY;

SELECT DISTINCT CITY FROM STATION WHERE MOD(ID, 2) = 0 ORDER BY CITY;

SELECT DISTINCT CITY FROM STATION WHERE MOD(ID, 2) = 0 ORDER BY CITY;
