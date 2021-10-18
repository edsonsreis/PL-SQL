select 

Funcionario.Cdn_Funcionario,
Case 
    when Rh_Tab.idi_cor_cutis = '1' then '1'
    when Rh_Tab.idi_cor_cutis = '2' then '2' 
    when Rh_Tab.idi_cor_cutis = '3' then '4'
    when Rh_Tab.idi_cor_cutis = '4' then '3'
    when Rh_Tab.idi_cor_cutis = '5' then '0'
    end as Cor


from HCM.Rh_Pessoa_Fisic rh_tab , HCM.Funcionario funcionario
where 
funcionario.num_pessoa_fisic = rh_tab.num_pessoa_fisic ;

select * from HCM.funcionario;