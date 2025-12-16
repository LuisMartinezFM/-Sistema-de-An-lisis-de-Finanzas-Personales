-- =========================
-- BASE DE DATOS
-- =========================
CREATE DATABASE finanzas_personales;
-- (ejecutar conexión a esta DB antes de continuar)

-- =========================
-- TABLAS DE CATÁLOGO
-- =========================

CREATE TABLE categorias (
    id_categoria SERIAL PRIMARY KEY,
    nombre_categoria VARCHAR(100) NOT NULL,
    tipo_categoria VARCHAR(20) NOT NULL
        CHECK (tipo_categoria IN ('GASTO', 'AHORRO', 'PRESTAMO'))
);

CREATE TABLE tipo_movimiento (
    id_tipo SERIAL PRIMARY KEY,
    nombre_tipo VARCHAR(100) NOT NULL,
    impacta_liquidez BOOLEAN NOT NULL
);

CREATE TABLE metodo_pago (
    id_metodo_pago SERIAL PRIMARY KEY,
    nombre_metodo VARCHAR(50) NOT NULL
);

CREATE TABLE fondos (
    id_fondo SERIAL PRIMARY KEY,
    nombre_fondo VARCHAR(100) NOT NULL
);

CREATE TABLE tarjetas_credito (
    id_tarjeta SERIAL PRIMARY KEY,
    nombre_tarjeta VARCHAR(100) NOT NULL
);

-- =========================
-- TABLA CENTRAL DE HECHOS
-- =========================

CREATE TABLE movimientos (
    id_movimiento SERIAL PRIMARY KEY,
    fecha DATE NOT NULL,
    monto NUMERIC(12,2) NOT NULL CHECK (monto > 0),

    tipo_movimiento VARCHAR(10) NOT NULL
        CHECK (tipo_movimiento IN ('INGRESO', 'SALIDA')),

    id_categoria INT NOT NULL,
    id_tipo_movimiento INT NOT NULL,
    id_metodo_pago INT NOT NULL,

    id_fondo INT NULL,
    id_tarjeta INT NULL,

    CONSTRAINT fk_categoria
        FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria),

    CONSTRAINT fk_tipo_mov
        FOREIGN KEY (id_tipo_movimiento) REFERENCES tipo_movimiento(id_tipo),

    CONSTRAINT fk_metodo_pago
        FOREIGN KEY (id_metodo_pago) REFERENCES metodo_pago(id_metodo_pago),

    CONSTRAINT fk_fondo
        FOREIGN KEY (id_fondo) REFERENCES fondos(id_fondo),

    CONSTRAINT fk_tarjeta
        FOREIGN KEY (id_tarjeta) REFERENCES tarjetas_credito(id_tarjeta)
);
