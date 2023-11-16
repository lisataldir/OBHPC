#!/bin/bash

#regroupe les resultats obtenus pour clang en fonction des flags d'optimisation (O1, O2, O3 et Ofast)
echo "Création d'un fichier clang.dat"
touch clang.dat


#Création de fichiers intermédiaires qui contiennent la vitesse par flags
touch flagO1.dat flagO2.dat flagO3.dat flagOfast.dat
awk -F ';' '{print $12}' perfclangO1.csv > flagO1.dat
awk -F ';' '{print $12}' perfclangO2.csv > flagO2.dat
awk -F ';' '{print $12}' perfclangO3.csv > flagO3.dat
awk -F ';' '{print $12}' perfclangOfast.csv > flagOfast.dat

#Concaténation de ces fichiers par colonne
paste flagO1.dat flagO2.dat flagO3.dat flagOfast.dat > clang.dat

#Supression des fichiers intermédiaires
rm -rf flag*.dat