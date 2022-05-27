-- Tablas empleado - antiguedad para los ejercicios 1-3.
CREATE TABLE empleado (
  id INTEGER NOT NULL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  salary NUMBER(7, 2) NOT NULL
);

CREATE TABLE antiguedad (
  id INTEGER NOT NULL PRIMARY KEY,
  anios INTEGER NOT NULL,
  id_empleado INTEGER NOT NULL,
  FOREIGN KEY (id_empleado) REFERENCES empleado(id)
);

-- Tablas producto - compra para el ejercicio 4.
CREATE TABLE producto (
  id INTEGER NOT NULL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  stock INTEGER NOT NULL,
  price NUMBER(6, 2)
);

CREATE TABLE compra (
  id INTEGER NOT NULL PRIMARY KEY,
  cantidad INTEGER,
  id_producto INTEGER NOT NULL,
  FOREIGN KEY (id_producto) REFERENCES producto(id)
);
