module Domain
  ( procurarLivro, procurarUtilizador, livrosDisponiveis
  , pesquisarPorTitulo, pesquisarPorAutor, contarLivros
  , podeRequisitar, requisicoesDoUtilizador
  ) where

import Data.Char (toLower)
import Data.List (isInfixOf)
import Model

-- Pesquisa recursiva com pattern matching.
procurarLivro :: IdLivro -> Biblioteca -> Maybe Livro
procurarLivro _ [] = Nothing
procurarLivro identificador (livro:restantes)
  | idLivro livro == identificador = Just livro
  | otherwise = procurarLivro identificador restantes

procurarUtilizador :: IdUtilizador -> Utilizadores -> Maybe Utilizador
procurarUtilizador _ [] = Nothing
procurarUtilizador identificador (utilizador:restantes)
  | idUtilizador utilizador == identificador = Just utilizador
  | otherwise = procurarUtilizador identificador restantes

-- Recursao explicita para contar livros.
contarLivros :: Biblioteca -> Int
contarLivros [] = 0
contarLivros (_:restantes) = 1 + contarLivros restantes

livrosDisponiveis :: Biblioteca -> Biblioteca
livrosDisponiveis = filter disponivel

normalizar :: String -> String
normalizar = map toLower

pesquisarPorTitulo :: String -> Biblioteca -> Biblioteca
pesquisarPorTitulo termo = filter (isInfixOf (normalizar termo) . normalizar . titulo)

pesquisarPorAutor :: String -> Biblioteca -> Biblioteca
pesquisarPorAutor termo = filter (isInfixOf (normalizar termo) . normalizar . autor)

-- Confirma que o utilizador existe e o livro esta disponivel.
-- Ainda nao altera o estado: o registo da requisicao fica para a fase 2.
podeRequisitar :: IdUtilizador -> IdLivro -> Utilizadores -> Biblioteca -> Bool
podeRequisitar uid lid utilizadores biblioteca =
  case (procurarUtilizador uid utilizadores, procurarLivro lid biblioteca) of
    (Just _, Just livro) -> disponivel livro
    _ -> False

requisicoesDoUtilizador :: IdUtilizador -> Requisicoes -> Requisicoes
requisicoesDoUtilizador uid = filter (\r -> utilizadorId r == uid)
