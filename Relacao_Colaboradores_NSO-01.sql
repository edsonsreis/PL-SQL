select * from R040FEM fem, r034fun fun

where 

fem.NUMEMP = fun.NUMEMP and
fem.TIPCOL = fun.TIPCOL and
fem.NUMCAD = fun.NUMCAD and
fun.CODCCU = '3614000' and

;

select * from R040FEG where numcad = 1963;

select * from r040per;

select 

fun.NUMEMP,
fun.NUMCAD,
fun.NOMFUN,
PER.INIPER,
PER.FIMPER,
PER.QTDDIR AS DIREITO,
PER.QTDSLD AS SALDO

from r040per per, r034fun fun
where 

per.NUMEMP = fun.NUMEMP and
per.TIPCOL = fun.TIPCOL and
per.NUMCAD = fun.NUMCAD and
fun.CODCCU = '3614000' and
per.QTDDEB = 0 and
fun.sitafa <> 7

order by 2

;


where numcad = 1963;





/*Para deteletar os exames no histórico de algum colaborador
select * from r108res where codexa = 3915;

delete from r108res where codexa = 3915;
commit;
*/
