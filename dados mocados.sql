use ecommerce;
show tables;
desc clientes;

insert into clientes(Pname,NomeInicialDoMeio,Sobrenome,CPF,endereço) values('Maria','M','silva',123456789,'rua silva de prata 29 ,carangola ,cidade das flores');
insert into clientes(Pname,NomeInicialDoMeio,Sobrenome,CPF,endereço) values('Matheus','O','Pimentel',5698356316,'rua silva de casca ');
insert into clientes(Pname,NomeInicialDoMeio,Sobrenome,CPF,endereço) values('Ricardo','F','Silva',5698356316,'rua silva de casca ');
insert into clientes(Pname,NomeInicialDoMeio,Sobrenome,CPF,endereço) values('Julia','S','Franca',89143646161,'rua silva de casca ');
insert into clientes(Pname,NomeInicialDoMeio,Sobrenome,CPF,endereço) values('Roberta','G','Assis',646116132,'rua silva de casca ');
insert into clientes(Pname,NomeInicialDoMeio,Sobrenome,CPF,endereço) values('Isabela','M','Cruz',5296467216,'rua silva de casca ');
 select * from Clientes;
 
 
 insert into produto(Pname,classificação_kids,categorias,avaliação,size_dimensões) values('fones',false,'eletronico','4',null),
 ('barbie',true,'brinquedos','3',null),
 ('jeans',true,'vestimento','5',null);
 select * from produto;
 
  -- delete from pedido where  idPedido in( 1,2,3,4,5,6,7,8,9,10,11,12,13);
 insert into Pedido(pedidoStatus,Descrição,frete,pagamentoDinheito)Values(default,'compra via aplicativo',null,1),
 (default,'compra in loco',50,0),
 ('confirmado','compra por terceiros',160,0);
 insert into pedido(idCliente)values(6);
 insert into Pedido(idPedido,pedidoStatus,Descrição,frete,pagamentoDinheito)Values('entregue','compra por terceiros',190,0);
  select * from Pedido;
  --  delete from relação_produto_pedido where  idPedido in( 1,2,3);
 insert into relação_produto_pedido(idPedido,idProduto,quantidade,status_pedido) values(1,1,2,default),
 (2,1,1,default),
 (3,2,1,default);
 select * from relação_produto_pedido;
 
 insert into Estoque(local,quantidade) values('Rio de Janeiro',1000),
 ('viamao',2500),
 ('Porto Alegre',10000);
  select * from Estoque;
  
  insert into produto_em_estoque(idProduto,idEstoque,localização) values(1,2,"RJ");
  insert into produto_em_estoque(idProduto,idEstoque,localização) values(2,1,"RJ");
  insert into produto_em_estoque(idProduto,idEstoque,localização) values(3,1,"RS");

  SELECT * FROM produto_em_estoque;
  
  insert into Fornecedor(Razão_Social,CNPJ,contato)values('almeidade e filhos',123456789123456,'21985474'),
  ('douglasltda','628310154789456','56234789');
    SELECT * FROM Fornecedor;


insert into Disponibilizando_um_produto(idFornecedor,idProduto,quantidade) values(1,1,500),
(1,2,400);    
select * from Disponibilizando_um_produto;

insert into  vendedor(Razão_Social,Nome_Fantasia,localidade,CNPJ,CPF,contato) values('tech eletronics',null,'Rio de Janeiro',123456789456321,0,219946287);
select * from vendedor;
select* from pedido;


select count(*) Disponibilizando_um_produto;
select * from produto_por_vendedor;


select * from clientes c , pedido o where c.idCliente = o.idPedido;

select Pname,Sobrenome,idPedido,pedidoStatus from clientes c , pedido o where c.idCliente = o.idPedido;
select concat(Pname,' ',Sobrenome) as nome_completo,idPedido,pedidoStatus from clientes c , pedido o where c.idCliente = o.idPedido;


select Pname,Sobrenome,idPedido,pedidoStatus from clientes c , pedido o where c.idCliente = idPedido;
select Pname,Sobrenome,idPedido,pedidoStatus from clientes c , pedido o where c.idCliente = idPedido;
select Pname,Sobrenome,idPedido,pedidoStatus from clientes c , pedido o where c.idCliente = idPedido;
     
     select count(*) from clientes c , pedido o where c.idCliente = o.idPedido
		group by idPedido;
        
	select count(*) from clientes c, pedido o where c.idCliente = o.idPedido;
    
    select * from clientes  c  left outer join pedido o on c.idcliente = o.idPedidos;
    
    -- quantidade de pedidos filtrados por clientes--
	select c.idCliente,Pname,count(*) as numero_de_ordens from clientes c inner join pedido  o  on c.idCliente = o.idPedido
				inner join relação_produto_pedido r on o.idPedido = r.idPedido
                group by c.idCliente;
                
                -- associação de tres tabelas com dados mocados --
	select * from clientes c inner join pedido  o  on c.idCliente = o.idPedido
				inner join relação_produto_pedido r on o.idPedido = r.idPedido
                group by c.idCliente;
                
                
                Select * from pix;
                
                select  registro_transação from pagamentos where idpagamento =idpagamento;
		
        
   
        
        
        
        
     
           