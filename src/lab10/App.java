package lab10;

import lab10.exceptions.QueryException;
import org.jdom2.input.SAXBuilder;
import org.jdom2.*;
import lab10.dataTypes.*;

import java.sql.ResultSetMetaData;


import java.io.*;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Iterator;

import javax.swing.*;


public class App {
    // Database Table Names
    final String TMember = "member";
    final String TBook = "book";
    final String TBorrow = "borrowed";
    final String TPublisher = "publisher";
    final String TPhone = "phone";
    final String TAuthors = "author";
    final String TAutherList = "author_phone";
    final String TPublisherList = "publisher_phone";
    final String TWrittenBy = "author_book";
    final String TLibrary = "library";
    final String TLibBook = "library_book";
    final String TAudit = "audit";

    private boolean verbose;
    private dbConnection db;
    private final String[] args;
    String data = null;
    private int index = 0;

    public App(dbConnection db, String[] args, boolean verbose){
        this.db = db;
         this.args = args;
        this.verbose = verbose;

//        this.runXML();
        this.runLab10();

    }

    private void runLab10() {
        String member_ID;
        String ISBN = null;
        String library = null;
        boolean completedRunLoop = false;

        JOptionPane.showMessageDialog (null,
                "CS430 Lab 10 Library Book Availability\n Dan Butcher");

        while (!completedRunLoop){

            boolean completedMemberLoop = false;
            while(!completedMemberLoop){
                if ((member_ID = getValidMemberID()) != null){
                    // Got valid ID
                    completedMemberLoop = true;
                    JOptionPane.showMessageDialog(null, "MemberID Found!");
                } else {
                    // Window create new member ID or try memberID again
                    createNewMemberID();
                    completedMemberLoop = true;
                }
            } // End Member Loop

            boolean completedCheckoutLoop = false;
            while (!completedCheckoutLoop){
                if ((ISBN = getBook()) != null) {
                    completedCheckoutLoop = true;
                    // Found book
                } else {
                    // didn't find book
                }
            } //End Checkout Loop

            displayBookLocations();

            completedRunLoop = promptRunAgain();

        }

    }

    private boolean promptRunAgain() {
        // RUN again?
        return false;
    }

    private void displayBookLocations() {
        // If either library has the book and there are copies available
        // the program should print a message telling the member what library and shelf the book is on
        // (there may be more than one).
        // If either library has the book and all copies are checked out, the program should
        // print a message to the member that all copies are currently checked out.
    }
    // adapted from https://stackoverflow.com/questions/6555040/multiple-input-in-joptionpane-showinputdialog
    // TODO create memberID
    private boolean createNewMemberID() {
        int memberID;
        String first_name, last_name, DOB, gender = null;
        JOptionPane.showMessageDialog(null, "Let's create a new Member ID for you.");

        JTextField fname_field = new JTextField(50);
        JTextField lname_field = new JTextField(50);
        JTextField dob_field = new JTextField(50);
        JTextField gender_field = new JTextField(50);

        JPanel addMemberPanel = new JPanel();
        addMemberPanel.setLayout(new BoxLayout(addMemberPanel, BoxLayout.Y_AXIS));
        addMemberPanel.add(new JLabel("Please enter your information."));
        addMemberPanel.add(Box.createHorizontalStrut(50));
        addMemberPanel.add(new JLabel("First Name:"));
        addMemberPanel.add(fname_field);
        addMemberPanel.add(new JLabel("Last Name:"));
        addMemberPanel.add(lname_field);
        addMemberPanel.add(new JLabel("Date of Birth (yyyy-mm-dd):"));
        addMemberPanel.add(dob_field);
        addMemberPanel.add(new JLabel("Gender (m/f/o):"));
        addMemberPanel.add(gender_field);

        int result = JOptionPane.showConfirmDialog(null, addMemberPanel,
                "Please Enter Member information", JOptionPane.OK_CANCEL_OPTION);
        if (result == JOptionPane.OK_OPTION) {
            memberID = getNextMemberID();
            first_name = fname_field.getText();
            last_name = lname_field.getText();
            DOB = dob_field.getText();
            gender = gender_field.getText();

        String newMember = String.format("INSERT INTO member " +
                "VALUES (%s, \"%s\", \"%s\", \"%s\", \"%s\");", memberID, first_name, last_name, DOB, gender);

        db.statement(newMember);

            if (!isValidMemberID(String.valueOf(memberID))){
                JOptionPane.showMessageDialog(null, "Sorry, member not created.");
                return false;
            } else {
                JOptionPane.showMessageDialog(null, "Member Created.");
                return true;
            }
        }
        return false;
    }

    private int getNextMemberID() {
        String query = String.format("SELECT * FROM member " +
                "ORDER BY member_id DESC;");
        ResultSet results = db.query(query);
        try {
            results.next();
            int largestID = Integer.parseInt(results.getString("member_id"));
            return largestID + 1;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    // TODO get book
    private String getBook() {

        JPanel panel = new JPanel();
        panel.setLayout(new BoxLayout(panel, BoxLayout.Y_AXIS));
        ButtonGroup radioSelect = new ButtonGroup();
        JRadioButton b_isbn = new JRadioButton("ISBN");
        JRadioButton b_author = new JRadioButton("Author");
        JRadioButton b_title = new JRadioButton("Book Title");
        b_title.setSelected(true);
        radioSelect.add(b_isbn);
        radioSelect.add(b_author);
        radioSelect.add(b_title);

        JTextField searchField = new JTextField(50);

        panel.add(new JLabel("Search book by ISBN, Author, or Title:"));
        panel.add(Box.createHorizontalStrut(50));
        panel.add(b_isbn);
        panel.add(b_author);
        panel.add(b_title);
        panel.add(Box.createHorizontalStrut(50));
        panel.add(new JLabel("Search:"));
        panel.add(searchField);

        int result = JOptionPane.showConfirmDialog(null, panel,
                "Book Search", JOptionPane.OK_CANCEL_OPTION);
        if (result == JOptionPane.OK_OPTION) {
            ButtonModel selection = radioSelect.getSelection();
            if (selection.equals(b_isbn)){
                System.out.println("Blah");
            }

        }








        // Find by isbn, name (partial, allow user to select duplicates
        // author (allow select from list)
        // return null if book not found
        return null;
    }

    private String getValidMemberID() {
        String inputID;
        inputID = JOptionPane.showInputDialog("Please enter your member ID.").trim();

        if (isValidMemberID(inputID)){
            return inputID;
        }

        JOptionPane.showMessageDialog(null, "Member ID " + inputID + " not found.");
        return null;
    }

    private boolean isValidMemberID(String inputID) {
        String query = String.format("SELECT member_id from member " +
                "WHERE member_id = %s", inputID);

        ResultSet results = db.query(query);
        try {
            while (results.next()) {
                if (results.getString("member_id").equals(inputID)){
                    System.out.printf("Found memberID: %s .\n", inputID);
                    return true;
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        System.out.printf("Failed to find memberID: %s .\n", inputID);
        return false;
    }

    private void runXML(){
        parseXML parser = new parseXML();

        File inputFile = new File(args[0]);
        SAXBuilder saxBuilder = new SAXBuilder();
        Document xml = null;
        try {
            xml = saxBuilder.build(inputFile);
        } catch (JDOMException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

        System.out.println("\n*** Running XML ***");
        recurseElement(xml.getRootElement(), null);
        System.out.println("\n*** Running XML Completed ***");
        System.out.printf("\n*** Printing Table %s ***\n\n", TBorrow);
        this.printTable(TBorrow);
        System.out.println("\n*** Printing Checked Out Books ***\n");
        this.printCheckedOut();

    }

    private void printCheckedOut() {
        String query = String.format("SELECT DISTINCT m.member_id, m.first_name, m.last_name, b.title, lb.library_name " +
                "FROM member AS m " +
                "INNER JOIN borrowed as bor ON m.member_id = bor.member_id " +
                "INNER JOIN book as b ON b.ISBN = bor.ISBN " +
                "INNER JOIN library_book as lb ON bor.library_name = lb.library_name " +
                "WHERE bor.checkin_date IS NULL;");
        ResultSet results = db.query(query);
        try {
            while (results.next()) {
                String fname = results.getString("first_name");
                String lname = results.getString("last_name");
                String mID = results.getString("member_id");
                String title = results.getString("title");
                String lib = results.getString("library_name");
                System.out.printf("[%s, %s ID: %s] has \"%s\" checked out from %s.\n", lname, fname, mID, title, lib);
            }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
    }

    private void printTable(String table) {
        String query = String.format("SELECT * FROM %s;", table);
        ResultSet results = db.query(query);
        try {
            ResultSetMetaData metaData = results.getMetaData();
            int columnsNumber = metaData.getColumnCount();
            String columnNames[] = new String[columnsNumber];

            for (int i = 1; i <= columnsNumber; i++){
                String name = metaData.getColumnName(i);
                System.out.print(name + "|");
                columnNames[i-1] = name;
            }
            System.out.println();

            while(results.next()){
                for(int i =1; i <= columnsNumber; i++){
                    System.out.print(results.getString(i) + "|");
                }
                System.out.println();
            }
        } catch (SQLException e) {
            System.out.println("<xxx> ERROR (printTable) printing table");;
        }
    }

    // Make recursive!!
    private void recurseElement(Element root, absData buildObject) {
        for (Iterator node = root.getContent().iterator(); node.hasNext();) {
            Content content = (Content) node.next();
            if (content instanceof Text){

            } else if (content instanceof Element) {

                // Type of Element
                String elementType = ((Element) content).getName();
                switch (elementType){
                    case "activities" :
                        recurseElement((Element)content, null);
                        break;
                    case "Borrowed_by" :
                        Borrowed_by borrow = new Borrowed_by();
                        recurseElement((Element) content, borrow);
                        this.runBorrow(borrow);
                        break;
                    case "MemberID":
                        ((Borrowed_by)buildObject).MemberID = Integer.parseInt(getLeaf((Element) content));
                        break;
                    case "ISBN":
                        ((Borrowed_by)buildObject).isbn = getLeaf((Element) content).replaceAll("-", "");
                        break;
                    case "Library":
                        ((Borrowed_by)buildObject).library = getLeaf((Element) content);
                        break;
                    case "Checkout_date":
                        ((Borrowed_by)buildObject).co_date = getLeaf((Element) content);
                        break;
                    case "Checkin_date":
                        ((Borrowed_by)buildObject).cin_date = getLeaf((Element) content);
                        break;
                    default:
                        System.out.println("<xxx> Invalid Case");
                }

            }
            else if (content instanceof Comment){
                String comment = ((Comment)content).getText();
                System.out.println("[COMMENT] " + comment);
            }
            else {
                System.out.println("<xxx> Weird type content");
            }

        }
    }

    private String getLeaf(Element content) {
        return ((Text) content.getContent().get(0)).getText().replaceAll(" ", "");
    }


    private void runBorrow(Borrowed_by borrow) {
        System.out.printf("\n(%d)[Processing Item]\n", this.index++);
        if (verbose){
            System.out.println(borrow);
        }
        if (borrow.co_date.equals("N/A")){
            borrow.cin_date = Util.conformDate(borrow.cin_date);
            runCheckin(borrow);
        } else if (borrow.cin_date.equals("N/A")){
            borrow .co_date = Util.conformDate(borrow.co_date);
            runCheckout(borrow);
        } else {
            System.out.println("<xxx> not checkin or check out");
        }
    }

    private void runCheckin(Borrowed_by borrow) {
        if (verrifyCheckin(borrow)){
            try {
                String queryLib = String.format(
                        "SELECT ISBN, library_name, copies_available, copies_total " +
                                "FROM %s " +
                                "WHERE ISBN = \"%s\" " +
                                "AND library_name = \"%s\";",
                        TLibBook, borrow.isbn, borrow.library);
                ResultSet queryAvail = db.query(queryLib);
                // ISBN and library_name are primary key, only 1 result
                queryAvail.next();
                int availableCopies = Integer.parseInt(queryAvail.getString("copies_available"));

                String updateLibBook = String.format("UPDATE %s " +
                        "SET %s.copies_available = %d " +
                        "WHERE ISBN = \"%s\" " +
                        "AND library_name = \"%s\";\n", TLibBook, TLibBook, (availableCopies + 1), borrow.isbn, borrow.library);
                String updateBorrow = String.format("UPDATE %s " +
                        "SET %s.checkin_date = \"%s\" " +
                        "WHERE ISBN = \"%s\" " +
                        "AND member_id = %s " +
                        "AND library_name = \"%s\" " +
                        "AND checkin_date is NULL;\n",
                        TBorrow, TBorrow, borrow.cin_date, borrow.isbn, borrow.MemberID, borrow.library);

                String atomicCheckout = "START TRANSACTION;\n" +
                        updateLibBook + updateBorrow +
                        "COMMIT;";
                db.statement(atomicCheckout);
                System.out.printf("---> OK (checkin): updated %s and %s atomically.\n", TLibBook, TBorrow);
            } catch (SQLException e){
                System.out.println("---xxx> ERROR (checkin) doing checkin.");
            }
        }
        // No validation that book exists or was checked out by member


    }
    // Make sure that book belongs to library
    // Make sure that book is checked out
    // Make sure that book is currently checked out by member
    private boolean verrifyCheckin(Borrowed_by borrow) {
        boolean bookAtLibrary = false;
        boolean bookCheckedOut = false;
        boolean checkedOutByMember = false;

        String queryLib = String.format(
                "SELECT ISBN, library_name, copies_available, copies_total " +
                "FROM %s " +
                "WHERE ISBN = \"%s\" " +
                "AND library_name = \"%s\";",
                TLibBook, borrow.isbn, borrow.library);

        String queryMember = String.format(
                "SELECT ISBN, library_name, member_id, checkin_date " +
                "FROM %s " +
                "WHERE ISBN = \"%s\" " +
                "AND library_name = \"%s\" " +
                "AND member_id = %s " +
                "AND checkin_date is NULL;",
                TBorrow, borrow.isbn, borrow.library, borrow.MemberID);
        try{
            ResultSet libResult= db.query(queryLib);
            while(libResult.next()){
                if (
                    libResult.getString("library_name").equals(borrow.library)
                && libResult.getString("ISBN").equals(borrow.isbn)){
                  bookAtLibrary = true;

                  int copiesTotal = Integer.parseInt(libResult.getString("copies_total"));
                  int copiesAvailable =Integer.parseInt(libResult.getString("copies_available"));

                  if(copiesAvailable < copiesTotal){
                      bookCheckedOut = true;
                  }
                  break;
                }
            };
            if (!bookAtLibrary){
                System.out.printf("---xxx> ERROR (checkin) %s does not exist at %s.\n", borrow.isbn, borrow.library);
                return false;
            }
            if (!bookCheckedOut){
                System.out.printf("---xxx> ERROR (checkin) %s is not checked out at %s.\n", borrow.isbn, borrow.library);
                return false;
            }

            ResultSet memberResult = db.query(queryMember);
            while(memberResult.next()){
                String cinDate = memberResult.getString("checkin_date");
                if (cinDate == null){
                    checkedOutByMember = true;
                    break;
                }
            }

            if (!checkedOutByMember){
                System.out.printf("---xxx> ERROR (checkin) %s is not checked out by %s at %s.\n", borrow.isbn, borrow.MemberID, borrow.library);
                return false;
            }

        } catch (SQLException e){
            System.out.printf("---xxx> ERROR (checkin) Error verifying Checkin\n");
            return false;
        }

        return true;
    }

    private void runCheckout(Borrowed_by borrow) {
        // Get numAvailable
        if (verifyBookAvailable(borrow)){

            String availableQuery = String.format("SELECT copies_available " +
                    "FROM %s " +
                    "WHERE ISBN = \"%s\" " +
                    "AND library_name = \"%s\";", TLibBook, borrow.isbn, borrow.library);
            ResultSet result = db.query(availableQuery);
            try {
                // ISBN and library_name are primary key, only 1 result
                result.next();
                int avail = Integer.parseInt(result.getString("copies_available"));
                String updateLibBook = String.format("UPDATE %s " +
                        "SET %s.copies_available = %d " +
                        "WHERE ISBN = \"%s\" " +
                        "AND library_name = \"%s\";\n", TLibBook, TLibBook, (avail - 1), borrow.isbn, borrow.library);
                String updateBorrow = String.format("INSERT INTO %s " +
                        "VALUES (%s, \"%s\", \"%s\", \"%s\", NULL);\n",
                        TBorrow, borrow.MemberID, borrow.isbn, borrow.library, borrow.co_date);

                String atomicCheckout = "START TRANSACTION;\n" +
                        updateLibBook + updateBorrow +
                        "COMMIT;";
                db.statement(atomicCheckout);
                System.out.printf("<--- OK (checkout): updated %s and %s atomically.\n", TLibBook, TBorrow);
            } catch (SQLException e){
                System.out.println("<---xxx Error doing checkout");
            }
        }
    }

    private boolean verifyBookAvailable(Borrowed_by borrow) {
        String query = String.format("SELECT copies_available, library_name " +
                "FROM %s WHERE ISBN = \"%s\" " +
                "AND library_name = \"%s\";"
                , TLibBook, borrow.isbn, borrow.library);
        ResultSet result = db.query(query);
        try{
            // Make sure book exists at Library
            if (db.foundValidSingleResult(query)){
                result.next();
                // Make sure copies available
                int numAvailable = Integer.parseInt(result.getString("copies_available"));
                if(numAvailable >= 1 ){
                    return true;
                } else {
                    QueryException e = new QueryException();
                    e.printError(String.format("<---xxx ERROR (checkout): Book %s is not available at %s.", borrow.isbn, borrow.library));
                    return false;
                }
            } else {
                return false;
            }
        } catch (SQLException e) {
            System.out.printf("<---xxx ERROR (checkout): Book %s is not available at %s.\n", borrow.isbn, borrow.library);
            return false;
        } catch (QueryException e) {
            e.printError(String.format("<---xxx ERROR (checkout): Book %s is not available at %s.", borrow.isbn, borrow.library));
            return false;
        }
    }

    private boolean verrifyISBN(Borrowed_by borrow) {
        String query = String.format("SELECT ISBN FROM %s WHERE ISBN = \"%s\"", TBook, borrow.isbn);
        try {
            return db.foundValidSingleResult(query);
        } catch (QueryException e) {
            e.printError(String.format("Book %s not found.", borrow.isbn));
            return false;
        }
    }

}
