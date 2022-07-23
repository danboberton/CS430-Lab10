DROP TABLE Log;
DROP TRIGGER logAuthor;
DROP TRIGGER logBookIn;
DROP TRIGGER logBookOut;
DROP TRIGGER logBookCopies;

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

INSERT INTO Author (aid, first_name, last_name) VALUES (996, 'test1', 'test1');
INSERT INTO Book (isbn, title, publisher, date_published) VALUES ('96-42103-12345', 'test-title', 10007, '2022-07-09');
DELETE FROM Book WHERE isbn='96-42103-12345';
UPDATE Located SET copies=3 WHERE isbn='96-42103-11003';
UPDATE Located SET copies=2 WHERE isbn='96-42103-11003';

DELETE FROM Author WHERE aid=996;

SELECT * FROM Log;