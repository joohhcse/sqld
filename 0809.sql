



CREATE TABLE TAB1 (
    c1 int,
    c2 int,
    c3 varchar(20)
)
;

select *
from tab1;


INSERT INTO tab1 VALUES('1', NULL, 'A');
INSERT INTO tab1 VALUES('2', '1', 'B');
INSERT INTO tab1 VALUES('3', '2', 'C');
INSERT INTO tab1 VALUES('4', '3', 'D');

SELECT c3
FROM TAB1
START WITH C2 IS NULL
CONNECT BY PRIOR C1 = C2
ORDER SIBLINGS BY C3 DESC
;


CREATE TABLE T_G6_tab1 (
    col1 int
);

CREATE TABLE T_G6_tab2 (
    col2 int
);

INSERT INTO T_G6_tab2 VALUES('1');

SELECT *
FROM T_G6_TAB1 A, T_G6_TAB2 B
WHERE A.COL1 <> B.COL2
;

