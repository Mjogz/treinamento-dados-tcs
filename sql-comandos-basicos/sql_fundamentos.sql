-- Ordena os resultados pela coluna id_cliente em ordem crescente
SELECT id_cliente, nome
FROM Clientes 
ORDER BY id_cliente ASC;  -- ASC = ordem crescente, DESC = ordem decrescente

-- Remove registros duplicados, retornando apenas dados únicos de nome e cidade
SELECT DISTINCT nome, cidade
FROM Clientes;

-- Retorna clientes e pedidos com correspondência no id_cliente (interseção entre as tabelas)
SELECT clientes.nome, pedidos.data_pedido, pedidos.valor
FROM clientes
INNER JOIN pedidos ON clientes.id_cliente = pedidos.id_cliente;

-- Retorna todos os clientes, mesmo aqueles sem pedidos, e coloca NULL onde não há correspondência
SELECT clientes.nome, pedidos.data_pedido, pedidos.valor
FROM clientes
LEFT JOIN pedidos ON clientes.id_cliente = pedidos.id_cliente;

-- Retorna o produto cartesiano entre clientes e produtos (cada cliente com cada produto)
SELECT c.nome, p.nome_produto
FROM clientes c
CROSS JOIN produtos p;

-- Funções de agregação: Média, contagem, máximo, mínimo, soma e concatenação
SELECT AVG(valor) FROM pedidos;  -- Retorna a média de valores
SELECT COUNT(*) FROM ItensPedido;  -- Conta o número de itens no pedido
SELECT MAX(valor) FROM pedidos;  -- Retorna o valor máximo de um grupo
SELECT MIN(valor) FROM pedidos;  -- Retorna o valor mínimo de um grupo
SELECT SUM(valor) FROM pedidos;  -- Soma todos os valores dos pedidos
SELECT CONCAT(nome, ' - ', cidade) FROM clientes;  -- Concatena o nome e cidade do cliente

-- Agrupa os produtos pelo id_produto e soma o preço para cada grupo
SELECT nome_produto, SUM(preco) AS preco_produto
FROM produtos
GROUP BY id_produto;

-- Filtra os produtos com preço total maior que 100 após agrupamento
SELECT nome_produto, SUM(preco) AS total
FROM produtos
GROUP BY id_produto
HAVING SUM(preco) > 100;

-- Filtra os pedidos feitos após uma data específica
SELECT data_pedido, valor
FROM pedidos
WHERE data_pedido >= '2024-11-03';

-- Verifica registros onde a cidade está vazia, é NULL ou não é NULL
SELECT cidade, nome 
FROM Clientes 
WHERE cidade = '';  -- Verifica string vazia

SELECT cidade, nome 
FROM Clientes 
WHERE cidade IS NULL;  -- Verifica NULL

SELECT cidade, nome 
FROM Clientes 
WHERE cidade IS NOT NULL;  -- Verifica valores não NULL

-- Utiliza aliases para tornar os nomes das colunas mais legíveis
SELECT nome AS Clientes, cidade 
FROM Clientes;

-- Alias para tabela (abreviação de "Clientes" para "c")
SELECT c.nome AS clientes, c.cidade
FROM Clientes c;

-- Filtra os produtos com preços entre 50 e 800
SELECT p.preco, p.nome_produto 
FROM Produtos p 
WHERE p.preco BETWEEN 50 AND 800
ORDER BY preco;

-- Filtra produtos que NÃO estão no intervalo de preços entre 50 e 800
SELECT p.preco, p.nome_produto 
FROM Produtos p 
WHERE p.preco NOT BETWEEN 50 AND 800
ORDER BY preco;

-- Filtra produtos com preços específicos usando IN
SELECT preco, nome_produto 
FROM Produtos  
WHERE preco IN (1200, 800, 50)
ORDER BY preco DESC;

-- Filtra produtos que NÃO têm os preços especificados usando NOT IN
SELECT preco, nome_produto 
FROM Produtos  
WHERE preco NOT IN (1200, 800, 50)
ORDER BY preco DESC;

-- Realiza busca por padrões com LIKE:
-- 'A%' (começa com A), '%A' (termina com A), '%A%' (tem A em qualquer lugar), '_R%' (o segundo caractere é R)
SELECT nome 
FROM clientes 
WHERE nome LIKE 'A_%';  -- Nomes que começam com "A"

-- Compara padrões usando GLOB (expressões regulares glob)
SELECT nome
FROM clientes 
WHERE nome GLOB 'C*';  -- Nomes que começam com "C"

-- Subquery: Filtra os clientes que possuem pedidos com valor superior a 100
SELECT nome, cidade
FROM clientes
WHERE id_cliente IN (
    SELECT id_cliente
    FROM pedidos
    WHERE valor > 100
);

-- Subquery na cláusula SELECT: Calcula o total de vendas de cada cliente
SELECT nome, cidade,id_cliente, 
       (SELECT SUM(valor) 
        FROM pedidos
        WHERE pedidos.id_cliente = clientes.id_cliente) AS total
FROM Clientes;

