PRAGMA foreign_keys = ON;

CREATE TABLE Participante(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    telefone TEXT
);

CREATE TABLE Evento(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    descricao TEXT,
    local TEXT NOT NULL,
    data TEXT NOT NULL
);

CREATE TABLE Inscricao(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_evento INTEGER NOT NULL,
    id_participante INTEGER NOT NULL,
    data_inscricao TEXT,
    status TEXT,
    FOREIGN KEY(id_participante) REFERENCES Participante(id) ON DELETE CASCADE,
    FOREIGN KEY(id_evento) REFERENCES Evento(id) ON DELETE CASCADE
);

CREATE TABLE Pagamento(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_inscricao INTEGER UNIQUE,
    valor REAL,
    data_pagamento TEXT,
    status TEXT,
    FOREIGN KEY(id_inscricao) REFERENCES Inscricao(id) ON DELETE CASCADE
);



-- Inserir Participante
INSERT INTO Participante (nome, email, telefone) VALUES ('Nikola Kovac','niko@gmail.com','(34)1224-5278');
INSERT INTO Participante (nome, email, telefone) VALUES ('Ilya Osipov','monesy@gmail.com','(34)1214-5128');
INSERT INTO Participante (nome, email, telefone) VALUES ('Gabriel Andrade de Toledo','fallen@gmail.com','(34)1234-5690');

-- Inserir Evento
INSERT INTO Evento (nome, descricao, local, data) VALUES ('Introdução a Counter Strike', 'Um seminário sobre as mecânicas e estratégias do jogo Counter Strike', 'Centro de Convenções UNIPAM', '2025-10-09');
INSERT INTO Evento (nome, descricao, local, data) VALUES ('Imersao ao Jogo', 'Uma imersão prática nas mecânicas de jogo', 'Auditorio bloco N - UNIPAM', '2025-10-05');

INSERT INTO Inscricao (id_evento, id_participante, data_inscricao, status) VALUES (1, 1, '2025-10-01', 'confirmada');
INSERT INTO Inscricao (id_evento, id_participante, data_inscricao, status) VALUES (1, 2, '2025-10-04', 'confirmada');
INSERT INTO Inscricao (id_evento, id_participante, data_inscricao, status) VALUES (2, 3, '2025-09-27', 'confirmada');
INSERT INTO Inscricao (id_evento, id_participante, data_inscricao, status) VALUES (2, 1, '2025-10-02', 'confirmada');

-- Inserir Pagamentos
INSERT INTO Pagamento (id_inscricao, valor, data_pagamento, status) VALUES (1, 100.00, '2025-09-05', 'pago');
INSERT INTO Pagamento (id_inscricao, valor, data_pagamento, status) VALUES (2, 100.00, '2025-09-05', 'pago');
INSERT INTO Pagamento (id_inscricao, valor, data_pagamento, status) VALUES (3, 150.00, '2025-09-06', 'pendente');
INSERT INTO Pagamento (id_inscricao, valor, data_pagamento, status) VALUES (4, 150.00, '2025-09-06', 'pago');
