#!/bin/bash

echo "Création d'un fichier gcc.dat"
touch gcc.dat

touch flagO1.dat flagO2.dat flagO3.dat flagOfast.dat
awk -F ';' '{print $12}' perfgccO1.csv > flagO1.dat
awk -F ';' '{print $12}' perfgccO2.csv > flagO2.dat
awk -F ';' '{print $12}' perfgccO3.csv > flagO3.dat
awk -F ';' '{print $12}' perfgccOfast.csv > flagOfast.dat

paste flagO1.dat flagO2.dat flagO3.dat flagOfast.dat > gcc.dat

rm -rf flag*.dat