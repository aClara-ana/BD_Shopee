-- ============================================
-- ALTER TABLE referentes ao arquivo 02_categorias_e_produtos.sql
-- ============================================

-- ---------- categoria ----------

-- Permite hierarquia de categorias (categoria pai/filha)
-- Ex: Eletrônicos > Celulares e Smartphones > Capinhas
ALTER TABLE categoria
    ADD COLUMN id_categoria_pai INTEGER REFERENCES categoria(id_categoria);


-- ---------- produto ----------

-- Dimensões físicas (peso já existia; faltam as medidas pra cálculo de frete)
ALTER TABLE produto
    ADD COLUMN comprimento DECIMAL(10,2),
    ADD COLUMN largura DECIMAL(10,2),
    ADD COLUMN altura DECIMAL(10,2);

ALTER TABLE produto
    ADD CONSTRAINT chk_dimensoes_produto
        CHECK (
            (comprimento IS NULL OR comprimento > 0) AND
            (largura IS NULL OR largura > 0) AND
            (altura IS NULL OR altura > 0)
        );

-- Marca do produto (filtro comum de busca)
ALTER TABLE produto
    ADD COLUMN marca VARCHAR(100);

-- Contadores denormalizados exibidos na listagem/página do produto
ALTER TABLE produto
    ADD COLUMN quantidade_vendida INTEGER NOT NULL DEFAULT 0,
    ADD COLUMN avaliacao_media DECIMAL(3,2) NOT NULL DEFAULT 0.0,
    ADD COLUMN total_avaliacoes INTEGER NOT NULL DEFAULT 0;

ALTER TABLE produto
    ADD CONSTRAINT chk_quantidade_vendida CHECK (quantidade_vendida >= 0),
    ADD CONSTRAINT chk_avaliacao_media CHECK (avaliacao_media BETWEEN 0 AND 5),
    ADD CONSTRAINT chk_total_avaliacoes CHECK (total_avaliacoes >= 0);

-- Data de última atualização (preço, estoque etc.)
ALTER TABLE produto
    ADD COLUMN data_atualizacao TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP;
