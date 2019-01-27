# El formato fwf (fixed with format)(ficheros con formato de anchura fija). Es decir, si un elemento de una determinada columna no utiliza todo el espacio asignado, 
# se completa su celda con espacios en blanco. Así todos los datos serán del mismo tamaño

# Sin cabecera incluida en el fwf
students_data <- read.fwf("data/tema1/student-fwf.txt",
                          widths = c(4, 15, 20, 15, 4),
                          col.names = c("id", "nombre", "email", "carrera", "año"))

# Con cabecera incluida en el fwf
# skip = Para saltar lineas del fwf desde el inicio
students_data_header <- read.fwf("data/tema1/student-fwf-header.txt",
                                 widths = c(4, 15, 20, 15, 4),
                                 header = T, sep = "\t", skip = 2)

# Para este caso, eliminariamos la columna email, solo con poner la longitud en negativo
students_data_no_email <- read.fwf("data/tema1/student-fwf.txt",
                          widths = c(4, 15, -20, 15, 4),
                          col.names = c("id", "nombre", "carrera", "año"))
