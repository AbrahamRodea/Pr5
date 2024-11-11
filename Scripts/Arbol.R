#script arbol
if (!require("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

BiocManager::install("ggtree")

library(ape)
install.packages("phangorn")
library(phangorn)
install.packages("phytools")
library(phytools)
library(msa)
library(Biostrings)
library(ggtree)
library(tidyverse)


secuencia<-readAAStringSet("Datos/Insulinas.fasta")

secuencia


alineamiento<-msa(secuencia, method = "ClustalW" )

alineamiento

pdf("Resultados/Alineamientow")

alineamiento<-msa(secuencia, method = "ClustalW" )

pdf("Resultados/alineamientoM")

alineamiento2<-msa(secuencia, method = "Muscle" )

arbol<-ape::as.AAbin(alineamiento)

arbol<-ape::dist.aa(arbol)

arbol

arbol2<-phangorn::upgma(arbol)

plot(arbol2)

arbol2$edge.length

arbol3<- ggtree(arbol2) +
  
  geom_tiplab() +
  
  geom_highlight(node = 3, color = "yellow")

arbol3

pdf("Resultados//primer_arbol1")
arbol4<- ggtree(arbol2, branch.length = "none") +
  geom_tiplab() +
  geom_highlight(node=3, color = "blue")
arbol4




  
  
  

