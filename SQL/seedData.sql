insert into adotame.user(id_user, name, email, phone) values(1, 'admin', 'admin@gmail.com', 909897987);
-- insert into adotame.user(id_user, name, email, phone) values(2, 'user', 'user@gmail.com', 906485926);
-- insert into adotame.user(id_user, name, email, phone) values(3, 'guest', 'guest@gmail.com', 908976451);


insert into adotame.login(id_login, username, password, id_user) values (111, 'admin', 'admin123', 1);
-- insert into adotame.login(id_login, username, password, id_user) values (222, 'user', 'user123', 2);
-- insert into adotame.login(id_login, username, password, id_user) values (333, 'guest', 'guest123', 3);


insert into adotame.profile(id_profile, name, id_login) values (1, 'admin', 111);
-- insert into adotame.profile(id_profile, name, id_login) values (2, 'user', 222);
-- insert into adotame.profile(id_profile, name, id_login) values (3, 'guest', 333);


insert into adotame.login_profile(id_profile, id_login) values(1, 111);


insert into adotame.permission(id_permission, name) values (1, 'Gerir Sistema');
insert into adotame.permission(id_permission, name) values (2, 'Validar Pedidos');
insert into adotame.permission(id_permission, name) values (3, 'Reportar Desaparecido');
insert into adotame.permission(id_permission, name) values (4, 'Comunicar Avisto Desaparecido');
insert into adotame.permission(id_permission, name) values (5, 'Adicionar Animal');
insert into adotame.permission(id_permission, name) values (6, 'Ver Catalogos');
insert into adotame.permission(id_permission, name) values (7, 'Ver Caracteristicas dos Animais');
insert into adotame.permission(id_permission, name) values (8, 'Adotar');
insert into adotame.permission(id_permission, name) values (9, 'Apadrinhar');
insert into adotame.permission(id_permission, name) values (10, 'Donativos');


insert into adotame.profile_permission(id_permission, id_profile) values(1, 1);
insert into adotame.profile_permission(id_permission, id_profile) values(2, 1);
insert into adotame.profile_permission(id_permission, id_profile) values(3, 1);
insert into adotame.profile_permission(id_permission, id_profile) values(4, 1);
insert into adotame.profile_permission(id_permission, id_profile) values(5, 1);
insert into adotame.profile_permission(id_permission, id_profile) values(6, 1);
insert into adotame.profile_permission(id_permission, id_profile) values(7, 1);
insert into adotame.profile_permission(id_permission, id_profile) values(8, 1);
insert into adotame.profile_permission(id_permission, id_profile) values(9, 1);
insert into adotame.profile_permission(id_permission, id_profile) values(10, 1);


insert into adotame.catalog(id_catalog, name) values (1, 'Adotar e Apadrinhar');
insert into adotame.catalog(id_catalog, name) values (2, 'Desaparecidos');
insert into adotame.catalog(id_catalog, name) values (3, 'Adotados e Apadrinhados');


insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, state, cares) values (1, 'Capuchin',      'dog',      'https://images.dog.ceo/breeds/finnish-lapphund/mochilamvan.jpg', 'Male',       12,     'small',          'straight', 'Bulldog',           'Green',     'nao tem',  'pedigree', 'very good', 'change water erery day');
insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, state, cares) values (2, 'Bushpig',       'dog',      'https://images.dog.ceo/breeds/finnish-lapphund/mochilamvan.jpg', 'Female',     13,     'big',            'straight', 'Bulldog',           'Goldenrod', 'nao tem',  'pedigree', 'very good', 'change water erery day');
insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, state, cares) values (3, 'Eurasian',      'dog',      'https://images.dog.ceo/breeds/finnish-lapphund/mochilamvan.jpg', 'Male',       5,      'medium',         'straight', 'Bulldog',           'Yellow',    'tem',      'pedigree', 'very good', 'change water erery day');
insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, state, cares) values (4, 'Mocking',       'dog',      'https://images.dog.ceo/breeds/finnish-lapphund/mochilamvan.jpg', 'Female',     14,     'small',          'straight', 'Retriever',         'Teal',      'nao tem',  'pedigree', 'good', 'change water erery day');
insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, state, cares) values (5, 'Roadrunner',    'dog',      'https://images.dog.ceo/breeds/finnish-lapphund/mochilamvan.jpg', 'Female',     7,      'small',          'straight', 'Retriever',         'Violet',    'tem',      'pedigree', 'good', 'change water erery day');
insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, state, cares) values (6, 'Red',           'dog',      'https://images.dog.ceo/breeds/finnish-lapphund/mochilamvan.jpg', 'Male',       10,     'extra small',    'straight', 'Retriever',         'Yellow',    'tem',      'pedigree', 'good', 'change water erery day');
insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, state, cares) values (7, 'Marshbird',     'dog',      'https://images.dog.ceo/breeds/finnish-lapphund/mochilamvan.jpg', 'Female',     1,      'extra small',    'straight', 'Retriever',         'Crimson',   'tem',      'pedigree', 'very good', 'change water erery day');
insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, state, cares) values (8, 'Bleu',          'dog',      'https://images.dog.ceo/breeds/finnish-lapphund/mochilamvan.jpg', 'Female',     7,      'extra small',    'straight', 'Chihuahua',         'Teal',      'tem',      'pedigree', 'very good', 'change water erery day');
insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, state, cares) values (9, 'Hawk',          'dog',      'https://images.dog.ceo/breeds/finnish-lapphund/mochilamvan.jpg', 'Male',       19,     'medium',         'straight', 'Chihuahua',         'Green',     'tem',      'pedigree', 'bad', 'change water erery day');
insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, state, cares) values (10, 'Antelope',     'dog',      'https://images.dog.ceo/breeds/finnish-lapphund/mochilamvan.jpg', 'Male',       20,     'small',          'straight', 'Chihuahua',         'Turquoise', 'tem',      'pedigree', 'bad', 'cuddles water erery day');
insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, state, cares) values (11, 'Violet',       'dog',      'https://images.dog.ceo/breeds/finnish-lapphund/mochilamvan.jpg', 'Female',     19,     'small',          'straight', 'Chihuahua',         'Indigo',    'nao tem',  'pedigree', 'bad', 'cuddles water erery day');
insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, state, cares) values (12, 'Eastern',      'dog',      'https://images.dog.ceo/breeds/finnish-lapphund/mochilamvan.jpg', 'Male',       20,     'big',            'straight', 'Chihuahua',         'Violet',    'nao tem',  'pedigree', 'bad', 'cuddles water erery day');
insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, state, cares) values (13, 'Emerald',      'cat',      'https://cdn2.thecatapi.com/images/veagoQhHi.jpg',                 'Female',     15,     'medium',         'straight', 'British-Shorthair',             'Maroon',    'nao tem',  'whiskas', 'good', 'cuddles water erery day');
insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, state, cares) values (14, 'American',     'cat',      'https://cdn2.thecatapi.com/images/veagoQhHi.jpg',                 'Male',       3,      'big',            'straight', 'British-Shorthair',             'Goldenrod', 'nao tem',  'whiskas', 'very good', 'cuddles water erery day');
insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, state, cares) values (15, 'Tinamou',      'cat',      'https://cdn2.thecatapi.com/images/veagoQhHi.jpg',                'Male',       14,     'extra big',      'straight', 'British-Shorthair', 'Blue',      'nao tem',  'whiskas',  'very good', 'cuddles water erery day');
insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, state, cares) values (16, 'Greater',      'cat',      'https://cdn2.thecatapi.com/images/veagoQhHi.jpg',                'Male',       5,      'medium',         'straight', 'British-Shorthair', 'Indigo',    'nao tem',  'whiskas',  'very good', 'cuddles water erery day');
insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, state, cares) values (17, 'Turkey',       'cat',      'https://cdn2.thecatapi.com/images/veagoQhHi.jpg',                'Female',     7,      'extra big',      'straight', 'British-Shorthair', 'Fuscia',    'tem',      'whiskas',  'good', 'Technetium Tc-99m Generator');
insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, state, cares) values (18, 'Koala',        'cat',      'https://cdn2.thecatapi.com/images/veagoQhHi.jpg',                'Female',     4,      'small',          'straight', 'British-Shorthair', 'Blue',      'nao tem',  'whiskas',  'good', 'cuddles water erery day');
insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, state, cares) values (19, 'Indian',       'cat',      'https://cdn2.thecatapi.com/images/veagoQhHi.jpg',                'Male',       9,      'big',            'straight', 'British-Shorthair', 'Turquoise', 'tem',      'whiskas',  'bad', 'cuddles water erery day');
insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, state, cares) values (20, 'Openbill',     'cat',      'https://cdn2.thecatapi.com/images/veagoQhHi.jpg',                'Male',       6,      'medium',         'straight', 'British-Shorthair', 'Indigo',    'tem',      'whiskas',  'very good', 'cuddles water erery day');
insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, state, cares) values (21, 'African',      'cat',      'https://cdn2.thecatapi.com/images/veagoQhHi.jpg',                'Female',     13,     'small',          'straight', 'British-Shorthair', 'Khaki',     'nao tem',  'whiskas',  'good', 'walk for pee');
insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, state, cares) values (22, 'Cap',          'dog',      'https://images.dog.ceo/breeds/finnish-lapphund/mochilamvan.jpg', 'Male',       12,     'small',          'straight', 'Bulldog',           'Green',     'nao tem',  'pedigree', 'very good', 'change water erery day');
insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, state, cares) values (23, 'Bus',          'dog',      'https://images.dog.ceo/breeds/finnish-lapphund/mochilamvan.jpg', 'Female',     13,     'big',            'straight', 'Bulldog',           'Goldenrod', 'nao tem',  'pedigree', 'very good', 'change water erery day');
insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, state, cares) values (24, 'Eur',          'dog',      'https://images.dog.ceo/breeds/finnish-lapphund/mochilamvan.jpg', 'Male',       5,      'medium',         'straight', 'Bulldog',           'Yellow',    'tem',      'pedigree', 'very good', 'change water erery day');
insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, state, cares) values (25, 'Moc',          'dog',      'https://images.dog.ceo/breeds/finnish-lapphund/mochilamvan.jpg', 'Female',     14,     'small',          'straight', 'Retriever',         'Teal',      'nao tem',  'pedigree', 'good', 'change water erery day');
insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, state, cares) values (26, 'Roa',          'dog',      'https://images.dog.ceo/breeds/finnish-lapphund/mochilamvan.jpg', 'Female',     7,      'small',          'straight', 'Retriever',         'Violet',    'tem',      'pedigree', 'good', 'change water erery day');
insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, state, cares) values (27, 'Re',           'dog',      'https://images.dog.ceo/breeds/finnish-lapphund/mochilamvan.jpg', 'Male',       10,     'extra small',    'straight', 'Retriever',         'Yellow',    'tem',      'pedigree', 'good', 'change water erery day');
insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, state, cares) values (28, 'Mar',          'dog',      'https://images.dog.ceo/breeds/finnish-lapphund/mochilamvan.jpg', 'Female',     1,      'extra small',    'straight', 'Retriever',         'Crimson',   'tem',      'pedigree', 'very good', 'change water erery day');
insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, state, cares) values (29, 'Boo',          'dog',      'https://images.dog.ceo/breeds/finnish-lapphund/mochilamvan.jpg', 'Female',     7,      'extra small',    'straight', 'Chihuahua',         'Teal',      'tem',      'pedigree', 'very good', 'change water erery day');
insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, state, cares) values (30, 'Hwq',          'dog',      'https://images.dog.ceo/breeds/finnish-lapphund/mochilamvan.jpg', 'Male',       19,     'medium',         'straight', 'Chihuahua',         'Green',     'tem',      'pedigree', 'bad', 'change water erery day');
insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, state, cares) values (31, 'Ant',          'dog',      'https://images.dog.ceo/breeds/finnish-lapphund/mochilamvan.jpg',    'Male',       20,     'small',          'straight', 'Chihuahua',         'Turquoise', 'tem',      'pedigree', 'bad', 'cuddles water erery day');
insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, state, cares) values (32, 'Vio',          'dog',      'https://images.dog.ceo/breeds/finnish-lapphund/mochilamvan.jpg', 'Female',     19,     'small',          'straight', 'Chihuahua',         'Indigo',    'nao tem',  'pedigree', 'bad', 'cuddles water erery day');
insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, state, cares) values (33, 'Eas',          'dog',      'https://images.dog.ceo/breeds/finnish-lapphund/mochilamvan.jpg',  'Male',       20,     'big',            'straight', 'Chihuahua',         'Violet',    'nao tem',  'pedigree', 'bad', 'cuddles water erery day');
insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, state, cares) values (34, 'Eme',          'cat',      'https://cdn2.thecatapi.com/images/veagoQhHi.jpg',                 'Female',     15,     'medium',         'straight', 'British-Shorthair',             'Maroon',    'nao tem',  'whiskas', 'good', 'cuddles water erery day');
insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, state, cares) values (35, 'Ame',          'cat',      'https://cdn2.thecatapi.com/images/veagoQhHi.jpg',                  'Male',       3,      'big',            'straight', 'British-Shorthair',             'Goldenrod', 'nao tem',  'whiskas', 'very good', 'cuddles water erery day');
insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, state, cares) values (36, 'Tin',          'cat',      'https://cdn2.thecatapi.com/images/veagoQhHi.jpg',                 'Male',       14,     'extra big',      'straight', 'British-Shorthair', 'Blue',      'nao tem',  'whiskas',  'very good', 'cuddles water erery day');
insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, state, cares) values (37, 'Gre',          'cat',      'https://cdn2.thecatapi.com/images/veagoQhHi.jpg',                 'Male',       5,      'medium',         'straight', 'British-Shorthair', 'Indigo',    'nao tem',  'whiskas',  'very good', 'cuddles water erery day');
insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, state, cares) values (38, 'Tur',          'cat',      'https://cdn2.thecatapi.com/images/veagoQhHi.jpg',                'Female',     7,      'extra big',      'straight', 'British-Shorthair', 'Fuscia',    'tem',      'whiskas',  'good', 'Technetium Tc-99m Generator');
insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, state, cares) values (39, 'Koa',          'cat',      'https://cdn2.thecatapi.com/images/veagoQhHi.jpg',               'Female',     4,      'small',          'straight', 'British-Shorthair', 'Blue',      'nao tem',  'whiskas',  'good', 'cuddles water erery day');
insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, state, cares) values (40, 'Ind',          'cat',      'https://cdn2.thecatapi.com/images/veagoQhHi.jpg',                'Male',       9,      'big',            'straight', 'British-Shorthair', 'Turquoise', 'tem',      'whiskas',  'bad', 'cuddles water erery day');
insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, state, cares) values (41, 'Ope',          'cat',      'https://cdn2.thecatapi.com/images/veagoQhHi.jpg',                  'Male',       6,      'medium',         'straight', 'British-Shorthair', 'Indigo',    'tem',      'whiskas',  'very good', 'cuddles water erery day');
insert into adotame.animal (id_animal, name, type, photo, gender, age, size, fur, breed, color, vaccines, portion, state, cares) values (42, 'Afe',          'cat',      'https://cdn2.thecatapi.com/images/veagoQhHi.jpg',                 'Female',     13,     'small',          'straight', 'British-Shorthair', 'Khaki',     'nao tem',  'whiskas',  'good', 'walk for pee');


insert into adotame.catalog_animal(id_animal, id_catalog) values(1,  1);
insert into adotame.catalog_animal(id_animal, id_catalog) values(2,  1);
insert into adotame.catalog_animal(id_animal, id_catalog) values(3,  1);
insert into adotame.catalog_animal(id_animal, id_catalog) values(4,  1);
insert into adotame.catalog_animal(id_animal, id_catalog) values(5,  1);
insert into adotame.catalog_animal(id_animal, id_catalog) values(6,  1);
insert into adotame.catalog_animal(id_animal, id_catalog) values(7,  1);
insert into adotame.catalog_animal(id_animal, id_catalog) values(8,  1);
insert into adotame.catalog_animal(id_animal, id_catalog) values(9,  1);
insert into adotame.catalog_animal(id_animal, id_catalog) values(10, 1);
insert into adotame.catalog_animal(id_animal, id_catalog) values(11, 1);
insert into adotame.catalog_animal(id_animal, id_catalog) values(12, 1);
insert into adotame.catalog_animal(id_animal, id_catalog) values(13, 1);
insert into adotame.catalog_animal(id_animal, id_catalog) values(14, 1);
insert into adotame.catalog_animal(id_animal, id_catalog) values(15, 1);
insert into adotame.catalog_animal(id_animal, id_catalog) values(16, 1);
insert into adotame.catalog_animal(id_animal, id_catalog) values(17, 1);
insert into adotame.catalog_animal(id_animal, id_catalog) values(18, 1);
insert into adotame.catalog_animal(id_animal, id_catalog) values(19, 1);
insert into adotame.catalog_animal(id_animal, id_catalog) values(20, 1);
insert into adotame.catalog_animal(id_animal, id_catalog) values(21, 1);
insert into adotame.catalog_animal(id_animal, id_catalog) values(22, 2);
insert into adotame.catalog_animal(id_animal, id_catalog) values(23, 2);
insert into adotame.catalog_animal(id_animal, id_catalog) values(24, 2);
insert into adotame.catalog_animal(id_animal, id_catalog) values(25, 2);
insert into adotame.catalog_animal(id_animal, id_catalog) values(26, 2);
insert into adotame.catalog_animal(id_animal, id_catalog) values(27, 2);
insert into adotame.catalog_animal(id_animal, id_catalog) values(28, 2);
insert into adotame.catalog_animal(id_animal, id_catalog) values(29, 2);
insert into adotame.catalog_animal(id_animal, id_catalog) values(30, 2);
insert into adotame.catalog_animal(id_animal, id_catalog) values(31, 2);
insert into adotame.catalog_animal(id_animal, id_catalog) values(32, 2);
insert into adotame.catalog_animal(id_animal, id_catalog) values(33, 2);
insert into adotame.catalog_animal(id_animal, id_catalog) values(34, 2);
insert into adotame.catalog_animal(id_animal, id_catalog) values(35, 2);
insert into adotame.catalog_animal(id_animal, id_catalog) values(36, 2);
insert into adotame.catalog_animal(id_animal, id_catalog) values(37, 2);
insert into adotame.catalog_animal(id_animal, id_catalog) values(38, 2);
insert into adotame.catalog_animal(id_animal, id_catalog) values(39, 2);
insert into adotame.catalog_animal(id_animal, id_catalog) values(40, 2);
insert into adotame.catalog_animal(id_animal, id_catalog) values(41, 2);
insert into adotame.catalog_animal(id_animal, id_catalog) values(42, 2);


insert into adotame.request_type(id_request_type, name) values(1, 'Avistar Desaparecido');
insert into adotame.request_type(id_request_type, name) values(2, 'Reportar Desaparecido');
insert into adotame.request_type(id_request_type, name) values(3, 'Adoção');
insert into adotame.request_type(id_request_type, name) values(4, 'Apadrinhamento');
