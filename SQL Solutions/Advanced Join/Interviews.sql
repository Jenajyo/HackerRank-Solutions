select c.contest_id,c.hacker_id,c.name,sum(totsub),sum(totaccep), sum(totviews),sum(totuniq) from contests c 
join colleges co on co.contest_id=c.contest_id
join challenges ch on ch.college_id=co.college_id
left join (select challenge_id,sum(total_views) as totviews,sum(total_unique_views) as totuniq
     from view_stats group by challenge_id ) as t on t.challenge_id=ch.challenge_id
left join (select challenge_id,sum(total_submissions) as totsub,sum(total_accepted_submissions) as totaccep from submission_stats group by challenge_id ) as su on su.challenge_id=ch.challenge_id
group by c.contest_id, c.hacker_id, c.name
having sum(totsub)+sum(totaccep)+sum(totviews)+sum(totuniq)<>0
order by c.contest_id;
