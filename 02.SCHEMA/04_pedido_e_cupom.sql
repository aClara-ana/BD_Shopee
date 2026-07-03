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

CREATE TABLE cupom (
  id_cupom UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  codigo VARCHAR(20) NOT NULL UNIQUE,   
  tipo_cupom TEXT CHECK (tipo_cupom IN ('FRETE_GRATIS', 'DESCONTO_PERCENTUAL', 'DESCONTO_FIXO')) NOT NULL,
  valor DECIMAL(10,2) NOT NULL CONSTRAINT chk_valor_cupom CHECK (valor >= 0),
  valor_minimo DECIMAL(10,2) NOT NULL CONSTRAINT chk_valor_minimo CHECK (valor_minimo >= 0),
  data_inicio TIMESTAMP WITH TIME ZONE NOT NULL,
  data_fim TIMESTAMP WITH TIME ZONE NOT NULL,
  limite_usos INTEGER NOT NULL CONSTRAINT chk_limite_uso CHECK (limite_usos >= 0), -- Quantas vezes pode ser usado no total
  usos_atuais INTEGER DEFAULT 0, 
  ativo BOOLEAN DEFAULT TRUE,

  -- Garante que a data de fim seja posterior à data de início
  CONSTRAINT chk_data_fim_apos_inicio CHECK (data_fim > data_inicio),  
  
  -- Garante que se for porcentagem, o desconto não seja maior que 100% (Ajustado para MAIÚSCULO)
  CONSTRAINT chk_porcentagem_limite CHECK (tipo_cupom <> 'DESCONTO_PERCENTUAL' OR valor <= 100.00)
);
