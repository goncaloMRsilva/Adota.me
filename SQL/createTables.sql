create if not exists schema Adotame;

create table Adotame.User(
    IDuser int Primary Key,
    Name varchar(250) not null,
    Email varchar(100) not null,
    Phone int not null
);

create table Adotame.Login(
    IDlogin int Primary Key,
    UserName varchar(250) not null,
    Pass varchar(100) not null,
    IDuser int references (User.IDuser)
);

create table Adotame.Profile(
    IDprofile int Primary Key,
    Name varchar(250) not null,
    IDlogin int references (Login.IDlogin)
);

create table Adotame.Permission(
    IDpermission int Primary Key,
    Name varchar(250) not null,
);

create table Adotame.ProfilePermission(
    IDpermission int references (Permission.IDpermission)
    IDprofile int references (Profile.IDprofile)
);

create table Adotame.Catalog(
    IDcatalog int Primary Key,
    Name varchar(250) not null
);

create table Adotame.Animal(
    IDanimal int Primary Key,
    Name varchar(100) not null,
    Type varchar(100) not null,    /* cao ou gato?*/
    Photo varchar(500) not null,
    Gender varchar(100) not null,
    Age int (10) not null,
    Size varchar (100) not null,
    Fur varchar(100) not null,    /*pelagem*/
    Breed varchar(300) not null,   /*raca*/
    Color varchar(250) null,
    Vaccines varchar(500) null,
    Portion varchar(300) null,
    State varchar(500) not null,
    Cares varchar(1000) not null
);

create table Adotame.CatalogAnimal(
    IDanimal int references (Animal.IDanimal),
    IDcatalog int references (Catalog.IDcatalog)
);

create table Adotame.RequestType(
    IDrequestType int Primary Key,
    Name varchar(250) not null
);

create table Adotame.Request(
    IDrequest int Primary Key,
    UserName varchar(250) not null,
    DateRequest date not null,
    IDuser int references (User.IDuser),
    IDrequestType int references (RequestType.IDrequestType)
);