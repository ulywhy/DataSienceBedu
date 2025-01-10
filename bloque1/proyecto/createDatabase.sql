create database coffeeShop;
#drop database coffeeShop;
use coffeeShop;
create table Gender (
    id int not null AUTO_INCREMENT,
    label varchar(20),
    primary key (id)
);

create table Size (
    id int not null AUTO_INCREMENT,
    size varchar(20),
    primary key (id)
);

create table Color (
    id int not null AUTO_INCREMENT,
    name varchar(30),
    primary key (id)
);

create table Category (
    id int not null AUTO_INCREMENT,
    name varchar(30),
    primary key (id)   
);

create table Season (
    id int not null AUTO_INCREMENT,
    name varchar(30),
    primary key (id)   
);

create table PaymentMethod (
    id int not null AUTO_INCREMENT,
    name varchar(30),
    primary key (id) 
);

create table ShippingType (
    id int not null AUTO_INCREMENT,
    name varchar(30),
    primary key (id) 
);    


create table Frenquency (
    id int not null AUTO_INCREMENT,
    name varchar(30),
    primary key (id) 
);

create table Cloth (
    id int not null AUTO_INCREMENT,
    name varchar(30),
    category int, /* references Category*/
	primary key (id)
);

create table Customer (
    id int not null AUTO_INCREMENT,
    gender int, /*references Gender*/
    age int,
    preferredPaymenytMethod int, /* references PaymentMethod*/
    frequencyOfPurchases int, /*references Frenquency*/
    primary key (id),
    foreign key (gender) references Gender(id)
);

create table Review (
    id int not null AUTO_INCREMENT,
    review varchar(255),
    rating int,
    primary key (id)
);

create table Purchase (
    id int not null AUTO_INCREMENT,
    customer int, /*references Customer*/
    item int, /* references Cloth*/
    item_color int, /*references Color*/
    item_size int, /*references Size*/
    review int, /* references Review*/
    amount int,
    discountApplied boolean,
    promoCodeUsed boolean,
    previousPurchases int,
    paymentMethod int, /*references PaymentMethod*/
    season int, /* references Season*/
    ShippingType int, /*references ShippingType*/
    primary key (id)   
);
