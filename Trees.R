#Remove objetos da memória do R
rm(list=ls(all=TRUE))

#Instala bibliotecas
install.packages('datasets')
install.packages('caret')

#Carrega as bibliotecas
library(datasets)
library(caret)
library(stringr)

#Armazena o conjunto de dados trees em um data frame
dataframe <- trees

#Renomeia as variaveis
names(dataframe) <- c('circumference','height','volume')

#Visualiza resumo descritivo dos dados
summary(dataframe)

#Visualiza relacao entre volume e circunferencia
plot(y = dataframe$volume,
     x = dataframe$circumference,
     pch = 16,
     col = 'red',
     ylab = 'Volume',
     xlab = 'Circunferência',
     main = 'Relacao entre volume e circunferência da árvore',
     cex.lab =1.5);

#adiciona linhas de grade
grid() 

#TRaça uma reta de regressão simples
abline(lm(dados$volume ~ dados$circunferencia))#Plota reta de regressao

#Correlação das features volume e circunferência
cor(dataframe$volume,dataframe$circumference)

#Visualizar equação da regressão linear (Distance=Intercept+coefficient*speed)
reglim <- lm(dataframe$volume ~ dataframe$circumference)
print (reglim)

#Monta equacao
B0 <- (round(reglim$coefficients[1],2))
B1 <- (round(reglim$coefficients[2],2))
equation <- str_c(B0, ' + (x * ',B1,')')
print(equation)
