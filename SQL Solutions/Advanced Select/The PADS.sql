select  concat(name,'(',left(occupation,1),')') from occupations order by concat(name,'(',left(occupation,1),')');
select concat('There are a total of ',count(Name),' ',lower(Occupation),'s.') from occupations group by occupation order by count(name),occupation;
