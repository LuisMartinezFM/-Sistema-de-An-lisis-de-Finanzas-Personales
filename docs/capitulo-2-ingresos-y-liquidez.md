# Capítulo 2 – Ingresos y Uso de Liquidez

Este capítulo documenta la pantalla **Ingresos y Uso de Liquidez**, que funciona como la vista **resumen financiera** del sistema.

El objetivo de esta pantalla no es solo mostrar ingresos y gastos, sino **garantizar coherencia financiera real entre periodos**, evitando errores comunes como dinero fantasma o descuadres mensuales.

---

## Objetivo de la pantalla

Responder de forma clara y verificable:

- ¿Con cuánta liquidez inicia el periodo?
- ¿Cuánto dinero entra realmente?
- ¿Cuánto dinero se utiliza y en qué?
- ¿Con cuánta liquidez se cierra el periodo?
- ¿Ese cierre coincide con el inicio del siguiente mes?

La pantalla está diseñada para que la relación entre estos elementos **siempre cuadre**.

---

## Enfoque financiero

Esta pantalla se basa en una regla simple pero estricta:

> **Saldo inicial + Entradas de liquidez − Uso de liquidez = Liquidez final**

Todas las métricas del dashboard respetan esta ecuación.

---

## Decisiones clave de diseño

- Los **montos siempre son positivos**.
- El impacto financiero se define por el **tipo de movimiento**, no por el signo.
- El **uso de liquidez** solo considera **salidas reales**.
- Préstamos recibidos **no se consideran gasto**.
- El ahorro **no se considera gasto**.
- No existen ajustes visuales para “cuadrar” números.

Toda la lógica se resuelve en **PostgreSQL**, no en Power BI.

---

## Elementos del dashboard

### KPIs principales

- **Saldo inicial**  
  Liquidez disponible al inicio del periodo.

- **Entradas de liquidez**  
  Ingresos reales del periodo.

- **Monto usado**  
  Salidas que impactan liquidez, excluyendo ahorro y préstamos.

- **Liquidez final**  
  Saldo resultante al cierre del periodo.

- **Préstamos recibidos**  
  Métrica analítica mostrada por separado para no contaminar el uso de liquidez.

---

### Visual principal

**Monto usado por categoría**

- Muestra en qué se utilizó la liquidez.
- Solo considera salidas reales.
- Préstamos recibidos nunca aparecen por diseño.

---

## Cierre correcto por periodo

Se aplicó una lógica explícita de cierre mensual para evitar descuadres entre meses consecutivos.

- El cierre del mes se calcula correctamente usando el fin de mes.
- La **liquidez final de un mes coincide con la liquidez inicial del siguiente**.
- No existen saltos artificiales entre Febrero → Marzo u otros cambios de mes.

---

## Validaciones realizadas

- No existen movimientos sin impacto contable.
- No existen préstamos sin movimiento asociado.
- No existe dinero duplicado.
- No existen ajustes manuales en Power BI.

---

## Resultado

La pantalla permite una lectura clara y confiable del flujo de liquidez, funcionando como base para el resto del sistema:

- Ahorro y metas
- Método de pago
- Préstamos
- Fondos

---

## Continuidad

El siguiente capítulo documenta la pantalla **Ahorro y Metas**, donde el enfoque cambia de flujo a **estado financiero**, analizando el progreso real de metas de ahorro.
