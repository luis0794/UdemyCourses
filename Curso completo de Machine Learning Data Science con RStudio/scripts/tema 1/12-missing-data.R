housing.data <- read.csv("data/tema1/housing-with-missing-value.csv",
                          header = T, stringsAsFactors = F)

# Quartil, sumarry() muestra 1st Qu. vendria ser el punto 25%
# la media vendria a ser el 2do Qu. que representaría al 50%
# Y el 3er Qu. el 75%
summary(housing.data)


###### FORMAS PARA ELIMINAR INFORMACION ######


### FORMA 1 para eliminar
# Elimina todas las observaciones que contengan un NA
housing.data.1 <- na.omit(housing.data)
summary(housing.data.1) 


### FORMA 2 para eliminar
# Eliminar los NA de todas las columnas excepto la o las especificadas (Filtrado selectivo)
drop_na <- c("rad")
# Elimina todas las observaciones que contengan NA sin tomar en cuenta la columna rad
housing.data.2 <- housing.data[complete.cases(housing.data[,!(names(housing.data))%in% drop_na]),]
summary(housing.data.2)


### FORMA 3 para eliminar
# Eliminar toda una columna 
housing.data$rad <- NULL
summary(housing.data)
# Para eliminar mas de una variable
drops <- c("rad", "ptratio")
housing.data.3 <- housing.data[,!names(housing.data)%in% drops]
summary(housing.data.3)

###### FORMAS PARA ELIMINAR INFORMACION ######


###### COMPLETAR INFORMACION ######
# install.packages("Hmisc")
library(Hmisc)

# Reemplazar los NA por valores conocidos
housing.data.copy1 <- housing.data
# Reemplazar los valores de ptratio y rad por el promedio (mediana) de la misma respectivamente
housing.data.copy1$ptratio <- impute(housing.data.copy1$ptratio, mean)
housing.data.copy1$rad <- impute(housing.data.copy1$rad, mean)
summary(housing.data.copy1)

housing.data.copy2 <- housing.data
# Reemplazar los valores de ptratio y rad por la media de la misma respectivamente
housing.data.copy2$ptratio <- impute(housing.data.copy1$ptratio, median)
housing.data.copy2$rad <- impute(housing.data.copy1$rad, median)
summary(housing.data.copy2)

# Tip: si al reemplazar valores NA (con la media) por debajo de la media, esta crecrá y si los agregamos por encima la media bajará 

# Para reemplazar por una constante
housing.data.copy3 <- housing.data
housing.data.copy3$ptratio <- impute(housing.data.copy3$ptratio, 18)
housing.data.copy3$rad <- impute(housing.data.copy3$rad, 7)
summary(housing.data.copy3)

# install.packages("mice")
library(mice)
# Para conocer el patron de la información de un data frame por columnas
md.pattern(housing.data)

# install.packages("VIM")
# Para crear gráficos (plots)
library(VIM)
# Diagrama bi color, para datos conocidos y no conocidos
# El parametro col (vector 2 dimensiones), nos deja definir los colores deseados, el primer color representa a los valores conocidos y el segundo a los valores no conocidos
# El parametro numbers (boolean), nos muestra los porcentajes (las probabilidades) de datos 
# El parametro sortVars (boolean), nos ordena las variables faltantes de  mayor a menor
# El parametro labels (vector, n dimensiones), en el prodremos especificar nombres de las etiquetas a mostrar en los graficos
# El parametro cex.axis (decimal), nos permitirá cambiar el tamaño de la fuente en los ejes
# El parametro gap (integer), nos permitirá aumentar o reducir el tamaño entre los gráficos
# El parametro ylab (vector 2 dimensiones), nos permite cambiar el texto del eje y de cada gráfico
aggr(housing.data, col = c('green', 'red'), numbers = T, sortVars = T,
     labels = names(housing.data), cex.axis = 0.7, gap = 1,
     ylab =c("Histograma de NAs", "Patrón") )
