

SELECT *
FROM sqld_21_01
WHERE V1 NOT IN (NULL);

SELECT *
FROM sqld_21_02;

SELECT *
FROM SQLD_21_01 A;

SELECT *
FROM SQLD_21_02 B;

SELECT *
FROM SQLD_21_01 A, SQLD_21_02 B
;

SELECT *
FROM SQLD_21_01 A LEFT JOIN SQLD_21_02 B
ON (A.N1 = B.N1);

SELECT *
FROM SQLD_21_01 A, SQLD_21_02 B
WHERE A.N1 <> B.N1;

SELECT *
FROM SQLD_21_01 A RIGHT JOIN SQLD_21_02 B
ON (A.N1 = B.N1);





SELECT JOB, DEPTNO
FROM EMP
GROUP BY JOB, DEPTNO;

SELECT *
FROM EMP;


SELECT * FROM dba_profiles;

ALTER USER system IDENTIFIED BY java;






insert into dept_h values ('dept0', 'XX회사', '');
insert into dept_h values ('dept0_00', '디자인부', 'dept0');
insert into dept_h values ('dept0_01', '정보기획부', 'dept0');
insert into dept_h values ('dept0_02', '정보시스템부', 'dept0');
insert into dept_h values ('dept0_00_0', '디자인팀', 'dept0_00');
insert into dept_h values ('dept0_01_0', '기획팀', 'dept0_01');
insert into dept_h values ('dept0_02_0', '개발1팀', 'dept0_02');
insert into dept_h values ('dept0_02_1', '개발2팀', 'dept0_02');
insert into dept_h values ('dept0_00_0_0', '기획파트', 'dept0_01_0');
commit;


SELECT * FROM dept_h;


SELECT LEVEL lv, dept_h.*
FROM dept_h
START WITH p_deptcd IS NULL
CONNECT BY PRIOR deptcd = p_deptcd;


SELECT LEVEL lv, dept_h.deptcd, LPAD(' ', (LEVEL-1)*3) || deptnm
FROM dept_h
START WITH p_deptcd IS NULL
CONNECT BY PRIOR deptcd = p_deptcd;

SELECT LPAD('-', 5) ||'aa'
FROM DUAL;









