--Colaboradores do Posto com Adicionais
select 
posto.ESTPOS as Estrutura_Posto,
posto.POSTRA as Cod_Posto,
posto.DESRED as Descricao_Posto,
posto.DESRED as Des_Completa_Posto,
postocar.CODFIL as Cod_Filial,
funcionario.NUMCAD as Matrícula,
funcionario.NOMFUN as Nome,
loc.NOMLOC as Nome_Local,
ccusto.CODCCU as Cod_CCusto,
ccusto.NOMCCU as CCusto

from r017pos posto, r017car postocar, r016orn loc, r018ccu ccusto, r034fun funcionario
where 

posto.ESTPOS = postocar.ESTPOS and
posto.POSTRA = postocar.POSTRA and
posto.ESTPOS = funcionario.ESTPOS and
posto.POSTRA = funcionario.POSTRA and


postocar.TABORG = loc.TABORG and
postocar.NUMLOC = loc.NUMLOC and
postocar.TABORG = funcionario.TABORG and
postocar.NUMLOC = funcionario.NUMLOC and
loc.TABORG = funcionario.TABORG and
loc.NUMLOC = funcionario.NUMLOC and

postocar.NUMEMP = ccusto.NUMEMP and
postocar.CODCCU = ccusto.CODCCU and
postocar.NUMEMP = funcionario.NUMEMP and
postocar.CODCCU = funcionario.CODCCU and
ccusto.NUMEMP = funcionario.NUMEMP and
ccusto.CODCCU = funcionario.CODCCU and
funcionario.POSTRA not in (select POSTRA from r017adi) 
order by 2,9
;