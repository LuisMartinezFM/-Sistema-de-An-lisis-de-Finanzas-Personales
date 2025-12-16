Capítulo 1 — Pantalla Resumen Financiero


## 🎯 Objetivo de la pantalla

La pantalla Resumen Financiero tiene como objetivo ofrecer una visión global y coherente del estado financiero del sistema, utilizando exclusivamente KPIs derivados del modelo de datos definido en SQL.

Esta pantalla responde a una sola pregunta:

¿Cuál es la situación financiera actual, considerando todo el historial registrado?

No busca el detalle, sino validar que el sistema cuadra y que las reglas del sistema funcionan correctamente.

## 🧠 Relación con el modelo de datos

Todos los indicadores de esta pantalla se construyen a partir de la tabla central movimientos, apoyándose en los catálogos:

tipo_movimiento → define si una transacción impacta liquidez

categorias → clasifica salidas en gasto, ahorro o préstamo

fondos → agrupa el ahorro por metas

La pantalla no introduce lógica nueva.
Únicamente consume y refleja las reglas ya establecidas en el sistema.

## 📌 KPIs incluidos
🔹 Ingresos Totales

Representa todo el dinero que realmente entra y aumenta la liquidez del sistema.

Criterios:

- tipo_movimiento = INGRESO

- impacta_liquidez = TRUE

- Este KPI excluye retiros y movimientos internos.

🔹 Dinero Usado

Corresponde al dinero que sale y reduce la liquidez disponible.

  Incluye:

- gastos

- préstamos otorgados

Excluye:

- ahorro

- movimientos internos

- Este indicador permite entender cuánto dinero se ha consumido efectivamente.

🔹 Ahorro Total

Muestra el dinero que ha sido apartado deliberadamente, no gastado.

Criterios:

- tipo_categoria = AHORRO

- impacta_liquidez = TRUE

- El ahorro se analiza de forma independiente para evitar confundirlo con gasto.

🔹 Saldo Final (Liquidez)

- Representa la liquidez neta acumulada desde el primer registro del sistema.

- Este KPI no se almacena en la base de datos, sino que se deduce a partir de:

- Saldo Final = Ingresos Totales − (Dinero Usado + Ahorro Total)


- Este indicador valida que el sistema financiero sea consistente en el tiempo.

## 📈 Visualizaciones principales
🔸 Ingresado vs Dinero Usado por mes

Permite analizar el flujo mensual de dinero y detectar:

- meses con superávit

- meses con presión financiera

- dependencia de saldo previo

Esta visualización reemplaza el enfoque clásico de “ingresos vs gastos”, alineándose con la lógica del sistema.

🔸 Top categorías con mayor uso de dinero

Muestra en qué categorías se concentra el mayor consumo de liquidez, considerando únicamente:

- gasto

- préstamos

El ahorro no se incluye para evitar distorsiones.

🔸 Ahorro por fondo

Visualiza el avance en cada meta de ahorro definida en el sistema.

Los fondos sin ahorro aparecen con valor cero, permitiendo:

- identificar metas activas

- detectar metas aún no iniciadas

## 🧪 Validación del sistema

La pantalla Resumen cumple una función adicional:
validar que la ecuación financiera del sistema se cumple.

Ingresos Totales = Dinero Usado + Ahorro Total + Saldo Final


Si esta igualdad no se cumple, existe un problema en el modelo o en los datos.

El hecho de que esta relación se mantenga confirma que:

no hay doble conteo

no hay montos negativos inconsistentes

las reglas de liquidez están bien definidas

## 🧠 Alcance de la pantalla

Esta pantalla no sustituye el análisis detallado.
Su propósito es:

ofrecer una vista ejecutiva

servir como punto de partida

confirmar la coherencia del sistema

El detalle se aborda en los capítulos siguientes.

## 📺 Próximo capítulo

Capítulo 2 — Ingresos vs Dinero Usado
Análisis detallado del flujo mensual y patrones de consumo.

## 📌 Nota

Las visualizaciones de esta pantalla fueron construidas en Power BI utilizando exclusivamente los datos y reglas definidas en SQL.
