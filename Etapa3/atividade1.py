
#Atividade 1: Processamento de Dados de Vendas com Pandas
#Carregar Dados: Crie uma função que leia o arquivo vendas.csv e retorne um DataFrame.
#Calcular Valor Total: Crie uma função que adicione uma nova coluna valor_total ao DataFrame, calculada como quantidade * preco_unitario.
#Filtrar Vendas: Crie uma função que filtre os registros onde o valor_total seja superior a R$500.
#Salvar Resultado: Crie uma função que salve o DataFrame filtrado em um novo arquivo CSV.

import pandas as pd


df_vendas_produto = pd.read_csv('dados.csv')
print("DataFrame lido de CSV:")
print(df_vendas_produto)


df_vendas_produto ['valor_total'] = df_vendas_produto['quantidade'] * df_vendas_produto['preco_unitario']
print("Dados com a coluna Valor total ")
print(df_vendas_produto)

df_filtro_vendas = df_vendas_produto[df_vendas_produto['valor_total'] > 500]
print("Vendas com valor total maior 500: ")
print(df_filtro_vendas)


df_filtro_vendas.to_csv('vendas_filtradas.csv', index=False)
print('Arquivo de vendas filtrado salvo')

#Em construção-testes unitarios.