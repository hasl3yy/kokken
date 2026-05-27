-- ============================================================
--  Kokken Pastelería Artesanal
--  Script 02 – Datos, Consultas y Manipulación
--  Curso: Introducción a los Sistemas de Cómputo
--  Integrantes: HC
--  Fecha: 2026
-- ============================================================

USE Kokken_HC;

-- ============================================================
--  SECCIÓN 1 – INSERTS (mínimo 5 por tabla)
-- ============================================================

-- ------------------------------------------------------------
-- 1. Categoria_Producto_HC
-- ------------------------------------------------------------
INSERT INTO Categoria_Producto_HC (nombre, descripcion) VALUES
    ('Pasteles',            'Pasteles artesanales de distintos tamaños y sabores'),
    ('Brownies',            'Brownies con toppings variados y presentaciones en caja'),
    ('Alfajores',           'Alfajores cubiertos con chocolate blanco, con leche o semiamargo'),
    ('Fresas_con_Chocolate','Fresas cubiertas en distintos tipos de chocolate'),
    ('Otros_Postres',       'Cake pops, cupcakes, galletas, churros y tartaletas');

-- ------------------------------------------------------------
-- 2. Producto_HC
-- ------------------------------------------------------------
INSERT INTO Producto_HC (id_categoria, nombre, descripcion, precio_base, porciones_min, porciones_max, requiere_refrig) VALUES
    (1, 'Mini Cake',                  'Pastel artesanal de 6 a 8 porciones con cake topper',                    175.00,  6,  8, FALSE),
    (1, 'Cake 10 Porciones',          'Pastel artesanal de 10 porciones con decoración buttercream',            225.00, 10, 10, FALSE),
    (1, 'Cake Grande 15 Porciones',   'Pastel artesanal de 15 porciones con decoración 2D en fondant',          325.00, 15, 15, FALSE),
    (1, 'Pastel Fiesta',              'Pastel de 18 porciones con decoración sencilla lista para evento',       150.00, 18, 18, FALSE),
    (1, 'Pastel Fiesta Personalizado','Pastel de 18 porciones con diseño temático personalizado',               185.00, 18, 18, FALSE),
    (1, 'Carot Cake',                 'Bizcocho de zanahoria con betún de queso crema, 15 porciones',           250.00, 15, 15, TRUE),
    (1, 'Fresas con Crema',           'Bizcocho húmedo con crema batida y fresas frescas, 15 porciones',        250.00, 15, 15, TRUE),
    (1, 'Choco Coffee Bomb',          'Bizcochos de vainilla y chocolate con crema de café y ganache',          270.00, 15, 15, FALSE),
    (2, 'Brownies Caja de 2',         'Dos brownies con topping a elección',                                     40.00,  2,  2, FALSE),
    (2, 'Brownies Caja de 4',         'Cuatro brownies con topping a elección',                                  75.00,  4,  4, FALSE),
    (2, 'Brownies 16 Bites',          'Dieciséis brownies bite-size con topping a elección',                     95.00, 16, 16, FALSE),
    (3, 'Alfajores Caja de 6',        'Seis alfajores cubiertos con chocolate',                                  48.00,  6,  6, FALSE),
    (3, 'Alfajores Caja de 10',       'Diez alfajores cubiertos con chocolate',                                  80.00, 10, 10, FALSE),
    (3, 'Alfajores 15 Tradicionales', 'Quince alfajores tradicionales sin cobertura de chocolate',               75.00, 15, 15, FALSE),
    (4, 'Fresas Chocolate Caja de 6', 'Seis fresas cubiertas en chocolate a elección',                           50.00,  6,  6, TRUE),
    (4, 'Fresas Chocolate Caja de 12','Doce fresas cubiertas en chocolate a elección',                          100.00, 12, 12, TRUE),
    (4, 'Fresas Chocolate Caja de 25','Veinticinco fresas cubiertas en chocolate a elección',                   195.00, 25, 25, TRUE),
    (5, 'Cake Pops Básicos',          'Cake pops básicos, pedido mínimo de 8 unidades',                          10.00,  8, 99, FALSE),
    (5, 'Cake Pops Personalizados',   'Cake pops con diseño personalizado',                                      15.00,  8, 99, FALSE),
    (5, 'Cupcakes Básicos',           'Cupcakes básicos, pedido mínimo de 6 unidades',                           10.00,  6, 99, FALSE),
    (5, 'Cupcakes con Fondant',       'Cupcakes decorados con fondant, pedido mínimo de 6 unidades',             15.00,  6, 99, FALSE),
    (5, 'Galletas de Icing',          'Galletas personalizadas con icing, pedido mínimo de 10 unidades',         15.00, 10, 99, FALSE),
    (5, 'Choco Chip Cookies',         'Galletas con chispas de chocolate, pedido mínimo de 10 unidades',          6.00, 10, 99, FALSE),
    (5, 'Churros Caja de 25',         'Veinticinco churros artesanales recién horneados',                         55.00, 25, 25, FALSE),
    (5, 'Churros Caja de 50',         'Cincuenta churros artesanales recién horneados',                           90.00, 50, 50, FALSE),
    (5, 'Tartaletas de Frutas',       'Tartaletas de frutas frescas de temporada, mínimo 5 unidades',            12.00,  5, 99, TRUE);

-- ------------------------------------------------------------
-- 3. Sabor_Bizcocho_HC
-- ------------------------------------------------------------
INSERT INTO Sabor_Bizcocho_HC (nombre, costo_extra) VALUES
    ('Vainilla',             0.00),
    ('Chocolate',            0.00),
    ('Vainilla con Amapola', 0.00),
    ('Naranja',              0.00),
    ('Naranja con Amapola',  0.00),
    ('Coco',                 0.00),
    ('Almendra',             0.00),
    ('Zanahoria',            0.00);

-- ------------------------------------------------------------
-- 4. Sabor_Relleno_HC
-- ------------------------------------------------------------
INSERT INTO Sabor_Relleno_HC (nombre, costo_extra) VALUES
    ('Cajeta',             0.00),
    ('Nutella',            0.00),
    ('Manjar',             0.00),
    ('Jalea de Fresa',     0.00),
    ('Crema de Blueberry', 0.00),
    ('Crema de Café',      0.00),
    ('Crema de Oreo',      0.00),
    ('Fresas con Crema',  15.00);

-- ------------------------------------------------------------
-- 5. Extra_Decoracion_HC
-- ------------------------------------------------------------
INSERT INTO Extra_Decoracion_HC (nombre, descripcion, precio_adicional) VALUES
    ('Letrero Personalizado', 'Letrero con nombre o mensaje a elección del cliente',  20.00),
    ('Flores Comestibles',    'Flores decorativas comestibles sobre el pastel',        30.00),
    ('Fondant Decorado',      'Decoración adicional en fondant con diseño temático',   40.00),
    ('Figura en Fondant',     'Figura tridimensional personalizada en fondant',        50.00),
    ('Velas Decorativas',     'Juego de velas decorativas para el pastel',             15.00),
    ('Letra Personalizada',   'Letra individual para alfajores o fresas (+Q2 c/u)',     2.00);

-- ------------------------------------------------------------
-- 6. Cliente_HC
-- ------------------------------------------------------------
INSERT INTO Cliente_HC (nombre, apellido, telefono, correo, fecha_registro) VALUES
    ('María',    'López Gómez',    '5512-3456', 'maria.lopez@gmail.com',    '2026-01-10'),
    ('Carlos',   'Pérez Ruiz',     '4423-6789', 'carlos.perez@hotmail.com', '2026-02-14'),
    ('Fernanda', 'Hernández Díaz', '5534-9012', 'fer.hdez@gmail.com',       '2026-03-05'),
    ('Roberto',  'Sánchez Valle',  '3312-4567', 'rsanchez@gmail.com',       '2026-03-22'),
    ('Luisa',    'Martínez Cruz',  '5567-8901', 'luisa.mc@outlook.com',     '2026-04-01'),
    ('Andrea',   'Flores Morales', '4478-2345', 'andrea.f@gmail.com',       '2026-04-15'),
    ('Jorge',    'Ramos Castillo', '5589-6789', 'jramos@yahoo.com',         '2026-05-03');

-- ------------------------------------------------------------
-- 7. Pedido_HC
-- ------------------------------------------------------------
INSERT INTO Pedido_HC (id_cliente, fecha_pedido, fecha_entrega, hora_entrega, estado, total, anticipo_pagado, notas) VALUES
    (1, '2026-04-20 09:00:00', '2026-04-25', '14:00:00', 'Entregado',  325.00, 162.50, 'Tema princesas, colores rosa y morado'),
    (2, '2026-04-22 11:30:00', '2026-04-26', '10:00:00', 'Entregado',  195.00,  97.50, 'Fresas con letras FELIZ'),
    (3, '2026-05-01 15:00:00', '2026-05-05', '16:00:00', 'Entregado',  390.00, 195.00, 'Dos productos: pastel y brownies para quinceañera'),
    (4, '2026-05-10 08:45:00', '2026-05-13', '12:00:00', 'Confirmado', 250.00, 125.00, 'Carot Cake sin gluten de ser posible'),
    (5, '2026-05-15 10:00:00', '2026-05-18', '11:00:00', 'En_Proceso', 270.00, 135.00, 'Choco Coffee Bomb con letrero de cumpleaños'),
    (6, '2026-05-20 14:00:00', '2026-05-24', '15:30:00', 'Confirmado', 185.00, 185.00, 'Es un regalo, pago 100 porciento adelantado'),
    (7, '2026-05-23 09:30:00', '2026-05-29', '09:00:00', 'Pendiente',  460.00, 230.00, 'Pedido para evento de empresa, varios productos');

-- ------------------------------------------------------------
-- 8. Detalle_Pedido_HC
-- ------------------------------------------------------------
INSERT INTO Detalle_Pedido_HC (id_pedido, id_producto, id_sabor, id_relleno, cantidad, precio_unitario, descripcion_diseno, subtotal) VALUES
    (1,  3, 1, 3, 1, 325.00, 'Tema princesas con colores rosa y morado, cake topper', 325.00),
    (2, 17, NULL, NULL, 1, 195.00, 'Letras FELIZ CUMPLEAÑOS en chocolate blanco',     195.00),
    (3,  5, 2, 5, 1, 185.00, 'Tema unicornio para quinceañera',                       185.00),
    (3, 11, NULL, NULL, 1,  95.00, 'Topping Oreo',                                     95.00),
    (4,  6, 8, 3, 1, 250.00, 'Decoración sencilla, zanahoria en fondant',             250.00),
    (5,  8, 2, 6, 1, 270.00, 'Letrero de feliz cumpleaños dorado',                    270.00),
    (6,  5, 1, 4, 1, 185.00, 'Tema jardín con flores, colores verde y amarillo',      185.00),
    (7,  1, 3, 2, 2, 175.00, 'Mini cakes individuales para mesa de postres',          350.00),
    (7, 13, NULL, NULL, 1,  80.00, 'Alfajores cubiertos con chocolate blanco',         80.00),
    (7, 25, NULL, NULL, 1,  90.00, 'Churros para evento empresarial',                  90.00);

-- ------------------------------------------------------------
-- 9. Detalle_Extra_HC
-- ------------------------------------------------------------
INSERT INTO Detalle_Extra_HC (id_detalle, id_extra, precio_aplicado) VALUES
    (1, 1, 20.00),
    (1, 2, 30.00),
    (6, 1, 20.00),
    (6, 5, 15.00),
    (7, 3, 40.00),
    (8, 4, 50.00),
    (8, 1, 20.00);


-- ============================================================
--  SECCIÓN 2 – UPDATES (3 con cláusula WHERE)
-- ============================================================

-- Desactivar Safe Update Mode para permitir WHERE sin PRIMARY KEY
SET SQL_SAFE_UPDATES = 0;

-- UPDATE 1: Confirmar el pedido pendiente del cliente 7 y cambiar estado
UPDATE Pedido_HC
SET estado = 'En_Proceso',
    anticipo_pagado = 230.00
WHERE id_pedido = 7
  AND estado = 'Pendiente';

-- UPDATE 2: Ajustar precio del Choco Coffee Bomb por incremento de insumos
UPDATE Producto_HC
SET precio_base = 285.00
WHERE nombre = 'Choco Coffee Bomb'
  AND id_categoria = 1;

-- UPDATE 3: Desactivar productos que requieren refrigeración por mantenimiento
UPDATE Producto_HC
SET activo = FALSE
WHERE requiere_refrig = TRUE
  AND activo = TRUE;

-- Restaurar Safe Update Mode
SET SQL_SAFE_UPDATES = 1;


-- ============================================================
--  SECCIÓN 3 – DELETES (3 con cláusula WHERE)
-- ============================================================

SET SQL_SAFE_UPDATES = 0;

-- DELETE 1: Eliminar extras asociados al detalle 4 (línea sin pedido activo)
DELETE FROM Detalle_Extra_HC
WHERE id_detalle = 4;

-- DELETE 2: Eliminar clientes que no tienen ningún pedido registrado
DELETE FROM Cliente_HC
WHERE id_cliente NOT IN (
    SELECT id_cliente FROM (
        SELECT DISTINCT id_cliente FROM Pedido_HC
    ) AS sub
);

-- DELETE 3: Eliminar sabores de relleno que no tienen costo extra (limpieza de datos)
DELETE FROM Sabor_Relleno_HC
WHERE costo_extra = 0.00
  AND id_relleno > 7;

SET SQL_SAFE_UPDATES = 1;


-- ============================================================
--  SECCIÓN 4 – SELECTS con funciones de agregación y GROUP BY
-- ============================================================

-- ----------------------------------------------------------------
-- SELECT 1: Total facturado y número de pedidos por estado
--           Funciones: COUNT(), SUM()
-- ----------------------------------------------------------------
SELECT
    estado                              AS Estado_Pedido,
    COUNT(id_pedido)                    AS Total_Pedidos,
    SUM(total)                          AS Facturado_Total_Q,
    SUM(anticipo_pagado)                AS Anticipo_Cobrado_Q,
    SUM(total) - SUM(anticipo_pagado)   AS Saldo_Pendiente_Q
FROM Pedido_HC
GROUP BY estado
ORDER BY Facturado_Total_Q DESC;

-- ----------------------------------------------------------------
-- SELECT 2: Precio mínimo, máximo y promedio por categoría
--           Funciones: MIN(), MAX(), AVG(), COUNT()
-- ----------------------------------------------------------------
SELECT
    c.nombre                        AS Categoria,
    COUNT(p.id_producto)            AS Cantidad_Productos,
    MIN(p.precio_base)              AS Precio_Minimo_Q,
    MAX(p.precio_base)              AS Precio_Maximo_Q,
    ROUND(AVG(p.precio_base), 2)    AS Precio_Promedio_Q
FROM Categoria_Producto_HC c
JOIN Producto_HC p ON p.id_categoria = c.id_categoria
WHERE p.activo = TRUE
GROUP BY c.id_categoria, c.nombre
ORDER BY Precio_Promedio_Q DESC;

-- ----------------------------------------------------------------
-- SELECT 3: Productos más vendidos por unidades e ingresos
--           Funciones: SUM(), COUNT()
-- ----------------------------------------------------------------
SELECT
    p.nombre                        AS Producto,
    c.nombre                        AS Categoria,
    SUM(dp.cantidad)                AS Unidades_Vendidas,
    COUNT(dp.id_detalle)            AS Veces_Pedido,
    SUM(dp.subtotal)                AS Ingresos_Generados_Q
FROM Detalle_Pedido_HC dp
JOIN Producto_HC p           ON p.id_producto  = dp.id_producto
JOIN Categoria_Producto_HC c ON c.id_categoria = p.id_categoria
GROUP BY p.id_producto, p.nombre, c.nombre
ORDER BY Unidades_Vendidas DESC;

-- ----------------------------------------------------------------
-- SELECT 4: Clientes con mayor gasto total y promedio por pedido
--           Funciones: SUM(), AVG(), COUNT(), MAX()
-- ----------------------------------------------------------------
SELECT
    CONCAT(cl.nombre, ' ', cl.apellido) AS Cliente,
    cl.telefono                          AS WhatsApp,
    COUNT(pe.id_pedido)                  AS Pedidos_Realizados,
    SUM(pe.total)                        AS Gasto_Total_Q,
    ROUND(AVG(pe.total), 2)              AS Gasto_Promedio_Q,
    MAX(pe.total)                        AS Pedido_Mayor_Q
FROM Cliente_HC cl
JOIN Pedido_HC pe ON pe.id_cliente = cl.id_cliente
GROUP BY cl.id_cliente, cl.nombre, cl.apellido, cl.telefono
ORDER BY Gasto_Total_Q DESC;

-- ----------------------------------------------------------------
-- SELECT 5: Extras de decoración más solicitados con ingreso total
--           Funciones: COUNT(), SUM(), AVG()
-- ----------------------------------------------------------------
SELECT
    ed.nombre                           AS Extra,
    ed.precio_adicional                 AS Precio_Unitario_Q,
    COUNT(de.id_detalle_extra)          AS Veces_Solicitado,
    SUM(de.precio_aplicado)             AS Ingreso_Total_Extra_Q,
    ROUND(AVG(de.precio_aplicado), 2)   AS Precio_Promedio_Cobrado_Q
FROM Extra_Decoracion_HC ed
JOIN Detalle_Extra_HC de ON de.id_extra = ed.id_extra
GROUP BY ed.id_extra, ed.nombre, ed.precio_adicional
ORDER BY Veces_Solicitado DESC;

-- ============================================================
--  FIN DEL SCRIPT DE DATOS Y CONSULTAS
-- ============================================================