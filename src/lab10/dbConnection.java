package lab10;

import lab10.exceptions.QueryException;

import java.sql.*;

public class dbConnection {
    private Connection con;


    private String CONNECTION = null;
    private final String USR = "dbutcher";
    private final String PWD = "822266208";

    public dbConnection(){
        this.init();
    }

    public ResultSet query(String query){
        Statement stmt;
        ResultSet result = null;
        try{
            stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            result = stmt.executeQuery(query);
        } catch (SQLException e) {
            System.out.printf("--xxx> FAILED Query %s", query);
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return result;
    }

    public void statement(String query){
        try{
            con.setAutoCommit(false);
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.execute();
            System.out.printf("*** SQL\n%s\n*** Executed", query);
            con.commit();
        } catch (SQLException e){
            System.out.printf("\n<xxx>Error executing statement %s\n", query);
        }
    }

    private void init(){
        if (!Main.REMOTE_TUNNEL){
            this.CONNECTION = "jdbc:mysql://faure:3306/dbutcher";
        } else {
            this.CONNECTION = "jdbc:mysql://localhost:9111/dbutcher";
        }

        try{
            con = DriverManager.getConnection(CONNECTION, USR, PWD);
            System.out.printf("Connected to: %s@%s\n", USR, CONNECTION);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    // TODO This is stupid and broken VVVVVVVVV
    public boolean foundValidSingleResult(String query) throws QueryException {
        ResultSet result = this.queryVerify(query);
        try {
            result.last();
            int last = result.getRow();
            return (last >= 0);
        } catch (SQLException e) {
            throw new QueryException();
        }
    }

    private ResultSet queryVerify(String query) {
        Statement stmt;
        ResultSet result = null;
        try{
            stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
                    ResultSet.CONCUR_READ_ONLY);
            result = stmt.executeQuery(query);
        } catch (SQLException e) {
            System.out.printf("Query %s failed", query);
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return result;
    }
}
