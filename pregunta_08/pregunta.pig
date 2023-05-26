/*
Pregunta
===========================================================================

Para el archivo `data.tsv` compute la cantidad de registros por letra de la 
columna 2 y clave de al columna 3; esto es, por ejemplo, la cantidad de 
registros en tienen la letra `b` en la columna 2 y la clave `jjj` en la 
columna 3 es:

  ((b,jjj), 216)

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

u = LOAD 'data.tsv' USING PigStorage('\t') 
    AS (letra:CHARARRAY, 
        maleta:BAG{texto:TUPLE(ele:CHARARRAY)}, 
        diccionario:MAP[]); 
 
y = FOREACH u GENERATE FLATTEN(maleta), FLATTEN(diccionario); 
x = FOREACH y GENERATE $0 , $1; 
z = GROUP x BY ($0,$1); 
f = FOREACH z GENERATE $0 , COUNT($1); 
store f into 'output' USING PigStorage(',');
