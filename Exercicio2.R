hosp <- read.table('http://www.filipezabala.com/data/hospital.txt', head = T)
dim(hosp)       # Dimensão: 100 linhas por 2 colunas
head(hosp)

attach(hosp, warn=F)                      # Para deixar as colunas de 'hosp' disponíveis

(tab <- table(filhos))                    # Frequência (simples/absoluta)

prop.table(tab)                           # Frequência relativa

cumsum(tab)                               # Frequência acumulada

round(cumsum(tab)/length(filhos),2)       # Frequência acumulada relativa

cumsum(rev(tab))                          # Frequência acumulada inversa

round(cumsum(rev(tab))/length(filhos),2)  # Frequência acumulada inversa relativa

x <- c(93,113,112,104,84, 104,107,105,96,92)
summary(x)
var(x) 
