CREATE TABLE item_pedido (
    id_item_pedido UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    id_pedido UUID NOT NULL REFERENCES pedido(id_pedido) ON DELETE CASCADE,
    id_produto UUID NOT NULL REFERENCES produto(id_produto),
    id_vendedor UUID NOT NULL REFERENCES vendedor(id_vendedor), 
    quantidade INTEGER NOT NULL CONSTRAINT chk_quantidade_item_pedido CHECK (quantidade > 0),
    preco_unitario DECIMAL(10,2) NOT NULL CONSTRAINT chk_preco_unitario_item_pedido CHECK (preco_unitario >= 0),
    subtotal DECIMAL(10,2) NOT NULL CONSTRAINT chk_subtotal_item_pedido CHECK (subtotal >= 0),
    status_item VARCHAR(20) NOT NULL DEFAULT 'PENDENTE',
    CONSTRAINT chk_status_item_pedido CHECK (status_item IN ('PENDENTE', 'EM_PROCESSAMENTO', 'ENVIADO', 'ENTREGUE', 'CANCELADO')),
    data_criacao TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT uq_pedido_produto UNIQUE (id_pedido, id_produto)
);
