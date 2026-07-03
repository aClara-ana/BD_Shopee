-- ============================================
-- CREATE TABLE item_pedido
-- Liga um pedido aos produtos comprados, "congelando" preço e
-- quantidade no momento da compra (não pode mudar mesmo se o
-- vendedor alterar o preço do produto depois)
-- ============================================

CREATE TABLE item_pedido (
    id_item_pedido UUID PRIMARY KEY DEFAULT gen_random_uuid(),

    id_pedido UUID NOT NULL REFERENCES pedido(id_pedido) ON DELETE CASCADE,
    id_produto UUID NOT NULL REFERENCES produto(id_produto),

    -- também guardamos o vendedor aqui: um pedido pode ter produtos
    -- de vendedores diferentes, e isso facilita consultas tipo
    -- "quanto o vendedor X vendeu" sem precisar dar join até produto
    id_vendedor UUID NOT NULL REFERENCES vendedor(id_vendedor),

    quantidade INTEGER NOT NULL,
    CONSTRAINT chk_quantidade_item_pedido
        CHECK (quantidade > 0),

    -- preço unitário do produto NO MOMENTO da compra (não referencia
    -- produto.preco, que pode mudar depois)
    preco_unitario DECIMAL(10,2) NOT NULL,
    CONSTRAINT chk_preco_unitario_item_pedido
        CHECK (preco_unitario >= 0),

    -- quantidade * preco_unitario, guardado pra não precisar recalcular
    subtotal DECIMAL(10,2) NOT NULL,
    CONSTRAINT chk_subtotal_item_pedido
        CHECK (subtotal >= 0),

    -- status por item, pois cada vendedor pode enviar seu produto
    -- em momentos diferentes dentro do mesmo pedido
    status_item VARCHAR(20) NOT NULL DEFAULT 'PENDENTE',
    CONSTRAINT chk_status_item_pedido
        CHECK (status_item IN ('PENDENTE', 'EM_PROCESSAMENTO', 'ENVIADO', 'ENTREGUE', 'CANCELADO')),

    data_criacao TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,

    -- impede duplicar o mesmo produto duas vezes na mesma linha do pedido
    -- (se o cliente comprar mais, a quantidade sobe, não cria outra linha)
    CONSTRAINT uq_pedido_produto UNIQUE (id_pedido, id_produto)
);
