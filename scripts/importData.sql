LOAD DATA LOCAL INFILE 'conformedData/Author_c.csv' INTO TABLE Author
    FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n';

LOAD DATA LOCAL INFILE 'conformedData/Members_c.csv' INTO TABLE Member
    FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n';

LOAD DATA LOCAL INFILE 'conformedData/Published_c.csv' INTO TABLE Publisher
    FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n';

LOAD DATA LOCAL INFILE 'conformedData/Book_c.csv' INTO TABLE Book
    FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n';

LOAD DATA LOCAL INFILE 'conformedData/Authored_c.csv' INTO TABLE Authored
    FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n'
    (@col1,@col2) SET author=@col1, book=@col2;

LOAD DATA LOCAL INFILE 'conformedData/Contact_c.csv' INTO TABLE Contact
    FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n';

LOAD DATA LOCAL INFILE 'conformedData/AuthList_c.csv' INTO TABLE AuthListing
    FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n';

LOAD DATA LOCAL INFILE 'conformedData/PubList_c.csv' INTO TABLE PubListing
    FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n';

LOAD DATA LOCAL INFILE 'conformedData/Library_c.csv' INTO TABLE Library
    FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n';

LOAD DATA LOCAL INFILE 'conformedData/Loc_cm.csv' INTO TABLE Located
    FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n';

LOAD DATA LOCAL INFILE 'conformedData/Borrow_c.csv' INTO TABLE Borrow
    FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n'
    (@col1,@col2,@col3,@col4) SET borrower=@col1, item=@col4, checkout=@col2, checkin=@col3;
