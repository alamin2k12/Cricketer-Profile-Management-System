

SET SERVEROUTPUT ON
DECLARE
     CURSOR salary_cur IS SELECT player_name, player_salary FROM player;
  salary_record  salary_cur%ROWTYPE;
 bonous_salary  player.player_id%type;

BEGIN
OPEN salary_cur;
      LOOP
        FETCH salary_cur INTO salary_record;
        EXIT WHEN salary_cur%ROWCOUNT > 26;
    IF salary_record.player_salary <= 50000  THEN
                bonous_salary := salary_record.player_salary+(0.03*salary_record.player_salary);
    ELSIF salary_record.player_salary >50000 and salary_record.player_salary <=60000   THEN
               bonous_salary := salary_record.player_salary+(0.05*salary_record.player_salary);
    ELSIF salary_record.player_salary >60000 and salary_record.player_salary <=80000   THEN
        bonous_salary := salary_record.player_salary+(0.10*salary_record.player_salary);
   ELSE
    bonous_salary := salary_record.player_salary+(0.15*salary_record.player_salary);
    END IF;
 DBMS_OUTPUT.PUT_LINE ('For  ' ||salary_record.player_name||  '  bonous salary: '||bonous_salary);
 END LOOP;
CLOSE salary_cur;   
END;
/



SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE pro_cedure IS 
   odi_p_id  odi.odi_player_rel%type;
    wicket odi.total_wicket%type;
   name   player.player_name%type;
BEGIN
    odi_p_id := 143;
    select total_wicket into wicket
    FROM odi
    WHERE odi_player_rel = odi_p_id;
    DBMS_OUTPUT.PUT_LINE('wicket: '||wicket);
END;
/
SHOW ERRORS;


BEGIN
pro_cedure;
END;
/



CREATE OR REPLACE FUNCTION sum_odi_run RETURN NUMBER IS
   run odi.total_odi_run%type;
BEGIN
  SELECT sum(total_odi_run) INTO run
  FROM odi;
   RETURN run;
END;
/


SET SERVEROUTPUT ON
BEGIN
dbms_output.put_line('SUM TOTAL ODI RUN FOR ALL PLAYER is:     ' || sum_odi_run);
END;
/


CREATE OR REPLACE FUNCTION get_annual_comp(
  sal  IN player.player_salary%TYPE,
  comm IN odi.strike_rate%TYPE)
 RETURN NUMBER IS
BEGIN
  RETURN (NVL(sal,0) * 12 + (NVL(comm,0) * nvl(sal,0) * 12));
END get_annual_comp;
/


SELECT player_id, player_name,
       get_annual_comp(player_salary,0.10) "Annual Compensation"
FROM   player
WHERE player_id=120
/





