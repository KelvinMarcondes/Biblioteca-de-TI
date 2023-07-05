drop table tb_resultado;
drop table tb_prova;
drop table tb_circuito;
drop table tb_piloto;
drop table tb_equipe;
drop table tb_pais;
drop view resultado_pontos;

CREATE TABLE TB_Pais(
ID_Pais NUMBER(7),
NM_PAIS VARCHAR2(40) CONSTRAINT Pais_NOME NOT NULL,
NR_Populacao number(10) CONSTRAINT Pais_populacao NOT NULL,
CONSTRAINT Pais_ID_Pais_PK PRIMARY KEY(ID_Pais));

CREATE TABLE TB_Circuito(
ID_circuito NUMBER(7),
NM_CIRCUITO VARCHAR2(40) CONSTRAINT Circuito_NOME_NN NOT NULL,
NR_Extensao NUMBER(5,1) CONSTRAINT Circuito_ex_NNt NOT NULL,
ID_Pais NUMBER(7),
CONSTRAINT Circuito_ID_pais_FK FOREIGN KEY (ID_Pais) REFERENCES TB_Pais (ID_Pais),
CONSTRAINT Circuito_ID_circuito_PK PRIMARY KEY(ID_circuito));

CREATE TABLE TB_Equipe(
ID_equipe NUMBER(7),
NM_EQUIPE VARCHAR2(40) CONSTRAINT equipe_NOME_NN NOT NULL,
ID_Pais NUMBER(7),
CONSTRAINT Equipe_ID_pais_FK FOREIGN KEY (ID_Pais) REFERENCES TB_Pais (ID_Pais),
CONSTRAINT Circuito_ID_equipe_PK PRIMARY KEY(ID_equipe));

CREATE TABLE TB_Piloto(
ID_piloto NUMBER(7),
NM_PILOTO VARCHAR2(40) CONSTRAINT Piloto_NOME_NN NOT NULL,
DT_NASCIMENTO DATE CONSTRAINT Piloto_datanasc_NN NOT NULL,
ID_equipe NUMBER(7),
ID_Pais NUMBER(7),
CONSTRAINT Piloto_ID_pais_Pais_FK FOREIGN KEY (ID_pais) REFERENCES TB_Pais (ID_Pais),
CONSTRAINT Piloto_ID_Equipe_Equipe_FK FOREIGN KEY (ID_equipe) REFERENCES TB_Equipe (ID_equipe),
CONSTRAINT Piloto_ID_Piloto_PK PRIMARY KEY(ID_piloto));


CREATE TABLE TB_Prova(
ID_Prova NUMBER(7),
DT_PROVA DATE CONSTRAINT Prova_data NOT NULL,
NM_Situacao VARCHAR2(40) CONSTRAINT prova_Situacao_NN NOT NULL,
ID_circuito NUMBER(7),
CONSTRAINT Prova_circuito_FK FOREIGN KEY (ID_circuito) REFERENCES TB_Circuito(ID_circuito),
CONSTRAINT Prova_ID_Prova_PK PRIMARY KEY(ID_Prova));


CREATE TABLE TB_Resultado(
ID_Prova NUMBER(7),
ID_piloto NUMBER(7),
NR_Tempo_prova NUMBER(8) CONSTRAINT Resultado_tempo_NN NOT NULL,
NR_Coloc_final NUMBER(2) CONSTRAINT Resultado_colocacao_NN NOT NULL,
NR_Posicao_grid NUMBER(2) CONSTRAINT Resultado_posicao_NN NOT NULL,
NR_melhor_volta NUMBER(6) CONSTRAINT Resultado_melhorvolt_NN NOT NULL,
CONSTRAINT Resultado_ID_piloto_piloto_FK FOREIGN KEY (ID_piloto) REFERENCES TB_piloto (ID_piloto),
CONSTRAINT Resultado_ID_Prova_Prova_FK FOREIGN KEY (ID_Prova) REFERENCES TB_Prova (ID_Prova),
CONSTRAINT Resultado_ID_piloto_PK PRIMARY KEY(ID_piloto,ID_Prova));



-- Insere dados na tabela Pais
delete from tb_pais;
insert into tb_pais values(1, 'Brasil', 190000000);
insert into tb_pais values(2, 'Italia', 42000000);
insert into tb_pais values(3, 'Inglaterra', 32000000);
insert into tb_pais values(4, 'Alemanha', 65000000);
insert into tb_pais values(5, 'França', 84000000);
insert into tb_pais values(6, 'Japão', 19000000);
insert into tb_pais values(7, 'Finlandia', 13000000);
insert into tb_pais values(8, 'Suecia', 18000000);
insert into tb_pais values(9, 'Escocia', 9000000);
insert into tb_pais values(10, 'Colombia', 68000000);
insert into tb_pais values(11, 'Argentina', 53000000);
insert into tb_pais values(12, 'Estados Unidos', 228000000);
insert into tb_pais values(13, 'Mexico', 112000000);
insert into tb_pais values(14, 'Portugal', 11000000);
insert into tb_pais values(15, 'Malasia', 38000000);
insert into tb_pais values(16, 'Espanha', 41000000);
insert into tb_pais values(17, 'China', 1021000000);
insert into tb_pais values(18, 'Barhein', 2000000);
insert into tb_pais values(19, 'Noruega', 42000000);
insert into tb_pais values(20, 'Australia', 58000000);
insert into tb_pais values(21, 'Hungria', 1500000);
insert into tb_pais values(22, 'Belgica', 13000000);
insert into tb_pais values(23, 'Suiça', 11000000);
insert into tb_pais values(24, 'Austria', 18000000);
insert into tb_pais values(25, 'San Marino', 732000);
insert into tb_pais values(26, 'Monaco', 932000);
insert into tb_pais values(27, 'Canada', 83000000);
insert into tb_pais values(28, 'Chile', 22000000);
insert into tb_pais values(29, 'Egito', 121000000);
insert into tb_pais values(30, 'Russia', 211000000);
insert into tb_pais values(31, 'Venezuela', 135000000);
insert into tb_pais values(32, 'Holanda', 65000000);
insert into tb_pais values(33, 'India', 5200000000);
insert into tb_pais values(34, 'Cingapura', 134000000);
insert into tb_pais values(35, 'Coréia do Sul', 950000000);
insert into tb_pais values(36, 'Abu Dhabi', 50000000);

-- Insere dados na tabela Equipe
delete from tb_equipe;
-- Insere dados na tabela Equipe usando a claúsula values
insert into tb_equipe values (1, 'Ferrari', 2);
insert into tb_equipe values (2, 'Williams-Renault', 3);
-- Insere dados na tabela Equipe usando a claúsula select
insert into tb_equipe select 3, 'Red Bull Racing-Renault', id_pais from tb_pais where nm_pais = 'Austria' ;
insert into tb_equipe select 4, 'Lotus-Renault', id_pais from tb_pais where nm_pais = 'Inglaterra'; 
insert into tb_equipe select 5, 'McLaren-Mercedes', id_pais from tb_pais where nm_pais = 'Inglaterra'; 
insert into tb_equipe select 6, 'Sauber-Ferrari', id_pais from tb_pais where nm_pais = 'Suiça' ;
insert into tb_equipe select 7, 'Mercedes', id_pais from tb_pais where nm_pais = 'Alemanha'; 
insert into tb_equipe select 8, 'Force India-Mercedes', id_pais from tb_pais where nm_pais = 'Inglaterra';
insert into tb_equipe select 9, 'STR-Ferrari', id_pais from tb_pais where nm_pais = 'Italia';
insert into tb_equipe select 10, 'Marussia-Cosworth', id_pais from tb_pais where nm_pais = 'Russia';
insert into tb_equipe select 11, 'Caterham-Renault', id_pais from tb_pais where nm_pais = 'Inglaterra';


-- Insere dados na tabela Piloto
delete from tb_piloto;
insert into tb_piloto values (1, 'Fernando Alonso', to_date('01/01/1980','DD/MM/YYYY'), 1,16);
insert into tb_piloto values (2, 'Felipe Massa', to_date('01/12/1980','DD/MM/YYYY'), 1,1);
insert into tb_piloto values (3, 'Adrian Sutil', to_date('01/11/1980','DD/MM/YYYY'), 8,4);
insert into tb_piloto values (4, 'Paul di Resta', to_date('01/10/1980','DD/MM/YYYY'), 8,3);
insert into tb_piloto values (5, 'Kimi Raikkonen', to_date('01/01/1980','DD/MM/YYYY'), 4,7);
insert into tb_piloto values (6, 'Romain Grosjean', to_date('01/02/1980','DD/MM/YYYY'), 4,5);
insert into tb_piloto values (7, 'Jules Bianchi', to_date('01/09/1980','DD/MM/YYYY'), 10,5);
insert into tb_piloto values (8, 'Max Chilton', to_date('01/03/1981','DD/MM/YYYY'), 10,3);
insert into tb_piloto values (9, 'Jenson Button', to_date('01/04/1983','DD/MM/YYYY'), 5,3);
insert into tb_piloto values (10, 'Sergio Perez', to_date('01/03/1982','DD/MM/YYYY'), 5,13);
insert into tb_piloto values (11, 'Lewis Hamilton', to_date('01/01/1981','DD/MM/YYYY'), 7,3);
insert into tb_piloto values (12, 'Nico Rosberg', to_date('01/09/1980','DD/MM/YYYY'), 7,4);
insert into tb_piloto values (13, 'Sebastian Vettel', to_date('01/08/1980','DD/MM/YYYY'), 3,4);
insert into tb_piloto values (14, 'Mark Webber', to_date('01/07/1980','DD/MM/YYYY'), 3,20);
insert into tb_piloto values (15, 'Esteban Gutierrez', to_date('01/06/1980','DD/MM/YYYY'), 6,13);
insert into tb_piloto values (16, 'Nico Hulkenberg', to_date('01/05/1980','DD/MM/YYYY'), 6,4);
insert into tb_piloto values (17, 'Jean-Eric Vergne', to_date('01/04/1980','DD/MM/YYYY'), 9,5);
insert into tb_piloto values (18, 'Daniel Ricciardo', to_date('01/03/1980','DD/MM/YYYY'), 9,20);
insert into tb_piloto values (19, 'Valtteri Bottas', to_date('01/02/1980','DD/MM/YYYY'), 2,7);
insert into tb_piloto values (20, 'Pastor Maldonado', to_date('01/02/1980','DD/MM/YYYY'), 2,31);
insert into tb_piloto values (21, 'Charles Pic', to_date('01/02/1980','DD/MM/YYYY'), 11,5);
insert into tb_piloto values (22, 'Giedo Van der Garde', to_date('01/02/1980','DD/MM/YYYY'), 11,32);


-- Insere dados na tabela Circuito
delete from tb_circuito;
insert into tb_circuito values (1, 'Melbourne', 5303, 20);
insert into tb_circuito values (2, 'Sepang', 5543,15);
insert into tb_circuito values (3, 'Sakhir', 5417,18);
insert into tb_circuito values (4, 'Imola', 4933,25);
insert into tb_circuito values (5, 'Barcelona', 4627,16);
insert into tb_circuito values (6, 'Monte Carlo', 3340,26);
insert into tb_circuito values (7, 'Nurburgring', 5148,4);
insert into tb_circuito values (8, 'Montreal', 4361,27);
insert into tb_circuito values (9, 'Indianapolis', 4192,12);
insert into tb_circuito values (10, 'Magny-Cours', 4411,5);
insert into tb_circuito values (11, 'Silverstone', 5141,3);
insert into tb_circuito values (12, 'Hockenheim', 4574,4);
insert into tb_circuito values (13, 'Hungaroring', 4381,21);
insert into tb_circuito values (14, 'Spa-Francorchamps', 6973,22);
insert into tb_circuito values (15, 'Monza', 5793,2);
insert into tb_circuito values (16, 'Xangai', 5451,17);
insert into tb_circuito values (17, 'Suzuka', 5807,6);
insert into tb_circuito values (18, 'Interlagos', 4309,1);
insert into tb_circuito values (19, 'Cingapura', 4937,35);
insert into tb_circuito values (20, 'Yeongam', 5344,36);
insert into tb_circuito values (22, 'Nova Délhi', 4876,34);
insert into tb_circuito values (23, 'Valência', 4876,16);
insert into tb_circuito values (24, 'Budapeste', 4949,21);
insert into tb_circuito values (25, 'Yas Marina', 5394,36);
insert into tb_circuito values (26, 'Austin', 5394,12);
insert into tb_circuito values (27, 'Nurburgring', 6432,4);

-- Insere dados na tabela Prova
delete from tb_prova;
insert into tb_prova values(1, TO_DATE('03/07/2013','MM/DD/YYYY'), 'R', 1);
insert into tb_prova values(2, TO_DATE('03/21/2013','MM/DD/YYYY'), 'R', 2);
insert into tb_prova values(3, TO_DATE('04/04/2013','MM/DD/YYYY'), 'R', 3);
insert into tb_prova values(4, TO_DATE('04/25/2013','MM/DD/YYYY'), 'P', 4);
insert into tb_prova values(5, TO_DATE('05/09/2013','MM/DD/YYYY'), 'P', 5);
insert into tb_prova values(6, TO_DATE('05/23/2013','MM/DD/YYYY'), 'P', 6);
insert into tb_prova values(7, TO_DATE('05/30/2013','MM/DD/YYYY'), 'P', 7);
insert into tb_prova values(8, TO_DATE('06/13/2013','MM/DD/YYYY'), 'P', 8);
insert into tb_prova values(9, TO_DATE('06/20/2013','MM/DD/YYYY'), 'P', 9);
insert into tb_prova values(10, TO_DATE('07/04/2013','MM/DD/YYYY'), 'P', 10);
insert into tb_prova values(11, TO_DATE('07/11/2013','MM/DD/YYYY'), 'P', 11);
insert into tb_prova values(12, TO_DATE('07/25/2013','MM/DD/YYYY'), 'P', 12);
insert into tb_prova values(13, TO_DATE('08/15/2013','MM/DD/YYYY'), 'P', 13);
insert into tb_prova values(14, TO_DATE('08/29/2013','MM/DD/YYYY'), 'P', 14);
insert into tb_prova values(15, TO_DATE('09/12/2013','MM/DD/YYYY'), 'P', 15);
insert into tb_prova values(16, TO_DATE('09/26/2013','MM/DD/YYYY'), 'P', 16);
insert into tb_prova values(17, TO_DATE('11/10/2013','MM/DD/YYYY'), 'P', 17);
insert into tb_prova values(18, TO_DATE('11/24/2013','MM/DD/YYYY'), 'P', 18);


-- Insere dados na tabela Resultado
delete from tb_resultado;
insert into tb_resultado values(1, 1, 90, 1,1, 4);
insert into tb_resultado values(1, 2, 91, 2,2, 5);
insert into tb_resultado values(1, 5, 92, 3,3, 1);
insert into tb_resultado values(1, 7, 93, 4,4, 3);
insert into tb_resultado values(1, 3, 94, 5,5, 7);
insert into tb_resultado values(1, 4, 95, 6,6, 9);
insert into tb_resultado values(1, 6, 96, 7,7, 10);
insert into tb_resultado values(1, 8, 97, 8,8, 15);
insert into tb_resultado values(2, 1, 98, 1,1, 18);
insert into tb_resultado values(2, 3, 99, 2,2, 21);
insert into tb_resultado values(2, 4, 100, 3,3, 13);
insert into tb_resultado values(2, 2, 101, 4,4, 14);
insert into tb_resultado values(2, 6, 102, 5,5, 15);
insert into tb_resultado values(2, 8, 103, 6,6, 18);
insert into tb_resultado values(2, 5, 104, 7,7, 33);
insert into tb_resultado values(2, 9, 105, 8,8, 45);
insert into tb_resultado values(3, 1, 106, 1,1, 3);
insert into tb_resultado values(3, 2, 107, 2,2, 5);
insert into tb_resultado values(3, 4, 108, 3,3, 25);
insert into tb_resultado values(3, 6, 109, 4,4, 23);
insert into tb_resultado values(3, 19, 110, 5,5, 24);
insert into tb_resultado values(3, 5, 111, 6,6, 33);
insert into tb_resultado values(3, 7, 112, 7,7, 37);
insert into tb_resultado values(3, 16, 113, 8,8, 41);

create or replace view resultado_pontos 
as select id_prova, id_piloto,   
 case 
    when nr_coloc_final = 1 then 25
    when nr_coloc_final = 2 then 18 
    when nr_coloc_final = 3 then 15 
    when nr_coloc_final = 4 then 12 
    when nr_coloc_final = 5 then 10 
    when nr_coloc_final = 6 then 8 
    when nr_coloc_final = 7 then 6 
    when nr_coloc_final = 8 then 4 
    when nr_coloc_final = 9 then 2 
    when nr_coloc_final = 10 then 1 
  end pontos
from tb_resultado

commit;