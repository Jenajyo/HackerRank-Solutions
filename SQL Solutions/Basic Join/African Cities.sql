select city.name 
from city join country 
on CITY.CountryCode = COUNTRY.Code 
where continent='Africa';
