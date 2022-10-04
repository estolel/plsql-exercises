CREATE TABLE grp48_j_order_basic_lev_comp_nt (j_ordr_uuid NUMBER(20),
                                j_ordr_cde NVARCHAR2(10),
                                vendor_cde NVARCHAR2(10),
                                vendor_name NVARCHAR2(50),
                                ofce_cde NVARCHAR2(3),
                                issu_dt_loc DATE,
                                actvy_dt_loc DATE,
                                usr NVARCHAR2(8));
                                
CREATE TABLE j_ordr_nt_uuid (   j_ordr_uuid NUMBER(20),
                                j_ordr_cde NVARCHAR2(10),
                                vendor_cde NVARCHAR2(10),
                                vendor_name NVARCHAR2(50),
                                ofce_cde NVARCHAR2(3),
                                issu_dt_loc DATE,
                                actvy_dt_loc DATE,
                                usr NVARCHAR2(8));
                                
CREATE TABLE j_job_uuid (   j_job_uuid NUMBER(20),
                            j_ordr_cde NVARCHAR2(10),
                            vendor_cde NVARCHAR2(10),
                            vendor_name NVARCHAR2(50),
                            ofce_cde NVARCHAR2(3),
                            issu_dt_loc DATE,
                            actvy_dt_loc DATE,
                            usr NVARCHAR2(8));
                            
CREATE TABLE group48_j_item_uuid (j_item_uuid NUMBER(20), job_item_uuid NUMBER(20));

drop table j_inv_job
CREATE TABLE j_inv_job(  j_job_uuid NUMBER(20),
ccy VARCHAR2(3),
                        ttl NUMBER(20,2),
                        ttl_inv NUMBER(20,2),
                        ttl_uninv NUMBER(20,2),
                        j_ordr_cde NVARCHAR2(10),
                        vendor_cde NVARCHAR2(10),
                        vendor_name NVARCHAR2(50),
                        ofce_cde NVARCHAR2(3),
                        issu_dt_loc DATE,
                        actvy_dt_loc DATE,
                        usr NVARCHAR2(8));
                        
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
                                