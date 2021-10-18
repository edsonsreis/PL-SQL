
select * from r108res;



select * from r108res where codexa = 3917 ;
delete from r108res where codexa =  3914;
commit;


select * from r108exa;





--Verificar quem não possui e-mail

select distinct
usu.NUMEMP, 
usu.TIPCOL,
usu.NUMCAD,
usu.CODUSU,
usu.CRIUSU
from r034usu usu, r034fun fun
where
usu.NUMEMP = fun.NUMEMP and
usu.TIPCOL = fun.TIPCOL and
usu.NUMCAD = fun.NUMCAD and
fun.SITAFA <> 7
;

select * from r999usu;
select * from r034mdl where codmod = 17 and numemp = 1 and tipcol = 1 ;
select * from r034fun where codmod = 17 and numemp = 1 and tipcol = 1 ;
select * from r000DFM;
select * from r034fun where numcad = 1963 and numemp= 1;




select * from r911sec;
delete form r911sec;
commit;














select * from usu_v002PER where numcad = 1963 and numemp = 1 and tipcol = 1;
select * from r024car;
select * from r006esc; 
SELECT 
FOL.CODFIL,
FOL.NOMFIL,
FOL.NUMCAD,
FOL.NOMFUN,
CAR.TITRED,
FUN.DATADM,
ESC.HORMES/60 AS HORMES,
FOL.CODCCU,
FOL.NOMCCU,


FOL.CODCAL,
FOL.TIPO_CALCULO,
FOL.PER_REFERENCIA,
FOL.CODEVE



FROM usu_v003FOL FOL, R034FUN FUN, R024CAR CAR, R006ESC ESC
WHERE
FOL.NUMEMP = FUN.NUMCAD AND
FOL.TIPCOL = FUN.TIPCOL AND
FOL.NUMCAD = FUN.NUMCAD AND
FUN.ESTCAR = CAR.ESTCAR AND
FUN.CODCAR = CAR.CODCAR AND
FUN.CODESC = ESC.CODESC



;



SELECT 

	   FIL.CODFIL,
   	   FIL.NOMFIL,
	   FUN.NUMCAD,
	   FUN.NOMFUN,
       CAR.TITRED,
       FUN.DATADM,
       ESC.HORMES/60 AS CARGA_HORARIA,       
	   CCU.CODCCU,
	   CCU.NOMCCU,
       SIT.DESSIT,
	   CAL.CODCAL,
	   CASE CAL.TIPCAL
	        WHEN 11 THEN 'Cálculo Mensal'
			WHEN 12 THEN 'Folha Complementar'
			WHEN 13 THEN 'Cálculo de Dissídio'
			WHEN 14 THEN 'Pagamento de Dissídio'
			WHEN 15 THEN 'Complementar de Rescisão'
			WHEN 21 THEN 'Primeira Semana'
			WHEN 22 THEN 'Semana Intermediária'
			WHEN 23 THEN 'Última Semana'
			WHEN 31 THEN 'Adiantamento 13º Salário'
			WHEN 32 THEN '13º Integral'
			WHEN 41 THEN '1ª Quinzena'
			WHEN 42 THEN '2ª Quinzena'
			WHEN 91 THEN 'Adiantamento Salarial'
			WHEN 92 THEN 'Participação nos Lucros'
			WHEN 93 THEN 'Especiais'
			WHEN 94 THEN 'Reclamatória Trabalhista'
			ELSE 'Outros' END AS Tipo_Calculo,
	   CAL.PERREF AS PER_REFERENCIA,
	   EVC.CODEVE,
	   EVC.DESEVE,
	   CASE EVC.TIPEVE
	        WHEN 1 THEN 'Provento'
			WHEN 2 THEN 'Vantagem'
			WHEN 3 THEN 'Desconto'
			WHEN 4 THEN 'Outros'
			WHEN 5 THEN 'Outros Env.Provento'
			ELSE 'Outros Env.Desconto' END As Tipo_Evento,
       EVC.CODCLC,
       CLC.NOMCON AS NOMECLC,
	   FFR.VALEVE AS VALOR_EVENTO,

       CASE EVC.USU_GRUPEVT
            WHEN 1 THEN 'Salários'
			WHEN 2 THEN 'Gratificações'
            WHEN 3 THEN 'Horas Extras'
            WHEN 4 THEN 'Encargos'
            WHEN 5 THEN 'Férias'
            WHEN 6 THEN 'Rescisões'
            WHEN 7 THEN 'Descontos'
       ELSE 'Outros ' END AS GRUPEVT
       
  FROM R034FUN FUN,
       R046VER FFR,
	   R044CAL CAL,
 	   R008EVC EVC,
 	   R018CCU CCU,
 	   R038HCC HCC,
 	   R038HLO HLO,
 	   R016ORN ORN,
 	   R016HIE HIE,
 	   R008INC INC,
 	   R038HFI HFI,
 	   R030FIL FIL,
       R048CLC CLC,
       R024CAR CAR,
       R006ESC ESC,
       R010SIT SIT
       
 WHERE 
 --MUDAR O CÓDIGO DE CÁLCULO AQUI:
   CAL.CODCAL = 556
   AND FUN.NUMEMP = FFR.NUMEMP
   AND FUN.TIPCOL = FFR.TIPCOL
   AND FUN.NUMCAD = FFR.NUMCAD
   AND CAL.NUMEMP = FFR.NUMEMP 
   AND CAL.CODCAL = FFR.CODCAL
   AND EVC.CODTAB = FFR.TABEVE
   AND EVC.CODEVE = FFR.CODEVE
   AND FUN.NUMEMP = HCC.NUMEMP
   AND FUN.TIPCOL = HCC.TIPCOL
   AND FUN.NUMCAD = HCC.NUMCAD
   AND FIL.NUMEMP = HFI.NUMEMP
   AND FIL.CODFIL = HFI.CODFIL
   AND FUN.NUMEMP = HFI.NUMEMP
   AND FUN.TIPCOL = HFI.TIPCOL
   AND FUN.NUMCAD = HFI.NUMCAD
   AND CLC.CODCLC = EVC.CODCLC
   AND CLC.TABEVE = EVC.CODTAB
   AND HCC.DATALT = (SELECT MAX(HC2.DATALT)
                       FROM R038HCC HC2
  					  WHERE HCC.NUMEMP = HC2.NUMEMP
  					    AND HCC.TIPCOL = HC2.TIPCOL
   						AND HCC.NUMCAD = HC2.NUMCAD
  						AND (HC2.DATALT <= CASE TO_CHAR(CAL.FIMCMP,'DD/MM/YYYY')
  						                    WHEN '31/12/1900' THEN LAST_DAY(CAL.PERREF)
  						                    ELSE  CAL.FIMCMP
  						                   END  ))
   AND HFI.DATALT = (SELECT MAX(HF2.DATALT)
                       FROM R038HFI HF2
					  WHERE HFI.NUMEMP = HF2.NUMEMP
	 				    AND HFI.TIPCOL = HF2.TIPCOL
	  					AND HFI.NUMCAD = HF2.NUMCAD
	   					AND HF2.DATALT <= CASE TO_CHAR(CAL.FIMCMP,'DD/MM/YYYY')
  						                    WHEN '31/12/1900' THEN LAST_DAY(CAL.PERREF)
  						                    ELSE  CAL.FIMCMP
  						                   END  )
   AND CCU.NUMEMP = HCC.NUMEMP
   AND CCU.CODCCU = HCC.CODCCU
   AND FUN.NUMEMP = HLO.NUMEMP
   AND FUN.TIPCOL = HLO.TIPCOL
   AND FUN.NUMCAD = HLO.NUMCAD
   AND HLO.DATALT = (SELECT MAX(HL2.DATALT)
                       FROM R038HLO HL2
 					  WHERE HLO.NUMEMP = HL2.NUMEMP
  					    AND HLO.TIPCOL = HL2.TIPCOL
   						AND HLO.NUMCAD = HL2.NUMCAD
						AND HL2.DATALT <= CASE TO_CHAR(CAL.FIMCMP,'DD/MM/YYYY')
  						                    WHEN '31/12/1900' THEN LAST_DAY(CAL.PERREF)
  						                    ELSE  CAL.FIMCMP
  						                   END  )
   AND ORN.TabOrg = HLO.TabOrg
   AND ORN.NUMLOC = HLO.NUMLOC
   AND ORN.TabOrg = HIE.TABORG
   AND ORN.NUMLOC = HIE.NUMLOC
   AND HIE.DatIni = (SELECT MAX(HI2.DATINI)
                       FROM R016HIE HI2
  					  WHERE HLO.TABORG = HI2.TABORG
  					    AND HLO.NUMLOC = HI2.NUMLOC
  						AND HI2.DATINI <= CASE TO_CHAR(CAL.FIMCMP,'DD/MM/YYYY')
  						                    WHEN '31/12/1900' THEN LAST_DAY(CAL.PERREF)
  						                    ELSE  CAL.FIMCMP
  						                   END  )
   AND INC.CODTAB = FFR.TABEVE
   AND INC.CODEVE = FFR.CODEVE
   AND INC.CMPINC = (SELECT MAX(IN2.CMPINC)   
                      FROM R008INC IN2        
					 WHERE INC.CODTAB = IN2.CODTAB
					   AND INC.CODEVE = IN2.CODEVE
					   AND IN2.CMPINC <= CASE TO_CHAR(CAL.FIMCMP,'DD/MM/YYYY')
  						                    WHEN '31/12/1900' THEN LAST_DAY(CAL.PERREF)
  						                    ELSE  CAL.FIMCMP
  						                   END  )
   AND INC.SEQINC = (SELECT MAX(IN3.SEQINC)
					    FROM R008INC IN3    
					  WHERE INC.CODTAB = IN3.CODTAB
						AND INC.CODEVE = IN3.CODEVE
						AND INC.CMPINC = IN3.CMPINC)
   AND FUN.TIPCOL = 1 
   AND FUN.ESTCAR = CAR.ESTCAR 
   AND FUN.CODCAR = CAR.CODCAR 
   AND FUN.CODESC = ESC.CODESC
   AND FUN.SITAFA = SIT.CODSIT
   AND FUN.NUMCAD = 1963;


select * from r911sec;
delete from r911sec;
commit;


select distinct

*

from r034fun fun, r038hvi vin
where
fun.numemp = vin.numemp and
fun.tipcol = vin.tipcol and
fun.numcad = vin.numcad and
vin.codvin <> 80 and
fun.sitafa <> 7 and
fun.numemp = 1 and
fun.tipcol = 1 and
fun.datadm <= '31/08/21'
fun.codccu = 

;

select * from r034fun where numcad = 8137;

select * from usu_v002per where numcad = 8137;








