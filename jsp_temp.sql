


SELECT ename, sal, deptno,
    RANK() over (PARTITION BY deptno ORDER BY sal) sal_rank
FROM emp
;

SELECT ename, sal, deptno
FROM emp
;

SELECT job, deptno
FROM emp;


SELECT job, deptno
FROM emp
GROUP BY GROUPING SETS(job, deptno);

SELECT job, deptno, SUM(sal + NVL(comm, 0)) sal_comm_sum
FROM emp
GROUP BY GROUPING SETS (job, deptno);

SELECT ename, sal, deptno 
FROM emp
ORDER BY deptno, sal DESC;

SELECT ename, sal, deptno,
        RANK() OVER (PARTITION BY deptno ORDER BY sal) rank,
        DENSE_RANK() OVER (PARTITION BY deptno ORDER BY sal) dense_rank,
        ROW_NUMBER() OVER (PARTITION BY deptno ORDER BY sal) row_number
FROM emp;

SELECT * FROM emp;

SELECT ename, sal, deptno,
        RANK() OVER (PARTITION BY deptno ORDER BY sal) rank,
        DENSE_RANK() OVER (PARTITION BY sal ORDER BY sal) dense_rank
FROM emp;

SELECT ename, sal, deptno,
        RANK() OVER (ORDER BY sal DESC, empno) sal_rank,
        DENSE_RANK() OVER (ORDER BY sal DESC, empno) sal_dense_rank,
        ROW_NUMBER() OVER (ORDER BY sal DESC, empno) sal_row_number
FROM emp;

--no-ana2
SELECT ename, sal, deptno,
        COUNT(*) OVER (PARTITION BY deptno ) cnt
FROM emp;

--ana2 
SELECT ename, sal, deptno,
    ROUND(AVG(sal) OVER (PARTITION BY deptno), 2) avg
FROM emp;

--ana3
SELECT ename, sal, deptno,
    MIN(sal) OVER (PARTITION BY deptno) max_sal
FROM emp;

--ana5
SELECT ename, sal, deptno,
    MAX(sal) OVER (PARTITION BY deptno) max_sal,
    LEAD(sal) OVER (ORDER BY sal DESC, sal) lead_sal
FROM emp;


CREATE TABLE sqld_30_18_01 (
    col1 VARCHAR2(30),
    col2 NUMBER
);

INSERT INTO sqld_30_18_01 VALUES('1', 100);
INSERT INTO sqld_30_18_01 VALUES('1', NULL);
INSERT INTO sqld_30_18_01 VALUES('2', 100);
INSERT INTO sqld_30_18_01 VALUES('2', 200);

SELECT *FROM sqld_30_18_01;

SELECT col1, SUM(col2)
FROM sqld_30_18_01
GROUP BY col1;

CREATE TABLE sqld_30_19(
    col1 NUMBER
);

INSERT INTO sqld_30_19 values(1);
INSERT INTO sqld_30_19 values(2);
savepoint sv1;
update sqld_30_19 set col1 = 4 where col1 = 2;
savepoint sv1;
delete sqld_30_19 where col1 >= 2;
rollback to sv1;
insert into sqld_30_19 values(3);
select max(col1) from sqld_30_19;

drop table sqld_30_19;


select decode('ab','cd','de') from dual;

select coalesce (null, 1) from dual;


---- SQLD_30_Q11
create table sqld_30_11_01(
    col1 varchar2(30),
    col2 number
);

create table sqld_30_11_02(
    col1 varchar2(30),
    col3 varchar2(30),
    col4 number
);

insert into sqld_30_11_01 values('1', 20);
insert into sqld_30_11_01 values('2', 30);
insert into sqld_30_11_01 values('3', 40);
insert into sqld_30_11_01 values('A', 50);

insert into sqld_30_11_02 values('1', 'ABC', 10);
insert into sqld_30_11_02 values('2', 'DEF', 9);
insert into sqld_30_11_02 values('3', 'XY', 15);
insert into sqld_30_11_02 values('A', '1', 5);

--1) err
select a.col1, a.col2
from sqld_30_11_01 a
where a.col1 > 0;   --VARCHAR2 > 0 : err 

select a.col1, a.col2
from sqld_30_11_01 a
where a.col2 > '0'; --NUMBER > '0' : ok     
                    --NUMBER > 0 : ok
                    --NUMBER > 'A' : err
          

--2)
select a.col1, b.col4
from sqld_30_11_01 a
    inner join sqld_30_11_02 b
    on (a.col1 = b.col1)
where b.col3 > 'X';

--3)
select count(*)
from sqld_30_11_01 a
where exists (select 'X'
    from sqld_30_11_02 b
    where a.col2 = b.col4);

--4)
select sum(a.col2)
from sqld_30_11_01 a
    inner join sqld_30_11_02 b
    on (a.col1 = b.col1)
where b.col4 > '1';


---- SQLD_30_Q12
create table sqld_30_12_01(
    col1 varchar2(30) primary key,
    col2 number
);

create table sqld_30_12_02(
    col1 varchar2(30) primary key,
    col3 varchar2(30) primary key,
    col4 number foreign key
);

insert into sqld_30_11_01 values('1', 20);
insert into sqld_30_11_01 values('2', 30);
insert into sqld_30_11_01 values('3', 40);
insert into sqld_30_11_01 values('A', 50);

insert into sqld_30_11_02 values('1', 'ABC', 10);
insert into sqld_30_11_02 values('2', 'DEF', 9);
insert into sqld_30_11_02 values('3', 'XY', 15);
insert into sqld_30_11_02 values('A', '1', 5);









