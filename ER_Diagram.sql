
USE address_book;

-- Create Person Table
CREATE TABLE IF NOT EXISTS Person (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    name VARCHAR(100),
    type VARCHAR(50)
);

-- Create ContactDetails Table
CREATE TABLE IF NOT EXISTS ContactDetails (
    id INT AUTO_INCREMENT PRIMARY KEY,
    person_id INT,
    phone_number VARCHAR(20),
    email VARCHAR(100),
    FOREIGN KEY (person_id) REFERENCES Person(id)
);

-- Create Address Table
CREATE TABLE IF NOT EXISTS Address (
    address_id INT AUTO_INCREMENT PRIMARY KEY,
    person_id INT,
    address VARCHAR(255),
    city VARCHAR(50),
    state VARCHAR(50),
    zip VARCHAR(10),
    FOREIGN KEY (person_id) REFERENCES Person(id)
);


INSERT INTO Person (first_name, last_name, name, type)
VALUES 
('Rhaenyra', 'Targaryen',  'Family'),
('Daemon', 'Targaryen',  'Family'),
('Alicent', 'Hightower', 'Friends'),
('Aegon', 'Targaryen', 'Family'),
('Cregan', 'Stark',  'Friends'),
('Visenya', 'Targaryen', 'Family'),
('Aegor', 'Rivers',  'Friends'),
('Rhaella', 'Targaryen', 'Family');

INSERT INTO ContactDetails (person_id, phone_number, email)
VALUES 
(1, '555-1234', 'Syrax@dragon.com'),
(2, '555-78876', 'Caraxes@dragon.com'),
(3, '555-78286', 'Greens@flower.com'),
(4, '555-798286', 'Sunfyre@dragon.com'),
(5, '555-728286', 'NorthernerW@direwolf.com'),
(6, '555-6543', 'Vhagar@dragon.com'),
(7, '555-9876', 'Bittersteel@rivers.com'),
(8, '555-3456', 'Rhaella@dragon.com');

INSERT INTO Address (person_id, address, city, state, zip)
VALUES 
(1, 'DragonStone', 'Westoros', 'Crownlands', '12345'),
(2, 'DragonStone', 'Westoros', 'Crownlands', '86433'),
(3, 'OldTown', 'The Reach', 'HighGarden', '864322'),
(4, 'RedKeep', 'The Crownlands', 'KingsLanding', '868322'),
(5, 'Winterfell', 'The North', 'Westeros', '968322'),
(6, 'Dragonstone', 'King Landing', 'Crownlands', '54321'),
(7, 'Stone Hedge', 'Riverlands', 'Riverrun', '87654'),
(8, 'Summerhall', 'Stormlands', 'Storm End', '23456');


-- Updated query for Use Case 6
SELECT *
FROM Person p
JOIN Address a ON p.id = a.person_id
WHERE a.city = 'The Crownlands';


-- Updated query for Use Case 7
SELECT a.state, COUNT(*) AS state_size
FROM Person p
JOIN Address a ON p.id = a.person_id
GROUP BY a.state;

-- Updated query for Use Case 8
SELECT p.first_name, p.last_name, a.*
FROM Person p
JOIN Address a ON p.id = a.person_id
WHERE a.city = 'Westoros'
ORDER BY p.first_name, p.last_name;

-- Updated query for Use Case 10
SELECT p.type, COUNT(*) AS type_count
FROM Person p
GROUP BY p.type;
