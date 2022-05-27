-- Trigger que se ejecuta cuando la tabla alumno sufre alguna operación UPDATE.
CREATE OR REPLACE TRIGGER trigger_alumno
AFTER UPDATE ON alumno
FOR EACH ROW
BEGIN
    INSERT INTO auditoria VALUES (seq_auditoria.nextval, 'alumno', 'UPDATE', USER, SYSDATE);
END;
/

-- Muestra cambios en salarios cuando se modifican.
CREATE OR REPLACE TRIGGER display_salary_changes  
BEFORE DELETE OR INSERT OR UPDATE ON customer
FOR EACH ROW  
WHEN (NEW.ID > 0)  
DECLARE  
   sal_diff number;  
BEGIN  
   sal_diff := :NEW.salary  - :OLD.salary;  
   dbms_output.put_line('Old salary: ' || :OLD.salary);  
   dbms_output.put_line('New salary: ' || :NEW.salary);  
   dbms_output.put_line('Salary difference: ' || sal_diff);  
END;  
/ 
