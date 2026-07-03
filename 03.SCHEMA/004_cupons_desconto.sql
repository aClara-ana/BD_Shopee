CREATE TABLE cupom (
  id_cupom UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  codigo VARCHAR(20) NOT NULL UNIQUE,   
  tipo_cupom TEXT CHECK (tipo_cupom IN ('FRETE_GRATIS', 'DESCONTO_PERCENTUAL', 'DESCONTO_FIXO')) NOT NULL,
  valor DECIMAL(10,2) NOT NULL CONSTRAINT chk_valor_cupom CHECK (valor >= 0),
  valor_minimo DECIMAL(10,2) NOT NULL CONSTRAINT chk_valor_minimo CHECK (valor_minimo >= 0),
  data_inicio TIMESTAMP WITH TIME ZONE NOT NULL,
  data_fim TIMESTAMP WITH TIME ZONE NOT NULL,
  limite_usos INTEGER NOT NULL CONSTRAINT chk_limite_uso CHECK (limite_usos >= 0), 
  usos_atuais INTEGER DEFAULT 0, 
  ativo BOOLEAN DEFAULT TRUE,

  CONSTRAINT chk_data_fim_apos_inicio CHECK (data_fim > data_inicio),  
  CONSTRAINT chk_porcentagem_limite CHECK (tipo_cupom <> 'DESCONTO_PERCENTUAL' OR valor <= 100.00)
);
