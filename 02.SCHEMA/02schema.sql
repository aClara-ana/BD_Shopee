CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE TABLE usuario(
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  nome VARCHAR(300) NOT NULL,
  username VARCHAR (30) NOT NULL,
  CONSTRAINT chk_username_shopee 
        CHECK (username ~ '^[a-zA-Z0-9._]{5,30}$'),
  email VARCHAR(30) UNIQUE NOT NULL,
  CONSTRAINT chk_email_formato_valido --CONSTRAINT AJUDA IDENTIFICAR QUAL REGRA NÃO FOI SEGUIDA--
        CHECK (email ~ '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'),
  numero_celular VARCHAR(11) UNIQUE NOT NULL, 
  CONSTRAINT chk_numero_valido 
  		CHECK (numero_celular ~ '^[0-9]{10,11}$') 
 );
