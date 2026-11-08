module SampleData where

import Model

livrosExemplo :: Biblioteca
livrosExemplo =
  [ Livro 1 "Os Maias" "Eca de Queiros" 1888 True
  , Livro 2 "Ensaio sobre a Cegueira" "Jose Saramago" 1995 False
  , Livro 3 "A Cidade e as Serras" "Eca de Queiros" 1901 True
  , Livro 4 "Memorial do Convento" "Jose Saramago" 1982 True
  ]

utilizadoresExemplo :: Utilizadores
utilizadoresExemplo =
  [ Utilizador 1 "Ana Silva"
  , Utilizador 2 "Pedro Costa"
  ]

requisicoesExemplo :: Requisicoes
requisicoesExemplo =
  [ Requisicao 1 2 1 True ]
