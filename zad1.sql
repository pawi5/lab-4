SELECT JSON_ARRAYAGG(
    JSON_OBJECT(
        'id', id,
        'name', name,
        'email', email,
        'data_of_birth', data_of_birth
    )
) AS json_export
FROM students;