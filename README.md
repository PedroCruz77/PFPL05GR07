# Sistema de Gestao de Biblioteca — Fase 1

Projeto semestral da unidade curricular de Programacao Funcional, desenvolvido em Haskell.

## Objetivo

Modelar livros, utilizadores e requisicoes e implementar o nucleo funcional inicial de uma biblioteca. Nesta fase e possivel listar, pesquisar e consultar livros, identificar utilizadores e verificar se uma requisicao seria permitida. O registo e a devolucao de livros serao desenvolvidos nas fases seguintes.

## Requisitos

- GHC (compilador Haskell)
- Git para o controlo de versoes

## Execucao

A partir da raiz do projeto:

```bash
runghc -isrc app/Main.hs
```

Em alternativa, compilar e executar:

```bash
ghc -isrc -outputdir build -o biblioteca app/Main.hs
./biblioteca
```

## Testes

```bash
runghc -isrc test/Tests.hs
```

## Organizacao

- `src/Model.hs`: tipos e aliases do dominio.
- `src/Domain.hs`: funcoes puras de pesquisa, filtragem e validacao.
- `src/SampleData.hs`: dados de exemplo.
- `app/Main.hs`: demonstracao textual da fase 1.
- `test/Tests.hs`: testes basicos e casos limite.

## Conceitos de Programacao Funcional

- Tipos algebricos com `data` e records.
- Pattern matching e guards.
- Recursao explicita em `procurarLivro`, `procurarUtilizador` e `contarLivros`.
- Funcoes puras e assinaturas de tipos.
- Uso de `Maybe` para pesquisa sem resultados.
- Uso de `filter`, `map` e composicao funcional.
- Separacao entre a logica pura e o `IO` da demonstracao.

## Limites da Fase 1

A aplicacao apresenta uma demonstracao com dados fixos. Nao existe ainda menu interativo, persistencia em ficheiros nem alteracao efetiva de requisicoes. Estes elementos estao previstos para as fases 2 e 3.

## Git

Iniciar o repositorio e registar a primeira versao:

```bash
git init
git add .
git commit -m "Fase 1: modelacao e nucleo funcional da biblioteca"
```
