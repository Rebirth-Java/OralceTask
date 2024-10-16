
-- 在emp中，使用all关键字过滤工资（sal）同时不等于3000、950和800的员工记录。

select *from C##SCOTT.emp
where SAL != ALL(SELECT SAL FROM C##SCOTT.emp 
WHERE sal  IN (3000, 950, 800));

-- 使用LIKE关键字，在emp表中，要显示在1981年雇佣的所有员工的信息。	

SELECT *
FROM C##SCOTT.emp 
WHERE TO_CHAR(HIREDATE, 'YYYY') LIKE '1981%';
--  在emp表中，查询工作是SALESMAN的员工姓名，但是不记得SALESMAN的准确拼写，但还记得它的第1个字符是S，第3个字符是L，第5个字符为S。
SELECT ename 
FROM C##SCOTT.emp 
WHERE job LIKE 'S_L%S%%';
-- 创建一个dept表与emp表相互关联的视图，并要求该视图只能查询部门编号为20的记录信息。
CREATE VIEW view_dept_emp AS
SELECT 
    e.empno, e.ename, e.job, e.mgr, e.hiredate, e.sal, e.comm, e.deptno,
    d.deptno AS dept_deptno, d.dname, d.loc
FROM 
    C##SCOTT.emp e
JOIN 
    C##SCOTT.dept d ON e.deptno = d.deptno
WHERE 
    e.deptno = 20;
	
	SELECT VIEW view_dept_emp

--通过上一步的视图查询部门员工的工资信息。
SELECT e.sal AS salary
FROM view_dept_emp e;
-- 检索emp表中前4条记录。
SELECT * 
FROM C##SCOTT.emp 
WHERE ROWNUM <= 4 ;
--使用“关联子查询”检索emp表中工资小于同职位平均工资的员工信息。
SELECT e.*
FROM C##SCOTT.emp e
WHERE e.sal < (
    SELECT AVG(SAL)
    FROM C##SCOTT.emp  e2
    WHERE e2.job = e.job
);

insert into C##SCOTT.emp(empno,ename,job) values(9527,'EAST','SALESMAN');
--内连接
SELECT e.*,d.*  FROM  C##SCOTT.emp e  
INNER JOIN  C##SCOTT.dept d ON e.DEPTNO = d.DEPTNO;
--外连接
SELECT e.*,d.*  FROM  C##SCOTT.emp e  
LEFT JOIN  C##SCOTT.dept d ON e.DEPTNO = d.DEPTNO;
--右连接
SELECT e.*,d.*  FROM C##SCOTT.emp e  
RIGHT JOIN C##SCOTT.dept d ON e.DEPTNO = d.DEPTNO;
--外连接
SELECT e.*,d.*  FROM C##SCOTT.emp e  
FULL OUTER JOIN C##SCOTT.dept d ON e.DEPTNO = d.DEPTNO;
--全连接
SELECT  e.*,d.*  FROM C##SCOTT.emp e  
CROSS JOIN C##SCOTT.dept d;
--薪资水平
SELECT 
    e.*,
    CASE 
        WHEN e.SAL < 1000 THEN '低薪'
        WHEN e.SAL >= 1000 AND e.SAL <= 2000 THEN '中等收入'
        WHEN e.SAL > 2000 THEN '高薪'
        ELSE '未知'
    END AS 薪资水平
FROM 
    C##SCOTT.emp e;
		--在员工表emp中，按照deptno分组，找到薪资大于2000的员工。输出部门编号deptno和人员数量。
		
		SELECT deptno as 编号 ,COUNT(*) as 人员数量 FROM C##SCOTT.emp WHERE sal>2000 GROUP BY deptno 