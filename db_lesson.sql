CREATE TABLE departments(
  department_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(20) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

ALTER TABLE people ADD COLUMN department_id INT unsigned AFTER email;

INSERT INTO departments (name)
VALUES
('営業'),
('開発'),
('経理'),
('人事'),
('情報システム')
;

INSERT INTO people (name,department_id)
VALUES
('佐藤',1),
('鈴木',1),
('高橋',1),
('田中',2),
('伊藤',2),
('渡辺',2),
('山本',2),
('中村',3),
('小林',4),
('加藤',5)
;

INSERT INTO reports (person_id, content)
VALUES
(1,'今日の天気は晴れでした'),
(2,'今日の天気は曇りでした'),
(3,'今日の天気は雨でした'),
(4,'今日の天気は雪でした'),
(6,'今日の天気は雷でした'),
(7,'今日は相談件数が多かったです'),
(8,'今日は契約件数が多かったです'),
(9,'今日は来店件数が多かったです'),
(10,'今日は誘導件数が多かったです'),
(11,'今日は失注件数が多かったです')
;

UPDATE people SET department_id = 1 WHERE age = 20;
UPDATE people SET department_id = 1 WHERE age = 25;
UPDATE people SET department_id = 1 WHERE age = 42;
UPDATE people SET department_id = 1 WHERE age = 34;
UPDATE people SET department_id = 1 WHERE person_id = 6;

SELECT name,age FROM people WHERE gender = 1 ORDER BY age DESC;

department_idカラムの値が1のcreated_atカラムを基準に
peopleテーブルの中のnameとemailとageレコードを取得する

SELECT
  name
FROM
  people
WHERE
  age BETWEEN 20 AND 29 AND gender = 2
OR
  age BETWEEN 40 AND 49 AND gender = 1;

SELECT * FROM people WHERE department_id = 1 ORDER BY age ASC;

SELECT AVG(age) AS average_age FROM people WHERE gender = 2 AND department_id = 2;

SELECT
  p.name,p.department_id,r.content
FROM
  people AS p
INNER JOIN
  reports AS r ON p.person_id = r.person_id;

SELECT
  p.name,r.content
FROM
  people AS p
LEFT OUTER JOIN reports AS r ON p.person_id = r.person_id
WHERE content IS NULL;