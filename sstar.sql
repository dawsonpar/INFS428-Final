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
