create database Cinema;
use Cinema;
-- drop database Cinema;

Create table Cliente(
id_cliente int primary key auto_increment,
nome varchar(100),
email varchar (200),
cpf varchar(20),
telefone varchar (20)
);

create table Funcionario(
id_funcionario int primary key auto_increment,
nome varchar(100),
cpf varchar(20)  not null unique,
cargo varchar(50),
data_admissao date,
salario decimal (10,2)
);

create table Genero(
id_genero int primary key auto_increment,
nome_genero varchar(30) not null
);

create table Produto(
id_produto int primary key auto_increment,
nome varchar(50),
categoria varchar (20),
quant_estoque int,
preco_unitario decimal (10,2)
);

create table Sala(
id_sala int primary key auto_increment,
tipo_sala varchar(20),
nome_sala varchar (15),
capacidade int
);

create table Filme(
id_filme int primary key auto_increment,
duracao_minutos int,
classificacao_indicativa varchar(15),
titulo varchar (100),
sinopse text,
fk_id_genero int not null,
foreign key (fk_id_genero) references Genero (id_genero)
);

create table Sessao(
id_sessao int primary key auto_increment,
valor_ingresso decimal(10,2),
data_hora_inicio datetime,
fk_id_filme int not null,
fk_id_sala int not null,
foreign key (fk_id_filme) references Filme (id_filme),
foreign key (fk_id_sala) references Sala (id_sala)
);

create table Assento(
id_assento int primary key auto_increment,
poltrona varchar (15),
status_poltrona varchar (20),
fk_id_sala int not null,
foreign key (fk_id_sala) references	Sala (id_sala)
);

create table Venda(
id_venda int primary key auto_increment,
forma_pagamento varchar (20),
valor_total decimal (10,2),
data_hora_venda datetime,
fk_id_cliente int,
fk_id_funcionario int not null,
foreign key (fk_id_cliente) references Cliente (id_cliente),
foreign key (fk_id_funcionario) references Funcionario (id_funcionario)
);

create table Ingresso(
id_ingresso int primary key auto_increment,
tipo_ingresso varchar(20),
valor_pago decimal (10,2),
fk_id_venda int not null,
fk_id_sessao int not null,
foreign key (fk_id_venda) references Venda (id_venda),
foreign key (fk_id_sessao) references Sessao (id_sessao)
);

create table Item_Venda(
id_item int primary key auto_increment,
quantidade int,
preco_unitario decimal (10,2),
subtotal decimal (10,2),
fk_id_produto int,
fk_id_venda int,
foreign key (fk_id_produto) references Produto (id_produto),
foreign key (fk_id_venda) references Venda (id_venda)
);







