select c.company_code,
       c.founder,
       count(distinct l.lead_manager_code),
       count(distinct s.senior_manager_code),
       count(distinct m.manager_code),
       count(distinct e.employee_code)
from Company c JOIN Lead_Manager l on c.company_code=l.company_code
join senior_manager s on c.company_code=s.company_code
join manager m on m.company_code=c.company_code
join employee e on e.company_code=c.company_code
group by c.company_code,c.founder
order by c.company_code;
