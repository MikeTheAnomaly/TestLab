
DROP DATABASE IF EXISTS playground;
CREATE DATABASE playground;
USE playground;
DROP TABLE IF EXISTS user;

CREATE TABLE user(
    id          INT PRIMARY KEY AUTO_INCREMENT,
    username    VARCHAR(30) NOT NULL UNIQUE,
    password    VARCHAR(255) NOT NULL,
    sprite mediumblob null)
    
SHOW WARNINGS;



DROP TABLE IF EXISTS quiz;
CREATE TABLE quiz(
    id      INT PRIMARY KEY AUTO_INCREMENT,
    userid  int NOT NULL,
    major VARCHAR(255) not null,
    FOREIGN KEY(userid) REFERENCES user(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE

SHOW WARNINGS;

DROP TABLE IF EXISTS question;
CREATE TABLE question(
    id      INT PRIMARY KEY AUTO_INCREMENT,
    quizid  int NOT NULL,
    question VARCHAR(255) not null,
    FOREIGN KEY(quizid) REFERENCES quiz(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE

SHOW WARNINGS;

DROP TABLE IF EXISTS game;
CREATE TABLE game(
    id      INT PRIMARY KEY AUTO_INCREMENT,
    quizid  int NOT NULL,
    question VARCHAR(255) not null,
    FOREIGN KEY(quizid) REFERENCES quiz(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE

SHOW WARNINGS;


DROP TABLE IF EXISTS game_players;
CREATE TABLE game_players(
    userid INT NOT NULL,
    quizid INT NOT NULL,
    userquiz int null,
    PRIMARY KEY(userid,quizid),
    FOREIGN KEY (userid) REFERENCES user(id) 
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY(quizid) REFERENCES quiz(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

SHOW WARNINGS;
