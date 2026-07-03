CREATE TABLE pagamento (
    id_pagamento UUID PRIMARY KEY DEFAULT gen_random_uuid(),    
    id_pedido UUID NOT NULL REFERENCES pedido(id_pedido) ON DELETE CASCADE,       
    metodo_pagamento VARCHAR(20) NOT NULL,                        
    CONSTRAINT chk_metodo_pagamento_pag CHECK (metodo_pagamento IN ('PIX', 'CARTAO_CREDITO', 'CARTAO_DEBITO', 'BOLETO', 'CARTEIRA')),
    status_pagamento VARCHAR(20) NOT NULL DEFAULT 'PENDENTE',   
    CONSTRAINT chk_status_pagamento_pag CHECK (status_pagamento IN ('PENDENTE', 'APROVADO', 'RECUSADO', 'ESTORNADO', 'CANCELADO')),
    valor DECIMAL(10,2) NOT NULL CONSTRAINT chk_valor_pagamento CHECK (valor > 0),                                      
    codigo_transacao VARCHAR(100) UNIQUE,
    data_pagamento TIMESTAMP WITH TIME ZONE,                    
    data_criacao TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
