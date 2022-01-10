dat <- read.table('http://www.filipezabala.com/data/drinks.txt',head=T)
head(dat)

x <- dat$temp   #  temperatura
y <- dat$gar    # garrafas vendidas

cor(x,y)  # correlacao entre 2 variaveis aleatorias
cor.test(x,y)

 
lm(y ~ x)  # y "~" sendo explicado por x , exemplo 5.6


# REGRESSAO LINEAR SIMPLES
#ajustando modelos Regrassao Linear Simples onde um x ajusta y 
fit <-lm(y ~ x)  # y "~" sendo explicado por x , exemplo 5.6
summary(fit)

# REGRESSAO LINEAR MULTIPLA
#ajustando modelos Regrassao Linear M 
#carregando de uma planilha 10 variaveis sobre aquecimento em construçoes 
# Exemplo 7.2 No site http://archive.ics.uci.edu/ml/datasets/Energy+efficiency está disponível uma análise de energia feita por (Tsanas and Xifara 2012) usando 12 formas diferentes de construção simuladas no Ecotect. Os edifícios diferem em relação à área envidraçada, à distribuição da área envidraçada e à orientação, entre outros parâmetros. Foram simuladas várias configurações como funções das características acima mencionadas para obter 768 formas de construção. O conjunto de dados detalhado a seguir compreende 768 amostras e 8 características (X1 a X8), com o objetivo de prever duas respostas reais (Y1 e Y2).
#
#X1: Compactação Relativa
#X2: Superfície
#X3: Área da parede
#X4: Área do telhado
#X5: Altura total
#X6: Orientação
#X7: Área de Envidraçamento
#X8: Distribuição da Área de Envidraçamento
#Y1: Carga de aquecimento
#Y2: Carga de resfriamento

library(readxl)
url1 <- 'http://archive.ics.uci.edu/ml/machine-learning-databases/00242/ENB2012_data.xlsx'
download.file(url1, 'temp.xlsx', mode = 'wb')
energy <- read_excel('temp.xlsx')
str(energy)   # dando uma olhada nas variáveis
pairs(energy)

# fit linear model sobre Y1 
fitM <- lm(Y1 ~ X1 + X2 + X3 + X4 + X5 + X6 + X7 + X8, data = energy) # modelo saturado
summary(fitM)

# validacao grafico
par(mfrow=c(2,2))
plot(fitM, which=1:4)

# AIC Criterio de informacao de Akkaike, que vai indicar o melhor criterio de verossimilhança do modelo
fitM1 <- step(fitM)  
summary(fitM1)
plot(fitM1, which=1:4)

#PREDIÇÃO 
#fazer a predicao da variavel Y1 "carga de aquecimento"  ?stats::predict
summary(energy)

# calculo na mao de predicao de Y1 "carga de aquecimento "em FitM1 onde usamos X1,2,3,5,7 e 8
84.013418-64.773432*0.62  -0.087289*514.5 + 0.060813*416.5 +  4.169954*7 + 19.932736*0.4 + 0.203777*5


dataX1 <- data.frame(X1 = 0.62, X2 = 514.5, X3 = 244.5, X5=3.5, X7 = 0.1, X8 = 1.7)
result <- predict(fitM1,dataX1, type ="response")
print(result)