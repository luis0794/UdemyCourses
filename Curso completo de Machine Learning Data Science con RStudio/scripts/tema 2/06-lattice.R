auto <- read.csv("data/tema2/auto-mpg.csv", stringsAsFactors =  F)

auto$cylinders <- factor(auto$cylinders,
                         levels = c(3,4,5,6,8),
                         labels = c("3C", "4C", "5C", "6C", "8C"))

# install.packages("lattice")
library(lattice)

#Nota: Los gráficos generados por lattice se los denomina Trellis

# Para dibujar un plot
bwplot(~auto$mpg | auto$cylinders,
       main = "MPG por cilindraje",
       xlab = "Millas por galón")

# Para sibujar un scatterplot
xyplot(mpg~weight | cylinders, data = auto,
       main = "Peso vs Consumo vs Cilindraje",
       xlab = "Peso (kg)", ylab = "Consumo (mpg)")

### Tambien se puede hacer uso de las siguientes funciones para graficar: densityplot, splom