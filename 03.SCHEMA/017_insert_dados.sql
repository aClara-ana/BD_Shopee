-- 1. Categorias (Forçando os IDs exatos)
INSERT INTO categoria (id_categoria, nome, status_categoria) VALUES 
(1, 'Arte e Papelaria', 'ATIVO'),
(2, 'Moda K-Pop e Vestuário', 'ATIVO'),
(3, 'Decoração Cinéfila', 'ATIVO'),
(4, 'Utensílios e Confeitaria', 'ATIVO'),
(5, 'Perfumaria e Cosméticos', 'ATIVO'),
(6, 'Livros e Investigação', 'ATIVO');

-- 2. Usuários (Todos os 8 usuários)
INSERT INTO usuario (id, nome, username, email, numero_celular, senha_hash, cpf, data_nascimento, genero, eh_vendedor) VALUES
('11111111-0000-0000-0000-000000000001', 'Samantha Compradora', 'sam_shopee', 'sam@email.com', '91988881111', 'hash1', '11122233344', '2002-10-07', 'FEMININO', FALSE),
('11111111-0000-0000-0000-000000000002', 'Detetive Silva', 'investigador99', 'silva@email.com', '91988882222', 'hash2', '55566677788', '1985-05-12', 'MASCULINO', FALSE),
('11111111-0000-0000-0000-000000000003', 'Loja Cine Retrô', 'cine_retro_80s', 'vendas@cineretro.com', '91988883333', 'hash3', '99988877766', '1990-01-01', 'OUTRO', TRUE),
('11111111-0000-0000-0000-000000000004', 'K-Pop Station', 'kpop_station_br', 'contato@kpop.com', '91988884444', 'hash4', '33344455566', '1995-08-20', 'FEMININO', TRUE),
('11111111-0000-0000-0000-000000000005', 'Essências & Cia', 'perfumaria_cia', 'sac@essencias.com', '91988885555', 'hash5', '12312312344', '1988-11-10', 'MASCULINO', TRUE),
('11111111-0000-0000-0000-000000000006', 'Bolo Perfeito', 'bolo_perfeito', 'chef@boloperfeito.com', '91988886666', 'hash6', '98798798711', '1980-02-28', 'FEMININO', TRUE),
('11111111-0000-0000-0000-000000000007', 'Lucas Rocha', 'lucas_art', 'lucas@email.com', '91988887711', 'hash7', '44455566622', '1999-04-05', 'MASCULINO', FALSE),
('11111111-0000-0000-0000-000000000008', 'Maria Confeiteira', 'maria_bolos', 'maria@email.com', '91988887722', 'hash8', '77788899911', '1993-12-25', 'FEMININO', TRUE);

-- 3. Vendedores
INSERT INTO vendedor (id_vendedor, id_usuario, nome_loja, documento_fiscal, avaliacao_loja) VALUES
('22222222-0000-0000-0000-000000000001', '11111111-0000-0000-0000-000000000003', 'Cine Retrô Anos 80', '12345678000199', 4.9),
('22222222-0000-0000-0000-000000000002', '11111111-0000-0000-0000-000000000004', 'K-Pop Station', '98765432000199', 4.8),
('22222222-0000-0000-0000-000000000003', '11111111-0000-0000-0000-000000000005', 'Boutique de Perfumes', '11122233000199', 4.5),
('22222222-0000-0000-0000-000000000004', '11111111-0000-0000-0000-000000000006', 'Armazém da Confeitaria', '44455566000199', 4.7),
('22222222-0000-0000-0000-000000000005', '11111111-0000-0000-0000-000000000008', 'Doces & Caprichos', '55566677000188', 4.6);

-- 4. Endereços (Forçando os IDs de 1 a 7 para os Pedidos acharem certinho)
INSERT INTO endereco (id_endereco, id_usuario, id_vendedor, cep, estado, cidade, bairro, logradouro, numero, tipo_endereco, principal) VALUES
(1, '11111111-0000-0000-0000-000000000001', NULL, '66810000', 'PA', 'Belém', 'Icoaraci', 'Rua Oito de Maio', '150', 'CASA', TRUE),
(2, '11111111-0000-0000-0000-000000000001', NULL, '66075110', 'PA', 'Belém', 'Guamá', 'Av. Perimetral', '1', 'TRABALHO', FALSE),
(3, '11111111-0000-0000-0000-000000000002', NULL, '66040170', 'PA', 'Belém', 'Nazaré', 'Av. Braz de Aguiar', '200', 'APARTAMENTO', TRUE),
(4, NULL, '22222222-0000-0000-0000-000000000001', '66010000', 'PA', 'Belém', 'Campina', 'Rua Santo Antônio', '50', 'TRABALHO', TRUE),
(5, NULL, '22222222-0000-0000-0000-000000000002', '66040000', 'PA', 'Belém', 'Umarizal', 'Doca de Souza Franco', '100', 'TRABALHO', TRUE),
(6, '11111111-0000-0000-0000-000000000007', NULL, '66050000', 'PA', 'Belém', 'Telégrafo', 'Rua das Flores', '45', 'CASA', TRUE),
(7, NULL, '22222222-0000-0000-0000-000000000005', '66020000', 'PA', 'Belém', 'Cidade Velha', 'Traessa de Breves', '780', 'TRABALHO', TRUE);

-- 5. Produtos
INSERT INTO produto (id_produto, id_vendedor, id_categoria, nome, descricao, preco, estoque, peso, status_produto, eh_indicado) VALUES
('33333333-0000-0000-0000-000000000001', '22222222-0000-0000-0000-000000000001', 3, 'Pôster A Garota de Rosa Shocking', 'Moldura clássica do filme', 55.00, 10, 0.4, 'ATIVO', TRUE),
('33333333-0000-0000-0000-000000000002', '22222222-0000-0000-0000-000000000001', 3, 'Jaqueta Couro Ferris Bueller', 'Réplica exata do filme', 250.00, 5, 1.2, 'ATIVO', TRUE),
('33333333-0000-0000-0000-000000000003', '22222222-0000-0000-0000-000000000002', 2, 'Álbum BTS Map of The Soul: 7', 'Versão física oficial', 180.00, 50, 0.6, 'ATIVO', TRUE),
('33333333-0000-0000-0000-000000000004', '22222222-0000-0000-0000-000000000003', 5, 'Coleção Miniaturas Perfumes Vintage', 'Amostras raras', 320.00, 3, 0.5, 'ATIVO', FALSE),
('33333333-0000-0000-0000-000000000005', '22222222-0000-0000-0000-000000000004', 4, 'Óleo Vegetal Premium para Confeitaria', 'Ideal para massas', 45.00, 100, 1.0, 'ATIVO', FALSE),
('33333333-0000-0000-0000-000000000006', '22222222-0000-0000-0000-000000000004', 1, 'Kit Pincéis Aquarela Profissional', 'Pelo natural', 120.00, 0, 0.2, 'ESGOTADO', FALSE),
('33333333-0000-0000-0000-000000000007', '22222222-0000-0000-0000-000000000004', 4, 'Forma de Silicone para Cupcake x12', 'Fácil de desenformar', 35.00, 40, 0.3, 'ATIVO', TRUE),
('33333333-0000-0000-0000-000000000008', '22222222-0000-0000-0000-000000000005', 4, 'Corante Gel Alimentício Kit 6 Cores', 'Alta concentração', 28.00, 60, 0.1, 'ATIVO', FALSE),
('33333333-0000-0000-0000-000000000009', '22222222-0000-0000-0000-000000000002', 2, 'Cardigan de Lã Estilo Coreano', 'Oversized', 110.00, 15, 0.5, 'ATIVO', FALSE);

-- 6. Variações
INSERT INTO variacao_produto (id_variacao, id_produto, nome_variacao, estoque, preco_variacao) VALUES
('44444444-0000-0000-0000-000000000001', '33333333-0000-0000-0000-000000000002', 'Tamanho M', 2, 250.00),
('44444444-0000-0000-0000-000000000002', '33333333-0000-0000-0000-000000000003', 'Version 1', 25, 180.00),
('44444444-0000-0000-0000-000000000003', '33333333-0000-0000-0000-000000000003', 'Version 2', 25, 180.00);

-- 7. Cupons
INSERT INTO cupom (id_cupom, codigo, tipo_cupom, valor, valor_minimo, data_inicio, data_fim, limite_usos, usos_atuais) VALUES
('55555555-0000-0000-0000-000000000001', 'GIRLSEMPODERADAS20', 'DESCONTO_FIXO', 20.00, 100.00, '2026-01-01 00:00:00', '2026-12-31 23:59:59', 500, 2),
('55555555-0000-0000-0000-000000000002', 'FRETEGRATIS', 'FRETE_GRATIS', 15.00, 50.00, '2026-06-01 00:00:00', '2026-12-31 23:59:59', 1000, 0);

-- 8. Pedidos (Com IDs de endereço exatos)
INSERT INTO pedido (id_pedido, id_usuario, id_cupom, id_endereco_entrega, valor_produtos, valor_frete, valor_cupom, valor_total, metodo_pagamento, status_pedido, status_pagamento) VALUES
('66666666-0000-0000-0000-000000000001', '11111111-0000-0000-0000-000000000001', '55555555-0000-0000-0000-000000000001', 1, 305.00, 25.00, 20.00, 310.00, 'PIX', 'ENTREGUE', 'APROVADO'),
('66666666-0000-0000-0000-000000000002', '11111111-0000-0000-0000-000000000001', '55555555-0000-0000-0000-000000000001', 2, 225.00, 15.00, 20.00, 220.00, 'CARTAO_CREDITO', 'EM_PROCESSAMENTO', 'APROVADO'),
('66666666-0000-0000-0000-000000000003', '11111111-0000-0000-0000-000000000002', NULL, 3, 320.00, 10.00, 0.00, 330.00, 'BOLETO', 'CANCELADO', 'NEGADO'),
('66666666-0000-0000-0000-000000000004', '11111111-0000-0000-0000-000000000007', NULL, 6, 63.00, 12.00, 0.00, 75.00, 'PIX', 'ENTREGUE', 'APROVADO'),
('66666666-0000-0000-0000-000000000005', '11111111-0000-0000-0000-000000000001', NULL, 1, 110.00, 15.00, 0.00, 125.00, 'CARTAO_CREDITO', 'ENTREGUE', 'APROVADO');

-- 9. Itens de Pedido
INSERT INTO item_pedido (id_pedido, id_produto, id_vendedor, quantidade, preco_unitario, subtotal, status_item, preco_original_historico) VALUES
('66666666-0000-0000-0000-000000000001', '33333333-0000-0000-0000-000000000001', '22222222-0000-0000-0000-000000000001', 1, 55.00, 55.00, 'ENTREGUE', 60.00);
INSERT INTO item_pedido (id_pedido, id_produto, id_vendedor, id_variacao, quantidade, preco_unitario, subtotal, status_item, preco_original_historico) VALUES
('66666666-0000-0000-0000-000000000001', '33333333-0000-0000-0000-000000000002', '22222222-0000-0000-0000-000000000001', '44444444-0000-0000-0000-000000000001', 1, 250.00, 250.00, 'ENTREGUE', 250.00);
INSERT INTO item_pedido (id_pedido, id_produto, id_vendedor, id_variacao, quantidade, preco_unitario, subtotal, status_item, preco_original_historico) VALUES
('66666666-0000-0000-0000-000000000002', '33333333-0000-0000-0000-000000000003', '22222222-0000-0000-0000-000000000002', '44444444-0000-0000-0000-000000000002', 1, 180.00, 180.00, 'EM_PROCESSAMENTO', 190.00);
INSERT INTO item_pedido (id_pedido, id_produto, id_vendedor, quantidade, preco_unitario, subtotal, status_item, preco_original_historico) VALUES
('66666666-0000-0000-0000-000000000002', '33333333-0000-0000-0000-000000000005', '22222222-0000-0000-0000-000000000004', 1, 45.00, 45.00, 'EM_PROCESSAMENTO', 45.00),
('66666666-0000-0000-0000-000000000003', '33333333-0000-0000-0000-000000000004', '22222222-0000-0000-0000-000000000003', 1, 320.00, 320.00, 'CANCELADO', 320.00),
('66666666-0000-0000-0000-000000000004', '33333333-0000-0000-0000-000000000007', '22222222-0000-0000-0000-000000000004', 1, 35.00, 35.00, 'ENTREGUE', 35.00),
('66666666-0000-0000-0000-000000000004', '33333333-0000-0000-0000-000000000008', '22222222-0000-0000-0000-000000000005', 1, 28.00, 28.00, 'ENTREGUE', 30.00),
('66666666-0000-0000-0000-000000000005', '33333333-0000-0000-0000-000000000009', '22222222-0000-0000-0000-000000000002', 1, 110.00, 110.00, 'ENTREGUE', 110.00);

-- 10. Pagamentos e Logística
INSERT INTO pagamento (id_pedido, metodo_pagamento, status_pagamento, valor, codigo_transacao) VALUES
('66666666-0000-0000-0000-000000000001', 'PIX', 'APROVADO', 310.00, 'TXN-111'),
('66666666-0000-0000-0000-000000000002', 'CARTAO_CREDITO', 'APROVADO', 220.00, 'TXN-222'),
('66666666-0000-0000-0000-000000000004', 'PIX', 'APROVADO', 75.00, 'TXN-PIX-444'),
('66666666-0000-0000-0000-000000000005', 'CARTAO_CREDITO', 'APROVADO', 125.00, 'TXN-CARD-555');

INSERT INTO rastreamento (id_rastreamento, id_pedido, codigo_rastreio, transportadora) VALUES
('77777777-0000-0000-0000-000000000001', '66666666-0000-0000-0000-000000000001', 'BR000111222XP', 'Correios'),
('77777777-0000-0000-0000-000000000004', '66666666-0000-0000-0000-000000000004', 'BR444444444PA', 'Loggi'),
('77777777-0000-0000-0000-000000000005', '66666666-0000-0000-0000-000000000005', 'BR555555555PA', 'Correios');

INSERT INTO historico_rastreamento (id_rastreamento, status_envio, localizacao_atual, detalhes) VALUES
('77777777-0000-0000-0000-000000000001', 'ENTREGUE', 'Belém, PA', 'Objeto entregue ao destinatário no bairro Icoaraci');

-- 11. Avaliações e Carrinho
INSERT INTO avaliacao (id_usuario, id_produto, nota, comentario) VALUES
('11111111-0000-0000-0000-000000000001', '33333333-0000-0000-0000-000000000001', 5, 'O pôster é lindo! Emoldurei e ficou perfeito na sala.'),
('11111111-0000-0000-0000-000000000001', '33333333-0000-0000-0000-000000000002', 4, 'A jaqueta é muito parecida com a do filme, couro de ótima qualidade.'),
('11111111-0000-0000-0000-000000000007', '33333333-0000-0000-0000-000000000007', 5, 'Formas excelentes, não grudam nada!'),
('11111111-0000-0000-0000-000000000001', '33333333-0000-0000-0000-000000000009', 5, 'Muito quentinho e o estilo oversized é perfeito.');

INSERT INTO carrinho (id_carrinho, id_usuario) VALUES
('88888888-0000-0000-0000-000000000001', '11111111-0000-0000-0000-000000000002');
INSERT INTO item_carrinho (id_carrinho, id_produto, quantidade) VALUES
('88888888-0000-0000-0000-000000000001', '33333333-0000-0000-0000-000000000004', 1);

-- 12. Seguidores
INSERT INTO seguir_vendedor (id_usuario, id_vendedor) VALUES
('11111111-0000-0000-0000-000000000001', '22222222-0000-0000-0000-000000000001'),
('11111111-0000-0000-0000-000000000001', '22222222-0000-0000-0000-000000000002'),
('11111111-0000-0000-0000-000000000002', '22222222-0000-0000-0000-000000000003'),
('11111111-0000-0000-0000-000000000007', '22222222-0000-0000-0000-000000000004'),
('11111111-0000-0000-0000-000000000007', '22222222-0000-0000-0000-000000000005');