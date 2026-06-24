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

CREATE TABLE dados_bancarios(
  id SERIAL PRIMARY KEY,
  usuario_cpf VARCHAR(14) NOT NULL REFERENCES usuarios(cpf) ON DELETE CASCADE,
  nome_titular VARCHAR(150) NOT NULL,
  codigo_banco VARCHAR(5) NOT NULL,
  agencia VARCHAR(10) NOT NULL,
  conta VARCHAR(20) NOT NULL,
  digito_conta VARCHAR(2) NOT NULL,
  tipo_conta VARCHAR(20) NOT NULL CHECK (tipo_conta IN ('corrente', 'poupanca'))
);

      
CREATE TABLE categorias(
  id SERIAL PRIMARY KEY,
  nome VARCHAR(150) NOT NULL UNIQUE 
 );
 
CREATE TABLE produtos(
  id SERIAL PRIMARY KEY,
  loja_id INTEGER NOT NULL REFERENCES lojas(id) ON DELETE CASCADE,
  categoria_id INTEGER REFERENCES categorias(id) ON DELETE SET NULL,
  nome VARCHAR (150) NOT NULL,
  descricao text, 
  preco DECIMAL (10,2) NOT NULL CHECK (preco > 0),
  estoque INTEGER NOT NULL DEFAULT 0 CHECK ( estoque >= 0)
 );
 
 CREATE TABLE pedidos(
   id SERIAL PRIMARY KEY,
   comprador_cpf VARCHAR(14) NOT NULL REFERENCES usuarios(cpf) ON DELETE RESTRICT,
   total DECIMAL(10,2) NOT NULL CHECK (total > 0),
   status VARCHAR (50) CHECK (status in ('Pendente', 'Finalizado', 'cancelado'))
  );
   
 CREATE TABLE item_pedido(
   id SERIAL PRIMARY KEY, 
   produto_id INTEGER NOT NULL REFERENCES produtos(id) ON DELETE RESTRICT,
   pedido_id INTEGER NOT NULL REFERENCES pedidos(id) ON DELETE CASCADE, 
   quantidade INTEGER NOT NULL CHECK (quantidade > 0),
   preco_unitario DECIMAL(10,2) NOT NULL CHECK (preco_unitario > 0)
  );

CREATE TABLE chats(
  id SERIAL PRIMARY KEY,
  usuario_cpf INTEGER  REFERENCES usuarios(cpf) ON DELETE SET NULL,
  loja_id INTEGER REFERENCES lojas(id) ON DELETE SET NULL,
  produto_id INTEGER REFERENCES produtos(id) ON DELETE SET NULL
  );

CREATE TABLE conversas(
  id SERIAL PRIMARY KEY, 
  chat_id INTEGER REFERENCES chats(id) ON DELETE CASCADE,
  autor_cpf VARCHAR(14) REFERENCES usuarios(cpf) ON DELETE SET NULL,
  mensagem TEXT NOT NULL
  );

CREATE TABLE carrinho_compra(
  id SERIAL PRIMARY KEY,
  comprador_cpf VARCHAR(14) REFERENCES usuarios(cpf) ON DELETE RESTRICT
  );

CREATE TABLE itens_carrinho(
  id SERIAL PRIMARY KEY,
  id_carrinho INTEGER REFERENCES carrinho_compra(id) ON DELETE CASCADE,
  produto_id INTEGER REFERENCES produtos(id) ON DELETE CASCADE,
  quantidade INTEGER NOT NULL DEFAULT 1 CHECK (quantidade > 0)
);

CREATE TABLE endereços(
  id SERIAL PRIMARY KEY,
  usuario_cpf VARCHAR(14) NOT NULL REFERENCES usuarios(cpf) ON DELETE CASCADE,
  rua VARCHAR(200) NOT NULL,
  numero VARCHAR(20) NOT NULL, 
  complemento VARCHAR (300) NOT NULL, 
  bairro  VARCHAR (100) NOT NULL, 
  cidade VARCHAR(100) NOT NULL,
  estado VARCHAR(2) NOT NULL CHECK (estado IN ('AC', 'AP', 'AM', 'PA', 'RO', 'RR', 'TO', 'AL', 'BA', 'CE', 'MA', 'PB', 'PE', 'PI', 'RN', 'SE', 'GO', 'MT', 'MS', 'DF', 'ES', 'MG', 'RJ', 'SP', 'PR', 'RS', 'SC')),
  cep VARCHAR(9) NOT NULL
); 

  
  
  
  
