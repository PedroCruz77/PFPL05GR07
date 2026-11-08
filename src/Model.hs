module Model where

type IdLivro = Int
type IdUtilizador = Int

data Livro = Livro
  { idLivro :: IdLivro
  , titulo :: String
  , autor :: String
  , anoPublicacao :: Int
  , disponivel :: Bool
  } deriving (Show, Eq)

data Utilizador = Utilizador
  { idUtilizador :: IdUtilizador
  , nome :: String
  } deriving (Show, Eq)

data Requisicao = Requisicao
  { idRequisicao :: Int
  , livroId :: IdLivro
  , utilizadorId :: IdUtilizador
  , ativa :: Bool
  } deriving (Show, Eq)

type Biblioteca = [Livro]
type Utilizadores = [Utilizador]
type Requisicoes = [Requisicao]
