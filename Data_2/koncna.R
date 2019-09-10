##########115 120
#potrebne knjižnjice in dokumenti
library(markovchain)
library(HMM)
library(readr)
library(plyr)
ed <- read_csv("C:/Users/Lenovo_Uporabnik/Desktop/Diploma/Data_2/ed.csv")
ibm <- read_csv("C:/Users/Lenovo_Uporabnik/Desktop/Diploma/Data_2/ibm.csv")
jnj <- read_csv("C:/Users/Lenovo_Uporabnik/Desktop/Diploma/Data_2/jnj.csv")
ko <- read_csv("C:/Users/Lenovo_Uporabnik/Desktop/Diploma/Data_2/ko.csv")
pg <- read_csv("C:/Users/Lenovo_Uporabnik/Desktop/Diploma/Data_2/pg.csv")


#Določimo stanja iz vektorja opazovanj
stanja = c("normalno", "visoko","ekstremno")
simboli = c("1","2","3")

#Vektorji

ed <- ed[1:12072,]
jnj <- jnj[1:12072,]
ko <- ko[1:12072,]
pg <- pg[1:12072,]
edclose <- ed$Close
ibmclose <- ibm$Close
jnjclose <- jnj$Close
koclose <- ko$Close
pgclose <- pg$Close

vrednost <- edclose + ibmclose + jnjclose + koclose + pgclose
razlika <- vrednost[2:12072] - vrednost[1:12071]
razlika <- razlika / vrednost[2:12072]

devet <- quantile(abs(razlika), 0.9) # 0.0107 #0.0149
sedem <- quantile(abs(razlika), 0.7) # 0.00399 #0.0081
rezultat <- vector(length = length(razlika))

for(i in 1:length(rezultat)){
  if(abs(razlika[i]) <= 0.0081){
    rezultat[i] <- 1
  }
  else if(0.0081 < abs(razlika[i]) &&  abs(razlika[i]) <= 0.0149){
    rezultat[i] <- 2
  }
  else{
    rezultat[i] <- 3
  }
}

#prehodna matrika je matrika
sekvenca = createSequenceMatrix(rezultat, toRowProbs = TRUE)
matrika = as(sekvenca, "markovchain")
plot(matrika, edge.arrow.size = 0.5)
prehodna <- matrika
plot(rezultat, xlab = "Čas", ylab = "Stanje")

##Narisano
ts.plot(rezultat[1:100], xlab = "Čas", ylab = "Stanje")
ts.plot(rezultat[7000:7100], xlab = "Čas", ylab = "Stanje")
ts.plot(rezultat[5300:5400], xlab = "Čas", ylab = "Stanje")
ts.plot(rezultat[9800:9900], xlab = "Čas", ylab = "Stanje")
ts.plot(vrednost[9800:9900], xlab = "Čas", ylab = "Cena portfelja")
plot(rezultat, xlab = "Čas", ylab = "Stanje")
