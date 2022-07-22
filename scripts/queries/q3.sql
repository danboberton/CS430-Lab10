SELECT b.isbn, b.title, l.copies, lib.name
    FROM Book b, Located l, Library lib
    WHERE b.isbn=l.isbn AND l.location=lib.name AND l.isbn IN (
        SELECT l.isbn FROM Located as l
          GROUP BY l.isbn
          HAVING COUNT(*) > 1
              )
    ORDER BY b.title;