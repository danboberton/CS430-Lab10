package oldLab9Files;

import java.sql.*;

public class Lab4_ex {
    public static void main(String args[]){

        Connection con = null;

        try {
            Statement stmt;
            ResultSet rs;

            // Register the JDBC driver for MySQL.
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Define URL of database server for
            // database named 'user' on the faure.
            String url =
                    "jdbc:mysql://localhost:9111/dbutcher";

            // Get a connection to the database for a
            // user named 'user' with the password
            // 123456789.
            con = DriverManager.getConnection(
                    url,"dbutcher", "822266208");

            // Display URL and connection information
            System.out.println("URL: " + url);
            System.out.println("Connection: " + con);

            // Get a Statement object
            stmt = con.createStatement();

            try{
                rs = stmt.executeQuery("SELECT * FROM Author");
                while (rs.next()) {
                    System.out.println (rs.getString("aid"));
                }
            }catch(Exception e){
                System.out.print(e);
                System.out.println(
                        "No Author table to query");
            }//end catch

            con.close();
        }catch( Exception e ) {
            e.printStackTrace();

        }//end catch

    }//end main

}//end class Lab4A_ex