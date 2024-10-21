unionesDeHecho=read.csv2("uniones_de_hecho.csv")

uniones.primera.franja=unionesDeHecho[((unionesDeHecho$Año==2010)|(unionesDeHecho$Año==2011)|(unionesDeHecho$Año==2012)|(unionesDeHecho$Año==2013)|(unionesDeHecho$Año==2014)|(unionesDeHecho$Año==2015)|(unionesDeHecho$Año==2016)),]
uniones.segunda.franja=unionesDeHecho[((unionesDeHecho$Año==2017)|(unionesDeHecho$Año==2018)|(unionesDeHecho$Año==2019)|(unionesDeHecho$Año==2020)|(unionesDeHecho$Año==2021)|(unionesDeHecho$Año==2022)|(unionesDeHecho$Año==2023)),]

uniones.primera.franja$franja = rep(c("primera"), times = nrow(uniones.primera.franja))
uniones.segunda.franja$franja = rep(c("segunda"), times = nrow(uniones.segunda.franja))

uniones.con.franja = rbind(uniones.primera.franja, uniones.segunda.franja)

solicitudes<- as.numeric(uniones.con.franja$Solicitudes.presentadas)
franja=uniones.con.franja$franja

#### TAMAÑO DE LA MUESTRA
tapply(solicitudes, franja, length)

#### MEDIDAS DE CENTRALIZACION
## media
round(mean(solicitudes),2)
round(tapply(solicitudes, franja, mean),2)
## mediana
round(median(solicitudes),2)
round(tapply(solicitudes, franja, median),2)

#### MEDIDAS DE DISPERSIÓN
## minimo
min(solicitudes)
round(tapply(solicitudes, franja, min),2)
## maximo
max(solicitudes)
round(tapply(solicitudes, franja, max),2)
## rango
max(solicitudes)-min(solicitudes)
round(tapply(solicitudes, franja, max),2)-round(tapply(solicitudes, franja, min),2)
## varianza
round(var(solicitudes),2)
round(tapply(solicitudes, franja, var),2)
## desviacion estandar
round(sd(solicitudes),2)
round(tapply(solicitudes, franja, sd),2)
## coeficiente de variacion
round(sd(solicitudes)/mean(solicitudes),2)
round(tapply(solicitudes, franja, sd)/tapply(solicitudes,franja,mean),2)

#### MEDIDAS DE LOCALIZACION
## cuartiles
round(summary(solicitudes),2)
tapply(solicitudes, franja, quantile)
## rango intercuartilico (IQR)
round(IQR(solicitudes),2)
round(tapply(solicitudes, franja, IQR),2)

#### MEDIDAS DE FORMA
install.packages("e1071")
library("e1071")
## coeficiente de asimetría
round(skewness(solicitudes),2)
round(tapply(solicitudes, franja, skewness),2)
## coeficiente de apuntamiento o curtosis
round(kurtosis(solicitudes),2)
round(tapply(solicitudes, franja, kurtosis),2)

#### OTRAS MEDIDAS
# Valores inferiores a la media en todas las solicitudes
solicitudes.menores <- length(solicitudes[solicitudes < mean(solicitudes)])
porcentaje.menores <- round(100 * solicitudes.menores / length(solicitudes))

# Valores inferiores a la media en la primera franja
solicitudes.primera.menores <- length(solicitudes.primera[solicitudes.primera < mean(solicitudes.primera)])
porcentaje.primera.menores <- round(100 * solicitudes.primera.menores / length(solicitudes.primera))

# Valores inferiores a la media en la segunda franja
solicitudes.segunda.menores <- length(solicitudes.segunda[solicitudes.segunda < mean(solicitudes.segunda)])
porcentaje.segunda.menores <- round(100 * solicitudes.segunda.menores / length(solicitudes.segunda))

# Valores superiores a la media en todas las solicitudes
solicitudes.mayores <- length(solicitudes[solicitudes > mean(solicitudes)])
porcentaje.mayores <- round(100 * solicitudes.mayores / length(solicitudes))

# Valores superiores a la media en la primera franja
solicitudes.primera.mayores <- length(solicitudes.primera[solicitudes.primera > mean(solicitudes.primera)])
porcentaje.primera.mayores <- round(100 * solicitudes.primera.mayores / length(solicitudes.primera))

# Valores superiores a la media en la segunda franja
solicitudes.segunda.mayores <- length(solicitudes.segunda[solicitudes.segunda > mean(solicitudes.segunda)])
porcentaje.segunda.mayores <- round(100 * solicitudes.segunda.mayores / length(solicitudes.segunda))

# Mostrar resultados
solicitudes.menores
porcentaje.menores
solicitudes.primera.menores
porcentaje.primera.menores
solicitudes.segunda.menores
porcentaje.segunda.menores

solicitudes.mayores
porcentaje.mayores
solicitudes.primera.mayores
porcentaje.primera.mayores
solicitudes.segunda.mayores
porcentaje.segunda.mayores

#### TABLA DE FRECUENCIAS
## regla de sturges
ceiling(1+3.322*log10(126))
L=c(0,100,200,300,400,500,600,700,800)
solicitudes.agrupadas=cut(solicitudes, breaks=L, right=FALSE, include.lowest = TRUE)
addmargins(table(solicitudes.agrupadas,franja))
round(addmargins(prop.table(table(solicitudes.agrupadas,franja))),2)

#### DIAGRAMAS
## diagrama de tarta
par(mfrow=c(1,1))
ft=table(franja)
etiquetas.franja = c("Primera Franja", "Segunda Franja") 
propt = round(ft/sum(ft)*100)
etiquetas.franja = paste(etiquetas.franja, propt) 
etiquetas.franja = paste(etiquetas.franja,"%",sep="") 
pie(ft,labels = etiquetas.franja, col=rainbow(2))

## porcentaje por franjas
par(mfrow=c(1,3))
L=c(5,7,9,11)
fn=table(solicitudes.agrupadas)
etiquetas <- c("Primera franja", "Segunda franja")
prop <- round(fn/sum(fn)*100)
etiquetas= paste(etiquetas, prop) 
etiquetas = paste(etiquetas,"%",sep="") 
pie(fn,labels = etiquetas, col=rainbow(3), main="Solicitudes totales")

solicitudes.primera <- as.numeric(uniones.primera.franja$Solicitudes.presentadas)
solicitudes.segunda <- as.numeric(uniones.segunda.franja$Solicitudes.presentadas)
total.primera <- sum(solicitudes.primera, na.rm=TRUE)
total.segunda <- sum(solicitudes.segunda, na.rm=TRUE)
totales <- c(total.primera, total.segunda)
etiquetas.franjas <- c("Primera Franja", "Segunda Franja")
porcentaje <- round(totales / sum(totales) * 100)
etiquetas.franjas <- paste(etiquetas.franjas, porcentaje, "%", sep=" ")
pie(totales, labels=etiquetas.franjas, col=rainbow(2), main="Porcentaje de Solicitudes por Franja")

## Histogramas, diagramas de caja

#solicitudes totales histograma
par(mfrow=c(3,3))
L=c(0,100,200,300,400,500,600,700,800)
hist(solicitudes, breaks = L, main="", ylab = "Frecuencia", xlab = "solicitudes")
abline(v=median(solicitudes), lwd=3)
abline(v=mean(solicitudes), lwd=2, lty=2, col="darkred")

#solicitudes primera franja histograma
hist(solicitudes.primera, breaks = L, main="", ylab = "Frecuencia", ylim=c(0,30), xlab= "Solicitudes primera franja")
abline(v=median(solicitudes.primera), lwd=3)
abline(v=mean(solicitudes.primera), lwd=2, lty=2, col="darkred")

#solicitudes segunda franja histograma
hist(solicitudes.segunda, breaks = L, main="", ylab = "Frecuencia", ylim=c(0,30), xlab= "Solicitudes segunda franja")
abline(v=median(solicitudes.segunda), lwd=3)
abline(v=mean(solicitudes.segunda), lwd=2, lty=2, col="darkred")

#solicitudes totales diagrama de caja
boxplot(solicitudes,horizontal = TRUE, ylim=c(0,800))
segments(x0 = mean(solicitudes), y0 = 0.8, x1 = mean(solicitudes), y1 = 1.2, col = "darkred",lwd = 2, lty=2)

#solicitudes primera franja diagrama de caja
boxplot(solicitudes.primera,horizontal = TRUE, ylim=c(0,800))
segments(x0 = mean(solicitudes.primera), y0 = 0.8, x1 = mean(solicitudes.segunda), y1 = 1.2, col= "darkred", lwd = 2, lty=2)

#solicitudes segunda franja diagrama de caja
boxplot(solicitudes.segunda,horizontal = TRUE, ylim=c(0,800))
segments(x0 = mean(solicitudes.segunda), y0 = 0.8, x1 = mean(solicitudes.segunda), y1 = 1.2, col= "darkred", lwd = 2, lty=2)
