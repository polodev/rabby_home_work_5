# creating database

~~~sql
CREATE DATABASE art_work;
USE art_work;
~~~

~~~sql
CREATE TABLE arts (
  id  INT(11) AUTO_INCREMENT PRIMARY KEY,
  item_code VARCHAR(30) NOT NULL UNIQU,
  title VARCHAR(50) NOT NULL,
  type VARCHAR(50),
  size VARCHAR(50),
  other_features VARCHAR(50),
  UNIQUE KEY( item_code ) 
);
~~~
## generated code 

~~~sql
CREATE TABLE `art_work`.`arts` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `item_code` VARCHAR(50) NOT NULL ,
  `title` VARCHAR(50) NULL ,
  `type` VARCHAR(50) NULL ,
  `size` VARCHAR(50) NULL ,
  `other_information` VARCHAR(100) NOT NULL ,
  PRIMARY KEY (`id`),
  UNIQUE (`item_code`))
ENGINE = InnoDB;
~~~

~~~sql
CREATE TABLE artist_art (
  artist_id int(11) not null,
  art_id int(11) not null,
  PRIMARY KEY ( artist_id, art_id ),
  foreign key (artist_id) references artists (id),
  foreign key (art_id) references arts(id)
);
~~~




