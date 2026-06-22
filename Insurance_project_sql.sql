select * from region_lookup;

#Ver todas las personas fumadoras
SELECT *
FROM insurance_data_clean_mysql
WHERE smoker = 'yes';

#Ver las 10 personas con mayor costo de seguro
SELECT *
FROM insurance_data_clean_mysql
ORDER BY charges DESC
LIMIT 10;

#Calcular el costo promedio del seguro por sexo
SELECT 
    sex,
    AVG(charges) AS promedio_costo
FROM insurance_data_clean_mysql
GROUP BY sex;

#Mostrar cuántas personas hay por región usando JOIN
SELECT 
    r.region_name,
    COUNT(*) AS cantidad_personas
FROM insurance_data_clean_mysql i
JOIN region_lookup r
    ON i.region_id = r.region_id
GROUP BY r.region_name;

#Mostrar el costo promedio del seguro por región y por fumador/no fumador
SELECT 
    r.region_name,
    i.smoker,
    AVG(i.charges) AS promedio_costo
FROM insurance_data_clean_mysql i
JOIN region_lookup r
    ON i.region_id = r.region_id
GROUP BY r.region_name, i.smoker
ORDER BY r.region_name;

#Clasificar a cada persona según su costo de seguro
SELECT 
    insurance_id,
    age,
    charges,
    CASE
        WHEN charges >= 30000 THEN 'Alto costo'
        WHEN charges >= 10000 THEN 'Costo medio'
        ELSE 'Bajo costo'
    END AS categoria_costo
FROM insurance_data_clean_mysql;

#Regiones con promedio mayor a 12000

SELECT 
    r.region_name,
    AVG(i.charges) AS promedio_costo
FROM insurance_data_clean_mysql i
JOIN region_lookup r
    ON i.region_id = r.region_id
GROUP BY r.region_name
HAVING AVG(i.charges) > 12000;

# Clasificar BMI
SELECT 
    insurance_id,
    age,
    bmi,
    CASE
        WHEN bmi >= 30 THEN 'Obesidad'
        WHEN bmi >= 25 THEN 'Sobrepeso'
        ELSE 'Normal'
    END AS categoria_bmi
FROM insurance_data_clean_mysql;

# Top 5 clientes más caros con región
SELECT 
    i.insurance_id,
    i.age,
    i.sex,
    i.smoker,
    r.region_name,
    i.charges
FROM insurance_data_clean_mysql i
JOIN region_lookup r
    ON i.region_id = r.region_id
ORDER BY i.charges DESC
LIMIT 5;

# Comparar fumadores vs no fumadores por región
SELECT 
    r.region_name,
    i.smoker,
    COUNT(*) AS cantidad,
    AVG(i.charges) AS promedio_costo,
    MAX(i.charges) AS costo_maximo,
    MIN(i.charges) AS costo_minimo
FROM insurance_data_clean_mysql i
JOIN region_lookup r
    ON i.region_id = r.region_id
GROUP BY r.region_name, i.smoker
ORDER BY r.region_name, promedio_costo DESC;