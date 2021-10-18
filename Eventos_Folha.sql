--Relatório dos Eventos da Folha

select 
funcionario.numemp as Empresa,
funcionario.DATADM as Admissão,
funcionario.NUMCAD as Matrícula,
funcionario.NOMFUN as Nome,
sit.DesSit as Situacão,
escala.Hormes/60 as Hora_mes,
escala.Horsem/60 as Hora_Semanal,
cargo.codcar as Codigo_Cargo,
cargo.TITRED as Cargo,
loc.NomLoc as Local,


 Case 
         when funcionario.Numcad = funcionario.Numcad then  to_char((((select Folha.Valeve from r046ver folha 
         where codcal = 542 and codeve = 200 and folha.numcad = funcionario.numcad) )),'FM999G999G999D90')

         end as Salário,  

 Case 
         when funcionario.Numcad = funcionario.Numcad then  to_char((((select Folha.Valeve from r046ver folha 
         where codcal = 542 and codeve = 275 and folha.numcad = funcionario.numcad) + nvl((select Folha.Valeve from r046ver folha
         where codcal = 542 and codeve = 1965 and folha.numcad = funcionario.numcad),0) )),'FM999G999G999D90')

         end as Gratificação,
         
         
 Case 
         when funcionario.Numcad = funcionario.Numcad then  to_char((((select Folha.Valeve from r046ver folha 
         where codcal = 542 and codeve = 300 and folha.numcad = funcionario.numcad) )),'FM999G999G999D90')

         end as Quinquenio,         
         
 Case 
         when funcionario.Numcad = funcionario.Numcad then  to_char((((select Folha.Valeve from r046ver folha 
         where codcal = 542 and codeve = 1951 and folha.numcad = funcionario.numcad) )),'FM999G999G999D90')

         end as Insalubridade,
         
 Case 
         when funcionario.Numcad = funcionario.Numcad then  to_char((((select Folha.Valeve from r046ver folha 
         where codcal = 542 and codeve = 1952 and folha.numcad = funcionario.numcad) )),'FM999G999G999D90')

         end as Periculosidade
         
         

from r034fun funcionario, r024car cargo, r016orn loc, r010sit sit, r006esc escala
where
funcionario.NUMEMP = 1 and
funcionario.tipcol = 1 and
funcionario.SitAfa = sit.CodSit and
funcionario.ESTCAR = cargo.ESTCAR and
funcionario.CODCAR = cargo.CODCAR and
funcionario.TABORG = loc.TABORG and
funcionario.NUMLOC = loc.NUMLOC and
funcionario.CODESC = escala.CODESC and
funcionario.sitafa <> 7
order by 4
;








