data <- read.csv("data/tema2/auto-mpg.csv",
                 header = T,
                 stringsAsFactors = F)

# factor(), convierte cualquier valor a factor o categórico
data$cylinders <- factor(data$cylinders, 
                         levels = c(3,4,5,6,8),
                         labels = c("3cil","4cil","5cil","6cil","8cil"))

# Resumen de estádisticas básicas
# Para variables númericas nos da valores estadisticos como: Minimi, Maximo, Media, Mediana, 1er QU., 3er QU.
# Para variables categoricas o factores, nos devuelve el conteo de cada incidencia
# Para strings, solo nos muestra cuantas ocurrencias existen
summary(data)

# str(), Nos da una idea inicial de como está orgaizado el data frame
# str -> structure
str(data)

# Accediendo al resumen de una variable
summary(data$cylinders)
summary((data$mpg))

str(data$cylinders)


# install.packages(c("modeest", "raster", "moments"))
library(modeest) # moda
library(raster) # quantiles, cv (coeficiente de variacion)
library(moments) # # coeficiente de asimetria y curtosis

x <- data$mpg

##### Medidas básicas de la estadística descriptiva #####

### Medidas de centralización
#### media aritmética, mediana, moda, percentiles
## media aritmética
mean(x) # sum(x)/length(x)
## mediana
median(x)
## moda, utilizando la libreria modeest
mfv(x)
## percentil, utilizando la libreria raster
quantile(x)

### Medidas de disperción 
#### varianza, desviación típica, coeficiente de variación
### varianza y desviacion típica, siempre son positivas
## varianza
var(x)
## desviación tipica (estandar)
sd(x)
## coeficiente de variación, utilizando la libreria raster
cv(x) # sd(x)/mean(x)

### Medidas de asimetría
#### Asimetría de Fisher, curtosis
### Fisher, si el valor resultante es 0, nuestra función es simetrica. CUanto mas positivo es el valor mas desplazada estará a la izquierda
### Curtosis, de ser 0, la distribución se asemeja a la distribución normal (en forma), conocida como Mesocúrtica
### Una función con coeficiente de curtosis positivo será Leptocúrtica
### Una curtosis negativa indica una distribuión Platicúrtica
### Usando la libreria moments
## Asimetria
skewness(x)
## curtosis
kurtosis(x)

par(mfrow = c(1,1))
hist(x)
