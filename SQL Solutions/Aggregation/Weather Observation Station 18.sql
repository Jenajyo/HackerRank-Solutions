select round(if((max(long_w)-min(long_w))<0,(max(long_w)-min(long_w))*(-1),max(long_w)-min(long_w))
       +
       if((max(lat_n)-min(lat_n))<0,(max(lat_n)-min(lat_n))*(-1),max(lat_n)-min(lat_n)),4)
       from station;
