create database shoppingTrends;
#drop database shoppingTrends;
use shoppingTrends;

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

create table State (
    id int not null AUTO_INCREMENT,
    name varchar(45),
    primary key (id)
);

create table Cloth (
    id int not null AUTO_INCREMENT,
    name varchar(30),
    category int, /* references Category*/
	primary key (id),
    foreign key (category) references Category(id)
);

create table Customer (
    id int not null AUTO_INCREMENT,
    gender int, /*references Gender*/
    age int,
    preferred_payment_method int, /* references PaymentMethod*/
    frequency_of_purchases int, /*references Frenquency*/
    location int,
    primary key (id),
    foreign key (gender) references Gender(id),
    foreign key (preferred_payment_method) references PaymentMethod(id),
    foreign key (frequency_of_purchases) references Frenquency(id),
    foreign key (location) references State(id)
);

create table Purchase (
    id int not null AUTO_INCREMENT,
    customer int, /*references Customer*/
    item int, /* references Cloth*/
    item_color int, /*references Color*/
    item_size int, /*references Size*/
    review_rating int, /* references Review*/
    amount int,
    discount_applied boolean,
    promocode_used boolean,
    previous_purchases int,
    payment_method int, /*references PaymentMethod*/
    season int, /* references Season*/
    shipping_type int, /*references ShippingType*/
    primary key (id),
    foreign key (customer) references Customer(id),
    foreign key (item) references Cloth(id),
    foreign key (item_color) references Color(id),
    foreign key (item_size) references Size(id),
    foreign key (payment_method) references PaymentMethod(id),
    foreign key (season) references Season(id),
    foreign key (shipping_type) references ShippingType(id)
);
