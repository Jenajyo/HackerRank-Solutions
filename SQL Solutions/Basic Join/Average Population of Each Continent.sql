select continent,floor(avg(c.population)) from city c join country ct on c.countrycode=ct.code
group by continent
;
