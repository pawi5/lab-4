ALTER TABLE student ADD COLUMN profile JSON;

UPDATE student
SET profile = JSON_OBJECT(
    'numer', '123-456-789',
    'miasto', 'Warszawa',
    'zainteresowania', JSON_ARRAY('matma', 'biologia')
)
WHERE id = 1;