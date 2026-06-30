CREATE TABLE notificacao_usuario (
    id_notificacao_usuario UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    id_usuario UUID NOT NULL REFERENCES usuario(id),
    id_pedido UUID NOT NULL REFERENCES pedido(id_pedido),
    titulo TEXT NOT NULL,
    mensagem TEXT NOT NULL,
    lido BOOLEAN DEFAULT FALSE,
    data_enviado TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

