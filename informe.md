# Análisis de las solicitudes de uniones de hecho por la población de castilla y león

# Introducción

## Contexto
En la comunidad de Castilla y León se solicitan anualmente miles de solicitudes de uniones de hecho, debido a la gran cantidad de solicitudes en el ultimo año, se han dividido el numero de solicitudes en dos grandes grupos, el primero se engloba con todas las solicitudes desde el año 2010 hasta el año 2016 y el segundo grupo contiene todas las solicitudes que comprenden desde el año 2017 hasta el año 2023

## Objetivo
El objetivo de la investigación es: "Realizar un análisis estadístico descriptivo de las solicitudes de hecho en la comunidad de Castilla y León comparando las diferencias que existen respecto a número de solicitudes de los ultimos años con las solicitudes de años pasados".

## Alcance
La investigacion se limita al número de solicitudes de uniones de hecho localizadas en Castilla y León en los años que comprenden entre 2010 y 2023.

# Metodología
## Origen de los datos
Se ha trabajado con un archivo "uniones_de_hecho.csv" que incluye todas las solicitudes presentadas en Castilla y León en los ultimos años. El archivo ha sido presentado por el ayuntamiento de la comunidad de Castilla y León.

## Herramientas
Se han procesado los datos utilizando la aplicación RStudio para linux, versión 2024.09.0+375 y el paquete "e1071" para calcular los coeficientes de asimetría y apuntamiento.

## Diseño

# Resultados

## Medidas estadísticas
En esta tabla se muestran los resultados de las medidas estadístcas de centralización, dispersion, localización y forma más relevantes, para el total de solicitudes y para las solicitudes de 2010-2016 y 2017-2023.

| Medida | Todos | Primera franja | Segunda franja |
| ------- |-------|----------------|----------------|
| Tamaño de muestra | 126 | 63 | 63|
| Medidas de centralización |
| Media | 219.65 | 185.17  | 254.13  |
| Mediana |  169 | 141 | 186 | 
| Medidas de dispersión | 
| Mínimo | 18 | 18 | 30 |
| Máximo | 797 | 581 | 797 |
| Rango | 779 | 563 | 767 |
| Varianza | 28866.85 | 20646.57 | 35137.18 |
| Desviación estándar | 169.9 | 143.69 | 187.45 |
| Coeficiente de variación | 0.77 | 0.78 | 0.74 |
| Medidas de localización |
| Primer Cuartil (Q1) | 82.75 | 69.5 | 117.0 |
| Tercer Cuartil (Q3) | 311.00 | 278.5 | 346.5 |
| Rango intercuartílico (IQR) | 228.25 | 209.0 | 229.5 |
| Medidas de forma | 
| Coeficiente de asimetría | 1.19 | 1.07 | 1.06 | 
| Coeficiente de apuntamiento (curtosis)| 0.96 | 0.56 | 0.38 |
| Otras | 
| Valores inferiores a la media | !!!!!!!!!!!!!!!!!!!!!!!!
| Valores superiores a la media |!!!!!!!!!!!!!!!!!!!!!!!!!!!

## Tablas de contingencia
En esta tabla se muestra la tabla de contingencia para las variables solicitudes y franja en el caso de agrupar las solicitudes en 8 intervalos. En la tabla se representa con f las frecuencias absolutas y con h las frecuencias relativas.

| solicitud/franja | Primera franja | Segunda franja | f solicitud | h solicitud |
|------------------|----------------|----------------|-------------|-------------|
| [0,100) | 25 | 12 | 37 | 0.29 |
| [100,200) | 13 | 20 | 33 | 0.26 |
| [200,300) | 13 | 9 | 22 | 0.17 |
| [300,400) | 7 | 12 | 19 | 0.15 |
| [400,500) | 1 | 3 | 4 | 0.03 |
| [500,600) | 4 | 1 | 5 | 0.04 |
| [600,700) | 0 | 4 | 4 | 0.03 |
| [700,800] | 0 | 2 | 2 | 0.02 |
| f franja | 63 | 63 | 126 | |
| h franja | 0.50 | 0.50 | | 1| 

## Diagramas
En el siguiente diagrama se muestra el porcentaje de solicitudes en cada una de las franjas, el total de !!!!!!!!!!!!!!!!!!!!!!
<div>
<p style = 'text-align:center;'>
<img src="diagrama_de_tarta.png" width="300px">
</p>
</div>

En los siguientes diagramas se muestran los histogramas y diagramas de caja (boxplot) de la variable solicitudes, en el caso de los histogramas, agrupada en ocho intervalos, considerando todas las franjas(izquierda), sólo las solicitudes que pertenecen a la primera franja (centro) y sólo las solicitudes que pertenecen a la segunda franja (derecha).
En los diagramas aparecen tanto la mediana (línea negra continua) como la media (línea roja
discontinua).
<div>
<p style = 'text-align:center;'>
<img src="histogramas.png" width="">
</p>
</div>

# Análisis de resultados

# Conclusión
