CREATE TABLE favorito (
    id_favorito SERIAL PRIMARY KEY,
    id_usuario UUID NOT NULL REFERENCES usuario(id) ON DELETE CASCADE,
    id_produto UUID NOT NULL REFERENCES produto(id_produto) ON DELETE CASCADE,
    data_adicionado TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT uq_usuario_produto_favorito UNIQUE (id_usuario, id_produto)
);
