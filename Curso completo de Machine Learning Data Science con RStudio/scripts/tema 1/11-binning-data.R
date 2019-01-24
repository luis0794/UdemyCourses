students <- read.csv("data/tema1/data-conversion.csv")

#Inf, representa a infinito
# 10000 ingresos bajos
# 31000 ingresos altos
bp <- c(-Inf, 10000, 31000, Inf)
# Las etiquetas siempre serán 1 menos a las break points
names <- c("Low", "Average", "High")

students$Income.cat <- cut(students$Income, breaks = bp, labels = names)

# Para no poner etiquetas
students$Income.cat2 <- cut(students$Income, breaks = bp)

# Le indico a cut() que se harán 4 cortes y le envio las etiquetas, R gestionará automaticamente
students$Income.cat3 <- cut(students$Income, breaks = 4, 
                            labels = c("Level 1", "Level 2", "Level 3", "Level 4"))


# Trabajando con Dummy variables
students <- read.csv("data/tema1/data-conversion.csv")

# install.packages("dummies")
library(dummies)

# dummy.data.frame(), crea variables dummy para las variables categoricas (Strings)
# Si se utiliza el parametro all = FALSE, nos devolverá solo las variables dummy
students.dummy <- dummy.data.frame(students, sep = ".")
names(students.dummy)

# Internamente dummy.data.frame() hace uso de dummy(), usar dummy() nos serviría si solo queremos que una columna sea afectada
dummy(students$State)

# tambien podemos usar el parametro names, para atacar a un subconjunto, en el especificamos los nombres de las columnas
dummy.data.frame(students, names = c())