DROP DATABASE COMPANY;
CREATE DATABASE COMPANY;
USE COMPANY;
CREATE TABLE AUTHENTICATE(
user VARCHAR(30),
password VARCHAR(30)
);
INSERT INTO AUTHENTICATE VALUES
('harry','proj1786'),
('horner','math1111'),
('iiti','best'),
('raju','124asdf');	
use COMPANY;
CREATE TABLE phd_data(
user VARCHAR(30),
password VARCHAR(30),
name VARCHAR(30),
roll bigint,
discipline VARCHAR(30),
school VARCHAR(30),
join_date date,
date_of_confirmation date,
form_link varchar(700) DEFAULT null,

PRIMARY KEY(user,password)
);
INSERT INTO phd_data(user,password,name,roll,discipline,school,join_date,date_of_confirmation) VALUES
('iiti','best','pradeep mathur','170001010','cse','prathiba','2016-9-12','2017-10-9'),
('harry','proj1786','harry potter','170002012','ece','chaitanya','2017-1-1','2018-2-4'),
('horner','math1111','horner smith','170003015','me','narayana','2016-5-10','2017-3-29'),
('raju','124asdf','dil raju','170001052','cse','roots','2017-9-9','2018-12-19');	
CREATE TABLE approval
(
  phd_name VARCHAR(30),
  phd_thesis_link VARCHAR(700),
  is_approved VARCHAR(10),
  person_approving VARCHAR(40),
  action_done VARCHAR(10)
);
SET SQL_SAFE_UPDATES=0;
-- Manually testing sql code
INSERT INTO approval(phd_name,is_approved,person_approving,action_done) VALUES
('iiti','false','ajit','false');
SELECT * FROM approval;
TRUNCATE TABLE approval;
UPDATE approval SET action_done='true',is_approved='false' WHERE phd_name='iiti' AND person_approving='ajit';
SELECT * FROM approval WHERE phd_name="iiti" AND person_approving="ajit";
