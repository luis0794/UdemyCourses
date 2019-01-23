# Las variables de ambiente global (Global Environment) pueden ser guardadas en un archivo propio de R, llamado Rdata o rds

clientes <- c("Luis", "Karen", "Fernando")
clientes_vip <- c("Pedro", "Juan");

# Para crear fechas
fechas <- as.Date(c("2019-07-01", "2019-10-02", "2019-03-03"))
pagos <- c(150, 257.99, 198.12)

# Para crear un data frame a partir de datos
pedidos <- data.frame(clientes, fechas, pagos)

# Para guardar objetos R y exportarlos
save(pedidos, clientes_vip, file = "data/tema1/output/pedidos.Rdata")
# saveRDS(), solo podrá guardar un objeto
saveRDS(pedidos, file = "data/tema1/output/pedidos.rds")

# Para remover variables de entorno para que no ocupen espacio en memoria
remove(pedidos)


# Para cargar archivos de R
# !!! Nota: al cargar estos archivos con load(), si continen variables con el mismo nombre de una variable que tengamos en global environment, R la reemplazara sin presentar ninguna advertencia
## Rdata, al cargar este archivo, importará a global environment todos los objetos que intervinieron 
load("data/tema1/output/pedidos.Rdata")
## rds, al momento de crear el archivo R serializa los datos y crea un solo objeto, el cual es importado al cargar el archivo
orders <- read_rds("data/tema1/output/pedidos.rds")

# Para cargar data sets, estos vienen de forma nativa en R
data(iris)
data(cars)

## Inicialmente no se puede visualizar haciendo click en la variable, para ello utilizamos y R habilitará esa función
# View(cars)
# View(iris)

# Para guardar todos los objetos de global environment
save.image(file = "data/tema1/output/alldata.Rdata")

# Para guardar un Rdata, usando una lista que contiene un vector de caracteres que hace refencia a los nombres de los objetos
primes <- c(2,3,5,7,11,13)
pow2 <- c(2,4,8,16,32,64,128)
save(list = c("primes", "pow2"), file = "data/tema1/output/primes_and_pow2.Rdata")

# Al cargar un Rdata con attach(), nos dará un error en caso de que existan objetos de igual nombre en nuestro entorno
attach("data/tema1/output/primes_and_pow2.Rdata")

# Para visualizar los data sets disponibles en R, vas ejecutar data(), sin parametr
data()
