CREATE TABLE `LoginUsuario` (
  `IdLogin` bigint PRIMARY KEY AUTO_INCREMENT,
  `IdUsuario` varchar(36) NOT NULL,
  `IdEmpresa` varchar(36) NOT NULL,
  `DataLogin` datetime NOT NULL,
  `Ip` varchar(20)
);

ALTER TABLE `LoginUsuario` ADD FOREIGN KEY (`IdUsuario`) REFERENCES `Usuario` (`IdUsuario`);

ALTER TABLE `LoginUsuario` ADD FOREIGN KEY (`IdEmpresa`) REFERENCES `Empresa` (`IdEmpresa`);
