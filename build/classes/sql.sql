ALTER TABLE public.usuario ADD COLUMN nome character varying(500);
ALTER TABLE public.usuario

ALTER TABLE public.usuario ADD COLUMN fone character varying(500);

create table produto(
id bigint not null,
nome character varying(255),
quantidade bigint not null, 
valor numeric(10,4)not null,
constraint prod_id primary key(id)
);


select count(1) as qtd from usuario where login='" + login + "' and id <> " + id

ALTER TABLE produto ADD constraint categoria_pkey foreign key (categoria_id)
references categoria (id);