








CREATE TABLE sqld_21_01 (
    n1 int,
    v2 varchar(10)
);


CREATE TABLE sqld_21_02 (
    n1 int,
    v2 varchar(10)
);

alter table sqld_21_02 RENAME COLUMN v2 TO v1;

INSERT INTO sqld_21_02 VALUES('1', 'A');
INSERT INTO sqld_21_02 VALUES('2', NULL);
INSERT INTO sqld_21_02 VALUES('3', 'B');


SELECT * FROM sqld_21_01;

SELECT * FROM sqld_21_02;

SELECT * FROM sqld_21_01 A
WHERE EXISTS (SELECT 'X' FROM sqld_21_02 B WHERE A.V1 = B.V1);

SELECT * FROM sqld_21_01 A
WHERE NOT EXISTS (SELECT 'X' FROM sqld_21_02 B WHERE A.V1 = B.V1);

SELECT * FROM sqld_21_01
WHERE v1 NOT IN  (SELECT v1 FROM sqld_21_02);

SELECT * FROM sqld_21_01
WHERE v1 NOT IN (NULL);







