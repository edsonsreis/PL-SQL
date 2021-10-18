select * from r038pis where numcad = 6419;

select * from R350MSG where codmsg = 393;

select * from r038heh where numcad = 6419;

select * from r350sta where numcad = 6419 and numemp = 2;

select * from R350RE0 where nistra = 16895559275  ;
select * from R350RE0 where IDEEVE = 'ID1083807010000002021051414155702001';

select * from r350svi where numcad = 6419 ;
update r350svi set nistra = 16895592750, numins = 8380701
where numcad = 6419 and numemp = 2 and IDEEVE = 'ID1083807010000002021051415101802001';
commit;




