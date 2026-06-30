CREATE TABLE carrinho (
    id_carrinho UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    id_cliente UUID NOT NULL REFERENCES cliente(id_cliente),
    data_criacao TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT chk_carrinho_unico_cliente
        UNIQUE (id_cliente)  -- Garante que cada cliente tenha apenas um carrinho ativo
);

CREATE TABLE item_carrinho (
    id_item_carrinho UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    id_carrinho UUID NOT NULL REFERENCES carrinho(id_carrinho),
    id_produto UUID NOT NULL REFERENCES produto(id_produto),
    quantidade INTEGER NOT NULL CHECK (quantidade > 0),
    preco_unitario DECIMAL(10, 2) NOT NULL CHECK (preco_unitario >= 0),
    data_adicao TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT chk_item_carrinho_unico_produto
        UNIQUE (id_carrinho, id_produto)  -- Garante que cada produto seja adicionado apenas uma vez por carrinho
);