# Al hacer uso de na.strings = "", todos los strings vacios pasan a NA
data <- read.csv("data/tema1/missing-data.csv", na.strings = "")

# na.omit(), omite todos los registros que contengan almenos un NA
data.cleaned <- na.omit(data)

# La funcion na.omit(), internamente hace uso de la función is.na(), para determinar que filas eliminar
is.na(data[4,2])
is.na(data[4,1])
is.na(data$Income)

# Para limpieza selectiva, teniendo en cuenta solo una variable
# Devuelve todas las columnas y limpia NA solamente de la variable Income
data.income.cleaned <- data[!is.na(data$Income),] 

#Filas completas para un data frame
# complete.cases = Dado un data frame o tabla, devuelve un vector de Booleans, donde TRUE es para casos completos y False para otros casos
complete.cases(data)

# Una segunda forma de limpieza, que actua de igual manera que na.omit()
data.cleaned.2 <- data[complete.cases(data),]

# Convertir los 0 de Incoming en NA
data$Income[data$Income == 0] <- NA


### Medidas de centralización y dispersión 
# mean() = para sacar la media o promedio (centralización)
mean(data$Income) # El resultado dará NA, ya que existen valores en Income que son NA y R no permite operar
# na.rm = T, omitirá los registros NA
mean(data$Income, na.rm = T)

# sd(), Desviación estandar (Disperción)
sd(data$Income) # El resultado dará NA, ya que existen valores en Income que son NA y R no permite operar
# na.rm = T, omitirá los registros NA
sd(data$Income, na.rm = T)

