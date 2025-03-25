#Atividade 3: Integração Simulada com API e Processamento com Pandas
#Tarefas: Converter para DataFrame: Crie uma função que leia o arquivo usuarios.json e converta os dados para um DataFrame.
#Filtrar Usuários: Crie uma função que filtre os usuários com idade maior que 18 anos.
#Ordenar Usuários: Crie uma função que ordene os usuários por idade.
#Gerar Relatório: Crie uma função que retorne um relatório final em formato de lista de dicionários com os dados processados.

import pandas as pd

def converterDataFrame():
 
    df_json = pd.read_json('usuarios.json')
    df_json = pd.json_normalize(df_json['usuarios'])
    print("DataFrame lido de JSON:")
    print(df_json)
    return df_json


def filtroIdade(df_json):
    idade = df_json[df_json['idade'] >= 18]
    print("Usuários com idade >= 18:")
    print(idade)
    return idade  

def ordenarUsuáriosIdade(df_json):
    ordenar = df_json.sort_values(by='idade')
    print("Usuários Ordenados por  idade:")
    print(ordenar)
    return ordenar  

def relatorioFinal(df_json):
    lista_usuarios = df.to_dict(orient='records')
    print("Usuários convertido para lista de dicionários:")
    print(lista_usuarios) 


df = converterDataFrame() 
df_idade = filtroIdade(df) 
df_ordenar= ordenarUsuáriosIdade(df) 
df_relatorio = relatorioFinal(df)
