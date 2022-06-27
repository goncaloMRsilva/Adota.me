create schema if not exists adotame;

create table if not exists adotame.user(
    id_user int primary key,
    name varchar(250) not null,
    email varchar(100) not null,
    phone int not null
);

create table if not exists adotame.login(
    id_login int primary key,
    username varchar(250) not null,
    password varchar(100) not null,
    id_user int references adotame.user (id_user)
);

create table if not exists adotame.profile(
    id_profile int primary key,
    name varchar(250) not null,
    id_login int references adotame.login (id_login)
);

create table if not exists adotame.login_profile(
    id_login int references adotame.login (id_login),
    id_profile int references adotame.profile (id_profile)
);

create table if not exists adotame.permission(
    id_permission int primary key,
    name varchar(250) not null
);

create table if not exists adotame.profile_permission(
    id_permission int references adotame.permission (id_permission),
    id_profile int references adotame.profile (id_profile)
);

create table if not exists adotame.catalog(
    id_catalog int primary key,
    name varchar(250) not null
);

create table if not exists adotame.animal(
    id_animal int primary key,
    name varchar(100) not null,
    type varchar(100) not null,    /* cao ou gato?*/
    photo varchar(500) not null,
    gender varchar(100) not null,
    age int not null,
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
    id_animal int references adotame.animal (id_animal),
    id_catalog int references adotame.catalog (id_catalog)
);

create table if not exists adotame.request_type(
    id_request_type int primary key,
    name varchar(250) not null
);

create table if not exists adotame.request(
    id_request int primary key,
    username varchar(250) not null,
    date_request date not null,
    id_user int references adotame.user (id_user),
    id_request_type int references adotame.request_type (id_request_type)
);