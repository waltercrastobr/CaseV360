CREATE SCHEMA IF NOT EXISTS schema_v360;

CREATE TABLE schema_v360.usuario (
    usuario_id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    sobrenome VARCHAR(100) NOT NULL,
    area VARCHAR(50),
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    data_atualizacao TIMESTAMP
);

CREATE TABLE schema_v360.nota_fiscal (
    nota_fiscal_id SERIAL PRIMARY KEY,
    cnpj_fornecedor VARCHAR(20) NOT NULL,
    nome_fornecedor VARCHAR(100),
    produto VARCHAR(100),
    valor DECIMAL(10, 2),
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    data_atualizacao TIMESTAMP
);

CREATE TABLE schema_v360.divergencia (
    divergencia_id SERIAL PRIMARY KEY,
    nome_divergencia VARCHAR(100),
    tipo_divergencia VARCHAR(50),
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    data_atualizacao TIMESTAMP,
    data_resolucao TIMESTAMP
);

CREATE TABLE schema_v360.processo (
    processo_id SERIAL PRIMARY KEY,
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    data_finalizacao TIMESTAMP,
    tipo_processo VARCHAR(50),
    usuario_atribuido_id INT,
    divergencia_id INT,
    nota_fiscal_id INT NOT NULL,
    FOREIGN KEY (usuario_atribuido_id) REFERENCES schema_v360.usuario(usuario_id),
    FOREIGN KEY (divergencia_id) REFERENCES schema_v360.divergencia(divergencia_id),
    FOREIGN KEY (nota_fiscal_id) REFERENCES schema_v360.nota_fiscal(nota_fiscal_id)
);
