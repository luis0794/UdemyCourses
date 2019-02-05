auto <- read.csv("data/tema2/auto-mpg.csv")

# Para convertir cylinders en categorica (factor)
auto$cylinders <- factor(auto$cylinders, 
                         levels = c(3,4,5,6,8),
                         labels = c("3cil", "4cil", "5cil", "6cil", "8cil"))

# Para cargar el data set a la base de R, y se podrá acceder a sus columnas sin hacer referencia al origen
attach(auto)
head(cylinders)

# Histograma de Frecuencias, dada una variable 
# El parametro col, sirve para asignar un color al histograma
# El parametro xlab, define un título para el eje de las x
# El parametro ylab, define un título para el eje de las y
# El parametro main, define un título para el histograma
# El parametro breaks, establece los cortes del histograma
hist(acceleration,
     col = "grey",
     xlab = "Aceleración",
     ylab = "Frecuencia",
     main = "Histograma de las aceleraciones",
     breaks = 16)

# Boxplots
boxplot(mpg, 
        xlab = "Millas por galón")

# ~ -> significa, en función de 
boxplot(mpg ~ model_year, xlab = "Millas por galón (por año)")
boxplot(mpg ~ cylinders, xlab = "Consumo por número de cilindros")

# Scatterplot, Para 2 variables numericas
# La primera variable será la dependiente será el eje Y
# La segunda será la variable independiente, por ende será el eje X
plot(mpg ~ horsepower)

# Matriz de Scatterplots
pairs(~mpg + displacement + horsepower + weight)

##### PERSONALIZANDO NUESTROS GRÁFICOS #####

# rainbow(), para obtener una paleta de colores
# Se puede hacer esto si conocemos el número de breaks
hist(acceleration,
     col = rainbow(12),
     xlab = "Aceleración",
     ylab = "Frecuencia",
     main = "Histograma de las aceleraciones",
     breaks = 12)


boxplot(auto)

hist(mpg, breaks = 16, prob = T)
# Se debe ejecutar luego del histograma, ya que se dibujrá por encima y se vizualiza la forma de la distribución 
lines(density(mpg))

# El parametro type determina que tipo de plot debe dibujarse, n -> significa none, en este caso no dibujará nada
plot(mpg ~ horsepower, type = "n")
linearmodel <- lm(mpg ~ horsepower)
# abline, dibuja una recta (de regresión lineal) que se dibuja por encima de un gráfico
abline(linearmodel)

# Agregar colores para cada cilindrada (actualmente cylinders es categórica)
# En este ejemplo, tenemos
## Los autos con 8 cilindros pintados de rojo
with(subset(auto, cylinders == "8cil"),
     points(horsepower, mpg, col = "red"))
## Los autos con 6 cilindros pintados de amarillo
with(subset(auto, cylinders == "6cil"),
     points(horsepower, mpg, col = "yellow"))
## Los autos con 5 cilindros pintados de verde
with(subset(auto, cylinders == "5cil"),
     points(horsepower, mpg, col = "green"))
## Los autos con 4 cilindros pintados de azul
with(subset(auto, cylinders == "4cil"),
     points(horsepower, mpg, col = "blue"))
## Los autos con 3 cilindros pintados de color negro, por defecto
with(subset(auto, cylinders == "3cil"),
     points(horsepower, mpg))


##### Combinación de plots con par #####
# par, abreviación de parametros, parametros de configuración de los graficos
old.par <- par()
old.par

# Para cambiar una propiedad de los gráficos
par(mfrow = c(1,2))

with(auto, {
  plot(mpg ~ weight, main = "Peso vs Consumo")
  plot(mpg ~ acceleration, main = "Aceleración vs Consumo")
})

### Nota: para restaurar los parametros iniciales
par(old.par)
