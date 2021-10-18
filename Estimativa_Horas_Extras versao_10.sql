--Relatório Atual da Estimativa das Horas Extras
select 


      Hor.Numcad Cadastro,
      folha.NomFun Nome,
      Folha.NomLoc Nom_Local,
      Hor.Datini Data_Inicial,
      
      
      TO_CHAR(TRUNC((Hor.Horini * 60) / 3600), 'FM9900') || ':' ||
      TO_CHAR(TRUNC(MOD((Hor.Horini * 60), 3600) / 60), 'FM00')  AS Hora_Inicial,
      
      
      Hor.Datfim Data_Final,
      
      TO_CHAR(TRUNC(( Hor.Horfim * 60) / 3600), 'FM9900') || ':' ||
      TO_CHAR(TRUNC(MOD(( Hor.Horfim * 60), 3600) / 60), 'FM00')  AS Hora_Final,
      



 Case 
         when (Hor.Datfim = Hor.Datini) and (Hor.Horfim >= Hor.Horini) then 
         TO_CHAR(TRUNC(( (Hor.Horfim - Hor.Horini) * 60) / 3600), 'FM9900') || ':' ||
         TO_CHAR(TRUNC(MOD(( (Hor.Horfim - Hor.Horini) * 60), 3600) / 60), 'FM00')         
         
         
         when (Hor.Datfim > Hor.Datini) and (Hor.Horfim = 0) then 
         TO_CHAR(TRUNC(( (1439-Hor.Horini) * 60) / 3600), 'FM9900') || ':' ||
         TO_CHAR(TRUNC(MOD(( (1439-Hor.Horini) * 60), 3600) / 60), 'FM00')    
         
         when (Hor.Datfim > Hor.Datini) and (Hor.Horfim > 0) then 
         TO_CHAR(TRUNC(( (((1439-Hor.Horini)+ Hor.Horfim-0)) * 60) / 3600), 'FM9900') || ':' ||
         TO_CHAR(TRUNC(MOD(( (((1439-Hor.Horini)+ Hor.Horfim-0)) * 60), 3600) / 60), 'FM00')          
         
         end as QTD_Horas,
         
         




      case when Hor.Cadsol=Hor.Cadsol then 
      (select funcionario.NomFun from R034FUN funcionario 
          where funcionario.Numemp = Hor.Numemp 
          and funcionario.TipCol = Hor.TipCol 
          and funcionario.NumCad = Hor.Cadsol) 
      end as solicitante,
      Hor.Motsol Mot_Solicitacao,
      Hor.Solapr Situacao_Aprovada,



  Case 
         when funcionario.Numcad = funcionario.Numcad then  to_char((((select Folha.Valor_Evento from vetorh.usu_v001fol folha 
         where folha.per_referencia = to_date('03-2020','mm-yyyy') and codeve = 200 and folha.numcad = funcionario.numcad) + nvl((select Folha.Valor_Evento from vetorh.usu_v001fol folha 
         where folha.per_referencia = to_date('03-2020','mm-yyyy') and codeve = 300 and folha.numcad = funcionario.numcad),0) + nvl((select Folha.Valor_Evento from vetorh.usu_v001fol folha 
         where folha.per_referencia = to_date('03-2020','mm-yyyy') and codeve = 1951 and folha.numcad = funcionario.numcad),0) + nvl((select Folha.Valor_Evento from vetorh.usu_v001fol folha 
         where folha.per_referencia = to_date('03-2020','mm-yyyy') and codeve = 1952 and folha.numcad = funcionario.numcad),0) )),'FM999G999G999D90')

         end as Salario,

      
      

  Case 
         when funcionario.Numcad = funcionario.Numcad then  to_char((((select Folha.Valor_Evento from vetorh.usu_v001fol folha 
         where folha.per_referencia = to_date('03-2020','mm-yyyy') and codeve = 200 and folha.numcad = funcionario.numcad) + nvl((select Folha.Valor_Evento from vetorh.usu_v001fol folha 
         where folha.per_referencia = to_date('03-2020','mm-yyyy') and codeve = 300 and folha.numcad = funcionario.numcad),0) + nvl((select Folha.Valor_Evento from vetorh.usu_v001fol folha 
         where folha.per_referencia = to_date('03-2020','mm-yyyy') and codeve = 1951 and folha.numcad = funcionario.numcad),0) + nvl((select Folha.Valor_Evento from vetorh.usu_v001fol folha 
         where folha.per_referencia = to_date('03-2020','mm-yyyy') and codeve = 1952 and folha.numcad = funcionario.numcad),0) )      /(Escala.Hormes/60)),'FM999G999G999D90')

         end as Salario_Hora,      
          
      
  Case 
         when (Hor.Datfim = Hor.Datini) and (Hor.Horfim >= Hor.Horini) then to_char(((Hor.Horfim - Hor.Horini)  * (((select Folha.Valor_Evento from vetorh.usu_v001fol folha 
         where folha.per_referencia = to_date('03-2020','mm-yyyy') and codeve = 200 and folha.numcad = funcionario.numcad) + nvl((select Folha.Valor_Evento from vetorh.usu_v001fol folha 
         where folha.per_referencia = to_date('03-2020','mm-yyyy') and codeve = 300 and folha.numcad = funcionario.numcad),0) + nvl((select Folha.Valor_Evento from vetorh.usu_v001fol folha 
         where folha.per_referencia = to_date('03-2020','mm-yyyy') and codeve = 1951 and folha.numcad = funcionario.numcad),0) + nvl((select Folha.Valor_Evento from vetorh.usu_v001fol folha 
         where folha.per_referencia = to_date('03-2020','mm-yyyy') and codeve = 1952 and folha.numcad = funcionario.numcad),0) )      /(Escala.Hormes)) *2),'FM999G999G999D90')
         when (Hor.Datfim > Hor.Datini) and (Hor.Horfim = 0) then to_char(((1439-Hor.Horini)*(((select Folha.Valor_Evento from vetorh.usu_v001fol folha 
         where folha.per_referencia = to_date('03-2020','mm-yyyy') and codeve = 200 and folha.numcad = funcionario.numcad) + nvl((select Folha.Valor_Evento from vetorh.usu_v001fol folha 
         where folha.per_referencia = to_date('03-2020','mm-yyyy') and codeve = 300 and folha.numcad = funcionario.numcad),0) + nvl((select Folha.Valor_Evento from vetorh.usu_v001fol folha 
         where folha.per_referencia = to_date('03-2020','mm-yyyy') and codeve = 1951 and folha.numcad = funcionario.numcad),0) + nvl((select Folha.Valor_Evento from vetorh.usu_v001fol folha 
         where folha.per_referencia = to_date('03-2020','mm-yyyy') and codeve = 1952 and folha.numcad = funcionario.numcad),0) )      /(Escala.Hormes)) *2),'FM999G999G999D90')
         when (Hor.Datfim > Hor.Datini) and (Hor.Horfim > 0) then to_char((((1439-Hor.Horini)+ Hor.Horfim-0) * (((select Folha.Valor_Evento from vetorh.usu_v001fol folha 
         where folha.per_referencia = to_date('03-2020','mm-yyyy') and codeve = 200 and folha.numcad = funcionario.numcad) + nvl((select Folha.Valor_Evento from vetorh.usu_v001fol folha 
         where folha.per_referencia = to_date('03-2020','mm-yyyy') and codeve = 300 and folha.numcad = funcionario.numcad),0) + nvl((select Folha.Valor_Evento from vetorh.usu_v001fol folha 
         where folha.per_referencia = to_date('03-2020','mm-yyyy') and codeve = 1951 and folha.numcad = funcionario.numcad),0) + nvl((select Folha.Valor_Evento from vetorh.usu_v001fol folha 
         where folha.per_referencia = to_date('03-2020','mm-yyyy') and codeve = 1952 and folha.numcad = funcionario.numcad),0) )      /(Escala.Hormes)) *2),'FM999G999G999D90')

         end as Hora_Extra






from r064SIH hor, R038HSA sal, R006ESC escala, R034Fun funcionario, vetorh.usu_v001fol folha
where 

Hor.Datini between '01/03/2020' and '31/03/2020'  and -- Para mudar para o mês seguinte, mude aqui.
folha.per_referencia = to_date('03-2020','mm-yyyy') and -- Para mudar para o mês seguinte, mude aqui.

sal.Numemp = Funcionario.Numemp and
sal.Tipcol = Funcionario.Tipcol and
sal.Numcad = Funcionario.Numcad and
escala.codesc = funcionario.codesc and
Hor.Numemp =  funcionario.Numemp and
hor.Tipcol = funcionario.Tipcol and
hor.Numcad = funcionario.Numcad and
folha.Numcad = funcionario.Numcad and
folha.Numemp = funcionario.Numemp and
folha.TipCol = funcionario.TipCol and
Sal.Datalt = (select max(Sal2.Datalt) from R038HSA Sal2 where  sal.numcad = sal2.numcad ) and
folha.codeve = 200




order by 3,4;
