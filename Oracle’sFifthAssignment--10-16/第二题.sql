---注意：多次执行，请用sqlplus手动将表删除---
---实验环境有时不稳定，若出错了请再执行一次
---1.按要求补全sql语句
CREATE TABLE CLASS_INFO(
class_id number(2) not null ,
remark varchar(20),
 CONSTRAINT CLASS_ID_PK PRIMARY KEY (class_id)
);

/
commit;

---1.按要求补全sql语句
CREATE TABLE STUDENT_INFO(
  ID NUMBER(10) NOT NULL,
  name VARCHAR(10),
  gender NUMBER(1) DEFAULT 0 CHECK (gender IN (0, 1)),
  class NUMBER(2) NOT NULL,
  CONSTRAINT STU_ID_PK PRIMARY KEY (ID),
  CONSTRAINT STU_NAME_UN UNIQUE (name),
  CONSTRAINT STU_CHK_GENDER CHECK (gender IN (0, 1)),
  CONSTRAINT STU_CLASS_FK FOREIGN KEY (class) REFERENCES CLASS_INFO(class_id)
);
/
commit;