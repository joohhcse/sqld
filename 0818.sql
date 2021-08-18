--P103/100 --subquery
CREATE TABLE 부서 (
	부서번호	VARCHAR2(6),
	부서명	VARCHAR2(20)
);

CREATE TABLE 사원 (
	사원번호	VARCHAR2(6),
	사원명	VARCHAR2(20),
	입사년도  VARCHAR2(4),
	부서번호	VARCHAR2(6)
);

CREATE TABLE 부양가족 (
	사원번호	VARCHAR2(6),
	관계		VARCHAR2(10)
);


INSERT INTO 부서 VALUES('100001','마케팅');
INSERT INTO 부서 VALUES('100002','홍보');
INSERT INTO 부서 VALUES('100003','기획');
INSERT INTO 부서 VALUES('100004','총무');
INSERT INTO 부서 VALUES('100005','개발');

INSERT INTO 사원 VALUES('210001','오윤희','2014','100001');
INSERT INTO 사원 VALUES('210002','천서진','2014','100002');
INSERT INTO 사원 VALUES('210003','심수련','2014','100003');
INSERT INTO 사원 VALUES('210004','주단태','2014','100004');
INSERT INTO 사원 VALUES('210005','강마리','2014','100002');
INSERT INTO 사원 VALUES('210006','이규진','2014','100001');
INSERT INTO 사원 VALUES('210007','하윤철','2014','100002');
INSERT INTO 사원 VALUES('210008','배로나','2014','100003');
INSERT INTO 사원 VALUES('210009','나애교','2014','100004');
INSERT INTO 사원 VALUES('210010','주석훈','2014','100003');

INSERT INTO 부양가족 VALUES('210001','딸');
INSERT INTO 부양가족 VALUES('210002','딸');
INSERT INTO 부양가족 VALUES('210003','딸');
INSERT INTO 부양가족 VALUES('210003','아들');
INSERT INTO 부양가족 VALUES('210004','딸');
INSERT INTO 부양가족 VALUES('210004','아들');
INSERT INTO 부양가족 VALUES('210005','아들');
INSERT INTO 부양가족 VALUES('210006','아들');
INSERT INTO 부양가족 VALUES('210007','딸');

--P104/101 --MAX, JOIN
CREATE TABLE 품질평가항목 (
평가항목ID VARCHAR(1),
평가항목명 VARCHAR(20)
);
CREATE TABLE 평가결과 (

상품ID VARCHAR(6),
평가회차 NUMBER,
평가항목ID VARCHAR(6),
평가등급 VARCHAR(5),
평가일자 VARCHAR(8)

);
CREATE TABLE 평가대상상품(

상품ID VARCHAR(6),
상품명 VARCHAR(25)

);

INSERT INTO 품질평가항목 VALUES ('1','육질');
INSERT INTO 품질평가항목 VALUES ('2','마블링');
INSERT INTO 품질평가항목 VALUES ('3','지방도');
INSERT INTO 평가결과 VALUES ('200001',1,'1','1+','20210501');
INSERT INTO 평가결과 VALUES ('200001',2,'1','1++','20210503');
INSERT INTO 평가결과 VALUES ('200001',1,'2','3','20210501');
INSERT INTO 평가결과 VALUES ('200001',1,'3','1++','20210501');
INSERT INTO 평가결과 VALUES ('200002',1,'1','1','20210502');
INSERT INTO 평가결과 VALUES ('200002',2,'1','1++','20210505');
INSERT INTO 평가결과 VALUES ('200002',1,'2','2','20210504');
INSERT INTO 평가결과 VALUES ('200002',2,'2','1','20210506');
INSERT INTO 평가결과 VALUES ('200002',1,'3','1+','20210503');
INSERT INTO 평가결과 VALUES ('200002',2,'3','1','20210506');
INSERT INTO 평가결과 VALUES ('200003',1,'1','1++','20210501');
INSERT INTO 평가결과 VALUES ('200003',1,'2','1+','20210501');
INSERT INTO 평가결과 VALUES ('200003',1,'3','2','20210501');
INSERT INTO 평가결과 VALUES ('200003',2,'3','1','20210506');
INSERT INTO 평가결과 VALUES ('200003',3,'3','1+','20210508');
INSERT INTO 평가대상상품 VALUES ('200001','횡성축협한우');
INSERT INTO 평가대상상품 VALUES ('200002','문경약돌한우');
INSERT INTO 평가대상상품 VALUES ('200003','무등골그린한우');

--#1
SELECT B.상품ID, B.상품명, C.평가항목ID, C.평가항목명, A.평가회차,
        A.평가등급, A.평가일자
FROM 평가결과 A, 평가대상상품 B, 품질평가항목 C
    (SELECT MAX(평가회차) AS 평가회차 FROM 평가결과) D
WHERE A.상품ID = B.상품ID
AND A.평가항목ID = C.평가항목ID
AND A.평가회차 = D.평가회차;

--#2
SELECT B.상품ID, B.상품명, C.평가항목ID, C.평가항목명, A.평가회차,
        A.평가등급, A.평가일자
FROM 평가결과 A, 평가대상상품 B, 품질평가항목 C
WHERE A.상품ID = B.상품ID
AND A.평가항목ID = C.평가항목ID
AND A.평가회차 = (SELECT MAX(X.평가회차)
                FROM 평가결과 X
                WHERE X.상품ID = B.상품ID
                AND X.평가항목ID = C.평가항목ID);
                
--#3
SELECT B.상품ID, B.상품명, C.평가항목ID, C.평가항목명,
        MAX(A.평가회차) AS 평가회차
        ,MAX(A. 평가등급) AS 평가등급
        ,MAX(A.평가일자) AS 평가일자
FROM 평가결과 A, 평가대상상품 B, 품질평가항목 C
WHERE A.상품ID = B.상품ID
AND A.평가항목ID = C.평가항목ID
GROUP BY B.상품ID, B.상품명, C.평가항목ID, C.평가항목명;



--P108/105 --ROLLUP, GROUPING
CREATE TABLE 서비스 (
	서비스ID		VARCHAR2(3) PRIMARY KEY,
	서비스명		VARCHAR2(10)
);

CREATE TABLE 서비스가입 (
	회원번호		VARCHAR2(1),
	서비스ID		VARCHAR2(3),
	가입일자		VARCHAR2(10),
	CONSTRAINTS 서비스가입PK PRIMARY KEY (회원번호, 서비스ID)
);

INSERT INTO 서비스 VALUES('001','서비스1');
INSERT INTO 서비스 VALUES('002','서비스2');
INSERT INTO 서비스 VALUES('003','서비스3');
INSERT INTO 서비스 VALUES('004','서비스4');

INSERT INTO 서비스가입 VALUES('1','001','2013-01-01');
INSERT INTO 서비스가입 VALUES('1','002','2013-01-02');
INSERT INTO 서비스가입 VALUES('2','001','2013-01-01');
INSERT INTO 서비스가입 VALUES('2','002','2013-01-02');
INSERT INTO 서비스가입 VALUES('2','003','2013-01-03');
INSERT INTO 서비스가입 VALUES('3','001','2013-01-01');
INSERT INTO 서비스가입 VALUES('3','002','2013-01-02');
INSERT INTO 서비스가입 VALUES('3','003','2013-01-03');

[SQL]
SELECT CASE WHEN GROUPING(A.서비스ID) = 0 THEN A.서비스ID
        ELSE '합계' END AS 서비스ID,
        CASE WHEN GROUPING(B.가입일자) = 0
            THEN NVL(B.가입일자, '-') ELSE '소계' END AS 가입일자,
        COUNT(B.회원번호) AS 가입건수
FROM 서비스 A LEFT OUTER JOIN 서비스가입 B
ON( A.서비스ID = B.서비스ID
    AND B.가입일자 BETWEEN '2013-01-01' AND '2013-01-31')
GROUP BY ROLLUP (A.서비스ID, B.가입일자);
         
--P115/111 --GROUPING SETS
CREATE TABLE 월별매출2 (
	상품ID	VARCHAR(4),
	월		VARCHAR(7),
	매출액	NUMBER
);

INSERT INTO 월별매출2 VALUES ('P001','2014.10',1500);
INSERT INTO 월별매출2 VALUES ('P001','2014.11',1500);
INSERT INTO 월별매출2 VALUES ('P001','2014.12',2500);
INSERT INTO 월별매출2 VALUES ('P002','2014.10',1000);
INSERT INTO 월별매출2 VALUES ('P002','2014.11',2000);
INSERT INTO 월별매출2 VALUES ('P002','2014.12',1500);
INSERT INTO 월별매출2 VALUES ('P003','2014.10',2000);
INSERT INTO 월별매출2 VALUES ('P003','2014.11',1000);
INSERT INTO 월별매출2 VALUES ('P003','2014.12',1000);

--[SQL]
SELECT 상품ID, 월, SUM(매출액) AS 매출액
FROM 월별매출2
WHERE 월 BETWEEN '2014.10' AND '2014.12'
GROUP BY GROUPING SETS((상품ID,  월));

--P116/113 RANK 함수, SUM, GROUP BY
CREATE TABLE 고객 (
	고객번호		VARCHAR(3),
	고객명		VARCHAR(20)
);

CREATE TABLE 월별매출 (
	월		VARCHAR(6),
	고객번호	VARCHAR(3),
	매출액	NUMBER
);

INSERT INTO 고객 VALUES('001','홍길동');
INSERT INTO 고객 VALUES('002','이순신');
INSERT INTO 고객 VALUES('003','강감찬');
INSERT INTO 고객 VALUES('004','이상화');
INSERT INTO 고객 VALUES('005','이규혁');

INSERT INTO 월별매출 VALUES('201301','001',200);
INSERT INTO 월별매출 VALUES('201301','002',300);
INSERT INTO 월별매출 VALUES('201301','003',250);
INSERT INTO 월별매출 VALUES('201301','004',300);
INSERT INTO 월별매출 VALUES('201301','005',250);
INSERT INTO 월별매출 VALUES('201302','001',150);
INSERT INTO 월별매출 VALUES('201302','002',150);
INSERT INTO 월별매출 VALUES('201302','004',200);
INSERT INTO 월별매출 VALUES('201302','005',100);
INSERT INTO 월별매출 VALUES('201303','002',100);
INSERT INTO 월별매출 VALUES('201303','003',100);
INSERT INTO 월별매출 VALUES('201303','004',200);
INSERT INTO 월별매출 VALUES('201303','005',350);

SELECT * FROM 고객;
SELECT * FROM 월별매출;

SELECT 고객번호, 고객명, 매출액,
        RANK() OVER(ORDER BY  매출액 DESC) AS 순위
FROM (  SELECT A.고객번호,
                MAX(A.고객명) AS 고객명,
                SUM(B.매출액) AS 매출액
        FROM 고객 A INNER JOIN 월별매출 B
            ON (A.고객번호 = B.고객번호)
        GROUP BY A.고객번호
      )
ORDER BY 순위;




