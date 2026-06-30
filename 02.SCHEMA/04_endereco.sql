CREATE TABLE endereco (
    id_endereco SERIAL PRIMARY KEY,     --Não é a entidade principal
    id_usuario UUID NOT NULL REFERENCES usuario(id), 
    cep VARCHAR(8) NOT NULL, 
    
    CONSTRAINT chk_cep                  --Verifica o cep
        CHECK (cep ~ '^[0-9]{8}$'),
    estado VARCHAR(2) NOT NULL,         --Ocupa menos armazenamento 
    cidade VARCHAR(100) NOT NULL,
    bairro VARCHAR(100) NOT NULL,
    logradouro VARCHAR(150) NOT NULL,
    numero VARCHAR(10) NOT NULL,        
    complemento VARCHAR(100),           --Pode ser opcional
    tipo_endereco VARCHAR(20) NOT NULL DEFAULT 'CASA', --Casa é definida como padrão
    
    CONSTRAINT chk_tipo_endereco        --Verifica o tipo de endereço
        CHECK (tipo_endereco IN ('CASA', 'APARTAMENTO', 'TRABALHO', 'OUTRO')),

    principal BOOLEAN NOT NULL DEFAULT FALSE, --Usuário escolhe um endereço como padrão
    data_cadastro TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
