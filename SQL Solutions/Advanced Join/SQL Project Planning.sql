select start_date,min(end_date) from 
(SELECT Start_Date FROM Projects WHERE Start_Date NOT IN (SELECT End_Date FROM Projects)) as s,
(SELECT end_date FROM Projects WHERE end_date NOT IN (SELECT start_date FROM Projects)) as e
where start_date<end_date
group by start_date
order by datediff(min(end_date),start_date),start_date;
