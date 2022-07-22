SELECT * FROM Library
    ORDER BY name ASC;

SELECT * FROM Located
    ORDER BY isbn ASC;

SELECT b.isbn, b.title, l.copies, lib.name
    FROM Book b, Located l, Library lib
    WHERE b.isbn=l.isbn AND l.location=lib.name AND l.isbn IN (
    SELECT l.isbn FROM Located as l
    GROUP BY l.isbn
    HAVING COUNT(*) > 1
    )
    ORDER BY b.title;

SELECT lib.name, COUNT(*)
FROM Library as lib, Located as loc
WHERE lib.name = loc.location
GROUP BY lib.name;

CREATE TABLE Log(
    `action` varchar(75),
    `stamp` datetime,
    `key` int PRIMARY KEY NOT NULL AUTO_INCREMENT
);

DELIMITER |
CREATE TRIGGER logAuthor
    AFTER INSERT ON Author
    FOR EACH ROW
    BEGIN
        INSERT INTO Log (action, stamp) VALUES ('insert Author', NOW());
    END;|
CREATE TRIGGER logBookIn
    AFTER INSERT ON Book
    FOR EACH ROW
    BEGIN
        INSERT INTO Log (action, stamp) VALUES ('insert Book', NOW());
    END;|
CREATE TRIGGER logBookOut
    AFTER DELETE ON Book
    FOR EACH ROW
    BEGIN
        INSERT INTO Log (action, stamp) VALUES ('delete Book', NOW());
    END;|
CREATE TRIGGER logBookCopies
    AFTER UPDATE ON Located
    FOR EACH ROW
    BEGIN
    IF !(NEW.copies <=> OLD.copies) THEN
        INSERT INTO Log (action, stamp) VALUES ('changed num Copies', NOW());
        END IF;
    END;|

DELIMITER ;

CREATE SQL SECURITY INVOKER VIEW lab7 AS
SELECT b.title, GROUP_CONCAT(DISTINCT a.first_name, ' ',a.last_name), GROUP_CONCAT(DISTINCT lib.name)
FROM Author a, Book b, Authored ar, Library lib
WHERE b.isbn = ar.book AND ar.author = a.aid
GROUP BY b.title;

SELECT * FROM lab7;

SELECT lab7.*, GROUP_CONCAT(l.shelf)
FROM lab7, Located l, Book b
WHERE lab7.title=b.title AND b.isbn=l.isbn
GROUP BY lab7.title;