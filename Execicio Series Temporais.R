#series temporais
#  install.packages('fpp2')
library(fpp2)

##########################
#Método ARIMA  AutoRegressive Integrated Moving Average

class(WWWusage) # A time series of the numbers of users connected to the Internet through a server every minute.
par(mfrow=c(2,2))  
plot(WWWusage)
plot(diff(WWWusage))

#?auto.arima
fit <- auto.arima(WWWusage) # ajusta e atualiza o fit
fit
plot(forecast(fit,h=20)) # forecast 20 passos pra frente


forecast(fit,h=20)

##########################
#Método Modele de Espaço com Suavização Exponencial
install.packages('jurimetrics')
library(jurimetrics)
fits(livestock)
