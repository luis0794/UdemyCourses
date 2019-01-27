# install.packages("mice")
library(mice)

housing.data <- read.csv("data/tema1/housing-with-missing-value.csv", 
                         header = T,
                         stringsAsFactors = F)

columns <- c("ptratio", "rad")

# mice(), para gestionar la infoamción que falta, utilizando técnicas de variable multivariante
# El parametro m, indica el número de multiples imputaciones a realiar, por defecto 5
# El parámetro maxit, indica el número máximo de iteraciones, por defecto 5
# El parametro method, esla forma en la que se obtiene los datos
## Algorimos que se pueden aplicar a method
## pmm - comparación predictiva de medias
## logreg - regresión logistica
## polyreg - regresión logística politómica
## polr - modelo de probabilidades proporcionales. 
imputed_data <- mice(housing.data[, names(housing.data) %in% columns],
                     m = 5, 
                     maxit = 50, 
                     method = "pmm",
                     seed = 2018)

summary(imputed_data)

# Cuando existen métodos de distintos paquetes podemos utilizar :: para hacer referencia a un paquete especifico
complete.data <- mice::complete(imputed_data)

housing.data$ptratio <- complete.data$ptratio
housing.data$rad <- complete.data$rad

# Para determinar si existen NA en un data frame
anyNA(housing.data)

# install.packages("Hmisc")
library(Hmisc)

impute_arg <- aregImpute(~ptratio + rad, data = housing.data, n.impute = 5)

impute_arg

impute_arg$imputed$rad
