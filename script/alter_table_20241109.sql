alter table ConfiguracoesEmpresa drop column HabilitaAwsClaude;
alter table ConfiguracoesEmpresa drop column QuantidadeClaudeToken;

alter table ConfiguracoesEmpresa add HabilitaTokenClaude bool;
alter table ConfiguracoesEmpresa add ClaudeToken varchar(250);

alter table ConfiguracoesUsuario add ClaudeToken varchar(250);