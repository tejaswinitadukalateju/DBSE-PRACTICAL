CREATE DATABASE IF NOT EXISTS bank_management;

USE bank_management;

DROP TABLE IF EXISTS class_info;
DROP TABLE IF EXISTS class;

CREATE TABLE class (
    id INT,
    name VARCHAR(30)
);

CREATE TABLE class_info (
    id INT,
    address VARCHAR(30)
);
INSERT INTO class VALUES
(1, 'abhi'),
(2, 'adam'),
(3, 'alex'),
(4, 'anu'),
(5, 'ashish');

INSERT INTO class_info VALUES
(1, 'DELHI'),
(2, 'MUMBAI'),
(3, 'CHENNAI'),
(7, 'NOIDA'),
(8, 'PANIPAT');
SELECT *
FROM class
CROSS JOIN class_info;
SELECT *
FROM class
INNER JOIN class_info
ON class.id = class_info.id;
SELECT class.name,
       class_info.address
FROM class
INNER JOIN class_info
ON class.id = class_info.id;
SELECT *
FROM class
NATURAL JOIN class_info;
SELECT *
FROM class
LEFT JOIN class_info
ON class.id = class_info.id;
SELECT *
FROM class
LEFT JOIN class_info
ON class.id = class_info.id
WHERE class_info.id IS NULL;
SELECT *
FROM class
RIGHT JOIN class_info
ON class.id = class_info.id;
SELECT *
FROM class
RIGHT JOIN class_info
ON class.id = class_info.id
WHERE class.id IS NULL;
SELECT *
FROM class
LEFT JOIN class_info
ON class.id = class_info.id

UNION

SELECT *
FROM class
RIGHT JOIN class_info
ON class.id = class_info.id;
SELECT *
FROM class
LEFT JOIN class_info
ON class.id = class_info.id
WHERE class_info.id IS NULL

UNION

SELECT *
FROM class
RIGHT JOIN class_info
ON class.id = class_info.id
WHERE class.id IS NULL;
CREATE TABLE first_table (
    id INT,
    name VARCHAR(30)
);

CREATE TABLE second_table (
    id INT,
    name VARCHAR(30)
);
INSERT INTO first_table VALUES
(1, 'abhi'),
(2, 'adam'),
(3, 'alex'),
(4, 'anu'),
(5, 'ashish');

INSERT INTO second_table VALUES
(2, 'adam'),
(3, 'alex'),
(6, 'sai'),
(7, 'sah');
SELECT *
FROM first_table

UNION

SELECT *
FROM second_table;
CREATE TABLE first_table (
    id INT,
    name VARCHAR(30)
);
INSERT INTO first_table VALUES
(1, 'abhi'),
(2, 'adam'),
(3, 'alex'),
(4, 'anu'),
(5, 'ashish');
SELECT *
FROM first_table

UNION

SELECT *
FROM second_table;
SELECT name
FROM first_table

UNION

SELECT name
FROM second_table;
SELECT *
FROM first_table

UNION ALL

SELECT *
FROM second_table;
SELECT COUNT(*)
FROM (
    SELECT *
    FROM first_table

    UNION ALL

    SELECT *
    FROM second_table
) AS combined;
SELECT *
FROM first_table
WHERE id IN (
    SELECT id
    FROM second_table
);
SELECT name
FROM first_table
WHERE name IN (
    SELECT name
    FROM second_table
);
SELECT *
FROM first_table
WHERE id NOT IN (
    SELECT id
    FROM second_table
);
SELECT name
FROM first_table
WHERE name NOT IN (
    SELECT name
    FROM second_table
);
SELECT c.id,
       c.name,
       ci.address
FROM class c
INNER JOIN class_info ci
ON c.id = ci.id;
SELECT c.id,
       c.name,
       CASE
           WHEN ci.address IS NULL
           THEN 'Address Missing'
           ELSE 'Address Available'
       END AS Status
FROM class c
LEFT JOIN class_info ci
ON c.id = ci.id;