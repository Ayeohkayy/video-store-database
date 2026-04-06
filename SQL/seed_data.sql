INSERT INTO Accounts (AccountID, AccountBalance) VALUES
(1,  0.00),   -- satisfied
(2,  4.98),   -- owes (2 rentals + small fees)
(3,  0.00),   -- satisfied
(4, -3.00),   -- credit (promo/overpayment)
(5,  18.47),  -- owes (late + damage)
(6,  0.00),   -- satisfied
(7,  2.49),   -- owes (small balance)
(8,  0.00),   -- satisfied
(9,  9.96),   -- owes
(10, 0.00),   -- satisfied
(11,-1.50),   -- credit
(12, 6.99),   -- owes
(13, 0.00),   -- satisfied
(14, 0.00),   -- satisfied
(15, 12.50),  -- owes
(16,-7.25),   -- credit (refund/adjustment)
(17, 0.00),   -- satisfied
(18, 3.75),   -- owes
(19, 0.00),   -- satisfied
(20, 24.99);  -- owes (big outstanding)

INSERT INTO Discounts (DiscountID, Discount) VALUES
(1,  0.00),   -- no discount
(2,  0.50),
(3,  0.75),   
(4,  1.00),
(5,  1.25),
(6,  1.50),
(7,  1.99),
(8,  2.00),
(9,  2.50),
(10, 2.99),
(11, 3.00),
(12, 3.50),
(13, 3.99),
(14, 4.00),
(15, 4.50),
(16, 4.99),
(17, 5.00),
(18, 6.00),
(19, 7.50),
(20, 10.00);  -- major promotion


INSERT INTO Taxes (TaxID, State, Tax) VALUES
(1,  'CA', 0.0725),  -- California
(2,  'NV', 0.0685),  -- Nevada
(3,  'AZ', 0.0560),  -- Arizona
(4,  'TX', 0.0625),  -- Texas
(5,  'FL', 0.0600),  -- Florida
(6,  'NY', 0.0400),  -- New York (state only)
(7,  'NJ', 0.0663),  -- New Jersey
(8,  'IL', 0.0625),  -- Illinois
(9,  'WA', 0.0650),  -- Washington
(10, 'OR', 0.0000),  -- Oregon (no sales tax)
(11, 'CO', 0.0290),  -- Colorado (state only)
(12, 'UT', 0.0485),  -- Utah
(13, 'GA', 0.0400),  -- Georgia
(14, 'NC', 0.0475),  -- North Carolina
(15, 'VA', 0.0430),  -- Virginia
(16, 'PA', 0.0600),  -- Pennsylvania
(17, 'OH', 0.0575),  -- Ohio
(18, 'MI', 0.0600),  -- Michigan
(19, 'MA', 0.0625),  -- Massachusetts
(20, 'TN', 0.0700);  -- Tennessee


INSERT INTO Distributors (DistributorID, Distributor) VALUES
(1,  'Warner Home Video'),
(2,  'Universal Studios Home Entertainment'),
(3,  'Sony Pictures Home Entertainment'),
(4,  'Paramount Home Media Distribution'),
(5,  '20th Century Fox Home Entertainment'),
(6,  'Lionsgate Home Entertainment'),
(7,  'MGM Home Entertainment'),
(8,  'Disney Home Entertainment'),
(9,  'A24 Distribution'),
(10, 'Criterion Collection'),
(11, 'Shout! Factory'),
(12, 'Anchor Bay Entertainment'),
(13, 'Image Entertainment'),
(14, 'Echo Bridge Home Entertainment'),
(15, 'Mill Creek Entertainment'),
(16, 'RLJ Entertainment'),
(17, 'Well Go USA Entertainment'),
(18, 'Oscilloscope Laboratories'),
(19, 'IFC Films Home Entertainment'),
(20, 'Kino Lorber');


INSERT INTO Format (FormatID, Format) VALUES
(1,  'VHS'),
(2,  'DVD'),
(3,  'Blu-ray'),
(4,  '4K UHD'),
(5,  'LaserDisc'),
(6,  'MiniDV'),
(7,  'Betamax'),
(8,  'HD DVD'),
(9,  'UMD'),
(10, 'Digital Copy'),
(11, 'Collector Edition DVD'),
(12, 'Collector Edition Blu-ray'),
(13, 'Steelbook Blu-ray'),
(14, 'Steelbook 4K'),
(15, 'Director''s Cut DVD'),
(16, 'Director''s Cut Blu-ray'),
(17, 'Extended Edition DVD'),
(18, 'Extended Edition Blu-ray'),
(19, 'Special Anniversary Edition'),
(20, 'Limited Release Format');


INSERT INTO Condition (ConditionID, Condition) VALUES
(1,  'New'),
(2,  'Like New'),
(3,  'Excellent'),
(4,  'Very Good'),
(5,  'Good'),
(6,  'Lightly Used'),
(7,  'Used'),
(8,  'Moderately Used'),
(9,  'Worn'),
(10, 'Heavily Worn'),
(11, 'Scratched'),
(12, 'Minor Damage'),
(13, 'Cosmetic Damage'),
(14, 'Case Damaged'),
(15, 'Label Faded'),
(16, 'Repairable'),
(17, 'Needs Cleaning'),
(18, 'Poor'),
(19, 'Unrentable'),
(20, 'Retired');


INSERT INTO Status (StatusID, Status) VALUES
(1,  'Available'),
(2,  'Rented'),
(3,  'Reserved'),
(4,  'Returned'),
(5,  'Late'),
(6,  'Overdue'),
(7,  'Damaged'),
(8,  'Missing'),
(9,  'Lost'),
(10, 'In Repair'),
(11, 'Under Inspection'),
(12, 'Awaiting Cleaning'),
(13, 'Awaiting Replacement'),
(14, 'On Hold'),
(15, 'Out of Service'),
(16, 'Retired'),
(17, 'Donated'),
(18, 'Sold'),
(19, 'Archived'),
(20, 'Removed from Inventory');


INSERT INTO Genres (GenreID, Genre, DiscountID) VALUES
(1,  'Action',        4),   -- $1.00 promo
(2,  'Comedy',        3),   -- $0.75 promo
(3,  'Drama',         NULL),
(4,  'Horror',        5),   -- $1.25 promo
(5,  'Thriller',      NULL),
(6,  'Mystery',       NULL),
(7,  'Romance',       2),   -- $0.50 promo
(8,  'Science Fiction', NULL),
(9,  'Fantasy',       NULL),
(10, 'Animation',     6),   -- $1.50 promo
(11, 'Documentary',   NULL),
(12, 'Crime',         NULL),
(13, 'Adventure',     4),   -- $1.00 promo
(14, 'Family',        3),   -- $0.75 promo
(15, 'Musical',       NULL),
(16, 'Western',       NULL),
(17, 'War',            NULL),
(18, 'Biography',     NULL),
(19, 'Sports',        5),   -- $1.25 promo
(20, 'Independent',   7);   -- $1.99 promo


INSERT INTO Directors (DirectorID, DirectorFirstName, DirectorLastName) VALUES
(1,  'Steven',  'Spielberg'),
(2,  'Christopher', 'Nolan'),
(3,  'Martin',  'Scorsese'),
(4,  'Quentin', 'Tarantino'),
(5,  'James',   'Cameron'),
(6,  'Ridley',  'Scott'),
(7,  'Francis', 'Coppola'),
(8,  'Peter',   'Jackson'),
(9,  'Alfred',  'Hitchcock'),
(10, 'Stanley', 'Kubrick'),
(11, 'David',   'Fincher'),
(12, 'Tim',     'Burton'),
(13, 'Clint',   'Eastwood'),
(14, 'Spike',   'Lee'),
(15, 'Greta',   'Gerwig'),
(16, 'Jordan',  'Peele'),
(17, 'Denis',   'Villeneuve'),
(18, 'Sofia',   'Coppola'),
(19, 'Ron',     'Howard'),
(20, 'Kathryn', 'Bigelow');


INSERT INTO Actors (ActorID, ActorFirstName, ActorLastName, Gender) VALUES
(1,  'Leonardo',  'DiCaprio', 'Male'),
(2,  'Meryl',     'Streep',   'Female'),
(3,  'Denzel',    'Washington','Male'),
(4,  'Scarlett',  'Johansson','Female'),
(5,  'Tom',       'Hanks',    'Male'),
(6,  'Natalie',   'Portman',  'Female'),
(7,  'Brad',      'Pitt',     'Male'),
(8,  'Angelina',  'Jolie',    'Female'),
(9,  'Morgan',    'Freeman',  'Male'),
(10, 'Jennifer',  'Lawrence', 'Female'),
(11, 'Robert',    'Downey',  'Male'),
(12, 'Charlize',  'Theron',   'Female'),
(13, 'Will',      'Smith',    'Male'),
(14, 'Emma',      'Stone',    'Female'),
(15, 'Christian', 'Bale',     'Male'),
(16, 'Anne',      'Hathaway', 'Female'),
(17, 'Samuel',    'Jackson',  'Male'),
(18, 'Viola',     'Davis',    'Female'),
(19, 'Ryan',      'Gosling',  'Male'),
(20, 'Cate',      'Blanchett','Female');


INSERT INTO AcademyAwards (AAwardsID, AcademyAward) VALUES
(1,  'Best Picture'),
(2,  'Best Director'),
(3,  'Best Actor'),
(4,  'Best Actress'),
(5,  'Best Supporting Actor'),
(6,  'Best Supporting Actress'),
(7,  'Best Original Screenplay'),
(8,  'Best Adapted Screenplay'),
(9,  'Best Cinematography'),
(10, 'Best Film Editing'),
(11, 'Best Visual Effects'),
(12, 'Best Original Score'),
(13, 'Best Original Song'),
(14, 'Best Production Design'),
(15, 'Best Costume Design'),
(16, 'Best Makeup and Hairstyling'),
(17, 'Best Sound'),
(18, 'Best Animated Feature'),
(19, 'Best Documentary Feature'),
(20, 'Best International Feature Film');


INSERT INTO Movies
(MovieID, Title, GenreID, DiscountID, Length, ReleaseYear, Rating, DirectorID)
VALUES
(1,  'Inception',              8,  NULL, 148, 2010, 'PG-13', 2),
(2,  'Jurassic Park',          1,  NULL, 127, 1993, 'PG-13', 1),
(3,  'Pulp Fiction',           12, NULL, 154, 1994, 'R',     4),
(4,  'The Dark Knight',        1,  7,    152, 2008, 'PG-13', 2),
(5,  'Titanic',                3,  NULL, 195, 1997, 'PG-13', 5),
(6,  'Forrest Gump',           3,  NULL, 142, 1994, 'PG-13', 19),
(7,  'The Matrix',             8,  6,    136, 1999, 'R',     17),
(8,  'Gladiator',              1,  NULL, 155, 2000, 'R',     6),
(9,  'Schindler''s List',      18, NULL, 195, 1993, 'R',     1),
(10, 'La La Land',             15, 3,    128, 2016, 'PG-13', NULL),
(11, 'Get Out',                4,  5,    104, 2017, 'R',     16),
(12, 'The Godfather',          12, NULL, 175, 1972, 'R',     7),
(13, 'Avatar',                 8,  NULL, 162, 2009, 'PG-13', 5),
(14, 'Fight Club',             5,  NULL, 139, 1999, 'R',     11),
(15, 'Toy Story',              10, 2,     81, 1995, 'G',     1),
(16, 'Black Panther',          1,  NULL, 134, 2018, 'PG-13', 20),
(17, 'The Shawshank Redemption',3, NULL, 142, 1994, 'R',     13),
(18, 'Parasite',               20, 7,    132, 2019, 'R',     NULL),
(19, 'Mad Max: Fury Road',     1,  NULL, 120, 2015, 'R',     6),
(20, 'Jaws',                   5,  NULL, 124, 1975, 'PG',    1);


INSERT INTO Catalog
(CatalogID, DistributorSerialNumber, DistributorID, MovieID, WholesalePrice, FormatID)
VALUES
(1,  'WHV-0001', 1,  1,  9.50, 2),
(2,  'WHV-0002', 1,  2,  8.95, 2),
(3,  'WHV-0003', 1, 15,  6.25, 2),
(4,  'UNI-0101', 2,  4, 10.25, 3),
(5,  'UNI-0102', 2,  6,  7.80, 2),
(6,  'SPH-0201', 3,  3,  5.25, 1),
(7,  'SPH-0202', 3, 14,  7.25, 2),
(8,  'PAR-0301', 4, 12,  4.90, 1),
(9,  'PAR-0302', 4,  8, 11.10, 3),
(10, 'FOX-0401', 5,  5,  9.95, 2),
(11, 'FOX-0402', 5, 20,  8.60, 2),
(12, 'LGT-0501', 6, 11,  8.10, 2),
(13, 'LGT-0502', 6, 19, 10.15, 3),
(14, 'MGM-0601', 7,  7,  8.40, 2),
(15, 'DIS-0701', 8,  8, 11.10, 3),
(16, 'DIS-0702', 8, 16, 14.25, 4),
(17, 'A24-0801', 9, 18, 11.40, 3),
(18, 'CRI-0901', 10, 10, 12.75, 3),
(19, 'SHF-1001', 11, 17,  7.95, 2),
(20, 'KLR-1101', 20,  9,  9.20, 2);


INSERT INTO Inventory
(InventoryID, CatalogID, ConditionID, StatusID, MovieID)
VALUES
(1,  1,  4, 1,  1),  -- Inception - Very Good - Available
(2,  1,  5, 2,  1),  -- Inception - Good - Rented
(3,  2,  3, 1,  2),  -- Jurassic Park - Excellent - Available
(4,  2,  6, 5,  2),  -- Jurassic Park - Lightly Used - Late
(5,  3,  7, 1, 15),  -- Toy Story - Used - Available
(6,  3,  8, 2, 15),  -- Toy Story - Moderately Used - Rented
(7,  4,  4, 1,  4),  -- The Dark Knight - Very Good - Available
(8,  4,  5, 6,  4),  -- The Dark Knight - Good - Overdue
(9,  5,  3, 1,  6),  -- Forrest Gump - Excellent - Available
(10, 5,  9, 7,  6),  -- Forrest Gump - Worn - Damaged
(11, 6, 10, 1,  3),  -- Pulp Fiction (VHS) - Heavily Worn - Available
(12, 7,  6, 2, 14),  -- Fight Club - Lightly Used - Rented
(13, 8, 12, 1, 12),  -- The Godfather (VHS) - Minor Damage - Available
(14, 9,  4, 1,  8),  -- Gladiator - Very Good - Available
(15,10,  5, 1,  5),  -- Titanic - Good - Available
(16,11, 11, 7, 20),  -- Jaws - Scratched - Damaged
(17,12,  4, 1, 11),  -- Get Out - Very Good - Available
(18,13,  6, 1, 19),  -- Mad Max: Fury Road - Lightly Used - Available
(19,16,  2, 2, 16),  -- Black Panther (4K) - Like New - Rented
(20,20,  4, 1,  9);  -- Schindler's List - Very Good - Available


INSERT INTO Customers
(CustomerID, AccountID, CxFirstName, CxLastName, StreetAddress, StreetAddress_2,
 City, State, ZipCode, PhoneNumber, Email)
VALUES
(1,  1,  'John',     'Smith',     '123 Main St',      NULL, 'Los Angeles', 'CA', '90001', '213-555-0101', 'john.smith@email.com'),
(2,  2,  'Emily',    'Johnson',   '456 Oak Ave',      'Apt 2', 'Las Vegas', 'NV', '89101', '702-555-0102', 'emily.johnson@email.com'),
(3,  3,  'Michael',  'Brown',     '789 Pine Rd',      NULL, 'Phoenix',     'AZ', '85001', '602-555-0103', 'michael.brown@email.com'),
(4,  4,  'Sarah',    'Davis',     '321 Maple St',     NULL, 'Dallas',      'TX', '75201', '214-555-0104', 'sarah.davis@email.com'),
(5,  5,  'David',    'Wilson',    '654 Cedar Blvd',   NULL, 'Orlando',     'FL', '32801', '407-555-0105', 'david.wilson@email.com'),
(6,  6,  'Jessica',  'Martinez',  '987 Birch Ln',     NULL, 'New York',    'NY', '10001', '212-555-0106', 'jessica.martinez@email.com'),
(7,  7,  'Daniel',   'Anderson',  '111 Elm St',       NULL, 'Trenton',     'NJ', '08608', '609-555-0107', 'daniel.anderson@email.com'),
(8,  8,  'Laura',    'Thomas',    '222 Spruce St',    'Unit B', 'Chicago',  'IL', '60601', '312-555-0108', 'laura.thomas@email.com'),
(9,  9,  'James',    'Taylor',    '333 Walnut Ave',   NULL, 'Seattle',     'WA', '98101', '206-555-0109', 'james.taylor@email.com'),
(10, 10, 'Amanda',   'Moore',     '444 Ash Ct',       NULL, 'Portland',    'OR', '97201', '503-555-0110', 'amanda.moore@email.com'),
(11, 11, 'Brian',    'Jackson',   '555 Poplar Dr',    NULL, 'Denver',      'CO', '80201', '303-555-0111', 'brian.jackson@email.com'),
(12, 12, 'Rachel',   'White',     '666 Redwood St',   NULL, 'Salt Lake City','UT','84101','801-555-0112','rachel.white@email.com'),
(13, 13, 'Kevin',    'Harris',    '777 Fir Way',      NULL, 'Atlanta',     'GA', '30301', '404-555-0113', 'kevin.harris@email.com'),
(14, 14, 'Nicole',   'Martin',    '888 Cypress Rd',   NULL, 'Raleigh',     'NC', '27601', '919-555-0114', 'nicole.martin@email.com'),
(15, 15, 'Christopher','Thompson','999 Palm St',      NULL, 'Richmond',    'VA', '23219', '804-555-0115', 'chris.thompson@email.com'),
(16, 16, 'Olivia',   'Garcia',    '101 Lake View',    NULL, 'Philadelphia','PA', '19103', '215-555-0116', 'olivia.garcia@email.com'),
(17, 17, 'Andrew',   'Martinez',  '202 River Rd',     NULL, 'Columbus',    'OH', '43215', '614-555-0117', 'andrew.martinez@email.com'),
(18, 18, 'Stephanie','Robinson',  '303 Hillcrest',    NULL, 'Detroit',     'MI', '48201', '313-555-0118', 'stephanie.robinson@email.com'),
(19, 19, 'Matthew',  'Clark',     '404 Sunset Blvd',  NULL, 'Boston',      'MA', '02108', '617-555-0119', 'matthew.clark@email.com'),
(20, 20, 'Lauren',   'Lewis',     '505 Sunrise Ave',  NULL, 'Nashville',   'TN', '37201', '615-555-0120', 'lauren.lewis@email.com');


INSERT INTO MovieActors (MovieActorID, MovieID, ActorID) VALUES
(1,  1,  1),   -- Inception - Leonardo DiCaprio
(2,  1,  16),  -- Inception - Anne Hathaway
(3,  2,  5),   -- Jurassic Park - Tom Hanks 
(4,  3,  7),   -- Pulp Fiction - Brad Pitt 
(5,  4,  15),  -- The Dark Knight - Christian Bale
(6,  4,  17),  -- The Dark Knight - Samuel Jackson 
(7,  5,  8),   -- Titanic - Angelina Jolie 
(8,  5,  1),   -- Titanic - Leonardo DiCaprio
(9,  6,  5),   -- Forrest Gump - Tom Hanks
(10, 7,  11),  -- The Matrix - Robert Downey Jr. 
(11, 8,  3),   -- Gladiator - Denzel Washington 
(12, 9,  9),   -- Schindler's List - Morgan Freeman 
(13, 10, 10),  -- La La Land - Jennifer Lawrence 
(14, 10, 19),  -- La La Land - Ryan Gosling
(15, 11, 13),  -- Get Out - Will Smith 
(16, 12, 3),   -- The Godfather - Denzel Washington 
(17, 13, 4),   -- Avatar - Scarlett Johansson 
(18, 14, 7),   -- Fight Club - Brad Pitt
(19, 15, 14),  -- Toy Story - Emma Stone 
(20, 16, 20);  -- Black Panther - Cate Blanchett 


INSERT INTO AAwardsMovie (AAwardsMovieID, AAwardsID, MovieID) VALUES
(1,  1,  9),   -- Best Picture - Schindler's List
(2,  2,  1),   -- Best Director - Inception
(3,  1,  12),  -- Best Picture - The Godfather
(4,  3,  5),   -- Best Actor - Titanic
(5,  4,  10),  -- Best Actress - La La Land
(6,  2,  4),   -- Best Director - The Dark Knight
(7,  11, 13),  -- Best Visual Effects - Avatar
(8,  1,  17),  -- Best Picture - Shawshank Redemption
(9,  18, 15),  -- Best Animated Feature - Toy Story
(10, 1,  18),  -- Best Picture - Parasite
(11, 12, 1),   -- Best Original Score - Inception
(12, 9,  19),  -- Best Cinematography - Mad Max: Fury Road
(13, 10, 14),  -- Best Film Editing - Fight Club
(14, 7,  3),   -- Best Original Screenplay - Pulp Fiction
(15, 8,  12),  -- Best Adapted Screenplay - The Godfather
(16, 16, 11),  -- Best Makeup - Get Out
(17, 17, 8),   -- Best Sound - Gladiator
(18, 14, 5),   -- Best Production Design - Titanic
(19, 15, 10),  -- Best Costume Design - La La Land
(20, 20, 18);  -- Best International Feature - Parasite


INSERT INTO AAwardsActor (AAwardsActorID, AAwardsID, ActorID) VALUES
(1,  3,  1),   -- Best Actor - Leonardo DiCaprio
(2,  4,  2),   -- Best Actress - Meryl Streep
(3,  3,  3),   -- Best Actor - Denzel Washington
(4,  4,  4),   -- Best Actress - Scarlett Johansson
(5,  3,  5),   -- Best Actor - Tom Hanks
(6,  4,  6),   -- Best Actress - Natalie Portman
(7,  3,  7),   -- Best Actor - Brad Pitt
(8,  4,  8),   -- Best Actress - Angelina Jolie
(9,  3,  9),   -- Best Actor - Morgan Freeman
(10, 4, 10),   -- Best Actress - Jennifer Lawrence
(11, 5, 11),   -- Best Supporting Actor - Robert Downey Jr.
(12, 6, 12),   -- Best Supporting Actress - Charlize Theron
(13, 5, 13),   -- Best Supporting Actor - Will Smith
(14, 6, 14),   -- Best Supporting Actress - Emma Stone
(15, 5, 15),   -- Best Supporting Actor - Christian Bale
(16, 6, 16),   -- Best Supporting Actress - Anne Hathaway
(17, 5, 17),   -- Best Supporting Actor - Samuel Jackson
(18, 6, 18),   -- Best Supporting Actress - Viola Davis
(19, 3, 19),   -- Best Actor - Ryan Gosling
(20, 4, 20);   -- Best Actress - Cate Blanchett


INSERT INTO AAwardsDirector (AAwardsDirectorID, AAwardsID, DirectorID) VALUES
(1,  2,  1),   -- Best Director - Steven Spielberg
(2,  2,  2),   -- Best Director - Christopher Nolan
(3,  2,  3),   -- Best Director - Martin Scorsese
(4,  2,  4),   -- Best Director - Quentin Tarantino
(5,  2,  5),   -- Best Director - James Cameron
(6,  9,  6),   -- Best Cinematography - Ridley Scott
(7,  1,  7),   -- Best Picture - Francis Coppola
(8,  1,  8),   -- Best Picture - Peter Jackson
(9,  2,  9),   -- Best Director - Alfred Hitchcock
(10, 2, 10),   -- Best Director - Stanley Kubrick
(11, 10, 11),  -- Best Film Editing - David Fincher
(12, 15, 12),  -- Best Costume Design - Tim Burton
(13, 2, 13),   -- Best Director - Clint Eastwood
(14, 2, 14),   -- Best Director - Spike Lee
(15, 2, 15),   -- Best Director - Greta Gerwig
(16, 2, 16),   -- Best Director - Jordan Peele
(17, 11, 17),  -- Best Visual Effects - Denis Villeneuve
(18, 14, 18),  -- Best Production Design - Sofia Coppola
(19, 2, 19),   -- Best Director - Ron Howard
(20, 2, 20);   -- Best Director - Kathryn Bigelow


INSERT INTO Rental (RentalID, CustomerID, RentalDate, DueDate, ReturnDate, TaxID) VALUES
(1,  1,  '2026-01-03 17:05:00', '2026-01-06 17:05:00', '2026-01-06 16:40:00', 1),   -- on time (CA)
(2,  2,  '2026-01-04 19:12:00', '2026-01-07 19:12:00', '2026-01-09 10:20:00', 2),   -- late (NV)
(3,  3,  '2026-01-05 14:30:00', '2026-01-08 14:30:00', '2026-01-08 13:55:00', 3),   -- on time (AZ)
(4,  4,  '2026-01-06 20:10:00', '2026-01-09 20:10:00', NULL,                  4),   -- not returned (TX)
(5,  5,  '2026-01-07 16:45:00', '2026-01-10 16:45:00', '2026-01-12 09:15:00', 5),   -- late (FL)
(6,  6,  '2026-01-08 18:05:00', '2026-01-11 18:05:00', '2026-01-11 17:50:00', 6),   -- on time (NY)
(7,  7,  '2026-01-09 13:20:00', '2026-01-12 13:20:00', '2026-01-13 11:05:00', 7),   -- late (NJ)
(8,  8,  '2026-01-10 15:55:00', '2026-01-13 15:55:00', '2026-01-13 15:40:00', 8),   -- on time (IL)
(9,  9,  '2026-01-11 12:10:00', '2026-01-14 12:10:00', '2026-01-16 18:30:00', 9),   -- late (WA)
(10, 10, '2026-01-12 11:25:00', '2026-01-15 11:25:00', '2026-01-15 10:50:00', 10),  -- on time (OR, 0% tax)
(11, 11, '2026-01-13 17:40:00', '2026-01-16 17:40:00', '2026-01-18 09:10:00', 11),  -- late (CO)
(12, 12, '2026-01-14 19:05:00', '2026-01-17 19:05:00', '2026-01-17 18:45:00', 12),  -- on time (UT)
(13, 13, '2026-01-15 16:20:00', '2026-01-18 16:20:00', NULL,                  13),  -- not returned (GA)
(14, 14, '2026-01-16 14:55:00', '2026-01-19 14:55:00', '2026-01-19 14:10:00', 14),  -- on time (NC)
(15, 15, '2026-01-17 20:30:00', '2026-01-20 20:30:00', '2026-01-22 08:05:00', 15),  -- late (VA)
(16, 16, '2026-01-18 13:45:00', '2026-01-21 13:45:00', '2026-01-21 12:50:00', 16),  -- on time (PA)
(17, 17, '2026-01-19 18:15:00', '2026-01-22 18:15:00', '2026-01-24 16:00:00', 17),  -- late (OH)
(18, 18, '2026-01-20 15:10:00', '2026-01-23 15:10:00', '2026-01-23 14:35:00', 18),  -- on time (MI)
(19, 19, '2026-01-21 12:05:00', '2026-01-24 12:05:00', NULL,                  19),  -- not returned (MA)
(20, 20, '2026-01-22 19:50:00', '2026-01-25 19:50:00', '2026-01-26 09:30:00', 20);  -- late (TN)


INSERT INTO RentalItem
(RentalItemID, RentalID, InventoryID, RentalPrice, DiscountID, DiscountAmount, LateFee, DamageFee, RewindFee, LineTotal)
VALUES
(1,  1,  1,  3.99, NULL, NULL, 0.00, 0.00, 0.00,  3.99),
(2,  2,  4,  3.99, 3,    0.75, 2.00, 0.00, 0.00,  5.24),  -- late
(3,  3,  3,  3.99, NULL, NULL, 0.00, 0.00, 0.00,  3.99),
(4,  4,  8,  4.49, NULL, NULL, 5.00, 0.00, 0.00,  9.49),  -- not returned/overdue
(5,  5,  10, 3.99, 2,    0.50, 2.50, 5.00, 0.00, 10.99),  -- late + damaged
(6,  6,  9,  3.99, NULL, NULL, 0.00, 0.00, 0.00,  3.99),
(7,  7,  12, 3.99, NULL, NULL, 1.50, 0.00, 0.00,  5.49),  -- late
(8,  8,  14, 4.49, 4,    1.00, 0.00, 0.00, 0.00,  3.49),
(9,  9,  2,  3.99, NULL, NULL, 3.00, 0.00, 0.00,  6.99),  -- late
(10, 10, 5,  3.99, 3,    0.75, 0.00, 0.00, 0.00,  3.24),
(11, 11, 6,  3.99, NULL, NULL, 2.00, 0.00, 0.00,  5.99),  -- late
(12, 12, 7,  4.49, 5,    1.25, 0.00, 0.00, 0.00,  3.24),
(13, 13, 17, 3.99, NULL, NULL, 5.00, 0.00, 0.00,  8.99),  -- not returned
(14, 14, 18, 4.49, 1,    0.00, 0.00, 0.00, 0.00,  4.49),
(15, 15, 16, 3.99, NULL, NULL, 2.00, 4.00, 0.00,  9.99),  -- late + damaged
(16, 16, 15, 3.99, 2,    0.50, 0.00, 0.00, 0.00,  3.49),
(17, 17, 13, 2.99, NULL, NULL, 2.50, 0.00, 1.00,  6.49),  -- late + rewind (VHS)
(18, 18, 11, 2.99, 2,    0.50, 0.00, 0.00, 1.00,  3.49),  -- rewind (VHS)
(19, 19, 19, 5.99, 7,    1.99, 5.00, 0.00, 0.00,  9.00),  -- not returned + discount
(20, 20, 20, 3.99, NULL, NULL, 1.50, 0.00, 0.00,  5.49);  -- late

