CREATE TABLE usuarios(
  cpf VARCHAR (14) PRIMARY KEY,
  nome VARCHAR (150) NOT NULL,
  email VARCHAR (150) UNIQUE NOT NULL,
  senha VARCHAR (250) NOT NULL CHECK (length(senha) >= 8)
  );
  
CREATE TABLE lojas( -- Colocar a data de criação da loja 
  id SERIAL PRIMARY KEY,
  usuario_cpf VARCHAR(14) NOT NULL UNIQUE REFERENCES usuarios(cpf) ON DELETE CASCADE,
  nome_loja VARCHAR(150) NOT NULL,
  cnpj VARCHAR(14) UNIQUE
);
      
CREATE TABLE categorias(
  id SERIAL PRIMARY KEY,
  nome VARCHAR(150) NOT NULL
 );
 
CREATE TABLE produtos(
  id SERIAL PRIMARY KEY,
  loja_id INT NOT NULL REFERENCES lojas(id) ON DELETE CASCADE,
  categoria_id INT REFERENCES categorias(id) ON DELETE SET NULL,
  nome VARCHAR (150) NOT NULL,
  descricao text, 
  preco DECIMAL (10,2) NOT NULL CHECK (preco > 0),
  estoque INT NOT NULL DEFAULT 0 CHECK ( estoque >= 0)
 );
 
 CREATE TABLE pedidos(
   id SERIAL PRIMARY KEY,
   comprador_cpf VARCHAR(14) NOT NULL REFERENCES usuarios(cpf) ON DELETE RESTRICT,
   total DECIMAL(10,2) NOT NULL CHECK (total > 0),
   status VARCHAR (50) CHECK (status in ('Pendente', 'Finalizado', 'cancelado'))
  );
   
 CREATE TABLE item_pedido(
   id SERIAL PRIMARY KEY, 
   produto_id INT NOT NULL REFERENCES produtos(id) ON DELETE RESTRICT,
   pedido_id INT NOT NULL REFERENCES pedidos(id) ON DELETE CASCADE, 
   quantidade INT NOT NULL CHECK (quantidade > 0),
   preco_unitario DECIMAL(10,2) NOT NULL CHECK (preco_unitario > 0)
  );
  