-----实验环境有时不稳定，若出错了请再执行一次
---1.向表中导入数据
truncate table STUDENT_INFO;
delete from  CLASS_INFO;

INSERT INTO CLASS_INFO values(1,'1班');
INSERT INTO CLASS_INFO values(2,'2班');
INSERT INTO CLASS_INFO values(3,'3班');
INSERT INTO CLASS_INFO values(4,'4班');
INSERT INTO CLASS_INFO values(5,'5班');
INSERT INTO CLASS_INFO values(6,'6班');
INSERT INTO CLASS_INFO values(7,'6班');
INSERT INTO CLASS_INFO values(8,'8班');
COMMIT;

INSERT INTO STUDENT_INFO values(10001,'Alice',0,1);
INSERT INTO STUDENT_INFO values(10002,'Bob',0,1);
INSERT INTO STUDENT_INFO values(10003,'Cer',1,1);
INSERT INTO STUDENT_INFO values(10004,'Auh',0,1);
INSERT INTO STUDENT_INFO values(80001,'Oh',0,8);
insert into STUDENT_INFO values (20001,'Weiss',1,2);
insert into STUDENT_INFO values (20002,'Fripp',0,2);
insert into STUDENT_INFO values (20003,'Kaufling',1,2);
insert into STUDENT_INFO values (20004,'Vollman',1,2);
insert into STUDENT_INFO values (20005,'Mourgos',0,2);
insert into STUDENT_INFO values (20006,'Nayer',1,2);
insert into STUDENT_INFO values (20007,'Mikkili',1,2);
insert into STUDENT_INFO values (20008,'Landry',0,2);
insert into STUDENT_INFO values (20009,'Markle',1,2);
insert into STUDENT_INFO values (20011,'Bissot',1,2);
insert into STUDENT_INFO values (30001,'Atkinson',1,3);
insert into STUDENT_INFO values (30002,'Marlow',0,3);
insert into STUDENT_INFO values (30003,'Olson',0,3);
insert into STUDENT_INFO values (30004,'Mallin',1,3);
insert into STUDENT_INFO values (30005,'Rogers',0,3);
insert into STUDENT_INFO values (30006,'Gee',1,3);
insert into STUDENT_INFO values (30007,'Philtan',1,3);
insert into STUDENT_INFO values (30008,'Ladwig',1,3);
insert into STUDENT_INFO values (40001,'Stiles',0,4);
insert into STUDENT_INFO values (40002,'Seo',1,4);
insert into STUDENT_INFO values (40003,'Patel',1,4);
insert into STUDENT_INFO values (40004,'Rajs',1,4);
insert into STUDENT_INFO values (40005,'Davies',0,4);
insert into STUDENT_INFO values (40006,'Matos',1,4);
insert into STUDENT_INFO values (40007,'Vargas',1,4);
insert into STUDENT_INFO values (50001,'Russell',0,5);
insert into STUDENT_INFO values (50002,'Partners',1,5);
insert into STUDENT_INFO values (50003,'Errazuriz',1,5);
insert into STUDENT_INFO values (50004,'Cambrault',1,5);
COMMIT;

--2.将8班的信息，从表CLASS_INFO中删除

--补充对应的sql语句
--3.STUDENT_INFO修改外键约束，将其修改为联动删除(语句中加入ON DELETE CASCADE),使得步骤2能执行成功
--补充对应的sql语句
-- 假设外键名为 STU_CLASS_FK
ALTER TABLE STUDENT_INFO
DROP CONSTRAINT STU_CLASS_FK;
ALTER TABLE STUDENT_INFO
ADD CONSTRAINT STU_CLASS_FK
FOREIGN KEY (class)
REFERENCES CLASS_INFO(class_id)
ON DELETE CASCADE;