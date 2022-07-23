package lab10.dataTypes;

public class Borrowed_by extends absData {
    public int MemberID;
    public String isbn;
    public String library;
    public String co_date;
    public String cin_date;

    public Borrowed_by(){

    }

    @Override
    public String toString(){
       return String.format("MemberID: %d\nISBN: %s\nLibrary: %s\nCheckoutDate: %s\nCheckinDate: %s",
                MemberID, isbn, library, co_date, cin_date);
    }
}
