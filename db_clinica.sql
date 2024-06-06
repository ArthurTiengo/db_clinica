USE db_senaBiblio;
 
CREATE TABLE paciente(
codPaciente INT AUTO_INCREMENT NOT NULL,
nome VARCHAR(150) NOT NULL,
cpf VARCHAR(11) NOT NULL UNIQUE ,
tipoLogradouro VARCHAR(50) NOT NULL,
nomeLogradouro VARCHAR(100) NOT NULL,
numero VARCHAR(5) NOT NULL,
complemento VARCHAR(50),
telefone VARCHAR(11) NOT NULL,
CONSTRAINT PRIMARY KEY(codPaciente)
);
 
CREATE TABLE dentista(
codDentista INT AUTO_INCREMENT NOT NULL,
nome VARCHAR(150) NOT NULL,
cro VARCHAR(8) NOT NULL UNIQUE,
especialidade VARCHAR(100) DEFAULT 'Geral' CHECK (especialidade='Ortodontia' OR especialidade='Geral' OR 
especialidade='Periodontia' OR especialidade='Implantodontia'),
telefone VARCHAR(11) NOT NULL,
celular VARCHAR(11) NOT NULL,
CONSTRAINT PRIMARY KEY(codDentista)
);
 
CREATE TABLE consulta(
codConsulta INT AUTO_INCREMENT NOT NULL,
dataConsulta DATE NOT NULL,
horaConsulta TIME NOT NULL,
tipoConsulta VARCHAR(100) NOT NULL,
codPaciente INT,
codDentista INT,
observacao VARCHAR(150),
CONSTRAINT PRIMARY KEY(codConsulta),
CONSTRAINT fk_consulta_paciente FOREIGN KEY (codPaciente) REFERENCES paciente(codPaciente),
CONSTRAINT fk_consulta_dentista FOREIGN KEY (codDentista) REFERENCES dentista(codDentista)
);


ALTER TABLE paciente ADD COLUMN cidade VARCHAR(50)/*exercicio=1*/
ALTER TABLE paciente ADD COLUMN ddd VARCHAR(3)
ALTER TABLE dentista ADD COLUMN ddd VARCHAR(3)

DROP TABLE paciente

SELECT * FROM paciente


/*exercicio=2*/
INSERT INTO paciente (nome,cpf,ddd,numero,cidade)
VALUES
('Arthur','5544433312','13','992133637','SãoVicente');
INSERT INTO paciente (nome,cpf,ddd,numero,cidade)
VALUES
('Renato','255443311','13','9999991235','Santos');
INSERT INTO paciente (nome,cpf,ddd,numero,cidade)
VALUES
('Kailany','35555555','13','12313231','SãoVicente');
INSERT INTO paciente (nome,cpf,ddd,numero,cidade)
VALUES
('Leticia','65555555','13','999191235','Santos');
INSERT INTO paciente (nome,cpf,ddd,numero,cidade)
VALUES
('Robson','85555555','13','979191235','Guarujá');
INSERT INTO paciente (nome,cpf,ddd,numero,cidade)
VALUES
('EdinhoSaudades','95555555','13','979191835','Santos');


SELECT * FROM dentista
/*exercicio=3*/
INSERT INTO dentista (nome,cro,especialidade,telefone)
VALUES 
('Dr.Henrique','122333sp','Ortodontia','992133637');
INSERT INTO dentista (nome,cro,especialidade,telefone)
VALUES 
('Dra.Luciana','212333sp','Geral','9993213134');
INSERT INTO dentista (nome,cro,especialidade,telefone)
VALUES 
('Dr.Fabio','232333sp','Periodontia','992154217');
INSERT INTO dentista (nome,cro,especialidade,telefone)
VALUES 
('Dra.Lucy','242333sp','Implantodontia','991254362');


SELECT * FROM paciente
SELECT * FROM consulta
/*exercicio=4*/
INSERT INTO consulta (tipoConsulta,codDentista,codPaciente,dataConsulta,horaConsulta)
VALUES 
('Avaliação','1','2','2005-12-25','12:35:00');
INSERT INTO consulta (tipoConsulta,codDentista,codPaciente,dataConsulta,horaConsulta)
VALUES 
('Avaliação','2','1','2006-09-13','12:35:00');
INSERT INTO consulta (tipoConsulta,codDentista,codPaciente,dataConsulta,horaConsulta)
VALUES 
('Avaliação','2','4','1997-10-21','00:35:00');
/*exercicio=5*/
UPDATE dentista SET especialidade='Geral',telefone='991984678'
WHERE codDentista='4'
/*exercicio=6*/
UPDATE consulta SET dataConsulta='1945-04-25',horaConsulta='01:23:00'
WHERE codPaciente='4'
/*exercicio=7*/
UPDATE consulta SET tipoConsulta='Tratamento' , observacao='Tratamento será realizado em 10 consultas. Prioridade: Moderada. Remédio aplicado: Ponstan, caso sinta dores'
WHERE codDentista='1'
/*exercicio=8*/
SELECT nome,telefone FROM paciente 
WHERE cidade='Santos'
GROUP BY nome
/*exercicio=9*/
SELECT dentista.nome,consulta.dataConsulta,paciente.nome,paciente.telefone FROM dentista
INNER JOIN consulta
ON dentista.codDentista = consulta.codDentista 
INNER JOIN paciente
ON consulta.codPaciente = paciente.codPaciente
/*exercicio=10*/
SELECT dentista.nome,consulta.dataConsulta,consulta.tipoConsulta FROM dentista
LEFT JOIN consulta
ON consulta.codDentista = dentista.codDentista
/*exercicio=11*/
SELECT especialidade,COUNT(dentista.nome) AS 'Quantidade de Dentistas'
FROM dentista
GROUP BY dentista.especialidade
/*exercicio=12*/
SELECT COUNT(codConsulta) AS 'Quant. Consultas' 
FROM consulta 
WHERE MONTH(dataConsulta)='04';
/*exercicio=13*/
SELECT tipoConsulta,COUNT(consulta.tipoConsulta) AS 'Quantidade de Consultas'
FROM consulta
GROUP BY consulta.tipoConsulta
/*exercicio 14*/
SELECT COUNT(paciente.codPaciente) AS 'Quantidade de Pacientes'
FROM paciente

SELECT * FROM dentista

/*exercicio 15*/
SELECT dentista.especialidade,dentista.nome,dentista.cro,consulta.dataConsulta,paciente.nome
FROM consulta
INNER JOIN dentista
ON dentista.codDentista = consulta.codDentista
INNER JOIN paciente
ON paciente.codPaciente = consulta.codPaciente
WHERE especialidade='implantodontia'
GROUP BY consulta.dataConsulta ASC 

/*exercicio 16*/
