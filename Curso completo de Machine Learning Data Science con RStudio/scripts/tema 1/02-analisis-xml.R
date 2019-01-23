# Scrapping, proceso en el cual se obtiene información de una pagina web

# Para instalar paquetes
# install.packages("XML")

# Para cargar un paquete
library(XML)

url <- "data/tema1/cd_catalog.xml"

# Crea un apuntador, una posición en memoria que localiza documento
xmldoc <- xmlParse(url) # Si se la aplica a una url nos devolverá un XMLInternalDocument, que es una estructura interna programada en C, R no lo puede procesar directamente y para eso se utiliza xmlRoot, para obtener todo lo que contenga el nodo raíz

# Recuperar el nodo raiz del xml
rootnode <- xmlRoot(xmldoc)

# Para acceder al elemento #N del nodo raíz  [n]
rootnode[1]

# Para fabricar una matriz a partir de un xml (Esto generará una tabla)
# x simboliza cada uno de los elementos de la raiz
# xmlValue obtiene solo los valores
# En la mayoria de los casos esto sería un paso intermedio, ya que el formato que nos da la función podría ser no deseado
# XMLSApply recorre cada uno de los hijos y le aplica una función
cds_data <- xmlSApply(rootnode, function(x) xmlSApply(x, xmlValue))

# Para comvertir una matriz a un data frame de verdad, se hará una transposición
# Transposición, una operación que aplicada sobre matrices nos cambia fila por columnas
# Para ello utilizamos la funcion t()
# Tambien podemos indicar si cada fila tiene nombre con el parametro row.names, en este caso asignamos NULL y R enumerará cada fila iniciando en 1
cds.catalog <- data.frame(t(cds_data), row.names = NULL)

head(cds.catalog, 2)

# Tambien se pueden visualiar datos haciendo uso de los corchetes, donde como primer parametro asignamos que filas queremos ver en rangos eje. [1:5,], y el segundo parametro son las columnas, si lo dejamos vacio mostrará todas
cds.catalog[1:5,]

## Extra - R proporciona varias funciones para detectar elementos especificos en XML
## Extra - xpathSApply(), getNodeSet(); Para trabajar con base de datos de XML



population_url <- "data/tema1/WorldPopulation-wiki.htm"

# Para extraer tablas de un HTML
tables <- readHTMLTable(population_url)

# Para obtener la lista #6, ya que tenemos una lista de tablas usamos doble corchetes
most_populated <- tables[[6]]

head(most_populated, 3)

# Si deseamos obtener una tabla especifica (si la conocemos), usamos el parametro which, así no obtenemos innecesariamente información basura
custom_table <- readHTMLTable(population_url, which = 6)

## Si se desea trabajar con un HTML publicado en un sitio web bastará solo con poner la url del sitio web al igual que en la funcion read.csv()

####### Realizar una breve evaluación teórica y práctica #######