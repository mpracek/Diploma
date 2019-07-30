a<-rnorm(1000,0,1) #component 1
b<-rnorm(1000,5,2) #component 2
d<-c(a,b) #overall data 
df<-data.frame(d,id=rep(c(1,2),each=1000)) #add group id
require(ggplot2)
ggplot(df) +
  stat_density(aes(x = d,  linetype = as.factor(id)),
               position = "stack", 
               geom = "line", 
               show.legend = F, 
               color = "red") +
  stat_density(aes(x = d,  linetype = as.factor(id)), position = "identity", geom = "line")
prva <- rnorm(100)
druga <- rnorm(100, m = 6, sd = 3)
tretja <- rnorm(100, m =2, sd = 3)
vrednost <- 0.5 * prva + 0.5 * druga
razporejeno <- sort(vrednost)
podatki <- data.frame(c(prva,druga,tretja), each=100)
plot(podatki)
hist(vrednost)
x <- seq(-5,15,by= 0.01)
y <- dnorm(x, mean = 0, sd = 1)
z <- dnorm(x, mean = 3, sd = 5)
plot(x,y, type = "l", col = "red")
plot(razporejeno)
hist(razporejeno)
lines(x,z, type = "l", col = "green")


#urejeno
aproksimiramo <- rexp(100)
plot(aproksimiramo)
hist(aproksimiramo)
