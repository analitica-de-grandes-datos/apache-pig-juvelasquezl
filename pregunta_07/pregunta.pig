/*
Pregunta
===========================================================================

Para el archivo `data.tsv` genere una tabla que contenga la primera columna,
la cantidad de elementos en la columna 2 y la cantidad de elementos en la 
columna 3 separados por coma. La tabla debe estar ordenada por las 
columnas 1, 2 y 3.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

u = LOAD 'data.tsv' USING PigStorage('\t')
    AS (letra:CHARARRAY,
        maleta:BAG{texto:TUPLE(ele:CHARARRAY)},
        diccionario:MAP[]);
 
y = FOREACH u GENERATE letra, SIZE(maleta), SIZE(diccionario);
f = ORDER y BY $0..$2;
store f into 'output' USING PigStorage(',');
