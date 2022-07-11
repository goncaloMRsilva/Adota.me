create schema if not exists adotame;

create table if not exists adotame.user(
    id_user uuid primary key,
    name varchar(250) not null,
    email varchar(100) not null,
    phone bigint not null
);

create table if not exists adotame.login(
    id_login uuid primary key,
    username varchar(250) not null,
    password varchar(100) not null,
    id_user uuid references adotame.user (id_user)
);

create table if not exists adotame.profile(
    id_profile uuid primary key,
    name varchar(250) not null,
    id_login uuid references adotame.login (id_login)
);

create table if not exists adotame.login_profile(
    id_login uuid references adotame.login (id_login),
    id_profile uuid references adotame.profile (id_profile)
);

create table if not exists adotame.permission(
    id_permission uuid primary key,
    name varchar(250) not null
);

create table if not exists adotame.profile_permission(
    id_permission uuid references adotame.permission (id_permission),
    id_profile uuid references adotame.profile (id_profile)
);

create table if not exists adotame.catalog(
    id_catalog uuid primary key,
    name varchar(250) not null
);

create table if not exists adotame.animal(
    id_animal uuid primary key,
    name varchar(100) not null,
    type varchar(100) not null,    /* cao ou gato?*/
    photo varchar(500) not null,
    gender varchar(100) not null,
    age bigint not null,
    size varchar (100) not null,
    fur varchar(100) not null,    /*pelagem*/
    breed varchar(300) not null,   /*raca*/
    color varchar(250) null,
    vaccines varchar(500) null,
    portion varchar(300) null,
    state varchar(500) not null,
    cares varchar(1000) not null
);

create table if not exists adotame.catalog_animal(
    id_catalog uuid references adotame.catalog (id_catalog),
    id_animal uuid references adotame.animal (id_animal)
);

create table if not exists adotame.request_type(
    id_request_type uuid primary key,
    name varchar(250) not null
);

create table if not exists adotame.request(
    id_request uuid primary key,
    username varchar(250) not null,
    date_request date not null,
    id_user uuid references adotame.user (id_user),
    id_request_type uuid references adotame.request_type (id_request_type)
);