ALTER TABLE item_pedido 
ADD COLUMN id_variacao UUID REFERENCES variacao_produto(id_variacao);

-- Adicionar o endereço das empresas na tablea endereço 
ALTER TABLE endereco ALTER COLUMN id_usuario DROP NOT NULL; -- Remove a obrigação de não ser nulo
-- Adiciona a coluna ligando o endereço à tabela de vendedores
ALTER TABLE endereco 
ADD COLUMN id_vendedor UUID REFERENCES vendedor(id_vendedor) ON DELETE CASCADE;
--  Adiciona uma restrição (CHECK) para garantir que um endereço pertença 
-- OU a um usuário OU a um vendedor, nunca ficando "solto" no banco.
ALTER TABLE endereco 
ADD CONSTRAINT chk_proprietario_endereco 
CHECK ((id_usuario IS NOT NULL AND id_vendedor IS NULL) OR (id_usuario IS NULL AND id_vendedor IS NOT NULL));

-- Valor pago pelo item naquele pedido  
ALTER TABLE item_pedido 
ADD COLUMN preco_original_historico DECIMAL(10,2);
-- Identificar se o produto é indicado
ALTER TABLE produto 
ADD COLUMN eh_indicado BOOLEAN NOT NULL DEFAULT FALSE;
