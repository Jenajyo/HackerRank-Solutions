select if(grade<8,null,name),grade,marks from grades,students where marks between min_mark and max_mark 
order by grade desc,name;
