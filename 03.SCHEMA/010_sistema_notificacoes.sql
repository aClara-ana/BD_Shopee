CREATE TABLE notificacao (
    id_notificacao UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    id_usuario UUID NOT NULL REFERENCES usuario(id) ON DELETE CASCADE,
    id_pedido UUID NOT NULL REFERENCES pedido(id_pedido) ON DELETE CASCADE,
    titulo TEXT NOT NULL,
    mensagem TEXT NOT NULL,
    lido BOOLEAN DEFAULT FALSE,
    data_enviado TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
