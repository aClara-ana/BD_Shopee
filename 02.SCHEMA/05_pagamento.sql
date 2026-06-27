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