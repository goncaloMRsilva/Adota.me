insert into adotame.user(id_user, name, email, phone)
values(123456, 'joao paulo', 'jps@gmail.com', 929356735);

insert into adotame.login(id_login, username, password, id_user)
values(123, 'jsousa', 'sousa123', 123456);

insert into adotame.profile(id_profile, name, id_login)
values(1, 'publico', 123);

insert into adotame.login_profile(id_login, id_profile)
values(123, 1);

insert into adotame.permission(id_permission, name)
values(2, 'user');

insert into adotame.profile_permission(id_permission, id_profile)
values(2, 1);

insert into adotame.catalog(id_catalog, name)
values(3, 'desaparecidos');

insert into adotame.animal(id_animal, name, type, photo, gender, age, size,
                    fur, breed, color, vaccines, portion, state, cares)
values(1, 'bolinhas', 'gato', 'C:\Users\ProjectBox\Desktop\Projeto\Diagramas', 'male', '3', 'small',
        'straight', 'American Shorthair', 'grey', '', 'whiskas', 'healthy', 'always fresh water');

insert into adotame.catalog_animal(id_animal, id_catalog)
values(1, 3);

insert into adotame.request_type(id_request_type, name)
values(321, 'report');

insert into adotame.request(id_request, username, date_request, id_user, id_request_type)
values(321, 'joao paulo', '2022-06-28', 123456, 321);