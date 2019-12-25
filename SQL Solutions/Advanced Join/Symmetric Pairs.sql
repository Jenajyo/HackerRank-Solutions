select f1.x,f1.y from functions f1 where 
f1.x=f1.y group by f1.x,f1.y having count(*)>1
union
select f1.x,f1.y from functions f1
where exists(select x,y from functions where x=f1.y and y=f1.x and f1.x<x)
order by x;
