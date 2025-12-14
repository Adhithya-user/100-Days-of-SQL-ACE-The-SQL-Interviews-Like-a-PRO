create table icc_world_cup
(
Team_1 Varchar(20),
Team_2 Varchar(20),
Winner Varchar(20)
);
INSERT INTO icc_world_cup values('India','SL','India');
INSERT INTO icc_world_cup values('SL','Aus','Aus');
INSERT INTO icc_world_cup values('SA','Eng','Eng');
INSERT INTO icc_world_cup values('Eng','NZ','NZ');
INSERT INTO icc_world_cup values('Aus','India','India');

select * from icc_world_cup;


SELECT Team_name,count(1) as no_of_matches_played,sum(WIN_FLAG) as no_of_matches_win,count(1)-sum(WIN_FLAG) as no_of_matches_losses 
from(
SELECT Team_1 as Team_name,CASE WHEN Team_1=Winner THEN 1 ELSE 0 END AS WIN_FLAG
FROM icc_world_cup
union all
SELECT Team_2 as Team_name,CASE WHEN Team_2=WINNER THEN 1 ELSE 0 END AS WIN_FLAG
FROM icc_world_cup) A 
group by Team_name
order by no_of_matches_win desc
