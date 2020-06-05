-- BBDD_zapato_roto
-- Poblado de información de la base de datos
-- Creado en MySQL por Cristian Iñiguez

-- Tabla `cliente`

INSERT INTO cliente (nombre, ap_paterno, ap_materno, pais) VALUES ('Juan', 'Espinoza', 'Porcel', 'Bolivia');
INSERT INTO cliente (nombre, ap_paterno, ap_materno, pais) VALUES ('Carlos', 'Balcazar', 'Rada', 'Chile');
INSERT INTO cliente (nombre, ap_paterno, ap_materno, pais) VALUES ('Jessica', 'Gonzales', 'Barra', 'Peru');

-- Tabla `producto`

INSERT INTO producto (nombre, presentacion, valor) VALUES ('zapatos ADIDAS H', 'par de zapatos ADIDAS para hombre', 64.00);
INSERT INTO producto (nombre, presentacion, valor) VALUES ('zapatos NIKE H', 'par de zapatos NIKE para hombre', 70.00);
INSERT INTO producto (nombre, presentacion, valor) VALUES ('zapatos NIKE M', 'par de zapatos NIKE para mujer', 65.00);
INSERT INTO producto (nombre, presentacion, valor) VALUES ('zapatos UA M', 'par de zapatos UNDER ARMOUR para mujer', 58.00);
INSERT INTO producto (nombre, presentacion, valor) VALUES ('zapatos UA H', 'par de zapatos UNDER ARMOUR para hombre', 61.00);
INSERT INTO producto (nombre, presentacion, valor) VALUES ('zapatos PUMA H', 'par de zapatos PUMA para hombre', 70.00);

-- Tabla `movimiento` (movimiento de inventario)

INSERT INTO movimiento (tipo_movimiento, fecha) VALUES ('entrada', '2020-06-04');
INSERT INTO movimiento (tipo_movimiento, fecha) VALUES ('salida', '2020-09-08');
INSERT INTO movimiento (tipo_movimiento, fecha) VALUES ('salida', '2020-12-06');
INSERT INTO movimiento (tipo_movimiento, fecha) VALUES ('entrada', '2021-01-20');
INSERT INTO movimiento (tipo_movimiento, fecha) VALUES ('salida', '2021-02-07');
INSERT INTO movimiento (tipo_movimiento, fecha) VALUES ('salida', '2021-03-16');

-- Tabla `mov_prod` (relaciona los movimientos de inventario con los productos)

INSERT INTO mov_prod (id_movimiento, id_producto, cantidad) VALUES (1, 1, 50);
INSERT INTO mov_prod (id_movimiento, id_producto, cantidad) VALUES (1, 2, 60);
INSERT INTO mov_prod (id_movimiento, id_producto, cantidad) VALUES (1, 3, 70);

INSERT INTO mov_prod (id_movimiento, id_producto, cantidad) VALUES (2, 2, 10);

INSERT INTO mov_prod (id_movimiento, id_producto, cantidad) VALUES (3, 3, 15);
INSERT INTO mov_prod (id_movimiento, id_producto, cantidad) VALUES (3, 1, 15);

INSERT INTO mov_prod (id_movimiento, id_producto, cantidad) VALUES (4, 4, 20);
INSERT INTO mov_prod (id_movimiento, id_producto, cantidad) VALUES (4, 5, 25);
INSERT INTO mov_prod (id_movimiento, id_producto, cantidad) VALUES (4, 6, 20);

INSERT INTO mov_prod (id_movimiento, id_producto, cantidad) VALUES (5, 1, 5);
INSERT INTO mov_prod (id_movimiento, id_producto, cantidad) VALUES (5, 2, 6);
INSERT INTO mov_prod (id_movimiento, id_producto, cantidad) VALUES (5, 4, 7);
INSERT INTO mov_prod (id_movimiento, id_producto, cantidad) VALUES (5, 5, 8);
INSERT INTO mov_prod (id_movimiento, id_producto, cantidad) VALUES (5, 6, 9);

INSERT INTO mov_prod (id_movimiento, id_producto, cantidad) VALUES (6, 4, 12);
INSERT INTO mov_prod (id_movimiento, id_producto, cantidad) VALUES (6, 6, 12);

-- Tabla `factura` (facturación)

INSERT INTO factura (id_cliente, id_movimiento, impuestos, descuento) VALUES (1, 2, 0.15, 0.10);
INSERT INTO factura (id_cliente, id_movimiento, impuestos, descuento) VALUES (2, 3, 0.15, 0.00);
INSERT INTO factura (id_cliente, id_movimiento, impuestos, descuento) VALUES (3, 5, 0.15, 0.20);
INSERT INTO factura (id_cliente, id_movimiento, impuestos, descuento) VALUES (1, 6, 0.15, 0.15);