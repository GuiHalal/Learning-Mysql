-- TRIGGERs 'UPDATE' and 'DELETE'

SELECT * FROM NOTAS;
SELECT * FROM ITENS_NOTAS;
SELECT * FROM TAB_FATURAMENTO;

UPDATE ITENS_NOTAS SET QUANTIDADE = 200
WHERE NUMERO = '0103' AND CODIGO = '1002334';

SELECT * FROM TAB_FATURAMENTO;

DELETE FROM ITENS_NOTAS WHERE NUMERO = '0103' AND CODIGO = '1002334';

SELECT * FROM TAB_FATURAMENTO;

-- TRIGGER to UPDATE
DELIMITER //
CREATE TRIGGER TG_CALCULA_FATURAMENTO_UPDATE
AFTER UPDATE ON ITENS_NOTAS FOR EACH ROW BEGIN
	DELETE FROM TAB_FATURAMENTO;
	INSERT INTO TAB_FATURAMENTO
	SELECT A.DATA_VENDA, SUM(B.QUANTIDADE*B.PRECO) AS TOTAL_VENDA FROM 
	NOTAS A INNER JOIN ITENS_NOTAS B
	ON A.NUMERO = B.NUMERO
	GROUP BY A.DATA_VENDA;
END //

-- TRIGGER TO DELETE
DELIMITER //
CREATE TRIGGER TG_CALCULA_FATURAMENTO_DELETE
AFTER DELETE ON ITENS_NOTAS FOR EACH ROW BEGIN
	DELETE FROM TAB_FATURAMENTO;
	INSERT INTO TAB_FATURAMENTO
	SELECT A.DATA_VENDA, SUM(B.QUANTIDADE*B.PRECO) AS TOTAL_VENDA FROM 
	NOTAS A INNER JOIN ITENS_NOTAS B
	ON A.NUMERO = B.NUMERO
	GROUP BY A.DATA_VENDA;
END //


SELECT * FROM TAB_FATURAMENTO;

DELETE FROM ITENS_NOTAS 
WHERE NUMERO = '0104' AND CODIGO = '1002334';

UPDATE ITENS_NOTAS SET QUANTIDADE = 300
WHERE NUMERO = '0102' AND CODIGO = '1002334';

SELECT * FROM TAB_FATURAMENTO;