CREATE TABLE endereco (
    id_endereco SERIAL PRIMARY KEY,
    id_usuario UUID NOT NULL REFERENCES usuario(id) ON DELETE CASCADE, 
    cep VARCHAR(8) NOT NULL, 
    CONSTRAINT chk_cep CHECK (cep ~ '^[0-9]{8}$'),
    estado VARCHAR(2) NOT NULL,         
    cidade VARCHAR(100) NOT NULL,
    bairro VARCHAR(100) NOT NULL,
    logradouro VARCHAR(150) NOT NULL,
    numero VARCHAR(10) NOT NULL,        
    complemento VARCHAR(100),           
    tipo_endereco VARCHAR(20) NOT NULL DEFAULT 'CASA', 
    CONSTRAINT chk_tipo_endereco CHECK (tipo_endereco IN ('CASA', 'APARTAMENTO', 'TRABALHO', 'OUTRO')),
    principal BOOLEAN NOT NULL DEFAULT FALSE, 
    data_cadastro TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
