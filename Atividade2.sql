/* ITEM A*/
CREATE DATABASE carros;
USE carros;
CREATE TABLE marca(
    codigo INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    pais VARCHAR(50) NOT NULL
);

CREATE TABLE modelo(
    codigo INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    cor VARCHAR(50) NOT NULL,
    codigo_marca INT NOT NULL,
    CONSTRAINT FK_marca FOREIGN KEY (codigo_marca) REFERENCES marca (codigo)
);

/* ITEM B*/
INSERT INTO marca (nome,pais) 
    VALUES ('Volkswagen','Alemanha'),('Ford','EUA'),('Fiat','Itália'),('GM','EUA');
    
INSERT INTO modelo (nome,categoria,cor,codigo_marca) 
    VALUES ('Gol','Hatch','preto','1'),
    ('Palio','Hatch','vermelho','3'),
    ('Ecosport','SUV','azul','2'),
    ('Fox','Família','preto','1');

/* ITEM C*/
UPDATE modelo SET cor = 'cinza' WHERE codigo = 4;

/* ITEM D*/
SELECT ma.nome, ma.pais, COUNT(mo.codigo_marca) AS qtd_carros 
FROM marca AS ma
LEFT JOIN modelo AS mo
ON ma.codigo = mo.codigo_marca
GROUP BY ma.nome;

/* ITEM E*/
DELETE FROM marca WHERE codigo = 4;