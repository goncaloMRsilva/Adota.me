do $$
declare

v_id_user adotame.user.id_user%type;
v_id_login adotame.login.id_login%type;
v_id_profile adotame.profile.id_profile%type;
v_id_catalog adotame.catalog.id_catalog%type;
v_id_animal adotame.animal.id_animal%type;

v_id_profile_guest adotame.profile.id_profile%type;
v_id_permission adotame.permission.id_permission%type;

begin

--admin
insert into adotame.user(id_user, name, email, phone) values(gen_random_uuid(), 'admin', 'admin@gmail.com', 909897987)
RETURNING id_user into v_id_user;

insert into adotame.login(id_login, username, password, id_user) values (gen_random_uuid(), 'admin', 'admin123', v_id_user)
RETURNING id_login into v_id_login;

insert into adotame.profile(id_profile, name, id_login) values (gen_random_uuid(), 'admin', v_id_login)
RETURNING id_profile into v_id_profile;

insert into adotame.login_profile(id_profile, id_login) values(v_id_profile, v_id_login);
--

--guest
insert into adotame.user(id_user, name, email, phone) values(gen_random_uuid(), 'guest', 'guest@guest.com', 286594743)
returning id_user into v_id_user;

insert into adotame.login(id_login, username, password, id_user) values(gen_random_uuid(), 'guest', 'guest123', v_id_user)
returning id_login into v_id_login;

insert into adotame.profile(id_profile, name, id_login) values(gen_random_uuid(), 'guest', v_id_login)
returning id_profile into v_id_profile;

insert into adotame.login_profile(id_profile, id_login) values(v_id_profile, v_id_login);
--

--user

--

insert into adotame.permission(id_permission, name) values (gen_random_uuid(), 'Gerir Sistema');
insert into adotame.permission(id_permission, name) values (gen_random_uuid(), 'Validar Pedidos');
insert into adotame.permission(id_permission, name) values (gen_random_uuid(), 'Reportar Desaparecido');
insert into adotame.permission(id_permission, name) values (gen_random_uuid(), 'Comunicar Avisto Desaparecido');
insert into adotame.permission(id_permission, name) values (gen_random_uuid(), 'Adicionar Animal');
insert into adotame.permission(id_permission, name) values (gen_random_uuid(), 'Ver Catalogos');
insert into adotame.permission(id_permission, name) values (gen_random_uuid(), 'Ver Caracteristicas dos Animais');
insert into adotame.permission(id_permission, name) values (gen_random_uuid(), 'Adotar');
insert into adotame.permission(id_permission, name) values (gen_random_uuid(), 'Apadrinhar');
insert into adotame.permission(id_permission, name) values (gen_random_uuid(), 'Donativos');
insert into adotame.permission(id_permission, name) values (gen_random_uuid(), 'Ver Historico de notificacoes');


insert into adotame.profile_permission(id_permission, id_profile)
select id_permission, id_profile
from adotame.permission, adotame.profile;


insert into adotame.catalog(id_catalog, name) values (gen_random_uuid(), 'Adotar e Apadrinhar')
RETURNING id_catalog into v_id_catalog;
insert into adotame.catalog(id_catalog, name) values (gen_random_uuid(), 'Desaparecidos')
RETURNING id_catalog into v_id_catalog;


insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, state, cares) values (gen_random_uuid(), 'Capuchin',      'dog',      'https://images.dog.ceo/breeds/finnish-lapphund/mochilamvan.jpg', 'Male',       12,     'small',          'straight', 'Bulldog',           'Green',     'nao tem',  'pedigree', 'very good', 'change water erery day')
RETURNING id_animal into v_id_animal;
insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, state, cares) values (gen_random_uuid(), 'Bushpig',       'dog',      'https://images.dog.ceo/breeds/finnish-lapphund/mochilamvan.jpg', 'Female',     13,     'big',            'straight', 'Bulldog',           'Goldenrod', 'nao tem',  'pedigree', 'very good', 'change water erery day')
RETURNING id_animal into v_id_animal;
insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, state, cares) values (gen_random_uuid(), 'Eurasian',      'dog',      'https://images.dog.ceo/breeds/finnish-lapphund/mochilamvan.jpg', 'Male',       5,      'medium',         'straight', 'Bulldog',           'Yellow',    'tem',      'pedigree', 'very good', 'change water erery day')
RETURNING id_animal into v_id_animal;
insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, state, cares) values (gen_random_uuid(), 'Mocking',       'dog',      'https://images.dog.ceo/breeds/finnish-lapphund/mochilamvan.jpg', 'Female',     14,     'small',          'straight', 'Retriever',         'Teal',      'nao tem',  'pedigree', 'good', 'change water erery day')
RETURNING id_animal into v_id_animal;
insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, state, cares) values (gen_random_uuid(), 'Roadrunner',    'dog',      'https://images.dog.ceo/breeds/finnish-lapphund/mochilamvan.jpg', 'Female',     7,      'small',          'straight', 'Retriever',         'Violet',    'tem',      'pedigree', 'good', 'change water erery day')
RETURNING id_animal into v_id_animal;
insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, state, cares) values (gen_random_uuid(), 'Red',           'dog',      'https://images.dog.ceo/breeds/finnish-lapphund/mochilamvan.jpg', 'Male',       10,     'extra small',    'straight', 'Retriever',         'Yellow',    'tem',      'pedigree', 'good', 'change water erery day')
RETURNING id_animal into v_id_animal;
insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, state, cares) values (gen_random_uuid(), 'Marshbird',     'dog',      'https://images.dog.ceo/breeds/finnish-lapphund/mochilamvan.jpg', 'Female',     1,      'extra small',    'straight', 'Retriever',         'Crimson',   'tem',      'pedigree', 'very good', 'change water erery day')
RETURNING id_animal into v_id_animal;
insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, state, cares) values (gen_random_uuid(), 'Bleu',          'dog',      'https://images.dog.ceo/breeds/finnish-lapphund/mochilamvan.jpg', 'Female',     7,      'extra small',    'straight', 'Chihuahua',         'Teal',      'tem',      'pedigree', 'very good', 'change water erery day')
RETURNING id_animal into v_id_animal;
insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, state, cares) values (gen_random_uuid(), 'Hawk',          'dog',      'https://images.dog.ceo/breeds/finnish-lapphund/mochilamvan.jpg', 'Male',       19,     'medium',         'straight', 'Chihuahua',         'Green',     'tem',      'pedigree', 'bad', 'change water erery day')
RETURNING id_animal into v_id_animal;
insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, state, cares) values (gen_random_uuid(), 'Antelope',     'dog',      'https://images.dog.ceo/breeds/finnish-lapphund/mochilamvan.jpg', 'Male',       20,     'small',          'straight', 'Chihuahua',         'Turquoise', 'tem',      'pedigree', 'bad', 'cuddles water erery day')
RETURNING id_animal into v_id_animal;
insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, state, cares) values (gen_random_uuid(), 'Violet',       'dog',      'https://images.dog.ceo/breeds/finnish-lapphund/mochilamvan.jpg', 'Female',     19,     'small',          'straight', 'Chihuahua',         'Indigo',    'nao tem',  'pedigree', 'bad', 'cuddles water erery day')
RETURNING id_animal into v_id_animal;
insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, state, cares) values (gen_random_uuid(), 'Eastern',      'dog',      'https://images.dog.ceo/breeds/finnish-lapphund/mochilamvan.jpg', 'Male',       20,     'big',            'straight', 'Chihuahua',         'Violet',    'nao tem',  'pedigree', 'bad', 'cuddles water erery day')
RETURNING id_animal into v_id_animal;
insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, state, cares) values (gen_random_uuid(), 'Emerald',      'cat',      'https://cdn2.thecatapi.com/images/veagoQhHi.jpg',                 'Female',     15,     'medium',         'straight', 'British-Shorthair',             'Maroon',    'nao tem',  'whiskas', 'good', 'cuddles water erery day')
RETURNING id_animal into v_id_animal;
insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, state, cares) values (gen_random_uuid(), 'American',     'cat',      'https://cdn2.thecatapi.com/images/veagoQhHi.jpg',                 'Male',       3,      'big',            'straight', 'British-Shorthair',             'Goldenrod', 'nao tem',  'whiskas', 'very good', 'cuddles water erery day')
RETURNING id_animal into v_id_animal;
insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, state, cares) values (gen_random_uuid(), 'Tinamou',      'cat',      'https://cdn2.thecatapi.com/images/veagoQhHi.jpg',                'Male',       14,     'extra big',      'straight', 'British-Shorthair', 'Blue',      'nao tem',  'whiskas',  'very good', 'cuddles water erery day')
RETURNING id_animal into v_id_animal;
insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, state, cares) values (gen_random_uuid(), 'Greater',      'cat',      'https://cdn2.thecatapi.com/images/veagoQhHi.jpg',                'Male',       5,      'medium',         'straight', 'British-Shorthair', 'Indigo',    'nao tem',  'whiskas',  'very good', 'cuddles water erery day')
RETURNING id_animal into v_id_animal;
insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, state, cares) values (gen_random_uuid(), 'Turkey',       'cat',      'https://cdn2.thecatapi.com/images/veagoQhHi.jpg',                'Female',     7,      'extra big',      'straight', 'British-Shorthair', 'Fuscia',    'tem',      'whiskas',  'good', 'Technetium Tc-99m Generator')
RETURNING id_animal into v_id_animal;
insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, state, cares) values (gen_random_uuid(), 'Koala',        'cat',      'https://cdn2.thecatapi.com/images/veagoQhHi.jpg',                'Female',     4,      'small',          'straight', 'British-Shorthair', 'Blue',      'nao tem',  'whiskas',  'good', 'cuddles water erery day')
RETURNING id_animal into v_id_animal;
insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, state, cares) values (gen_random_uuid(), 'Indian',       'cat',      'https://cdn2.thecatapi.com/images/veagoQhHi.jpg',                'Male',       9,      'big',            'straight', 'British-Shorthair', 'Turquoise', 'tem',      'whiskas',  'bad', 'cuddles water erery day')
RETURNING id_animal into v_id_animal;
insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, state, cares) values (gen_random_uuid(), 'Openbill',     'cat',      'https://cdn2.thecatapi.com/images/veagoQhHi.jpg',                'Male',       6,      'medium',         'straight', 'British-Shorthair', 'Indigo',    'tem',      'whiskas',  'very good', 'cuddles water erery day')
RETURNING id_animal into v_id_animal;
insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, state, cares) values (gen_random_uuid(), 'African',      'cat',      'https://cdn2.thecatapi.com/images/veagoQhHi.jpg',                'Female',     13,     'small',          'straight', 'British-Shorthair', 'Khaki',     'nao tem',  'whiskas',  'good', 'walk for pee')
RETURNING id_animal into v_id_animal;
insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, state, cares) values (gen_random_uuid(), 'Cap',          'dog',      'https://images.dog.ceo/breeds/finnish-lapphund/mochilamvan.jpg', 'Male',       12,     'small',          'straight', 'Bulldog',           'Green',     'nao tem',  'pedigree', 'very good', 'change water erery day')
RETURNING id_animal into v_id_animal;
insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, state, cares) values (gen_random_uuid(), 'Bus',          'dog',      'https://images.dog.ceo/breeds/finnish-lapphund/mochilamvan.jpg', 'Female',     13,     'big',            'straight', 'Bulldog',           'Goldenrod', 'nao tem',  'pedigree', 'very good', 'change water erery day')
RETURNING id_animal into v_id_animal;
insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, state, cares) values (gen_random_uuid(), 'Eur',          'dog',      'https://images.dog.ceo/breeds/finnish-lapphund/mochilamvan.jpg', 'Male',       5,      'medium',         'straight', 'Bulldog',           'Yellow',    'tem',      'pedigree', 'very good', 'change water erery day')
RETURNING id_animal into v_id_animal;
insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, state, cares) values (gen_random_uuid(), 'Moc',          'dog',      'https://images.dog.ceo/breeds/finnish-lapphund/mochilamvan.jpg', 'Female',     14,     'small',          'straight', 'Retriever',         'Teal',      'nao tem',  'pedigree', 'good', 'change water erery day')
RETURNING id_animal into v_id_animal;
insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, state, cares) values (gen_random_uuid(), 'Roa',          'dog',      'https://images.dog.ceo/breeds/finnish-lapphund/mochilamvan.jpg', 'Female',     7,      'small',          'straight', 'Retriever',         'Violet',    'tem',      'pedigree', 'good', 'change water erery day')
RETURNING id_animal into v_id_animal;
insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, state, cares) values (gen_random_uuid(), 'Re',           'dog',      'https://images.dog.ceo/breeds/finnish-lapphund/mochilamvan.jpg', 'Male',       10,     'extra small',    'straight', 'Retriever',         'Yellow',    'tem',      'pedigree', 'good', 'change water erery day')
RETURNING id_animal into v_id_animal;
insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, state, cares) values (gen_random_uuid(), 'Mar',          'dog',      'https://images.dog.ceo/breeds/finnish-lapphund/mochilamvan.jpg', 'Female',     1,      'extra small',    'straight', 'Retriever',         'Crimson',   'tem',      'pedigree', 'very good', 'change water erery day')
RETURNING id_animal into v_id_animal;
insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, state, cares) values (gen_random_uuid(), 'Boo',          'dog',      'https://images.dog.ceo/breeds/finnish-lapphund/mochilamvan.jpg', 'Female',     7,      'extra small',    'straight', 'Chihuahua',         'Teal',      'tem',      'pedigree', 'very good', 'change water erery day')
RETURNING id_animal into v_id_animal;
insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, state, cares) values (gen_random_uuid(), 'Hwq',          'dog',      'https://images.dog.ceo/breeds/finnish-lapphund/mochilamvan.jpg', 'Male',       19,     'medium',         'straight', 'Chihuahua',         'Green',     'tem',      'pedigree', 'bad', 'change water erery day')
RETURNING id_animal into v_id_animal;
insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, state, cares) values (gen_random_uuid(), 'Ant',          'dog',      'https://images.dog.ceo/breeds/finnish-lapphund/mochilamvan.jpg',    'Male',       20,     'small',          'straight', 'Chihuahua',         'Turquoise', 'tem',      'pedigree', 'bad', 'cuddles water erery day')
RETURNING id_animal into v_id_animal;
insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, state, cares) values (gen_random_uuid(), 'Vio',          'dog',      'https://images.dog.ceo/breeds/finnish-lapphund/mochilamvan.jpg', 'Female',     19,     'small',          'straight', 'Chihuahua',         'Indigo',    'nao tem',  'pedigree', 'bad', 'cuddles water erery day')
RETURNING id_animal into v_id_animal;
insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, state, cares) values (gen_random_uuid(), 'Eas',          'dog',      'https://images.dog.ceo/breeds/finnish-lapphund/mochilamvan.jpg',  'Male',       20,     'big',            'straight', 'Chihuahua',         'Violet',    'nao tem',  'pedigree', 'bad', 'cuddles water erery day')
RETURNING id_animal into v_id_animal;
insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, state, cares) values (gen_random_uuid(), 'Eme',          'cat',      'https://cdn2.thecatapi.com/images/veagoQhHi.jpg',                 'Female',     15,     'medium',         'straight', 'British-Shorthair',             'Maroon',    'nao tem',  'whiskas', 'good', 'cuddles water erery day')
RETURNING id_animal into v_id_animal;
insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, state, cares) values (gen_random_uuid(), 'Ame',          'cat',      'https://cdn2.thecatapi.com/images/veagoQhHi.jpg',                  'Male',       3,      'big',            'straight', 'British-Shorthair',             'Goldenrod', 'nao tem',  'whiskas', 'very good', 'cuddles water erery day')
RETURNING id_animal into v_id_animal;
insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, state, cares) values (gen_random_uuid(), 'Tin',          'cat',      'https://cdn2.thecatapi.com/images/veagoQhHi.jpg',                 'Male',       14,     'extra big',      'straight', 'British-Shorthair', 'Blue',      'nao tem',  'whiskas',  'very good', 'cuddles water erery day')
RETURNING id_animal into v_id_animal;
insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, state, cares) values (gen_random_uuid(), 'Gre',          'cat',      'https://cdn2.thecatapi.com/images/veagoQhHi.jpg',                 'Male',       5,      'medium',         'straight', 'British-Shorthair', 'Indigo',    'nao tem',  'whiskas',  'very good', 'cuddles water erery day')
RETURNING id_animal into v_id_animal;
insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, state, cares) values (gen_random_uuid(), 'Tur',          'cat',      'https://cdn2.thecatapi.com/images/veagoQhHi.jpg',                'Female',     7,      'extra big',      'straight', 'British-Shorthair', 'Fuscia',    'tem',      'whiskas',  'good', 'Technetium Tc-99m Generator')
RETURNING id_animal into v_id_animal;
insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, state, cares) values (gen_random_uuid(), 'Koa',          'cat',      'https://cdn2.thecatapi.com/images/veagoQhHi.jpg',               'Female',     4,      'small',          'straight', 'British-Shorthair', 'Blue',      'nao tem',  'whiskas',  'good', 'cuddles water erery day')
RETURNING id_animal into v_id_animal;
insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, state, cares) values (gen_random_uuid(), 'Ind',          'cat',      'https://cdn2.thecatapi.com/images/veagoQhHi.jpg',                'Male',       9,      'big',            'straight', 'British-Shorthair', 'Turquoise', 'tem',      'whiskas',  'bad', 'cuddles water erery day')
RETURNING id_animal into v_id_animal;
insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, state, cares) values (gen_random_uuid(), 'Ope',          'cat',      'https://cdn2.thecatapi.com/images/veagoQhHi.jpg',                  'Male',       6,      'medium',         'straight', 'British-Shorthair', 'Indigo',    'tem',      'whiskas',  'very good', 'cuddles water erery day')
RETURNING id_animal into v_id_animal;
insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, state, cares) values (gen_random_uuid(), 'Afe',          'cat',      'https://cdn2.thecatapi.com/images/veagoQhHi.jpg',                 'Female',     13,     'small',          'straight', 'British-Shorthair', 'Khaki',     'nao tem',  'whiskas',  'good', 'walk for pee')
RETURNING id_animal into v_id_animal;


insert into adotame.catalog_animal(id_catalog, id_animal)
select id_catalog, id_animal
from adotame.catalog, adotame.animal
where id_catalog = v_id_catalog;


insert into adotame.request_type(id_request_type, name) values(gen_random_uuid(), 'Avistar Desaparecido');
insert into adotame.request_type(id_request_type, name) values(gen_random_uuid(), 'Reportar Desaparecido');
insert into adotame.request_type(id_request_type, name) values(gen_random_uuid(), 'Adotar');
insert into adotame.request_type(id_request_type, name) values(gen_random_uuid(), 'Apadrinhar');
insert into adotame.request_type(id_request_type, name) values(gen_random_uuid(), 'Adicionar Animal');

end $$;
