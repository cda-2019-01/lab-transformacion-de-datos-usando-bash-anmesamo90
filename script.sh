# Escriba su código aquí
## Elimina la cuarta línea del data1 (No tiene información)
sed "4 d" data1.csv > data11.csv

## Elimina la primera línea del data2 (Está en blanco)
sed "1 d" data2.csv > data22.csv

## Imprime el número de la fila en la primera columna
awk '{ print FNR "," $0 }' data11.csv > salida1.csv
awk '{ print FNR "," $0 }' data22.csv > salida2.csv
awk '{ print FNR "," $0 }' data3.csv > salida3.csv

## Cambia los nombres de los archivos

mv salida1.csv data1.csv
mv salida2.csv data2.csv
mv salida3.csv data3.csv

## Agrega en una nueva columna el nombre del archivo (data*.csv)
for f in *data*.csv;
do 
    sed -i "/^$f,/! s/^/$f,/" "$f"
done

## Elimina los archivos innecesarios
rm data11.csv
rm data22.csv

## Une los archivos definidos en uno solo

{ for f in *data*.csv; do tail -n+1 "$f"; done; } > completo.csv

##Agregamos la coma (,) después de la primera columna
awk '{ print gensub(/([a-zA-Z])/,",""\\1",9)}' completo.csv > completo1.csv


sed 's/\t//g' completo1.csv >completo2.csv
sed 's/ //g' completo2.csv>completo3.csv

##while IFS=, readline; do for i in $(echo $line | sed "s