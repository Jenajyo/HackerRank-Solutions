SELECT CASE WHEN ((A+B)<=C)  OR ((B+C)<= A)  OR ((C+A)<=B) THEN 'Not A Triangle'
            WHEN A=B and A=C THEN 'Equilateral' 
            WHEN (A=B AND A!=C) OR (A=C AND A!=B) or (B=C AND A!=B) THEN 'Isosceles'
            WHEN (A!=B and B!=C and C!=A) THEN 'Scalene'
            END AS 'TYPE'
            from triangles;
