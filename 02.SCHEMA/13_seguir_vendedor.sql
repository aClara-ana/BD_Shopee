CREATE TABLE seguir_vendedor (
  id_seguidor UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  id_usuario UUID NOT NULL REFERENCES usuario(id) ON DELETE CASCADE,
  id_vendedor UUID NOT NULL REFERENCES vendedor(id_vendedor) ON DELETE CASCADE,
  data_seguido TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  
  -- Impede duplicidade na linha
  CONSTRAINT uq_usuario_vendedor UNIQUE (id_usuario, id_vendedor)
);
