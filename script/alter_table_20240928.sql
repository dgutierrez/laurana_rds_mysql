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

ALTER TABLE `RecuperacaoSenhaUsuario` ADD FOREIGN KEY (`IdEmpresa`) REFERENCES `Empresa` (`IdEmpresa`);

ALTER TABLE `RecuperacaoSenhaUsuario` ADD FOREIGN KEY (`IdUsuario`) REFERENCES `Usuario` (`IdUsuario`);