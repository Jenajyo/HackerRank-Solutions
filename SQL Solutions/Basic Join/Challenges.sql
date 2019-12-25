select c.hacker_id,name,count(challenge_id) as cnt from 
hackers h join Challenges c on h.hacker_id=c.hacker_id
group by c.hacker_id,name
having cnt = 
(select count(c1.challenge_id) from Challenges c1 group by c1.hacker_id order by count(c1.challenge_id) desc limit 1) or cnt not in (select count(c2.challenge_id) from challenges c2 group by c2.hacker_id having c2.hacker_id<>c.hacker_id)
order by cnt desc,h.hacker_id;
/*
Suppose you get a list of hacker ids and sub counts out of the query when you don't have this clause:

hacker, counter 
1, 10
2, 9
3, 9
Two and three shouldn't be in there because they're tied on count, so we can implement it as excluding anyone who counted 9

Consider that conceptually the database will run the query for every row in the results: when processing hacker 2 row the query gets a list of challenge counts where someone whose id isnt 2. This means when considering hacker 2, the dB will pull back a list of the following counts:

10,  --it comes from hacker 1
9     --it comes from hacker 3
The database then goes "i'm processing hacker 2, whose count is 9. I may only include hacker 2 in the results if hacker 2's count(9) is not in the following list of values: 10, 9. Oh, 9 is in the list of banned values. I'll exclude hacker 2 from the results

Repeat for hacker 3, this time a 9 count comes from hacker 2 so 3 is also excluded
/*
                                                                                            
