-- Kaua Almeida Silveira - RM 552618
-- Gustavo Ara�jo Maia - RM 553270
-- Rafael Vida Fernandes - RM 553721

-- Drop das tabelas, removendo todas as restricoes de chave estrangeira referenciadas em cascata.
DROP TABLE tb_endereco CASCADE CONSTRAINTS;
DROP TABLE tb_feedback CASCADE CONSTRAINTS;
DROP TABLE tb_fonte_poluicao CASCADE CONSTRAINTS;
DROP TABLE tb_instituicao CASCADE CONSTRAINTS;
DROP TABLE tb_reporte CASCADE CONSTRAINTS;
DROP TABLE tb_usuario CASCADE CONSTRAINTS;


-- Cria��o da tabela TB_INSTITUICAO
CREATE TABLE TB_INSTITUICAO (
    ID NUMBER GENERATED BY DEFAULT AS IDENTITY,
    NOME VARCHAR2(255),
    EMAIL VARCHAR2(255),
    TELEFONE VARCHAR2(20)
);

-- Adiciona uma chave prim�ria na tabela TB_INSTITUICAO
ALTER TABLE TB_INSTITUICAO
ADD CONSTRAINT PK_TB_INSTITUICAO_ID PRIMARY KEY (ID);

-- Cria��o da tabela TB_USUARIO
CREATE TABLE TB_USUARIO (
    ID NUMBER GENERATED BY DEFAULT AS IDENTITY,
    NOME VARCHAR2(255),
    EMAIL VARCHAR2(255),
    TELEFONE VARCHAR2(20)
);

-- Adiciona uma chave prim�ria na tabela TB_USUARIO
ALTER TABLE TB_USUARIO
ADD CONSTRAINT PK_TB_USUARIO_ID PRIMARY KEY (ID);

-- Cria��o da tabela TB_ENDERECO
CREATE TABLE TB_ENDERECO (
    ID NUMBER GENERATED BY DEFAULT AS IDENTITY,
    ENDERECO VARCHAR2(255),
    BAIRRO VARCHAR2(255),
    CIDADE VARCHAR2(255),
    ESTADO VARCHAR2(255),
    CEP VARCHAR2(20),
    PAIS VARCHAR2(255),
    LAT VARCHAR2(50),
    LNG VARCHAR2(50)
);

-- Adiciona uma chave prim�ria na tabela TB_ENDERECO
ALTER TABLE TB_ENDERECO
ADD CONSTRAINT PK_TB_ENDERECO_ID PRIMARY KEY (ID);

-- Cria��o da tabela TB_FONTE_POLUICAO
CREATE TABLE TB_FONTE_POLUICAO (
    ID NUMBER GENERATED BY DEFAULT AS IDENTITY,
    TIPO VARCHAR2(255),
    DESCRICAO VARCHAR2(255)
);

-- Adiciona uma chave prim�ria na tabela TB_FONTE_POLUICAO
ALTER TABLE TB_FONTE_POLUICAO
ADD CONSTRAINT PK_TB_FONTE_POLUICAO_ID PRIMARY KEY (ID);

-- Cria��o da tabela TB_REPORTE
CREATE TABLE TB_REPORTE (
    ID NUMBER GENERATED BY DEFAULT AS IDENTITY,
    DESCRICAO VARCHAR2(255),
    DATA DATE,
    HORA TIMESTAMP,
    URGENCIA VARCHAR2(255),
    STATUS VARCHAR2(255),
    IMG_URL VARCHAR2(255),
    ENDERECO_ID NUMBER,
    ID_USUARIO NUMBER,
    FONTE_POLUICAO_ID NUMBER
);

-- Adiciona uma chave prim�ria na tabela TB_REPORTE
ALTER TABLE TB_REPORTE
ADD CONSTRAINT PK_TB_REPORTE_ID PRIMARY KEY (ID);

-- Adiciona uma chave estrangeira para a coluna ENDERECO_ID na tabela TB_REPORTE
ALTER TABLE TB_REPORTE
ADD CONSTRAINT FK_TB_REPORTE_ENDERECO_ID FOREIGN KEY (ENDERECO_ID) REFERENCES TB_ENDERECO(ID);

-- Adiciona uma chave estrangeira para a coluna ID_USUARIO na tabela TB_REPORTE
ALTER TABLE TB_REPORTE
ADD CONSTRAINT FK_TB_REPORTE_ID_USUARIO FOREIGN KEY (ID_USUARIO) REFERENCES TB_USUARIO(ID);

-- Adiciona uma chave estrangeira para a coluna FONTE_POLUICAO_ID na tabela TB_REPORTE
ALTER TABLE TB_REPORTE
ADD CONSTRAINT FK_TB_REPORTE_FONTE_POLUICAO_ID FOREIGN KEY (FONTE_POLUICAO_ID) REFERENCES TB_FONTE_POLUICAO(ID);

-- Cria��o da tabela TB_FEEDBACK
CREATE TABLE TB_FEEDBACK (
    ID NUMBER GENERATED ALWAYS AS IDENTITY,
    DATA TIMESTAMP,
    STATUS VARCHAR2(255),
    DESCRICAO VARCHAR2(255),
    RESPONSAVEL VARCHAR2(255),
    IMG_URL VARCHAR2(255),
    REPORTE_ID NUMBER,
    INSTITUICAO_ID NUMBER
);

-- Adiciona uma chave prim�ria na tabela TB_FEEDBACK
ALTER TABLE TB_FEEDBACK
ADD CONSTRAINT PK_TB_FEEDBACK_ID PRIMARY KEY (ID);

-- Adiciona uma chave estrangeira para a coluna REPORTE_ID na tabela TB_FEEDBACK
ALTER TABLE TB_FEEDBACK
ADD CONSTRAINT FK_TB_FEEDBACK_REPORTE_ID FOREIGN KEY (REPORTE_ID) REFERENCES TB_REPORTE(ID);

-- Adiciona uma chave estrangeira para a coluna ID_INSTITUICAO na tabela TB_FEEDBACK
ALTER TABLE TB_FEEDBACK
ADD CONSTRAINT FK_TB_FEEDBACK_ID_INSTITUICAO FOREIGN KEY (INSTITUICAO_ID) REFERENCES TB_INSTITUICAO(ID);

COMMIT;







