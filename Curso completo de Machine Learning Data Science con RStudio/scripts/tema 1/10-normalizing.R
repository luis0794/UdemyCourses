# Pagina del data set, donde se explican las variables https://www.cs.toronto.edu/~delve/data/boston/bostonDetail.html
housing <- read.csv("data/tema1/BostonHousing.csv")

### FORMA 1 para normalizar

# Para normalizar datos númericos no más
# La distibucion normal(o distribucion gaussiana), se centra en definir una distribucion de probabilidades donde el promedio está situado en 0 y 
# center = TRUE, habilitar la resta de la media
# scale = TRUE, habilita la división por la desviación típica
# Por defecto los valores son TRUE
housing.z <- scale(housing, center = T, scale = T)
housing.mean <- scale(housing, center = T, scale = F)

# Desviación estandar o desviación tipica
# sd = sqrt(sum(x^2)/n-1)
housing.sd <- scale(housing, center = F, scale = T)

# Al dejar en False, quedaría igual al data frame  original
housing.none <- scale(housing, center = F, scale = F)


### FORMA 2 para normalizar
# Cuando se hace uso de la normalización es común usar z como prefijo
scale.many <- function(dataframe, cols){
  names <- names(dataframe)
  
  for(col in cols){
    name <- paste(names[col], "z", sep = ".")
    dataframe[name] <- scale(dataframe[, col])
  }
  
  cat(paste("Hemos normalizado "), length(cols)," variable(s)")
  
  dataframe
}

housing <- scale.many(housing, c(1, 3, 5:8))
