Create and populate the tables from the data from lab7.


In JDBC program Lab9.java, read in and parse the activity file (Links to an external site.) in XML format. This file records checkins and checkouts. If the transaction is a checkin, simply update the corresponding record appropriately. If the transaction is a checkout, a new record is created.
Prepare and execute SQL statements inside your java program that insert this data into the appropriate relation tables.
Note: You should be able to find some Java code for parsing XML data online.
You are welcome to use this, as long as it works correctly. Here (Links to an external site.) is an example of one.



Everytime your program adds or modifies a record in a table, it should print an message to the screen to that effect. If an error is encountered, you should print a message to the screen to the specifics of the error and continue processing.


You will need to implement code to check that the book being checked out exists in the library, and that a book being checked in has a corresponding checkout record..


Once you have finished loading the data for the day's activities, run the following queries in SQL.
Print the contents of the Borrowed_by table.
For each member that has a book checked out (Last name, first name, member id), print a list of the book titles currently checked out and from which library.