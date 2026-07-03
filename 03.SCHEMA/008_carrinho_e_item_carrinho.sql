CREATE TABLE carrinho (
  id_carrinho UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  id_usuario UUID UNIQUE NOT NULL REFERENCES usuario(id) ON DELETE CASCADE,
  data_criacao TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE item_carrinho (
  id_item_carrinho SERIAL PRIMARY KEY,
  id_carrinho UUID NOT NULL REFERENCES carrinho(id_carrinho) ON DELETE CASCADE,
  id_produto UUID NOT NULL REFERENCES produto(id_produto) ON DELETE CASCADE,
  quantidade INTEGER NOT NULL DEFAULT 1,
  CONSTRAINT chk_quantidade_carrinho CHECK (quantidade > 0)
);
