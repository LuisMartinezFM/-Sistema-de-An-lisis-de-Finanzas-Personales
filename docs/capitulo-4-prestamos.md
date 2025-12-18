# Capítulo 4 – Préstamos

## Vista general

![Préstamos](./imagenes/prestamos.png)

Esta pantalla analiza la **posición financiera real** derivada de préstamos personales, separando claramente:

- Estado del préstamo
- Flujo de abonos
- Deuda pendiente vs deuda por cobrar

A diferencia de un enfoque puramente visual, este capítulo se apoya en reglas explícitas del sistema financiero diseñado en la base de datos.

## Indicadores clave

- **Deuda Pendiente**: monto total que aún debo.
- **Deuda por Cobrar**: monto total que me deben.
- **Posición Neta en Préstamos**: diferencia entre lo que me deben y lo que debo.
- **Préstamos Activos**: contratos de préstamo aún abiertos.

## Detalle operativo

La tabla central muestra únicamente **préstamos activos**, permitiendo identificar rápidamente:

- A quién corresponde cada préstamo
- El monto original
- El saldo pendiente actual
- El tipo de préstamo (otorgado o recibido)

Los abonos se tratan como **eventos de flujo**, mientras que la deuda se presenta como **estado**, evitando inconsistencias temporales.

