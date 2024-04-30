# Implementação do Código de Huffman em MATLAB

Este repositório contém uma implementação do algoritmo de compressão de dados de Huffman em MATLAB. O código de Huffman é um método popular para compressão de dados _lossless_, baseado em frequências de ocorrência de caracteres para construir o menor caminho de bits possível para cada caractere.

## Descrição

O projeto inclui scripts MATLAB que permitem codificar e decodificar arquivos de texto usando o código de Huffman. O objetivo é demonstrar a eficiência da compressão de dados sem perda, utilizando uma estrutura de árvore binária.

## Requisitos

Para executar este projeto, você precisará do seguinte:

- MATLAB (MATLAB R2020a ou superior)
- Acesso a arquivos de texto para testar a compressão e descompressão

## Instalação

```bash
$git clone https://github.com/bernardogoltz/huffman-coding
```

## Execução 

Após a árvore binária gerar o dicionário que estabelece a relação entre símbolos e frequências no arquivo de texto, geramos o dicionário que estabelece a relação entre símbolos e seus códigos, dessa forma é possível codificar o texto e, naturalmente, acessar seu conteúdo original. 

- ### Relação _símbolo_ == _Código Binário_:
```
   .
   .
   .
   a == 0  1  1  1
   b == 1  1  0  0  1  0  0
   c == 1  0  0  0  1  1
   d == 1  0  0  1  1
   e == 1  1  1  0
   f == 0  1  0  1  1  1
   g == 1  0  1  0  1  1
   h == 0  1  0  0
   i == 1  1  0  1  1
   j == 1  0  0  0  1  0  1  0  1  1
   k == 1  0  0  0  1  0  0
   l == 1  0  0  1  0
   m == 0  1  0  1  1  0
   .
   .
   .
```


- ###  Resultado da codificação
  Texto original representado pelos códigos gerados pela árvore de Huffman:

  ![alt text](https://raw.githubusercontent.com/bernardogoltz/huffman-coding/main/img/image-1.png)

- ### Resultado da decodificação
  ![alt text](https://raw.githubusercontent.com/bernardogoltz/huffman-coding/main/img/image.png)
