SELECT * FROM CLIENTE;
SELECT * FROM FUNCIONARIO;
SELECT * FROM GENERO;
SELECT * FROM PRODUTO;
SELECT * FROM SALA;
SELECT * FROM FILME;
SELECT * FROM Sessao;
SELECT * FROM ASSENTO;
SELECT * FROM Venda;
SELECT * FROM Ingresso;
SELECT * FROM Item_Venda;

-- Apresentar 5 exemplos de consultas usando junção de tabelas (INNER JOIN, LEFT JOIN, RIGHT JOIN)

-- 1 consulta para mostrar todos os clientes e vendas
SELECT c.nome AS cliente, v.id_venda, v.valor_total FROM Cliente AS c
LEFT JOIN Venda v ON c.id_cliente = v.fk_id_cliente;

-- 2 consulta das sessões e filmes
SELECT s.id_sessao, f.titulo AS filme, s.data_hora_inicio FROM Sessao s
INNER JOIN Filme f ON s.fk_id_filme = f.id_filme;

-- 3 a consulta trás produtos, quantidade e o total
SELECT p.nome AS produto, iv.quantidade, iv.subtotal, v.id_venda FROM Item_Venda iv
RIGHT JOIN Produto p ON iv.fk_id_produto = p.id_produto
RIGHT JOIN Venda v ON iv.fk_id_venda = v.id_venda;

-- 4 ingressos com a sessão e filme
SELECT i.id_ingresso, i.valor_pago, s.data_hora_inicio, f.titulo AS filme FROM Ingresso i
INNER JOIN Sessao s ON i.fk_id_sessao = s.id_sessao
INNER JOIN Filme f ON s.fk_id_filme = f.id_filme;

-- 5 ingressos com sessão, filme e sala
SELECT i.id_ingresso, i.tipo_ingresso, i.valor_pago, f.titulo AS filme, s.data_hora_inicio, sa.nome_sala FROM Ingresso i
INNER JOIN Sessao s ON i.fk_id_sessao = s.id_sessao
INNER JOIN Filme f ON s.fk_id_filme = f.id_filme
INNER JOIN Sala sa ON s.fk_id_sala = sa.id_sala;

-- Apresentar 3 consultas que utilizam subconsultas (consultas aninhadas);

-- 1 buscar filmes com duração acima da média
SELECT titulo, duracao_minutos FROM Filme
WHERE duracao_minutos > (SELECT AVG(duracao_minutos) FROM Filme);

-- 2 listar clientes que já realizaram pelo menos uma compra
SELECT nome, email FROM Cliente
WHERE id_cliente IN (SELECT fk_id_cliente FROM Venda);

-- 3 pegando o maior valor do ingresso
SELECT MAX(valor_ingresso) FROM Sessao S
WHERE valor_ingresso > (SELECT AVG(valor_ingresso) FROM Sessao);

-- Apresentar 2 consultas que utilizam GROUP BY, sendo uma obrigatoriamente usando a cláusula HAVING;

-- 1 listando os títulos dos filmes que possuem pelo menos uma sessão
SELECT titulo FROM Filme WHERE id_filme IN (SELECT fk_id_filme FROM Sessao);

-- 2 listando todas as salas que possuem mais de 30 assentos
SELECT fk_id_sala AS sala, COUNT(*) AS total_assentos FROM Assento
GROUP BY fk_id_sala HAVING COUNT(*) > 30;

