-- BBDD_zapato_roto
-- Consultas a la base de datos
-- Creado en MySQL por Cristian Iñiguez

-- 1. Consulta la facturación de un cliente en específico.
-- Cliente: 1 (Juan Espinoza Porcel)

-- Consulta por id del cliente (1)
SELECT f.id_factura, f.id_cliente, f.impuestos, f.descuento, 
	-- Para hallar valor a pagar
    (SELECT sum(mp.cantidad * p.valor) 
	FROM movimiento AS mov INNER JOIN mov_prod AS mp 
	ON mov.id_movimiento = mp.id_movimiento 
	INNER JOIN producto AS p 
	ON mp.id_producto = p.id_producto 
	WHERE mov.id_movimiento = f.id_movimiento) 
    * (1 + f.impuestos) * (1 - f.descuento) AS valor_a_pagar 
FROM factura AS f WHERE id_cliente = 1;

-- Consulta por nombre del cliente (Juan)
SELECT f.id_factura, c.nombre, c.ap_paterno, c.ap_materno, c.pais, f.impuestos, f.descuento, 
	-- Para hallar valor a pagar
    (SELECT SUM(mp.cantidad * p.valor) 
	FROM movimiento AS mov INNER JOIN mov_prod AS mp 
	ON mov.id_movimiento = mp.id_movimiento 
	INNER JOIN producto AS p 
	ON mp.id_producto = p.id_producto 
	WHERE mov.id_movimiento = f.id_movimiento) 
    * (1 + f.impuestos) * (1 - f.descuento) AS valor_a_pagar 
FROM factura AS f INNER JOIN cliente AS c 
ON f.id_cliente = c.id_cliente WHERE c.nombre = 'Juan';

-- 2. Consulta la facturación de un producto en específico.
-- Producto: 2 (zapatos NIKE H)

-- Consulta por id del producto (2)
SELECT f.id_factura, mov.fecha, m_p.id_producto, m_p.cantidad, f.impuestos, f.descuento, 
	-- Para hallar valor a pagar
    (SELECT sum(mp.cantidad * p.valor) 
	FROM movimiento AS mov INNER JOIN mov_prod AS mp 
	ON mov.id_movimiento = mp.id_movimiento 
	INNER JOIN producto AS p 
	ON mp.id_producto = p.id_producto 
	WHERE mov.id_movimiento = f.id_movimiento) 
    * (1 + f.impuestos) * (1 - f.descuento) AS valor_a_pagar 
FROM factura AS f INNER JOIN movimiento as mov 
ON f.id_movimiento = mov.id_movimiento 
INNER JOIN mov_prod AS m_p 
ON mov.id_movimiento = m_p.id_movimiento 
WHERE m_p.id_producto = 2;

-- Consulta por nombre del producto (zapatos NIKE H)
SELECT f.id_factura, mov.fecha, p.nombre, p.presentacion, p.valor, m_p.cantidad, f.impuestos, f.descuento, 
	-- Para hallar valor a pagar
    (SELECT sum(mp.cantidad * p.valor) 
	FROM movimiento AS mov INNER JOIN mov_prod AS mp 
	ON mov.id_movimiento = mp.id_movimiento 
	INNER JOIN producto AS p 
	ON mp.id_producto = p.id_producto 
	WHERE mov.id_movimiento = f.id_movimiento) 
    * (1 + f.impuestos) * (1 - f.descuento) AS valor_a_pagar 
FROM factura AS f INNER JOIN movimiento as mov 
ON f.id_movimiento = mov.id_movimiento 
INNER JOIN mov_prod AS m_p 
ON mov.id_movimiento = m_p.id_movimiento 
INNER JOIN producto AS p 
ON m_p.id_producto = p.id_producto 
WHERE p.nombre = 'zapatos NIKE H';

-- 3. Consulta la facturación de un rango de fechas.
-- Fechas: Desde 2020-07-01 hasta 2021-02-01

SELECT mov.fecha, f.id_cliente, f.impuestos, f.descuento, 
	-- Para hallar valor a pagar
    (SELECT sum(mp.cantidad * p.valor) 
	FROM movimiento AS mov INNER JOIN mov_prod AS mp 
	ON mov.id_movimiento = mp.id_movimiento 
	INNER JOIN producto AS p 
	ON mp.id_producto = p.id_producto 
	WHERE mov.id_movimiento = f.id_movimiento) 
    * (1 + f.impuestos) * (1 - f.descuento) AS valor_a_pagar 
FROM factura AS f INNER JOIN movimiento as mov 
ON f.id_movimiento = mov.id_movimiento 
WHERE mov.fecha BETWEEN '2020-07-01' AND '2021-02-01';

-- 4. De la facturación, consulta los clientes únicos.

SELECT DISTINCT c.nombre, c.ap_paterno, c.ap_materno, c.pais  
FROM cliente AS c INNER JOIN factura AS f 
ON c.id_cliente = f.id_cliente;