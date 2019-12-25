select h.hacker_id,name,sum(t.maximum) as total 
from  (select hacker_id,challenge_id,max(score) as maximum from submissions group by challenge_id,hacker_id) as t 
join hackers h on h.hacker_id=t.hacker_id
group by h.hacker_id,name
having total>0
order by total desc,h.hacker_id
;
