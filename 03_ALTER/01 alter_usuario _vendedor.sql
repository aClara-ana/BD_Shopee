-- ============================================
-- ALTER TABLE referentes ao arquivo 01_bases_e_usuarios.sql
-- ============================================

-- ---------- usuario ----------

ALTER TABLE usuario
    ADD COLUMN avatar_url TEXT,
    ADD COLUMN email_verificado BOOLEAN NOT NULL DEFAULT FALSE,
    ADD COLUMN celular_verificado BOOLEAN NOT NULL DEFAULT FALSE,
    ADD COLUMN data_atualizacao TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP;


-- ---------- vendedor ----------

ALTER TABLE vendedor
    ADD COLUMN descricao_loja TEXT,
    ADD COLUMN logo_url TEXT,
    ADD COLUMN tempo_resposta_medio INTEGER,
    ADD COLUMN data_atualizacao TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP;

-- tempo_resposta_medio é em minutos, então não faz sentido ser negativo
ALTER TABLE vendedor
    ADD CONSTRAINT chk_tempo_resposta_medio
        CHECK (tempo_resposta_medio IS NULL OR tempo_resposta_medio >= 0);
