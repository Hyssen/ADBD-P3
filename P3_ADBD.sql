-- Crear la base de datos
CREATE DATABASE viveros;

-- Conectar a la base de datos
\c viveros;

-- Crear tabla CLIENTE
CREATE TABLE CLIENTE (
    NIF CHAR(9) PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Fecha_ingreso DATE NOT NULL,
    Numero_Compras INT DEFAULT 0 CHECK (Numero_Compras >= 0),
    Volumen_Compra_Mensual DECIMAL(10, 2) GENERATED ALWAYS AS (
        Numero_Compras / 12
    ) STORED,
    Bonificaciones DECIMAL(10, 2) GENERATED ALWAYS AS (
        (Numero_Compras / 12) * 0.05
    ) STORED
);

-- Crear tabla PEDIDOS
CREATE TABLE PEDIDOS (
    Codigo_pedido SERIAL PRIMARY KEY,
    Importe DECIMAL(10, 2) NOT NULL CHECK (Importe >= 0),
    Fecha_pedido DATE NOT NULL,
    Forma_pago VARCHAR(20) CHECK (Forma_pago IN ('Contado', 'Credito')),
    NIF_Cliente CHAR(9) REFERENCES CLIENTE(NIF) ON DELETE SET NULL
);

-- Crear tabla EMPLEADO
CREATE TABLE EMPLEADO (
    NIF CHAR(9) PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Seguridad_Social CHAR(11) UNIQUE NOT NULL
);

-- Crear tabla VIVERO
CREATE TABLE VIVERO (
    ID SERIAL PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Latitud DECIMAL(9, 6) CHECK (Latitud >= -90 AND Latitud <= 90),
    Longitud DECIMAL(9, 6) CHECK (Longitud >= -180 AND Longitud <= 180),
    Telefono CHAR(9) CHECK (Telefono ~ '^[0-9]{9}$')
);

-- Crear tabla ZONA
CREATE TABLE ZONA (
    Codigo_de_zona SERIAL PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Latitud DECIMAL(9, 6) CHECK (Latitud >= -90 AND Latitud <= 90),
    Longitud DECIMAL(9, 6) CHECK (Longitud >= -180 AND Longitud <= 180)
);

-- Crear tabla PRODUCTOS
CREATE TABLE PRODUCTOS (
    Codigo_producto SERIAL PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Tipo VARCHAR(50),
    Unidades_Totales INT CHECK (Unidades_Totales >= 0),
    Stock INT CHECK (Stock >= 0),
    Unidades_Vendidas INT GENERATED ALWAYS AS (Unidades_Totales - Stock) STORED
);

-- Crear tabla TRABAJA_ZONA
CREATE TABLE TRABAJA_ZONA (
    NIF_Empleado CHAR(9) REFERENCES EMPLEADO(NIF) ON DELETE CASCADE,
    Codigo_zona INT REFERENCES ZONA(Codigo_de_zona) ON DELETE CASCADE,
    Fecha_inicio DATE NOT NULL,
    Fecha_final DATE,
    PRIMARY KEY (NIF_Empleado, Codigo_zona),
    CHECK (Fecha_final IS NULL OR Fecha_final >= Fecha_inicio)
);

-- Crear tabla PEDIDO_PRODUCTO
CREATE TABLE PEDIDO_PRODUCTO (
    Codigo_pedido INT REFERENCES PEDIDOS(Codigo_pedido) ON DELETE CASCADE,
    Codigo_producto INT REFERENCES PRODUCTOS(Codigo_producto) ON DELETE CASCADE,
    PRIMARY KEY (Codigo_pedido, Codigo_producto)
);

-- Crear tabla ZONA_VIVERO
CREATE TABLE ZONA_VIVERO (
    Codigo_zona INT REFERENCES ZONA(Codigo_de_zona) ON DELETE CASCADE,
    ID_vivero INT REFERENCES VIVERO(ID) ON DELETE CASCADE,
    PRIMARY KEY (Codigo_zona, ID_vivero)
);
-- Insertar datos en la tabla CLIENTE
INSERT INTO CLIENTE (NIF, Nombre, Fecha_ingreso, Numero_Compras) VALUES
('12345678A', 'Juan Perez', '2022-01-15', 10),
('87654321B', 'Ana Gomez', '2021-06-20', 20),
('23456789C', 'Carlos Ruiz', '2023-03-01', 5),
('34567890D', 'Maria Lopez', '2022-11-10', 0), -- Sin compras
('45678901E', 'Luis Fernandez', '2023-05-15', 15);

-- Insertar datos en la tabla EMPLEADO
INSERT INTO EMPLEADO (NIF, Nombre, Seguridad_Social) VALUES
('NIF001', 'Jose Martinez', '12345678901'),
('NIF002', 'Laura Torres', '10987654321'),
('NIF003', 'Pedro Sanchez', '98765432100'),
('NIF004', 'Sofia Castro', '11122334455'),
('NIF005', 'Miguel Alvarez', '22233445566');

-- Insertar datos en la tabla VIVERO
INSERT INTO VIVERO (Nombre, Latitud, Longitud, Telefono) VALUES
('Vivero Central', 40.416775, -3.703790, '912345678'),
('Vivero Norte', 41.385064, 2.173404, '923456789'),
('Vivero Sur', -34.603722, -58.381592, '934567890'),
('Vivero Este', 34.052235, -118.243683, '945678901'),
('Vivero Oeste', 51.507351, -0.127758, '956789012');

-- Insertar datos en la tabla ZONA
INSERT INTO ZONA (Nombre, Latitud, Longitud) VALUES
('Zona A', 40.0, -3.0),
('Zona B', 41.0, 2.0),
('Zona C', -34.0, -58.0),
('Zona D', 34.0, -118.0),
('Zona E', 51.0, -0.1);

-- Insertar datos en la tabla PRODUCTOS
INSERT INTO PRODUCTOS (Nombre, Tipo, Unidades_Totales, Stock) VALUES
('Planta 1', 'Decorativa', 100, 60),
('Planta 2', 'Medicinal', 50, 30),
('Planta 3', 'Frutal', 200, 150),
('Planta 4', 'Cactus', 80, 0),  -- Sin stock
('Planta 5', 'Hierbas Aromaticas', 150, 100);

-- Insertar datos en la tabla PEDIDOS
INSERT INTO PEDIDOS (Importe, Fecha_pedido, Forma_pago, NIF_Cliente) VALUES
(100.00, '2023-01-15', 'Contado', '12345678A'),
(200.00, '2023-02-20', 'Credito', '87654321B'),
(50.00, '2023-03-01', 'Contado', '23456789C'),
(300.00, '2023-04-05', 'Contado', NULL), -- Sin cliente
(150.00, '2023-05-10', 'Credito', '34567890D');

-- Insertar datos en la tabla TRABAJA_ZONA
INSERT INTO TRABAJA_ZONA (NIF_Empleado, Codigo_zona, Fecha_inicio, Fecha_final) VALUES
('NIF001', 1, '2022-01-01', NULL), -- Empleado activo
('NIF002', 2, '2022-05-01', '2023-05-01'), -- Empleado inactivo
('NIF003', 1, '2023-01-01', NULL), 
('NIF004', 3, '2023-06-01', NULL), 
('NIF005', 4, '2023-07-01', NULL);

-- Insertar datos en la tabla PEDIDO_PRODUCTO
INSERT INTO PEDIDO_PRODUCTO (Codigo_pedido, Codigo_producto) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- Insertar datos en la tabla ZONA_VIVERO
INSERT INTO ZONA_VIVERO (Codigo_zona, ID_vivero) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- Ejemplo de operaciones DELETE

-- Eliminar un cliente (que tiene pedidos)
DELETE FROM CLIENTE WHERE NIF = '12345678A'; -- Se eliminará con ON DELETE SET NULL en pedidos

-- Eliminar un pedido (que tiene productos asociados)
DELETE FROM PEDIDOS WHERE Codigo_pedido = 2; -- Elimina el pedido que corresponde al NIF '87654321B'

-- Eliminar un empleado (que está asignado a una zona)
DELETE FROM EMPLEADO WHERE NIF = 'NIF002'; -- Elimina el empleado, se eliminarán las asignaciones en TRABAJA_ZONA

-- Eliminar un vivero (que está asignado a una zona)
DELETE FROM VIVERO WHERE ID = 1; -- Elimina el vivero, se eliminarán las asignaciones en ZONA_VIVERO

-- Eliminar un producto (que tiene pedidos asociados)
DELETE FROM PRODUCTOS WHERE Codigo_producto = 1; -- Elimina el producto, se eliminará el registro en PEDIDO_PRODUCTO
