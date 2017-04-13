describe board;
describe coaching_staff;
describe player;
describe odi;
describe test;
describe t20;


update odi set total_odi_run=4160 where odi_id=2001;
select odi_id from odi where total_odi_match>=2000;



ALTER TABLE COACHING_STAFF
	ADD STAFF_COUNTRY	VARCHAR(100);



ALTER TABLE COACHING_STAFF
	RENAME COLUMN STAFF_COUNTRY TO STAFF_COUNTRY_NAME;



ALTER TABLE COACHING_STAFF
	DROP COLUMN STAFF_COUNTRY_NAME;
