CREATE TABLE categoria( 
  id_categoria SERIAL PRIMARY KEY, 
  nome VARCHAR(100) NOT NULL, 
  status_categoria VARCHAR(20) NOT NULL DEFAULT 'ATIVO',
  CONSTRAINT chk_status_categoria
      CHECK (status_categoria IN ('ATIVO', 'INATIVO')),
      
  data_criacao TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
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
CREATE TABLE variacao_produto (
  id_variacao UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  id_produto UUID NOT NULL REFERENCES produto(id_produto) ON DELETE CASCADE,
  
  nome_variacao VARCHAR(50) NOT NULL, -- Ex: 'Preto', 'Cromado', 'Lado Esquerdo'
  estoque INTEGER NOT NULL DEFAULT 0 CONSTRAINT chk_estoque_var CHECK (estoque >= 0),
  preco_variacao DECIMAL(10,2) NOT NULL CONSTRAINT chk_preco_var CHECK (preco_variacao >= 0)
);
