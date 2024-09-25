alter table Documento add DataCadastro datetime;
alter table Diretorio add DataCadastro datetime;
alter table AutomacaoDiretorio add DataCadastro datetime;

CREATE TABLE `RecuperacaoSenhaEmpresa` (
  `IdRecuperacao` varchar(36) PRIMARY KEY,
  `IdEmpresa` varchar(36) NOT NULL,
  `DataSolicitacao` datetime NOT NULL,
  `TokenAutenticacao` varchar(250) NOT NULL,
  `RecuperacaoAtiva` bool NOT NULL,
  `RecuperacaoEfetivada` bool NOT NULL,
  `DataEfetivacao` datetime
);

ALTER TABLE `BaseConhecimentoDocumento` ADD FOREIGN KEY (`IdStatusProcessamento`) REFERENCES `StatusBaseConhecimentoDocumento` (`IdStatusBaseConhecimentoDocumento`);

ALTER TABLE `RecuperacaoSenhaEmpresa` ADD FOREIGN KEY (`IdEmpresa`) REFERENCES `Empresa` (`IdEmpresa`);