# split / unsplit
data <- read.csv("data/tema2/auto-mpg.csv", stringsAsFactors =  F)

cars.list <- split(data, data$cylinders)

cars.list[1]
cars.list[[1]]

str(cars.list)
str(cars.list[[1]])

names(cars.list[[1]])
