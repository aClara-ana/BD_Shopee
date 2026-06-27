CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE TABLE nivel (
  id_nivel SERIAL PRIMARY KEY, 
  nome VARCHAR (20) UNIQUE NOT NULL,
  CONSTRAINT chk_nome_nivel
  	CHECK(nome IN('BRONZE', 'PRATA', 'OURO', 'DIAMANTE')),
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
  CONSTRAINT chk_username_shopee 
        CHECK (username ~ '^[a-zA-Z0-9._]{5,30}$'),
  email VARCHAR(30) UNIQUE NOT NULL,
  CONSTRAINT chk_email_formato_valido --CONSTRAINT AJUDA IDENTIFICAR QUAL REGRA NÃO FOI SEGUIDA--
        CHECK (email ~ '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'),
  numero_celular VARCHAR(11) UNIQUE NOT NULL, 
  CONSTRAINT chk_numero_valido 
  		CHECK (numero_celular ~ '^[0-9]{10,11}$'),
  senha_hash VARCHAR(60) NOT NULL,
  cpf VARCHAR(11) UNIQUE NOT NULL, 
  data_nascimento DATE NOT NULL, 
  genero VARCHAR(20) DEFAULT 'NAO_INFORMADO',
  CONSTRAINT chk_genero_usuario
        CHECK (genero IN ('MASCULINO', 'FEMININO', 'OUTRO', 'NAO_INFORMADO')),
  id_nivel INTEGER NOT NULL DEFAULT 1 REFERENCES nivel(id_nivel),
  status_conta VARCHAR (20) NOT NULL DEFAULT 'ATIVO',
  CONSTRAINT chk_status_conta 
  		CHECK (status_conta IN('ATIVO', 'SUSPENSO', 'DELETADO', 'BANIDO')),
 data_cadastro TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
 ultimo_login TIMESTAMP WITH TIME ZONE,
 eh_vendedor BOOLEAN NOT NULL DEFAULT FALSE
 );
  
CREATE TABLE vendedor(
  id_vendedor UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  id_usuario UUID UNIQUE NOT NULL REFERENCES usuario(id),
  nome_loja VARCHAR(100) UNIQUE  NOT NULL, 
  documento_fiscal VARCHAR(14) UNIQUE NOT NULL, 
  CONSTRAINT chk_documento_valido
  		CHECK (documento_fiscal ~ '^[0-9]{11}$' OR documento_fiscal ~ '^[0-9]{14}$'),
  avaliacao_loja DECIMAL(10,2) NOT NULL DEFAULT 5.0,
  status_loja VARCHAR(20) NOT NULL DEFAULT 'ATIVO',
  CONSTRAINT chk_status_loja 
  		CHECK (status_loja IN ('ATIVO', 'SUSPENSE', 'EM ANÁLISE')),
  data_abertura TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE categoria( 
  id_categoria SERIAL PRIMARY KEY, 
  nome VARCHAR(100) NOT NULL, 
  status_categoria VARCHAR(20) NOT NULL DEFAULT 'ATIVO',
  CONSTRAINT chk_status_categoria
      CHECK (status_categoria IN ('ATIVO', 'INATIVO')),
      
  data_criacao TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE pedido (
  id_pedido UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  id_usuario UUID NOT NULL REFERENCES usuario(id),
  data_pedido TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  id_endereco_entrega INTEGER NOT NULL REFERENCES endereco(id_endereco),
  valor_produtos DECIMAL(10,2) NOT NULL CONSTRAINT chk_valor_produtos CHECK (valor_produtos >= 0),
  valor_frete DECIMAL(10,2) NOT NULL CONSTRAINT chk_valor_frete CHECK (valor_frete >= 0),
  valor_cupom DECIMAL(10,2) NOT NULL CONSTRAINT chk_valor_cupom CHECK (valor_cupom >= 0),
  valor_total DECIMAL(10,2) NOT NULL CONSTRAINT chk_valor_total CHECK (valor_total >= 0),
  metodo_pagamento VARCHAR(20) NOT NULL,
  CONSTRAINT chk_metodo_pagamento
      CHECK (metodo_pagamento IN ('CARTAO_CREDITO', 'CARTAO_DEBITO', 'PIX', 'BOLETO')),
  status_pedido VARCHAR(20) NOT NULL DEFAULT 'PENDENTE',
  CONSTRAINT chk_status_pedido 
      CHECK (status_pedido IN ('PENDENTE', 'EM_PROCESSAMENTO', 'ENVIADO', 'ENTREGUE', 'CANCELADO')),
  status_pagamento VARCHAR(20) NOT NULL DEFAULT 'PENDENTE',
  CONSTRAINT chk_status_pagamento
      CHECK (status_pagamento IN ('PENDENTE', 'APROVADO', 'NEGADO', 'ESTORNADO')),
  data_criacao TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  data_atualizacao TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE produto (
    id_produto UUID PRIMARY KEY DEFAULT gen_random_uuid(),      --Entidade Principal
    id_vendedor UUID NOT NULL REFERENCES vendedor(id_vendedor),  --Está ligado a um vendendor
    id_categoria INTEGER NOT NULL REFERENCES categoria(id_categoria), --Está ligado a uma categoria 
    nome VARCHAR(150) NOT NULL,
    descricao TEXT,
    preco DECIMAL(10,2) NOT NULL,
    CONSTRAINT chk_preco_produto
        CHECK ( preco > 0),                  --Evita Preço negativo 
    estoque INTEGER NOT NULL DEFAULT 0,     --Cada produto possui apenas um estoque
    CONSTRAINT chk_estoque_produto
        CHECK (estoque >= 0),               
    peso DECIMAL(10,3),
    CONSTRAINT chk_peso_produto
        CHECK (peso IS NULL OR peso > 0),                   --O peso pode não ser informado, mais se for evita Peso negativo  
    status_produto VARCHAR(20) NOT NULL DEFAULT 'ATIVO',    --Ativo é o padrão
    CONSTRAINT chk_status_produto
        CHECK (status_produto IN ('ATIVO', 'INATIVO', 'ESGOTADO')),
    data_cadastro TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP --sera preenchido automaticamente a data cadastro
);

CREATE TABLE pagamento (
    id_pagamento UUID PRIMARY KEY DEFAULT gen_random_uuid(),    --Entidade importante! (usa o UUID)
    id_pedido UUID NOT NULL REFERENCES pedido(id_pedido),       --Todo pagamento esta ligado a 1 pedido
    metodo_pagamento VARCHAR(20) NOT NULL,                        
    CONSTRAINT chk_metodo_pagamento
        CHECK (metodo_pagamento IN ('PIX', 'CARTAO_CREDITO', 'CARTAO_DEBITO', 'BOLETO', 'CARTEIRA')),
    status_pagamento VARCHAR(20) NOT NULL DEFAULT 'PENDENTE',   --Define pendente como Padrão
    CONSTRAINT chk_status_pagamento
        CHECK (status_pagamento IN ('PENDENTE', 'APROVADO', 'RECUSADO', 'ESTORNADO', 'CANCELADO')),
    valor DECIMAL(10,2) NOT NULL,                               --Mais preciso do que o Float
    CONSTRAINT chk_valor_pagamento
        CHECK (valor > 0),                                      --Evitar número negativos
    codigo_transacao VARCHAR(100) UNIQUE,
    data_pagamento TIMESTAMP WITH TIME ZONE,                    -- Pode ser nulo pois pagamento pode esta pendente
    data_criacao TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE endereco (
    id_endereco SERIAL PRIMARY KEY,     --Não é a entidade principal
    id_usuario UUID NOT NULL REFERENCES usuario(id), --Sempre pertence a um usuário
    cep VARCHAR(8) NOT NULL, 
    
    CONSTRAINT chk_cep                  --Verifica o cep (se não é um cep inválido)
        CHECK (cep ~ '^[0-9]{8}$'),
    estado VARCHAR(2) NOT NULL,         --Ocupa menos armazenamento 
    cidade VARCHAR(100) NOT NULL,
    bairro VARCHAR(100) NOT NULL,
    logradouro VARCHAR(150) NOT NULL,
    numero VARCHAR(10) NOT NULL,        --Pode ter letras
    complemento VARCHAR(100),           --Pode ser opcinal
    tipo_endereco VARCHAR(20) NOT NULL DEFAULT 'CASA', --Casa é definida como padrão
    
    CONSTRAINT chk_tipo_endereco        --Verifica o tipo de endereço
        CHECK (tipo_endereco IN ('CASA', 'APARTAMENTO', 'TRABALHO', 'OUTRO')),

    principal BOOLEAN NOT NULL DEFAULT FALSE, --Usuário escolhe um endereço como padrão
    data_cadastro TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
