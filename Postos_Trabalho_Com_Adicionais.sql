
--Com Adicionais
select 
posto.ESTPOS as Estrutura_Posto,
posto.POSTRA as Cod_Posto,
posto.DESRED as Descricao_Posto,
posto.DESRED as Des_Completa_Posto,
postocar.CODFIL as Cod_Filial,
loc.NOMLOC as Nome_Local,
ccusto.CODCCU as Cod_CCusto,
ccusto.NOMCCU as CCusto,
adicional.PERINS,
adicional.PERPER,
adicional.FATTPH,
adicional.FATTPM,
adicional.APOESP


from r017pos posto, r017car postocar, r017adi adicional, r016orn loc, r018ccu ccusto

where 

posto.ESTPOS = adicional.ESTPOS and
posto.POSTRA = adicional.POSTRA and
posto.ESTPOS = postocar.ESTPOS and
posto.POSTRA = postocar.POSTRA and
postocar.TABORG = loc.TABORG and
postocar.NUMLOC = loc.NUMLOC and
postocar.NUMEMP = ccusto.NUMEMP and
postocar.CODCCU = ccusto.CODCCU;



