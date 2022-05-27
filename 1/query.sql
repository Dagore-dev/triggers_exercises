-- Update en alumno
UPDATE alumno
SET fecha_nacimiento = TO_DATE('01-01-2000', 'dd-mm-yyyy')
WHERE id_alumno = 2;

SELECT * FROM auditoria;

-- Update en customer
UPDATE customer
SET salary = 10000
WHERE id = 1;
