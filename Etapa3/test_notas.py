import pytest
import pandas as pd

from atividade2 import calcular_media_notas, resultado_aprovacao, gerar_relatorio

def dados_alunos():
    return pd.read_csv('dados-notas.csv')  


def test_carregar_dados():
    df = dados_alunos()
    assert df.shape[0] > 0  
    assert 'aluno' in df.columns  
    assert 'nota1' in df.columns  
    assert 'nota2' in df.columns  
    assert 'nota3' in df.columns  

def test_valida_alunos():
    df = dados_alunos()
    alunos = df['aluno'].tolist()  
    alunos_esperados = ['Ana', 'Bruno', 'Carlos', 'Daniela']
    for aluno in alunos_esperados:
        assert aluno in alunos
