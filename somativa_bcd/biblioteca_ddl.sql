DROP DATABASE IF EXISTS BIBLIOTECA_SOM2;
CREATE DATABASE IF NOT EXISTS BIBLIOTECA_SOM2;
USE BIBLIOTECA_SOM2;

CREATE TABLE USUARIO (
    id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(120) NOT NULL UNIQUE,
    telefone VARCHAR(20),
    ativo BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE LIVRO (
    id_livro INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(150) NOT NULL,
    autor VARCHAR(120) NOT NULL,
    isbn CHAR(13) NOT NULL UNIQUE,
    ano_publicado INT,
    quantidade_disponivel INT DEFAULT 0 CHECK (quantidade_disponivel >= 0),
    editora VARCHAR(100)
);

CREATE TABLE EMPRESTIMO (
    id_emprestimo INT PRIMARY KEY AUTO_INCREMENT,
    data_emprestimo DATETIME DEFAULT CURRENT_TIMESTAMP,
    data_prevista DATE NOT NULL,
    data_devolucao DATE,
    status_emprestimo VARCHAR(20) NOT NULL DEFAULT 'ABERTO' CHECK (status_emprestimo IN ('ABERTO', 'DEVOLVIDO', 'ATRASADO')),
    id_usuario INT NOT NULL,
    id_livro INT NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES USUARIO(id_usuario),
    FOREIGN KEY (id_livro) REFERENCES LIVRO(id_livro)
);

ALTER TABLE LIVRO ADD editora VARCHAR(100);
