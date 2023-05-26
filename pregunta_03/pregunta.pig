/*
Pregunta
===========================================================================

Obtenga los cinco (5) valores más pequeños de la 3ra columna.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/


u = LOAD 'data.tsv' USING PigStorage('\t')
     AS  (letra:CHARARRAY,
          fecha:CHARARRAY,
          numero:INT);
 
y = ORDER u BY $2;
z = LIMIT y 5;
t = FOREACH z GENERATE $2;
DUMP t;
store t into 'output';