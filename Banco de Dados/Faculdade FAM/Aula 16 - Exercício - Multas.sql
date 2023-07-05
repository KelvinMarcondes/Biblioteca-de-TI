Create Table TB_Habilitacao
(
	ID_CPF		Varchar2(11),
	NM_HABILITADO	Varchar2(50) 	Constraint Hab_Nome_nn 		Not Null,
	DS_Endereco	Varchar2(50) 	Constraint Hab_Endereco_nn 	Not Null,
	ID_CEP		Varchar2(8)  	Constraint Hab_CEP_nn 		Not Null,
	DS_Bairro 	Varchar2(40) 	Constraint Hab_Bairro_nn 	Not Null,
	FL_Categoria	Char(1)		Constraint Hab_CartaCateg_nn 	Not Null,
	Dt_Vencimento	Date		Constraint Hab_Vencimento_nn 	Not Null,
	Constraint 	Habilitacao_pk 	Primary Key (ID_CPF)
);
Create Table TB_Combustivel
(
	ID_Combustivel	Number(2),
	DS_Combustivel	Varchar2(50)	Constraint Com_Descricao_nn 	Not Null,
	Tx_IPVA		Number(4,2)	Constraint Com_Taxa_IPVA_nn 	Not Null,
	Constraint 	Combustivel_pk	Primary Key (ID_Combustivel)
);
Create Table TB_Veiculos
(
	ID_Placa	Varchar2(8),
	DS_Renavam	Varchar2(13)	Constraint Vei_Renavam_nn 	Not Null,
	DS_Marca	Varchar2(40)	Constraint Vei_Marca_nn 	Not Null,
	DS_Modelo	Varchar2(40)	Constraint Vei_Modelo_nn 	Not Null,
	ID_Combustivel	Number(2)	Constraint Vei_Combustivel_nn 	Not Null,
	DS_Ano_Fabric	Number(4)	Constraint Vei_Ano_Fabr_nn 	Not Null,
	DS_Ano_Modelo	Number(4)	Constraint Vei_Ano_Modelo_nn 	Not Null,
	DS_Cor		Varchar2(40)	Constraint Vei_Cor_nn 		Not Null,
	Constraint 	Veiculos_pk	Primary Key (ID_Placa),
	Constraint	Vei_Comb_fk	Foreign Key (ID_Combustivel) 	References TB_Combustivel(ID_Combustivel)	
);

Create Table TB_Historico
(
	ID_Placa	Varchar2(8),
	ID_CPF		Varchar2(11),
	DT_Aquisicao	Date		Constraint His_Aquisicao_nn 	Not Null,
	DT_Venda	Date,	
	Constraint 	Historico_pk	Primary Key (ID_Placa, ID_CPF),
	Constraint	His_Placa_fk	Foreign Key (ID_Placa) 		References TB_Veiculos(ID_Placa),
	Constraint	His_CPF_fk	Foreign Key (ID_CPF)		References TB_Habilitacao(ID_CPF)
);
Create Table TB_Multa
(
	ID_Multa	Number(6),
	DS_Multa	Varchar2(50)	Constraint Mul_Descricao_nn 	Not Null,
	NR_Pontos	Number(2)	Constraint Mul_Pontos_nn 	Not Null,
	NR_Valor	Number(12,2)	Constraint Mul_Valor_nn 	Not Null,
	Constraint 	Multas_pk	Primary Key (ID_Multa)
);
Create Table TB_Infracao
(
	ID_Placa	Varchar2(8),
	ID_Multa	Number(6),
	DT_Infracao	Date		Constraint Inf_Data_nn 		Not Null,
	DS_Local	Varchar2(50)	Constraint Inf_Local_nn 	Not Null,
	FL_Paga		Varchar2(1)	Constraint Inf_Paga_nn 		Not Null,
	Constraint 	Infracoes_pk	Primary Key (ID_Placa, ID_Multa),
	Constraint	Inf_Placa_fk	Foreign Key (ID_Placa) 		References TB_Veiculos(ID_Placa),	
	Constraint	Inf_Cod_M_fk	Foreign Key (ID_Multa) 	References TB_Multa(ID_Multa),	
	Constraint	Inf_Paga_ck	Check (FL_Paga = 'S' Or FL_Paga = 'N')
);

