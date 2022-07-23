
CREATE SQL SECURITY INVOKER VIEW lab7 AS
SELECT b.title, GROUP_CONCAT(DISTINCT a.first_name, ' ',a.last_name), GROUP_CONCAT(DISTINCT lib.name)
FROM Author a, Book b, Authored ar, Library lib
WHERE b.isbn = ar.book AND ar.author = a.aid
GROUP BY b.title;

SELECT * FROM lab7;