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

library(tidyverse)


#----

# Choix des plots ---------
# On veut des endroits non atteint par l'homme 
# Plot 1,6 et 11 contrôle --> pas de perturbation ? 
# Plot 13, 14, 15 et 16 biodiversity plots 
# Donc on les prend tous (plots 16 plus grands que les autres)

#----

# Création d'un tableau de donné data frame pour test -----

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

#----
  
# On va maintenent chercher à observer celon l'années # -----
# celon les espèces et/ou genre / famille #

# Réduction des données à l'année la plus récente (2022)

D1 |> 
  bind_rows(D2) |> 
  bind_rows(D3) |> 
  bind_rows(D4) |> 
  bind_rows(D5) |> 
  bind_rows(D6) |> 
  bind_rows(D7) |> 
  print() ->
  paracou

paracou |> 
  filter(CensusYear == 2022) |> 
  print() ->
  paracou_2022

# éliminations des colonnes qui nous intéresse pas

paracou_2022 %>% 
  # Sélection des données botaniques et de parcelle
  select(idTree, Family:Species, Plot,Xfield,Yfield,CircCorr) |> 
  # Création de la variable espèce
  mutate(espece = paste(Genus, Species)) |>
  print() -> 
  paracou_2022_sp

paracou_2022_sp %>% 
  #Comptage des arbres
  group_by(espece) |> 
  summarise(abondance = n()) |> 
  # Tri par abondance décroissante
  arrange(desc(abondance)) |> 
  # Affichage des 5 premières
  head(n = 10)

# On peut voir que sur nos 23663 individus observés il y en a 1702 indet 
# Ce qui représente presque/quasiment 14% de nos données 

#graphique (histogramme) abondance par N abondance 
# on constate qu'une majorité d'espèces avec peut individus
# es ce qualitatif de faire leur ISAR ? pas assez individus 

sort (table (paste (D1$CensusYear == 2022,y)))

#-----
 
# Mise en place des données pour permêtre de def la diversité du site -----

#Comment on prend en compte les espèces non identifié ?
# les prendre en comptes ? 

paracou_2022_sp %>% 
  group_by(espece) |> 
  summarise(abondance = n()) |>
  print() ->
  nb_sp


# 520 lignes soit 519 espèces identifié 
# On a  23663 individus pour 519 espèces et 62,5 hectare soit 625k m2  



# -----

# construction du modèle qui va permettre de deffinir les coordonés dans le cercle-----

#Cordoné du point de base = (X,Y)#


#Déterminer si dans le cercle: ((X-X1)^2+(Y-Y1)^2)> r^2 alors pas dans le cercle #
# si < ou = à r^2 alors dans le cercle #
# variation de r combien comment ? #
# ISAR nombre attendu d'espèces dans les zones circulaires autour d'un individu arbitraire#
((X-X1)^2+(Y-Y1)^2)< r^2 -> une liste, puis compter les n espèces de la liste  
calcul pour l-espèce puis compiler pour toutes les espèces faire un graphique
# avec X valeur de 1 à 50 qui corespond au rayon du cercle 

#SAR du site et sar des individues 
#Graphique ISAR en faction de la surface 
valeur ISAR, valeur surface= Pi*r^2



# ----


# effet de bordure ----
# on peut calculer la surface restante et ainsi prendre comme valeur la diversité 
# corespondente à 

# ----






































































