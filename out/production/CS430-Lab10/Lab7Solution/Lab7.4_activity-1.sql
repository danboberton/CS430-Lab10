-- 1. Add a new book to the Main library, ISBN # 96-42013-10510, shelf 8, floor 2, Title Growing your own Weeds, published by pubid 10000 on 6/24/2012. [3 points]

INSERT INTO book VALUES
('964201310510', 'Growing your own Weeds', 2012, 10000);
INSERT INTO library_book VALUES
('964201310510', 'Main', 2, 8, 1, 1);


-- 2.Modify the number of copied of ISBN 96-42103-10907 to 8 in the Main library. [4 points]

UPDATE library_book
SET copies_available = 8,
copies_total = 8
WHERE ISBN = '964210310907'
AND library_name = 'Main';

-- 3.Delete  Slick from the Author table. [3 points]

DELETE FROM author
WHERE first_name = 'Grace'
and last_name='Slick';

-- 4.Add Commander Adams to the author table, id 305, office phone 970-555-5555 [3 points]

INSERT INTO author VALUES
(305, 'Commander', 'Adams');

INSERT INTO phone VALUES
('9705555555', 'o');

INSERT INTO author_phone VALUES
(305, '9705555555');

-- 5.Add a new book to the South Park library, ISBN # 964201310510, shelf 8, floor 3, Title Growing your own Weeds, published by pubid 10000 on 6/24/2012. [3 points]

INSERT INTO library_book VALUES
('964201310510', 'South Park', 3, 8, 1, 1);

-- 6. Delete the book Missing Tomorrow from the Main Library. [4 points]

DELETE FROM library_book
WHERE ISBN = (select ISBN from book where title = 'Missing Tomorrow')
AND library_name = 'Main';

-- 7.Add 2 new copies of Eating in the Fort in the South Park library. [4 points]
UPDATE library_book
SET copies_available = copies_available + 2,
copies_total = copies_total + 2
WHERE ISBN = (select ISBN from book where title = 'Eating in the Fort')
AND library_name = 'South Park';

-- 8.Add a new book to the Main library, ISBN # 96-42013-10513, shelf 8, floor 2, Title Growing your own Weeds, published by pubid 90000 on 6/24/2012. [3 points]

INSERT INTO book VALUES
('964201310513', 'Growing your own Weeds', 2012, 90000);
INSERT INTO library_book VALUES
('964201310513', 'Main', 2, 8, 1, 1);

-- 9.Print the final contents of the Audit table. [3 points]
SELECT * FROM audit;


