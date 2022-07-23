DROP TABLE IF EXISTS publisher_phone, author_phone, Written, Rental, book, author, publisher, member, phone;


CREATE TABLE IF NOT EXISTS author (
	author_id 	INT		NOT NULL,
	first_name	VARCHAR(30) 	NOT NULL,
	last_name 	VARCHAR(30) 	NOT NULL,
	PRIMARY KEY (author_id)
);

CREATE TABLE IF NOT EXISTS publisher (
	publisher_id 		INT NOT NULL,
    publisher_name	VARCHAR(40),
	PRIMARY KEY (publisher_id)
);

CREATE TABLE IF NOT EXISTS book (
	ISBN		VARCHAR(14)	NOT NULL,
	title		VARCHAR(60)	NOT NULL,
	year VARCHAR(4) NOT NULL,
	publisher_id 		INT NOT NULL,
	FOREIGN KEY (publisher_id) REFERENCES publisher (publisher_id) ON DELETE CASCADE,
	PRIMARY KEY	(ISBN)
);

CREATE TABLE library (
    library_name VARCHAR(100) NOT NULL,
    street       VARCHAR(100) NOT NULL,
    city         VARCHAR(100) NOT NULL,
    state        CHAR(2)      NOT NULL,
    PRIMARY KEY (library_name)
);

CREATE TABLE IF NOT EXISTS member (
	member_id	INT NOT NULL,
	first_name	VARCHAR(30) NOT NULL,
	last_name 	VARCHAR(30) NOT NULL,
	DOB			DATE NOT NULL,
    gender     CHAR(1)      NOT NULL,
	PRIMARY KEY (member_id)
);

CREATE TABLE IF NOT EXISTS phone (
	phone_number		CHAR(10)	NOT NULL,
	type		CHAR(1)		NOT NULL,
	PRIMARY KEY	(phone_number)
);

CREATE TABLE library_book (
    ISBN             VARCHAR(17)  NOT NULL,
    library_name     VARCHAR(100) NOT NULL,
    floor            INT          NOT NULL,
    shelf            INT          NOT NULL,
    copies_available INT          NOT NULL,
    copies_total     INT          NOT NULL,
    PRIMARY KEY (ISBN, library_name),
    FOREIGN KEY (ISBN) REFERENCES book (ISBN),
    FOREIGN KEY (library_name) REFERENCES library (library_name)
);


CREATE TABLE IF NOT EXISTS borrowed (
	member_id	INT NOT NULL,
	ISBN		VARCHAR(30) NOT NULL,
    library_name  VARCHAR(100) NOT NULL,
	checkout_date DATE NOT NULL,
	checkin_date DATE,
    PRIMARY KEY (member_id, ISBN, library_name, checkout_date),
	FOREIGN KEY (member_id) REFERENCES member (member_id) ON DELETE CASCADE,
	FOREIGN KEY (ISBN) REFERENCES book (ISBN) ON DELETE CASCADE,
    FOREIGN KEY (library_name) REFERENCES library (library_name)
    
);

CREATE TABLE IF NOT EXISTS author_book (
	author_id 	INT		NOT NULL,
	ISBN		VARCHAR(13)	NOT NULL,
	FOREIGN KEY (author_id) REFERENCES author (author_id) ON DELETE CASCADE,
	FOREIGN KEY (ISBN) REFERENCES book (ISBN) ON DELETE CASCADE,
	PRIMARY KEY (author_id, ISBN)
);

CREATE TABLE IF NOT EXISTS author_phone (
	author_id 	INT		NOT NULL,
	phone_number		CHAR(10)	NOT NULL,
	FOREIGN KEY (author_id) REFERENCES author (author_id) ON DELETE CASCADE,
	FOREIGN KEY (phone_number) REFERENCES phone (phone_number) ON DELETE CASCADE,
	PRIMARY KEY (author_id, phone_number)
);

CREATE TABLE IF NOT EXISTS publisher_phone (
	publisher_id 	INT		NOT NULL,
	phone_number		CHAR(10)	NOT NULL,
	FOREIGN KEY (publisher_id) REFERENCES publisher (publisher_id) ON DELETE CASCADE,
	FOREIGN KEY (phone_number) REFERENCES phone (phone_number) ON DELETE CASCADE,
	PRIMARY KEY (publisher_id, phone_number)
);

/* Create the log table for the triggers */

CREATE TABLE audit (
    audit_id INT          NOT NULL AUTO_INCREMENT,
    action    VARCHAR(100) NOT NULL,
    date_time TIMESTAMP    NOT NULL,
    PRIMARY KEY (audit_id)
);
