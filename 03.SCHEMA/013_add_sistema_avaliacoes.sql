CREATE TABLE avaliacao (
    id_avaliacao UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    id_usuario UUID NOT NULL REFERENCES usuario(id),
    id_produto UUID NOT NULL REFERENCES produto(id_produto),

    nota INTEGER NOT NULL,
    CONSTRAINT chk_nota_avaliacao
        CHECK (nota BETWEEN 1 AND 5),

    comentario TEXT,
    data_avaliacao TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT uq_usuario_produto  --impede que o mesmo usuário cadastre mais avaliações para o mesmo produto
        UNIQUE (id_usuario, id_produto)
);
