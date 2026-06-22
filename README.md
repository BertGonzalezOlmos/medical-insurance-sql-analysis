# Análisis de Costos de Seguros Médicos con MySQL

## Descripción del proyecto

Este proyecto consiste en el análisis de un dataset de seguros médicos utilizando **MySQL**. El objetivo fue practicar consultas SQL aplicadas a un caso de negocio, trabajando desde la carga y estructuración de los datos hasta la exploración de patrones relacionados con los costos del seguro.

El proyecto incluye:

* creación de tablas relacionales en MySQL
* carga de archivos CSV
* limpieza básica de datos importados
* consultas SQL de nivel básico, intermedio y avanzado
* análisis orientado a negocio sobre costos de seguros médicos

Este proyecto forma parte de mi portafolio de análisis de datos y está enfocado en fortalecer habilidades de **SQL, modelado relacional, limpieza de datos y análisis exploratorio**.

---

## Dataset

El dataset contiene información de clientes asegurados y sus costos médicos. Las variables principales son:

### Tabla `insurance_data`

* **insurance_id**: identificador único del cliente
* **age**: edad
* **sex**: sexo
* **bmi**: índice de masa corporal
* **children**: cantidad de hijos/dependientes
* **smoker**: indica si la persona fuma o no
* **region_id**: identificador de la región
* **charges**: costo del seguro médico

### Tabla `region_lookup`

Tabla auxiliar creada para normalizar la región y trabajar relaciones en MySQL.

* **region_id**: identificador de la región
* **region_name**: nombre de la región

---

## Objetivo del análisis

El propósito de este proyecto fue responder preguntas de negocio relacionadas con el costo del seguro médico, por ejemplo:

* ¿Las personas fumadoras tienen mayores costos que las no fumadoras?
* ¿Qué regiones presentan un mayor costo promedio del seguro?
* ¿Cuáles son los clientes con mayores cargos médicos?
* ¿Cómo cambia el costo según el perfil del cliente?
* ¿Cómo se distribuyen fumadores y no fumadores por región?

---

## Herramientas utilizadas

* **MySQL**
* **SQL**
* **Archivos CSV**
* **GitHub** para documentación y portafolio

---

## Estructura de la base de datos

### 1. `insurance_data`

Tabla principal con la información de cada cliente asegurado.

### 2. `region_lookup`

Tabla de apoyo para relacionar cada cliente con el nombre de su región mediante `region_id`.

Esta estructura permite practicar:

* relaciones entre tablas
* `JOIN`
* consultas agregadas
* segmentación de datos por región

---

## Habilidades SQL aplicadas

Durante el proyecto se trabajó con:

* `SELECT`
* `WHERE`
* `ORDER BY`
* `LIMIT`
* `GROUP BY`
* funciones agregadas: `AVG()`, `COUNT()`, `MAX()`, `MIN()`
* `INNER JOIN`
* `CASE WHEN`
* filtros y segmentación de datos
* clasificación de clientes por costo y por BMI

---

## Consultas realizadas

### Nivel básico

* Visualización de personas fumadoras
* Identificación de las 10 personas con mayor costo de seguro

### Nivel intermedio

* Cálculo del costo promedio por sexo
* Cantidad de personas por región utilizando `JOIN`

### Nivel avanzado

* Costo promedio del seguro por región y por hábito de fumar
* Clasificación de clientes según nivel de costo
* Regiones con costo promedio superior a un umbral
* Clasificación del BMI
* Top 5 clientes más caros con su región
* Comparación entre fumadores y no fumadores por región

---

## Ejemplos de análisis incluidos

### 1) Personas fumadoras

Consulta para filtrar todos los clientes cuyo valor en `smoker` es `'yes'`.

### 2) Top 10 mayores costos de seguro

Consulta para identificar los casos con mayores cargos médicos.

### 3) Costo promedio por sexo

Análisis del promedio de `charges` agrupado por sexo.

### 4) Cantidad de personas por región

Uso de `JOIN` entre `insurance_data` y `region_lookup` para contar registros por región.

### 5) Costo promedio por región y fumador/no fumador

Cruce entre región y hábito de fumar para observar diferencias en costos.

### 6) Clasificación por costo

Segmentación de clientes en:

* **Alto costo**
* **Costo medio**
* **Bajo costo**

mediante una sentencia `CASE`.

### 7) Regiones con promedio superior a 12.000

Consulta usando `HAVING` para filtrar regiones con mayor costo promedio.

### 8) Clasificación del BMI

Segmentación de clientes en:

* **Normal**
* **Sobrepeso**
* **Obesidad**

según su índice de masa corporal.

### 9) Top 5 clientes más caros con su región

Consulta combinando datos del cliente con su región correspondiente.

### 10) Comparación entre fumadores y no fumadores por región

Análisis de:

* cantidad de personas
* costo promedio
* costo máximo
* costo mínimo

según región y hábito de fumar.

---

## Ejemplo de consulta SQL

```sql
SELECT 
    r.region_name,
    i.smoker,
    AVG(i.charges) AS promedio_costo
FROM insurance_data i
JOIN region_lookup r
    ON i.region_id = r.region_id
GROUP BY r.region_name, i.smoker
ORDER BY r.region_name;
```

---

## Estructura del proyecto

```bash
medical-insurance-sql-analysis/
│
├── insurance_data_clean_mysql.csv
├── region_lookup_clean_mysql.csv
├── medical_insurance_queries.sql
└── README.md
```

---

## Principales aprendizajes

Este proyecto me permitió reforzar habilidades prácticas en SQL aplicadas a un dataset con enfoque de negocio. En particular, trabajé en:

* creación de tablas en MySQL
* importación de archivos CSV
* limpieza básica de datos para su carga en base de datos
* modelado simple con tablas relacionadas
* uso de `JOIN` para enriquecer el análisis
* construcción de consultas para responder preguntas de negocio
* segmentación de clientes según variables relevantes como región, tabaquismo y BMI

---

## Conclusión

Este proyecto muestra un flujo básico de trabajo en SQL para análisis de datos: desde la preparación e importación de la información, hasta la generación de consultas que permiten identificar patrones y extraer insights útiles sobre el comportamiento de los costos de seguros médicos.

Forma parte de mi portafolio orientado a análisis de datos, reporting y business intelligence, utilizando herramientas como **Excel, Power BI, SQL y Python**.
