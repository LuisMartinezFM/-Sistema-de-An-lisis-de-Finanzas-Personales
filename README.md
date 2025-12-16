## 📊 Sistema de Anlisis de Finanzas Personales

Diseño del modelo de datos en SQL

## 🎯 Objetivo del proyecto

Este proyecto tiene como objetivo diseñar un sistema de análisis financiero personal que permita comprender de forma clara y coherente cómo fluye el dinero a lo largo del tiempo.

El enfoque principal no es el dashboard, sino la estructura de datos que lo soporta.
El sistema se diseñó desde SQL para evitar problemas comunes en análisis de finanzas personales como balances inconsistentes, doble conteo de movimientos o interpretaciones ambiguas del ahorro.

## 🧠 Principios de diseño

Antes de construir cualquier visualización, se definieron las siguientes reglas:

Los montos siempre se almacenan como valores positivos

El impacto en la liquidez no se define por el signo, sino por reglas de negocio

Ingresos, gasto, ahorro y préstamos son conceptos distintos

Los balances no se almacenan, se calculan

Los movimientos internos no deben distorsionar el análisis

Estas decisiones permiten construir KPIs financieros consistentes y verificables.

## 🗂️ Modelo de datos (visión general)

El sistema se basa en un modelo relacional normalizado, compuesto por:

Una tabla central de hechos (movimientos)

Múltiples tablas de catálogo que definen el significado de cada transacción

Relaciones explícitas mediante claves foráneas

Esto permite escalar el análisis sin duplicar lógica.

## 🧱 Tablas del sistema
🔹 movimientos

Tabla central del sistema.
Registra cada transacción individual.

Características clave:

El monto siempre es positivo

No contiene lógica financiera implícita

Se apoya en catálogos para definir su significado

Campos relevantes:

fecha

monto

tipo_movimiento (INGRESO / SALIDA)

id_categoria

id_tipo_movimiento

id_metodo_pago

id_fondo (solo para ahorro)

id_tarjeta (si aplica)

🔹 tipo_movimiento

Define cómo afecta cada movimiento a la liquidez.

Campo clave:

impacta_liquidez (boolean)

Ejemplos:

Ingreso laboral → TRUE

Gasto → TRUE

Retiro → FALSE

Movimiento interno → FALSE

Esta tabla evita que ciertos movimientos inflen artificialmente ingresos o gastos.

🔹 categorias

Clasifica el propósito de cada salida de dinero.

Incluye el campo:

tipo_categoria

GASTO

AHORRO

PRESTAMO

Esto permite diferenciar:

dinero efectivamente gastado

dinero reservado

dinero prestado

🔹 fondos

Catálogo de metas de ahorro.

Ejemplos:

Fondo de emergencia

Viajes

Enganche

Solo los movimientos clasificados como AHORRO se relacionan con esta tabla.

🔹 metodo_pago

Define cómo se realizó cada transacción:

efectivo

débito

crédito

transferencia

Permite analizar hábitos de pago.

🔹 tarjetas_credito

Catálogo de tarjetas de crédito utilizadas.

Permite:

analizar uso por tarjeta

identificar dependencia al crédito

evaluar patrones de consumo

## 📐 Reglas de negocio implementadas

A partir del modelo se definen reglas claras:

Un movimiento impacta liquidez solo si su tipo lo indica

El dinero usado corresponde a:

gasto

préstamos otorgados

El ahorro se analiza de forma independiente

El saldo nunca se guarda, se calcula

📊 KPIs habilitados por el modelo

Gracias a esta estructura se pueden construir KPIs como:

Ingresos Totales

Dinero Usado

Ahorro Total

Saldo Final

Todos cumplen la ecuación fundamental:

Ingresos = Dinero Usado + Ahorro + Saldo Final

🛠️ Tecnologías utilizadas

PostgreSQL

SQL

Power BI (como capa de análisis y visualización)

📺 Próximos capítulos

Este repositorio forma parte de una serie:

Resumen financiero

Ingresos vs dinero usado

Ahorro y metas

Métodos de pago

Préstamos

Uso de tarjetas de crédito
