CREATE DATABASE fic;

USE FIC;

CREATE TABLE marca (
	codigo INT NOT NULL PRIMARY KEY AUTO_INCREMENT, 
	nome VARCHAR (200) NOT NULL,
	pais VARCHAR (20) NOT NULL
);

CREATE TABLE modelo (
	codigo INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR (200) NOT NULL,
	categoria VARCHAR (200) NOT NULL,
	cor VARCHAR (50) NOT NULL,
	codigo_marca INT NOT NULL,
    CONSTRAINT FK_marca FOREIGN KEY (codigo_marca) REFERENCES marca (codigo)
);
	
INSERT INTO marca ( nome, pais) VALUES ('Volkswagen', 'Alemanha'), ('Ford', 'EUA'), ('Fiat', 'Itália'), ('GM', 'EUA');
SELECT * from marca;

INSERT INTO modelo (nome, categoria, cor, codigo_marca) VALUE ('Gol', 'Hatch', 'preto',1 ), 	('Palio', 'Hatch', 'vermelho', 3), 	('Ecosport','SUV','azul', 2), ('Fox','Familia', 'preto', 1);
SELECT * from modelo;

UPDATE modelo SET cor = 'prata' WHERE codigo = 4;

SELECT c.nome, pais, COUNT(v.codigo_marca) AS qtd_carros
	FROM marca AS c
	LEFT JOIN modelo AS v
	ON v.codigo_marca = c.codigo
	GROUP BY c.nome;
	
DELETE FROM marca WHERE codigo = 4;