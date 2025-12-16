-- =========================
-- CATEGORÍAS
-- =========================

INSERT INTO categorias (nombre_categoria, tipo_categoria) VALUES
('Renta', 'GASTO'),
('Alimentación', 'GASTO'),
('Transporte', 'GASTO'),
('Servicios', 'GASTO'),
('Entretenimiento', 'GASTO'),
('Salud', 'GASTO'),
('Educación', 'GASTO'),
('Ahorro general', 'AHORRO'),
('Ahorro emergencia', 'AHORRO'),
('Ahorro viajes', 'AHORRO'),
('Préstamo otorgado', 'PRESTAMO');

-- =========================
-- TIPOS DE MOVIMIENTO
-- =========================

INSERT INTO tipo_movimiento (nombre_tipo, impacta_liquidez) VALUES
('Ingreso laboral', TRUE),
('Transferencia recibida', TRUE),
('Gasto', TRUE),
('Ahorro', TRUE),
('Préstamo otorgado', TRUE),
('Retiro de efectivo', FALSE),
('Movimiento interno', FALSE);

-- =========================
-- MÉTODOS DE PAGO
-- =========================

INSERT INTO metodo_pago (nombre_metodo) VALUES
('Efectivo'),
('Débito'),
('Crédito'),
('Transferencia'),
('PayPal');

-- =========================
-- FONDOS DE AHORRO
-- =========================

INSERT INTO fondos (nombre_fondo) VALUES
('Fondo de emergencia'),
('Viajes'),
('Enganche'),
('Educación'),
('Inversión');

-- =========================
-- TARJETAS DE CRÉDITO
-- =========================

INSERT INTO tarjetas_credito (nombre_tarjeta) VALUES
('Oro Express'),
('ONE BLACK'),
('Básica Blanca');
