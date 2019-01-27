# outliers - valores fuera de línea (fuera de lo normal)
ozone.data <- read.csv("data/tema1/ozone.csv", stringsAsFactors =  F)

# Produzca diagramas de caja y bigotes (whisker) de los valores dados (agrupados).
# El parametro main, nos permite darle un titulo plot
# El parametro boxwex, nos permite modificar la anchura de la caja
## rango interacuartilico (RI), la distancia entre Q1 (Quartil 1) y Q3 (Quartil 3)
## Los bigotes quedan siempre dentro del maximo y el minimo de los valores observados, pero a una distancia maxima de 1.5 del rango intercantilico de los bordes superiores e inferiores respectivamente
## Max = min(MaxValor,Q3 + 1.5 RI)
## Min = max(MinValor, Q1 - 15 RI)
## Los outliers, en el diagrama de caja son todas las representaciones que estén por encima o debajo de los bigotes del mismo
outlier_values <- boxplot(ozone.data$pressure_height, 
                          main = "Pressure Height",
                          boxwex = 0.5)

summary(ozone.data$pressure_height)

# Para representar más de una variable en un diagrama de caja
boxplot(pressure_height ~ Month, 
        data = ozone.data,
        main = "Pressure Height per Month")

# $out, nos permite acceder a los ouliers por concola
boxplot(ozone_reading ~ Month, 
        data = ozone.data,
        main = "Ozone Reading per Month")$out

# Para poner texto por encima del diagrama
mtext("Hola")


# Intercambio de outliers por media y mediana
impute_outliers <- function(column, removeNA = T){
  quantiles <- quantile(column, c(0.05, 0.95), na.rm = removeNA)
  column[column < quantiles[1]] <- mean(column, na.rm =removeNA)
  column[column > quantiles[2]] <- median(column, na.rm =removeNA)
  column
}

imputed_data <- impute_outliers(ozone.data$pressure_height)

# Para reservar espacio para plots, este caso 1 fila 2 columnas, es decir para 2 gráficos
par(mfrow = c(1,2))

boxplot(ozone.data$pressure_height, main = "Presión con outliers")
boxplot(imputed_data, main = "Presión sin outliers")


replace_outliers <- function(column, removeNA = T){
  qrts <- quantile(column, probs = c(0.25, 0.75), na.rm = removeNA)
  caps <- quantile(column, probs = c(.05, .95), na.rm = removeNA)
  iqr <- qrts[2] - qrts[1]
  h <- 1.5 * iqr
  column[column < qrts[1]-h] <- caps[1]
  column[column > qrts[2]+h] <- caps[2]
  
  column
}

capped_pressure_height <- replace_outliers(ozone.data$pressure_height)

par(mfrow = c(1,2))
boxplot(ozone.data$pressure_height, main = "Presión con outliers")
boxplot(capped_pressure_height, main = "Presión sin outliers")
