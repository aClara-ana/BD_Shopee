CREATE TABLE conversa (
  id_conversa UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  id_usuario UUID NOT NULL REFERENCES usuario(id) ON DELETE CASCADE,
  id_vendedor UUID NOT NULL REFERENCES vendedor(id_vendedor) ON DELETE CASCADE,
  data_criacao TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  
  -- Impede que o sistema crie duas salas de chat separadas para as mesmas duas pessoas
  CONSTRAINT uq_usuario_vendedor_chat UNIQUE (id_usuario, id_vendedor)
);

CREATE TABLE mensagem_chat (
  id_mensagem UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  
  -- Vincula a mensagem à sala correta criada acima
  id_conversa UUID NOT NULL REFERENCES conversa(id_conversa) ON DELETE CASCADE,
  
  -- Quem enviou a mensagem?
  remetente_tipo VARCHAR(10) NOT NULL CONSTRAINT chk_remetente CHECK (remetente_tipo IN ('COMPRADOR', 'VENDEDOR')),
  
  conteudo_mensagem TEXT NOT NULL,
  
  -- Controle de leitura para saber se o vendedor/comprador visualizou
  lido BOOLEAN NOT NULL DEFAULT FALSE,
  
  data_envio TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
