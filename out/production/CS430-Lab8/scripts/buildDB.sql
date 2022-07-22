
CREATE TABLE `Member` (
  `mid` int PRIMARY KEY NOT NULL,
  `first_name` varchar(20),
  `last_name` varchar(20),
  `dob` date,
  `gender` ENUM('M', 'F', 'O')
);

CREATE TABLE `Book` (
  `isbn` varchar(17) PRIMARY KEY NOT NULL,
  `title` varchar(50),
  `publisher` int,
  `date_published` date
);

CREATE TABLE `Borrow` (
    `txID` int AUTO_INCREMENT PRIMARY KEY NOT NULL,
    `borrower` int NOT NULL,
    `checkout` date NOT NULL,
    `checkin` date,
    `item` int
);

CREATE TABLE `Publisher` (
  `PubID` int PRIMARY KEY NOT NULL,
  `name` varchar(30)
);

CREATE TABLE `Contact` (
  `phone_number` varchar(20) PRIMARY KEY NOT NULL,
  `phone_type` varchar(20)
);

CREATE TABLE `Author` (
  `aid` int PRIMARY KEY NOT NULL,
  `first_name` varchar(20),
  `last_name` varchar(20)
);

CREATE TABLE `AuthListing` (
  `list` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `aid` int,
  `phone` varchar(20)
);

CREATE TABLE `PubListing` (
  `list` int PRIMARY KEY NOT NULL,
  `PubID` int,
  `phone` varchar(20)
);

CREATE TABLE `Authored` (
    `key` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `author` int,
    `book` varchar(17)
);

CREATE TABLE `Library` (
    `name` varchar(50) PRIMARY KEY NOT NULL,
    `street` varchar(50),
    `city` varchar(50),
    `state` varchar(2)
);

CREATE TABLE `Located` (
    `item` int PRIMARY KEY AUTO_INCREMENT,
    `isbn` varchar(17),
    `location` varchar(50),
    `copies` int,
    `shelf` int,
    `floor` int,
    `copies_avail` int
);


ALTER TABLE `Book` ADD FOREIGN KEY (`publisher`) REFERENCES `Publisher` (`PubID`);
ALTER TABLE `Located` ADD FOREIGN KEY (`isbn`) REFERENCES `Book` (`isbn`)
    ON DELETE CASCADE;

ALTER TABLE `Borrow` ADD FOREIGN KEY (`item`) REFERENCES `Located` (`item`);
ALTER TABLE `Borrow` ADD FOREIGN KEY (`borrower`) REFERENCES `Member` (`mid`);

ALTER TABLE `AuthListing` ADD FOREIGN KEY (`aid`) REFERENCES `Author` (`aid`);
ALTER TABLE `AuthListing` ADD FOREIGN KEY (`phone`) REFERENCES `Contact` (`phone_number`);

ALTER TABLE `PubListing` ADD FOREIGN KEY (`PubID`) REFERENCES `Publisher` (`PubID`);
ALTER TABLE `PubListing` ADD FOREIGN KEY (`phone`) REFERENCES `Contact` (`phone_number`);

ALTER TABLE `Authored` ADD FOREIGN KEY (`author`) REFERENCES `Author` (`aid`);
ALTER TABLE `Authored` ADD FOREIGN KEY (`book`) REFERENCES `Book` (`isbn`);

ALTER TABLE `Located` ADD FOREIGN KEY (`location`) REFERENCES `Library` (`name`);



