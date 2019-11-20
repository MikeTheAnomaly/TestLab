DROP DATABASE IF EXISTS exampleschool;
CREATE DATABASE exampleschool;
USE exampleschool;
DROP TABLE IF EXISTS instructors;

CREATE TABLE instructors(
    name         VARCHAR(255) NOT NULL,
    office_hours VARCHAR(255) DEFAULT NULL,
    id           INT PRIMARY KEY AUTO_INCREMENT);
SHOW WARNINGS;
INSERT INTO instructors
    (name,office_hours)
VALUES
    ("Paul", "pauloffice"),
    ("Coogan", "Coogan office"),
    ("Morin", "Morin office");
SHOW WARNINGS;
DROP TABLE IF EXISTS students;
CREATE TABLE students(
    name  VARCHAR(255) NOT NULL,
    year  ENUM("F", "So","Jr","Sr") NOT NULL DEFAULT "F",
    age   TINYINT NOT NULL CHECK(age>10 AND age<=99),
    major VARCHAR(20) DEFAULT "Undecided",
    id    INT PRIMARY KEY AUTO_INCREMENT);
SHOW WARNINGS;
INSERT INTO students
    (name,year,age,major)
VALUES("Jim", "Sr", 22, "CS"),
      ("Stevie", "Jr", 35, "Art");
SHOW WARNINGS;
DROP TABLE IF EXISTS classes;
CREATE TABLE classes(
    department    VARCHAR(255) NOT NULL,
    class_number  MEDIUMINT(3) NOT NULL,
    description   TEXT,
    id            INT PRIMARY KEY AUTO_INCREMENT,
    instructor_id INT DEFAULT NULL,
    FOREIGN KEY(instructor_id) REFERENCES instructors(id) 
      ON DELETE SET NULL
      ON UPDATE CASCADE
) ;
SHOW WARNINGS;
SET @paul_id = (SELECT id FROM instructors WHERE name="Paul");
INSERT INTO classes(department,class_number,description,instructor_id)
  VALUES("CS",220, "It's okay",@paul_id),
        ("CS",210, "Better than okay", @paul_id);
SHOW WARNINGS;

DROP TABLE IF EXISTS student_classes;
CREATE TABLE student_classes(
    student_id INT NOT NULL,
    class_id INT NOT NULL,
    PRIMARY KEY(student_id,class_id),
    FOREIGN KEY (student_id) REFERENCES students(id) 
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY(class_id) REFERENCES classes(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);