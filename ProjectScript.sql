CREATE DATABASE HomeHarbor;

USE HomeHarbor;

--  Customer Table
CREATE TABLE Customer(
    CustomerID INT PRIMARY KEY  AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Address VARCHAR(100),
    PhoneNumber VARCHAR(15)
);

-- Orders Table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT NOT NULL,
    OrderDate DATE,
    Status VARCHAR(50),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);


-- Suppliers Table
CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY AUTO_INCREMENT,
    SupplierName VARCHAR(100) NOT NULL,
    ContactName VARCHAR(100),
    ContactEmail VARCHAR(100),
    ContactPhoneNumber VARCHAR(15)
);

-- Stock Table
CREATE TABLE Stock (
    ProductID INT PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(255) NOT NULL,
    Description VARCHAR(255),
    QuantityInStock INT NOT NULL,
    CostPrice DECIMAL(10, 2) NOT NULL,
    SupplierID INT,
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);

-- OrderItems Table
CREATE TABLE OrderItems (
    OrderItemID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT,
    ProductID INT,
    QuantityOrdered INT NOT NULL,
    PriceAtOrder DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Stock(ProductID)
);


-- Payments Table
CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT,
    PaymentDate DATE NOT NULL,
    Amount DECIMAL(10, 2) NOT NULL,
    PaymentMethod VARCHAR(50) NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Returns Table
CREATE TABLE Returns (
    ReturnID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT,
    ProductID INT ,
    ReturnDate DATE NOT NULL,
    ReturnReason VARCHAR(255),
    Status VARCHAR(50) NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Stock(ProductID)
);


-- Inserting data into Suppliers Table
INSERT INTO Suppliers (SupplierID, SupplierName, ContactName, ContactEmail, ContactPhoneNumber)
VALUES
(1, 'Dablist', 'Sallyanne Colliar', 'scolliar0@tiny.cc', '153-801-3339'),
(2, 'Thoughtworks', 'Jason Flanaghan', 'jflanaghan1@instagram.com', '842-378-1306'),
(3, 'Eabox', 'Bertrando Fetters', 'bfetters2@blogtalkradio.com', '358-547-5393'),
(4, 'Fadeo', 'Gusty Antoni', 'gantoni3@biglobe.ne.jp', '716-298-5099'),
(5, 'Skyvu', 'Elizabet O\'Cleary', 'eocleary4@wix.com', '696-227-5317'),
(6, 'Rooxo', 'Wendell Shakesbye', 'wshakesbye5@ebay.co.uk', '572-907-9406');

-- Inserting data into Stock Table
INSERT INTO Stock (ProductID, ProductName, Description, QuantityInStock, CostPrice, SupplierID)
VALUES 
(1, 'shoe racks', 'metus sapien ut nunc vestibulum ante ipsum primis', 98, 245, 3),
(2, 'storage bins', 'sociis natoque penatibus et magnis dis parturient montes nascetur', 50, 433, 4),
(3, 'closet organizers', 'mi in porttitor pede justo eu massa donec', 74, 196, 4),
(4, 'blenders', 'ultrices libero non mattis pulvinar nulla pede ullamcorper', 72, 533, 5),
(5, 'toasters', 'magnis dis parturient montes nascetur ridiculus', 83, 472, 3),
(6, 'coffee makers', 'eget massa tempor convallis nulla', 55, 126, 1),
(7, 'microwaves', 'vestibulum ante ipsum primis in faucibus', 97, 297, 3),
(8, 'rice cookers', 'pede posuere nonummy integer non', 79, 129, 4),
(9, 'food processors', 'sapien iaculis congue vivamus metus', 94, 178, 4),
(10, 'dining tables', 'justo sit amet sapien dignissim vestibulum vestibulum ante', 69, 259, 6),
(11, 'chairs', 'massa id nisl venenatis lacinia aenean sit', 72, 488, 1),
(12, 'sideboards', 'luctus et ultrices posuere cubilia curae', 77, 538, 6);

-- Inserting data into Customer Table
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Address, PhoneNumber)
VALUES
(1, 'Sande', 'Devonald', 'sdevonald0@weibo.com', '4 Fallview Circle', '182-173-8179'),
(2, 'Mischa', 'Marchenko', 'mmarchenko1@elegantthemes.com', '10012 Texas Drive', '772-759-8474'),
(3, 'Ogdon', 'Grishaev', 'ogrishaev2@shop-pro.jp', '0253 Southridge Street', '981-179-5009'),
(4, 'Dunstan', 'Domek', 'ddomek3@pen.io', '1581 Lakewood Avenue', '664-197-8511'),
(5, 'Nappy', 'Ossipenko', 'nossipenko4@washingtonpost.com', '99184 Old Gate Plaza', '268-848-0571'),
(6, 'Floris', 'Woodman', 'fwoodman5@harvard.edu', '15 Marquette Avenue', '909-610-3968'),
(7, 'Mel', 'O\'Howbane', 'mohowbane6@linkedin.com', '7 Northland Lane', '270-695-1114'),
(8, 'Calypso', 'Dunphie', 'cdunphie7@unc.edu', '9149 Merchant Junction', '774-232-3414'),
(9, 'Celinka', 'Schenkel', 'cschenkel8@biglobe.ne.jp', '68 Oneill Street', '183-695-9429'),
(10, 'Rolf', 'Brogi', 'rbrogi9@eventbrite.com', '75922 Emmet Alley', '468-263-9532'),
(11, 'Bendite', 'McAllen', 'bmcallena@drupal.org', '006 Continental Lane', '870-558-4399'),
(12, 'Valeria', 'Scardifeild', 'vscardifeildb@digg.com', '55606 Parkside Court', '988-791-9887'),
(13, 'Kenyon', 'Aslet', 'kasletc@netlog.com', '91942 Melvin Drive', '807-869-7598'),
(14, 'Chrissie', 'Hawgood', 'chawgoodd@ovh.net', '631 Sloan Circle', '231-810-8583'),
(15, 'Issie', 'Renahan', 'irenahane@walmart.com', '9632 Armistice Drive', '716-141-0462'),
(16, 'Cozmo', 'MacPhaden', 'cmacphadenf@list-manage.com', '4142 Waubesa Center', '523-983-2777'),
(17, 'Thelma', 'Sketh', 'tskethg@vimeo.com', '33 Melby Circle', '646-241-0801'),
(18, 'Merrel', 'Freda', 'mfredah@uol.com.br', '1 Amoth Circle', '569-306-4742'),
(19, 'Rasia', 'Grevatt', 'rgrevatti@jigsy.com', '937 Becker Way', '415-920-2069'),
(20, 'Pearle', 'Luard', 'pluardj@cafepress.com', '59513 Kim Park', '626-457-9809'),
(21, 'Lawry', 'Ciccottini', 'lciccottinik@sciencedaily.com', '45446 Clyde Gallagher Center', '486-738-0457'),
(22, 'Lorrie', 'Sweet', 'lsweetl@scientificamerican.com', '7071 Dayton Way', '667-852-7231'),
(23, 'Hollyanne', 'Shirtcliffe', 'hshirtcliffem@samsung.com', '9 Bobwhite Place', '816-151-7189'),
(24, 'Laetitia', 'Olczyk', 'lolczykn@studiopress.com', '16378 Sauthoff Plaza', '310-426-1445'),
(25, 'Meggie', 'Haburne', 'mhaburneo@epa.gov', '446 Jay Center', '293-567-2884'),
(26, 'Smitty', 'Giorgi', 'sgiorgip@hud.gov', '649 Hansons Trail', '710-774-0078'),
(27, 'Robby', 'Gatheral', 'rgatheralq@oaic.gov.au', '394 Briar Crest Alley', '696-335-8238'),
(28, 'Neville', 'Sparhawk', 'nsparhawkr@salon.com', '22572 Melvin Lane', '810-400-9833'),
(29, 'Bettina', 'Kayzer', 'bkayzers@blog.com', '7176 Fairview Terrace', '703-470-6049'),
(30, 'Emmalynn', 'Izatson', 'eizatsont@cargocollective.com', '63 Brown Lane', '307-871-7302'),
(31, 'Scottie', 'Pagelsen', 'spagelsenu@live.com', '72 Londonderry Plaza', '757-648-6268'),
(32, 'Marabel', 'MacTague', 'mmactaguev@dedecms.com', '39314 Spaight Park', '804-839-0868'),
(33, 'Jojo', 'Joisce', 'jjoiscew@nyu.edu', '63733 Tennessee Way', '110-597-7628'),
(34, 'Jammie', 'Dalgarnowch', 'jdalgarnowchx@google.es', '87 Golf Road', '830-385-3903'),
(35, 'Carmencita', 'Godfroy', 'cgodfroyy@mit.edu', '25 Continental Lane', '558-748-5559'),
(36, 'Kelley', 'Fantini', 'kfantiniz@chronoengine.com', '491 Jenna Way', '625-861-4756'),
(37, 'Nikolos', 'Ventam', 'nventam10@twitter.com', '1435 Northland Alley', '330-240-6594'),
(38, 'Terra', 'Cranke', 'tcranke11@addthis.com', '6864 Ramsey Center', '572-753-6478'),
(39, 'Arne', 'Agget', 'aagget12@china.com.cn', '079 Granby Alley', '636-293-0200'),
(40, 'Brandie', 'Dommersen', 'bdommersen13@ameblo.jp', '0 Blaine Road', '230-651-5864'),
(41, 'Samuel', 'Vettore', 'svettore14@state.gov', '9 Stone Corner Place', '402-248-3884'),
(42, 'Meriel', 'Schott', 'mschott15@businessinsider.com', '2 Fordem Parkway', '236-939-7775'),
(43, 'Glenden', 'Elsbury', 'gelsbury16@liveinternet.ru', '54140 Evergreen Terrace', '181-269-5608'),
(44, 'Roselin', 'Arrell', 'rarrell17@wikispaces.com', '0 Haas Center', '202-773-7166'),
(45, 'Tracee', 'Dalgleish', 'tdalgleish18@irs.gov', '17 Merry Park', '464-181-8263'),
(46, 'Meridel', 'Humblestone', 'mhumblestone19@twitpic.com', '53428 Roth Circle', '516-781-0085'),
(47, 'Pearla', 'MacIlurick', 'pmacilurick1a@cnet.com', '86334 Burrows Street', '619-233-3536'),
(48, 'Eydie', 'Aslen', 'easlen1b@tumblr.com', '56 Grim Court', '109-840-3680'),
(49, 'Amery', 'Frostdicke', 'afrostdicke1c@cdc.gov', '943 Fisk Crossing', '200-729-7683'),
(50, 'Jaquenetta', 'Harmstone', 'jharmstone1d@acquirethisname.com', '708 Pleasure Pass', '136-179-5112');

-- Inserting data into Orders Table
INSERT INTO Orders (OrderID, CustomerID, OrderDate, Status)
VALUES
(1, 1, '2023-05-18', 'Processing'),
(2, 2, '2024-04-18', 'Processing'),
(3, 3, '2023-10-28', 'Delivered'),
(4, 4, '2023-03-14', 'Processing'),
(5, 5, '2023-10-29', 'Shipped'),
(6, 6, '2023-09-23', 'Processing'),
(7, 7, '2023-09-12', 'Shipped'),
(8, 8, '2023-10-08', 'Processing'),
(9, 9, '2024-03-24', 'Processing'),
(10, 10, '2023-03-14', 'Processing'),
(11, 11, '2024-02-02', 'Shipped'),
(12, 12, '2024-03-08', 'Delivered'),
(13, 13, '2024-01-21', 'Delivered'),
(14, 14, '2023-07-29', 'Delivered'),
(15, 15, '2023-09-08', 'Delivered'),
(16, 16, '2023-01-11', 'Shipped'),
(17, 17, '2023-12-23', 'Processing'),
(18, 18, '2023-10-08', 'Processing'),
(19, 19, '2024-01-12', 'Shipped'),
(20, 20, '2024-02-09', 'Processing'),
(21, 21, '2024-01-05', 'Delivered'),
(22, 22, '2023-01-04', 'Processing'),
(23, 23, '2024-03-24', 'Shipped'),
(24, 24, '2023-09-28', 'Processing'),
(25, 25, '2023-03-14', 'Delivered'),
(26, 26, '2024-01-24', 'Delivered'),
(27, 27, '2023-02-28', 'Processing'),
(28, 28, '2023-07-20', 'Processing'),
(29, 29, '2024-04-18', 'Shipped'),
(30, 30, '2023-01-10', 'Shipped'),
(31, 31, '2023-09-30', 'Shipped'),
(32, 32, '2024-02-06', 'Processing'),
(33, 33, '2023-08-04', 'Processing'),
(34, 34, '2023-01-18', 'Delivered'),
(35, 35, '2023-08-07', 'Processing'),
(36, 36, '2024-03-29', 'Shipped'),
(37, 37, '2024-03-09', 'Processing'),
(38, 38, '2024-01-11', 'Delivered'),
(39, 39, '2024-02-14', 'Delivered'),
(40, 40, '2023-03-09', 'Delivered'),
(41, 41, '2023-02-14', 'Processing'),
(42, 42, '2023-02-16', 'Shipped'),
(43, 43, '2023-12-18', 'Processing'),
(44, 44, '2023-06-27', 'Shipped'),
(45, 45, '2023-10-18', 'Shipped'),
(46, 46, '2024-02-02', 'Processing'),
(47, 47, '2023-06-27', 'Shipped'),
(48, 48, '2023-04-26', 'Delivered'),
(49, 49, '2023-02-15', 'Shipped'),
(50, 50, '2023-08-05', 'Shipped');

-- Inserting data into OrderItems Table
INSERT INTO OrderItems (OrderItemID, OrderID, ProductID, QuantityOrdered, PriceAtOrder)
VALUES
(1,29,11,4,651),
(2,16,9,3,423),
(3,1,3,2,485),
(4,34,7,2,662),
(5,47,5,4,108),
(6,27,3,1,503),
(7,46,12,3,316),
(8,38,10,4,490),
(9,33,12,3,652),
(10,7,11,2,195),
(11,50,2,1,579),
(12,22,9,2,635),
(13,6,1,2,259),
(14,4,3,1,536),
(15,23,3,4,469),
(16,2,8,1,137),
(17,15,11,2,326),
(18,2,7,3,314),
(19,3,9,2,294),
(20,21,11,2,527),
(21,24,6,2,321),
(22,20,1,3,195),
(23,14,1,1,316),
(24,25,3,1,413),
(25,29,4,4,680),
(26,21,6,2,281),
(27,38,7,2,385),
(28,35,7,2,324),
(29,10,7,1,312),
(30,36,5,4,239),
(31,37,3,3,662),
(32,49,8,1,452),
(33,48,10,2,428),
(34,1,11,1,292),
(35,18,4,4,134),
(36,20,11,2,424),
(37,36,3,3,318),
(38,44,8,3,188),
(39,37,9,1,113),
(40,15,6,2,150),
(41,45,6,2,174),
(42,42,6,1,327),
(43,45,5,2,646),
(44,39,4,3,406),
(45,13,8,3,438),
(46,50,3,4,312),
(47,3,7,2,154),
(48,40,4,1,514),
(49,13,11,3,658),
(50,28,7,1,107),
(51,9,11,3,144),
(52,32,12,1,324),
(53,49,4,3,651),
(54,7,6,3,378),
(55,47,11,2,181),
(56,18,10,2,471),
(57,21,10,2,668),
(58,46,1,1,580),
(59,10,9,2,116),
(60,2,7,2,501),
(61,17,11,3,158),
(62,19,1,3,306),
(63,31,2,4,566),
(64,29,11,2,150),
(65,48,6,2,477),
(66,38,6,3,275),
(67,16,12,1,115),
(68,40,6,2,268),
(69,47,5,1,676),
(70,11,10,4,169),
(71,17,12,3,158),
(72,2,9,4,692),
(73,13,4,3,532),
(74,38,12,4,295),
(75,47,9,1,482),
(76,1,11,3,406),
(77,13,9,1,496),
(78,21,7,4,634),
(79,32,10,3,246),
(80,12,10,4,457),
(81,5,11,4,576),
(82,48,10,3,330),
(83,4,12,4,588),
(84,14,3,3,208),
(85,1,12,4,113),
(86,43,5,2,448),
(87,26,6,1,537),
(88,8,9,2,661),
(89,30,10,1,102),
(90,30,9,4,265),
(91,3,4,4,340),
(92,40,2,4,232),
(93,41,9,3,667),
(94,2,12,2,403),
(95,2,4,4,457),
(96,34,8,2,542),
(97,50,8,4,169),
(98,38,10,2,391),
(99,48,10,2,410),
(100,37,2,3,403);

-- Inserting data into Payments Table
INSERT INTO Payments (PaymentID, OrderID, PaymentDate, Amount, PaymentMethod)
VALUES
(1, 1, '2023-05-18', 2932, 'Debit Card'),
(2, 2, '2024-04-18', 7483, 'PayPal'),
(3, 3, '2023-10-28', 2256, 'Credit Card'),
(4, 4, '2023-03-14', 2888, 'PayPal'),
(5, 5, '2023-10-29', 2304, 'Bank Transfer'),
(6, 6, '2023-09-23', 518, 'Debit Card'),
(7, 7, '2023-09-12', 1524, 'PayPal'),
(8, 8, '2023-10-08', 1322, 'Credit Card'),
(9, 9, '2024-03-24', 432, 'PayPal'),
(10, 10, '2023-03-14', 544, 'Bank Transfer'),
(11, 11, '2024-02-02', 676, 'Bank Transfer'),
(12, 12, '2024-03-08', 1828, 'Credit Card'),
(13, 13, '2024-01-21', 5380, 'Bank Transfer'),
(14, 14, '2023-07-29', 940, 'Debit Card'),
(15, 15, '2023-09-08', 952, 'Bank Transfer'),
(16, 16, '2023-01-11', 1384, 'Credit Card'),
(17, 17, '2023-12-23', 948, 'PayPal'),
(18, 18, '2023-10-08', 1478, 'Debit Card'),
(19, 19, '2024-01-12', 918, 'Credit Card'),
(20, 20, '2024-02-09', 1433, 'PayPal'),
(21, 21, '2024-01-05', 5488, 'Bank Transfer'),
(22, 22, '2023-01-04', 1270, 'Credit Card'),
(23, 23, '2024-03-24', 1876, 'Bank Transfer'),
(24, 24, '2023-09-28', 642, 'Bank Transfer'),
(25, 25, '2023-03-14', 413, 'Bank Transfer'),
(26, 26, '2024-01-24', 537, 'Debit Card'),
(27, 27, '2023-02-28', 503, 'Bank Transfer'),
(28, 28, '2023-07-20', 107, 'Credit Card'),
(29, 29, '2024-04-18', 5624, 'Debit Card'),
(30, 30, '2023-01-10', 1162, 'Debit Card'),
(31, 31, '2023-09-30', 2264, 'Credit Card'),
(32, 32, '2024-02-06', 1062, 'Credit Card'),
(33, 33, '2023-08-04', 1956, 'Bank Transfer'),
(34, 34, '2023-01-18', 2408, 'PayPal'),
(35, 35, '2023-08-07', 648, 'Credit Card'),
(36, 36, '2024-03-29', 1910, 'Debit Card'),
(37, 37, '2024-03-09', 3308, 'Credit Card'),
(38, 38, '2024-01-11', 5517, 'Credit Card'),
(39, 39, '2024-02-14', 1218, 'PayPal'),
(40, 40, '2023-03-09', 1978, 'Credit Card'),
(41, 41, '2023-02-14', 2001, 'Bank Transfer'),
(42, 42, '2023-02-16', 327, 'Credit Card'),
(43, 43, '2023-12-18', 896, 'Bank Transfer'),
(44, 44, '2023-06-27', 564, 'Bank Transfer'),
(45, 45, '2023-10-18', 1640, 'PayPal'),
(46, 46, '2024-02-02', 1528, 'Bank Transfer'),
(47, 47, '2023-06-27', 1952, 'Bank Transfer'),
(48, 48, '2023-04-26', 3620, 'Bank Transfer'),
(49, 49, '2023-02-15', 2405, 'Bank Transfer'),
(50, 50, '2023-08-05', 2503, 'Credit Card');

-- Inserting data into Returns Table
INSERT INTO Returns (ReturnID, OrderID, ProductID, ReturnDate, ReturnReason, Status)
VALUES
(1, 33, 12, '2024-02-16', 'Difficulty in Use', 'Approved'),
(2, 11, 10, '2023-09-25', 'Wrong Item Shipped', 'Pending'),
(3, 34, 7, '2024-04-22', 'Item Damaged or Defective', 'Pending'),
(4, 44, 8, '2023-10-28', 'Item Damaged or Defective', 'Approved'),
(5, 16, 12, '2023-12-19', 'Arrived Late', 'Pending'),
(6, 34, 8, '2023-11-15', 'Color or Design Mismatch', 'Approved'),
(7, 45, 6, '2024-01-21', 'Wrong Item Shipped', 'Approved'),
(8, 19, 1, '2023-09-25', 'Wrong Item Shipped', 'Approved'),
(9, 50, 3, '2024-02-16', 'Color or Design Mismatch', 'Approved'),
(10, 26, 6, '2024-01-06', 'Difficulty in Use', 'Approved'),
(11, 3, 7, '2023-10-28', 'Wrong Item Shipped', 'Approved'),
(12, 31, 2, '2024-03-27', 'Size or Fit Issues', 'Approved'),
(13, 22, 9, '2023-11-23', 'Wrong Item Shipped', 'Pending'),
(14, 21, 10, '2023-09-19', 'Item Damaged or Defective', 'Rejected'),
(15, 49, 4, '2023-12-04', 'Difficulty in Use', 'Rejected');

-- 1.Create a View showing all transactions for a given week in your business
CREATE VIEW WeeklyTransactions AS
SELECT
    o.OrderID,
    s.ProductName,
    o.OrderDate,
    o.Status AS OrderStatus,
    c.FirstName AS CustomerFirstName,
    c.LastName AS CustomerLastName,    
    oi.QuantityOrdered,
    oi.PriceAtOrder * oi.QuantityOrdered AS TotalPrice,
    p.PaymentDate,
    p.Amount AS PaymentAmount,
    p.PaymentMethod
FROM Orders o
JOIN Customer c ON o.CustomerID = c.CustomerID
LEFT JOIN OrderItems oi ON o.OrderID = oi.OrderID
LEFT JOIN Stock s ON oi.ProductID = s.ProductID
LEFT JOIN Payments p ON o.OrderID = p.OrderID
WHERE o.OrderDate BETWEEN '2024-04-15' AND '2024-04-21';

SELECT * FROM WeeklyTransactions;


-- 2.Create a trigger that stores stock levels once a sale takes place

DELIMITER //
CREATE TRIGGER UpdateStockLevelAfterSale
AFTER INSERT
ON OrderItems
FOR EACH ROW
BEGIN
    -- Update the QuantityInStock in the Stock table
    UPDATE Stock
    SET QuantityInStock = QuantityInStock - NEW.QuantityOrdered
    WHERE ProductID = NEW.ProductID;
END;
//
DELIMITER ;

-- 3.Create a View of stock (by supplier) purchased by you
CREATE VIEW BusinessPurchasedStock AS
SELECT
    s.ProductID,
    s.ProductName,
    s.Description,
    s.QuantityInStock,
    s.CostPrice,
    s.SupplierID,
    sp.SupplierName,
    sp.ContactName AS SupplierContactName,
    sp.ContactEmail AS SupplierContactEmail,
    sp.ContactPhoneNumber AS SupplierContactPhoneNumber
FROM Stock s
JOIN Suppliers sp ON s.SupplierID = sp.SupplierID;

SELECT * FROM BusinessPurchasedStock;

-- 4.Create a View of Total stock sold to general public (group by supplier)

CREATE VIEW TotalStockSoldBySupplier AS
SELECT
    s.SupplierID,
    sp.SupplierName,
    SUM(oi.QuantityOrdered) AS TotalQuantitySold
FROM OrderItems oi
JOIN Stock s ON oi.ProductID = s.ProductID
JOIN Suppliers sp ON s.SupplierID = sp.SupplierID
GROUP BY s.SupplierID;

SELECT * FROM TotalStockSoldBySupplier;

-- 5. Detail and total all transactions (SALES) for the month-to-date. (A Group By with Roll-Up) 

SELECT
    o.OrderDate,
    SUM(oi.QuantityOrdered) AS TotalQuantityOrdered,
    SUM(oi.QuantityOrdered * oi.PriceAtOrder) AS TotalRevenue
FROM Orders o
JOIN OrderItems oi ON o.OrderID = oi.OrderID
WHERE MONTH(o.OrderDate) = MONTH(CURDATE()) AND YEAR(o.OrderDate) = YEAR(CURDATE())
GROUP BY o.OrderDate WITH ROLLUP;

-- 6. Detail and total all SALES for the year-to-date. (A Group By with Roll-Up) – All months

SELECT
    YEAR(o.OrderDate) AS OrderYear,
    MONTH(o.OrderDate) AS OrderMonth,
    SUM(oi.QuantityOrdered) AS TotalQuantityOrdered,
    SUM(oi.QuantityOrdered * oi.PriceAtOrder) AS TotalRevenue
FROM Orders o
JOIN OrderItems oi ON o.OrderID = oi.OrderID
WHERE YEAR(o.OrderDate) = YEAR(CURDATE())
GROUP BY YEAR(o.OrderDate), MONTH(o.OrderDate) WITH ROLLUP;


-- 7.Display the growth in sales/services (as a percentage) for your business, from the 1st month of opening until now. 

WITH MonthlySales AS (
    SELECT
        YEAR(OrderDate) AS OrderYear,
        MONTH(OrderDate) AS OrderMonth,
        SUM(oi.PriceAtOrder * oi.QuantityOrdered) AS TotalSalesAmount
    FROM
        Orders o
    JOIN
        OrderItems oi ON o.OrderID = oi.OrderID
    GROUP BY
        OrderYear,
        OrderMonth
    ORDER BY
        OrderYear,
        OrderMonth
)
SELECT
    OrderYear,
    OrderMonth,
    TotalSalesAmount,
    ROUND(
        (TotalSalesAmount - LAG(TotalSalesAmount, 1, 0) OVER (ORDER BY OrderYear, OrderMonth)) / 
        LAG(TotalSalesAmount, 1, 0) OVER (ORDER BY OrderYear, OrderMonth) * 100,
        2
    ) AS GrowthPercentage
FROM
    MonthlySales;
    
    
-- 8. Display all returns to date.

    SELECT  * FROM Returns;
    
--     Creating  HomeHarborDataMart 

CREATE DATABASE HomeHarborDM;

USE HomeHarborDM;

-- Adding Views from  (Questions 1, 3 and 4 ONLY) to HomeHarbor DataMart

Create Table HomeHarborDM.weeklytransactions SELECT * FROM HomeHarbor.weeklytransactions;

Create Table HomeHarborDM.businesspurchasedstock SELECT * FROM HomeHarbor.businesspurchasedstock;

Create Table HomeHarborDM.totalstocksoldbysupplier SELECT * FROM HomeHarbor.totalstocksoldbysupplier;
