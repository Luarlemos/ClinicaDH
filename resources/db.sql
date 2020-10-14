CREATE SCHEMA clinicaDH;
USE clinicaDH;

CREATE TABLE paciente(
	id_paciente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(200) NOT NULL,
    endereco VARCHAR(255),
    data_nascimento DATE,
    telefone VARCHAR(15),
    data_primeira_consulta DATE,
    email VARCHAR(100),
    peso FLOAT,
    altura INT,
    cpf VARCHAR(15)
)ENGINE = InnoDB;

CREATE TABLE consulta(
	id_consulta INT AUTO_INCREMENT PRIMARY KEY,
    data_consulta DATE,
    valor DECIMAL(10,2),
    descricao VARCHAR(255),
    medico VARCHAR(200),
    fk_id_paciente INT NOT NULL,
    FOREIGN KEY (fk_id_paciente) REFERENCES paciente(id_paciente)    
)ENGINE = InnoDB;

CREATE TABLE receita(
	id_receita INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(255),
    tempo INT,
    dosagem VARCHAR(10),
    fk_id_consulta INT NOT NULL,
    FOREIGN KEY (fk_id_consulta) REFERENCES consulta(id_consulta)
)ENGINE = InnoDB;

CREATE TABLE prontuario(
	id_prontuario INT AUTO_INCREMENT PRIMARY KEY,
    data_prontuario DATE,
    fk_id_paciente INT NOT NULL,
    fk_id_consulta INT NOT NULL,
    FOREIGN KEY (fk_id_paciente) REFERENCES paciente(id_paciente),
    FOREIGN KEY (fk_id_consulta) REFERENCES consulta(id_consulta)
)ENGINE = InnoDB;