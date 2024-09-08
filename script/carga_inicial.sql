insert into EscopoAssistente
values
(1, 'Publico'),
(2, 'Compartilhado'),
(3, 'Privado');

insert into ModeloAssistente
values
(1, 'OpenAi'),
(2, 'Gemini'),
(3, 'Claude');


insert into TipoMensagem
values
(1, 'Usuario'),
(2, 'Sistema'),
(3, 'Assistente');

insert into EscopoBaseConhecimento
(IdEscopoBaseConhecimento, DescricacaoEscopoBaseConhecimento)
values
(1, 'Privado'),
(2, 'Publico');

insert into StatusBaseConhecimentoDocumento
(IdStatusBaseConhecimentoDocumento, DescricaoStatusBaseConhecimentoDocumento)
values
(1, 'Criado'),
(2, 'Indexando'),
(3, 'Finalizado'),
(4, 'Erro');