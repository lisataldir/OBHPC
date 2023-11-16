#!/bin/bash

#regroupe les resultats obtenus pour gcc en fonction des flags d'optimisation (O1, O2, O3 et Ofast)
echo "Création d'un fichier gcc.dat"
touch gcc.dat


#Création de fichiers intermédiaires qui contiennent la vitesse par flags
touch flagO1.dat flagO2.dat flagO3.dat flagOfast.dat
awk -F ';' '{print $12}' perfgccO1.csv > flagO1.dat
awk -F ';' '{print $12}' perfgccO2.csv > flagO2.dat
awk -F ';' '{print $12}' perfgccO3.csv > flagO3.dat
awk -F ';' '{print $12}' perfgccOfast.csv > flagOfast.dat

#Concaténation de ces fichiers par colonne
paste flagO1.dat flagO2.dat flagO3.dat flagOfast.dat > gcc.dat

#Supression des fichiers intermédiaires
rm -rf flag*.dat