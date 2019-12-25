select name from students s
join friends f on s.id=f.id
join packages p on s.id=p.id
join packages fp on fp.id=f.friend_id
where fp.salary>p.salary
order by fp.salary;
