/*
Pregunta
===========================================================================

Para el archivo `data.tsv` Calcule la cantidad de registros por clave de la 
columna 3. En otras palabras, cuántos registros hay que tengan la clave 
`aaa`?

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

u = LOAD 'data.tsv' USING PigStorage('\t') 
    AS (letra:CHARARRAY, 
        maleta:BAG{texto:TUPLE(ele:CHARARRAY)}, 
        diccionario:MAP[]); 
 
y = FOREACH u GENERATE FLATTEN(diccionario); 
t = FOREACH y GENERATE $0; 
x = GROUP t BY $0; 
f = FOREACH x GENERATE $0, COUNT($1); 
store f into 'output' USING PigStorage(',');
