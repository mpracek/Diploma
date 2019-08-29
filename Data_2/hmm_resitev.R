#########################115 120
library(markovchain)
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

sekvenca = createSequenceMatrix(rezultat, toRowProbs = TRUE)
matrika = as(sekvenca, "markovchain")
plot(matrika, edge.arrow.size = 0.5)
