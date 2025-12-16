-- =========================
-- REGLAS CLAVE DEL SISTEMA
-- =========================

-- 1. Los montos SIEMPRE son positivos
--    (forzado por CHECK en la tabla)

-- 2. El impacto en liquidez se define
--    exclusivamente por tipo_movimiento

-- 3. El ahorro SOLO se identifica por tipo_categoria = 'AHORRO'
--    y se relaciona opcionalmente con fondos

-- 4. Los retiros y movimientos internos
--    NO afectan liquidez

-- =========================
-- ASIGNACIÓN MASIVA DE TARJETAS (ejemplo real del proyecto)
-- =========================

UPDATE movimientos
SET id_tarjeta = 1
WHERE id_categoria IN (1,6,7,14);

UPDATE movimientos
SET id_tarjeta = 2
WHERE id_categoria IN (3,4,9,10,13,15);

UPDATE movimientos
SET id_tarjeta = 3
WHERE id_categoria IN (2,5,11,12);
