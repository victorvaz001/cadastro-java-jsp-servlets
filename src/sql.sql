---------------------------------------------------------------------------
//Tabela de Produto
create table produto(
id bigint not null,
nome character varying(255),
quantidade bigint not null, 
valor numeric(10,4)not null,
constraint prod_id primary key(id)
);
---------------------------------------------------------------------------
//Tabela de telefones
CREATE TABLE public.telefone
(
  id bigint NOT NULL DEFAULT nextval('fonesequence'::regclass),
  numero character varying(500),
  tipo character varying(500),
  usuario bigint NOT NULL,
  CONSTRAINT fone_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.telefone
  OWNER TO postgres;
---------------------------------------------------------------------------
//Tabela de categoria
CREATE TABLE public.categoria
(
  id bigint NOT NULL DEFAULT nextval('categoriasequence'::regclass),
  nome character varying(255),
  CONSTRAINT categoria_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.categoria
  OWNER TO postgres;
---------------------------------------------------------------------------

 
ALTER TABLE public.usuario ADD COLUMN nome character varying(500);
ALTER TABLE public.usuario

ALTER TABLE public.usuario ADD COLUMN fone character varying(500);  

select count(1) as qtd from usuario where login='" + login + "' and id <> " + id

ALTER TABLE produto ADD constraint categoria_pkey foreign key (categoria_id)
references categoria (id);


