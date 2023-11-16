#!/bin/bash

echo "Création d'un fichier icx.dat"
touch icx.dat

touch flagO1.dat flagO2.dat flagO3.dat flagOfast.dat
awk -F ';' '{print $12}' perficxO1.csv > flagO1.dat
awk -F ';' '{print $12}' perficxO2.csv > flagO2.dat
awk -F ';' '{print $12}' perficxO3.csv > flagO3.dat
awk -F ';' '{print $12}' perficxOfast.csv > flagOfast.dat

paste flagO1.dat flagO2.dat flagO3.dat flagOfast.dat > icx.dat

rm -rf flag*.dat