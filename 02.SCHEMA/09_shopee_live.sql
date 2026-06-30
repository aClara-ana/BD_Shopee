CREATE TABLE live_stream (
    id_live_stream UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    id_vendedor UUID NOT NULL REFERENCES vendedor(id),
    titulo TEXT NOT NULL,
    descricao TEXT,
    data_inicio TIMESTAMP WITH TIME ZONE NOT NULL,
    data_fim TIMESTAMP WITH TIME ZONE,
    status TEXT CHECK (status IN ('agendado', 'ao_vivo', 'finalizado')) DEFAULT 'agendado',
    CONSTRAINT chk_data_fim_apos_inicio
        CHECK (data_fim IS NULL OR data_fim > data_inicio)  -- Garante que a data de fim seja posterior à data de início
);

CREATE TABLE produto_live (
    id_produto_live UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    id_live_stream UUID NOT NULL REFERENCES live_stream(id_live_stream),
    id_produto UUID NOT NULL REFERENCES produto(id_produto),
    preco DECIMAL(10, 2) NOT NULL CHECK (preco >= 0),
    quantidade_disponivel INTEGER NOT NULL CHECK (quantidade_disponivel >= 0),
    CONSTRAINT chk_produto_unico_live
        UNIQUE (id_live_stream, id_produto)  -- Garante que cada produto seja adicionado apenas uma vez por live stream
);

CREATE TABLE live_comentario (
  id_comentario UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  id_live UUID NOT NULL REFERENCES live_stream(id_live) ON DELETE CASCADE,
  
  -- Quem comentou (FK do usuário que está assistindo, arquivo 01)
  id_usuario UUID NOT NULL REFERENCES usuario(id) ON DELETE CASCADE,
  
  mensagem TEXT NOT NULL,
  data_envio TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
