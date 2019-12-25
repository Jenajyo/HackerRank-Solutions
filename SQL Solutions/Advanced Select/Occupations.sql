set @r1=0,@r2=0,@r3=0,@r4=0;
select min(Doctor),min(Professor),min(singer),min(Actor) from
(SELECT CASE Occupation WHEN 'Doctor' THEN @r1:=@r1+1
                       WHEN 'Singer' THEN @r2:=@r2+1
                       WHEN 'Actor'  THEN @r3:=@r3+1
                       WHEN 'Professor' THEN @r4:=@r4+1 END
        as ROWLINE,
        CASE WHEN Occupation='Doctor' THEN Name End AS Doctor,
        CASE WHEN Occupation='Singer' THEN Name End AS Singer,
        CASE WHEN OCCUPATION='Actor'  THEN Name End AS Actor,
        CASE WHEN OCCUPATION='Professor' THEN Name End as Professor
        FROM OCCUPATIONS order by Name) as t
    group by rowline;
