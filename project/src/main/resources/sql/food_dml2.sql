SELECT *  
FROM (SELECT ROWNUM,  
             m.*,  
             FLOOR((ROWNUM - 1) / 9 + 1) page  
      FROM (
             SELECT * FROM food_tbl 
             ORDER BY food_id ASC
           ) m  
      )  
WHERE page = 3;