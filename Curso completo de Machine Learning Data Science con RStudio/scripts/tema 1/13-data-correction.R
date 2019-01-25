# install.packages("tidyr")
library(tidyr)

crime.data <- read.csv("data/tema1/USArrests.csv", stringsAsFactors = F)
View(crime.data)

# cbind(), sirve para añadir una o mas columnas a data frame original
# El parametro rownames(), obtiene el nombre de las filas de un data frame
crime.data <- cbind(state = rownames(crime.data), crime.data)
