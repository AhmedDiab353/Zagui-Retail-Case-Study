CREATE TABLE Region
(
  RegionName INT NOT NULL,
  RegionalID INT NOT NULL,
  PRIMARY KEY (RegionalID)
);

CREATE TABLE Store
(
  StoreID INT NOT NULL,
  StoreZip INT NOT NULL,
  RegionalID INT NOT NULL,
  PRIMARY KEY (StoreID),
  FOREIGN KEY (RegionalID) REFERENCES Region(RegionalID)
);

CREATE TABLE Vendor
(
  VendorID INT NOT NULL,
  VendorName INT NOT NULL,
  PRIMARY KEY (VendorID)
);

CREATE TABLE Customer
(
  CustomerID INT NOT NULL,
  CustomerName INT NOT NULL,
  CustomerZip INT NOT NULL,
  PRIMARY KEY (CustomerID)
);

CREATE TABLE Category
(
  GategoryID INT NOT NULL,
  GategoryName INT NOT NULL,
  PRIMARY KEY (GategoryID)
);

CREATE TABLE Product
(
  ProductID INT NOT NULL,
  ProductPrice INT NOT NULL,
  ProductName INT NOT NULL,
  VendorID INT NOT NULL,
  GategoryID INT NOT NULL,
  PRIMARY KEY (ProductID),
  FOREIGN KEY (VendorID) REFERENCES Vendor(VendorID),
  FOREIGN KEY (GategoryID) REFERENCES Gategory(GategoryID)
);

CREATE TABLE SalesTransaction
(
  TID INT NOT NULL,
  TDate INT NOT NULL,
  StoreID INT NOT NULL,
  CustomerID INT NOT NULL,
  PRIMARY KEY (TID),
  FOREIGN KEY (StoreID) REFERENCES Store(StoreID),
  FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

CREATE TABLE SoldVia
(
  NoOFItems INT NOT NULL,
  ProductID INT NOT NULL,
  TID INT NOT NULL,
  PRIMARY KEY (ProductID, TID),
  FOREIGN KEY (ProductID) REFERENCES Product(ProductID),
  FOREIGN KEY (TID) REFERENCES SalesTransaction(TID)
);

INSERT INTO vendor VALUES ('PG','Pacifica Gear');
INSERT INTO vendor VALUES ('MK','Mountain King');
INSERT INTO Category VALUES ('CP','Camping');
INSERT INTO Category VALUES ('FW','Footwear');

INSERT INTO product VALUES ('1X1','Zzz Bag',100,'PG','CP');
INSERT INTO product VALUES ('2X2','Easy Boot',70,'MK','FW');
INSERT INTO product VALUES ('3X3','Cosy Sock',15,'MK','FW');
INSERT INTO product VALUES ('4X4','Dura Boot',90,'PG','FW');
INSERT INTO product VALUES ('5X5','Tiny Tent',150,'MK','CP');
INSERT INTO product VALUES ('6X6','Biggy Tent',250,'MK','CP');

INSERT INTO region VALUES ('C','Chicagoland');
INSERT INTO region VALUES ('T','Tristate');
INSERT INTO store VALUES ('S1','60600','C');
INSERT INTO store VALUES ('S2','60605','C');
INSERT INTO store VALUES ('S3','35400','T');

INSERT INTO customer VALUES ('1-2-333','Tina','60137');
INSERT INTO customer VALUES ('2-3-444','Tony','60611');
INSERT INTO customer VALUES ('3-4-555','Pam','35401');

INSERT INTO salestransaction VALUES ('T111','1-2-333','S1','01/Jan/2020');
INSERT INTO salestransaction VALUES ('T222','2-3-444','S2','01/Jan/2020');
INSERT INTO salestransaction VALUES ('T333','1-2-333','S3','02/Jan/2020');
INSERT INTO salestransaction VALUES ('T444','3-4-555','S3','02/Jan/2020');
INSERT INTO salestransaction VALUES ('T555','2-3-444','S3','02/Jan/2020');

INSERT INTO SoldVia VALUES ('1X1','T111',1);
INSERT INTO SoldVia VALUES ('2X2','T222',1);
INSERT INTO SoldVia VALUES ('3X3','T333',5);
INSERT INTO SoldVia VALUES ('1X1','T333',1);
INSERT INTO SoldVia VALUES ('4X4','T444',1);
INSERT INTO SoldVia VALUES ('2X2','T444',2);
INSERT INTO SoldVia VALUES ('4X4','T555',4);
INSERT INTO SoldVia VALUES ('5X5','T555',2);
INSERT INTO SoldVia VALUES ('6X6','T555',1);

SELECT VendorID, VendorName
FROM Vendor;

