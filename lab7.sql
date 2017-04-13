


SET SERVEROUTPUT ON
DECLARE
   max_test_run  test.total_test_run%type;
BEGIN
   SELECT MAX(total_test_run)  INTO max_test_run  
   FROM test;
   DBMS_OUTPUT.PUT_LINE('The maximum test run is : ' || max_test_run);
 END;
/







SET SERVEROUTPUT ON
DECLARE
   date_birth   player.player_date_birth%type;
   name    player.player_name%type;
   max_test_run  test.total_test_run%type;
   player_rel  test.test_player_rel%type;
BEGIN
select max(total_test_run) into max_test_run
from test;
  
   select player_name into name
from player ,test
where player.player_id=test.test_player_rel
and test.total_test_run=max_test_run;
   DBMS_OUTPUT.PUT_LINE('The player name is : ' || name);
 END;

/













SET SERVEROUTPUT ON
DECLARE
    salary      player.player_salary%type;
    bonous_salary player.player_salary%type;
name  player.player_name%type;
	
BEGIN
    select player_name into name
from player
where player. player_id=120;
    

    SELECT player_salary  INTO salary
    FROM player
where player.player_id=120;

    IF salary <= 50000  THEN
                bonous_salary := salary+(0.03*salary);
    ELSIF salary >50000 and salary <=60000   THEN
               bonous_salary := salary+(0.05*salary);
     ELSIF salary >60000 and salary <=80000   THEN
        bonous_salary := salary+(0.10*salary);
   ELSE
    bonous_salary := salary+(0.15*salary);
    END IF;

DBMS_OUTPUT.PUT_LINE (name || '   bonous salary: '||bonous_salary);
EXCEPTION
         WHEN others THEN
	      DBMS_OUTPUT.PUT_LINE (SQLERRM);
END;
/
SHOW errors




