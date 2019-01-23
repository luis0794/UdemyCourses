# install.packages("jsonlite")

library(jsonlite)

# Para cargar un json
dat.1 <- fromJSON("data/tema1/students.json")
dat.2 <- fromJSON("data/tema1/student-courses.json")

# install.packages("curl")
library(curl)

url <- "http://www.floatrates.com/daily/usd.json"

currenciesUSD <- fromJSON(url)


# Para acceder a los datos de un json, ambas sentencias funcionan igual
currenciesUSD[['eur']]
currenciesUSD$eur

# Se transforma una lista en data frame
# unlist = Genera un vector atómico a partir de una lista plana, como los vectores creados por la función c()
# matrix = Crea una matriz a partir del conjunto de valores dado.
# matrix$nrow = El número deseado de filas.
# matrix$ncol = El número deseado de columnas.
# matrix$byrow = Lógico. Si FALSE(el valor predeterminado) la matriz se rellena con columnas, de lo contrario, la matriz se rellena con filas.
currencie.data <- data.frame(matrix(unlist(currenciesUSD), nrow=148, byrow=T), stringsAsFactors=FALSE, row.names = NULL)

# Asignando manualmente nombres a columnas
colnames(currencie.data) <- c("code", "alphaCode", "numericCode", "name", "rate", "date", "inverseRate")

# Asignando nombres a columna de forma dinamica, ya que por simple inspección todos los elementos constan con la misma cantidad de elementos y mismos datos
colNames <- names(currenciesUSD$eur)
colnames(currencie.data) <- colNames

# Accediendo a nuestros datos
head(dat.1, 4)
dat.1$Email

currencie.data[1:5,1:2]

## Accediendo a datos especificos
# Filas
dat.1[c(2,5,8),]
# Columnas
dat.1[,c(2,5)]

head(dat.2, 2)


### EXTRA, como tarea

# Para transformar un data frame a JSON
currencie.data.JSON <- toJSON(currencie.data)

head(currencie.data.JSON, 5)

####  Para escribir archivos en disco
# install.packages("readr")

# Al importar la libreria readr ocasionó el siguiente error:
## Attaching package: ‘readr’
## The following object is masked from ‘package:curl’: parse_date
# Esto sucede por que tanto como la libreria curl y readr contienen una funcion llamada parse_date, al llamar a dicha funcion, esta será llamada el ultimo paquete en importar
library(readr)

write_lines(currencie.data.JSON,"data/tema1/output/currencieUSD.json")

####### Realizar una breve evaluación teórica y práctica #######
