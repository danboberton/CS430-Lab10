package lab10;

public class Main {
    public static boolean REMOTE_TUNNEL = false;
    public static void main(String args[]){


        boolean verbose = false;

        System.out.println("\n\n***   Lab10   ***\n\n");
        // TODO: handle arg input again
        if(args.length >= 1){
            if (args[0].equalsIgnoreCase("V")){
                verbose = true;
            }
        }

        dbConnection db = new dbConnection();
        App App = new App(db, args, verbose);

        System.out.println("\n\n*** Program Complete, have a nice day! ***\n\n");
    }
}
