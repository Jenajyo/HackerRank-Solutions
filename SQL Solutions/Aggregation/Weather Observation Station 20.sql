set @rownum = -1;
select round(avg(lat_n),4) from 
(select @rownum:=@rownum+1 as rownum,lat_n from station order by lat_n) as t
where rownum in (floor(@rownum/2),ceil(@rownum/2));
