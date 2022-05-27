/*
  Simple base de datos con una tabla con datos de alumnos y otra tabla donde se van a guardar los cambios que tienen lugar en la tabla de alumno.
  Para que estos cambios se guarden en la tabla auditoria se va a crear un trigger que hará los INSERT en la tabla auditoria de manera automática cuando se hacen cambios.
*/
-- Creación de la tabla alumno
CREATE TABLE alumno
(
  id_alumno INTEGER,
  nombre VARCHAR2(50),
  fecha_nacimiento DATE
);

-- Creación de la tabla auditoria
CREATE TABLE auditoria
(
  id_auditoria INTEGER,
  nombre_tabla VARCHAR2(255),
  nombre_operacion VARCHAR2(10),
  operador VARCHAR2(30),
  fecha_transaccion DATE
);

-- Secuencia para el id de auditoria.
CREATE SEQUENCE seq_auditoria INCREMENT BY 1;

-- Creación de la tabla customer.
CREATE TABLE customer (
  id INTEGER NOT NULL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  age INTEGER,
  address VARCHAR(255),
  salary NUMBER(7, 2)
);
