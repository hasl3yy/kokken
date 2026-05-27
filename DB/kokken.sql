-- ============================================================
--  Kokken Pastelería Artesanal
--  Script 01 – Creación de Tablas
--  Curso: Introducción a los Sistemas de Cómputo
--  Integrantes: HC
--  Fecha: 2026
-- ============================================================
--  Nomenclatura:
--    · Tablas en Pascal_Snake_Case con sufijo _HC
--    · Sustantivos en singular
--    · Sin números como prefijo
--    · Llaves foráneas al final con ALTER TABLE
-- ============================================================

-- ------------------------------------------------------------
-- 0. Crear y seleccionar la base de datos
-- ------------------------------------------------------------
CREATE DATABASE IF NOT EXISTS Kokken_HC
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_spanish_ci;

USE Kokken_HC;

-- ------------------------------------------------------------
-- 1. Categoria_Producto_HC
--    Clasifica los productos (Pasteles, Brownies, Alfajores…)
-- ------------------------------------------------------------
CREATE TABLE Categoria_Producto_HC (
    id_categoria      INT          NOT NULL AUTO_INCREMENT,
    nombre            VARCHAR(60)  NOT NULL,
    descripcion       VARCHAR(200),
    activo            TINYINT(1)   NOT NULL DEFAULT 1,
    PRIMARY KEY (id_categoria)
);

-- ------------------------------------------------------------
-- 2. Producto_HC
--    Catálogo base de todos los productos de la pastelería
-- ------------------------------------------------------------
CREATE TABLE Producto_HC (
    id_producto       INT            NOT NULL AUTO_INCREMENT,
    id_categoria      INT            NOT NULL,
    nombre            VARCHAR(100)   NOT NULL,
    descripcion       VARCHAR(300),
    precio_base       DECIMAL(8,2)   NOT NULL,
    porciones_min     INT,
    porciones_max     INT,
    requiere_refrig   TINYINT(1)     NOT NULL DEFAULT 0,
    activo            TINYINT(1)     NOT NULL DEFAULT 1,
    PRIMARY KEY (id_producto)
);

-- ------------------------------------------------------------
-- 3. Sabor_Bizcocho_HC
--    Opciones de bizcocho disponibles para pasteles
-- ------------------------------------------------------------
CREATE TABLE Sabor_Bizcocho_HC (
    id_sabor          INT          NOT NULL AUTO_INCREMENT,
    nombre            VARCHAR(60)  NOT NULL,
    costo_extra       DECIMAL(8,2) NOT NULL DEFAULT 0.00,
    disponible        TINYINT(1)   NOT NULL DEFAULT 1,
    PRIMARY KEY (id_sabor)
);

-- ------------------------------------------------------------
-- 4. Sabor_Relleno_HC
--    Opciones de relleno disponibles para pasteles
-- ------------------------------------------------------------
CREATE TABLE Sabor_Relleno_HC (
    id_relleno        INT          NOT NULL AUTO_INCREMENT,
    nombre            VARCHAR(60)  NOT NULL,
    costo_extra       DECIMAL(8,2) NOT NULL DEFAULT 0.00,
    disponible        TINYINT(1)   NOT NULL DEFAULT 1,
    PRIMARY KEY (id_relleno)
);

-- ------------------------------------------------------------
-- 5. Extra_Decoracion_HC
--    Adicionales opcionales con costo (fondant, flores, etc.)
-- ------------------------------------------------------------
CREATE TABLE Extra_Decoracion_HC (
    id_extra          INT          NOT NULL AUTO_INCREMENT,
    nombre            VARCHAR(80)  NOT NULL,
    descripcion       VARCHAR(200),
    precio_adicional  DECIMAL(8,2) NOT NULL DEFAULT 0.00,
    disponible        TINYINT(1)   NOT NULL DEFAULT 1,
    PRIMARY KEY (id_extra)
);

-- ------------------------------------------------------------
-- 6. Cliente_HC
--    Datos de los clientes que realizan pedidos
-- ------------------------------------------------------------
CREATE TABLE Cliente_HC (
    id_cliente        INT          NOT NULL AUTO_INCREMENT,
    nombre            VARCHAR(80)  NOT NULL,
    apellido          VARCHAR(80)  NOT NULL,
    telefono          VARCHAR(20)  NOT NULL,
    correo            VARCHAR(120),
    fecha_registro    DATE         NOT NULL,
    PRIMARY KEY (id_cliente)
);

-- ------------------------------------------------------------
-- 7. Pedido_HC
--    Cabecera del pedido realizado por un cliente
-- ------------------------------------------------------------
CREATE TABLE Pedido_HC (
    id_pedido         INT            NOT NULL AUTO_INCREMENT,
    id_cliente        INT            NOT NULL,
    fecha_pedido      DATETIME       NOT NULL,
    fecha_entrega     DATE           NOT NULL,
    hora_entrega      TIME           NOT NULL,
    estado            ENUM('Pendiente','Confirmado','En_Proceso',
                           'Listo','Entregado','Cancelado')
                                     NOT NULL DEFAULT 'Pendiente',
    total             DECIMAL(10,2)  NOT NULL DEFAULT 0.00,
    anticipo_pagado   DECIMAL(10,2)  NOT NULL DEFAULT 0.00,
    notas             VARCHAR(500),
    PRIMARY KEY (id_pedido)
);

-- ------------------------------------------------------------
-- 8. Detalle_Pedido_HC
--    Líneas individuales de cada pedido (un renglón por producto)
-- ------------------------------------------------------------
CREATE TABLE Detalle_Pedido_HC (
    id_detalle        INT            NOT NULL AUTO_INCREMENT,
    id_pedido         INT            NOT NULL,
    id_producto       INT            NOT NULL,
    id_sabor          INT,
    id_relleno        INT,
    cantidad          INT            NOT NULL DEFAULT 1,
    precio_unitario   DECIMAL(8,2)   NOT NULL,
    descripcion_diseno VARCHAR(300),
    subtotal          DECIMAL(10,2)  NOT NULL,
    PRIMARY KEY (id_detalle)
);

-- ------------------------------------------------------------
-- 9. Detalle_Extra_HC
--    Extras de decoración aplicados a cada línea de pedido
-- ------------------------------------------------------------
CREATE TABLE Detalle_Extra_HC (
    id_detalle_extra  INT            NOT NULL AUTO_INCREMENT,
    id_detalle        INT            NOT NULL,
    id_extra          INT            NOT NULL,
    precio_aplicado   DECIMAL(8,2)   NOT NULL,
    PRIMARY KEY (id_detalle_extra)
);

-- ============================================================
--  LLAVES FORÁNEAS  – ALTER TABLE (obligatorio según enunciado)
-- ============================================================

-- Producto_HC → Categoria_Producto_HC
ALTER TABLE Producto_HC
    ADD CONSTRAINT FK_Producto_Categoria_HC
    FOREIGN KEY (id_categoria)
    REFERENCES Categoria_Producto_HC (id_categoria)
    ON UPDATE CASCADE
    ON DELETE RESTRICT;

-- Pedido_HC → Cliente_HC
ALTER TABLE Pedido_HC
    ADD CONSTRAINT FK_Pedido_Cliente_HC
    FOREIGN KEY (id_cliente)
    REFERENCES Cliente_HC (id_cliente)
    ON UPDATE CASCADE
    ON DELETE RESTRICT;

-- Detalle_Pedido_HC → Pedido_HC
ALTER TABLE Detalle_Pedido_HC
    ADD CONSTRAINT FK_Detalle_Pedido_HC
    FOREIGN KEY (id_pedido)
    REFERENCES Pedido_HC (id_pedido)
    ON UPDATE CASCADE
    ON DELETE CASCADE;

-- Detalle_Pedido_HC → Producto_HC
ALTER TABLE Detalle_Pedido_HC
    ADD CONSTRAINT FK_Detalle_Producto_HC
    FOREIGN KEY (id_producto)
    REFERENCES Producto_HC (id_producto)
    ON UPDATE CASCADE
    ON DELETE RESTRICT;

-- Detalle_Pedido_HC → Sabor_Bizcocho_HC (nullable)
ALTER TABLE Detalle_Pedido_HC
    ADD CONSTRAINT FK_Detalle_Sabor_HC
    FOREIGN KEY (id_sabor)
    REFERENCES Sabor_Bizcocho_HC (id_sabor)
    ON UPDATE CASCADE
    ON DELETE SET NULL;

-- Detalle_Pedido_HC → Sabor_Relleno_HC (nullable)
ALTER TABLE Detalle_Pedido_HC
    ADD CONSTRAINT FK_Detalle_Relleno_HC
    FOREIGN KEY (id_relleno)
    REFERENCES Sabor_Relleno_HC (id_relleno)
    ON UPDATE CASCADE
    ON DELETE SET NULL;

-- Detalle_Extra_HC → Detalle_Pedido_HC
ALTER TABLE Detalle_Extra_HC
    ADD CONSTRAINT FK_Extra_Detalle_HC
    FOREIGN KEY (id_detalle)
    REFERENCES Detalle_Pedido_HC (id_detalle)
    ON UPDATE CASCADE
    ON DELETE CASCADE;

-- Detalle_Extra_HC → Extra_Decoracion_HC
ALTER TABLE Detalle_Extra_HC
    ADD CONSTRAINT FK_Extra_Decoracion_HC
    FOREIGN KEY (id_extra)
    REFERENCES Extra_Decoracion_HC (id_extra)
    ON UPDATE CASCADE
    ON DELETE RESTRICT;

-- ============================================================
--  FIN DEL SCRIPT DE CREACIÓN
-- ============================================================