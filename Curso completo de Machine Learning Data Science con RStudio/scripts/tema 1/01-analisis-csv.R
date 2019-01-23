# setwd("D:/Luis/git/Udemy/Curso completo de Machine Learning Data Science con RStudio")

# Para cargar un .csv
# header = TRUE ò header = T
# NA: Not Available, es la representación de un dato no presente o nulo
# Ejemplo -> strings.na = "N/A", cuando nos lleguen campos con "", R los reemplazá por el valor por defecto NA
# Los strings son varialbes categoricas, R suele tratarlos como caracteres o como factores
# Por defecto la función read.csv() establece stringsAsFactors = TRUE, transformando los caracteres a factor, al establecer FAlSE estos valores quedan como cadena de strings
# Por otro lado, si queremos trabajar un factor como caracter usamos el parametro as.character()
auto <- read.csv("data/tema1/auto-mpg.csv", 
                 header = TRUE, sep = ",",
                 strings.na = "", stringsAsFactors = FALSE)

# El parametro dec indica la separación de decimales por defecto ","
# El separador por defecto es ";" pero tambien suelen estar separados por tabulación y se usaría "\t"
# read.csv2("filename", sep = ";", dec = ",")

# Para visualizar la cabecera del .csv
names(auto)

# Para cargar .csv sin cabecera
auto_no_header <- read.csv("data/tema1/auto-mpg-noheader.csv", header = FALSE)

# Devuelve las primeras léneas de un data set
# El primer parametro es el data set, el segundo la cantidad de observaciones (filas) a mostrar
head(auto_no_header, 4)

# Si a un csv sin cabecera no se le especifica header = FALSE, R creará nombres de variables combinando el valor de la primera fila anteponiendole una X
auto_no_sense <- read.csv("data/tema1/auto-mpg-noheader.csv")
head(auto_no_sense, 4)

# Si se desea establecer cabeceras personalizadas, utilizamos el parametro col.names
auto_custom_header <- 
  read.csv("data/tema1/auto-mpg-noheader.csv",
           header = F, 
           col.names = c("numero", "millas_por_galon", "cilindraje", 
                         "desplazamiento", "caballos_de_potencia", 
                         "peso", "aceleracion", "año", "modelo"
           )
  )

head(auto_custom_header, 2)

# https://jsonplaceholder.typicode.com/ -> fakes csv
# Si se desea cargar un .csv desde internet en lugar de especificar un data set local, le asignamos una URL
who_from_internet <- read.csv("https://frogames.es/course-contents/r/intro/tema1/WHO.csv")

####### Realizar una breve evaluación teórica y práctica #######
