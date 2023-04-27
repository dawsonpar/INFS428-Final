CREATE TABLE guard
(`gID` INT NOT NULL ,
`gFName` VARCHAR(30),
`gLName` VARCHAR(30),
`payRate` DECIMAL(3,2),
`pNumber` VARCHAR(15),
`streetAddress` VARCHAR(30),
`city` VARCHAR(30),
`state` VARCHAR(20),
`zip` INT(5));

ALTER TABLE `guard` ADD PRIMARY KEY(`gID`); 

CREATE TABLE `customer`
(`cID` INT NOT NULL ,
`cFName` VARCHAR(30),
`cLName` VARCHAR(30)); 

ALTER TABLE `customer` ADD PRIMARY KEY(`cID`); 

CREATE TABLE `product`
(`pID` INT NOT NULL ,
`metalType` VARCHAR(20),
`shape` VARCHAR(15),
`price` DECIMAL(8,2)); 

ALTER TABLE `product` ADD PRIMARY KEY(`pID`); 

CREATE TABLE `holdings`
(`hID` INT NOT NULL AUTO_INCREMENT,
`pID` INT NOT NULL,
`cID` INT NOT NULL,
`quantity` INT, PRIMARY KEY (`hID`)); 

ALTER TABLE `holdings` ADD CONSTRAINT `customerFK` FOREIGN KEY (`cID`) REFERENCES `customer`(`cID`);
ALTER TABLE `holdings` ADD CONSTRAINT `productFK` FOREIGN KEY (`pID`) REFERENCES `product`(`pID`); 

CREATE TABLE `shift`
(`shiftID` INT NOT NULL ,
`clockInTime` TIME ,
`clockOutTime` TIME ,
`gID` INT ,
`date` DATE ); 

ALTER TABLE `shift` ADD PRIMARY KEY(`shiftID`); 
ALTER TABLE `shift` ADD CONSTRAINT `guardFK` FOREIGN KEY (`gID`) REFERENCES `guard`(`gID`); 

CREATE TABLE `delivery`
(`deliveryID` INT NOT NULL ,
`cID` INT  ,
`pID` INT  ,
`quantity` INT ,
`date` DATE  ,
`time` TIME  ,
`gID` INT  ,
`deliveryType` VARCHAR(15) NOT NULL ); 

ALTER TABLE `delivery` ADD PRIMARY KEY(`deliveryID`); 
ALTER TABLE `delivery` ADD CONSTRAINT `cFK` FOREIGN KEY (`cID`) REFERENCES `customer`(`cID`); 
ALTER TABLE `delivery` ADD CONSTRAINT `pFK` FOREIGN KEY (`pID`) REFERENCES `product`(`pID`); 
ALTER TABLE `delivery` ADD CONSTRAINT `gFK` FOREIGN KEY (`gID`) REFERENCES `guard`(`gID`); 

INSERT INTO `product` (`pID`, `metalType`, `shape`, `price`)
VALUES ('1', 'gold', 'bullion', '64632.60'),
('2', 'gold', 'coin', '64.63'),
('3', 'silver', 'bullion', '806.00'),
('4', 'silver', 'coin', '0.81'),
('5', 'platinum', 'bullion', '35854.49'),
('6', 'platinum', 'coin', '35.85'),
('7', 'palladium', 'bullion', '49478.85'),
('8', 'palladium', 'coin', '49.49'); 

INSERT INTO "customer' (cID, cFName, cLName)
VALUES 
(1, 'John', 'Smith'),
(2, 'Jane', 'Doe'),
(3, 'Michael', 'Johnson'),
(4, 'Emily', 'Brown'),
(5, 'William', 'Davis'),
(6, 'Sarah', 'Garcia'),
(7, 'Kevin', 'Rodriguez'),
(8, 'Rachel', 'Martinez'),
(9, 'David', 'Anderson'),
(10, 'Olivia', 'Wilson');