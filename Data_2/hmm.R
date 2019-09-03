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

devet <- quantile(razlika, 0.9) # 0.0107
sedem <- quantile(razlika, 0.7) # 0.00399
rezultat <- vector(length = length(razlika))

for(i in 1:length(rezultat)){
  if(abs(razlika[i]) <= 0.00399){
    rezultat[i] <- 1
  }
  else if(0.00399 < abs(razlika[i]) &&  abs(razlika[i]) <= 0.0107){
    rezultat[i] <- 2
  }
  else{
    rezultat[i] <- 3
  }
}

#prehodna matrika je matrika
a <- table(rezultat)
zacetna <- a/length(rezultat)
sekvenca = createSequenceMatrix(rezultat, toRowProbs = TRUE)
matrika = as(sekvenca, "markovchain")
plot(matrika, edge.arrow.size = 0.5)
prehodna <- matrika
plot(rezultat, xlab = "Čas", ylab = "Stanje")

##Narisano
ts.plot(rezultat[1:100], xlab = "Čas", ylab = "Stanje")
ts.plot(rezultat[7000:7100], xlab = "Čas", ylab = "Stanje")
ts.plot(rezultat[5300:5400], xlab = "Čas", ylab = "Stanje")
ts.plot(rezultat[9600:9700], xlab = "Čas", ylab = "Stanje")
plot(rezultat, xlab = "Čas", ylab = "Stanje")


# #potrebujemo se izhodno matriko; locimo gor in dol
# izhod <- vector(length = length(razlika))
# 
# 
# for(i in 1:length(izhod)){
#   if(abs(razlika[i]) <= 0.00399 && razlika[i] <= 0 ){
#     izhod[i] <- -1
#   }
#   else if(abs(razlika[i]) <= 0.00399 && razlika[i] > 0 ){
#     izhod[i] <- 1
#   }
#   else if(0.00399 < abs(razlika[i]) &&  abs(razlika[i]) <= 0.0107 && razlika[i] <= 0){
#     izhod[i] <- -2
#   }
#   else if(0.00399 < abs(razlika[i]) &&  abs(razlika[i]) <= 0.0107 && razlika[i] > 0){
#     izhod[i] <- 2
#   }
#   else if(abs(razlika[i]) > 0.0107 && razlika[i] > 0){
#     izhod[i] <- 3
#   }
#   else{
#     izhod[i] <- -3
#   }
# }
# #stetje
# stetje <- count(izhod)
# izhodno <- stetje[2]/length(izhod)
# izhodna <- matrix(c(0.08640543, 0.17488195, 0.22491923, 0.21373540, 0.19998343, 0.10007456),
#                 nrow = 3, ncol = 2, byrow = TRUE)
# 
# hmm_2 = initHMM(stanja, simboli, prehodna,izhodna)
