do $$
declare

v_id_user adotame.user.id_user%type;
v_id_login adotame.login.id_login%type;
v_id_profile adotame.profile.id_profile%type;
v_id_catalog adotame.catalog.id_catalog%type;
v_id_animal adotame.animal.id_animal%type;
v_id_permission adotame.permission.id_permission%type;
v_id_profile_guest adotame.profile.id_profile%type;
-- v_id_profile_commom_user adotame.profile.id_profile%type;
v_id_catalog_missing adotame.catalog.id_catalog%type;

begin

--admin
insert into adotame.user(id_user, name, email, phone) values(gen_random_uuid(), 'admin', 'admin@admin.com', 909897987)
RETURNING id_user into v_id_user;

insert into adotame.login(id_login, username, password, id_user) values (gen_random_uuid(), 'admin@admin.com', '$2a$10$RS3pbRs6gJDvxJedtwy55.uZ77axFZakRIrpmfhyd0pj9BPt6k5Am', v_id_user)
RETURNING id_login into v_id_login;

insert into adotame.profile(id_profile, name) values (gen_random_uuid(), 'admin')
RETURNING id_profile into v_id_profile;

insert into adotame.login_profile(id_profile, id_login) values(v_id_profile, v_id_login);
--

--guest
insert into adotame.user(id_user, name, email, phone) values(gen_random_uuid(), 'guest', 'guest@guest.com', 286594743)
returning id_user into v_id_user;

insert into adotame.login(id_login, username, password, id_user) values(gen_random_uuid(), 'guest@guest.com', '$2a$10$lTM3fVHRyllTftk0DX811uCjx6zRfEI9c9.A.CovUIULqcPk1UXFG', v_id_user)
returning id_login into v_id_login;

insert into adotame.profile(id_profile, name) values(gen_random_uuid(), 'guest')
returning id_profile into v_id_profile_guest;

insert into adotame.login_profile(id_profile, id_login) values(v_id_profile_guest, v_id_login);
--

--user
-- insert into adotame.user(id_user, name, email, phone) values(gen_random_uuid(), 'user', 'user@user.com', 984759408)
-- returning id_user into v_id_user;

-- insert into adotame.login(id_login, username, password, id_user) values(gen_random_uuid(), 'user', crypt('user123', gen_salt('bf')), v_id_user)
-- returning id_login into v_id_login;

-- insert into adotame.profile(id_profile, name) values(gen_random_uuid(), 'user')
-- returning id_profile into v_id_profile_commom_user;

-- insert into adotame.login_profile(id_profile, id_login) values(v_id_profile_commom_user, v_id_login);
--

--permissions
insert into adotame.permission(id_permission, name) values (gen_random_uuid(), 'Gerir Sistema');
insert into adotame.permission(id_permission, name) values (gen_random_uuid(), 'Validar Pedidos');

insert into adotame.permission(id_permission, name) values (gen_random_uuid(), 'Reportar Desaparecido')
returning id_permission into v_id_permission;
-- insert into adotame.profile_permission(id_permission, id_profile) values(v_id_permission, v_id_profile_commom_user);

insert into adotame.permission(id_permission, name) values (gen_random_uuid(), 'Comunicar Avisto Desaparecido')
returning id_permission into v_id_permission;
-- insert into adotame.profile_permission(id_permission, id_profile) values(v_id_permission, v_id_profile_commom_user);

insert into adotame.permission(id_permission, name) values (gen_random_uuid(), 'Adicionar Animal')
returning id_permission into v_id_permission;
-- insert into adotame.profile_permission(id_permission, id_profile) values(v_id_permission, v_id_profile_commom_user);

insert into adotame.permission(id_permission, name) values (gen_random_uuid(), 'Ver Catalogos')
returning id_permission into v_id_permission;
insert into adotame.profile_permission(id_permission, id_profile) values(v_id_permission, v_id_profile_guest);
-- insert into adotame.profile_permission(id_permission, id_profile) values(v_id_permission, v_id_profile_commom_user);

insert into adotame.permission(id_permission, name) values (gen_random_uuid(), 'Ver Caracteristicas dos Animais')
returning id_permission into v_id_permission;
insert into adotame.profile_permission(id_permission, id_profile) values(v_id_permission, v_id_profile_guest);
-- insert into adotame.profile_permission(id_permission, id_profile) values(v_id_permission, v_id_profile_commom_user);

insert into adotame.permission(id_permission, name) values (gen_random_uuid(), 'Adotar')
returning id_permission into v_id_permission;
-- insert into adotame.profile_permission(id_permission, id_profile) values(v_id_permission, v_id_profile_commom_user);

insert into adotame.permission(id_permission, name) values (gen_random_uuid(), 'Apadrinhar')
returning id_permission into v_id_permission;
-- insert into adotame.profile_permission(id_permission, id_profile) values(v_id_permission, v_id_profile_commom_user);

insert into adotame.permission(id_permission, name) values (gen_random_uuid(), 'Donativos')
returning id_permission into v_id_permission;
insert into adotame.profile_permission(id_permission, id_profile) values(v_id_permission, v_id_profile_guest);
-- insert into adotame.profile_permission(id_permission, id_profile) values(v_id_permission, v_id_profile_commom_user);

insert into adotame.permission(id_permission, name) values (gen_random_uuid(), 'Ver Historico de notificacoes')
returning id_permission into v_id_permission;
-- insert into adotame.profile_permission(id_permission, id_profile) values(v_id_permission, v_id_profile_commom_user);
--

insert into adotame.profile_permission(id_permission, id_profile)
select id_permission, id_profile
from adotame.permission, adotame.profile
where id_profile != v_id_profile_guest;
-- and id_profile != v_id_profile_commom_user;


insert into adotame.catalog(id_catalog, name) values (gen_random_uuid(), 'Adotar e Apadrinhar')
RETURNING id_catalog into v_id_catalog;
insert into adotame.catalog(id_catalog, name) values (gen_random_uuid(), 'Desaparecidos')
RETURNING id_catalog into v_id_catalog_missing;


insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, health, cares) values (gen_random_uuid(), 'Capuchin',       'Cao',      'https://images.dog.ceo/breeds/appenzeller/n02107908_691.jpg',       'Macho',       10,     'Pequeno',          'liso', 'Bulldog',           'castanho',     'nao tem',  'pedigree', 'saudavel', 'dar agua freca todos os dias')
RETURNING id_animal into v_id_animal;
insert into adotame.catalog_animal(id_catalog, id_animal) values(v_id_catalog_missing, v_id_animal);

insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, health, cares) values (gen_random_uuid(), 'Bushpig',       'Cao',      'https://images.dog.ceo/breeds/appenzeller/n02107908_691.jpg',       'Femea',     10,     'Grande',            'liso', 'Bulldog',           'castanho', 'nao tem',  'pedigree', 'saudavel', 'dar agua freca todos os dias')
RETURNING id_animal into v_id_animal;
insert into adotame.catalog_animal(id_catalog, id_animal) values(v_id_catalog_missing, v_id_animal);

insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, health, cares) values (gen_random_uuid(), 'Eurasian',      'Cao',      'https://images.dog.ceo/breeds/appenzeller/n02107908_691.jpg',       'Macho',       10,      'Medio',         'liso', 'Bulldog',           'castanho',    'tem',      'pedigree', 'saudavel', 'dar agua freca todos os dias')
RETURNING id_animal into v_id_animal;
insert into adotame.catalog_animal(id_catalog, id_animal) values(v_id_catalog_missing, v_id_animal);

insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, health, cares) values (gen_random_uuid(), 'Mocking',       'Cao',      'https://images.dog.ceo/breeds/appenzeller/n02107908_691.jpg',       'Femea',     10,     'Pequeno',          'liso', 'Retriever',         'castanho',      'nao tem',  'pedigree', 'saudavel', 'dar agua freca todos os dias')
RETURNING id_animal into v_id_animal;
insert into adotame.catalog_animal(id_catalog, id_animal) values(v_id_catalog_missing, v_id_animal);

insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, health, cares) values (gen_random_uuid(), 'Roadrunner',    'Cao',      'https://images.dog.ceo/breeds/appenzeller/n02107908_691.jpg',       'Femea',     10,      'Pequeno',          'liso', 'Retriever',         'castanho',    'tem',      'pedigree', 'saudavel', 'dar agua freca todos os dias')
RETURNING id_animal into v_id_animal;
insert into adotame.catalog_animal(id_catalog, id_animal) values(v_id_catalog_missing, v_id_animal);

insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, health, cares) values (gen_random_uuid(), 'Red',           'Cao',      'https://images.dog.ceo/breeds/appenzeller/n02107908_691.jpg',       'Macho',       10,     'Muito pequeno',    'liso', 'Retriever',         'castanho',    'tem',      'pedigree', 'saudavel', 'dar agua freca todos os dias')
RETURNING id_animal into v_id_animal;
insert into adotame.catalog_animal(id_catalog, id_animal) values(v_id_catalog_missing, v_id_animal);

insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, health, cares) values (gen_random_uuid(), 'Marshbird',     'Cao',      'https://images.dog.ceo/breeds/appenzeller/n02107908_691.jpg',       'Femea',     10,      'Muito pequeno',    'liso', 'Retriever',         'castanho',   'tem',      'pedigree', 'saudavel', 'dar agua freca todos os dias')
RETURNING id_animal into v_id_animal;
insert into adotame.catalog_animal(id_catalog, id_animal) values(v_id_catalog_missing, v_id_animal);

insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, health, cares) values (gen_random_uuid(), 'Bleu',          'Cao',      'https://images.dog.ceo/breeds/appenzeller/n02107908_691.jpg',       'Femea',     10,      'Muito pequeno',    'liso', 'Chihuahua',         'castanho',      'tem',      'pedigree', 'saudavel', 'dar agua freca todos os dias')
RETURNING id_animal into v_id_animal;
insert into adotame.catalog_animal(id_catalog, id_animal) values(v_id_catalog_missing, v_id_animal);

insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, health, cares) values (gen_random_uuid(), 'Hawk',          'Cao',      'https://images.dog.ceo/breeds/appenzeller/n02107908_691.jpg',       'Macho',       10,     'Medio',         'liso', 'Chihuahua',         'castanho',     'tem',      'pedigree', 'nao saudavel', 'dar agua freca todos os dias')
RETURNING id_animal into v_id_animal;
insert into adotame.catalog_animal(id_catalog, id_animal) values(v_id_catalog_missing, v_id_animal);

insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, health, cares) values (gen_random_uuid(), 'Antelope',     'Cao',      'https://images.dog.ceo/breeds/appenzeller/n02107908_691.jpg',       'Macho',      10,     'Pequeno',          'liso', 'Chihuahua',         'preto',    'tem',      'pedigree', 'nao saudavel', 'voltinha a rua')
RETURNING id_animal into v_id_animal;
insert into adotame.catalog_animal(id_catalog, id_animal) values(v_id_catalog_missing, v_id_animal);

insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, health, cares) values (gen_random_uuid(), 'Violet',       'Cao',      'https://images.dog.ceo/breeds/appenzeller/n02107908_691.jpg',       'Femea',     10,     'Pequeno',          'liso', 'Chihuahua',         'preto',    'nao tem',  'pedigree', 'nao saudavel', 'voltinha a rua')
RETURNING id_animal into v_id_animal;
insert into adotame.catalog_animal(id_catalog, id_animal) values(v_id_catalog, v_id_animal);

insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, health, cares) values (gen_random_uuid(), 'Eastern',      'Cao',      'https://images.dog.ceo/breeds/appenzeller/n02107908_691.jpg',       'Macho',       10,     'Grande',            'liso', 'Chihuahua',         'preto',    'nao tem',  'pedigree', 'nao saudavel', 'voltinha a rua')
RETURNING id_animal into v_id_animal;
insert into adotame.catalog_animal(id_catalog, id_animal) values(v_id_catalog, v_id_animal);

insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, health, cares) values (gen_random_uuid(), 'Emerald',      'Gato',      'https://cdn2.thecatapi.com/images/MTU0ODc1Nw.jpg',                 'Femea',     10,     'Medio',         'liso', 'British-Shorthair',             'preto',    'nao tem',  'whiskas', 'saudavel', 'voltinha a rua')
RETURNING id_animal into v_id_animal;
insert into adotame.catalog_animal(id_catalog, id_animal) values(v_id_catalog_missing, v_id_animal);

insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, health, cares) values (gen_random_uuid(), 'American',     'Gato',      'https://cdn2.thecatapi.com/images/MTU0ODc1Nw.jpg',                 'Macho',       10,      'Grande',            'liso', 'British-Shorthair',             'preto', 'nao tem',  'whiskas', 'saudavel', 'voltinha a rua')
RETURNING id_animal into v_id_animal;
insert into adotame.catalog_animal(id_catalog, id_animal) values(v_id_catalog_missing, v_id_animal);

insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, health, cares) values (gen_random_uuid(), 'Tinamou',      'Gato',      'https://cdn2.thecatapi.com/images/MTU0ODc1Nw.jpg',                'Macho',      10,     'Muito grande',      'liso', 'British-Shorthair', 'preto',      'nao tem',  'whiskas',  'saudavel', 'voltinha a rua')
RETURNING id_animal into v_id_animal;
insert into adotame.catalog_animal(id_catalog, id_animal) values(v_id_catalog_missing, v_id_animal);

insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, health, cares) values (gen_random_uuid(), 'Greater',      'Gato',      'https://cdn2.thecatapi.com/images/MTU0ODc1Nw.jpg',                'Macho',       10,      'Medio',         'liso', 'British-Shorthair', 'preto',    'nao tem',  'whiskas',  'saudavel', 'voltinha a rua')
RETURNING id_animal into v_id_animal;
insert into adotame.catalog_animal(id_catalog, id_animal) values(v_id_catalog_missing, v_id_animal);

insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, health, cares) values (gen_random_uuid(), 'Turkey',       'Gato',      'https://cdn2.thecatapi.com/images/MTU0ODc1Nw.jpg',                'Femea',     10,      'Muito grande',      'liso', 'British-Shorthair', 'preto',    'tem',      'whiskas',  'saudavel', 'Technetium Tc-99m Generator')
RETURNING id_animal into v_id_animal;
insert into adotame.catalog_animal(id_catalog, id_animal) values(v_id_catalog_missing, v_id_animal);

insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, health, cares) values (gen_random_uuid(), 'Koala',        'Gato',      'https://cdn2.thecatapi.com/images/MTU0ODc1Nw.jpg',                'Femea',     10,      'Pequeno',          'liso', 'British-Shorthair', 'preto',      'nao tem',  'whiskas',  'saudavel', 'voltinha a rua')
RETURNING id_animal into v_id_animal;
insert into adotame.catalog_animal(id_catalog, id_animal) values(v_id_catalog_missing, v_id_animal);

insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, health, cares) values (gen_random_uuid(), 'Indian',       'Gato',      'https://cdn2.thecatapi.com/images/MTU0ODc1Nw.jpg',                'Macho',       10,      'Grande',            'liso', 'British-Shorthair', 'preto', 'tem',      'whiskas',  'nao saudavel', 'voltinha a rua')
RETURNING id_animal into v_id_animal;
insert into adotame.catalog_animal(id_catalog, id_animal) values(v_id_catalog_missing, v_id_animal);

insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, health, cares) values (gen_random_uuid(), 'Openbill',     'Gato',      'https://cdn2.thecatapi.com/images/MTU0ODc1Nw.jpg',                'Macho',       10,      'Medio',         'liso', 'British-Shorthair', 'castanho',    'tem',      'whiskas',  'saudavel', 'voltinha a rua')
RETURNING id_animal into v_id_animal;
insert into adotame.catalog_animal(id_catalog, id_animal) values(v_id_catalog_missing, v_id_animal);

insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, health, cares) values (gen_random_uuid(), 'African',      'Gato',      'https://cdn2.thecatapi.com/images/MTU0ODc1Nw.jpg',                'Femea',    10,     'Pequeno',          'liso', 'British-Shorthair', 'castanho',     'nao tem',  'whiskas',  'saudavel', 'walk for pee')
RETURNING id_animal into v_id_animal;
insert into adotame.catalog_animal(id_catalog, id_animal) values(v_id_catalog_missing, v_id_animal);

insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, health, cares) values (gen_random_uuid(), 'Cap',          'Cao',      'https://images.dog.ceo/breeds/appenzeller/n02107908_691.jpg',      'Macho',       10,     'Pequeno',          'liso', 'Bulldog',           'castanho',     'nao tem',  'pedigree', 'saudavel', 'dar agua freca todos os dias')
RETURNING id_animal into v_id_animal;
insert into adotame.catalog_animal(id_catalog, id_animal) values(v_id_catalog, v_id_animal);

insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, health, cares) values (gen_random_uuid(), 'Bus',          'Cao',      'https://images.dog.ceo/breeds/appenzeller/n02107908_691.jpg',      'Femea',     10,     'Grande',            'liso', 'Bulldog',           'castanho', 'nao tem',  'pedigree', 'saudavel', 'dar agua freca todos os dias')
RETURNING id_animal into v_id_animal;
insert into adotame.catalog_animal(id_catalog, id_animal) values(v_id_catalog, v_id_animal);

insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, health, cares) values (gen_random_uuid(), 'Eur',          'Cao',      'https://images.dog.ceo/breeds/appenzeller/n02107908_691.jpg',      'Macho',      10,      'Medio',         'liso', 'Bulldog',           'castanho',    'tem',      'pedigree', 'saudavel', 'dar agua freca todos os dias')
RETURNING id_animal into v_id_animal;
insert into adotame.catalog_animal(id_catalog, id_animal) values(v_id_catalog, v_id_animal);

insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, health, cares) values (gen_random_uuid(), 'Moc',          'Cao',      'https://images.dog.ceo/breeds/appenzeller/n02107908_691.jpg',      'Femea',     10,     'Pequeno',          'liso', 'Retriever',         'castanho',      'nao tem',  'pedigree', 'saudavel', 'dar agua freca todos os dias')
RETURNING id_animal into v_id_animal;
insert into adotame.catalog_animal(id_catalog, id_animal) values(v_id_catalog, v_id_animal);

insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, health, cares) values (gen_random_uuid(), 'Roa',          'Cao',      'https://images.dog.ceo/breeds/appenzeller/n02107908_691.jpg',      'Femea',     10,      'Pequeno',          'liso', 'Retriever',         'castanho',    'tem',      'pedigree', 'saudavel', 'dar agua freca todos os dias')
RETURNING id_animal into v_id_animal;
insert into adotame.catalog_animal(id_catalog, id_animal) values(v_id_catalog, v_id_animal);

insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, health, cares) values (gen_random_uuid(), 'Re',           'Cao',      'https://images.dog.ceo/breeds/appenzeller/n02107908_691.jpg',      'Macho',       10,     'Muito pequeno',    'liso', 'Retriever',         'castanho',    'tem',      'pedigree', 'saudavel', 'dar agua freca todos os dias')
RETURNING id_animal into v_id_animal;
insert into adotame.catalog_animal(id_catalog, id_animal) values(v_id_catalog, v_id_animal);

insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, health, cares) values (gen_random_uuid(), 'Mar',          'Cao',      'https://images.dog.ceo/breeds/appenzeller/n02107908_691.jpg',      'Femea',     10,      'Muito pequeno',    'liso', 'Retriever',         'castanho',   'tem',      'pedigree', 'saudavel', 'dar agua freca todos os dias')
RETURNING id_animal into v_id_animal;
insert into adotame.catalog_animal(id_catalog, id_animal) values(v_id_catalog, v_id_animal);

insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, health, cares) values (gen_random_uuid(), 'Boo',          'Cao',      'https://images.dog.ceo/breeds/appenzeller/n02107908_691.jpg',      'Femea',     10,      'Muito pequeno',    'liso', 'Chihuahua',         'castanho',      'tem',      'pedigree', 'saudavel', 'dar agua freca todos os dias')
RETURNING id_animal into v_id_animal;
insert into adotame.catalog_animal(id_catalog, id_animal) values(v_id_catalog, v_id_animal);

insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, health, cares) values (gen_random_uuid(), 'Hwq',          'Cao',      'https://images.dog.ceo/breeds/appenzeller/n02107908_691.jpg',      'Macho',       10,     'Medio',         'liso', 'Chihuahua',         'castanho',     'tem',      'pedigree', 'nao saudavel', 'dar agua freca todos os dias')
RETURNING id_animal into v_id_animal;
insert into adotame.catalog_animal(id_catalog, id_animal) values(v_id_catalog, v_id_animal);

insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, health, cares) values (gen_random_uuid(), 'Ant',          'Cao',      'https://images.dog.ceo/breeds/appenzeller/n02107908_691.jpg',         'Macho',       10,     'Pequeno',          'liso', 'Chihuahua',         'castanho', 'tem',      'pedigree', 'nao saudavel', 'voltinha a rua')
RETURNING id_animal into v_id_animal;
insert into adotame.catalog_animal(id_catalog, id_animal) values(v_id_catalog, v_id_animal);

insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, health, cares) values (gen_random_uuid(), 'Vio',          'Cao',      'https://images.dog.ceo/breeds/appenzeller/n02107908_691.jpg',      'Femea',     10,     'Pequeno',          'liso', 'Chihuahua',         'preto',    'nao tem',  'pedigree', 'nao saudavel', 'voltinha a rua')
RETURNING id_animal into v_id_animal;
insert into adotame.catalog_animal(id_catalog, id_animal) values(v_id_catalog, v_id_animal);

insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, health, cares) values (gen_random_uuid(), 'Eas',          'Cao',      'https://images.dog.ceo/breeds/appenzeller/n02107908_691.jpg',       'Macho',       10,     'Grande',            'liso', 'Chihuahua',         'preto',    'nao tem',  'pedigree', 'nao saudavel', 'voltinha a rua')
RETURNING id_animal into v_id_animal;
insert into adotame.catalog_animal(id_catalog, id_animal) values(v_id_catalog, v_id_animal);

insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, health, cares) values (gen_random_uuid(), 'Eme',          'Gato',      'https://cdn2.thecatapi.com/images/MTU0ODc1Nw.jpg',                 'Femea',     10,     'Medio',         'liso', 'British-Shorthair',             'preto',    'nao tem',  'whiskas', 'saudavel', 'voltinha a rua')
RETURNING id_animal into v_id_animal;
insert into adotame.catalog_animal(id_catalog, id_animal) values(v_id_catalog_missing, v_id_animal);

insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, health, cares) values (gen_random_uuid(), 'Ame',          'Gato',      'https://cdn2.thecatapi.com/images/MTU0ODc1Nw.jpg',                  'Macho',       10,      'Grande',            'liso', 'British-Shorthair',             'preto', 'nao tem',  'whiskas', 'saudavel', 'voltinha a rua')
RETURNING id_animal into v_id_animal;
insert into adotame.catalog_animal(id_catalog, id_animal) values(v_id_catalog, v_id_animal);

insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, health, cares) values (gen_random_uuid(), 'Tin',          'Gato',      'https://cdn2.thecatapi.com/images/MTU0ODc1Nw.jpg',                 'Macho',       10,     'Muito grande',      'liso', 'British-Shorthair', 'preto',      'nao tem',  'whiskas',  'saudavel', 'voltinha a rua')
RETURNING id_animal into v_id_animal;
insert into adotame.catalog_animal(id_catalog, id_animal) values(v_id_catalog, v_id_animal);

insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, health, cares) values (gen_random_uuid(), 'Gre',          'Gato',      'https://cdn2.thecatapi.com/images/MTU0ODc1Nw.jpg',                 'Macho',       10,      'Medio',         'liso', 'British-Shorthair', 'preto',    'nao tem',  'whiskas',  'saudavel', 'voltinha a rua')
RETURNING id_animal into v_id_animal;
insert into adotame.catalog_animal(id_catalog, id_animal) values(v_id_catalog, v_id_animal);

insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, health, cares) values (gen_random_uuid(), 'Tur',          'Gato',      'https://cdn2.thecatapi.com/images/MTU0ODc1Nw.jpg',                'Femea',     10,      'Muito grande',      'liso', 'British-Shorthair', 'preto',    'tem',      'whiskas',  'saudavel', 'Technetium Tc-99m Generator')
RETURNING id_animal into v_id_animal;
insert into adotame.catalog_animal(id_catalog, id_animal) values(v_id_catalog, v_id_animal);

insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, health, cares) values (gen_random_uuid(), 'Koa',          'Gato',      'https://cdn2.thecatapi.com/images/MTU0ODc1Nw.jpg',               'Femea',     10,      'Pequeno',          'liso', 'British-Shorthair', 'preto',      'nao tem',  'whiskas',  'saudavel', 'voltinha a rua')
RETURNING id_animal into v_id_animal;
insert into adotame.catalog_animal(id_catalog, id_animal) values(v_id_catalog, v_id_animal);

insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, health, cares) values (gen_random_uuid(), 'Ind',          'Gato',      'https://cdn2.thecatapi.com/images/MTU0ODc1Nw.jpg',                'Macho',       10,      'Grande',            'liso', 'British-Shorthair', 'preto', 'tem',      'whiskas',  'nao saudavel', 'voltinha a rua')
RETURNING id_animal into v_id_animal;
insert into adotame.catalog_animal(id_catalog, id_animal) values(v_id_catalog, v_id_animal);

insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, health, cares) values (gen_random_uuid(), 'Ope',          'Gato',      'https://cdn2.thecatapi.com/images/MTU0ODc1Nw.jpg',                  'Macho',      10,      'Medio',         'liso', 'British-Shorthair', 'preto',    'tem',      'whiskas',  'saudavel', 'voltinha a rua')
RETURNING id_animal into v_id_animal;
insert into adotame.catalog_animal(id_catalog, id_animal) values(v_id_catalog, v_id_animal);

insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, health, cares) values (gen_random_uuid(), 'Afe',          'Gato',      'https://cdn2.thecatapi.com/images/MTU0ODc1Nw.jpg',                 'Femea',     10,     'Pequeno',          'liso', 'British-Shorthair', 'preto',     'nao tem',  'whiskas',  'saudavel', 'walk for pee')
RETURNING id_animal into v_id_animal;
insert into adotame.catalog_animal(id_catalog, id_animal) values(v_id_catalog, v_id_animal);


-- insert into adotame.catalog_animal(id_catalog, id_animal)
-- select id_catalog, id_animal
-- from adotame.catalog, adotame.animal
-- where id_catalog = v_id_catalog;


insert into adotame.request_type(id_request_type, name) values(gen_random_uuid(), 'Avistar desaparecido');
insert into adotame.request_type(id_request_type, name) values(gen_random_uuid(), 'Reportar desaparecido');
insert into adotame.request_type(id_request_type, name) values(gen_random_uuid(), 'Adotar');
insert into adotame.request_type(id_request_type, name) values(gen_random_uuid(), 'Apadrinhar');
insert into adotame.request_type(id_request_type, name) values(gen_random_uuid(), 'Adicionar animal');

end $$;
