#Esame Economics and Finance - Mercuri
#Master DSE 2022
#Marincola - Chiuch - Panelli ......

# Funzione ex 1.1
payoff<-function(ST,K,Call=TRUE) {
  if(Call){
    res<-pmax(ST-K,0) 
  } else{
    res<-pmax(K-ST,0)
  }
  plot(x=ST,
       y=res,
       ylab="Payoff",
       xlab="sottostante",
       type="l")
  return(res)
}

# Funzione ex 1.2
payoffButt<-function(ST,K1,K2,J,J_plus_H,H,K_lin_conv,Call=TRUE) {
  if(Call){
    res<- J*pmax(ST-K1,0) - J_plus_H*pmax(ST- K_lin_conv,0) + H*pmax(ST-K2,0)
  } else{
    res<-pmax(K-ST,0)
  }
  plot(x=ST,
       y=res,
       main="Butterfly Strategy",
       ylab="Payoff",
       xlab="sottostante",
       type="l")
  return(res)
}


# Funzione ex. 2.1
EU_put <- function(S, K, t0, T, i, u, d){
  r_free_bond <- (1+i)^(T-t0)
  # At time t0, the price of the the financial derivative is equal to the market value of the replicating portfolio
  qd = (r_free_bond-d)/(u-d)
  qu = 1-qd
  # Risky asset that has the following market price dynamics
  ## payoff u
  pu = pmax((K-S)*u,0)
  ## payoff d
  pd = pmax((K-S)*d,0)
  # pricing formula
  phi_t0 = (1/r_free_bond)*((qu*pu) + (qd*pd))
  # Replicating portfolio
  y = (1/S)*((pu-pd)/u-d)
  return(list("price_t0" = phi_t0, "q" = c(qu, qd), "y" = y))
}

# Funzione ex. 2.2
# put-call parity
priceParity <- function(S,K,t0, T, i,u,d){
  result <- EU_put(S, K, t0, T, i, u, d)
  r_free_bond <- (1+i)^(T-t0)
  return <- max(result$price_t0 + S - K*r_free_bond, 0)
}


