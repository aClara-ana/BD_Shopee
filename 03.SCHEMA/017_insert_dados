-- 1. Inserindo Categorias Diversas
INSERT INTO categoria (nome, status_categoria) VALUES 
('Arte e Papelaria', 'ATIVO'), 
('Moda K-Pop e Vestuário', 'ATIVO'),
('Decoração Cinéfila', 'ATIVO'),
('Utensílios de Confeitaria', 'ATIVO'),
('Livros e Cursos Tech', 'ATIVO');

-- 2. Inserindo Usuários (Compradores e Vendedores)
INSERT INTO usuario (id, nome, username, email, numero_celular, senha_hash, cpf, data_nascimento, genero, eh_vendedor) VALUES
('10000000-0000-0000-0000-000000000001', 'Marcos Almeida', 'marcos_dev', 'marcos.dev@email.com', '91988887777', 'hash_123', '11122233344', '1998-03-22', 'MASCULINO', FALSE),
('10000000-0000-0000-0000-000000000002', 'Beatriz Arte', 'bia_aquarela', 'bia.loja@email.com', '91988886666', 'hash_123', '55566677788', '1995-11-10', 'FEMININO', TRUE),
('10000000-0000-0000-0000-000000000003', 'Carlos Geek', 'carlos_geek', 'carlos.vendas@email.com', '91988885555', 'hash_123', '99988877766', '1990-07-05', 'MASCULINO', TRUE),
('10000000-0000-0000-0000-000000000004', 'Camila Leitora', 'mila_reads', 'camila@email.com', '91988884444', 'hash_123', '33344455566', '2001-09-12', 'FEMININO', FALSE);

-- 3. Inserindo Lojas (Vendedores)
INSERT INTO vendedor (id_vendedor, id_usuario, nome_loja, documento_fiscal, avaliacao_loja) VALUES
('20000000-0000-0000-0000-000000000001', '10000000-0000-0000-0000-000000000002', 'Armazém da Aquarela', '12345678000199', 4.8),
('20000000-0000-0000-0000-000000000002', '10000000-0000-0000-0000-000000000003', 'Nostalgia & K-Pop', '98765432000199', 4.2);

-- 4. Inserindo Endereços 
-- (O ID gerado é SERIAL: 1, 2, 3 e 4)
INSERT INTO endereco (id_usuario, cep, estado, cidade, bairro, logradouro, numero, tipo_endereco, principal) VALUES
('10000000-0000-0000-0000-000000000001', '66075110', 'PA', 'Belém', 'Guamá', 'Av. Perimetral', '10', 'CASA', TRUE),
('10000000-0000-0000-0000-000000000004', '66810000', 'PA', 'Belém', 'Icoaraci', 'Rua Oito de Maio', '150', 'APARTAMENTO', TRUE);
INSERT INTO endereco (id_vendedor, cep, estado, cidade, bairro, logradouro, numero, tipo_endereco, principal) VALUES
('20000000-0000-0000-0000-000000000001', '66010000', 'PA', 'Belém', 'Campina', 'Rua Santo Antônio', '50', 'TRABALHO', TRUE),
('20000000-0000-0000-0000-000000000002', '66040170', 'PA', 'Belém', 'Nazaré', 'Av. Nazaré', '100', 'TRABALHO', TRUE);

-- 5. Inserindo Produtos (Alguns ativos, outros esgotados)
INSERT INTO produto (id_produto, id_vendedor, id_categoria, nome, descricao, preco, estoque, peso, status_produto, eh_indicado) VALUES
('30000000-0000-0000-0000-000000000001', '20000000-0000-0000-0000-000000000001', 1, 'Estojo Aquarela Profissional 48 Cores', 'Tinta super pigmentada para quadros', 120.00, 15, 0.5, 'ATIVO', TRUE),
('30000000-0000-0000-0000-000000000002', '20000000-0000-0000-0000-000000000002', 2, 'Moletom Love Yourself Tour', 'Casaco oficial da tour', 150.00, 30, 0.8, 'ATIVO', TRUE),
('30000000-0000-0000-0000-000000000003', '20000000-0000-0000-0000-000000000002', 3, 'Pôster Curtindo a Vida Adoidado', 'Moldura retrô anos 80', 45.00, 5, 0.2, 'ATIVO', FALSE),
('30000000-0000-0000-0000-000000000004', '20000000-0000-0000-0000-000000000001', 4, 'Kit Espátulas para Bolo de Casamento', 'Aço inox profissional', 85.00, 0, 0.4, 'ESGOTADO', FALSE),
('30000000-0000-0000-0000-000000000005', '20000000-0000-0000-0000-000000000001', 5, 'Curso Lógica de Programação C++', 'Mídia física', 60.00, 100, 0.1, 'ATIVO', FALSE);

-- 6. Inserindo Variações (Apenas para o Moletom K-pop)
INSERT INTO variacao_produto (id_variacao, id_produto, nome_variacao, estoque, preco_variacao) VALUES
('40000000-0000-0000-0000-000000000001', '30000000-0000-0000-0000-000000000002', 'Tamanho M - Preto', 15, 150.00),
('40000000-0000-0000-0000-000000000002', '30000000-0000-0000-0000-000000000002', 'Tamanho G - Branco', 15, 150.00);

-- 7. Inserindo Cupons de Desconto
INSERT INTO cupom (id_cupom, codigo, tipo_cupom, valor, valor_minimo, data_inicio, data_fim, limite_usos, usos_atuais) VALUES
('50000000-0000-0000-0000-000000000001', 'GIRLSEMPODERADAS20', 'DESCONTO_PERCENTUAL', 20.00, 100.00, '2026-07-01 00:00:00', '2026-12-31 23:59:59', 500, 1),
('50000000-0000-0000-0000-000000000002', 'BOASVINDAS', 'FRETE_GRATIS', 15.00, 50.00, '2026-01-01 00:00:00', '2026-12-31 23:59:59', 1000, 0);

-- 8. Inserindo Pedidos (1 Entregue, 1 Pendente, 1 Cancelado)
-- Pedido 1 (Marcos compra Aquarela e Pôster. 120 + 45 = 165 Prod. Frete 15. Usa Cupom de 20% (33). Total: 147.00)
INSERT INTO pedido (id_pedido, id_usuario, id_cupom, id_endereco_entrega, valor_produtos, valor_frete, valor_cupom, valor_total, metodo_pagamento, status_pedido, status_pagamento) VALUES
('60000000-0000-0000-0000-000000000001', '10000000-0000-0000-0000-000000000001', '50000000-0000-0000-0000-000000000001', 1, 165.00, 15.00, 33.00, 147.00, 'CARTAO_CREDITO', 'ENTREGUE', 'APROVADO');

-- Pedido 2 (Camila compra Moletom G. 150 Prod. Frete 20. Sem cupom. Total: 170.00)
INSERT INTO pedido (id_pedido, id_usuario, id_endereco_entrega, valor_produtos, valor_frete, valor_cupom, valor_total, metodo_pagamento, status_pedido, status_pagamento) VALUES
('60000000-0000-0000-0000-000000000002', '10000000-0000-0000-0000-000000000004', 2, 150.00, 20.00, 0.00, 170.00, 'BOLETO', 'PENDENTE', 'PENDENTE');

-- Pedido 3 (Marcos tentou comprar curso C++, mas cancelou. 60 Prod. Frete 10. Total 70.00)
INSERT INTO pedido (id_pedido, id_usuario, id_endereco_entrega, valor_produtos, valor_frete, valor_cupom, valor_total, metodo_pagamento, status_pedido, status_pagamento) VALUES
('60000000-0000-0000-0000-000000000003', '10000000-0000-0000-0000-000000000001', 1, 60.00, 10.00, 0.00, 70.00, 'PIX', 'CANCELADO', 'RECUSADO');

-- 9. Itens dos Pedidos
-- Itens do Pedido 1
INSERT INTO item_pedido (id_pedido, id_produto, id_vendedor, quantidade, preco_unitario, subtotal, status_item, preco_original_historico) VALUES
('60000000-0000-0000-0000-000000000001', '30000000-0000-0000-0000-000000000001', '20000000-0000-0000-0000-000000000001', 1, 120.00, 120.00, 'ENTREGUE', 130.00),
('60000000-0000-0000-0000-000000000001', '30000000-0000-0000-0000-000000000003', '20000000-0000-0000-0000-000000000002', 1, 45.00, 45.00, 'ENTREGUE', 45.00);
-- Item do Pedido 2 (Com variação)
INSERT INTO item_pedido (id_pedido, id_produto, id_vendedor, id_variacao, quantidade, preco_unitario, subtotal, status_item, preco_original_historico) VALUES
('60000000-0000-0000-0000-000000000002', '30000000-0000-0000-0000-000000000002', '20000000-0000-0000-0000-000000000002', '40000000-0000-0000-0000-000000000002', 1, 150.00, 150.00, 'EM_PROCESSAMENTO', 150.00);
-- Item do Pedido 3
INSERT INTO item_pedido (id_pedido, id_produto, id_vendedor, quantidade, preco_unitario, subtotal, status_item, preco_original_historico) VALUES
('60000000-0000-0000-0000-000000000003', '30000000-0000-0000-0000-000000000005', '20000000-0000-0000-0000-000000000001', 1, 60.00, 60.00, 'CANCELADO', 60.00);

-- 10. Pagamentos e Rastreamento (Para o pedido entregue)
INSERT INTO pagamento (id_pedido, metodo_pagamento, status_pagamento, valor, codigo_transacao) VALUES
('60000000-0000-0000-0000-000000000001', 'CARTAO_CREDITO', 'APROVADO', 147.00, 'TXN-99887766');

INSERT INTO rastreamento (id_rastreamento, id_pedido, codigo_rastreio, transportadora) VALUES
('70000000-0000-0000-0000-000000000001', '60000000-0000-0000-0000-000000000001', 'BR123456789XP', 'Correios');

INSERT INTO historico_rastreamento (id_rastreamento, status_envio, localizacao_atual, detalhes) VALUES
('70000000-0000-0000-0000-000000000001', 'ENTREGUE', 'Belém, PA', 'Objeto entregue ao destinatário');

-- 11. Avaliações
INSERT INTO avaliacao (id_usuario, id_produto, nota, comentario) VALUES
('10000000-0000-0000-0000-000000000001', '30000000-0000-0000-0000-000000000001', 5, 'Aquarela incrível! As cores são muito vivas, chegou rápido no Guamá.'),
('10000000-0000-0000-0000-000000000001', '30000000-0000-0000-0000-000000000003', 4, 'O pôster é legal, mas amassa um pouco nos cantos.');

-- 12. Carrinhos Abandonados (Para consultas de remarketing)
INSERT INTO carrinho (id_carrinho, id_usuario) VALUES
('80000000-0000-0000-0000-000000000001', '10000000-0000-0000-0000-000000000004');
INSERT INTO item_carrinho (id_carrinho, id_produto, quantidade) VALUES
('80000000-0000-0000-0000-000000000001', '30000000-0000-0000-0000-000000000001', 2);
