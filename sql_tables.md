CREATE DATBASE mysql_learn;

CREATE TABLE `mysqllearn`.`user` (
  `id` INT NOT NULL,
  `fname` VARCHAR(45) NULL,
  `lname` VARCHAR(45) NULL,
  `number` BIGINT(11) NULL,
  `some_text` TEXT NULL,
PRIMARY KEY (`id`));


CREATE TABLE `mysqllearn`.`fav_foods` (
  `id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `food` VARCHAR(45) NOT NULL,
PRIMARY KEY (`id`));



CREATE TABLE `mysqllearn`.`fav_sport` (
  `id` INT NOT NULL,
  `user_id` VARCHAR(45) NOT NULL,
  `fav_sportcol` VARCHAR(45) NOT NULL,
PRIMARY KEY (`id`));

ALTER TABLE `mysqllearn`.`fav_sport` 
CHANGE COLUMN `user_id` `user_id` INT NOT NULL ;


CREATE TABLE `mysqllearn`.`todo` (
  `id` INT NOT NULL,
  `user_id` VARCHAR(45) NOT NULL,
  `todo_item` VARCHAR(45) NOT NULL,
  `priority` ENUM('fire', 'high', 'medium', 'low') NOT NULL,
PRIMARY KEY (`id`));

ALTER TABLE `mysqllearn`.`todo` 
CHANGE COLUMN `user_id` `user_id` INT NOT NULL ;

CREATE TABLE `mysqllearn`.`notes` (
  `id` INT NOT NULL,
  `user_id` VARCHAR(45) NOT NULL,
  `notes_col` TEXT NOT NULL,
  PRIMARY KEY (`id`));

ALTER TABLE `mysqllearn`.`notes` 
CHANGE COLUMN `user_id` `user_id` INT NOT NULL ;


CREATE TABLE `mysqllearn`.`alarm_manager` (
`id` INT NOT NULL,
`user_id` INT NULL,
`prep_time` VARCHAR(45) NULL,
`check_time` VARCHAR(45) NULL,
PRIMARY KEY (`id`));