INSERT INTO Book VALUES('96-42013-10510', 'Growing Your Own Weeds', 10000, '2012-06-24');
INSERT INTO Located VALUES (55, '96-42013-10510', 'Main', 1, 8, 2, 1);
UPDATE Located SET copies=8 WHERE isbn='96-42103-10907' AND location='Main';
DELETE FROM Author AS a WHERE a.first_name = 'Grace' AND a.last_name = 'Slick';
INSERT INTO Author VALUES (305, 'Commander', 'Adams');
INSERT INTO Contact VALUES ('970-555-5555', '(o)');
INSERT INTO AuthListing VALUES (22, 305, '970-555-5555');
DELETE l
    FROM Located as l
    INNER JOIN Book as b ON l.isbn = b.isbn
    WHERE b.title = 'Missing Tomorrow' AND l.location = 'Main';

UPDATE Located
    INNER JOIN Book ON Located.isbn = Book.isbn
    SET Located.copies = 4
    WHERE Book.title = "Eating in the Fort" AND Located.location = 'South Park';

SELECT * FROM Log;