CREATE TABLE rastreamento (
    id_rastreamento UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    id_pedido UUID UNIQUE NOT NULL REFERENCES pedido(id_pedido) ON DELETE CASCADE,
    codigo_rastreio VARCHAR(50) UNIQUE NOT NULL,
    transportadora VARCHAR(50) NOT NULL,
    data_envio TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE historico_rastreamento (
    id_historico SERIAL PRIMARY KEY,
    id_rastreamento UUID NOT NULL REFERENCES rastreamento(id_rastreamento) ON DELETE CASCADE,
    status_envio VARCHAR(30) NOT NULL,
    CONSTRAINT chk_status_envio CHECK (status_envio IN ('POSTADO', 'EM_TRANSITO', 'SAIU_PARA_ENTREGA', 'ENTREGUE', 'FALHA_NA_ENTREGA')),
    localizacao_atual VARCHAR(150) NOT NULL, 
    detalhes TEXT, 
    data_atualizacao TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
