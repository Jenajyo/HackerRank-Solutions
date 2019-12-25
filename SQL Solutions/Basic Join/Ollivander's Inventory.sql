select id,age,t.coins,t.power from 
(select code,min(coins_needed) as coins,power from wands 
group by power,code) as t
join wands w on w.code=t.code and w.coins_needed=t.coins and w.power=t.power
join wands_property p on p.code=t.code
where is_evil=0
order by t.power desc,age desc;
