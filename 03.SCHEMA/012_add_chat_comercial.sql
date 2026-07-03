CREATE TABLE conversa (
  id_conversa UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  id_usuario UUID NOT NULL REFERENCES usuario(id) ON DELETE CASCADE,
  id_vendedor UUID NOT NULL REFERENCES vendedor(id_vendedor) ON DELETE CASCADE,
  data_criacao TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT uq_usuario_vendedor_chat UNIQUE (id_usuario, id_vendedor)
);

CREATE TABLE mensagem_chat (
  id_mensagem UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  id_conversa UUID NOT NULL REFERENCES conversa(id_conversa) ON DELETE CASCADE,
  remetente_tipo VARCHAR(10) NOT NULL CONSTRAINT chk_remetente CHECK (remetente_tipo IN ('COMPRADOR', 'VENDEDOR')),
  conteudo_mensagem TEXT NOT NULL,
  lido BOOLEAN NOT NULL DEFAULT FALSE,
  data_envio TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
