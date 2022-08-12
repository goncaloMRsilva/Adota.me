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

insert into adotame.login(id_login, username, password, id_user) values (gen_random_uuid(), 'admin@admin.com', crypt('admin123', gen_salt('bf')), v_id_user)
RETURNING id_login into v_id_login;

insert into adotame.profile(id_profile, name) values (gen_random_uuid(), 'admin')
RETURNING id_profile into v_id_profile;

insert into adotame.login_profile(id_profile, id_login) values(v_id_profile, v_id_login);
--

--guest
insert into adotame.user(id_user, name, email, phone) values(gen_random_uuid(), 'guest', 'guest@guest.com', 286594743)
returning id_user into v_id_user;

insert into adotame.login(id_login, username, password, id_user) values(gen_random_uuid(), 'guest@guest.com', crypt('guest123', gen_salt('bf')), v_id_user)
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


insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, health, cares) values (gen_random_uuid(), 'Capuchin',       'dog',      'https://images.dog.ceo/breeds/appenzeller/n02107908_691.jpg',       'Male',       Now(),     'small',          'straight', 'Bulldog',           'Green',     'nao tem',  'pedigree', 'very good', 'change water erery day')
RETURNING id_animal into v_id_animal;
insert into adotame.catalog_animal(id_catalog, id_animal) values(v_id_catalog_missing, v_id_animal);

insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, health, cares) values (gen_random_uuid(), 'Bushpig',       'dog',      'https://images.dog.ceo/breeds/appenzeller/n02107908_691.jpg',       'Female',     Now(),     'huge',            'straight', 'Bulldog',           'Goldenrod', 'nao tem',  'pedigree', 'very good', 'change water erery day')
RETURNING id_animal into v_id_animal;
insert into adotame.catalog_animal(id_catalog, id_animal) values(v_id_catalog_missing, v_id_animal);

insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, health, cares) values (gen_random_uuid(), 'Eurasian',      'dog',      'https://images.dog.ceo/breeds/appenzeller/n02107908_691.jpg',       'Male',       Now(),      'medium',         'straight', 'Bulldog',           'Yellow',    'tem',      'pedigree', 'very good', 'change water erery day')
RETURNING id_animal into v_id_animal;
insert into adotame.catalog_animal(id_catalog, id_animal) values(v_id_catalog_missing, v_id_animal);

insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, health, cares) values (gen_random_uuid(), 'Mocking',       'dog',      'https://images.dog.ceo/breeds/appenzeller/n02107908_691.jpg',       'Female',     Now(),     'small',          'straight', 'Retriever',         'Teal',      'nao tem',  'pedigree', 'good', 'change water erery day')
RETURNING id_animal into v_id_animal;
insert into adotame.catalog_animal(id_catalog, id_animal) values(v_id_catalog_missing, v_id_animal);

insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, health, cares) values (gen_random_uuid(), 'Roadrunner',    'dog',      'https://images.dog.ceo/breeds/appenzeller/n02107908_691.jpg',       'Female',     Now(),      'small',          'straight', 'Retriever',         'Violet',    'tem',      'pedigree', 'good', 'change water erery day')
RETURNING id_animal into v_id_animal;
insert into adotame.catalog_animal(id_catalog, id_animal) values(v_id_catalog_missing, v_id_animal);

insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, health, cares) values (gen_random_uuid(), 'Red',           'dog',      'https://images.dog.ceo/breeds/appenzeller/n02107908_691.jpg',       'Male',       Now(),     'extra small',    'straight', 'Retriever',         'Yellow',    'tem',      'pedigree', 'good', 'change water erery day')
RETURNING id_animal into v_id_animal;
insert into adotame.catalog_animal(id_catalog, id_animal) values(v_id_catalog_missing, v_id_animal);

insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, health, cares) values (gen_random_uuid(), 'Marshbird',     'dog',      'https://images.dog.ceo/breeds/appenzeller/n02107908_691.jpg',       'Female',     Now(),      'extra small',    'straight', 'Retriever',         'Crimson',   'tem',      'pedigree', 'very good', 'change water erery day')
RETURNING id_animal into v_id_animal;
insert into adotame.catalog_animal(id_catalog, id_animal) values(v_id_catalog_missing, v_id_animal);

insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, health, cares) values (gen_random_uuid(), 'Bleu',          'dog',      'https://images.dog.ceo/breeds/appenzeller/n02107908_691.jpg',       'Female',     Now(),      'extra small',    'straight', 'Chihuahua',         'Teal',      'tem',      'pedigree', 'very good', 'change water erery day')
RETURNING id_animal into v_id_animal;
insert into adotame.catalog_animal(id_catalog, id_animal) values(v_id_catalog_missing, v_id_animal);

insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, health, cares) values (gen_random_uuid(), 'Hawk',          'dog',      'https://images.dog.ceo/breeds/appenzeller/n02107908_691.jpg',       'Male',       Now(),     'medium',         'straight', 'Chihuahua',         'Green',     'tem',      'pedigree', 'bad', 'change water erery day')
RETURNING id_animal into v_id_animal;
insert into adotame.catalog_animal(id_catalog, id_animal) values(v_id_catalog_missing, v_id_animal);

insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, health, cares) values (gen_random_uuid(), 'Antelope',     'dog',      'https://images.dog.ceo/breeds/appenzeller/n02107908_691.jpg',       'Male',      Now(),     'small',          'straight', 'Chihuahua',         'Turquoise', 'tem',      'pedigree', 'bad', 'cuddles water erery day')
RETURNING id_animal into v_id_animal;
insert into adotame.catalog_animal(id_catalog, id_animal) values(v_id_catalog_missing, v_id_animal);

insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, health, cares) values (gen_random_uuid(), 'Violet',       'dog',      'https://images.dog.ceo/breeds/appenzeller/n02107908_691.jpg',       'Female',     Now(),     'small',          'straight', 'Chihuahua',         'Indigo',    'nao tem',  'pedigree', 'bad', 'cuddles water erery day')
RETURNING id_animal into v_id_animal;
insert into adotame.catalog_animal(id_catalog, id_animal) values(v_id_catalog, v_id_animal);

insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, health, cares) values (gen_random_uuid(), 'Eastern',      'dog',      'https://images.dog.ceo/breeds/appenzeller/n02107908_691.jpg',       'Male',       Now(),     'huge',            'straight', 'Chihuahua',         'Violet',    'nao tem',  'pedigree', 'bad', 'cuddles water erery day')
RETURNING id_animal into v_id_animal;
insert into adotame.catalog_animal(id_catalog, id_animal) values(v_id_catalog, v_id_animal);

insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, health, cares) values (gen_random_uuid(), 'Emerald',      'cat',      'https://cdn2.thecatapi.com/images/MTU0ODc1Nw.jpg',                 'Female',     Now(),     'medium',         'straight', 'British-Shorthair',             'Maroon',    'nao tem',  'whiskas', 'good', 'cuddles water erery day')
RETURNING id_animal into v_id_animal;
insert into adotame.catalog_animal(id_catalog, id_animal) values(v_id_catalog_missing, v_id_animal);

insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, health, cares) values (gen_random_uuid(), 'American',     'cat',      'https://cdn2.thecatapi.com/images/MTU0ODc1Nw.jpg',                 'Male',       Now(),      'huge',            'straight', 'British-Shorthair',             'Goldenrod', 'nao tem',  'whiskas', 'very good', 'cuddles water erery day')
RETURNING id_animal into v_id_animal;
insert into adotame.catalog_animal(id_catalog, id_animal) values(v_id_catalog_missing, v_id_animal);

insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, health, cares) values (gen_random_uuid(), 'Tinamou',      'cat',      'https://cdn2.thecatapi.com/images/MTU0ODc1Nw.jpg',                'Male',      Now(),     'extra huge',      'straight', 'British-Shorthair', 'Blue',      'nao tem',  'whiskas',  'very good', 'cuddles water erery day')
RETURNING id_animal into v_id_animal;
insert into adotame.catalog_animal(id_catalog, id_animal) values(v_id_catalog_missing, v_id_animal);

insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, health, cares) values (gen_random_uuid(), 'Greater',      'cat',      'https://cdn2.thecatapi.com/images/MTU0ODc1Nw.jpg',                'Male',       Now(),      'medium',         'straight', 'British-Shorthair', 'Indigo',    'nao tem',  'whiskas',  'very good', 'cuddles water erery day')
RETURNING id_animal into v_id_animal;
insert into adotame.catalog_animal(id_catalog, id_animal) values(v_id_catalog_missing, v_id_animal);

insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, health, cares) values (gen_random_uuid(), 'Turkey',       'cat',      'https://cdn2.thecatapi.com/images/MTU0ODc1Nw.jpg',                'Female',     Now(),      'extra huge',      'straight', 'British-Shorthair', 'Fuscia',    'tem',      'whiskas',  'good', 'Technetium Tc-99m Generator')
RETURNING id_animal into v_id_animal;
insert into adotame.catalog_animal(id_catalog, id_animal) values(v_id_catalog_missing, v_id_animal);

insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, health, cares) values (gen_random_uuid(), 'Koala',        'cat',      'https://cdn2.thecatapi.com/images/MTU0ODc1Nw.jpg',                'Female',     Now(),      'small',          'straight', 'British-Shorthair', 'Blue',      'nao tem',  'whiskas',  'good', 'cuddles water erery day')
RETURNING id_animal into v_id_animal;
insert into adotame.catalog_animal(id_catalog, id_animal) values(v_id_catalog_missing, v_id_animal);

insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, health, cares) values (gen_random_uuid(), 'Indian',       'cat',      'https://cdn2.thecatapi.com/images/MTU0ODc1Nw.jpg',                'Male',       Now(),      'huge',            'straight', 'British-Shorthair', 'Turquoise', 'tem',      'whiskas',  'bad', 'cuddles water erery day')
RETURNING id_animal into v_id_animal;
insert into adotame.catalog_animal(id_catalog, id_animal) values(v_id_catalog_missing, v_id_animal);

insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, health, cares) values (gen_random_uuid(), 'Openbill',     'cat',      'https://cdn2.thecatapi.com/images/MTU0ODc1Nw.jpg',                'Male',       Now(),      'medium',         'straight', 'British-Shorthair', 'Indigo',    'tem',      'whiskas',  'very good', 'cuddles water erery day')
RETURNING id_animal into v_id_animal;
insert into adotame.catalog_animal(id_catalog, id_animal) values(v_id_catalog_missing, v_id_animal);

insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, health, cares) values (gen_random_uuid(), 'African',      'cat',      'https://cdn2.thecatapi.com/images/MTU0ODc1Nw.jpg',                'Female',    Now(),     'small',          'straight', 'British-Shorthair', 'Khaki',     'nao tem',  'whiskas',  'good', 'walk for pee')
RETURNING id_animal into v_id_animal;
insert into adotame.catalog_animal(id_catalog, id_animal) values(v_id_catalog_missing, v_id_animal);

insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, health, cares) values (gen_random_uuid(), 'Cap',          'dog',      'https://images.dog.ceo/breeds/appenzeller/n02107908_691.jpg',      'Male',       Now(),     'small',          'straight', 'Bulldog',           'Green',     'nao tem',  'pedigree', 'very good', 'change water erery day')
RETURNING id_animal into v_id_animal;
insert into adotame.catalog_animal(id_catalog, id_animal) values(v_id_catalog, v_id_animal);

insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, health, cares) values (gen_random_uuid(), 'Bus',          'dog',      'https://images.dog.ceo/breeds/appenzeller/n02107908_691.jpg',      'Female',     Now(),     'huge',            'straight', 'Bulldog',           'Goldenrod', 'nao tem',  'pedigree', 'very good', 'change water erery day')
RETURNING id_animal into v_id_animal;
insert into adotame.catalog_animal(id_catalog, id_animal) values(v_id_catalog, v_id_animal);

insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, health, cares) values (gen_random_uuid(), 'Eur',          'dog',      'https://images.dog.ceo/breeds/appenzeller/n02107908_691.jpg',      'Male',      Now(),      'medium',         'straight', 'Bulldog',           'Yellow',    'tem',      'pedigree', 'very good', 'change water erery day')
RETURNING id_animal into v_id_animal;
insert into adotame.catalog_animal(id_catalog, id_animal) values(v_id_catalog, v_id_animal);

insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, health, cares) values (gen_random_uuid(), 'Moc',          'dog',      'https://images.dog.ceo/breeds/appenzeller/n02107908_691.jpg',      'Female',     Now(),     'small',          'straight', 'Retriever',         'Teal',      'nao tem',  'pedigree', 'good', 'change water erery day')
RETURNING id_animal into v_id_animal;
insert into adotame.catalog_animal(id_catalog, id_animal) values(v_id_catalog, v_id_animal);

insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, health, cares) values (gen_random_uuid(), 'Roa',          'dog',      'https://images.dog.ceo/breeds/appenzeller/n02107908_691.jpg',      'Female',     Now(),      'small',          'straight', 'Retriever',         'Violet',    'tem',      'pedigree', 'good', 'change water erery day')
RETURNING id_animal into v_id_animal;
insert into adotame.catalog_animal(id_catalog, id_animal) values(v_id_catalog, v_id_animal);

insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, health, cares) values (gen_random_uuid(), 'Re',           'dog',      'https://images.dog.ceo/breeds/appenzeller/n02107908_691.jpg',      'Male',       Now(),     'extra small',    'straight', 'Retriever',         'Yellow',    'tem',      'pedigree', 'good', 'change water erery day')
RETURNING id_animal into v_id_animal;
insert into adotame.catalog_animal(id_catalog, id_animal) values(v_id_catalog, v_id_animal);

insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, health, cares) values (gen_random_uuid(), 'Mar',          'dog',      'https://images.dog.ceo/breeds/appenzeller/n02107908_691.jpg',      'Female',     Now(),      'extra small',    'straight', 'Retriever',         'Crimson',   'tem',      'pedigree', 'very good', 'change water erery day')
RETURNING id_animal into v_id_animal;
insert into adotame.catalog_animal(id_catalog, id_animal) values(v_id_catalog, v_id_animal);

insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, health, cares) values (gen_random_uuid(), 'Boo',          'dog',      'https://images.dog.ceo/breeds/appenzeller/n02107908_691.jpg',      'Female',     Now(),      'extra small',    'straight', 'Chihuahua',         'Teal',      'tem',      'pedigree', 'very good', 'change water erery day')
RETURNING id_animal into v_id_animal;
insert into adotame.catalog_animal(id_catalog, id_animal) values(v_id_catalog, v_id_animal);

insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, health, cares) values (gen_random_uuid(), 'Hwq',          'dog',      'https://images.dog.ceo/breeds/appenzeller/n02107908_691.jpg',      'Male',       Now(),     'medium',         'straight', 'Chihuahua',         'Green',     'tem',      'pedigree', 'bad', 'change water erery day')
RETURNING id_animal into v_id_animal;
insert into adotame.catalog_animal(id_catalog, id_animal) values(v_id_catalog, v_id_animal);

insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, health, cares) values (gen_random_uuid(), 'Ant',          'dog',      'https://images.dog.ceo/breeds/appenzeller/n02107908_691.jpg',         'Male',       Now(),     'small',          'straight', 'Chihuahua',         'Turquoise', 'tem',      'pedigree', 'bad', 'cuddles water erery day')
RETURNING id_animal into v_id_animal;
insert into adotame.catalog_animal(id_catalog, id_animal) values(v_id_catalog, v_id_animal);

insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, health, cares) values (gen_random_uuid(), 'Vio',          'dog',      'https://images.dog.ceo/breeds/appenzeller/n02107908_691.jpg',      'Female',     Now(),     'small',          'straight', 'Chihuahua',         'Indigo',    'nao tem',  'pedigree', 'bad', 'cuddles water erery day')
RETURNING id_animal into v_id_animal;
insert into adotame.catalog_animal(id_catalog, id_animal) values(v_id_catalog, v_id_animal);

insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, health, cares) values (gen_random_uuid(), 'Eas',          'dog',      'https://images.dog.ceo/breeds/appenzeller/n02107908_691.jpg',       'Male',       Now(),     'huge',            'straight', 'Chihuahua',         'Violet',    'nao tem',  'pedigree', 'bad', 'cuddles water erery day')
RETURNING id_animal into v_id_animal;
insert into adotame.catalog_animal(id_catalog, id_animal) values(v_id_catalog, v_id_animal);

insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, health, cares) values (gen_random_uuid(), 'Eme',          'cat',      'https://cdn2.thecatapi.com/images/MTU0ODc1Nw.jpg',                 'Female',     Now(),     'medium',         'straight', 'British-Shorthair',             'Maroon',    'nao tem',  'whiskas', 'good', 'cuddles water erery day')
RETURNING id_animal into v_id_animal;
insert into adotame.catalog_animal(id_catalog, id_animal) values(v_id_catalog_missing, v_id_animal);

insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, health, cares) values (gen_random_uuid(), 'Ame',          'cat',      'https://cdn2.thecatapi.com/images/MTU0ODc1Nw.jpg',                  'Male',       Now(),      'huge',            'straight', 'British-Shorthair',             'Goldenrod', 'nao tem',  'whiskas', 'very good', 'cuddles water erery day')
RETURNING id_animal into v_id_animal;
insert into adotame.catalog_animal(id_catalog, id_animal) values(v_id_catalog, v_id_animal);

insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, health, cares) values (gen_random_uuid(), 'Tin',          'cat',      'https://cdn2.thecatapi.com/images/MTU0ODc1Nw.jpg',                 'Male',       Now(),     'extra huge',      'straight', 'British-Shorthair', 'Blue',      'nao tem',  'whiskas',  'very good', 'cuddles water erery day')
RETURNING id_animal into v_id_animal;
insert into adotame.catalog_animal(id_catalog, id_animal) values(v_id_catalog, v_id_animal);

insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, health, cares) values (gen_random_uuid(), 'Gre',          'cat',      'https://cdn2.thecatapi.com/images/MTU0ODc1Nw.jpg',                 'Male',       Now(),      'medium',         'straight', 'British-Shorthair', 'Indigo',    'nao tem',  'whiskas',  'very good', 'cuddles water erery day')
RETURNING id_animal into v_id_animal;
insert into adotame.catalog_animal(id_catalog, id_animal) values(v_id_catalog, v_id_animal);

insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, health, cares) values (gen_random_uuid(), 'Tur',          'cat',      'https://cdn2.thecatapi.com/images/MTU0ODc1Nw.jpg',                'Female',     Now(),      'extra huge',      'straight', 'British-Shorthair', 'Fuscia',    'tem',      'whiskas',  'good', 'Technetium Tc-99m Generator')
RETURNING id_animal into v_id_animal;
insert into adotame.catalog_animal(id_catalog, id_animal) values(v_id_catalog, v_id_animal);

insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, health, cares) values (gen_random_uuid(), 'Koa',          'cat',      'https://cdn2.thecatapi.com/images/MTU0ODc1Nw.jpg',               'Female',     Now(),      'small',          'straight', 'British-Shorthair', 'Blue',      'nao tem',  'whiskas',  'good', 'cuddles water erery day')
RETURNING id_animal into v_id_animal;
insert into adotame.catalog_animal(id_catalog, id_animal) values(v_id_catalog, v_id_animal);

insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, health, cares) values (gen_random_uuid(), 'Ind',          'cat',      'https://cdn2.thecatapi.com/images/MTU0ODc1Nw.jpg',                'Male',       Now(),      'huge',            'straight', 'British-Shorthair', 'Turquoise', 'tem',      'whiskas',  'bad', 'cuddles water erery day')
RETURNING id_animal into v_id_animal;
insert into adotame.catalog_animal(id_catalog, id_animal) values(v_id_catalog, v_id_animal);

insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, health, cares) values (gen_random_uuid(), 'Ope',          'cat',      'https://cdn2.thecatapi.com/images/MTU0ODc1Nw.jpg',                  'Male',      Now(),      'medium',         'straight', 'British-Shorthair', 'Indigo',    'tem',      'whiskas',  'very good', 'cuddles water erery day')
RETURNING id_animal into v_id_animal;
insert into adotame.catalog_animal(id_catalog, id_animal) values(v_id_catalog, v_id_animal);

insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, health, cares) values (gen_random_uuid(), 'Afe',          'cat',      'https://cdn2.thecatapi.com/images/MTU0ODc1Nw.jpg',                 'Female',     Now(),     'small',          'straight', 'British-Shorthair', 'Khaki',     'nao tem',  'whiskas',  'good', 'walk for pee')
RETURNING id_animal into v_id_animal;
insert into adotame.catalog_animal(id_catalog, id_animal) values(v_id_catalog, v_id_animal);


-- insert into adotame.catalog_animal(id_catalog, id_animal)
-- select id_catalog, id_animal
-- from adotame.catalog, adotame.animal
-- where id_catalog = v_id_catalog;


insert into adotame.request_type(id_request_type, name) values(gen_random_uuid(), 'Avistar Desaparecido');
insert into adotame.request_type(id_request_type, name) values(gen_random_uuid(), 'Reportar Desaparecido');
insert into adotame.request_type(id_request_type, name) values(gen_random_uuid(), 'Adotar');
insert into adotame.request_type(id_request_type, name) values(gen_random_uuid(), 'Apadrinhar');
insert into adotame.request_type(id_request_type, name) values(gen_random_uuid(), 'Adicionar Animal');

end $$;
