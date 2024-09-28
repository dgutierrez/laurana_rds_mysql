CREATE TABLE `Empresa` (
  `IdEmpresa` varchar(36) PRIMARY KEY,
  `NomeEmpresa` varchar(100) NOT NULL,
  `DataCadastro` datetime NOT NULL,
  `EmailEmpresa` varchar(60) NOT NULL,
  `SenhaEmpresa` varchar(50) NOT NULL,
  `ImagemEmpresa` text(65535),
  `ImagemLoginEmpresa` text(65535),
  `AtivoEmpresa` bool NOT NULL
);

CREATE TABLE `ConfiguracoesEmpresa` (
  `IdEmpresa` varchar(36) PRIMARY KEY,
  `UrlValidaUsuario` varchar(256),
  `SenhaPadrao` varchar(50),
  `TamanhoEspacoPasta` integer,
  `HabilitaCriacaoAssistentePublico` bool NOT NULL,
  `HabilitaPastaEmpresa` bool NOT NULL,
  `HabilitaTokenOpenai` bool NOT NULL,
  `OpenAiToken` varchar(250),
  `HabilitaTokenGemini` bool NOT NULL,
  `GeminiToken` varchar(250),
  `HabilitaAwsClaude` bool NOT NULL,
  `QuantidadeClaudeToken` integer
);

CREATE TABLE `Usuario` (
  `IdUsuario` varchar(36) PRIMARY KEY,
  `IdEmpresa` varchar(36) NOT NULL,
  `NomeUsuario` varchar(60) NOT NULL,
  `SenhaUsuario` varchar(50) NOT NULL,
  `EmailUsuario` varchar(60) NOT NULL,
  `CodigoUsuarioIntegracao` varchar(36) NOT NULL,
  `ImagemUsuario` text(65535),
  `DataCadastro` datetime NOT NULL,
  `AtivoUsuario` bool NOT NULL
);

CREATE TABLE `ConfiguracoesUsuario` (
  `IdUsuario` varchar(36) PRIMARY KEY,
  `OpenAiToken` varchar(70),
  `GeminiToken` varchar(70)
);

CREATE TABLE `Assistente` (
  `IdAssistente` varchar(36) PRIMARY KEY,
  `IdModeloAssistente` integer NOT NULL,
  `IdUsuarioCriacao` varchar(36) NOT NULL,
  `IdEmpresaCriacao` varchar(36) NOT NULL,
  `NomeAssistente` varchar(20) NOT NULL,
  `ImagemAssistente` text(65535),
  `DescricaoAssistente` text NOT NULL,
  `ContextoAssistente` text NOT NULL,
  `DataCadastro` datetime NOT NULL,
  `IdEscopoAssistente` integer NOT NULL,
  `AtivoAssistente` bool NOT NULL,
  `IdUsuarioAlteracao` varchar(36),
  `DataAlteracao` datetime
);

CREATE TABLE `ModeloAssistente` (
  `IdModelo` integer PRIMARY KEY,
  `NomeModelo` varchar(20) NOT NULL
);

CREATE TABLE `EscopoAssistente` (
  `IdEscopoAssistente` integer PRIMARY KEY,
  `EscopoAssistente` varchar(20) NOT NULL
);

CREATE TABLE `Chat` (
  `IdChat` varchar(36) PRIMARY KEY,
  `IdUsuario` varchar(36) NOT NULL,
  `IdAssistente` varchar(36) NOT NULL,
  `NomeChat` varchar(36) NOT NULL,
  `DataCadastro` datetime NOT NULL,
  `AtivoChat` bool NOT NULL
);

CREATE TABLE `Mensagem` (
  `IdMensagem` varchar(36) PRIMARY KEY,
  `IdChat` varchar(36) NOT NULL,
  `TextoMensagem` text(65535) NOT NULL,
  `IdTipoMensagem` integer NOT NULL,
  `DataMensagem` datetime NOT NULL
);

CREATE TABLE `TipoMensagem` (
  `IdTipoMensagem` integer PRIMARY KEY,
  `TipoMensagem` varchar(20)
);

CREATE TABLE `Documento` (
  `IdDocumento` varchar(36) PRIMARY KEY,
  `IdDiretorio` varchar(36) NOT NULL,
  `NomeDocumento` varchar(256) NOT NULL,
  `ExtensaoDocumento` varchar(10) NOT NULL,
  `DataCadastro` datetime NOT NULL,
  `TamanhoDocumento` integer,
  `TextoDocumento` text(65535)
);

CREATE TABLE `ImagemDocumento` (
  `IdImagem` varchar(36) PRIMARY KEY,
  `IdDocumento` varchar(36) NOT NULL,
  `NomeImagem` varchar(256) NOT NULL,
  `TextoImagem` text(65535)
);

CREATE TABLE `MensagemDocumento` (
  `IdMensagem` varchar(36),
  `IdDocumento` varchar(36),
  PRIMARY KEY (`IdMensagem`, `IdDocumento`)
);

CREATE TABLE `ModeloDocumentoSaida` (
  `IdModelo` varchar(36) PRIMARY KEY,
  `IdUsuario` varchar(36) NOT NULL,
  `TextoModelo` text(65535) NOT NULL
);

CREATE TABLE `Diretorio` (
  `IdDiretorio` varchar(36) PRIMARY KEY,
  `IdProprietario` varchar(36) NOT NULL,
  `NomeDiretorio` varchar(20) NOT NULL,
  `AtivoDiretorio` bool NOT NULL,
  `DataCadastro` datetime NOT NULL,
  `IdDiretorioPai` varchar(36)
);

CREATE TABLE `AutomacaoDiretorio` (
  `IdAutomacaoDiretorio` varchar(36) PRIMARY KEY,
  `IdDiretorioEntrada` varchar(36) NOT NULL,
  `IdDiretorioSaida` varchar(36) NOT NULL,
  `IdAssistente` varchar(36) NOT NULL,
  `Comando` text NOT NULL,
  `AtivoAutomacao` bool NOT NULL,
  `DataCadastro` datetime NOT NULL
);

CREATE TABLE `ExecucaoAutomacaoDiretorio` (
  `IdExecucao` varchar(36),
  `IdAutomacaoDiretorio` varchar(36) NOT NULL,
  `IdDocumentoEntrada` varchar(36) NOT NULL,
  `IdDocumentoSaida` varchar(36),
  `DataExecucao` datetime,
  `IdStatusExecucao` integer,
  PRIMARY KEY (`IdExecucao`, `IdStatusExecucao`)
);

CREATE TABLE `StatusExecucacaoAutomacao` (
  `IdStatusExecucacao` integer PRIMARY KEY,
  `DescricacaoStatusExecucacao` varchar(25)
);

CREATE TABLE `BaseConhecimento` (
  `IdBaseConhecimento` varchar(36) PRIMARY KEY,
  `NomeBaseConhecimento` varchar(50) NOT NULL,
  `DescricaoBaseConhecimento` varchar(250),
  `DataCriacaoBaseConhecimento` datetime NOT NULL,
  `IdUsuarioCriacao` varchar(36) NOT NULL,
  `IdEmpresa` varchar(36) NOT NULL,
  `IdEscopoBaseConhecimento` integer NOT NULL,
  `TamanhoBaseConhecimento` float NOT NULL
);

CREATE TABLE `EscopoBaseConhecimento` (
  `IdEscopoBaseConhecimento` integer PRIMARY KEY,
  `DescricacaoEscopoBaseConhecimento` varchar(50)
);

CREATE TABLE `BaseConhecimentoDocumento` (
  `IdBaseConhecimento` varchar(36) NOT NULL,
  `IdDocumento` varchar(36) NOT NULL,
  `DataCriacao` datetime NOT NULL,
  `IdUsuarioCriacao` varchar(36) NOT NULL,
  `IdStatusProcessamento` integer NOT NULL,
  `DataAlteracaoStatus` datetime NOT NULL
);

CREATE TABLE `StatusBaseConhecimentoDocumento` (
  `IdStatusBaseConhecimentoDocumento` integer PRIMARY KEY,
  `DescricaoStatusBaseConhecimentoDocumento` varchar(50)
);

CREATE TABLE `Notificacao` (
  `IdNotificacao` integer PRIMARY KEY,
  `IdUsuario` varchar(36) NOT NULL,
  `Mensagem` varchar(50) NOT NULL,
  `DataCriacaoNotificacao` datetime NOT NULL,
  `DataEntregaNotificacao` datetime,
  `DataLeituraNotificacao` datetime
);

CREATE TABLE `RecuperacaoSenhaEmpresa` (
  `IdRecuperacao` varchar(36) PRIMARY KEY,
  `IdEmpresa` varchar(36) NOT NULL,
  `DataSolicitacao` datetime NOT NULL,
  `TokenAutenticacao` varchar(250) NOT NULL,
  `RecuperacaoAtiva` bool NOT NULL,
  `RecuperacaoEfetivada` bool NOT NULL,
  `DataEfetivacao` datetime
);

CREATE TABLE `LoginUsuario` (
  `IdLogin` bigint PRIMARY KEY AUTO_INCREMENT,
  `IdUsuario` varchar(36) NOT NULL,
  `IdEmpresa` varchar(36) NOT NULL,
  `DataLogin` datetime NOT NULL,
  `Ip` varchar(20)
);

CREATE TABLE `RecuperacaoSenhaUsuario` (
  `IdRecuperacao` varchar(36) PRIMARY KEY,
  `IdEmpresa` varchar(36) NOT NULL,
  `IdUsuario` varchar(36) NOT NULL,
  `DataSolicitacao` datetime NOT NULL,
  `TokenAutenticacao` varchar(250) NOT NULL,
  `RecuperacaoAtiva` bool NOT NULL,
  `RecuperacaoEfetivada` bool NOT NULL,
  `DataEfetivacao` datetime
);

ALTER TABLE `ConfiguracoesEmpresa` ADD FOREIGN KEY (`IdEmpresa`) REFERENCES `Empresa` (`IdEmpresa`);

ALTER TABLE `Usuario` ADD FOREIGN KEY (`IdEmpresa`) REFERENCES `Empresa` (`IdEmpresa`);

ALTER TABLE `ConfiguracoesUsuario` ADD FOREIGN KEY (`IdUsuario`) REFERENCES `Usuario` (`IdUsuario`);

ALTER TABLE `Assistente` ADD FOREIGN KEY (`IdUsuarioCriacao`) REFERENCES `Usuario` (`IdUsuario`);

ALTER TABLE `Assistente` ADD FOREIGN KEY (`IdUsuarioAlteracao`) REFERENCES `Usuario` (`IdUsuario`);

ALTER TABLE `Assistente` ADD FOREIGN KEY (`IdEmpresaCriacao`) REFERENCES `Empresa` (`IdEmpresa`);

ALTER TABLE `Assistente` ADD FOREIGN KEY (`IdModeloAssistente`) REFERENCES `ModeloAssistente` (`IdModelo`);

ALTER TABLE `Assistente` ADD FOREIGN KEY (`IdEscopoAssistente`) REFERENCES `EscopoAssistente` (`IdEscopoAssistente`);

ALTER TABLE `Chat` ADD FOREIGN KEY (`IdAssistente`) REFERENCES `Assistente` (`IdAssistente`);

ALTER TABLE `Chat` ADD FOREIGN KEY (`IdUsuario`) REFERENCES `Usuario` (`IdUsuario`);

ALTER TABLE `Mensagem` ADD FOREIGN KEY (`IdChat`) REFERENCES `Chat` (`IdChat`);

ALTER TABLE `Mensagem` ADD FOREIGN KEY (`IdTipoMensagem`) REFERENCES `TipoMensagem` (`IdTipoMensagem`);

ALTER TABLE `Documento` ADD FOREIGN KEY (`IdDiretorio`) REFERENCES `Diretorio` (`IdDiretorio`);

ALTER TABLE `ImagemDocumento` ADD FOREIGN KEY (`IdDocumento`) REFERENCES `Documento` (`IdDocumento`);

ALTER TABLE `MensagemDocumento` ADD FOREIGN KEY (`IdMensagem`) REFERENCES `Mensagem` (`IdMensagem`);

ALTER TABLE `MensagemDocumento` ADD FOREIGN KEY (`IdDocumento`) REFERENCES `Documento` (`IdDocumento`);

ALTER TABLE `ModeloDocumentoSaida` ADD FOREIGN KEY (`IdUsuario`) REFERENCES `Usuario` (`IdUsuario`);

ALTER TABLE `AutomacaoDiretorio` ADD FOREIGN KEY (`IdDiretorioEntrada`) REFERENCES `Diretorio` (`IdDiretorio`);

ALTER TABLE `AutomacaoDiretorio` ADD FOREIGN KEY (`IdDiretorioSaida`) REFERENCES `Diretorio` (`IdDiretorio`);

ALTER TABLE `AutomacaoDiretorio` ADD FOREIGN KEY (`IdAssistente`) REFERENCES `Assistente` (`IdAssistente`);

ALTER TABLE `ExecucaoAutomacaoDiretorio` ADD FOREIGN KEY (`IdAutomacaoDiretorio`) REFERENCES `AutomacaoDiretorio` (`IdAutomacaoDiretorio`);

ALTER TABLE `ExecucaoAutomacaoDiretorio` ADD FOREIGN KEY (`IdDocumentoEntrada`) REFERENCES `Documento` (`IdDocumento`);

ALTER TABLE `ExecucaoAutomacaoDiretorio` ADD FOREIGN KEY (`IdDocumentoSaida`) REFERENCES `Documento` (`IdDocumento`);

ALTER TABLE `ExecucaoAutomacaoDiretorio` ADD FOREIGN KEY (`IdStatusExecucao`) REFERENCES `StatusExecucacaoAutomacao` (`IdStatusExecucacao`);

ALTER TABLE `BaseConhecimento` ADD FOREIGN KEY (`IdEscopoBaseConhecimento`) REFERENCES `EscopoBaseConhecimento` (`IdEscopoBaseConhecimento`);

ALTER TABLE `BaseConhecimentoDocumento` ADD FOREIGN KEY (`IdBaseConhecimento`) REFERENCES `BaseConhecimento` (`IdBaseConhecimento`);

ALTER TABLE `BaseConhecimentoDocumento` ADD FOREIGN KEY (`IdDocumento`) REFERENCES `Documento` (`IdDocumento`);

ALTER TABLE `BaseConhecimentoDocumento` ADD FOREIGN KEY (`IdStatusProcessamento`) REFERENCES `StatusBaseConhecimentoDocumento` (`IdStatusBaseConhecimentoDocumento`);

ALTER TABLE `RecuperacaoSenhaEmpresa` ADD FOREIGN KEY (`IdEmpresa`) REFERENCES `Empresa` (`IdEmpresa`);

ALTER TABLE `LoginUsuario` ADD FOREIGN KEY (`IdUsuario`) REFERENCES `Usuario` (`IdUsuario`);

ALTER TABLE `LoginUsuario` ADD FOREIGN KEY (`IdEmpresa`) REFERENCES `Empresa` (`IdEmpresa`);

ALTER TABLE `RecuperacaoSenhaUsuario` ADD FOREIGN KEY (`IdEmpresa`) REFERENCES `Empresa` (`IdEmpresa`);

ALTER TABLE `RecuperacaoSenhaUsuario` ADD FOREIGN KEY (`IdUsuario`) REFERENCES `Usuario` (`IdUsuario`);
