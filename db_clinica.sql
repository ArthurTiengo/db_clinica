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
especialidade VARCHAR(100) DEFAULT 'Geral' CHECK (especialidade='Ortodontia' OR 'Geral' OR 
'Periodontia' OR 'Implantodontia'),
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




