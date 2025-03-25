import pandas as pd

def carregar_dados(dados):
    df = pd.read_csv(dados)
    return df

def agregar_dados(df):
    df_agregado = df.groupby('categoria')['valor'].agg(soma_valor='sum', media_valor='mean').reset_index()
    return df_agregado


def salvar_parquet(df, dados):
    df.to_parquet(dados, index=False)

def carregar_parquet(dados):
    df = pd.read_parquet(dados)
    return df


df = carregar_dados('dados_agregacao.csv') 

df_agregado = agregar_dados(df)

salvar_parquet(df_agregado, 'dados.parquet')  

df_relatorio = carregar_parquet('dados.arquet') 
print(df_relatorio)