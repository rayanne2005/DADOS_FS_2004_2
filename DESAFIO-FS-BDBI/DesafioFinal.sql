CREATE DATABASE Gestao_Consultorio_Medico;

USE Gestao_Consultorio_Medico;

CREATE TABLE Especialidade (
    especialidade_id INT PRIMARY KEY,
    nome_especialidade VARCHAR(50)
);

CREATE TABLE Paciente (
    paciente_id INT PRIMARY KEY,
    nome VARCHAR(100),
    idade INT,
    telefone VARCHAR(20),
    cpf VARCHAR(14) UNIQUE
);

CREATE TABLE Medico (
    medico_id INT PRIMARY KEY,
    nome_medico VARCHAR(100),
    especialidade_id INT,
    cpf VARCHAR(14) UNIQUE,
    FOREIGN KEY (especialidade_id) REFERENCES Especialidade(especialidade_id)
);

CREATE TABLE Consulta (
    consulta_id INT PRIMARY KEY,
    paciente_id INT,
    medico_id INT,
    data_consulta DATE,
    FOREIGN KEY (paciente_id) REFERENCES Paciente(paciente_id),
    FOREIGN KEY (medico_id) REFERENCES Medico(medico_id)
);

CREATE TABLE Receita (
    receita_id INT PRIMARY KEY,
    consulta_id INT,
    descricao_receita TEXT,
    FOREIGN KEY (consulta_id) REFERENCES Consulta(consulta_id)
);

CREATE TABLE Pagamento (
    pagamento_id INT PRIMARY KEY,
    consulta_id INT,
    valor_pago DECIMAL(10, 2),
    metodo_pagamento VARCHAR(50),
    FOREIGN KEY (consulta_id) REFERENCES Consulta(consulta_id)
);

CREATE TABLE Exame (
    exame_id INT PRIMARY KEY,
    paciente_id INT,
    nome_exame VARCHAR(100),
    data_exame DATE,
    FOREIGN KEY (paciente_id) REFERENCES Paciente(paciente_id)
);

CREATE TABLE Clinica (
    clinica_id INT PRIMARY KEY,
    nome_clinica VARCHAR(100)
);

CREATE TABLE Medico_Clinica (
    medico_id INT,
    clinica_id INT,
    PRIMARY KEY (medico_id, clinica_id),
    FOREIGN KEY (medico_id) REFERENCES Medico(medico_id),
    FOREIGN KEY (clinica_id) REFERENCES Clinica(clinica_id)
);

CREATE TABLE Tratamento (
    tratamento_id INT PRIMARY KEY,
    paciente_id INT,
    descricao_tratamento TEXT,
    inicio_tratamento DATE,
    FOREIGN KEY (paciente_id) REFERENCES Paciente(paciente_id)
);

INSERT INTO Especialidade (especialidade_id, nome_especialidade) VALUES
(1, 'Neurologista'),
(2, 'Cardiologista'),
(3, 'Dermatologista'),
(4, 'Hematologista'),
(5, 'Endocrinologista');

INSERT INTO Paciente (paciente_id, nome, idade, telefone, cpf) VALUES
(5, 'Matheus Lima', 36, '22222222', '999.111.888-11'),
(6, 'Fábio Silva', 50, '33333333', '222.333.444-22'),
(7, 'Maria Júlia', 18, '44444444', '999.222.555-66'),
(8, 'João Silva', 16, '55555555', '222.999.777-11'),
(9, 'Ana Silva', 22, '66666666', '222.222.333-88');

INSERT INTO Medico (medico_id, nome_medico, especialidade_id, cpf) VALUES
(13, 'Dr. Camila Barros', 1, '222.888.222-55'),
(16, 'Dr. Clara Silva', 2, '333.888.222-55'),
(14, 'Dr. Bianca Madeiros', 3, '444.888.222-55'),
(12, 'Dr. Nilson Mendes', 4, '555.888.222-55'),
(18, 'Dr. Lucas Emanuel', 5, '666.888.222-55');

INSERT INTO Consulta (consulta_id, paciente_id, medico_id, data_consulta) VALUES
(1, 5, 13, '2024-08-22'),
(2, 6, 16, '2024-08-23'),
(3, 7, 14, '2024-08-24'),
(4, 8, 12, '2024-08-25'),
(5, 9, 18, '2024-08-26');

INSERT INTO Receita (receita_id, consulta_id, descricao_receita) VALUES
(1, 1, 'Tomar 1 comprimido de pasalix por dia'),
(2, 2, 'Tomar 1 comprimido de amiodarona por dia'),
(3, 3, 'Aplicar pomada antibiótica 3 vezes ao dia'),
(4, 4, 'Iniciar tratamento com anti-inflamatórios'),
(5, 5, 'Uso de pomada para feridas');

INSERT INTO Pagamento (pagamento_id, consulta_id, valor_pago, metodo_pagamento) VALUES
(1, 1, 200.00, 'Cartão de Crédito'),
(2, 2, 150.00, 'Boleto'),
(3, 3, 180.00, 'Dinheiro'),
(4, 4, 250.00, 'Transferência Bancária'),
(5, 5, 300.00, 'Pix');

INSERT INTO Exame (exame_id, paciente_id, nome_exame, data_exame) VALUES
(1, 5, 'Tomografia', '2024-08-22'),
(2, 6, 'Eletrocardiograma', '2024-08-21'),
(3, 7, 'Ressonância Magnética', '2024-08-23'),
(4, 8, 'Exame de Sangue', '2024-08-24'),
(5, 9, 'Ultrassonografia', '2024-08-25');

INSERT INTO Clinica (clinica_id, nome_clinica) VALUES
(1, 'Clínica Saúde'),
(2, 'Clínica do Coração'),
(3, 'Clínica de Dermatologia'),
(4, 'Clínica de Hematologia'),
(5, 'Clínica de Endocrinologia');

INSERT INTO Medico_Clinica (medico_id, clinica_id) VALUES
(13, 1),
(16, 2),
(14, 3),
(12, 4),
(18, 5);

INSERT INTO Tratamento (tratamento_id, paciente_id, descricao_tratamento, inicio_tratamento) VALUES
(1, 5, 'Tratamento para enxaqueca', '2024-08-22'),
(2, 6, 'Tratamento para hipertensão', '2024-08-23'),
(3, 7, 'Tratamento para diabetes tipo 2', '2024-08-24'),
(4, 8, 'Tratamento para anemia', '2024-08-25'),
(5, 9, 'Tratamento para gastrite', '2024-08-26');

SELECT * FROM Especialidade;
SELECT * FROM Paciente;
SELECT * FROM Medico;
SELECT * FROM Consulta;
SELECT * FROM Receita;
SELECT * FROM Pagamento;
SELECT * FROM Exame;
SELECT * FROM Clinica;
SELECT * FROM Medico_Clinica;
SELECT * FROM Tratamento;

