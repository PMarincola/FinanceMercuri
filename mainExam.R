#Esame Economics and Finance - Mercuri
#Master DSE 2022
#Marincola - Chiuch - Panelli ......

#EX.1
#Scrivete una funzione in R che calcola il payoff di una Call con posizione lunga.
#Verificate il comportamento della funzione con un esempio numerico.

#OK
source("functionExam.R")
S<-seq(1,3,length.out= 101)
K <- 1.5
debug("payoff")
aa<-payoff(ST=S,K=K)

#Usando la funzione nel punto 1 disegnate il payoff di una strategia butterfly.

#DA RIVEDERE
source("functionExam.R")
S<-seq(1,3,length.out= 101)
#K<-1.5
K <- 1.5
K1 <- 2
K2 <- 3
debug("payoffButt")
aa<-payoffButt(ST=S,K=K,K1=K1,K2=K2) 

#EX.2
#Scrivete una funzione in R che valuta un'opzione europea di tipo put in un albero binomiale uniperiodale.

