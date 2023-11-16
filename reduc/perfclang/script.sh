#!/bin/bash

#rpareil que pour dotprod
echo "Création d'un fichier clang.dat"
touch clang.dat

touch flagO1.dat flagO2.dat flagO3.dat flagOfast.dat
awk -F ';' '{print $12}' perfclangO1.csv > flagO1.dat
awk -F ';' '{print $12}' perfclangO2.csv > flagO2.dat
awk -F ';' '{print $12}' perfclangO3.csv > flagO3.dat
awk -F ';' '{print $12}' perfclangOfast.csv > flagOfast.dat

paste flagO1.dat flagO2.dat flagO3.dat flagOfast.dat > clang.dat

rm -rf flag*.dat