-- BBDD_zapato_roto
-- Creación de la base de datos en 3ra forma normal
-- Creado en MySQL por Cristian Iñiguez

-- Base de datos

CREATE DATABASE BBDD_zapato_roto;
USE BBDD_zapato_roto;

-- Tabla producto

CREATE TABLE producto (
  id_producto INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(20) NOT NULL,
  presentacion VARCHAR(100) NOT NULL,
  valor DECIMAL(5,2) NOT NULL,
  PRIMARY KEY (id_producto))
ENGINE = InnoDB;

-- Tabla movimiento (movimiento de inventario)

CREATE TABLE movimiento (
  id_movimiento INT NOT NULL AUTO_INCREMENT,
  tipo_movimiento VARCHAR(10) NOT NULL,
  fecha DATE NOT NULL,
  PRIMARY KEY (id_movimiento))
ENGINE = InnoDB;

-- Tabla mov_prod (relaciona los movimientos de inventario con los productos)

CREATE TABLE mov_prod (
  id_movimiento INT NOT NULL,
  id_producto INT NOT NULL,
  cantidad INT NOT NULL,
  PRIMARY KEY (id_movimiento, id_producto),
  CONSTRAINT fk_movimiento
    FOREIGN KEY (id_movimiento)
    REFERENCES movimiento (id_movimiento)
    ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT fk_producto
    FOREIGN KEY (id_producto)
    REFERENCES producto (id_producto)
    ON DELETE NO ACTION ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- Tabla cliente

CREATE TABLE cliente (
  id_cliente INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(15) NOT NULL,
  ap_paterno VARCHAR(15) NOT NULL,
  ap_materno VARCHAR(15) NOT NULL,
  pais VARCHAR(15) NOT NULL,
  PRIMARY KEY (id_cliente))
ENGINE = InnoDB;

-- Tabla `factura` (facturación)

CREATE TABLE factura (
  id_factura INT NOT NULL AUTO_INCREMENT,
  id_cliente INT NOT NULL,
  id_movimiento INT NOT NULL,
  impuestos DECIMAL(5,2) NOT NULL,
  descuento DECIMAL(5,2) NOT NULL,
  -- El campo valor_a_pagar se crea en las consultas
  PRIMARY KEY (id_factura),
  CONSTRAINT fk_cliente_factura
    FOREIGN KEY (id_cliente)
    REFERENCES cliente (id_cliente)
    ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT fk_movimiento_factura
    FOREIGN KEY (id_movimiento)
    REFERENCES movimiento (id_movimiento)
    ON DELETE NO ACTION ON UPDATE NO ACTION)
ENGINE = InnoDB;


