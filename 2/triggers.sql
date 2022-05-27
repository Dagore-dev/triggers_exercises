-- 1. Crea un registro en antiguedad cuando se inserta un nuevo empleado
CREATE OR REPLACE TRIGGER nuevo_empleado
AFTER INSERT ON empleado
FOR EACH ROW
BEGIN
  INSERT INTO antiguedad VALUES (:NEW.id, 0, :NEW.id);
END;
/

-- 2. Elimina un registro de antiguedad cuando se borra el empleado al que hacía referencia.
CREATE OR REPLACE TRIGGER borra_antiguedad
AFTER DELETE ON empleado
FOR EACH ROW
BEGIN
  DELETE FROM antiguedad
    WHERE id_empleado = :OLD.id;
END;
/

-- 3. Actualiza el salario del empleado al cambiar su antiguedad en 1. Si aumenta la antiguedad en más uno no se cambia nada.
CREATE OR REPLACE TRIGGER actualiza_empleado
AFTER UPDATE ON antiguedad
FOR EACH ROW
BEGIN

  IF (:OLD.anios + 1) = :NEW.anios THEN
    UPDATE empleado
    SET salary = (salary * 1.05)
    WHERE id = :NEW.id_empleado;
  END IF;

END;
/

-- 4. Actualiza el stock de un producto cuando se realiza una compra de este.
CREATE OR REPLACE TRIGGER actualiza_stock
AFTER INSERT ON compra
FOR EACH ROW
BEGIN
  UPDATE producto
    SET stock = stock - :new.cantidad
    WHERE id = :new.id_producto;
END;
/
