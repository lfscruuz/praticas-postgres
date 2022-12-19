CREATE DATABASE "praticaModelagem";

CREATE TABLE "usuarios"(
	id SERIAL PRIMARY KEY,
	"nome" TEXT NOT NULL,
	"email" TEXT NOT NULL,
	"senha" TEXT NOT NULL
);

create table "enderecos"(
	id serial primary key,
	"numero" text not null,
	"rua" text not null,
	"bairro" text not null,
	"cidade" text not null,
	"uf" text not null,
	"pais" text not null,
	"cep" text not null,
    "complemento" text,
	"id_usuario" int not null references "usuarios"("id")
);

create table "categorias_produtos"(
	id serial primary key,
	"nome" text not null
);

create table "tamanhos_produtos"(
	id serial primary key,
	"nome" text not null
);

create table "produtos" (
	id serial primary key,
	"nome" text not null,
	"preco" int not null,
	"id_categoria" int not null references "categorias_produtos"("id"),
	"id_tamanho" int not null references "tamanhos_produtos"("id")	
);

create table "fotos_produtos"(
	id serial primary key,
	"principal" boolean not null,
	"id_produto" int not null references "produtos"
);

create table "estados_compras"(
	id serial primary key,
	"nome" text not null
);

create table "compras"(
    id serial primary key,
    "data" date,
    "id_usuario" int not null references "usuarios"("id"),
    "id_produto" int not null references "produtos"("id"),
    "id_estado" int not null references "estados_compras"("id")
);