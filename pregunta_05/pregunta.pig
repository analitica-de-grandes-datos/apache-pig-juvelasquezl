/*
Pregunta
===========================================================================

Para el archivo `data.tsv` compute Calcule la cantidad de registros en que 
aparece cada letra minúscula en la columna 2.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

u = LOAD 'data.tsv' USING PigStorage('\t')
    AS (letra:CHARARRAY,
        maleta:BAG{texto:TUPLE(ele:CHARARRAY)},
        diccionario:MAP[]);
 
y = FOREACH u GENERATE FLATTEN(maleta) AS Letrica;
x = GROUP y BY Letrica;
f = FOREACH x GENERATE $0, COUNT($1);
 
store f INTO 'output' USING PigStorage(',');
