# install.packages("tidyr")
library(tidyr)

crime.data <- read.csv("data/tema1/USArrests.csv", stringsAsFactors = F)
View(crime.data)

# cbind(), sirve para aÃ±adir una o mas columnas a data frame original
# El parametro rownames(), obtiene el nombre de las filas de un data frame
crime.data <- cbind(state = rownames(crime.data), crime.data)

# A esta estrutura se la conoce como Diccionario o array asosiativo 
# gather(), junta varias variables en una, añadiendo como observaciones los diferentes casos
crime.data.1 <- gather(crime.data, 
                       key = "crime_type", 
                       value = "arrest_estimate",
                       Murder : UrbanPop)

# Al añadir -state, le indicamos a gather(), que comprima todas las variables excepto state
crime.data.2 <- gather(crime.data, 
                       key = "crime_type",
                       value = "arrest_estimate",
                       -state)

# Para especificar a gather(), que ciertas columnas debe unir. Los nombres proporionados deben ser los mismo del data frame,sin usar comillas
crime.data.3 <- gather(crime.data,
                       key = "crime_type",
                       value = "arrest_estimate",
                       Murder, Assault)


# En caso de tener data frames resumidos como dato de entrada y se quiera usar estructura de tablas podemos usar spred(), para separar los datos
crime.data.4 <- spread(crime.data.2,
                       key = "crime_type",
                       value = "arrest_estimate")

# unite(), sirve para tomar varias columnas y unificarlas de algun modo en una
crime.data.5 <- unite(crime.data,
                      col = "Murder_Assault",
                      Murder, Assault, 
                      sep = "_")

# separate(), Para separar datos por un separador concreto
crime.data.6 <- separate(crime.data.5,
                         col = "Murder_Assault",
                         into = c("Murder", "Assault"),
                         sep = "_")
