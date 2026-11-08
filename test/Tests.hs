module Main where

import Domain
import Model
import SampleData

verificar :: String -> Bool -> IO ()
verificar descricao resultado =
  if resultado then putStrLn ("OK: " ++ descricao)
  else error ("FALHOU: " ++ descricao)

main :: IO ()
main = do
  verificar "catalogo com 4 livros" (contarLivros livrosExemplo == 4)
  verificar "catalogo vazio" (contarLivros [] == 0)
  verificar "livro existente" (procurarLivro 1 livrosExemplo /= Nothing)
  verificar "livro inexistente" (procurarLivro 99 livrosExemplo == Nothing)
  verificar "3 livros disponiveis" (contarLivros (livrosDisponiveis livrosExemplo) == 3)
  verificar "pesquisa sem distinguir maiusculas" (length (pesquisarPorTitulo "MAIAS" livrosExemplo) == 1)
  verificar "pesquisa por autor" (length (pesquisarPorAutor "Saramago" livrosExemplo) == 2)
  verificar "requisicao permitida" (podeRequisitar 1 1 utilizadoresExemplo livrosExemplo)
  verificar "livro indisponivel" (not (podeRequisitar 1 2 utilizadoresExemplo livrosExemplo))
  verificar "utilizador inexistente" (not (podeRequisitar 99 1 utilizadoresExemplo livrosExemplo))
  verificar "historico de requisicoes" (length (requisicoesDoUtilizador 1 requisicoesExemplo) == 1)
  putStrLn "Todos os testes passaram."
