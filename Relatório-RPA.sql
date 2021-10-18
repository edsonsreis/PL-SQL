select 

U##cdn_Estab,
Cod_Rh_Ccusto,
Cod_id_feder,
Datrefermovtoprestdorserv,
Dat_Pagto_Prestdor,
Numdoctomovtoprestdorserv,
Valbrutdoctomovtoservterc,
Val_Deduc_Depend_Irf,
Val_Deduc_Inss_Irf,
Val_Deduc_Palim_Irf,
Val_Tribut_Irf,
Val_Irf_Retid,
Valbasecalcencargoinss,
Val_Base_Calc_Iss,
Val_iss_terc


from hcm.movtoservprestadterc
where Datrefermovtoprestdorserv >= '01/08/2019'
and
Datrefermovtoprestdorserv <= '31/08/2019'
order by 1,3
;


select * from hcm.movtoservprestadterc;