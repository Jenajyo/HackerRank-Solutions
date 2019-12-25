select months*salary as total_earnings,count(*) from employee 
        group by total_earnings order by total_earnings desc limit 1 ;
