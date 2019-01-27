data <- read.csv("data/tema1/missing-data.csv", na.strings = "")

# Para crear una columna nueva, basta con ingresar al data frame con $ y posteriormente poner el nombre que deseemos en este caso $Income.mean
data$Income.mean <- ifelse(is.na(data$Income), 
                           mean(data$Income, na.rm = TRUE),
                           data$Income)

# x, es un vector de datos que puede contener NA
random.impute <- function(x){ 
  # missing, vector del mismo tamaño que x pero con valores booleanos
  missing <- is.na(x) 
  # n.missing contiene cuantos valores son NA
  # sum(), al sumar un vector de booleanos este nos devolverá cuantos son TRUE
  n.missing <- sum(missing)
  #x.obs contendrá los valores diferentes de NA en x
  x.obs <- x[!missing]
  # Por defecto, se devolverá la misma información que ingresó a la función
  imputed <- x
  # Los valores NA se reemplazarán por una muestra aleatoria, de los datos conocidos x.obs
  # n.missing, le indicará a sample(), cuantos debe de reemplazar
  imputed[missing] <- sample(x.obs, n.missing, replace = T)
  
  return (imputed)
}

random.impute.data.frame <- function(dataframe, cols){
  names <- names(dataframe)
  
  for(col in cols){
    name <- paste(names[col], "imputed", sep = ".")
    dataframe[name] <- random.impute(dataframe[,col])
  }
  
  dataframe
}

data <- read.csv("data/tema1/missing-data.csv", na.strings = "")
data$Income[data$Income == 0] <- NA
data <- random.impute.data.frame(data, c(1,2))
