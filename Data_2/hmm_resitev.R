#########################115 120
library(markovchain)
library(HMM)
library(readr)
ed <- read_csv("C:/Users/Lenovo_Uporabnik/Desktop/Diploma/Data_2/ed.csv")
ibm <- read_csv("C:/Users/Lenovo_Uporabnik/Desktop/Diploma/Data_2/ibm.csv")
jnj <- read_csv("C:/Users/Lenovo_Uporabnik/Desktop/Diploma/Data_2/jnj.csv")
ko <- read_csv("C:/Users/Lenovo_Uporabnik/Desktop/Diploma/Data_2/ko.csv")
pg <- read_csv("C:/Users/Lenovo_Uporabnik/Desktop/Diploma/Data_2/pg.csv")

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
ts.plot(razlika, xlab = "Čas", ylab = "Odmik")
#Stanja volatilnosti določimo glede na stopnjo volatilnosti. 

kratek <- razlika[1:100]
devet <- quantile(razlika, 0.9)
sedem <- quantile(razlika, 0.7)
rezultat <- vector(length = length(razlika))

for(i in 1:length(rezultat)){
  if(abs(razlika[i]) <= 0.2581){
    rezultat[i] <- 1
  }
  else if(0.2581 < abs(razlika[i]) &&  abs(razlika[i]) <= 1.339){
    rezultat[i] <- 2
  }
  else{
    rezultat[i] <- 3
  }
}

a <- table(rezultat)
zacetna <- a/length(rezultat)


sekvenca = createSequenceMatrix(rezultat, toRowProbs = TRUE)
matrika = as(sekvenca, "markovchain")
plot(matrika, edge.arrow.size = 0.5)

##Narisano
ts.plot(rezultat[1:100], xlab = "Čas", ylab = "Stanje")
ts.plot(rezultat[7000:7100], xlab = "Čas", ylab = "Stanje")
ts.plot(rezultat[5300:5400], xlab = "Čas", ylab = "Stanje")
ts.plot(rezultat[9600:9700], xlab = "Čas", ylab = "Stanje")
plot(rezultat, xlab = "Čas", ylab = "Stanje")



novo <- razlike[4000:5000]
deveta <- quantile(novo, 0.9)
sedema <- quantile(novo, 0.7)
rezultata <- vector(length = length(novo))

for(i in 1:length(rezultata)){
  if(abs(novo[i]) <= 3.8){
    rezultata[i] <- 1
  }
  else if(3.8 < abs(novo[i]) &&  abs(novo[i]) <= 9.14){
    rezultata[i] <- 2
  }
  else{
    rezultata[i] <- 3
  }
}
plot(rezultata, xlab = "Čas", ylab = "Stanje")
