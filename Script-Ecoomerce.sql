CREATE DATABASE ECOMMERCE;
USE ECOMMERCE;

 -- drop database ecommerce;


-- seção de criação de tabelas --
create table   clientes(
	idCliente int auto_increment primary key not null,
    Pname varchar(10),
    NomeInicialDoMeio char(3),
    Sobrenome varchar(20),
    CPF char(11) not null,
    endereço varchar(30),
    constraint unique_cpf_client unique(CPF)

    
);
-- alter table clientes auto_increment = 1;



create table produto(
	idProduto  int auto_increment primary key,
    Pname varchar(10) not null,
    classificação_kids bool default false,
    categorias ENUM("eletronico","vestimento","brinquedos","alimentos","moveis") not null,
    avaliação float default 0,
    size_dimensões varchar(10)
    
    
);

CREATE TABLE PAGAMENTOS(
	idCliente int,
	idPagamento int,
    tipo_pagamento ENUM("pix","boleto","cartao de credito"),
    limite_pagamento_avaliado float,
	primary key(idCliente,idPagamento,idtIMESTAMP),
    constraint pk_idCliente foreign key(idCliente) references clientes(idCliente)
    
  

 

);
SHOW TABLES;

-- criar tabelas de forma de pagamentos e conectar a tabela pagamentos  --

CREATE TABLE pedido(
	idPedido int auto_increment ,
    idCliente int,
    idPagamento int,
    primary key(idPedido,idCliente,idPagamento),
    pedidoStatus Enum("cancelado","confirmado","processado") default "processado",
    descrição varchar(255),
    frete float default 22,
    pagamentoDinheito bool default false,
    constraint chave_estrangeira_idCliente foreign key(idCliente) references clientes(idCliente)
		on update cascade

);
desc pedido;
select *  from pedido;


CREATE TABLE  ESTOQUE(

	idEstoque int auto_increment primary key,
    local varchar(255),
    Quantidade int default 0

);

CREATE TABLE VENDEDOR(
idVendedor int auto_increment primary key,
Razão_Social varchar(45),
Nome_Fantasia varchar(255),
localidade varchar(255),
CNPJ char(15) not null,
CPF char(9) not null default 0,
contato char(11) not null default 0,
constraint unico_CNPJ_vendedor unique(CNPJ),
constraint unico_CPF_vendedor unique(CPF)

);

CREATE TABLE  FORNECEDOR(
	idFornecedor int auto_increment primary key,
    Razão_Social varchar(255) not null,
    CNPJ char(15),
    contato  varchar(11) not null,
    constraint fornecedor_unico unique(CNPJ)
    
    

);

--- seção de criação de tabelas com relacionamentos ---
--- relacionamento produto com vendedor ---
Create Table produto_por_vendedor(
    idVendedor int,
    idProduto int ,
    quantidade int default 1,
	primary key(idVendedor,idProduto),
    constraint fk_produtos_por_vendedor foreign key(idVendedor) references Vendedor(idVendedor),
    constraint fk_produtos foreign key(idProduto) references produto(idProduto)
    
    
);

--- relação produto com pedido ---
Create table relação_produto_pedido(
	idProduto int,
    idPedido int,
    quantidade int default 1,
    status_pedido enum("disponivel","em estoque") default "disponivel",
    primary key(idProduto,idPedido),
    constraint fk_pedidos_por_produtos foreign key(idProduto)references Produto(idProduto),
    constraint fk_pedidos foreign key(idPedido)references pedido(idPedido)
    

);

--- relação produto com estoque ---
Create table produto_em_estoque(
idProduto int,
idEstoque int,
localização varchar(255) not null,
primary key(idProduto,idEstoque),
constraint fk_Produto foreign key (idProduto) references Produto(idProduto),
constraint fk_Estoque foreign key (idEstoque) references Estoque(idEstoque)



);
CREATE TABLE Disponibilizando_um_produto(
	idFornecedor int,
    idProduto int,
    quantidade int not null,
    primary key(idFornecedor,idProduto),
    constraint fk_DispnobilizandoProduto_Fornecedor foreign key(idFornecedor) references Fornecedor(idFornecedor),
    constraint fk_DispnobilizandoProduto_Produto foreign key(idProduto) references Produto(idProduto)
    
    
);
 show databases;-- 
 use information_schema;
 show tables;
desc referential_constraints;
select * from referential_constraints where CONSTRAINT_SCHEMA = "ecommerce";
 

-- Desafio dio --

create table pessoa_Fisica(
	idCPF int auto_increment,
    idCliente int,
    Nome varchar(30),
    idade int,
    CPF CHAR(11),
    primary key(idCPF,idCliente),
    constraint fk_pessoafisica_idCliente foreign key(idCliente) references clientes(idCliente)
    
    
    
    
    

);
CREATE TABLE pessoa_juridica(
idCNPJ int  auto_increment,
idCliente int,
CNPJ char(15),
Razão_Social varchar(35),
primary key(idCNPJ,idCliente),
constraint fk_pessoaJuridica_clientes foreign key(idCliente) references clientes(idCliente)





);
create table registro_transação(
idtIMESTAMP int auto_increment not null,
horario_atualizado timestamp,
idPagamento int,
idPix int,
idBoleto int,
idCartão_de_credito int,
primary key(idTIMESTAMP,idPix,idBoleto,idCartão_de_credito,idPagamento),
constraint fk_Timestamp_pix foreign key(idPix) references Pix(idPix),
constraint fk_Timestamp_boleto foreign key(idBoleto) references Boleto(idboleto),
constraint fk_Timestamp_cartao foreign key(idCartão_de_credito) references Cartao_de_credito(idCartão_de_credito),
constraint fk_Timestamp_pagamentos foreign key(idPagamento) references Pagamentos(idPagamento)
);


create table pix(
idPix int primary key auto_increment not null,
Valor float,
registro_transação timestamp

);

create table Boleto(
idBoleto int primary key auto_increment not null , 
valor float,
registro_transação timestamp


);
create table cartao_de_credito(
idCartão_de_credito int  primary key  auto_increment not null,
valor float,
registro_transação timestamp

)



