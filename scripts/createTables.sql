create schema if not exists adotame;

create table if not exists adotame.user(
    id_user uuid primary key,
    name varchar(250) not null,
    email varchar(100) unique not null,
    phone bigint null
);

create table if not exists adotame.login(
    id_login uuid primary key,
    username varchar(250) not null,
    password varchar(100) not null,
    id_user uuid references adotame.user (id_user)
);

create table if not exists adotame.profile(
    id_profile uuid primary key,
    name varchar(250) not null
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
    type varchar(100) check(type in('Cao', 'Gato', 'Todos')), 
    photo varchar(500) not null,
    gender varchar(100) check(gender in('Macho', 'Femea')),
    birth_date date not null,
    size varchar(50) check(size in('Muito pequeno', 'Pequeno', 'Medio', 'Grande', 'Muito grande')),
    fur varchar(100) null,    /*pelagem*/
    breed varchar(300) null,   /*raca*/
    color varchar(250) null,
    vaccines varchar(500) null,
    portion varchar(300) null,
    health varchar(500) null,
    cares varchar(1000) null,
    place_belongs varchar(500) null
);

create table if not exists adotame.catalog_animal(
    id_catalog uuid references adotame.catalog (id_catalog),
    id_animal uuid references adotame.animal (id_animal)
);

create table if not exists adotame.request_type(
    id_request_type uuid primary key,
    request_name varchar(250) check(request_name in('Reportar desaparecido', 'Avistar desaparecido', 'Adicionar animal', 'Adotar', 'Apadrinhar'))
);

create table if not exists adotame.request(
    id_request uuid primary key,
    date_request date not null,
    status varchar(100) check(status in('Aprovado', 'Reprovado', 'Pendente')),
    id_user uuid references adotame.user (id_user),
    id_request_type uuid references adotame.request_type (id_request_type),
    birth_date date null,
    nif bigint null,
    address varchar(250) null,
    postal_code varchar(100) null,
    locality varchar(100) null,
    phone bigint null,
    description varchar(5000) null,
    married varchar(50) check(married in('Sim', 'Nao')) null,
    childs varchar(50) check(childs in('Sim', 'Nao')) null,
    live_with varchar(500) null,
    home_agreement varchar(50) check(home_agreement in('Sim', 'Nao')) null,
    allergies_in_relatives varchar(50) check(allergies_in_relatives in('Sim', 'Nao')) null,
    main_caregiver_name varchar(250) null,
    caregiver_long varchar(50) check(caregiver_long in('Sim', 'Nao')) null,
    caregiver_illness_name varchar(250) null,
    why_adopt varchar(1000) null,
    yard varchar(50) check(yard in('Sim', 'Nao')) null,
    animal_sleep_place varchar(500) null,
    animal_loneless_daytime varchar(50) check(animal_loneless_daytime in('Sim', 'Nao')) null,
    animal_alone_place varchar(500) null,
    playtime varchar(50) check(playtime in('Sim', 'Nao')) null,
    pet_before varchar(50) check(pet_before in('Sim', 'Nao')) null,
    pet_nowdays varchar(50) check(pet_nowdays in('Sim', 'Nao')) null,
    animal_cares_expenses varchar(50) check(animal_cares_expenses in('Sim', 'Nao')) null,
    teach_plans varchar(1000) null,
    moving_home_animal_effects varchar(1000) null,
    give_up_circumstances varchar(1000) null,
    financial_payment_method varchar(50) check(financial_payment_method in('Semanal', 'Mensal', 'Anual')) null,
    value_amount int null,
    hobby varchar(1000) check(hobby in('Passeios', 'Fins de semana', 'Divulgacao do animal', 'Vacinacao', 'Tratamentos', 'Tosquia')) null,
    last_seen_place varchar(2000) null,
    seen_place varchar(5000) null,
    details varchar(5000) null,
    id_animal uuid null,
    report_animal_name varchar(500) null,
    report_animal_photo varchar(500) null,
    report_animal_size varchar(50) check(report_animal_size in('Muito pequeno', 'Pequeno', 'Medio', 'Grande', 'Muito grande')) null,
    report_animal_type varchar(100) check(report_animal_type in('Cao', 'Gato', 'Todos')) null,
    report_animal_gender varchar(100) check(report_animal_gender in('Macho', 'Femea')) null,
    report_animal_fur varchar(100) null,
    report_animal_breed varchar(100) null,
    report_animal_color varchar(250) null
);