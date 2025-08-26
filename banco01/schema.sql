PRAGMA foreign_keys = on;
--TABELA USUARIO

CREATE TABLE usuario(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    senha TEXT NOT NULL
);

--TABELA CLIENTE

CREATE TABLE cliente(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    telefone TEXT NOT NULL,
    usuario_id INTEGER NOT NULL UNIQUE,
    FOREIGN KEY (usuario_id) REFERENCES usuario (id) ON DELETE CASCADE
);

--TABELA PRODUTO

CREATE TABLE produto(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    preco REAL NOT NULL CHECK (preco >= 0),
    descricao TEXT,
);

--TABELA VENDA
CREATE TABLE venda(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    data TEXT NOT NULL,
    total REAL NOT NULL CHECK (total >= 0),
    cliente_id INTEGER NOT NULL,
    usuario_id INTEGER NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES cliente (id) ON DELETE CASCADE,
    FOREIGN KEY (usuario_id) REFERENCES usuario (id) ON DELETE CASCADE
);

CREATE TABLE venda_produto(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    venda_id INTEGER NOT NULL,
    produto_id INTEGER NOT NULL,
    quantidade INTEGER NOT NULL CHECK (quantidade > 0),
    preco REAL NOT NULL CHECK (preco >= 0),
    FOREIGN KEY (venda_id) REFERENCES venda (id) ON DELETE CASCADE,
    FOREIGN KEY (produto_id) REFERENCES produto (id) ON DELETE CASCADE
);