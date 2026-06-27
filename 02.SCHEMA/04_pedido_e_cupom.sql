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