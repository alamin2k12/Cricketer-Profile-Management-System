drop table catagories;
create table catagories
(
   player_name  varchar(50),
   player_id    number(5),
   player_salary number(10),
   player_catagories  varchar(5)
);




CREATE TRIGGER TR_CATAGORIES 
BEFORE UPDATE OR INSERT ON CATAGORIES 
FOR EACH ROW 
BEGIN
IF :NEW.PLAYER_SALARY>=100000 THEN
:NEW.player_catagories :='A+';
ELSIF :NEW.PLAYER_SALARY>70000 AND :NEW.PLAYER_SALARY<=80000 THEN
:NEW.player_catagories :='A';
ELSIF :NEW.PLAYER_SALARY>60000 AND :NEW.PLAYER_SALARY<=70000 THEN
:NEW.player_catagories :='B+';
ELSIF :NEW.PLAYER_SALARY>50000 AND :NEW.PLAYER_SALARY<=60000 THEN
:NEW.player_catagories :='B';
ELSIF :NEW.PLAYER_SALARY>=50000 AND :NEW.PLAYER_SALARY<60000 THEN
:NEW.player_catagories:='C';
END IF;
END  ;
/



INSERT INTO CATAGORIES (player_name,player_id,player_salary,player_catagories)
 select player_name,player_id, player_salary,null
from player where player_id=120;
select * from catagories;






SET SERVEROUTPUT ON
DECLARE
     CURSOR salary_cur IS SELECT player_name,player_id, player_salary FROM player;
  salary_record  salary_cur%ROWTYPE;
 bonous_salary  player.player_id%type;

BEGIN
OPEN salary_cur;
      LOOP
        FETCH salary_cur INTO salary_record;
        EXIT WHEN salary_cur%ROWCOUNT > 26;
INSERT INTO CATAGORIES (player_name,player_id,player_salary,player_catagories) values (salary_record.player_name,salary_record.player_id,salary_record.player_salary,null);
   
 END LOOP;
CLOSE salary_cur;   
END;
/
select * from catagories;







select player_name, floor (months_between(sysdate,player_date_birth)/12) from player;