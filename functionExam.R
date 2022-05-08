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
  plot(x=ST,y=res,type="l")
  return(res)
}

# Funzione ex 1.2
payoffButt<-function(ST,K,K1,K2,Call=TRUE) {
  if(Call){
    res<-pmax(ST-K,0) - pmax(ST-K1,0) + pmax(ST-K2,0)
  } else{
    res<-pmax(K-ST,0)
  }
  plot(x=ST,y=res,type="l")
  return(res)
}


