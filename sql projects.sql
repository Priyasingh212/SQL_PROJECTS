CREATE database SQL_PROJECT;
USE SQL_PROJECT;

-- Q1. WRITE AN SQL QUERY TO FIND THE ALL INFORMATION  ABOUT CROP PRODUCTION.

select * from crop_production;

-- INSIGHTS:> Running this query will return all rows and columns present in the crop_production table, providing comprehensive information about crop production 
    -- stored in that table.


-- Q2. WRITE AN SQL QUERY TO SELECT ALL FROM CROP PRODUCTION WHERE CROP IS PAPAYA AND GET HIGHEST 3 STATE .
select * from crop_production
where crop = "papaya"
ORDER BY STATE_NAME LIMIT 3;

-- INSIGHTS:> This query essentially fetches all information about papaya production, but only for the top 3 states in alphabetical order of their names.


-- Q3. FIND state_name, district_name, season, crop ,production AND AVERAGE OF PRODUCTION WHERE PRODUCTIONIS GREATER THAN 100.

select state_name, district_name, season, crop ,production, avg(production) from crop_production
group by state_name, district_name, season, crop ,production
having production >=100;

-- INSIGHTS:> This query essentially provides information about crop production in various states, districts, and seasons, including only those records 
     -- where the production is substantial (greater than or equal to 100),along with the average production for each group.


-- Q4. From the following tables, write a SQL query to find state name ,district name as state, and crop of all season where area is greater than 1000 .

  SELECT CONCAT(STATE_NAME, '  ' ,DISTRICT_NAME) AS STATE, CROP ,SEASON FROM CROP_PRODUCTION
  WHERE AREA >= 1000
  order by AREA desc;
  
     -- INSIGHTS:> This query essentially provides information about crop production in various states and districts, including only those records where the area is 
     -- substantial (greater than or equal to 1000).
  
  
 --  Q5.Write a query to display the DISTRICT NAME and CROP YEAR of any SEASON in the same CROP  as SUGARCANE.
 
 SELECT DISTRICT_NAME, CROP_YEAR, SEASON 
FROM CROP_PRODUCTION 
WHERE CROP IN (SELECT CROP FROM CROP_PRODUCTION WHERE CROP = 'SUGARCANE');
 
 -- INSIGHTS:> THIS QUERY IS FETCHING THE  INFORMATION OF CROP OF SUGERCANE.
 
 
 -- Q6. Create a query to display the CROP YEAR and DISTRICT_NAME of all STATE who PRODUCTION more than the average PRODUCTION. Sort the results in ascending order of PRODUCTION.

    SELECT CROP_YEAR , DISTRICT_NAME FROM CROP_PRODUCTION
WHERE PRODUCTION > (SELECT  AVG(PRODUCTION) FROM CROP_PRODUCTION )
ORDER BY PRODUCTION ASC;
 
  -- INSIGHTS:> The query focuses on identifying records where production exceeds the average production across all records.
-- It then arranges these records in ascending order of production values.


  -- Q7. Find the subcategories that have at least two different AREA less than 1200. 
   
SELECT CROP
FROM (
    SELECT CROP, AREA
    FROM  CROP_PRODUCTION
    WHERE AREA < 1200
    GROUP BY CROP, AREA
) AS sub_prices
GROUP BY CROP
HAVING COUNT( AREA ) >= 2;

-- Insights:> The query effectively filters out crops that have at least two distinct areas with values less than 1200.
		-- It uses a subquery to first identify such combinations and then aggregates them by crop to fulfill the condition specified in the question.

 -- Q8. Write a query that displays the CROP PRODUCTION STATE name and DISTRICT name along with a " in between AND Also displays the CROP  SEASON.
   select concat(STATE_NAME, '   ' , DISTRICT_NAME)as full_name ,SEASON  from CROP_PRODUCTION
      where STATE_name like '%a%' and DISTRICT_name like '%a%';
      
      -- Insights:> The query aims to provide information about crop production along with the associated state, district, and season.
           -- It filters the results based on the presence of the letter 'a' .

 
  -- Q9.Write a query that displays the CROP PRODUCTION STATE names only from the string's 2-5th position with the first letter capitalized and all other letters lowercase,
--  Give each column an appropriate label. 

     select concat(upper(substring(STATE_NAME, 2,1)),
     lower(substring(STATE_name,3,4))) as  1st_leter_capitalized_STATE_NAME
     from CROP_PRODUCTION
     
     -- Insights:> The query transforms the state names to have the first letter capitalized and the rest lowercase, taking characters from the 2nd to the 5th 
          -- positions of the state names.
                  
-- Q10.Display the CROP, if not null display 10% of PRODUCTION, if null display a default value 1.
      select  
         case 
             when CROP is not null  
             then PRODUCTION * 0.10
             else 1
             end  CROP_TEN_PERSENT_INCREASED
        from CROP_PRODUCTION;  
 
 -- Insights:> The query dynamically calculates the value based on the conditions provided, making use of the CASE statement.
 
-- Q11. Display the STATE_NAME and total  PRODUCTION of SEASON in each YEAR.

select STATE_NAME, SEASON, CROP_YEAR , sum(PRODUCTION) as sum_of_each_PRODUCTION from CROP_PRODUCTION
group by STATE_NAME, SEASON, CROP_YEAR;

-- Insights:> The query provides a summary of crop production by state, season, and year, helping to analyze production trends over time.

-- Q12.Display the STATE_NAME and number of DISTRICT in each STATE.

     select  STATE_NAME , count(DISTRICT_NAME) from CROP_PRODUCTION
     group by STATE_NAME;

-- Insights:> The query provides information about the number of districts in each state, which can be useful for administrative, planning, or analysis purposes.

-- Q13  WRITE A SQL QUERY TO FIND THE TOP HIGHEST 3RD CROP PRODUCTION STATE.
 SELECT * FROM CROP_PRODUCTION
 ORDER BY PRODUCTION  DESC LIMIT 1 OFFSET 2;
 
 -- Insights:> The query is useful for identifying states with high crop production, particularly focusing on the third-highest producer.
 

 -- Q14.Display the STATE NAME by Appending two WORD after 2nd digit and '9' in the end, DISTRICT NAME, PRODUCTION and the CROP all in Upper case, if the CROP
-- consists of 'z' replace it with '#'.

          SELECT CONCAT(SUBSTRING(STATE_NAME, 1, 2), 'Andaman and Nicobar Islands', '9') AS changed_STATE_NAME, DISTRICT_NAME,
       UPPER(REPLACE(CROP, 'z', '#')) AS changed_CROP_PRODUCTION
         FROM CROP_PRODUCTION;


-- INSIGHTS:> This query effectively transforms the state name, district name, crop, and production according to the specified requirements, ensuring uppercase 
 -- for crop and proper concatenation and replacement. It's important to verify that the output meets the expected results.










