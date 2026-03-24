#!/bin/bash

cd ~/EPNro1/entrada

for archivo in *.txt;
do
    cat "$archivo" >> ~/EPNro1/salida/"$FILENAME".txt

    mv "$archivo" ~/EPNro1/procesado
done

