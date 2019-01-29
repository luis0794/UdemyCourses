# Partir datos en varios conjuntos
# install.packages("caret")
library(caret)

data <- read.csv("data/tema2/BostonHousing.csv")


###### PARTICIONANDO CON VARIABLES NÚMERICAS ######

# El parametro p, indica el porcentaje a obtener del data frame original, en este caso el 80% (0.8)
training.ids <- createDataPartition(data$MEDV, p = 0.8, list = F)
# Para obtener el 80% de la data para entrenamiento
data.training <- data[training.ids,]
# Para obtener el 20% de la data para validacion
data.validation <- data[-training.ids,]


training.ids.2 <- createDataPartition(data$MEDV, p = 0.7, list = F)
data.training.2 <- data[training.ids.2,]
temp <- data[-training.ids.2,]
validation.ids.2 <- createDataPartition(data$MEDV, p = 0.5, list = F)
data.validation.2 <- temp[validation.ids.2]
View(data.validation.2)
data.testing <- temp[-validation.ids.2]

###### PARTICIONANDO CON VARIABLES NÚMERICAS ######



###### PARTICIONANDO CON VARIABLES CATEGORICAS ######
data2 <- read.csv("data/tema2/boston-housing-classification.csv")

training.ids.3 <- createDataPartition(data2$MEDV_CAT, p = 0.7, list = F)
data.training.3 <- data2[training.ids.3,]
data.validation.3 <- data2[-training.ids.3,]

# Funcion para particionaar un data frame en 2 partes (training, validation)
read.cb.partition.2 <- function(dataframe, target.index, prob){
  library(caret)
  training.ids <- createDataPartition(dataframe[, target.index], p = prob, list = F)
  
  list(train = dataframe[training.ids,], val = dataframe[-training.ids,])
}

# Funcion para particionaar un data frame en 3 partes (training, validation, testing)
read.cb.partition.3 <- function(dataframe, target.index, prob.train, prob.validation){
  library(caret)
  # Identificadores para la primera partición (training)
  training.ids <- createDataPartition(dataframe[, target.index], p = prob.train, list = F)
  
  train.data <- dataframe[training.ids,]
  temp <- dataframe[-training.ids,]
  
  # Identificadores para la segunda partición (validation)
  validation.ids <- createDataPartition(temp[, target.index], p = prob.validation, list = F)
  
  list(train = train.data, val = temp[validation.ids,], test = temp[-validation.ids,])
}

data.1 <- read.cb.partition.2(data, 14, 0.8)
data.2 <- read.cb.partition.3(data2, 14, 0.7, 0.5)

head(data.1$train)
head(data.2$test)

# muestra aleatoria
# El parametro replace = FALSE, le indica a sample() que los valores de la muestra no se deben repetir
# Si replace = FALSE, la muestra no podrá ser mayor a los valores del data frame
nrow(data)
sample.1 <- sample(data$CRIM, 40, replace = F)
View(sample.1)

###### PARTICIONANDO CON VARIABLES CATEGORICAS ######
