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

INSERT INTO product
VALUES (1, 'gold', 'bullion', 64632.60),
(2, 'gold', 'coin', 64.63),
(3, 'silver', 'bullion', 806.00),
(4, 'silver', 'coin', 0.81),
(5, 'platinum', 'bullion', 35854.49),
(6, 'platinum', 'coin', 35.85),
(7, 'palladium', 'bullion', 49478.85),
(8, 'palladium', 'coin', 49.49);

INSERT INTO customer
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

INSERT INTO guard
VALUES
(1, 'David', 'Smith', 62.50, '123-456-7890', '123 Main St', 'Anytown', 'CA', 12345),
(2, 'Emily', 'Johnson', 65.00, '234-567-8901', '456 Elm St', 'Anycity', 'NY', 23456),
(3, 'William', 'Garcia', 60.75, '345-678-9012', '789 Oak St', 'Someville', 'TX', 34567),
(4, 'Sarah', 'Brown', 64.25, '456-789-0123', '987 Pine St', 'Anystate', 'FL', 45678),
(5, 'Michael', 'Davis', 61.50, '567-890-1234', '654 Maple St', 'Sometown', 'IL', 56789),
(6, 'Rachel', 'Rodriguez', 63.75, '678-901-2345', '321 Birch St', 'Anyville', 'NC', 67890),
(7, 'Olivia', 'Martinez', 66.25, '789-012-3456', '876 Cedar St', 'Anycity', 'PA', 78901),
(8, 'John', 'Anderson', 62.00, '890-123-4567', '543 Walnut St', 'Somewhere', 'VA', 89012),
(9, 'Jane', 'Wilson', 61.25, '901-234-5678', '210 Oak St', 'Anycity', 'OH', 90123),
(10, 'Kevin', 'Taylor', 64.50, '012-345-6789', '777 Elm St', 'Anystate', 'MI', 01234);

INSERT INTO shift
VALUES (1, '07:00:00', '15:00:00', 2, '2023-01-01'),
(2, '15:00:00', '23:00:00', 6, '2023-01-01'),
(3, '23:00:00', '07:00:00', 3, '2023-01-02'),
(4, '07:00:00', '15:00:00', 1, '2023-01-02'),
(5, '15:00:00', '23:00:00', 8, '2023-01-02'),
(6, '23:00:00', '07:00:00', 4, '2023-01-03'),
(7, '07:00:00', '15:00:00', 7, '2023-01-03'),
(8, '15:00:00', '23:00:00', 9, '2023-01-03'),
(9, '23:00:00', '07:00:00', 5, '2023-01-04'),
(10, '07:00:00', '15:00:00', 10, '2023-01-04'),
(11, '15:00:00', '23:00:00', 2, '2023-01-04'),
(12, '23:00:00', '07:00:00', 1, '2023-01-05'),
(13, '07:00:00', '15:00:00', 6, '2023-01-05'),
(14, '15:00:00', '23:00:00', 8, '2023-01-05'),
(15, '23:00:00', '07:00:00', 3, '2023-01-06'),
(16, '07:00:00', '15:00:00', 4, '2023-01-06'),
(17, '15:00:00', '23:00:00', 7, '2023-01-06'),
(18, '23:00:00', '07:00:00', 9, '2023-01-07'),
(19, '07:00:00', '15:00:00', 5, '2023-01-07'),
(20, '15:00:00', '23:00:00', 10, '2023-01-07');