<<<<<<< HEAD
# Atividade 1 - Listar os nomes e cidades de todos os clientes em uma só consulta
SELECT
	nome, cidade
FROM
Clientes 

#Atividade 2 - Listar os pedidos com valor acima de R$100
SELECT 
* 
FROM 
	pedidos
where 
	valor >=100
	
#Atividade 3 Listar os pedidos ordenados pelo valor (decrescente)
SELECT 
* 
FROM 
	pedidos
ORDER BY valor desc


#Atividade 4- Listar os 3 primeiros produtos cadastrados
SELECT 
* 
FROM
	pedidos
ORDER BY id_pedido  ASC
LIMIT 3

# Atividade 5 - Listar o total de valor gasto por cada cliente em pedidos.
SELECT Pedidos.id_cliente, SUM(valor) AS total_gasto_por_cliente
FROM Pedidos
GROUP BY Pedidos.id_cliente

#Atividade 6 - Encontrar o cliente com o maior valor gasto
SELECT Pedidos.id_cliente, SUM(valor) AS maior_gasto_cliente
FROM Pedidos
GROUP BY Pedidos.id_cliente 
order by maior_gasto_cliente DESC
=======
# Atividade 1 - Listar os nomes e cidades de todos os clientes em uma só consulta
SELECT	nome, cidade FROM Clientes 

#Atividade 2 - Listar os pedidos com valor acima de R$100
SELECT * FROM pedidos
where valor >=100
	
#Atividade 3 Listar os pedidos ordenados pelo valor (decrescente)
SELECT * FROM pedidos
ORDER BY valor desc


#Atividade 4- Listar os 3 primeiros produtos cadastrados
SELECT * FROM pedidos 
ORDER BY id_pedido  ASC
LIMIT 3

# Atividade 5 - Listar o total de valor gasto por cada cliente em pedidos.
SELECT 
    Clientes.nome, 
    Pedidos.id_cliente, 
    SUM(Pedidos.valor) AS total_gasto_por_cliente
FROM Pedidos
INNER JOIN Clientes ON Pedidos.id_cliente = Clientes.id_cliente
GROUP BY Clientes.nome, Pedidos.id_cliente;


#Atividade 6 - Encontrar o cliente com o maior valor gasto
SELECT Pedidos.id_cliente, SUM(valor) AS maior_gasto_cliente
FROM Pedidos
GROUP BY Pedidos.id_cliente 
order by maior_gasto_cliente DESC

# Atividade 7 - Utilizar CTE para calcular o total de vendas por produto
WITH TotalVendasPorProduto AS (
    SELECT 
        produtos.id_produto,
        produtos.nome_produto,
        SUM(ItensPedido.quantidade * produtos.preco) AS total_vendas
    FROM pedidos
    JOIN ItensPedido ON pedidos.id_pedido = ItensPedido.id_pedido
    JOIN produtos ON ItensPedido.id_produto = produtos.id_produto
    GROUP BY produtos.id_produto, produtos.nome_produto
)
SELECT 
    tp.nome_produto,
    tp.total_vendas
FROM TotalVendasPorProduto tp
ORDER BY tp.total_vendas ASC;



# Atividade 8 - Listar todos os produtos comprados por cada cliente
SELECT 
    p.nome_produto, 
    c.nome
FROM Pedidos pd
INNER JOIN ItensPedido ip ON pd.id_pedido = ip.id_pedido
INNER JOIN Produtos p ON ip.id_produto = p.id_produto
INNER JOIN Clientes c ON pd.id_cliente = c.id_cliente
ORDER BY c.id_cliente;

# Atividade 9 - Ranquear clientes pelo valor total gasto começando pelo rank 1 para o maior valor.
SELECT
    c.id_cliente,
    c.nome,
    SUM(p.valor ) AS total_gasto,
    RANK() OVER (ORDER BY SUM(p.valor) DESC) AS rank
FROM clientes c
JOIN pedidos p ON c.id_cliente = p.id_cliente
GROUP BY c.id_cliente, c.nome
ORDER BY total_gasto DESC;

# Atividade 10 - Número de pedidos por cliente, considerando apenas aqueles com mais de 1 pedido
SELECT 
    c.nome AS cliente,
    COUNT(p.id_pedido) AS numero_de_pedidos
FROM clientes c
JOIN pedidos p ON c.id_cliente = p.id_cliente
GROUP BY c.id_cliente, c.nome
HAVING COUNT(p.id_pedido) > 1;


# Atividade 11 - Calcular para cada cliente a quantidade de dias entre um pedido e o pedido imediatamente anterior
em construção...

# Atividade 12 - Crie uma consulta que retorne um relatório contedo as seguintes colunas (obs: use o padrão que preferir para nomear as colunas):
em construção...
>>>>>>> b8305bc07aff652cb4675cb58b01ecfcbeee2744
