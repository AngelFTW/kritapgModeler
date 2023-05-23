CREATE SCHEMA IF NOT EXISTS dbo;

CREATE  TABLE dbo.atividade ( 
	id                   smallint  NOT NULL  ,
	nome                 varchar(25)  NOT NULL  ,
	CONSTRAINT pk_atividade PRIMARY KEY ( id )
 );

CREATE  TABLE dbo.atividade_time ( 
	id                   smallint  NOT NULL  ,
	nome                 varchar(30)  NOT NULL  ,
	CONSTRAINT pk_atividade_time PRIMARY KEY ( id )
 );

CREATE  TABLE dbo.cargo_salario_historico ( 
	id                   serial  NOT NULL  ,
	id_cargo_salario     integer  NOT NULL  ,
	id_unidade           smallint  NOT NULL  ,
	id_faixa_salarial    smallint  NOT NULL  ,
	valor                decimal(7,2)  NOT NULL  ,
	data_validade        date  NOT NULL  ,
	usuario_cadastro     integer  NOT NULL  ,
	data_cadastro        timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL  ,
	usuario_ultima_alteracao integer    ,
	data_ultima_alteracao timestamp    ,
	CONSTRAINT pk_cargo_salario_historico PRIMARY KEY ( id )
 );

CREATE  TABLE dbo.cliente ( 
	id                   smallserial  NOT NULL  ,
	razao_social         varchar(145)  NOT NULL  ,
	nome_fantasia        varchar(145)  NOT NULL  ,
	cnpj                 bigint  NOT NULL  ,
	inscricao_estadual   integer    ,
	inscricao_municipal  integer    ,
	rua                  varchar(145)  NOT NULL  ,
	numero               varchar(8)  NOT NULL  ,
	complemento          varchar(100)    ,
	bairro               varchar(45)  NOT NULL  ,
	cidade               varchar(60)  NOT NULL  ,
	uf                   char(2)  NOT NULL  ,
	cep                  integer  NOT NULL  ,
	usuario_cadastro     integer  NOT NULL  ,
	data_cadastro        timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL  ,
	usuario_ultima_alteracao integer    ,
	data_ultima_alteracao timestamp    ,
	CONSTRAINT pk_cliente PRIMARY KEY ( id )
 );

CREATE  TABLE dbo.departamento ( 
	id                   smallserial  NOT NULL  ,
	id_cliente           smallint  NOT NULL  ,
	nome                 varchar(60)  NOT NULL  ,
	usuario_cadastro     integer  NOT NULL  ,
	data_cadastro        timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL  ,
	usuario_ultima_alteracao integer    ,
	data_ultima_alteracao timestamp    ,
	CONSTRAINT pk_departamento PRIMARY KEY ( id )
 );

CREATE  TABLE dbo.documento_tipo ( 
	id                   smallint  NOT NULL  ,
	nome                 varchar(50)  NOT NULL  ,
	CONSTRAINT pk_documento_tipo PRIMARY KEY ( id )
 );

CREATE  TABLE dbo.empresa ( 
	id                   smallserial  NOT NULL  ,
	razao_social         varchar(145)  NOT NULL  ,
	nome_fantasia        varchar(145)  NOT NULL  ,
	cnpj                 bigint  NOT NULL  ,
	inscricao_estadual   integer    ,
	inscricao_municipal  integer    ,
	rua                  varchar(145)  NOT NULL  ,
	numero               varchar(8)  NOT NULL  ,
	complemento          varchar(100)    ,
	bairro               varchar(45)  NOT NULL  ,
	cidade               varchar(60)  NOT NULL  ,
	uf                   char(2)  NOT NULL  ,
	cep                  integer  NOT NULL  ,
	usuario_cadastro     integer  NOT NULL  ,
	data_cadastro        timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL  ,
	usuario_ultima_alteracao integer    ,
	data_ultima_alteracao timestamp    ,
	CONSTRAINT pk_empresa PRIMARY KEY ( id )
 );

CREATE  TABLE dbo.etapa_tipo ( 
	id                   smallint  NOT NULL  ,
	nome                 varchar(30)  NOT NULL  ,
	CONSTRAINT pk_etapatipo PRIMARY KEY ( id )
 );

CREATE  TABLE dbo.extensao_documento ( 
	id                   smallint  NOT NULL  ,
	nome                 varchar(35)  NOT NULL  ,
	CONSTRAINT pk_tipo_arquivo PRIMARY KEY ( id )
 );

CREATE  TABLE dbo.funcao ( 
	id                   smallserial  NOT NULL  ,
	nome                 varchar(45)  NOT NULL  ,
	usuario_cadastro     integer  NOT NULL  ,
	data_cadastro        timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL  ,
	usuario_ultima_alteracao integer    ,
	data_ultima_alteracao timestamp    ,
	CONSTRAINT pk_funcao PRIMARY KEY ( id )
 );

CREATE  TABLE dbo.hub ( 
	id                   smallserial  NOT NULL  ,
	nome                 varchar(25)  NOT NULL  ,
	CONSTRAINT pk_unidade PRIMARY KEY ( id )
 );

CREATE  TABLE dbo.item_pre_faturado ( 
	id                   integer  NOT NULL  ,
	descricao            varchar(4000)  NOT NULL  ,
	valor                decimal(8)  NOT NULL  ,
	usuario_cadastro     integer    NOT NULL,
	data_cadastro        timestamp    NOT NULL,
	usuario_ultima_alteracao integer    ,
	data_ultima_alteracao timestamp    ,
	CONSTRAINT pk_item_pre_faturado PRIMARY KEY ( id )
 );

CREATE  TABLE dbo.nota_fiscal ( 
	id                   serial  NOT NULL  ,
	id_empresa           smallint  NOT NULL  ,
	id_cliente           smallserial  NOT NULL  ,
	data_emissao         date  NOT NULL  ,
	data_vencimento      date  NOT NULL  ,
	ano_competencia      smallint  NOT NULL  ,
	mes_competencia      smallint  NOT NULL  ,
	numero_nota_fiscal   integer    ,
	usuario_cadastro     integer  NOT NULL  ,
	data_cadastro        timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL  ,
	usuario_ultima_alteracao integer    ,
	data_ultima_alteracao timestamp    ,
	CONSTRAINT pk_nota_fiscal PRIMARY KEY ( id )
 );

CREATE  TABLE dbo.opcao_sistema ( 
	id                   serial  NOT NULL  ,
	id_opcao_mae         integer    ,
	descricao            varchar(50)  NOT NULL  ,
	usuario_cadastro     integer  NOT NULL  ,
	data_cadastro        timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL  ,
	usuario_ultima_alteracao integer    ,
	data_ultima_alteracao timestamp    ,
	CONSTRAINT pk_opcao_sistema PRIMARY KEY ( id )
 );

CREATE  TABLE dbo.parametrizacao ( 
	id                   smallserial  NOT NULL  ,
	percentual_bonificacao decimal(3,1)  NOT NULL  ,
	percentual_teto      decimal(3,1)  NOT NULL  ,
	contador_gatilho     smallint  NOT NULL  ,
	data_validade        date  NOT NULL  ,
	usuario_cadastro     integer  NOT NULL  ,
	data_cadastro        timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL  ,
	usuario_ultima_alteracao integer    ,
	data_ultima_alteracao timestamp    ,
	CONSTRAINT pk_parametrizacao PRIMARY KEY ( id )
 );

CREATE  TABLE dbo.parametrizacao_historico ( 
	id                   smallserial  NOT NULL  ,
	id_parametrizacao    serial  NOT NULL  ,
	percentual_bonificacao decimal(3,1)  NOT NULL  ,
	percentual_teto      decimal(3,1)  NOT NULL  ,
	contador_gatilho     smallint  NOT NULL  ,
	data_validade        date  NOT NULL  ,
	usuario_cadastro     integer  NOT NULL  ,
	data_cadastro        timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL  ,
	usuario_ultima_alteracao integer    ,
	data_ultima_alteracao timestamp    ,
	CONSTRAINT pk_parametrizacao_historico PRIMARY KEY ( id )
 );

CREATE  TABLE dbo.percentual_etapa ( 
	id                   smallserial  NOT NULL  ,
	id_etapa_tipo        smallint  NOT NULL  ,
	id_cliente           smallint  NOT NULL  ,
	percentual           decimal  NOT NULL  ,
	data_validade        date  NOT NULL  ,
	usuario_cadastro     integer  NOT NULL  ,
	data_cadastro        timestamp  NOT NULL  ,
	CONSTRAINT pk_preco_etapa PRIMARY KEY ( id )
 );

CREATE  TABLE dbo.premiacao ( 
	id                   serial  NOT NULL  ,
	ano                  smallint  NOT NULL  ,
	mes                  smallint  NOT NULL  ,
	usuario_pagamento    integer    ,
	data_pagamento       date    ,
	usuario_cadastro     integer  NOT NULL  ,
	data_cadastro        timestamp  NOT NULL  ,
	CONSTRAINT pk_premiacao PRIMARY KEY ( id )
 );

CREATE  TABLE dbo.projeto_tipo ( 
	id                   smallint  NOT NULL  ,
	nome                 varchar(45)  NOT NULL  ,
	CONSTRAINT pk_projeto_tipo PRIMARY KEY ( id )
 );

CREATE  TABLE dbo.status_apontamento ( 
	id                   smallint  NOT NULL  ,
	nome                 varchar(50)  NOT NULL  ,
	CONSTRAINT pk_status_apontamento PRIMARY KEY ( id )
 );

CREATE  TABLE dbo."time" ( 
	id                   serial  NOT NULL  ,
	nome                 varchar(100)  NOT NULL  ,
	usuario_cadastro     integer  NOT NULL  ,
	data_cadastro        timestamp  NOT NULL  ,
	usuario_ultima_alteracao integer    ,
	data_ultima_alteracao timestamp    ,
	CONSTRAINT pk_time PRIMARY KEY ( id )
 );

CREATE  TABLE dbo.usuario ( 
	id                   serial  NOT NULL  ,
	apelido              varchar(36)  NOT NULL  ,
	email                varchar(100)  NOT NULL  ,
	senha                varchar(35)  NOT NULL  ,
	data_expiracao_senha date  NOT NULL  ,
	data_bloqueio        timestamp    ,
	usuario_cadastro     integer  NOT NULL  ,
	data_cadastro        timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL  ,
	usuario_ultima_alteracao integer    ,
	data_ultima_alteracao timestamp    ,
	CONSTRAINT pk_usuario PRIMARY KEY ( id )
 );

CREATE UNIQUE INDEX unq_usuario ON dbo.usuario ( email );

CREATE  TABLE dbo.usuario_opcao ( 
	id_usuario           integer  NOT NULL  ,
	id_opcao_sistema     integer  NOT NULL  ,
	usuario_cadastro     integer  NOT NULL  ,
	data_cadastro        timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL  ,
	CONSTRAINT pk_usuario_opcao PRIMARY KEY ( id_usuario, id_opcao_sistema )
 );

CREATE  TABLE dbo.colaborador ( 
	id                   smallserial  NOT NULL  ,
	id_usuario           integer  NOT NULL  ,
	nome                 varchar(60)  NOT NULL  ,
	data_admissao        date  NOT NULL  ,
	data_demissao        date    ,
	ddd                  smallint    ,
	celular              integer    ,
	whatsapp             boolean    ,
	skype                varchar(40)    ,
	discord              varchar(40)    ,
	usuario_cadastro     integer  NOT NULL  ,
	data_cadastro        timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL  ,
	usuario_ultima_alteracao integer    ,
	data_ultima_alteracao timestamp    ,
	CONSTRAINT pk_colaborador PRIMARY KEY ( id )
 );

CREATE  TABLE dbo.colaborador_time ( 
	id                   serial  NOT NULL  ,
	id_colaborador       integer  NOT NULL  ,
	id_time              integer  NOT NULL  ,
	id_atividade_time    smallint  NOT NULL  ,
	usuario_cadastro     integer  NOT NULL  ,
	data_cadastro        timestamp  NOT NULL  ,
	usuario_ultima_alteracao integer    ,
	data_ultima_alteracao timestamp    ,
	CONSTRAINT pk_colaborador_time PRIMARY KEY ( id )
 );

CREATE  TABLE dbo.contador_tentativas ( 
	id                   serial  NOT NULL  ,
	id_usuario           integer  NOT NULL  ,
	ip                   varchar  NOT NULL  ,
	quantidade           smallint  NOT NULL  ,
	data_cadastro        timestamp  NOT NULL  ,
	CONSTRAINT pk_contador_tentativas PRIMARY KEY ( id )
 );

CREATE  TABLE dbo.contato ( 
	id                   smallserial  NOT NULL  ,
	id_departamento      smallint  NOT NULL  ,
	nome                 varchar(60)  NOT NULL  ,
	email                varchar(100)  NOT NULL  ,
	ddd_celular          smallint    ,
	ddd_fixo             smallint    ,
	celular              integer    ,
	fixo                 integer    ,
	whatsapp             boolean  NOT NULL  ,
	ramal                smallint    ,
	skype                varchar(40)    ,
	discord              varchar(40)    ,
	usuario_cadastro     integer  NOT NULL  ,
	data_cadastro        timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL  ,
	usuario_ultima_alteracao integer    ,
	data_ultima_alteracao timestamp    ,
	CONSTRAINT pk_contato PRIMARY KEY ( id )
 );

CREATE  TABLE dbo.faixa_salarial ( 
	id                   smallserial  NOT NULL  ,
	id_funcao            smallint  NOT NULL  ,
	nome                 varchar(25)  NOT NULL  ,
	clt_ou_pj            char(1)  NOT NULL  ,
	usuario_cadastro     integer  NOT NULL  ,
	data_cadastro        timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL  ,
	usuario_ultima_alteracao integer    ,
	data_ultima_alteracao timestamp    ,
	CONSTRAINT pk_faixa_salarial PRIMARY KEY ( id )
 );

CREATE  TABLE dbo.item_nota_fiscal ( 
	id                   serial  NOT NULL  ,
	id_nota_fiscal       integer  NOT NULL  ,
	id_item_pre_faturado integer  NOT NULL  ,
	descricao            varchar(4000)  NOT NULL  ,
	valor                decimal(8,2)  NOT NULL  ,
	usuario_cadastro     integer  NOT NULL  ,
	data_cadastro        timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL  ,
	usuario_ultima_alteracao integer    ,
	data_ultima_alteracao timestamp    ,
	CONSTRAINT pk_item_notafiscal PRIMARY KEY ( id )
 );

CREATE  TABLE dbo.preco ( 
	id                   serial  NOT NULL  ,
	id_cliente           smallint  NOT NULL  ,
	id_projeto_tipo      smallint  NOT NULL  ,
	data_validade        date  NOT NULL  ,
	valor_hora           decimal(6,2)  NOT NULL  ,
	usuario_cadastro     integer  NOT NULL  ,
	data_cadastro        timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL  ,
	usuario_ultima_alteracao integer    ,
	data_ultima_alteracao timestamp    ,
	CONSTRAINT pk_preco PRIMARY KEY ( id )
 );

CREATE  TABLE dbo.premiacao_detalhe ( 
	id                   integer  NOT NULL  ,
	id_premiacao         integer  NOT NULL  ,
	id_colaborador       smallint  NOT NULL  ,
	valor                decimal(7,2)  NOT NULL  ,
	status_meta_premiacao smallint  NOT NULL  ,
	valor_ajuste         decimal(7,2)    ,
	usuario_ultima_alteracao integer    ,
	data_ultima_alteracao timestamp    ,
	CONSTRAINT pk_premiacao_detalhe PRIMARY KEY ( id )
 );

CREATE  TABLE dbo.projeto ( 
	id                   serial  NOT NULL  ,
	id_projeto_mae       integer    ,
	id_preco             integer  NOT NULL  ,
	id_colaborador       smallint  NOT NULL  ,
	nome                 varchar(60)  NOT NULL  ,
	descricao            varchar(4000)  NOT NULL  ,
	data_entrada         timestamp  NOT NULL  ,
	data_inicio          timestamp    ,
	data_fim             date    ,
	quantidade_total_minutos integer  NOT NULL  ,
	usuario_cadastro     integer  NOT NULL  ,
	data_cadastro        timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL  ,
	usuario_ultima_alteracao integer    ,
	data_ultima_alteracao timestamp    ,
	CONSTRAINT pk_projeto PRIMARY KEY ( id )
 );

CREATE  TABLE dbo.projeto_atividade ( 
	id                   serial  NOT NULL  ,
	id_contato           smallint  NOT NULL  ,
	id_projeto           integer  NOT NULL  ,
	id_atividade         smallint  NOT NULL  ,
	usuario_cadastro     integer  NOT NULL  ,
	data_cadastro        timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL  ,
	CONSTRAINT pk_projeto_atividade PRIMARY KEY ( id )
 );

CREATE  TABLE dbo.cargo_salario ( 
	id                   serial  NOT NULL  ,
	id_hub               smallint  NOT NULL  ,
	id_faixa_salarial    smallint  NOT NULL  ,
	valor                decimal(7,2)  NOT NULL  ,
	data_validade        date  NOT NULL  ,
	usuario_cadastro     integer  NOT NULL  ,
	data_cadastro        timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL  ,
	usuario_ultima_alteracao integer    ,
	data_ultima_alteracao timestamp    ,
	CONSTRAINT pk_cargo_salario PRIMARY KEY ( id )
 );

CREATE  TABLE dbo.documento_projeto ( 
	id                   serial  NOT NULL  ,
	id_projeto           integer  NOT NULL  ,
	id_extensao_documento smallint  NOT NULL  ,
	id_documento_tipo    smallint  NOT NULL  ,
	descricao            varchar(4000)  NOT NULL  ,
	data_criacao         date  NOT NULL  ,
	usuario_cadastro     integer  NOT NULL  ,
	data_cadastro        timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL  ,
	usuario_ultima_alteracao integer    ,
	data_ultima_alteracao timestamp    ,
	CONSTRAINT pk_documento PRIMARY KEY ( id )
 );

CREATE  TABLE dbo.entrega ( 
	id                   serial  NOT NULL  ,
	id_projeto           integer  NOT NULL  ,
	id_contato_homologacao smallint    ,
	id_contato_aprovacao smallint    ,
	data_inicio_prevista timestamp    ,
	data_termino_prevista timestamp    ,
	data_inicio          timestamp    ,
	data_entrega         timestamp    ,
	descricao            varchar(4000)  NOT NULL  ,
	usuario_cadastro     integer  NOT NULL  ,
	data_cadastro        timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL  ,
	usuario_ultima_alteracao integer    ,
	data_ultima_alteracao timestamp    ,
	CONSTRAINT pk_entrega PRIMARY KEY ( id )
 );

CREATE  TABLE dbo.entrega_documento ( 
	id_entrega           integer  NOT NULL  ,
	id_documento         integer  NOT NULL  ,
	CONSTRAINT pk_entrega_documento PRIMARY KEY ( id_entrega, id_documento )
 );

CREATE  TABLE dbo.etapa ( 
	id                   serial  NOT NULL  ,
	id_projeto           integer  NOT NULL  ,
	id_percentual_etapa  smallint  NOT NULL  ,
	id_item_pre_faturado integer    ,
	id_premiacao         integer    ,
	data_inicio_prevista date    ,
	data_termino_prevista date    ,
	data_inicio          date    ,
	data_termino         date    ,
	usuario_cadastro     integer  NOT NULL  ,
	data_cadastro        timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL  ,
	usuario_ultima_alteracao integer    ,
	data_ultima_alteracao timestamp    ,
	CONSTRAINT pk_etapa PRIMARY KEY ( id ),
	CONSTRAINT unq_etapa UNIQUE (id_item_pre_faturado) 
 );

CREATE  TABLE dbo.projeto_documento ( 
	id_projeto           integer  NOT NULL  ,
	id_documento         integer  NOT NULL  ,
	CONSTRAINT pk_projeto_documento PRIMARY KEY ( id_projeto, id_documento )
 );

CREATE  TABLE dbo.qualificacao ( 
	id                   smallserial  NOT NULL  ,
	id_cargo_salario     integer  NOT NULL  ,
	id_colaborador       smallint  NOT NULL  ,
	data_inicio          date  NOT NULL  ,
	data_fim             date    ,
	usuario_cadastro     integer  NOT NULL  ,
	data_cadastro        timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL  ,
	usuario_ultima_alteracao timestamp    ,
	data_ultima_alteracao timestamp    ,
	CONSTRAINT pk_qualificacao PRIMARY KEY ( id )
 );

ALTER TABLE dbo.qualificacao ADD CONSTRAINT "constraint data_fim_maior_data_inicio" CHECK ( data_fim > data_inicio );

CREATE  TABLE dbo.apontamento ( 
	id                   serial  NOT NULL  ,
	id_colaborador       smallint  NOT NULL  ,
	id_status_apontamento smallint  NOT NULL  ,
	id_premiacao         integer    ,
	id_entrega           serial  NOT NULL  ,
	id_item_pre_faturado integer    ,
	descricao            varchar(4000)  NOT NULL  ,
	quantidade_minutos_cobrados integer  NOT NULL  ,
	quantidade_minutos_trabalhados integer  NOT NULL  ,
	data_apontamento     date  NOT NULL  ,
	data_conferencia     date    ,
	data_reprovacao_conferencia date    ,
	data_aprovacao       date    ,
	data_reprovacao      date    ,
	usuario_cadastro     integer  NOT NULL  ,
	data_cadastro        timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL  ,
	usuario_ultima_alteracao integer    ,
	data_ultima_alteracao timestamp    ,
	motivo               varchar(4000)    ,
	CONSTRAINT pk_apontamento PRIMARY KEY ( id )
 );

CREATE  TABLE dbo.apontamento_etapa ( 
	id                   serial  NOT NULL  ,
	id_etapa             integer  NOT NULL  ,
	id_colaborador       smallint  NOT NULL  ,
	descricao            varchar(4000)  NOT NULL  ,
	quantidade_minutos_trabalhados integer    ,
	quantidade_minutos_cobrados integer  NOT NULL  ,
	data_apontamento     date  NOT NULL  ,
	usuario_cadastro     integer  NOT NULL  ,
	data_cadastro        timestamp  NOT NULL  ,
	usuario_ultima_alteracao integer    ,
	data_ultima_alteracao timestamp    ,
	CONSTRAINT pk_apontamento_etapa PRIMARY KEY ( id )
 );


ALTER TABLE dbo.apontamento ADD CONSTRAINT fk_colaborador_apontamento FOREIGN KEY ( id_colaborador ) REFERENCES dbo.colaborador( id );

ALTER TABLE dbo.apontamento ADD CONSTRAINT fk_apontamento_entrega FOREIGN KEY ( id_entrega ) REFERENCES dbo.entrega( id );

ALTER TABLE dbo.apontamento ADD CONSTRAINT fk_apontamento_status_apontamento FOREIGN KEY ( id_status_apontamento ) REFERENCES dbo.status_apontamento( id );

ALTER TABLE dbo.apontamento ADD CONSTRAINT fk_apontamento_item_pre_faturado FOREIGN KEY ( id_item_pre_faturado ) REFERENCES dbo.item_pre_faturado( id );

ALTER TABLE dbo.apontamento ADD CONSTRAINT fk_apontamento_premiacao FOREIGN KEY ( id_premiacao ) REFERENCES dbo.premiacao( id );

ALTER TABLE dbo.apontamento_etapa ADD CONSTRAINT fk_apontamento_etapa_etapa FOREIGN KEY ( id_etapa ) REFERENCES dbo.etapa( id );

ALTER TABLE dbo.apontamento_etapa ADD CONSTRAINT fk_apontamento_etapa_colaborador FOREIGN KEY ( id_colaborador ) REFERENCES dbo.colaborador( id );

ALTER TABLE dbo.cargo_salario ADD CONSTRAINT fk_cargo_salario_hub FOREIGN KEY ( id_hub ) REFERENCES dbo.hub( id );

ALTER TABLE dbo.cargo_salario ADD CONSTRAINT fk_cargo_salario_faixa_salarial FOREIGN KEY ( id_faixa_salarial ) REFERENCES dbo.faixa_salarial( id );

ALTER TABLE dbo.colaborador ADD CONSTRAINT fk_colaborador_usuario FOREIGN KEY ( id_usuario ) REFERENCES dbo.usuario( id );

ALTER TABLE dbo.colaborador_time ADD CONSTRAINT fk_colaborador_time_colaborador FOREIGN KEY ( id_colaborador ) REFERENCES dbo.colaborador( id );

ALTER TABLE dbo.colaborador_time ADD CONSTRAINT fk_colaborador_time_time FOREIGN KEY ( id_time ) REFERENCES dbo."time"( id );

ALTER TABLE dbo.colaborador_time ADD CONSTRAINT fk_colaborador_time_atividade_time FOREIGN KEY ( id_atividade_time ) REFERENCES dbo.atividade_time( id );

ALTER TABLE dbo.contador_tentativas ADD CONSTRAINT fk_contador_tentativas_usuario FOREIGN KEY ( id_usuario ) REFERENCES dbo.usuario( id );

ALTER TABLE dbo.contato ADD CONSTRAINT fk_contato_departamento FOREIGN KEY ( id_departamento ) REFERENCES dbo.departamento( id );

ALTER TABLE dbo.departamento ADD CONSTRAINT fk_departamento_cliente FOREIGN KEY ( id_cliente ) REFERENCES dbo.cliente( id );

ALTER TABLE dbo.documento_projeto ADD CONSTRAINT fk_documento_extensao_documento FOREIGN KEY ( id_extensao_documento ) REFERENCES dbo.extensao_documento( id );

ALTER TABLE dbo.documento_projeto ADD CONSTRAINT fk_documento_documento_tipo FOREIGN KEY ( id_documento_tipo ) REFERENCES dbo.documento_tipo( id );

ALTER TABLE dbo.documento_projeto ADD CONSTRAINT fk_documento_projeto FOREIGN KEY ( id_projeto ) REFERENCES dbo.projeto( id );

ALTER TABLE dbo.entrega ADD CONSTRAINT fk_entrega_projeto FOREIGN KEY ( id_projeto ) REFERENCES dbo.projeto( id );

ALTER TABLE dbo.entrega ADD CONSTRAINT fk_entrega_contato FOREIGN KEY ( id_contato_homologacao ) REFERENCES dbo.contato( id );

ALTER TABLE dbo.entrega ADD CONSTRAINT fk_entrega_contato_aprovacao FOREIGN KEY ( id_contato_aprovacao ) REFERENCES dbo.contato( id );

ALTER TABLE dbo.entrega_documento ADD CONSTRAINT fk_entrega_documento_documento FOREIGN KEY ( id_documento ) REFERENCES dbo.documento_projeto( id );

ALTER TABLE dbo.entrega_documento ADD CONSTRAINT fk_entrega_documento_entrega FOREIGN KEY ( id_entrega ) REFERENCES dbo.entrega( id );

ALTER TABLE dbo.etapa ADD CONSTRAINT fk_projeto_etapa FOREIGN KEY ( id_projeto ) REFERENCES dbo.projeto( id );

ALTER TABLE dbo.etapa ADD CONSTRAINT fk_etapa_percentual_etapa FOREIGN KEY ( id_percentual_etapa ) REFERENCES dbo.percentual_etapa( id );

ALTER TABLE dbo.etapa ADD CONSTRAINT fk_etapa_item_pre_faturado FOREIGN KEY ( id_item_pre_faturado ) REFERENCES dbo.item_pre_faturado( id );

ALTER TABLE dbo.etapa ADD CONSTRAINT fk_etapa_premiacao FOREIGN KEY ( id_premiacao ) REFERENCES dbo.premiacao( id );

ALTER TABLE dbo.faixa_salarial ADD CONSTRAINT fk_faixa_salarial_faixa_salarial FOREIGN KEY ( id_funcao ) REFERENCES dbo.funcao( id );

ALTER TABLE dbo.item_nota_fiscal ADD CONSTRAINT fk_item_nota_fiscal_nota_fiscal FOREIGN KEY ( id_nota_fiscal ) REFERENCES dbo.nota_fiscal( id );

ALTER TABLE dbo.item_nota_fiscal ADD CONSTRAINT fk_item_nota_fiscal_item_pre_faturado FOREIGN KEY ( id_item_pre_faturado ) REFERENCES dbo.item_pre_faturado( id );

ALTER TABLE dbo.nota_fiscal ADD CONSTRAINT fk_nota_fiscal_empresa FOREIGN KEY ( id_empresa ) REFERENCES dbo.empresa( id );

ALTER TABLE dbo.nota_fiscal ADD CONSTRAINT fk_nota_fiscal_cliente FOREIGN KEY ( id_cliente ) REFERENCES dbo.cliente( id );

ALTER TABLE dbo.opcao_sistema ADD CONSTRAINT fk_opcao_sistema_opcao_sistema FOREIGN KEY ( id_opcao_mae ) REFERENCES dbo.opcao_sistema( id );

ALTER TABLE dbo.percentual_etapa ADD CONSTRAINT fk_percentual_etapa_etapa_tipo FOREIGN KEY ( id_etapa_tipo ) REFERENCES dbo.etapa_tipo( id );

ALTER TABLE dbo.percentual_etapa ADD CONSTRAINT fk_percentual_etapa_cliente FOREIGN KEY ( id_cliente ) REFERENCES dbo.cliente( id );

ALTER TABLE dbo.preco ADD CONSTRAINT fk_preco_cliente FOREIGN KEY ( id_cliente ) REFERENCES dbo.cliente( id );

ALTER TABLE dbo.preco ADD CONSTRAINT fk_preco_projeto_tipo FOREIGN KEY ( id_projeto_tipo ) REFERENCES dbo.projeto_tipo( id );

ALTER TABLE dbo.premiacao_detalhe ADD CONSTRAINT fk_premiacao_detalhe_premiacao FOREIGN KEY ( id_premiacao ) REFERENCES dbo.premiacao( id );

ALTER TABLE dbo.premiacao_detalhe ADD CONSTRAINT fk_premiacao_detalhe_colaborador FOREIGN KEY ( id_colaborador ) REFERENCES dbo.colaborador( id );

ALTER TABLE dbo.projeto ADD CONSTRAINT fk_projeto_preco FOREIGN KEY ( id_preco ) REFERENCES dbo.preco( id );

ALTER TABLE dbo.projeto ADD CONSTRAINT fk_projeto_projeto FOREIGN KEY ( id_projeto_mae ) REFERENCES dbo.projeto( id );

ALTER TABLE dbo.projeto ADD CONSTRAINT fk_projeto_colaborador FOREIGN KEY ( id_colaborador ) REFERENCES dbo.colaborador( id );

ALTER TABLE dbo.projeto_atividade ADD CONSTRAINT fk_projeto_atividade_contato FOREIGN KEY ( id_contato ) REFERENCES dbo.contato( id );

ALTER TABLE dbo.projeto_atividade ADD CONSTRAINT fk_projeto_atividade_projeto FOREIGN KEY ( id_projeto ) REFERENCES dbo.projeto( id );

ALTER TABLE dbo.projeto_atividade ADD CONSTRAINT fk_projeto_atividade_atividade FOREIGN KEY ( id_atividade ) REFERENCES dbo.atividade( id );

ALTER TABLE dbo.projeto_documento ADD CONSTRAINT fk_projeto_documento_projeto FOREIGN KEY ( id_projeto ) REFERENCES dbo.projeto( id );

ALTER TABLE dbo.projeto_documento ADD CONSTRAINT fk_projeto_documento_documento FOREIGN KEY ( id_documento ) REFERENCES dbo.documento_projeto( id );

ALTER TABLE dbo.qualificacao ADD CONSTRAINT fk_qualificacao_colaborador FOREIGN KEY ( id_colaborador ) REFERENCES dbo.colaborador( id );

ALTER TABLE dbo.qualificacao ADD CONSTRAINT fk_qualificacao_cargo_salario FOREIGN KEY ( id_cargo_salario ) REFERENCES dbo.cargo_salario( id );

ALTER TABLE dbo.usuario_opcao ADD CONSTRAINT fk_usuario_opcao_usuario FOREIGN KEY ( id_usuario ) REFERENCES dbo.usuario( id );

ALTER TABLE dbo.usuario_opcao ADD CONSTRAINT fk_usuario_opcao_opcao_sistema FOREIGN KEY ( id_opcao_sistema ) REFERENCES dbo.opcao_sistema( id );

COMMENT ON CONSTRAINT fk_colaborador_apontamento ON dbo.apontamento IS 'Chave estrangeira para tabela colaborador';

COMMENT ON CONSTRAINT fk_apontamento_entrega ON dbo.apontamento IS 'Chave estrangeira para tabela entrega';

COMMENT ON CONSTRAINT fk_apontamento_status_apontamento ON dbo.apontamento IS 'Chave estrangeira da tabela status apontamento.';

COMMENT ON CONSTRAINT fk_apontamento_item_pre_faturado ON dbo.apontamento IS 'Chave estrangeira para a tabela de item_pre_faturado.';

COMMENT ON CONSTRAINT fk_apontamento_premiacao ON dbo.apontamento IS 'Chave estrangeira para a tabela de premiação.';

COMMENT ON CONSTRAINT fk_apontamento_etapa_etapa ON dbo.apontamento_etapa IS 'Chave estrangeira para tabela projeto etapa.';

COMMENT ON CONSTRAINT fk_apontamento_etapa_colaborador ON dbo.apontamento_etapa IS 'Chave estrangeira para tabela colaborador.';

COMMENT ON CONSTRAINT fk_cargo_salario_hub ON dbo.cargo_salario IS 'Chave estrangeira para tabela unidade';

COMMENT ON CONSTRAINT fk_cargo_salario_faixa_salarial ON dbo.cargo_salario IS 'Chave estrangeira para tabela faixa_salarial';

COMMENT ON CONSTRAINT fk_colaborador_usuario ON dbo.colaborador IS 'Chave estrangeira para tabela usuário';

COMMENT ON CONSTRAINT fk_colaborador_time_colaborador ON dbo.colaborador_time IS 'Chave secundária para tabela colaborador.';

COMMENT ON CONSTRAINT fk_colaborador_time_time ON dbo.colaborador_time IS 'Chave secundária para tabela time.';

COMMENT ON CONSTRAINT fk_colaborador_time_atividade_time ON dbo.colaborador_time IS 'Chave estrangeira para tabela atividade time.';

COMMENT ON CONSTRAINT fk_contador_tentativas_usuario ON dbo.contador_tentativas IS 'chave estrangeira para tabela usuario';

COMMENT ON CONSTRAINT fk_contato_departamento ON dbo.contato IS 'Chave estrangeira para tabela departamento';

COMMENT ON CONSTRAINT fk_departamento_cliente ON dbo.departamento IS 'Chave estrangeira para tabela cliente';

COMMENT ON CONSTRAINT fk_documento_extensao_documento ON dbo.documento_projeto IS 'Chave estrangeira para tabela documentoTipo';

COMMENT ON CONSTRAINT fk_documento_documento_tipo ON dbo.documento_projeto IS 'Chave estrangeira para tabela documento categoria.';

COMMENT ON CONSTRAINT fk_entrega_projeto ON dbo.entrega IS 'Chave estrangeira para tabela projeto';

COMMENT ON CONSTRAINT fk_entrega_contato ON dbo.entrega IS 'chave estrangeira para tabela Contato';

COMMENT ON CONSTRAINT fk_entrega_contato_aprovacao ON dbo.entrega IS 'Chave estrangeira para tabela contato';

COMMENT ON CONSTRAINT fk_entrega_documento_documento ON dbo.entrega_documento IS 'Chave estrangeira para tabela documento';

COMMENT ON CONSTRAINT fk_entrega_documento_entrega ON dbo.entrega_documento IS 'Chave estrangeira para tabela entrega';

COMMENT ON CONSTRAINT fk_projeto_etapa ON dbo.etapa IS 'Chave estrangeira para tabela projeto';

COMMENT ON CONSTRAINT fk_etapa_percentual_etapa ON dbo.etapa IS 'Chave estrangeira para a tabela de percentual etapa.';

COMMENT ON CONSTRAINT fk_etapa_item_pre_faturado ON dbo.etapa IS 'Foreign key da tabela item_pre_faturado.';

COMMENT ON CONSTRAINT fk_etapa_premiacao ON dbo.etapa IS 'Chave estrangeira da tabela premiação.';

COMMENT ON CONSTRAINT fk_faixa_salarial_faixa_salarial ON dbo.faixa_salarial IS 'Chave estrangeira para tabela funcao';

COMMENT ON CONSTRAINT fk_item_nota_fiscal_nota_fiscal ON dbo.item_nota_fiscal IS 'Chave estrangeira para tabela notaFiscal';

COMMENT ON CONSTRAINT fk_item_nota_fiscal_item_pre_faturado ON dbo.item_nota_fiscal IS 'Campo para receber foreign key da tabela item_pre_faturado.';

COMMENT ON CONSTRAINT fk_nota_fiscal_empresa ON dbo.nota_fiscal IS 'Chave estrangeira para tabela empresa';

COMMENT ON CONSTRAINT fk_nota_fiscal_cliente ON dbo.nota_fiscal IS 'Chave estrangeira para a tabela cliente';

COMMENT ON CONSTRAINT fk_opcao_sistema_opcao_sistema ON dbo.opcao_sistema IS 'Chave estrageira para tabela opcaoSistema criando um auto relacionamento';

COMMENT ON CONSTRAINT fk_percentual_etapa_etapa_tipo ON dbo.percentual_etapa IS 'Chave estrangeira para a tabela de etapa tipo.';

COMMENT ON CONSTRAINT fk_percentual_etapa_cliente ON dbo.percentual_etapa IS 'Chave estrangeira da tabela cliente.';

COMMENT ON CONSTRAINT fk_preco_cliente ON dbo.preco IS 'Chave estrangeira para tabela cliente';

COMMENT ON CONSTRAINT fk_preco_projeto_tipo ON dbo.preco IS 'Chave estrangeira para tabela projetoTipo';

COMMENT ON CONSTRAINT fk_premiacao_detalhe_premiacao ON dbo.premiacao_detalhe IS 'Chave estrangeira para a tabela de premiação.';

COMMENT ON CONSTRAINT fk_premiacao_detalhe_colaborador ON dbo.premiacao_detalhe IS 'Campo para receber chave estrangeira da tabela colaborador.';

COMMENT ON CONSTRAINT fk_projeto_preco ON dbo.projeto IS 'Chave estrangeira para tabela preco';

COMMENT ON CONSTRAINT fk_projeto_projeto ON dbo.projeto IS 'Chave estrangeira com autorelacionamento com a tabela projeto';

COMMENT ON CONSTRAINT fk_projeto_colaborador ON dbo.projeto IS 'Chave estrangeira para tabela colaborador.';

COMMENT ON CONSTRAINT fk_projeto_atividade_contato ON dbo.projeto_atividade IS 'Chave estrangeira para tabela contato';

COMMENT ON CONSTRAINT fk_projeto_atividade_projeto ON dbo.projeto_atividade IS 'Chave estrangeira para tabela projeto';

COMMENT ON CONSTRAINT fk_projeto_atividade_atividade ON dbo.projeto_atividade IS 'Chave estrangeira para tabela Atividade';

COMMENT ON CONSTRAINT fk_projeto_documento_projeto ON dbo.projeto_documento IS 'Chave estrangeira para tabela projeto';

COMMENT ON CONSTRAINT fk_projeto_documento_documento ON dbo.projeto_documento IS 'Chave Estrangeira para tabela documento';

COMMENT ON CONSTRAINT fk_qualificacao_colaborador ON dbo.qualificacao IS 'Chave estrangeira para tabela colaborador';

COMMENT ON CONSTRAINT fk_qualificacao_cargo_salario ON dbo.qualificacao IS 'Chave estrangeira para tabela cargo Salario';

COMMENT ON CONSTRAINT fk_usuario_opcao_usuario ON dbo.usuario_opcao IS 'Chave estrangeira para tabela usuario';

COMMENT ON CONSTRAINT fk_usuario_opcao_opcao_sistema ON dbo.usuario_opcao IS 'Chave estrangeira para tabela opcaoSistema';

COMMENT ON CONSTRAINT pk_atividade ON dbo.atividade IS 'Chave de identificação da tabela atividade';

COMMENT ON TABLE dbo.atividade IS 'Tabela que descreve a atividade do contato no projeto';

COMMENT ON COLUMN dbo.atividade.id IS 'Campo para receber identificação na tabela';

COMMENT ON COLUMN dbo.atividade.nome IS 'Campo para receber o nome da atividade do contato no projeto';

COMMENT ON TABLE dbo.atividade_time IS 'Tabela para armezar informações da atividade do colaborador no time.';

COMMENT ON COLUMN dbo.atividade_time.id IS 'Chave de identificação da tabela';

COMMENT ON COLUMN dbo.atividade_time.nome IS 'Campo para receber o nome da atividade exercida pelo colaborador no time.';

COMMENT ON COLUMN dbo.cargo_salario_historico.id IS 'Chave de identificacao da tabela';

COMMENT ON COLUMN dbo.cargo_salario_historico.id_cargo_salario IS 'Campo que recebe o id da tabela cargo salario';

COMMENT ON COLUMN dbo.cargo_salario_historico.id_unidade IS 'Campo que recebe o id da tabela cargo Salario como uma chave estrangeira';

COMMENT ON COLUMN dbo.cargo_salario_historico.id_faixa_salarial IS 'Campo que recebe o id da cargo Salario como uma chave estrangeira';

COMMENT ON COLUMN dbo.cargo_salario_historico.valor IS 'Campo para receber o valor da faixa salarial por colaborador';

COMMENT ON COLUMN dbo.cargo_salario_historico.data_validade IS 'Campo que recebe a data em que a faixa salarial passou a ser valida com o novo valor.';

COMMENT ON COLUMN dbo.cargo_salario_historico.usuario_cadastro IS 'Campo para receber o id do usuario que fez a primeira inserção nesta tabela';

COMMENT ON COLUMN dbo.cargo_salario_historico.data_cadastro IS 'Campo para receber a data da primeira inserção nesta tabela';

COMMENT ON COLUMN dbo.cargo_salario_historico.usuario_ultima_alteracao IS 'Campo para receber o id do usuario que fez a ultima alteração nesta tabela';

COMMENT ON COLUMN dbo.cargo_salario_historico.data_ultima_alteracao IS 'Campo para receber o id do usuario que fez a ultima alteração nesta tabela';

COMMENT ON CONSTRAINT pk_cliente ON dbo.cliente IS 'Chave de identificação da tabela cliente';

COMMENT ON TABLE dbo.cliente IS 'Tabela que armazena os dados do cliente.';

COMMENT ON COLUMN dbo.cliente.id IS 'Campo para receber identificação na tabela';

COMMENT ON COLUMN dbo.cliente.razao_social IS 'Campo para receber razão social do cliente';

COMMENT ON COLUMN dbo.cliente.nome_fantasia IS 'Campo para receber nome fantasia do cliente';

COMMENT ON COLUMN dbo.cliente.cnpj IS 'Campo para receber o CNPJ do cliente';

COMMENT ON COLUMN dbo.cliente.inscricao_estadual IS 'Campo para receber o numero da  Inscrição Estadual do cliente';

COMMENT ON COLUMN dbo.cliente.inscricao_municipal IS 'Campo para receber o numero da Inscrição Municipal do cliente';

COMMENT ON COLUMN dbo.cliente.rua IS 'Campo para receber nome da rua do cliente';

COMMENT ON COLUMN dbo.cliente.numero IS 'Campo para receber numero de endereço do cliente';

COMMENT ON COLUMN dbo.cliente.complemento IS 'Campo opcional para  receber complemento do endereço do cliente';

COMMENT ON COLUMN dbo.cliente.bairro IS 'Campo para receber bairro onde cliente se localiza';

COMMENT ON COLUMN dbo.cliente.cidade IS 'Campo para receber a cidade que o cliente está localizado';

COMMENT ON COLUMN dbo.cliente.uf IS 'Campo para receber sigla do estado onde cliente está localizado';

COMMENT ON COLUMN dbo.cliente.cep IS 'Campo para recebr o CEP do cliente';

COMMENT ON COLUMN dbo.cliente.usuario_cadastro IS 'Campo para receber o id do usuario que fez a primeira inserção nesta tabela';

COMMENT ON COLUMN dbo.cliente.data_cadastro IS 'Campo para receber a data da primeira inserção nesta tabela';

COMMENT ON COLUMN dbo.cliente.usuario_ultima_alteracao IS 'Campo para receber o id do usuario que fez a ultima alteração nesta tabela';

COMMENT ON COLUMN dbo.cliente.data_ultima_alteracao IS 'Campo para receber a data da última alteração nesta tabela';

COMMENT ON CONSTRAINT pk_departamento ON dbo.departamento IS 'Chave de identificação da tabela departamento';

COMMENT ON TABLE dbo.departamento IS 'Tabela que armazena dados do departamento';

COMMENT ON COLUMN dbo.departamento.id IS 'Campo para receber identificação na tabela';

COMMENT ON COLUMN dbo.departamento.id_cliente IS 'Campo que recebe o id da tabela cliente como uma chave estrangeira';

COMMENT ON COLUMN dbo.departamento.nome IS 'Campo para receber nome do departamento';

COMMENT ON COLUMN dbo.departamento.usuario_cadastro IS 'Campo para receber o id do usuario que fez a primeira inserção nesta tabela';

COMMENT ON COLUMN dbo.departamento.data_cadastro IS 'Campo para receber a data da primeira inserção nesta tabela';

COMMENT ON COLUMN dbo.departamento.usuario_ultima_alteracao IS 'Campo para receber o id do usuario que fez a ultima alteração nesta tabela';

COMMENT ON COLUMN dbo.departamento.data_ultima_alteracao IS 'Campo para receber a data da última alteração nesta tabela';

COMMENT ON TABLE dbo.documento_tipo IS 'Tabela para armazenar informações das categorias do documento.';

COMMENT ON COLUMN dbo.documento_tipo.id IS 'Campo de identificação da tabela documento_categoria.';

COMMENT ON COLUMN dbo.documento_tipo.nome IS 'Campo para receber o nome da categoria do documento.';

COMMENT ON CONSTRAINT pk_empresa ON dbo.empresa IS 'Chave de identificação da tabela empresa';

COMMENT ON TABLE dbo.empresa IS 'Tabela que  armazena dados da empresa';

COMMENT ON COLUMN dbo.empresa.id IS 'Campo para receber identificação na tabela';

COMMENT ON COLUMN dbo.empresa.razao_social IS 'Campo para receber a razao social da empresa';

COMMENT ON COLUMN dbo.empresa.nome_fantasia IS 'Campo para receber nome fantasia da empresa';

COMMENT ON COLUMN dbo.empresa.cnpj IS 'Campo para receber CNPJ da empresa';

COMMENT ON COLUMN dbo.empresa.inscricao_estadual IS 'Campo para receber numero da inscrição Estadual da empresa';

COMMENT ON COLUMN dbo.empresa.inscricao_municipal IS 'Campo para receber o numero da inscrição Municipal da empresa';

COMMENT ON COLUMN dbo.empresa.rua IS 'Campo para receber nome da rua em que se localiza a empresa';

COMMENT ON COLUMN dbo.empresa.numero IS 'Campo para receber numero do endereço onde se localiza a empresa';

COMMENT ON COLUMN dbo.empresa.complemento IS 'Campo para receber complemento do endereço da empresa';

COMMENT ON COLUMN dbo.empresa.bairro IS 'Campo para receber bairro da empresa';

COMMENT ON COLUMN dbo.empresa.cidade IS 'Campo para receber o nome da cidade que a empresa esta localizada';

COMMENT ON COLUMN dbo.empresa.uf IS 'Campo para receber sigla do estado em que a empresa esta localizada';

COMMENT ON COLUMN dbo.empresa.cep IS 'Campo para receber CEP onde a empresa se localiza';

COMMENT ON COLUMN dbo.empresa.usuario_cadastro IS 'Campo para receber o id do usuario que fez a primeira inserção nesta tabela';

COMMENT ON COLUMN dbo.empresa.data_cadastro IS 'Campo para receber a data da primeira inserção nesta tabela';

COMMENT ON COLUMN dbo.empresa.usuario_ultima_alteracao IS 'Campo para receber o id do usuario que fez a ultima alteração nesta tabela';

COMMENT ON COLUMN dbo.empresa.data_ultima_alteracao IS 'Campo para receber a data da última alteração nesta tabela';

COMMENT ON CONSTRAINT pk_etapatipo ON dbo.etapa_tipo IS 'Chave de identificação na tabela etapaTipo';

COMMENT ON TABLE dbo.etapa_tipo IS 'Tabela que armazena o tipo de etapa no projeto';

COMMENT ON COLUMN dbo.etapa_tipo.id IS 'Campo para receber identificação na tabela';

COMMENT ON COLUMN dbo.etapa_tipo.nome IS 'Campo que recebe nome do tipo de etapa no projeto';

COMMENT ON CONSTRAINT pk_tipo_arquivo ON dbo.extensao_documento IS 'Chave de identificação da tabela tipoDocumento';

COMMENT ON TABLE dbo.extensao_documento IS 'Tabela que armazena dados do tipo do documento';

COMMENT ON COLUMN dbo.extensao_documento.id IS 'Chave para receber identificação na tabela';

COMMENT ON COLUMN dbo.extensao_documento.nome IS 'Campo para receber a descrição do tipo de documento';

COMMENT ON CONSTRAINT pk_funcao ON dbo.funcao IS 'Chave de identificação da tabela funcao';

COMMENT ON TABLE dbo.funcao IS 'Tabela que armazena a função de cada colaborador';

COMMENT ON COLUMN dbo.funcao.id IS 'Campo para receber identificação na tabela';

COMMENT ON COLUMN dbo.funcao.nome IS 'Campo para receber a descrição do nome da função';

COMMENT ON COLUMN dbo.funcao.usuario_cadastro IS 'Campo para receber o id do usuario que fez a primeira inserção nesta tabela';

COMMENT ON COLUMN dbo.funcao.data_cadastro IS 'Campo para receber a data da primeira inserção nesta tabela';

COMMENT ON COLUMN dbo.funcao.usuario_ultima_alteracao IS 'Campo para receber o id do usuario que fez a ultima alteração nesta tabela';

COMMENT ON COLUMN dbo.funcao.data_ultima_alteracao IS 'Campo para receber data da ultima alteração nesta tabela';

COMMENT ON CONSTRAINT pk_unidade ON dbo.hub IS 'Chave de identificação da tabela unidade';

COMMENT ON TABLE dbo.hub IS 'Tabela que armazena dados da unidade';

COMMENT ON COLUMN dbo.hub.id IS 'Campo para receber identificação na tabela';

COMMENT ON COLUMN dbo.hub.nome IS 'Campo para receber o nome da unidade';

COMMENT ON TABLE dbo.item_pre_faturado IS 'Tabela para armazenar o agrupamento de apontamentos a serem faturados.';

COMMENT ON COLUMN dbo.item_pre_faturado.id IS 'Campo para receber a chave primária.';

COMMENT ON COLUMN dbo.item_pre_faturado.descricao IS 'Campo para armazenar a descrição do item.';

COMMENT ON COLUMN dbo.item_pre_faturado.valor IS 'Campo para receber o valor do item da nota fiscal.';

COMMENT ON CONSTRAINT pk_notafiscal ON dbo.nota_fiscal IS 'Chave de identificação da tabela notaFiscal';

COMMENT ON TABLE dbo.nota_fiscal IS 'Tabela que armazena dados da nota fiscal';

COMMENT ON COLUMN dbo.nota_fiscal.id IS 'Campo para receber identificação na  tabela';

COMMENT ON COLUMN dbo.nota_fiscal.id_empresa IS 'Campo que recebe o id da tabela empresa com uma chave estrangeira';

COMMENT ON COLUMN dbo.nota_fiscal.id_cliente IS 'Coluna que referencia o id da tabela cliente';

COMMENT ON COLUMN dbo.nota_fiscal.data_emissao IS 'Campo para receber data de emissão da nota fiscal';

COMMENT ON COLUMN dbo.nota_fiscal.data_vencimento IS 'Campo para receber data que a nota fiscal irá vencer';

COMMENT ON COLUMN dbo.nota_fiscal.ano_competencia IS 'Campo para receber ano de compentência para pagamento da nota';

COMMENT ON COLUMN dbo.nota_fiscal.mes_competencia IS 'Campo para receber mês de competência para pagamento da nota';

COMMENT ON COLUMN dbo.nota_fiscal.numero_nota_fiscal IS 'Campo para receber o número da nota fiscal emitida.';

COMMENT ON COLUMN dbo.nota_fiscal.usuario_cadastro IS 'Campo para receber o id do usuario que fez a primeira inserção nesta tabela';

COMMENT ON COLUMN dbo.nota_fiscal.data_cadastro IS 'Campo para receber a data da primeira inserção nesta tabela.';

COMMENT ON COLUMN dbo.nota_fiscal.usuario_ultima_alteracao IS 'Campo para receber o id do usuario que fez a ultima alteração nesta tabela.';

COMMENT ON COLUMN dbo.nota_fiscal.data_ultima_alteracao IS 'Campo para receber a data da última alteração nesta tabela';

COMMENT ON CONSTRAINT pk_opcao_sistema ON dbo.opcao_sistema IS 'Chave de identificao da tabela opcaoSistema';

COMMENT ON TABLE dbo.opcao_sistema IS 'Tabela que armazena as opções possiveis do sistema';

COMMENT ON COLUMN dbo.opcao_sistema.id IS 'Campo para receber identificação na tabela';

COMMENT ON COLUMN dbo.opcao_sistema.id_opcao_mae IS 'Campo que recebe o id da tabela opcaoSistema como uma chave estrangeira em auto relacionamento';

COMMENT ON COLUMN dbo.opcao_sistema.descricao IS 'Campo para armazenar a descrição de cada opção do sistema inserida.';

COMMENT ON COLUMN dbo.opcao_sistema.usuario_cadastro IS 'Campo para receber o id do usuario que fez a primeira inserção nesta tabela';

COMMENT ON COLUMN dbo.opcao_sistema.data_cadastro IS 'Campo para receber a data da primeira inserção nesta tabela';

COMMENT ON COLUMN dbo.opcao_sistema.usuario_ultima_alteracao IS 'Campo para receber o id do usuario que fez a ultima alteração nesta tabela';

COMMENT ON COLUMN dbo.opcao_sistema.data_ultima_alteracao IS 'Campo para receber data da ultima alteração nesta tabela';

COMMENT ON CONSTRAINT pk_parametrizacao ON dbo.parametrizacao IS 'Chave de identificação da tabela parametrizacao';

COMMENT ON TABLE dbo.parametrizacao IS 'tabela que armazena dados de parametrização';

COMMENT ON COLUMN dbo.parametrizacao.id IS 'campo para receber identificação na tabela';

COMMENT ON COLUMN dbo.parametrizacao.percentual_bonificacao IS 'Campo para receber percentual de bonificação';

COMMENT ON COLUMN dbo.parametrizacao.percentual_teto IS 'campo para receber percentual limite que o colaborador pode receber de bônus';

COMMENT ON COLUMN dbo.parametrizacao.contador_gatilho IS 'Campo para receber a quantidade de vezes que o colaborador atingiu o limite de percentual da bonificação';

COMMENT ON COLUMN dbo.parametrizacao.data_validade IS 'Campo para receber data de validade da parametrização';

COMMENT ON COLUMN dbo.parametrizacao.usuario_cadastro IS 'Campo para receber o id do usuario que fez a primeira inserção nesta tabela';

COMMENT ON COLUMN dbo.parametrizacao.data_cadastro IS 'Campo para receber a data da primeira inserção nesta tabela';

COMMENT ON COLUMN dbo.parametrizacao.usuario_ultima_alteracao IS 'Campo para receber a data da primeira inserção nesta tabela';

COMMENT ON COLUMN dbo.parametrizacao.data_ultima_alteracao IS 'Campo para receber data da ultima alteração nesta tabela';

COMMENT ON CONSTRAINT pk_parametrizacao_historico ON dbo.parametrizacao_historico IS 'Chave de identificação da tabela parametrizacaoHistorico';

COMMENT ON TABLE dbo.parametrizacao_historico IS 'tabela que armazena o histórico da parametrização';

COMMENT ON COLUMN dbo.parametrizacao_historico.id IS 'Campo que recebe identificação na tabela';

COMMENT ON COLUMN dbo.parametrizacao_historico.id_parametrizacao IS 'Campo que recebe id da tabela parametrizacao como uma chave estrangeira';

COMMENT ON COLUMN dbo.parametrizacao_historico.percentual_bonificacao IS 'Campo para receber percentual de bonificação';

COMMENT ON COLUMN dbo.parametrizacao_historico.percentual_teto IS 'Campo para receber percentual limite que o colaborador pode receber de bônus';

COMMENT ON COLUMN dbo.parametrizacao_historico.contador_gatilho IS 'Campo para receber a quantidade de vezes que o colaborador atingiu o limite de percentual da bonificação';

COMMENT ON COLUMN dbo.parametrizacao_historico.data_validade IS 'Campo para receber data de validade da parametrização';

COMMENT ON COLUMN dbo.parametrizacao_historico.usuario_cadastro IS 'Campo para receber o id do usuario que fez a primeira inserção nesta tabela';

COMMENT ON COLUMN dbo.parametrizacao_historico.data_cadastro IS 'Campo para receber a data da primeira inserção nesta tabela';

COMMENT ON COLUMN dbo.parametrizacao_historico.usuario_ultima_alteracao IS 'Campo para receber o id do usuario que fez a ultima alteração nesta tabela';

COMMENT ON COLUMN dbo.parametrizacao_historico.data_ultima_alteracao IS 'Campo para receber data da ultima alteração nesta tabela';

COMMENT ON TABLE dbo.percentual_etapa IS 'Tabela para armazenar a porcentagem das etapas por cliente.';

COMMENT ON COLUMN dbo.percentual_etapa.id IS 'Campo para receber a chave primária da tabela.';

COMMENT ON COLUMN dbo.percentual_etapa.id_etapa_tipo IS 'Campo para receber a chave estrangeira da tabela etapa_tipo.';

COMMENT ON COLUMN dbo.percentual_etapa.id_cliente IS 'Campo para receber a foreign key da tabela cliente.';

COMMENT ON COLUMN dbo.percentual_etapa.percentual IS 'Campo para atribuir o percentual por etapa de orçamento.';

COMMENT ON COLUMN dbo.percentual_etapa.data_validade IS 'Campo para armazenar a validade da configuração da etapa.';

COMMENT ON COLUMN dbo.percentual_etapa.usuario_cadastro IS 'Campo para receber o id do usuario que cadastrou o registro.';

COMMENT ON COLUMN dbo.percentual_etapa.data_cadastro IS 'Campo para receber a data de cadastro do registro.';

COMMENT ON COLUMN dbo.premiacao.id IS 'Campo para receber chave primária da tabela premiação.';

COMMENT ON COLUMN dbo.premiacao.ano IS 'Campo para receber o ano referente à premiação.';

COMMENT ON COLUMN dbo.premiacao.mes IS 'Campo para receber o mês da premiação.';

COMMENT ON COLUMN dbo.premiacao.usuario_pagamento IS 'Campo para receber o usuario que cadastrou o pagamento.';

COMMENT ON COLUMN dbo.premiacao.data_pagamento IS 'Campo para receber a data de pagamento da premiação.';

COMMENT ON CONSTRAINT pk_projeto_tipo ON dbo.projeto_tipo IS 'Chave de identificação da tabela projetoTipo';

COMMENT ON TABLE dbo.projeto_tipo IS 'Tabela que armazena dados do tipo de projeto';

COMMENT ON COLUMN dbo.projeto_tipo.id IS 'Campo para receber identificação na tabela';

COMMENT ON COLUMN dbo.projeto_tipo.nome IS 'Campo para receber nome do tipo de projeto';

COMMENT ON CONSTRAINT pk_status_apontamento ON dbo.status_apontamento IS 'Chave primária da tabela status_apontamento';

COMMENT ON TABLE dbo.status_apontamento IS 'Tabela para armazenar informações do status do apontamento.';

COMMENT ON COLUMN dbo.status_apontamento.id IS 'Campo de identificação da tabela status apontamento.';

COMMENT ON COLUMN dbo.status_apontamento.nome IS 'Campo para receber o nome do status do apontamento.';

COMMENT ON CONSTRAINT pk_time ON dbo."time" IS 'Chave de identificação da tabela.';

COMMENT ON TABLE dbo."time" IS 'Tabela para armazenar os times de acordo com os colaboradores.';

COMMENT ON COLUMN dbo."time".nome IS 'Campo para receber o nome do time de colaboradores.';

COMMENT ON COLUMN dbo."time".usuario_cadastro IS 'Campo para receber o id do usuario que fez a primeira inserção nesta tabela.';

COMMENT ON COLUMN dbo."time".data_cadastro IS 'Campo para receber a data da primeira inserção nesta tabela.';

COMMENT ON COLUMN dbo."time".usuario_ultima_alteracao IS 'Campo para receber o id do usuario que fez a ultima alteração nesta tabela.';

COMMENT ON COLUMN dbo."time".data_ultima_alteracao IS 'Campo para receber a data da última alteração nesta tabela.';

COMMENT ON CONSTRAINT pk_usuario ON dbo.usuario IS 'Chave de identificação da tabela usuario';

COMMENT ON TABLE dbo.usuario IS 'Tabela que armazena as informações de login do usuario';

COMMENT ON COLUMN dbo.usuario.id IS 'Campo para receber identificação na tabela';

COMMENT ON COLUMN dbo.usuario.apelido IS 'Campo que recebe o apelido nome do usuário para cadastro.';

COMMENT ON COLUMN dbo.usuario.email IS 'Campo para receber o email que será usado como login';

COMMENT ON COLUMN dbo.usuario.senha IS 'Campo para receber senha do login';

COMMENT ON COLUMN dbo.usuario.data_expiracao_senha IS 'Campo que recebe a tada de expiracação da senha';

COMMENT ON COLUMN dbo.usuario.data_bloqueio IS 'Campo para armazenar a data de bloqueio do usuário';

COMMENT ON COLUMN dbo.usuario.usuario_cadastro IS 'Campo para receber o id do usuario que fez a primeira inserção nesta tabela';

COMMENT ON COLUMN dbo.usuario.data_cadastro IS 'Campo para receber a data da primeira inserção nesta tabela';

COMMENT ON COLUMN dbo.usuario.usuario_ultima_alteracao IS 'Campo para receber o id do usuario que fez a ultima alteração nesta tabela';

COMMENT ON COLUMN dbo.usuario.data_ultima_alteracao IS 'Campo para receber data da ultima alteração nesta tabela';

COMMENT ON CONSTRAINT pk_usuario_opcao ON dbo.usuario_opcao IS 'Chave de identificação da tabela usuarioOpcao';

COMMENT ON TABLE dbo.usuario_opcao IS 'Tabela que armazena opções do usuario no sistema';

COMMENT ON COLUMN dbo.usuario_opcao.id_usuario IS 'Chave composta da tabela usuarioOpcao_usuario';

COMMENT ON COLUMN dbo.usuario_opcao.id_opcao_sistema IS 'Chave composta da tabela usuarioOpcao_opcaoSistema';

COMMENT ON COLUMN dbo.usuario_opcao.usuario_cadastro IS 'Campo para receber o id do usuario que fez a primeira inserção nesta tabela';

COMMENT ON COLUMN dbo.usuario_opcao.data_cadastro IS 'Campo para receber a data da primeira inserção nesta tabela';

COMMENT ON CONSTRAINT pk_colaborador ON dbo.colaborador IS 'Chave de identificação da tabela colaborador';

COMMENT ON TABLE dbo.colaborador IS 'Tabela que armazena dados do colaborador';

COMMENT ON COLUMN dbo.colaborador.id IS 'Campo para receber identificação na tabela';

COMMENT ON COLUMN dbo.colaborador.id_usuario IS 'Campo que recebe o id da tabela usuario como uma chave estrangeira';

COMMENT ON COLUMN dbo.colaborador.nome IS 'Campo para receber nome do colaborador';

COMMENT ON COLUMN dbo.colaborador.data_admissao IS 'Campo para receber data de admissão do colaborador na empresa';

COMMENT ON COLUMN dbo.colaborador.data_demissao IS 'Campo para receber data de demissao do colaborador na empresa';

COMMENT ON COLUMN dbo.colaborador.ddd IS 'campo para receber o ddd do telefone';

COMMENT ON COLUMN dbo.colaborador.celular IS 'campo para receber o numero do celular.';

COMMENT ON COLUMN dbo.colaborador.whatsapp IS 'campo para identificar se o número do celular é whatsapp';

COMMENT ON COLUMN dbo.colaborador.skype IS 'campo para receber codigo do skype';

COMMENT ON COLUMN dbo.colaborador.discord IS 'campo para receber codigo do discord';

COMMENT ON COLUMN dbo.colaborador.usuario_cadastro IS 'Campo para receber o id do usuario que fez a primeira inserção nesta tabela';

COMMENT ON COLUMN dbo.colaborador.data_cadastro IS 'Campo para receber a data da primeira inserção nesta tabela';

COMMENT ON COLUMN dbo.colaborador.usuario_ultima_alteracao IS 'Campo para receber o id do usuario que fez a ultima alteração nesta tabela';

COMMENT ON COLUMN dbo.colaborador.data_ultima_alteracao IS 'Campo para receber data da ultima alteração nesta tabela';

COMMENT ON CONSTRAINT pk_colaborador_time ON dbo.colaborador_time IS 'Chave primária da tabela colaborador time.';

COMMENT ON TABLE dbo.colaborador_time IS 'Tabela para armazenar informações do time com colaborador.';

COMMENT ON COLUMN dbo.colaborador_time.id IS 'Chave de identificação da tabela.';

COMMENT ON COLUMN dbo.colaborador_time.id_colaborador IS 'Campo que recebe o id da tabela colaborador com uma chave estrangeira.';

COMMENT ON COLUMN dbo.colaborador_time.id_time IS 'Campo que recebe o id da tabela time com uma chave estrangeira.';

COMMENT ON COLUMN dbo.colaborador_time.id_atividade_time IS 'Campo que recebe o id da tabela atividade time com uma chave estrangeira.';

COMMENT ON COLUMN dbo.colaborador_time.usuario_cadastro IS 'Campo para receber o id do usuario que fez a primeira inserção nesta tabela.';

COMMENT ON COLUMN dbo.colaborador_time.data_cadastro IS 'Campo para receber a data da primeira inserção nesta tabela.';

COMMENT ON COLUMN dbo.colaborador_time.usuario_ultima_alteracao IS 'Campo para receber o id do usuario que fez a ultima alteração nesta tabela.';

COMMENT ON COLUMN dbo.colaborador_time.data_ultima_alteracao IS 'Campo para receber a data da última alteração nesta tabela.';

COMMENT ON CONSTRAINT pk_contador_tentativas ON dbo.contador_tentativas IS 'chave de identificação da tabela contadortentativas';

COMMENT ON TABLE dbo.contador_tentativas IS 'Tabela para armazenar tentativas de acesso ao sistema';

COMMENT ON COLUMN dbo.contador_tentativas.id IS 'Campo de identificação da tabela';

COMMENT ON COLUMN dbo.contador_tentativas.id_usuario IS 'Chave estrangeira para tabela usuario';

COMMENT ON COLUMN dbo.contador_tentativas.ip IS 'Campo para receber o ip do computador';

COMMENT ON COLUMN dbo.contador_tentativas.quantidade IS 'Campo para receber quantidades tentativas de acesso ao sistema';

COMMENT ON COLUMN dbo.contador_tentativas.data_cadastro IS 'Campo para receber a data de cadastro da tabela';

COMMENT ON CONSTRAINT pk_contato ON dbo.contato IS 'Chave de identificação da tabela contato';

COMMENT ON TABLE dbo.contato IS 'Tabela que armazena os contatos responsáveis pelo projeto';

COMMENT ON COLUMN dbo.contato.id IS 'Campo para receber  identificação na tabela';

COMMENT ON COLUMN dbo.contato.id_departamento IS 'Campo que recebe o id da tabela departamento como uma chave estrangeira';

COMMENT ON COLUMN dbo.contato.nome IS 'Campo para receber nome do contato';

COMMENT ON COLUMN dbo.contato.email IS 'Campo para receber o e-mail do contato';

COMMENT ON COLUMN dbo.contato.ddd_celular IS 'campo para receber o ddd do telefone celular';

COMMENT ON COLUMN dbo.contato.ddd_fixo IS 'campo para receber ddd do celular fixo';

COMMENT ON COLUMN dbo.contato.celular IS 'campo para receber o numero do celular';

COMMENT ON COLUMN dbo.contato.fixo IS 'campo para receber numero do celular fixo';

COMMENT ON COLUMN dbo.contato.whatsapp IS 'Campo para identificar se o celular é whatsapp.';

COMMENT ON COLUMN dbo.contato.ramal IS 'campo para receber o ramal do telefone fixo';

COMMENT ON COLUMN dbo.contato.skype IS 'campo para receber código do skype';

COMMENT ON COLUMN dbo.contato.discord IS 'campo para receber código do discord';

COMMENT ON COLUMN dbo.contato.usuario_cadastro IS 'Campo para receber o id do usuario que fez a primeira inserção nesta tabela';

COMMENT ON COLUMN dbo.contato.data_cadastro IS 'Campo para receber o id do usuario que fez a primeira inserção nesta tabela';

COMMENT ON COLUMN dbo.contato.usuario_ultima_alteracao IS 'Campo para receber o id do usuario que fez a ultima alteração nesta tabela';

COMMENT ON COLUMN dbo.contato.data_ultima_alteracao IS 'Campo para receber a data da última alteração nesta tabela';

COMMENT ON CONSTRAINT pk_faixa_salarial ON dbo.faixa_salarial IS 'Chave de identificação da tabela faixaSalarial';

COMMENT ON TABLE dbo.faixa_salarial IS 'Tabela que armazena a  faixa salarial  por níveis  dos colaboradores';

COMMENT ON COLUMN dbo.faixa_salarial.id IS 'Campo para receber identificação na tabela';

COMMENT ON COLUMN dbo.faixa_salarial.id_funcao IS 'Campo que recebe o id da tabela funcao como uma chave estrangeira.';

COMMENT ON COLUMN dbo.faixa_salarial.nome IS 'Campo para receber o nome da faixa salarial';

COMMENT ON COLUMN dbo.faixa_salarial.clt_ou_pj IS 'Campo para receber a sigla C para CLT ou P para PJ para definir vinculo empregativo do colaborador';

COMMENT ON COLUMN dbo.faixa_salarial.usuario_cadastro IS 'Campo para receber o id do usuario que fez a primeira inserção nesta tabela';

COMMENT ON COLUMN dbo.faixa_salarial.data_cadastro IS 'Campo para receber a data da primeira inserção nesta tabela';

COMMENT ON COLUMN dbo.faixa_salarial.usuario_ultima_alteracao IS 'Campo para receber o id do usuario que fez a ultima alteração nesta tabela';

COMMENT ON COLUMN dbo.faixa_salarial.data_ultima_alteracao IS 'Campo para receber o id do usuario que fez a ultima alteração nesta tabela';

COMMENT ON CONSTRAINT pk_item_notafiscal ON dbo.item_nota_fiscal IS 'Chave de identificação da tabela itemNotaFiscal';

COMMENT ON TABLE dbo.item_nota_fiscal IS 'Tabela que armazena itens da entrega e da nota fiscal';

COMMENT ON COLUMN dbo.item_nota_fiscal.id IS 'Campo para receber identificação na tabela';

COMMENT ON COLUMN dbo.item_nota_fiscal.id_nota_fiscal IS 'Campo que recebe o id da tabela notaFiscal como uma chave estrangeira';

COMMENT ON COLUMN dbo.item_nota_fiscal.descricao IS 'Campo para receber descrição da informações da entrega do projeto.';

COMMENT ON COLUMN dbo.item_nota_fiscal.valor IS 'Campo para receber o valor da nota';

COMMENT ON COLUMN dbo.item_nota_fiscal.usuario_cadastro IS 'Campo para receber o id do usuario que fez a primeira inserção nesta tabela';

COMMENT ON COLUMN dbo.item_nota_fiscal.data_cadastro IS 'Campo para receber a data da primeira inserção nesta tabela';

COMMENT ON COLUMN dbo.item_nota_fiscal.usuario_ultima_alteracao IS 'Campo para receber o id do usuario que fez a ultima alteração nesta tabela';

COMMENT ON COLUMN dbo.item_nota_fiscal.data_ultima_alteracao IS 'Campo para receber a data da última alteração nesta tabela';

COMMENT ON CONSTRAINT pk_preco ON dbo.preco IS 'Chave de identificação da tabela preco';

COMMENT ON TABLE dbo.preco IS 'Tabela que armazena o valor minuto de cada tipo de projeto para cada cliente';

COMMENT ON COLUMN dbo.preco.id IS 'Campo para receber identificação na tabela';

COMMENT ON COLUMN dbo.preco.id_cliente IS 'Campo que recebe o id da tabela cliente como uma chave estrangeira';

COMMENT ON COLUMN dbo.preco.id_projeto_tipo IS 'Campo que recebe o id da tabela projetoTipo como uma chave estrangeira';

COMMENT ON COLUMN dbo.preco.data_validade IS 'Campo para receber a data de Valdiade do preço do cliente no projeto';

COMMENT ON COLUMN dbo.preco.valor_hora IS 'Campo para receber o valor por minuto do cliente para cada tipo de projeto';

COMMENT ON COLUMN dbo.preco.usuario_cadastro IS 'Campo para receber o id do usuario que fez a primeira inserção nesta tabela';

COMMENT ON COLUMN dbo.preco.data_cadastro IS 'Campo para receber a data da primeira inserção nesta tabela';

COMMENT ON COLUMN dbo.preco.usuario_ultima_alteracao IS 'Campo para receber o id do usuario que fez a ultima alteração nesta tabela';

COMMENT ON COLUMN dbo.preco.data_ultima_alteracao IS 'Campo para receber a data da última alteração nesta tabela';

COMMENT ON COLUMN dbo.premiacao_detalhe.id IS 'Campo para receber a chave primária da tabela premiação_detalhe.';

COMMENT ON COLUMN dbo.premiacao_detalhe.id_premiacao IS 'Campo para receber chave estrangeira da tabela de premiação.';

COMMENT ON COLUMN dbo.premiacao_detalhe.id_colaborador IS 'Campo para receber chave estrangeira da tabela colaborador.';

COMMENT ON COLUMN dbo.premiacao_detalhe.valor IS 'Campo para receber o valor da premiação.';

COMMENT ON COLUMN dbo.premiacao_detalhe.status_meta_premiacao IS 'Campo para receber o status da meta da tabela premiação (se a meta do mês foi batida).';

COMMENT ON COLUMN dbo.premiacao_detalhe.valor_ajuste IS 'Campo para ajustar o valor.';

COMMENT ON CONSTRAINT pk_projeto ON dbo.projeto IS 'Chave de identificação da tabela projeto';

COMMENT ON TABLE dbo.projeto IS 'Tabela que armazena dados do projeto';

COMMENT ON COLUMN dbo.projeto.id IS 'Campo para receber identificação na tabela';

COMMENT ON COLUMN dbo.projeto.id_projeto_mae IS 'Campo que recebe um autorelacionamento.';

COMMENT ON COLUMN dbo.projeto.id_preco IS 'Campo que recebe o id tabela preco como uma chave estrangeira';

COMMENT ON COLUMN dbo.projeto.id_colaborador IS 'Chave estrangeira para tabela colaborador.';

COMMENT ON COLUMN dbo.projeto.nome IS 'Campo para receber nome do projeto';

COMMENT ON COLUMN dbo.projeto.descricao IS 'Campo para receber descrição explicativa do projeto';

COMMENT ON COLUMN dbo.projeto.data_entrada IS 'Campo para estimar data de entrega do projeto';

COMMENT ON COLUMN dbo.projeto.data_inicio IS 'Campo para receber a data que o projeto foi iniciado.';

COMMENT ON COLUMN dbo.projeto.data_fim IS 'campo para receber a data fim do projeto.';

COMMENT ON COLUMN dbo.projeto.quantidade_total_minutos IS 'Campo para receber total de minutos que o projeto será concluido';

COMMENT ON COLUMN dbo.projeto.usuario_cadastro IS 'Campo para receber o id do usuario que fez a primeira inserção nesta tabela';

COMMENT ON COLUMN dbo.projeto.data_cadastro IS 'Campo para receber a data da primeira inserção nesta tabela';

COMMENT ON COLUMN dbo.projeto.usuario_ultima_alteracao IS 'Campo para receber o id do usuario que fez a ultima alteração nesta tabela';

COMMENT ON COLUMN dbo.projeto.data_ultima_alteracao IS 'Campo para receber a data da última alteração nesta tabela';

COMMENT ON CONSTRAINT pk_projeto_atividade ON dbo.projeto_atividade IS 'Chave de identificação da tabela projetoAtividade';

COMMENT ON TABLE dbo.projeto_atividade IS 'Tabela que armazena a função de determinado contato no projeto';

COMMENT ON COLUMN dbo.projeto_atividade.id IS 'Campo para receber idetntificação na tabela';

COMMENT ON COLUMN dbo.projeto_atividade.id_contato IS 'Campo que recebe o id da tabela contato como uma chave estrangeira';

COMMENT ON COLUMN dbo.projeto_atividade.id_projeto IS 'Campo que recebe o id da tabela projeto como uma chave estrangeira';

COMMENT ON COLUMN dbo.projeto_atividade.id_atividade IS 'Campo que recebe o id da tabela atividade como uma chave estrangeira';

COMMENT ON COLUMN dbo.projeto_atividade.usuario_cadastro IS 'Campo para receber a data da primeira inserção nesta tabela';

COMMENT ON COLUMN dbo.projeto_atividade.data_cadastro IS 'Campo para receber o id do usuario que fez a ultima alteração nesta tabela';

COMMENT ON COLUMN dbo.cargo_salario.id IS 'Chave de identificacao da tabela';

COMMENT ON COLUMN dbo.cargo_salario.id_hub IS 'Chave composta da tabela cargoSalario_unidade';

COMMENT ON COLUMN dbo.cargo_salario.id_faixa_salarial IS 'Chave composta da tabela cargoSalario_FaixaSalarial';

COMMENT ON COLUMN dbo.cargo_salario.valor IS 'Campo para receber o valor da faixa salarial por colaborador';

COMMENT ON COLUMN dbo.cargo_salario.data_validade IS 'Campo que recebe a data em que a faixa salarial passou a ser valida com o novo valor.';

COMMENT ON COLUMN dbo.cargo_salario.usuario_cadastro IS 'Campo para receber o id do usuario que fez a primeira inserção nesta tabela';

COMMENT ON COLUMN dbo.cargo_salario.data_cadastro IS 'Campo para receber a data da primeira inserção nesta tabela';

COMMENT ON COLUMN dbo.cargo_salario.usuario_ultima_alteracao IS 'Campo para receber o id do usuario que fez a ultima alteração nesta tabela';

COMMENT ON COLUMN dbo.cargo_salario.data_ultima_alteracao IS 'Campo para receber o id do usuario que fez a ultima alteração nesta tabela';

COMMENT ON CONSTRAINT pk_documento ON dbo.documento_projeto IS 'Chave de identificação da tabela documento';

COMMENT ON TABLE dbo.documento_projeto IS 'Tabela que armazena todos os documentos do sistema';

COMMENT ON COLUMN dbo.documento_projeto.id IS 'Campo para receber identificação na tabela';

COMMENT ON COLUMN dbo.documento_projeto.id_projeto IS 'Chave estrangeira da tabela de projeto.';

COMMENT ON COLUMN dbo.documento_projeto.id_extensao_documento IS 'Campo que recebe o id da tabela documentoTipo como uma chave estrangeira';

COMMENT ON COLUMN dbo.documento_projeto.id_documento_tipo IS 'Campo que recebe o id da tabela documento categoria com uma chave estrangeira.';

COMMENT ON COLUMN dbo.documento_projeto.descricao IS 'Campo para receber descrição expllicativa do documento';

COMMENT ON COLUMN dbo.documento_projeto.data_criacao IS 'Campo para receber data de criação do documento';

COMMENT ON COLUMN dbo.documento_projeto.usuario_cadastro IS 'Campo para receber o id do usuario que fez a primeira inserção nesta tabela';

COMMENT ON COLUMN dbo.documento_projeto.data_cadastro IS 'Campo para receber a data da primeira inserção nesta tabela';

COMMENT ON COLUMN dbo.documento_projeto.usuario_ultima_alteracao IS 'Campo para receber o id do usuario que fez a ultima alteração nesta tabela';

COMMENT ON COLUMN dbo.documento_projeto.data_ultima_alteracao IS 'Campo para receber data da ultima alteração nesta tabela';

COMMENT ON CONSTRAINT pk_entrega ON dbo.entrega IS 'Chave de identificação da tabela entrega';

COMMENT ON TABLE dbo.entrega IS 'Tabela que armazena dados das entregas do projeto';

COMMENT ON COLUMN dbo.entrega.id IS 'Campo para receber identificação na tabela';

COMMENT ON COLUMN dbo.entrega.id_projeto IS 'Campo para receber o id da tabela projeto como uma chave estrangeira';

COMMENT ON COLUMN dbo.entrega.id_contato_homologacao IS 'Campo que recebe o id da tabela contato como uma chave estrangeira.';

COMMENT ON COLUMN dbo.entrega.id_contato_aprovacao IS 'Campo que recebe o id da tabela contato como uma chave estrangeira.';

COMMENT ON COLUMN dbo.entrega.data_inicio_prevista IS 'Campo para receber data de inicio prevista da entrega da etapa do projeto';

COMMENT ON COLUMN dbo.entrega.data_termino_prevista IS 'Campo para receber data de termino prevista da entrega da etapa do projeto';

COMMENT ON COLUMN dbo.entrega.data_inicio IS 'Campo para receber data de inicio da entraga da etapa do projeto';

COMMENT ON COLUMN dbo.entrega.data_entrega IS 'Campo para receber data de entrega do projeto';

COMMENT ON COLUMN dbo.entrega.descricao IS 'Campo para receber a descrição de definição da entrega.';

COMMENT ON COLUMN dbo.entrega.usuario_cadastro IS 'Campo para receber o id do usuario que fez a primeira inserção nesta tabela';

COMMENT ON COLUMN dbo.entrega.data_cadastro IS 'Campo para receber a data da primeira inserção nesta tabela';

COMMENT ON COLUMN dbo.entrega.usuario_ultima_alteracao IS 'Campo para receber o id do usuario que fez a ultima alteração nesta tabela';

COMMENT ON COLUMN dbo.entrega.data_ultima_alteracao IS 'Campo para receber a data da última alteração nesta tabela';

COMMENT ON CONSTRAINT pk_entrega_documento ON dbo.entrega_documento IS 'Chave de identificação da tabela entregaDocumento';

COMMENT ON TABLE dbo.entrega_documento IS 'Tabela associativa que armazena dados dos documentos da entrega';

COMMENT ON COLUMN dbo.entrega_documento.id_entrega IS 'Campo que recebe o id da tabela entrega como uma chave estrangeira';

COMMENT ON COLUMN dbo.entrega_documento.id_documento IS 'Campo que recebe o id da tabela documento como uma chave estrangeira';

COMMENT ON CONSTRAINT pk_etapa ON dbo.etapa IS 'Chave de identificação da tabela projetoEtapa';

COMMENT ON CONSTRAINT unq_etapa ON dbo.etapa IS 'Index para limitar a quantidade de etapas no mesmo item pré faturado.';

COMMENT ON TABLE dbo.etapa IS 'Tabela que armazena dados das etapas do projeto';

COMMENT ON COLUMN dbo.etapa.id IS 'Campo para receber identificação na tabela';

COMMENT ON COLUMN dbo.etapa.id_projeto IS 'Chave estrangeira da tabela projeto';

COMMENT ON COLUMN dbo.etapa.id_percentual_etapa IS 'Campo para receber a chave da tabela percentual_etapa.';

COMMENT ON COLUMN dbo.etapa.id_item_pre_faturado IS 'Chave para receber foreign key da tabela item_pre_faturado';

COMMENT ON COLUMN dbo.etapa.id_premiacao IS 'Campo para receber a foreign key da tabela premiação.';

COMMENT ON COLUMN dbo.etapa.data_inicio_prevista IS 'Campo para receber data de inicio prevista da etapa no projeto';

COMMENT ON COLUMN dbo.etapa.data_termino_prevista IS 'Campo para receber data termino prevista da etapa no projeto';

COMMENT ON COLUMN dbo.etapa.data_inicio IS 'Campo para receber data de iniciação da etapa no projeto';

COMMENT ON COLUMN dbo.etapa.data_termino IS 'Campo para receber data de termino da etapa no projeto';

COMMENT ON COLUMN dbo.etapa.usuario_cadastro IS 'Campo para receber o id do usuario que fez a primeira inserção nesta tabela';

COMMENT ON COLUMN dbo.etapa.data_cadastro IS 'Campo para receber a data da primeira inserção nesta tabela';

COMMENT ON COLUMN dbo.etapa.usuario_ultima_alteracao IS 'Campo para receber o id do usuario que fez a ultima alteração nesta tabela';

COMMENT ON COLUMN dbo.etapa.data_ultima_alteracao IS 'Campo para receber a data da última alteração nesta tabela';

COMMENT ON CONSTRAINT pk_projeto_documento ON dbo.projeto_documento IS 'Chave de identificação da tabela projetoDocumento';

COMMENT ON TABLE dbo.projeto_documento IS 'Tabela associativa que armazena as tabelas Projeto e Documento';

COMMENT ON COLUMN dbo.projeto_documento.id_projeto IS 'Campo que recebe o id da tabela projeto como uma chave estrangeira';

COMMENT ON COLUMN dbo.projeto_documento.id_documento IS 'Campo que recebe o id da tabela documento como uma chave estrangeira';

COMMENT ON CONSTRAINT pk_qualificacao ON dbo.qualificacao IS 'Chave de identificação databela';

COMMENT ON TABLE dbo.qualificacao IS 'Tabela que armazena qualificação dos colaboradores';

COMMENT ON COLUMN dbo.qualificacao.id IS 'Chave de identificacao da tabela';

COMMENT ON COLUMN dbo.qualificacao.id_cargo_salario IS 'Chaque que recebe o id da tabela cargo salario como uma chave estrangeira';

COMMENT ON COLUMN dbo.qualificacao.id_colaborador IS 'Chave que recebe o id colaborador como uma chave estrangeira';

COMMENT ON COLUMN dbo.qualificacao.data_inicio IS 'Campo que armazena a data de inicio que o colaborador inicio na faixaSalarial';

COMMENT ON COLUMN dbo.qualificacao.data_fim IS 'Campo que armazena a data fim que o colaborador encerou na faixa salarial';

COMMENT ON COLUMN dbo.qualificacao.usuario_cadastro IS 'Campo para receber o id do usuario que fez a primeira inserção nesta tabela';

COMMENT ON COLUMN dbo.qualificacao.data_cadastro IS 'Campo para receber a data da primeira inserção nesta tabela';

COMMENT ON COLUMN dbo.qualificacao.usuario_ultima_alteracao IS 'Campo para receber o id do usuario que fez a ultima alteração nesta tabela';

COMMENT ON COLUMN dbo.qualificacao.data_ultima_alteracao IS 'Campo para receber o id do usuario que fez a ultima alteração nesta tabela';

COMMENT ON CONSTRAINT pk_apontamento ON dbo.apontamento IS 'Chave de identificação da tabela colaboradorEntrega';

COMMENT ON TABLE dbo.apontamento IS 'Tabela intermediária que armazena minutos trabalhados pelo colaborador no projeto';

COMMENT ON COLUMN dbo.apontamento.id IS 'Campo para receber a identificação na tabela';

COMMENT ON COLUMN dbo.apontamento.id_colaborador IS 'Campo que recebe o id da tabela colaborador como uma chave estrangeira';

COMMENT ON COLUMN dbo.apontamento.id_status_apontamento IS 'Campo que recebe o id da tabela status apontamento com uma chave estrangeira.';

COMMENT ON COLUMN dbo.apontamento.id_premiacao IS 'Chave estrangeira da tabela premiação.';

COMMENT ON COLUMN dbo.apontamento.id_entrega IS 'Campo que recebe o id da tabela entrega como uma chave estrangeira';

COMMENT ON COLUMN dbo.apontamento.id_item_pre_faturado IS 'Chave estrangeira pra tabela item_pre_faturado.';

COMMENT ON COLUMN dbo.apontamento.descricao IS 'Campo para receber descrição do colaborador referente a entrega construida pelo mesmo.';

COMMENT ON COLUMN dbo.apontamento.quantidade_minutos_cobrados IS 'Campo para descrever a quantidade em minutos que o colaborador trabalhou no projeto';

COMMENT ON COLUMN dbo.apontamento.quantidade_minutos_trabalhados IS 'Campo para descrever a quantidade de minutos que o colaborador trabalhou a mais no projeto';

COMMENT ON COLUMN dbo.apontamento.data_apontamento IS 'Campo para receber a data em que houve o apontamento.';

COMMENT ON COLUMN dbo.apontamento.data_conferencia IS 'Campo para armazenar a data da conferência.';

COMMENT ON COLUMN dbo.apontamento.data_reprovacao_conferencia IS 'Campo para armazenar a data da reprovação da conferência.';

COMMENT ON COLUMN dbo.apontamento.data_aprovacao IS 'Campo para receber a data de aprovação do apontamento.';

COMMENT ON COLUMN dbo.apontamento.data_reprovacao IS 'Campo para receber a data de reprovação do apontamento.';

COMMENT ON COLUMN dbo.apontamento.usuario_cadastro IS 'Campo para receber o id do usuario que fez a primeira inserção nesta tabela';

COMMENT ON COLUMN dbo.apontamento.data_cadastro IS 'Campo para receber a data da primeira inserção nesta tabela';

COMMENT ON COLUMN dbo.apontamento.usuario_ultima_alteracao IS 'Campo para receber o id do usuario que fez a ultima alteração nesta tabela';

COMMENT ON COLUMN dbo.apontamento.data_ultima_alteracao IS 'Campo para receber data da ultima alteração nesta tabela';

COMMENT ON COLUMN dbo.apontamento.motivo IS 'Campo para armazenar o motivo da reprovação de aponamento.';

COMMENT ON CONSTRAINT pk_apontamento_etapa ON dbo.apontamento_etapa IS 'Chave primrária da tabela colaborador_projeto_etapa.';

COMMENT ON TABLE dbo.apontamento_etapa IS 'Tabela para armazenar informações dos apontamentos da etapa do projeto.';

COMMENT ON COLUMN dbo.apontamento_etapa.id IS 'Campo de identificação da tabela colaborador_projeto_etapa.';

COMMENT ON COLUMN dbo.apontamento_etapa.id_etapa IS 'Campo que recebe o id da tabela projeto etapa como uma chave estrangeira.';

COMMENT ON COLUMN dbo.apontamento_etapa.id_colaborador IS 'Campo que recebe o id da tabela colaborador como uma chave estrangeira.';

COMMENT ON COLUMN dbo.apontamento_etapa.descricao IS 'Campo para receber a descrição do apontamento da etapa do projeto.';

COMMENT ON COLUMN dbo.apontamento_etapa.quantidade_minutos_trabalhados IS 'Número de minutos totais trabalhados no dia.';

COMMENT ON COLUMN dbo.apontamento_etapa.quantidade_minutos_cobrados IS 'Quantidade de minutos cobrados no total.';

COMMENT ON COLUMN dbo.apontamento_etapa.data_apontamento IS 'Campo para receber a data do apontamento cadastrado';

COMMENT ON COLUMN dbo.apontamento_etapa.usuario_cadastro IS 'Usuario que cadastrou o registro.';

COMMENT ON COLUMN dbo.apontamento_etapa.data_cadastro IS 'Campo para receber data em que houve o cadastro do apontamento.';

COMMENT ON COLUMN dbo.apontamento_etapa.usuario_ultima_alteracao IS 'Campo para receber o id do usuário que realizou a ultima alteração nesta tabela.';

COMMENT ON COLUMN dbo.apontamento_etapa.data_ultima_alteracao IS 'Campo para receber  a data em que houve a ultima alteração nesta tabela.';
