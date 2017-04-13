select distinct(total_odi_match),odi_id from odi;
select distinct(total_test_match),test_id from test;
select distinct(total_t20_match),t20_id from t20;

select player_name,player_salary from player where player_salary>=50000;
select (player_salary/5) from player;

select player_name,player_salary from player where player_salary=100000 or player_salary=50000;


select odi_id from odi where total_odi_match between 50 and 120;
select test_id from test where total_test_match between 20 and 100;
select t20_id from t20 where total_t20_match between 5 and 50;




select odi_id from odi where total_odi_match not between 50 and 120;
select test_id from test where total_test_match not between 20 and 100;
select t20_id from t20 where total_t20_match not between 5 and 50;



select player_id,player_name,player_salary from player where player_salary>=50000 and player_salary<=60000;

select player_id,player_name,player_salary from player where player_salary in(50000,60000);

select player_id,player_name,player_salary from player where player_salary not in(50000,60000);



select player_id,player_name from player where player_district like '%DHAKA%';

SELECT  ODI_ID FROM ODI WHERE PLAYER_OPTION LIKE '%SPINNER%';

SELECT  ODI_ID FROM ODI WHERE PLAYER_OPTION LIKE '%LEFT HAND BATSMAN%';

SELECT  ODI_ID FROM ODI WHERE PLAYER_OPTION LIKE '%PACE BOWLER%';

SELECT  ODI_ID FROM ODI WHERE BOWLLING_TYPE LIKE '%OFF BREAK%';

SELECT  ODI_ID FROM ODI WHERE BOWLLING_TYPE LIKE '%LEFT ARM SPINNER%';



SELECT TEST_ID ,TOTAL_TEST_MATCH FROM TEST ORDER BY TOTAL_TEST_MATCH DESC;


SELECT TEST_ID ,TOTAL_TEST_MATCH FROM TEST ORDER BY TOTAL_TEST_MATCH  ASC;


SELECT T20_ID ,TOTAL_T20_MATCH FROM T20 ORDER BY TOTAL_T20_RUN  DESC;
