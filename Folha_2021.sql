

-- FOLHA DO ANO DE 2021
SELECT 
*
FROM USU_V003FOL 
WHERE 
NUMEMP = 1 AND 
TIPCOL = 1 AND 
NUMCAD = 1963 AND 
PER_REFERENCIA LIKE '%21';



-- FOLHA DO ANO DE 2021 - CONSULTA POR EVENTOS E PROVENTOS 
SELECT sum(Valor_Evento) FROM USU_V003FOL WHERE NUMEMP = 1 AND TIPCOL = 1 AND NUMCAD = 1963 AND PER_REFERENCIA LIKE '%21'  AND CODEVE = 2004 ;
SELECT sum(Valor_Evento) FROM USU_V003FOL WHERE NUMEMP = 1 AND TIPCOL = 1 AND NUMCAD = 1963 AND PER_REFERENCIA LIKE '%21' AND CODEVE = 2000 ;
SELECT sum(Valor_Evento) FROM USU_V003FOL WHERE NUMEMP = 1 AND TIPCOL = 1 AND NUMCAD = 1963 AND PER_REFERENCIA LIKE '%21' AND CODEVE = 2500 ;
SELECT * FROM USU_V003FOL WHERE NUMEMP = 1 AND TIPCOL = 1 AND NUMCAD = 1963 AND PER_REFERENCIA LIKE '%21' ;
