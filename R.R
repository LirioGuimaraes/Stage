# observation des données ---------

library(readr)
X2023_09_29_ParacouP1LastCensus <- read_csv("2023-09-29_ParacouP1LastCensus.csv")
library(readr)
X2023_09_29_ParacouP6LastCensus <- read_csv("2023-09-29_ParacouP6LastCensus.csv")
library(readr)
X2023_09_29_ParacouP11LastCensus <- read_csv("2023-09-29_ParacouP11LastCensus.csv")
library(readr)
X2023_09_29_ParacouP13AllYears <- read_csv("2023-09-29_ParacouP13AllYears.csv")
library(readr)
X2023_09_29_ParacouP14AllYears <- read_csv("2023-09-29_ParacouP14AllYears.csv")
library(readr)
X2023_09_29_ParacouP15AllYears <- read_csv("2023-09-29_ParacouP15AllYears.csv")
library(readr)
X2023_09_29_ParacouP16AllYears <- read_csv("2023-09-29_ParacouP16AllYears.csv")

D1 <- X2023_09_29_ParacouP1LastCensus
D2 <- X2023_09_29_ParacouP6LastCensus
D3 <- X2023_09_29_ParacouP11LastCensus
D4 <- X2023_09_29_ParacouP13AllYears
D5 <- X2023_09_29_ParacouP14AllYears
D6 <- X2023_09_29_ParacouP15AllYears
D7 <- X2023_09_29_ParacouP16AllYears
summary(D1)

#----

# Choix des plots ---------
# On veut des endroits non atteint par l'homme 
# Plot 1,6 et 11 contrôle --> pas de perturbation ? 
# Plot 13, 14, 15 et 16 biodiversity plots 

#----

# Création d'un tableau de donné data fragme pour test -----

DT <- data.frame(D1$Xfield,D1$Yfield,D1$Family ,D1$Genus,D1$Species,D1$Circ) 
 DX <- matrix(data = DT, nrow = 20)  
DD <- data.frame(DT,10)

x <-head(DT$D1.Xfield,50)

y <-head(DT$D1.Yfield,50) 

FF <- data.frame(x,y)

FF

table(DT,10)


unique(DT$D1.Species)
unique(DT$D1.Genus)
unique(DT$D1.Family)

help()
?
  
#----
  
# On va maintenent chercher à observer celon l'années # -----
# celon les espèces et/ou genre / famille #

A <- D1( )

%%
  
  

species <- X2023_09_29_ParacouP14AllYears 

sort (table (paste (D1$CensusYear == 2022,y)))

#-----
 
# Mise en place des données pour permêtre de def la diversité du site -----

# -----

# construction du modèle qui va permettre de deffinir les coordonés dans le cercle-----

#Cordoné du point de base = (X,Y)#


#Déterminer si dans le cercle: ((X-X1)^2+(Y-Y1)^2)> r^2 alors pas dans le cercle #
# si < ou = à r^2 alors dans le cercle #
# variation de r combien comment ? #
# ISAR nombre attendu d'espèces dans les zones circulaires autour d'un individu arbitraire#
((X-X1)^2+(Y-Y1)^2)< r^2 -> une liste, puis compter les n espèces de la liste  
calcul pour l-espèce puis compiler pour toutes les espèces faire un graphique 

# ----


# effet de bordure ----
# on peut calculer la surface restante et ainsi prendre comme valeur la diversité 
# corespondente à 

# ----
