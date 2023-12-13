
-- USE CASE 1: Ability to create a Address Book Service DB

CREATE DATABASE IF NOT EXISTS address_book;

USE address_book;


-- USE CASE 2: Ability to create a Address Book Table with first and last names, address, city, state, zip, phone number and email as its attributes

CREATE TABLE IF NOT EXISTS address_book (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    address VARCHAR(255),
    city VARCHAR(50),
    state VARCHAR(50),
    zip VARCHAR(10),
    phone_number VARCHAR(20),
    email VARCHAR(100)
);

SELECT * from address_book;

-- USE CASE-3: Ability to insert new Contacts person 

INSERT INTO address_book (first_name, last_name, address, city, state, zip, phone_number, email)
VALUES 
('Rhaenyra', 'Targaryen', 'DragonStone', 'Westoros', 'Crownlands', 12345, '555-1234', 'Syrax@dragon.com'),
('Daemon', 'Targaryen', 'DragonStone', 'Westoros', 'Crownlands', 86433, '555-78876', 'Caraxes@dragon.com'),
('Alicent' ,'Hightower', 'OldTown', 'The Reach', 'HighGarden', 864322, '555-78286', 'Greens@flower.com'),
('Aegon' ,'Targaryen', 'RedKeep', 'The Crownlands', 'KingsLanding', 868322, '555-798286', 'Sunfyre@dragon.com'),
('Cregan' ,'Stark', 'Winterfell', 'The North', 'Westeros', 968322, '555-728286', 'NorthernerW@direwolf.com'),
('Visenya', 'Targaryen', 'Dragonstone', 'King Landing', 'Crownlands', 54321, 555-6543, 'Vhagar@dragon.com'),
('Aegor', 'Rivers', 'Stone Hedge', 'Riverlands', 'Riverrun', 87654, '555-9876', 'Bittersteel@rivers.com'),
('Rhaella', 'Targaryen', 'Summerhall', 'Stormlands', 'Storm End', 23456, '555-3456', 'Rhaella@dragon.com');

   
-- USE CASE-4: Ability to edit existing contact person using their name

SET SQL_SAFE_UPDATES = 0;
UPDATE address_book
SET address = 'KingsLanding',
    city = 'Westoros'
WHERE first_name = 'Rhaenyra' AND last_name = 'Targaryen';


-- USE CASE 5: Ability to delete a person using person's name

DELETE FROM address_book
WHERE first_name = 'Rhaenyra' AND last_name = 'Targaryen';


-- USE CASE 6: Ability to Retrieve Person belonging to a City or State from the Address Book
SELECT *
FROM address_book
WHERE city = 'The Crownlands';

-- USE CASE 7 : Ability to understand the size of address book by City and State
SELECT state, COUNT(*) AS state_size
FROM address_book
GROUP BY state;


-- USE CASE 8: Ability to retrieve entries sorted alphabetically by Person’s name for a given city
SELECT *
FROM address_book
WHERE city = 'Westoros'
ORDER BY first_name, last_name;

-- USE CASE 9: Ability to identify each Address Book with name and Type.

ALTER TABLE address_book
ADD COLUMN name VARCHAR(100),
ADD COLUMN type VARCHAR(50);


UPDATE address_book
SET name = 'Daemon Targaryen', type = 'Family'
WHERE first_name = 'Daemon' AND last_name = 'Targaryen';

UPDATE address_book
SET name = 'Alicent Hightower', type = 'Friends'
WHERE first_name = 'Alicent' AND last_name = 'Hightower';

UPDATE address_book
SET name = 'Aegon Targaryen', type = 'Family'
WHERE first_name = 'Aegon' AND last_name = 'Targaryen';

UPDATE address_book
SET name = 'Cregan Stark', type = 'Friends'
WHERE first_name = 'Cregan' AND last_name = 'Stark';

UPDATE address_book
SET name = 'Visenya Targaryen', type = 'Family'
WHERE first_name = 'Visenya' AND last_name = 'Targaryen';

UPDATE address_book
SET name = 'Aegor Rivers', type = 'Friends'
WHERE first_name = 'Aegor' AND last_name = 'Rivers';

UPDATE address_book
SET name = 'Rhaella Targaryen', type = 'Family'
WHERE first_name = 'Rhaella' AND last_name = 'Targaryen';


-- USE CASE-10 :Ability to get number of contact persons i.e. count by type
SELECT type, COUNT(*) AS type_count
FROM address_book
GROUP BY type;




