-- create database hw2_2_1;

-- Publisher ( PubName, PubKind) (3)
create table publisher
(
    pub_name varchar(255) unique,
    pub_kind varchar(255),
    primary key (pub_name, pub_kind)
);

-- Book ( ISBN, Title, Author, , PubYear) (2)
create table book
(
    isbn      varchar(255) primary key,
    title     varchar(255),
    author    varchar(255),
    pub_year  int,
    pages_num int,
    pub_name  varchar(255) references publisher (pub_name)
);

-- Category ( CategoryName) (4)
create table category
(
    name varchar(255) primary key,
    parent_cat    varchar(255) references category (name)

);

-- Copy ( ISBN, CopyNumber, Shelf, Position) (5)
create table copy
(
    copy_number int unique,
    shelf       int,
    position    int,
    isbn        varchar(255) references book (isbn),
    primary key (isbn, copy_number),
    unique (shelf, position)
);

-- Reader ( ID, LastName, FirstName, Address, BirthDate) (1)
create table reader
(
    id         int primary key,
    last_name  varchar(255),
    first_name varchar(255),
    address    varchar(255),
    birth_date timestamp
);

-- Borrowing ( ID, ISBN, Copy, ReturnDate) (6)
create table borrowing
(
    reader_num  int references reader (id),
    isbn        varchar(255) references book (isbn),
    copy_num    int references copy (copy_number),
    return_date timestamp,
    primary key (reader_num, isbn, copy_num)
);

create table book_cat
(
    isbn       varchar(255) references book (isbn),
    cat_name varchar(255) references category (name),
    primary key (isbn, cat_name)
);

-- drop table borrowing;
-- drop table reader;
-- drop table book_category;
-- drop table category;
-- drop table copy;
-- drop table book;
-- drop table publisher;
-- drop database hw2_2_1;
