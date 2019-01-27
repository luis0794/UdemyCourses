family.salary <- c(40000, 60000, 50000, 80000, 60000, 70000, 60000)
family.size <- c(4, 3, 2, 2, 3, 4, 3)
family.car <- c("Lujo", "Compacto", "Utilitario", "Lujo", "Compacto", "Compacto", "Compacto")

family <- data.frame(family.salary, family.size, family.car)

# Se eliminan los duplicados
family.unique <- unique(family)

# Devuelve un vector booleano, indicando cuales con duplicados con TRUE
duplicated(family)

# Para obtener los registros duplicados
family[duplicated(family),]
