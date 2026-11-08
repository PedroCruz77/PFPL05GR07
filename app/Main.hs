module Main where

import Domain
import Model
import SampleData

mostrarLivro :: Livro -> IO ()
mostrarLivro livro = putStrLn $
  show (idLivro livro) ++ " | " ++ titulo livro ++ " | " ++ autor livro ++
  " | " ++ if disponivel livro then "Disponivel" else "Indisponivel"

main :: IO ()
main = do
  putStrLn "=== SISTEMA DE GESTAO DE BIBLIOTECA - FASE 1 ==="
  putStrLn "Catalogo de livros:"
  mapM_ mostrarLivro livrosExemplo
  putStrLn ("\nTotal de livros: " ++ show (contarLivros livrosExemplo))
  putStrLn "\nLivros disponiveis:"
  mapM_ mostrarLivro (livrosDisponiveis livrosExemplo)
  putStrLn "\nPesquisa pelo titulo 'maias':"
  mapM_ mostrarLivro (pesquisarPorTitulo "maias" livrosExemplo)
  putStrLn "\nPode o utilizador 1 requisitar o livro 1?"
  print (podeRequisitar 1 1 utilizadoresExemplo livrosExemplo)
  putStrLn "\nPode o utilizador 1 requisitar o livro 2?"
  print (podeRequisitar 1 2 utilizadoresExemplo livrosExemplo)
  putStrLn "\nRequisicoes do utilizador 1:"
  print (requisicoesDoUtilizador 1 requisicoesExemplo)
