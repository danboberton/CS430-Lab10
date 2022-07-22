SELECT lab7.*, GROUP_CONCAT(l.shelf)
FROM lab7, Located l, Book b
WHERE lab7.title=b.title AND b.isbn=l.isbn
GROUP BY lab7.title;