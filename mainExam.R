#Esame Economics and Finance - Mercuri
#Master DSE 2022
#Marincola - Chiuch - Panelli ......

########### EX.1 ################################################################
#Scrivete una funzione in R che calcola il payoff di una Call con posizione lunga.
#Verificate il comportamento della funzione con un esempio numerico.

# Call for Long position
source("functionExam.R")
# Underlying
S<-seq(1,3,length.out= 101)
K <- 1.5
# Function
aa<-payoff(ST=S,K=K)

#Usando la funzione nel punto 1 disegnate il payoff di una strategia butterfly.

#BUTTERFLY STRATEGY
source("functionExam.R")
# Underlying
S<-seq(1,3,length.out= 101)
# J Long positions in a Call option with a Strike Price K1
J <-1
K1 <- 1.5
# H Long positions in a Call option with a Strike Price K2
H <-1
K2 <- 2.5
# J + H Short positions in a Call option with a Strike Price K (Linear Convex combination)
J_plus_H <- J + H
## omega
w_omega <- J/(J+H)
## Strike price K Linear Convex
K_lin_conv <- w_omega*K1 + (1-w_omega)*K2

aa<-payoffButt(ST=S,K1=K1,K2=K2,J=J,J_plus_H=J_plus_H,H=H,K_lin_conv=K_lin_conv) 


########### EX.2 ##################################################################
#2.1 Scrivete una funzione in R che valuta un'opzione europea di tipo put in un albero binomiale uniperiodale.

# European Put Option
# The Holder has the right to sell at maturity T the Underlying Asset S at the Strike Price K.
# We have two dates: t0 ”‘Today”’ and T ”‘Maturity”’
source("functionExam.R")
# Underlying
S = 50
#Strike 
K = 70
#today
t0 = 0
#Maturity
T = 1 
i = 0.1
u = 1.5
d = 0.5

result <- EU_put(S, K, t0, T, i, u, d)
# Price of the financial derivate at t0
sprintf("Price: %f",result$price_t0)
# Replicating portfolio
sprintf("y: %f",result$y)
sprintf("q: %f",result$q)


# 2.2 Scrivete una funzione in R che internamente richiama la funzione del punto 1 
# e calcola il prezzo al tempo t0 di una call europea con la put-call parity 
#(ricordatevi di utilizzare il regime composto anche nella put-call parity per 
#  coerenza con il punto 1).
source("functionExam.R")
# Prezzo al tempo t_0
callPrice_t0 <- priceParity(S, K, t0, T, i, u, d)

# Verificate il comportamento delle due funzioni con un esempio numerico. 
# Verificate che la call del punto 2 soddisfi i vincoli di Merton (regime composto).


