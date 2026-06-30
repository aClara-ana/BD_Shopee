CREATE TABLE historico_pesquisa (
    id_historico_pesquisa UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    id_usuario UUID NOT NULL REFERENCES usuario(id),
    termo_pesquisa TEXT NOT NULL,
    data_pesquisa TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);