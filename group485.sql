
--//////////////////////////
DROP TABLE grp48_revise_uuid;
create table grp48_revise_uuid (cost_amt number(25,2), item_uuid number(25), job_id number(25));
insert into grp48_revise_uuid values (40, 125356136514021, 1413983761867060);
insert into grp48_revise_uuid values  (40, 125357747126651, 1413985372479742);
insert into grp48_revise_uuid values  (40,  125364189577658, 1413991814930645);
--//////////////////////////
DROP TABLE grp48_addl_uuid;
create table grp48_addl_uuid (cost_amt number(25,2), item_uuid number(25), job_id number(25));
insert into grp48_addl_uuid values (40, 125350767809503, 1413978393157922);
insert into grp48_addl_uuid values  (100, 125350767809558, 1413978393157938);
insert into grp48_addl_uuid values  (100, 125356136514021, 1413983761867060);
--//////////////////////////
commit;



execute GET_CMPLTD_JOBS;

--TOTAL COST:
--1. REVISED COST
--2. NO REVISED > ORIGINAL COST
--3. ADD ADDITIONAL COST TO TOTAL COST


SELECT  * FROM j_inv_job;


select * from J_ORDR_INV_ITEM_RVW where J_ORDR_INV_OWNER_UUID = 125350767809503 ;
--985561311741841 20 INR
select * from J_ITEM_RVW;
insert into J_ORDR_INV_ITEM_RVW



