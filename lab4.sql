        SELECT MAX(player_salary) FROM player;

	SELECT MAX(total_test_run) FROM test;

	SELECT MAX(total_wicket) FROM test;

	SELECT MAX(total_odi_run) FROM odi;




	SELECT COUNT(*), count(t20_id) FROM t20 where strike_rate>=120;


       SELECT COUNT(*), count(t20_id),sum(total_t20_run),avg(strike_rate) FROM t20;


       SELECT sum(total_test_run),sum(nvl(total_wicket,0)) FROM test;


       	SELECT COUNT(odi_id), COUNT(DISTINCT total_wicket), COUNT(ALL odi_id)
	FROM odi;


	SELECT staff_salary
	FROM coaching_staff 
	GROUP BY staff_salary ;




	SELECT player_salary, COUNT(player_id) 
	FROM player 
	GROUP BY player_salary
	HAVING player_salary > 3;




	SELECT player_salary, COUNT(player_id) 
	FROM player 
        where player_salary > 3
	GROUP BY player_salary;