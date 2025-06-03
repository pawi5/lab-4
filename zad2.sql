CREATE TABLE student (
    id INT,
    imie VARCHAR(100),
    urodziny DATE
);

SET @json = '
[
  {"id":1,"imie":"Jan","urodziny":"2000-01-01"},
  {"id":2,"imie":"Anna","urodziny":"1999-12-15"}
]';

INSERT INTO student (id, imie, urodziny)
SELECT
  JSON_UNQUOTE(JSON_EXTRACT(js, '$.id')) AS id,
  JSON_UNQUOTE(JSON_EXTRACT(js, '$.imie')) AS imie,
  JSON_UNQUOTE(JSON_EXTRACT(js, '$.urodziny')) AS urodziny
FROM JSON_TABLE(@json, '$[*]' COLUMNS (
  js JSON PATH '$'
)) AS tmp;