select * from r350sta where numemp = 1 and tipcol = 2 and numcad = 5095;
select * from r350pen where numemp = 1 and tipcol = 2 and numcad = 5095;

select * from r350sta where numemp = 2 and numcad = 3152 and pidexc ='0002S2300202105101509332500001';

update r350sta set stasit = 8, numrec = '1.1.0000000000665331744'
where pidexc = '0002S2300202105101509332500001' and numcad = 3152 and numemp = 2;
commit;



select * from r350sta where numcad = 5015;
select * from r350pen where numcad = 5015;
select * from r350re0 where cpftra = '02818190410' and ideeve = 'ID1083807010000002021061417231201001';

--Fatlta esse comando aqui!!
update r350re0 set NOTRAC = 'MARIA DANTAS DE LIMA' 
where cpftra = '02818190410' and ideeve = 'ID1083807010000002021061417231201001';
commit;


select * from r350ADM WHERE cpftra = '02818190410' ;

select * from r350re0 where cpftra = '04979495478' and IDEEVE = 'ID1083807010000002021101509043301001';


update r350re0 set NOTRAC = 'ALINE TEIXEIRA DE ARAUJO' 
where cpftra = '04979495478' and IDEEVE = 'ID1083807010000002021101509043301001';
commit;




