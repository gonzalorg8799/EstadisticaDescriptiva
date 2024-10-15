unionesDeHecho=read.csv2("uniones_de_hecho.csv")
unionesDeHecho

unionesDeHechoTotales<- as.numeric(unionesDeHecho$Solicitudes.presentadas)

unionesDeHechoPrimeraFranja<- as.numeric(unionesDeHecho$Solicitudes.presentadas[unionesDeHecho$Año >= 2010 & unionesDeHecho$Año <= 2016])

unionesDeHechoSegundaFranja<- as.numeric(unionesDeHecho$Solicitudes.presentadas[unionesDeHecho$Año >= 2017 & unionesDeHecho$Año <= 2023])

año=unionesDeHecho$Año

####tamaño de la muestra
length(unionesDeHechoTotales)
max(unionesDeHechoTotales)

tapply(unionesDeHechoPrimeraFranja,unionesDeHechoSegundaFranja,length)


### Medidas de centralizacion
#### Media
round(mean(unionesDeHechoTotales),2)
mediaPrimeraFranja=round(mean(unionesDeHechoPrimeraFranja),2)
mediaSegundaFranja=round(mean(unionesDeHechoSegundaFranja),2)
#### Mediana
medianaPrimeraFranja=round(median(unionesDeHechoPrimeraFranja),2)
medianaSegundaFranja=round(median(unionesDeHechoSegundaFranja),2)


### MEDIDAS DE DISPERSION
minPrimeraFranja=min(unionesDeHechoPrimeraFranja)
minSegundaFranja=min(unionesDeHechoSegundaFranja)

maxPrimeraFranja=max(unionesDeHechoPrimeraFranja)
maxSegundaFranja=max(unionesDeHechoSegundaFranja)
#### Rangos
rangoPrimeraFranja=maxPrimeraFranja - minPrimeraFranja
rangoSegundaFranja=maxSegundaFranja - minSegundaFranja

#### Varianza
varianzaPrimeraFranja=round(var(unionesDeHechoPrimeraFranja),2)
varianzaSegundaFranja=round(var(unionesDeHechoSegundaFranja),2)

#### Desviacion Estandar
desviacionPrimeraFranja=round(sd(unionesDeHechoPrimeraFranja),2)
desviacionSegundaFranja=round(sd(unionesDeHechoSegundaFranja),2)

#### Coeficiente de variacion
coeficientePrimeraFranja=round(sd(unionesDeHechoPrimeraFranja)/mean(unionesDeHechoPrimeraFranja),2)
coeficienteSegundaFranja=round(sd(unionesDeHechoSegundaFranja)/mean(unionesDeHechoSegundaFranja),2)


### MEDIDAS DE LOCALIZACION
#### Cuartiles
round(summary(unionesDeHechoPrimeraFranja),2)
round(summary(unionesDeHechoSegundaFranja),2)

#### Rango Intercuartilico
iqrPrimeraFranja=round(IQR(unionesDeHechoPrimeraFranja),2)
iqrSegundaFranja=round(IQR(unionesDeHechoSegundaFranja),2)

### MEDIDAS DE FORMA
install.packages("e1071")
library(e1071)

#### Coeficiente de asimetria
coefAsimetriaPrimeraFranja=round(skewness(unionesDeHechoPrimeraFranja),2)
coefAsimetriaSegundaFranja=round(skewness(unionesDeHechoSegundaFranja),2)

#### Curtosis
curtosisPrimeraFranja=round(kurtosis(unionesDeHechoPrimeraFranja),2)
curtosisSegundaFranja=round(kurtosis(unionesDeHechoSegundaFranja),2)


### OTRAS MEDIDAS
(primeraFranja.menores=length(unionesDeHechoPrimeraFranja[unionesDeHechoPrimeraFranja<mean(unionesDeHechoPrimeraFranja)]))
(segundaFranja.menores=length(unionesDeHechoSegundaFranja[unionesDeHechoSegundaFranja<mean(unionesDeHechoSegundaFranja)]))

round(100*primeraFranja.menores/length(unionesDeHechoPrimeraFranja))

### Regla de sturges
ceiling(1+3.322*log10(126))

### TABLA DE FRECUENCIAS
L=c(0,100,200,300,400,500,600,700,800)
solicitudes.presentadas=cut(unionesDeHechoTotales, breaks=L, right=FALSE, include.lowest = TRUE)



