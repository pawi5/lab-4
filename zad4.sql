SELECT JSON_EXTRACT(profile, '$.zainteresowania') AS zainteresowania
FROM student
WHERE id = 1;

SELECT JSON_UNQUOTE(JSON_EXTRACT(profile, '$.numer')) AS numer
FROM student;

SELECT id, imie
FROM student
WHERE JSON_CONTAINS_PATH(profile, 'one', '$.miasto');

UPDATE student
SET profile = JSON_SET(profile, '$.numer', '987-654-321')
WHERE id = 1;

SELECT id,
       JSON_UNQUOTE(JSON_EXTRACT(zainteresowania.value, '$')) AS interest
FROM student,
     JSON_TABLE(profile, '$.zainteresowania[*]' COLUMNS (
       value JSON PATH '$'
     )) AS zainteresowania;
