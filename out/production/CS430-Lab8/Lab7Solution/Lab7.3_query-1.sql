-- 5.1 List the contents of the Library relation in order according to name.
SELECT * FROM library ORDER BY library_name;

-- 5.2 List the contents of the Located at relation in alphabetic order according to ISBN.
55 rows in set (0.001 sec)
SELECT * FROM library_book ORDER BY ISBN;

-- 5.3 For each book that has copies in both libraries, list the book name, number of copies, and library sorted by book name.
48 rows in set (0.001 sec)

SELECT b.title, lb.copies_total, lb.library_name
FROM library_book lb, book b
WHERE lb.ISBN=b.ISBN
and b.ISBN IN
(SELECT ISBN FROM library_book GROUP BY ISBN HAVING COUNT(*) > 1)
ORDER BY b.title;

-- 5.4 For each library, list the number of titles sorted by library.
2 rows in set (0.001 sec)

SELECT library_name, COUNT(*) AS titles
FROM library_book
GROUP BY library_name
ORDER BY library_name;

-- 6
DROP TRIGGER IF EXISTS author_insert_trigger;
DROP TRIGGER IF EXISTS library_book_insert_trigger;
DROP TRIGGER IF EXISTS library_book_delete_trigger;
DROP TRIGGER IF EXISTS library_book_update_trigger;

CREATE TRIGGER author_insert_trigger
AFTER INSERT ON author
FOR EACH ROW
INSERT INTO audit (action) VALUES ('Added an author');

CREATE TRIGGER library_book_insert_trigger
AFTER INSERT ON library_book
FOR EACH ROW
INSERT INTO audit (action) VALUES ('Added a library_book');

CREATE TRIGGER library_book_delete_trigger
AFTER DELETE ON library_book
FOR EACH ROW
INSERT INTO audit (action) VALUES ('Deleted a library_book');

CREATE TRIGGER library_book_update_trigger
AFTER UPDATE ON library_book
FOR EACH ROW
INSERT INTO audit (action) VALUES ('Updated a library_book');

-- 7
DROP VIEW IF EXISTS book_author_library;
CREATE SQL SECURITY INVOKER VIEW book_author_library
AS SELECT title,
GROUP_CONCAT(first_name, ' ', last_name SEPARATOR ', ') AS authors,
library_name
FROM book b, author_book ab, author a, library_book lb
where ab.author_id = a.author_id
and ab.ISBN = b.ISBN
and lb.ISBN = b.ISBN
GROUP BY title, library_name;

55 rows in set (0.005 sec)

-- 8
SELECT a.title, a.authors, lb.shelf, a.library_name
FROM library_book lb, (
    SELECT bal.title, authors, library_name, ISBN
    FROM book_author_library AS bal, book AS b
    WHERE bal.title = b.title ) AS a
where lb.ISBN=a.ISBN
and lb.library_name = a.library_name
ORDER BY title;

SELECT a.title, a.authors, lb.shelf, a.library_name
FROM library_book lb, (
    SELECT bal.title, authors, library_name, ISBN
    FROM  AS bal, book AS b
    WHERE bal.title = b.title ) AS a
where lb.ISBN=a.ISBN
and lb.library_name = a.library_name
ORDER BY title;
