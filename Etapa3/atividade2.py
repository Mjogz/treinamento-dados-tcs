#Atividade 2: Processamento de Dados de Notas com Pandas
#Calcular Média: Crie uma função que calcule a média das notas para cada aluno.
#Identificar Aprovados: Crie uma função que identifique os alunos com média maior ou igual a 7.
#Gerar Relatório: Crie uma função que retorne um relatório com o nome do aluno, a média calculada e o status (Aprovado quando a nota for maior que 6, senão Reprovado).

import pandas as pd

notas = pd.read_csv('dados-notas.csv')
print("Notas:")
print(notas)


def calcular_media_notas(df):
    df['Media'] = (df['nota1'] + df['nota2'] + df['nota3']) / 3
    return df

def resultado_aprovacao(media):
    if media >= 7:
        return 'Aprovado'
    else:
        return 'Reprovado'

def gerar_relatorio(relatorio):
    relatorio = calcular_media_notas(relatorio)
    
    relatorio['Resultado'] = relatorio['Media'].apply(resultado_aprovacao)
    
    return relatorio[['aluno', 'Media', 'Resultado']]


relatorio = gerar_relatorio(notas)

print("\nRelatório dos Alunos com médias e resultados:")
print(relatorio)
