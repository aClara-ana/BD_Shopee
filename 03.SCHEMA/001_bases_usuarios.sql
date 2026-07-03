CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE nivel (
  id_nivel SERIAL PRIMARY KEY, 
  nome VARCHAR (20) UNIQUE NOT NULL,
  CONSTRAINT chk_nome_nivel CHECK(nome IN('BRONZE', 'PRATA', 'OURO', 'DIAMANTE')),
  pontos_minimos INTEGER NOT NULL, 
  desconto INTEGER NOT NULL
);

INSERT INTO nivel (nome, pontos_minimos, desconto) VALUES
('BRONZE', 0, 0),
('PRATA', 100, 2),
('OURO', 500, 5),
('DIAMANTE', 1500, 10);

CREATE TABLE usuario(
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  nome VARCHAR(300) NOT NULL,
  username VARCHAR (30) NOT NULL,
  CONSTRAINT chk_username_shopee CHECK (username ~ '^[a-zA-Z0-9._]{5,30}$'),
  email VARCHAR(30) UNIQUE NOT NULL,
  CONSTRAINT chk_email_formato_valido CHECK (email ~ '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'),
  numero_celular VARCHAR(11) UNIQUE NOT NULL, 
  CONSTRAINT chk_numero_valido CHECK (numero_celular ~ '^[0-9]{10,11}$'),
  senha_hash VARCHAR(60) NOT NULL,
  cpf VARCHAR(11) UNIQUE NOT NULL, 
  data_nascimento DATE NOT NULL, 
  genero VARCHAR(20) DEFAULT 'NAO_INFORMADO',
  CONSTRAINT chk_genero_usuario CHECK (genero IN ('MASCULINO', 'FEMININO', 'OUTRO', 'NAO_INFORMADO')),
  id_nivel INTEGER NOT NULL DEFAULT 1 REFERENCES nivel(id_nivel),
  status_conta VARCHAR (20) NOT NULL DEFAULT 'ATIVO',
  CONSTRAINT chk_status_conta CHECK (status_conta IN('ATIVO', 'SUSPENSO', 'DELETADO', 'BANIDO')),
  data_cadastro TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  ultimo_login TIMESTAMP WITH TIME ZONE,
  eh_vendedor BOOLEAN NOT NULL DEFAULT FALSE
);
  
CREATE TABLE vendedor(
  id_vendedor UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  id_usuario UUID UNIQUE NOT NULL REFERENCES usuario(id) ON DELETE CASCADE,
  nome_loja VARCHAR(100) UNIQUE NOT NULL, 
  documento_fiscal VARCHAR(14) UNIQUE NOT NULL, 
  CONSTRAINT chk_documento_valido CHECK (documento_fiscal ~ '^[0-9]{11}$' OR documento_fiscal ~ '^[0-9]{14}$'),
  avaliacao_loja DECIMAL(10,2) NOT NULL DEFAULT 5.0,
  status_loja VARCHAR(20) NOT NULL DEFAULT 'ATIVO',
  CONSTRAINT chk_status_loja CHECK (status_loja IN ('ATIVO', 'SUSPENSE', 'EM ANÁLISE')),
  data_abertura TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
