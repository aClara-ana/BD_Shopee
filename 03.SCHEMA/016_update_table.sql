ALTER TABLE item_pedido 
ADD COLUMN id_variacao UUID REFERENCES variacao_produto(id_variacao);
