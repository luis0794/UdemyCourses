# install.packages("scales")
library(scales)

students <- read.csv("data/tema1/data-conversion.csv")

# Para reescalar una variable, darán valores entre 0 y 1
# rescale(), le da al menor valor 0 y al mayor 1, los demás valores son escalados con valores proprcionales de forma lineal
students$Income.rescaled <- rescale(students$Income)

# Esta es la operación que realiza rescale()
(students$Income - min(students$Income))/(max(students$Income) - min(students$Income))

# Si queremos tener un rango distinto como porcentaje, eje: entre 0 y 100
rescale(students$Income, to = c(0, 100))

rescale.many <- function(dataframe, cols){
  names <- names(dataframe)
  
  for(col in cols){
    name <- paste(names[col], "rescaled", sep = ".")  
    dataframe[name] <- rescale(dataframe[,col])
  }
  
  # cat(), para imprimir por consola 
  cat(paste("Hemos reescalado", length(cols), "variables()"))
  
  dataframe
  
}

students <- rescale.many(students, c(1,4))
