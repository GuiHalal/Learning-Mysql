-- COMMIT_and_ROLLBACK

START TRANSACTION;

SELECT * FROM VENDEDORES;

UPDATE VENDEDORES SET COMISSAO = COMISSAO * 1.15;

ROLLBACK;

COMMIT;

START TRANSACTION;

INSERT INTO `vendas_sucos`.`VENDEDORES`
(`MATRICULA`,
`NOME`,
`BAIRRO`,
`COMISSAO`,
`DATA_ADMISSAO`,
`FERIAS`)
VALUES
('9999',
'JOAO DA SILVA',
'CASSINO',
'0.9',
'2022-08-16',
0);

UPDATE VENDEDORES SET COMISSAO = COMISSAO * 1.15;


INSERT INTO `vendas_sucos`.`VENDEDORES`
(`MATRICULA`,
`NOME`,
`BAIRRO`,
`COMISSAO`,
`DATA_ADMISSAO`,
`FERIAS`)
VALUES
('9979',
'JOAO DA SILVA2',
'CASSINO',
'0.9',
'2022-08-16',
0);

SELECT * FROM `vendas_sucos`.`VENDEDORES`;

ROLLBACK;


START TRANSACTION;

DELETE FROM VENDEDORES;

ROLLBACK;

