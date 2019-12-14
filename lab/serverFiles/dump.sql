
DROP DATABASE IF EXISTS playground;
CREATE DATABASE playground;
USE playground;
DROP TABLE IF EXISTS user;

CREATE TABLE user(
    id          INT PRIMARY KEY AUTO_INCREMENT,
    username    VARCHAR(30) NOT NULL UNIQUE,
    password    VARCHAR(255) NOT NULL,
    sprite mediumblob null);
    
SHOW WARNINGS;



DROP TABLE IF EXISTS quiz;
CREATE TABLE quiz(
    id      INT PRIMARY KEY AUTO_INCREMENT,
    userid  int NOT NULL,
    name VARCHAR(255) not null,
    FOREIGN KEY(userid) REFERENCES user(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE);
SHOW WARNINGS;

DROP TABLE IF EXISTS question;
CREATE TABLE question(
    id      INT PRIMARY KEY AUTO_INCREMENT,
    quizid  int NOT NULL,
    question VARCHAR(255) not null,
    answer VARCHAR(255) not null,
    FOREIGN KEY(quizid) REFERENCES quiz(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE);

SHOW WARNINGS;

DROP TABLE IF EXISTS game;
CREATE TABLE game(
    id      INT PRIMARY KEY AUTO_INCREMENT,
    quizid  int NOT NULL,
    FOREIGN KEY(quizid) REFERENCES quiz(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE);

SHOW WARNINGS;


DROP TABLE IF EXISTS game_players;
CREATE TABLE game_players(
    userid INT NOT NULL,
    gameid INT NOT NULL,
    score int null,
    PRIMARY KEY(userid,gameid),
    FOREIGN KEY (userid) REFERENCES user(id) 
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY(gameid) REFERENCES game(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

SHOW WARNINGS;

insert into user (id,username,'password')
    values (0,person1,'password'),
    (1,person2,'password'),
    (2,person3,'password');

insert into quiz (id,userid,name)
    values (0,0,"Video Games"),
    (1,0,"how nice another quiz"),
    (2,1,"Excisting");

insert into question (id,quizid,question,answer)
    values (0,0,"What is halo?","A game duh"),
    (1,0,"What is halo?","A awsome game"),
    (2,1,"question","answer"),
    (3,2,"question","answer");

insert into game (id, quizid)
    values (0,0),
    (1,0),
    (2,1),
    (3,2);

insert into game_players (userid,gameid,score)
    valeus (0,0,50),
    (1,0,40),
    (2,0,20),
    (1,1,25),
    (2,1,20);



