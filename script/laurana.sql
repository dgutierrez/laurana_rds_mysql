CREATE TABLE `Empresa` (
  `IdEmpresa` varchar(36) PRIMARY KEY,
  `NomeEmpresa` varchar(100) NOT NULL,
  `DataCadastro` datetime NOT NULL,
  `EmailEmpresa` varchar(60) NOT NULL,
  `AtivoEmpresa` bool NOT NULL
);

CREATE TABLE `Usuario` (
  `IdUsuario` varchar(36) PRIMARY KEY,
  `IdEmpresa` varchar(36) NOT NULL,
  `NomeUsuario` varchar(60) NOT NULL,
  `SenhaUsuario` varchar(50) NOT NULL,
  `EmailUsuario` varchar(60) NOT NULL,
  `CodigoUsuarioIntegracao` varchar(36) NOT NULL,
  `DataCadastro` datetime NOT NULL
);

CREATE TABLE `Assistente` (
  `IdAssistente` varchar(36) PRIMARY KEY,
  `NomeAssistente` varchar(20) NOT NULL,
  `ContextoAssistente` text NOT NULL,
  `AtivoAssistente` bool NOT NULL
);

CREATE TABLE `Chat` (
  `IdChat` varchar(36) PRIMARY KEY,
  `IdUsuario` varchar(36) NOT NULL,
  `IdAssistente` varchar(36) NOT NULL
);

CREATE TABLE `Mensagem` (
  `IdMensagem` varchar(36) PRIMARY KEY,
  `IdChat` varchar(36),
  `TextoMensagem` text NOT NULL,
  `IdTipoMensagem` integer
);

CREATE TABLE `TipoMensagem` (
  `IdTipoMensagem` integer PRIMARY KEY,
  `TipoMensagem` varchar(20)
);

CREATE TABLE `Documento` (
  `IdDocumento` varchar(36) PRIMARY KEY,
  `IdUsuario` varchar(36) NOT NULL,
  `NomeDocumento` varchar(256) NOT NULL,
  `ExtensaoDocumento` varchar(10) NOT NULL,
  `TamanhoDocumento` integer,
  `TextoDocumento` text
);

CREATE TABLE `ImagemDocumento` (
  `IdImagem` varchar(36) PRIMARY KEY,
  `IdDocumento` varchar(36) NOT NULL,
  `NomeImagem` varchar(256) NOT NULL,
  `TextoImagem` text
);

CREATE TABLE `RequisicaoOpenAi` (
  `IdMensagem` varchar(36) PRIMARY KEY,
  `IdUsuario` varchar(36) NOT NULL,
  `DataRequisicao` datetime NOT NULL,
  `QtdTokens` integer NOT NULL,
  `Prompt` text NOT NULL,
  `IdDocumento` varchar(36),
  `StatusCodeOpenAi` integer
);

CREATE TABLE `ChatDocumento` (
  `IdChat` varchar(36),
  `IdDocumento` varchar(36),
  PRIMARY KEY (`IdChat`, `IdDocumento`)
);

CREATE TABLE `Bucket` (
  `IdEmpresa` varchar(36),
  `IdUsuario` varchar(36)
);

CREATE TABLE `PastaBucket` (
  `NomePasta` varchar(20)
);

ALTER TABLE `Usuario` ADD FOREIGN KEY (`IdEmpresa`) REFERENCES `Empresa` (`IdEmpresa`);

ALTER TABLE `Chat` ADD FOREIGN KEY (`IdAssistente`) REFERENCES `Assistente` (`IdAssistente`);

ALTER TABLE `Chat` ADD FOREIGN KEY (`IdUsuario`) REFERENCES `Usuario` (`IdUsuario`);

ALTER TABLE `Mensagem` ADD FOREIGN KEY (`IdChat`) REFERENCES `Chat` (`IdChat`);

ALTER TABLE `TipoMensagem` ADD FOREIGN KEY (`IdTipoMensagem`) REFERENCES `Mensagem` (`IdTipoMensagem`);

ALTER TABLE `Documento` ADD FOREIGN KEY (`IdUsuario`) REFERENCES `Usuario` (`IdUsuario`);

ALTER TABLE `ImagemDocumento` ADD FOREIGN KEY (`IdDocumento`) REFERENCES `Documento` (`IdDocumento`);

ALTER TABLE `RequisicaoOpenAi` ADD FOREIGN KEY (`IdMensagem`) REFERENCES `Mensagem` (`IdMensagem`);

ALTER TABLE `ChatDocumento` ADD FOREIGN KEY (`IdChat`) REFERENCES `Chat` (`IdChat`);

ALTER TABLE `ChatDocumento` ADD FOREIGN KEY (`IdDocumento`) REFERENCES `Documento` (`IdDocumento`);
