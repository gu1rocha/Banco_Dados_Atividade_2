/* ITEM A: 
Crie o banco de dados, chamado “carros” e as tabelas marca e modelo. Lembrese de criar as chaves primárias como geradas automaticamente e a chave estrangeira entre a tabela Modelo e a tabela Marca.
*/
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

/* ITEM B:
Crie os comandos para realizar a inserção das 4 marcas e dos 4 modelosapresentados na tabela;
*/
INSERT INTO marca (nome,pais) 
    VALUES ('Volkswagen','Alemanha'),('Ford','EUA'),('Fiat','Itália'),('GM','EUA');
    
INSERT INTO modelo (nome,categoria,cor,codigo_marca) 
    VALUES ('Gol','Hatch','preto','1'),
    ('Palio','Hatch','vermelho','3'),
    ('Ecosport','SUV','azul','2'),
    ('Fox','Família','preto','1');

/* ITEM C:
Crie um comando para alterar a cor do carro Fox para cinza, usando sua chave primária.
*/
UPDATE modelo SET cor = 'cinza' WHERE codigo = 4;

/* ITEM D:
Crie uma consulta que seja capaz de exibir nome da marca, país e quantidade de carros daquela marca que a empresa possui.
*/
SELECT ma.nome, ma.pais, COUNT(mo.codigo_marca) AS qtd_carros 
FROM marca AS ma
LEFT JOIN modelo AS mo
ON ma.codigo = mo.codigo_marca
GROUP BY ma.nome;

/* ITEM E:
Crie um comando para excluir a marca GM, usando sua chave primária.
*/
DELETE FROM marca WHERE codigo = 4;
