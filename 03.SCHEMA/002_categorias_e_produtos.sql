CREATE TABLE categoria( 
  id_categoria SERIAL PRIMARY KEY, 
  nome VARCHAR(100) NOT NULL, 
  status_categoria VARCHAR(20) NOT NULL DEFAULT 'ATIVO',
  CONSTRAINT chk_status_categoria CHECK (status_categoria IN ('ATIVO', 'INATIVO')),
  data_criacao TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE produto (
    id_produto UUID PRIMARY KEY DEFAULT gen_random_uuid(),      
    id_vendedor UUID NOT NULL REFERENCES vendedor(id_vendedor) ON DELETE CASCADE,  
    id_categoria INTEGER NOT NULL REFERENCES categoria(id_categoria), 
    nome VARCHAR(150) NOT NULL,
    descricao TEXT,
    preco DECIMAL(10,2) NOT NULL CONSTRAINT chk_preco_produto CHECK (preco > 0),                  
    estoque INTEGER NOT NULL DEFAULT 0 CONSTRAINT chk_estoque_produto CHECK (estoque >= 0),     
    peso DECIMAL(10,3) CONSTRAINT chk_peso_produto CHECK (peso IS NULL OR peso > 0),                   
    status_produto VARCHAR(20) NOT NULL DEFAULT 'ATIVO',    
    CONSTRAINT chk_status_produto CHECK (status_produto IN ('ATIVO', 'INATIVO', 'ESGOTADO')),
    data_cadastro TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP 
);
