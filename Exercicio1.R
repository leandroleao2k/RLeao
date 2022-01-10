coronavirus::update_dataset(silence = FALSE)  # corona virus os dados do coronaviruslibrary(coronavirus)  # load namespace
data(coranavirus)     # load data sets
dim(coronavirus)      # retrieve set dimension
head(coronavirus)     # return first rows of sets
colnames(coronavirus)
summary(coronavirus)

c <- data.frame(coronavirus) # calcular somatorio de casos
is.data.frame(c)
sum(c$cases)
mean(c$cases,na.rm=FALSE )

sum(c$cases^2)  # soma dos quadrados

library(plyr)
library(tidyr)
suppressPackageStartupMessages( library(dplyr))
st <- c %>% 
      group_by(Type = c$type) %>%
      summarize(total = sum(cases),
               ccount = n(),
               media = total / ccount,
               Mean = mean(cases),
               Median = median(cases)) # soma por campo type
print(st)
barplot(st$total,)

#outra forma de fazer
by_type <- group_by(c, country, type)
summarise(by_type, total = sum(cases), m =  mean(cases, na.rm=TRUE))


