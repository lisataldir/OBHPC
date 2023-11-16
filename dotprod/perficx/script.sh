#!/bin/bash

#regroupe les resultats obtenus pour gcc en fonction des flags d'optimisation (O1, O2, O3 et Ofast)
echo "Création d'un fichier icx.dat"
touch icx.dat


#Création de fichiers intermédiaires qui contiennent la vitesse par flags
touch flagO1.dat flagO2.dat flagO3.dat flagOfast.dat
awk -F ';' '{print $12}' perficxO1.csv > flagO1.dat
awk -F ';' '{print $12}' perficxO2.csv > flagO2.dat
awk -F ';' '{print $12}' perficxO3.csv > flagO3.dat
awk -F ';' '{print $12}' perficxOfast.csv > flagOfast.dat

#Concaténation de ces fichiers par colonne
paste flagO1.dat flagO2.dat flagO3.dat flagOfast.dat > icx.dat

#Supression des fichiers intermédiaires
rm -rf flag*.dat