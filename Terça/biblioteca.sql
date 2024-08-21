create database biblioteca;

use biblioteca;

create table Livro (
  id int auto_increment primary key,
  titulo varchar(220) not null,
  autor varchar(220) not null,
  genero varchar(100),
  ano_publicado int
);

create table Autor (
  id int auto_increment primary key,
  nome varchar(220) not null,
  nacionalidade varchar (220),
  data_nascimento date
);

create table Cliente(
   id int auto_increment primary key,
   nome varchar(220) not null,
   email varchar(220) unique not null,
   telefone varchar(20)
);

create table Emprestimo(
   id int auto_increment primary key,
   cliente_id int,
   livro_id int,
   data_emprestimo date,
   data_devolucao date,
   foreign key (cliente_id) references Cliente(id),
   foreign key (livro_id) references Livro(id)
);

create table Funcionario(
   id int auto_increment primary key,
   nome varchar(220) not null,
   cargo varchar(100),
   salario decimal(10,2) 
);

insert into Livro (titulo, autor, ano_publicado, genero) values
('A Revolução dos Bichos', 'George Orwell', 1945, 'Satira'),
('Quarto de Despejo', 'Carolina Maria de Jesus', 1960, 'biografia'),
('A Paixão Segundo G.H.', 'Clarice Lispector', 1964, 'Romance'),
('1984', 'George Orwell', 1949, 'Distopia'),
('Contos De Clarice Lispector', 'Clarice Lispector', 2006, 'ficção');

insert into Autor (nome, nacionalidade, data_nascimento) values
('Matt Haig', 'Britânico', '1975-08-03'),
('George Orwell', 'Britânico', '1903-06-25'),
('Jeff Kinney', 'Estadunidense', '1971-02-19'),
('Carolina Maria de Jesus', 'Brasileira', '1914-03-14'),
('Rachel de Queiroz', 'Brasileira', '1910-11-17');


insert into Cliente (nome, email, telefone) values
('Rita da Silva', 'rita.silva@example.com', '11111111111'),
('João Lucas', 'joaolucas@example.com', '2222222222'),
('Camila Medeiros', 'camila.medeiros@example.com', '33333333333'),
('Cauã Pereira', 'caua.pereira@example.com', '44444444444'),
('Iasmim Santos', 'iasmim.santos@example.com', '55555555555');

insert into Emprestimo (cliente_id, livro_id, data_emprestimo, data_devolucao) values
(5, 1, '2024-08-01', '2024-08-15'),
(4, 3, '2024-08-02', '2024-08-16'),
(3, 5, '2024-08-03', '2024-08-17'),
(1, 4, '2024-08-04', '2024-08-18'),
(2, 2, '2024-08-05', '2024-08-19');

insert into Funcionario (nome, cargo, salario) values
('Carlos Silva', 'Bibliotecário', 2300.00),
('Jane Andrade', 'Atendente', 1500.00),
('Fernando Maia', 'Gerente', 3200.00),
('Luisa Ribeiro', 'Atendente', 1900.00),
('João Pedro', 'Bibliotecário', 2700.00);

#mini desafio

select titulo, autor, ano_publicado from Livro;

select count(id) as total_livros from Livro;

update Cliente
set email = 'rita.silva@example.com'
where id = 1;





