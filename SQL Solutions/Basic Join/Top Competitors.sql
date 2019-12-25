select h.hacker_id,h.name from hackers h
join challenges c 
join submissions s on s.hacker_id=h.hacker_id and s.challenge_id=c.challenge_id
join difficulty d on d.score=s.score and c.difficulty_level = d.difficulty_level
group by h.hacker_id,h.name having count(*)>1 order by count(s.challenge_id) desc,h.hacker_id;
