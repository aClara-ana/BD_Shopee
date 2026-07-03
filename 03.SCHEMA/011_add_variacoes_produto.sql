CREATE TABLE variacao_produto (
  id_variacao UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  id_produto UUID NOT NULL REFERENCES produto(id_produto) ON DELETE CASCADE,
  nome_variacao VARCHAR(50) NOT NULL, 
  estoque INTEGER NOT NULL DEFAULT 0 CONSTRAINT chk_estoque_var CHECK (estoque >= 0),
  preco_variacao DECIMAL(10,2) NOT NULL CONSTRAINT chk_preco_var CHECK (preco_variacao >= 0)
);
