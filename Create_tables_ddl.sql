-- Johnson Video Store (FINAL) - PostgreSQL DDL
-- =========================
-- 1) TABLES WITH NO FKs
-- =========================

CREATE TABLE Accounts (
  AccountID SERIAL PRIMARY KEY,
  AccountBalance NUMERIC(10,2) NOT NULL DEFAULT 0.00
);

CREATE TABLE Discounts (
  DiscountID SERIAL PRIMARY KEY,
  Discount NUMERIC(5,2) NOT NULL
);

CREATE TABLE Taxes (
  TaxID SERIAL PRIMARY KEY,
  State CHAR(2) NOT NULL,
  Tax NUMERIC(5,2) NOT NULL
);

CREATE TABLE Distributors (
  DistributorID SERIAL PRIMARY KEY,
  Distributor VARCHAR(120) NOT NULL
);

CREATE TABLE Format (
  FormatID SERIAL PRIMARY KEY,
  Format VARCHAR(30) NOT NULL
);

CREATE TABLE Condition (
  ConditionID SERIAL PRIMARY KEY,
  Condition VARCHAR(30) NOT NULL
);

CREATE TABLE Status (
  StatusID SERIAL PRIMARY KEY,
  Status VARCHAR(30) NOT NULL
);

CREATE TABLE Directors (
  DirectorID SERIAL PRIMARY KEY,
  DirectorFirstName VARCHAR(50) NOT NULL,
  DirectorLastName VARCHAR(50) NOT NULL
);

CREATE TABLE Actors (
  ActorID SERIAL PRIMARY KEY,
  ActorFirstName VARCHAR(50) NOT NULL,
  ActorLastName VARCHAR(50) NOT NULL,
  Gender VARCHAR(10)
);

CREATE TABLE AcademyAwards (
  AAwardsID SERIAL PRIMARY KEY,
  AcademyAward VARCHAR(120) NOT NULL
);

-- =========================
-- 2) TABLES WITH FKs (MASTER)
-- =========================

CREATE TABLE Genres (
  GenreID SERIAL PRIMARY KEY,
  Genre VARCHAR(60) NOT NULL,
  DiscountID INT,
  FOREIGN KEY (DiscountID)
    REFERENCES Discounts(DiscountID)
    ON DELETE SET NULL
    ON UPDATE NO ACTION
);

CREATE TABLE Movies (
  MovieID SERIAL PRIMARY KEY,
  Title VARCHAR(200) NOT NULL,
  GenreID INT NOT NULL,
  DiscountID INT,
  Length INT,
  ReleaseYear INT,
  Rating VARCHAR(10),
  DirectorID INT,
  FOREIGN KEY (GenreID)
    REFERENCES Genres(GenreID)
    ON DELETE RESTRICT
    ON UPDATE NO ACTION,
  FOREIGN KEY (DiscountID)
    REFERENCES Discounts(DiscountID)
    ON DELETE SET NULL
    ON UPDATE NO ACTION,
  FOREIGN KEY (DirectorID)
    REFERENCES Directors(DirectorID)
    ON DELETE SET NULL
    ON UPDATE NO ACTION
);

-- =========================
-- 3) CATALOG + INVENTORY
-- =========================

CREATE TABLE Catalog (
  CatalogID SERIAL PRIMARY KEY,
  DistributorSerialNumber VARCHAR(50) UNIQUE NOT NULL,
  DistributorID INT NOT NULL,
  MovieID INT NOT NULL,
  WholesalePrice NUMERIC(8,2) NOT NULL,
  FormatID INT NOT NULL,
  FOREIGN KEY (DistributorID)
    REFERENCES Distributors(DistributorID)
    ON DELETE RESTRICT
    ON UPDATE NO ACTION,
  FOREIGN KEY (MovieID)
    REFERENCES Movies(MovieID)
    ON DELETE RESTRICT
    ON UPDATE NO ACTION,
  FOREIGN KEY (FormatID)
    REFERENCES Format(FormatID)
    ON DELETE RESTRICT
    ON UPDATE NO ACTION
);


CREATE TABLE Inventory (
  InventoryID SERIAL PRIMARY KEY,
  CatalogID INT NOT NULL,
  ConditionID INT NOT NULL,
  StatusID INT NOT NULL,
  MovieID INT NOT NULL,
  FOREIGN KEY (CatalogID)
    REFERENCES Catalog(CatalogID)
    ON DELETE RESTRICT
    ON UPDATE NO ACTION,
  FOREIGN KEY (ConditionID)
    REFERENCES Condition(ConditionID)
    ON DELETE RESTRICT
    ON UPDATE NO ACTION,
  FOREIGN KEY (StatusID)
    REFERENCES Status(StatusID)
    ON DELETE RESTRICT
    ON UPDATE NO ACTION,
  FOREIGN KEY (MovieID)
    REFERENCES Movies(MovieID)
    ON DELETE RESTRICT
    ON UPDATE NO ACTION
);

-- =========================
-- 4) BRIDGE TABLES (CASCADE)
-- =========================

CREATE TABLE MovieActors (
  MovieActorID SERIAL PRIMARY KEY,
  MovieID INT NOT NULL,
  ActorID INT NOT NULL,
  FOREIGN KEY (MovieID)
    REFERENCES Movies(MovieID)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  FOREIGN KEY (ActorID)
    REFERENCES Actors(ActorID)
    ON DELETE CASCADE
    ON UPDATE NO ACTION
);

CREATE TABLE AAwardsMovie (
  AAwardsMovieID SERIAL PRIMARY KEY,
  AAwardsID INT NOT NULL,
  MovieID INT NOT NULL,
  FOREIGN KEY (AAwardsID)
    REFERENCES AcademyAwards(AAwardsID)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  FOREIGN KEY (MovieID)
    REFERENCES Movies(MovieID)
    ON DELETE CASCADE
    ON UPDATE NO ACTION
);

CREATE TABLE AAwardsActor (
  AAwardsActorID SERIAL PRIMARY KEY,
  AAwardsID INT NOT NULL,
  ActorID INT NOT NULL,
  FOREIGN KEY (AAwardsID)
    REFERENCES AcademyAwards(AAwardsID)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  FOREIGN KEY (ActorID)
    REFERENCES Actors(ActorID)
    ON DELETE CASCADE
    ON UPDATE NO ACTION
);

CREATE TABLE AAwardsDirector (
  AAwardsDirectorID SERIAL PRIMARY KEY,
  AAwardsID INT NOT NULL,
  DirectorID INT NOT NULL,
  FOREIGN KEY (AAwardsID)
    REFERENCES AcademyAwards(AAwardsID)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  FOREIGN KEY (DirectorID)
    REFERENCES Directors(DirectorID)
    ON DELETE CASCADE
    ON UPDATE NO ACTION
);

-- =========================
-- 5) CUSTOMERS + RENTALS
-- =========================

CREATE TABLE Customers (
  CustomerID SERIAL PRIMARY KEY,
  AccountID INT NOT NULL UNIQUE,
  CxFirstName VARCHAR(50) NOT NULL,
  CxLastName VARCHAR(50) NOT NULL,
  StreetAddress VARCHAR(120) NOT NULL,
  StreetAddress_2 VARCHAR(120),
  City VARCHAR(60) NOT NULL,
  State CHAR(2) NOT NULL,
  ZipCode VARCHAR(10) NOT NULL,
  PhoneNumber VARCHAR(20),
  Email VARCHAR(120) UNIQUE,
  FOREIGN KEY (AccountID)
    REFERENCES Accounts(AccountID)
    ON DELETE RESTRICT
    ON UPDATE NO ACTION
);

CREATE TABLE Rental (
  RentalID SERIAL PRIMARY KEY,
  CustomerID INT NOT NULL,
  RentalDate DATE NOT NULL,
  DueDate DATE NOT NULL,
  ReturnDate DATE,
  TaxID INT NOT NULL,
  FOREIGN KEY (CustomerID)
    REFERENCES Customers(CustomerID)
    ON DELETE RESTRICT
    ON UPDATE NO ACTION,
  FOREIGN KEY (TaxID)
    REFERENCES Taxes(TaxID)
    ON DELETE RESTRICT
    ON UPDATE NO ACTION
);

CREATE TABLE RentalItem (
  RentalItemID SERIAL PRIMARY KEY,
  RentalID INT NOT NULL,
  InventoryID INT NOT NULL,
  RentalPrice NUMERIC(8,2) NOT NULL,
  DiscountID INT,
  DiscountAmount NUMERIC(8,2),
  LateFee NUMERIC(8,2),
  DamageFee NUMERIC(8,2),
  RewindFee NUMERIC(8,2),
  LineTotal NUMERIC(8,2) NOT NULL,
  FOREIGN KEY (RentalID)
    REFERENCES Rental(RentalID)
    ON DELETE RESTRICT
    ON UPDATE NO ACTION,
  FOREIGN KEY (InventoryID)
    REFERENCES Inventory(InventoryID)
    ON DELETE RESTRICT
    ON UPDATE NO ACTION,
  FOREIGN KEY (DiscountID)
    REFERENCES Discounts(DiscountID)
    ON DELETE SET NULL
    ON UPDATE NO ACTION
);



