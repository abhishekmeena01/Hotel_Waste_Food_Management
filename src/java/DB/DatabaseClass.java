
package DB;
//import com.sun.org.apache.xalan.internal.xsltc.compiler.util.Type;
import java.sql.*;

public class DatabaseClass {
    private Connection con;
    private Statement st;
     public Statement getSt() {
        return st;
     }
     private PreparedStatement insertUser, viewUser,checkLogin,donate,viewAllDonations,viewMyDonations,raise,viewAllRequests;
     public DatabaseClass(){
         try{
             
 Class.forName("com.mysql.cj.jdbc.Driver");
 con=DriverManager.getConnection("jdbc:mysql://localhost:3306/aiding?useTimeZone=true&serverTimezone=UTC&autoReconnect=true&useSSL=false","root","kartik");
 st=con.createStatement();
 insertUser =con.prepareStatement("Insert into register values(?,?,?,?,?)");
 viewUser=con.prepareStatement("Select * from register where email=?");
 checkLogin=con.prepareStatement("Select * from register where email=? and password=?");
 donate=con.prepareStatement("Insert into donate values(?,?,?,?,?,?,?,?,?,?,?,?,now())");
 //PreparedStatement sql=donate;
 viewAllDonations=con.prepareStatement("Select * from donate where item=?");
 viewMyDonations=con.prepareStatement("Select * from donate where email=?");
 raise=con.prepareStatement("Insert into request values(?,?,?,?,?,?,?,?,?,?,?,?,?,now())");
 viewAllRequests=con.prepareStatement("Select * from request");
}
catch(Exception e){
    e.printStackTrace();
    
}
     }
public String insertUser(String email, String pass,String name, String phone, String city ){
         try{  
        insertUser.setString(3,name);
        insertUser.setString(1,email);
        insertUser.setString(2,pass);
        insertUser.setString(4,phone);
        //insertUser.setDate(5,dob);
        insertUser.setString(5,city);
        System.out.println("Inside Database . Java before execute update " );
       int x=insertUser.executeUpdate();
       System.out.println("Inside Database . Java after execute update " );
       if(x==1){
           System.out.println("Inside Database . Java ");
           return("done");
       }else{
           return("registeration failed");
       }
        
         }catch(java.sql.SQLIntegrityConstraintViolationException ex){
            return "Already registered";
         }
         catch(Exception e){
             e.printStackTrace();
             return "Exception generated";
         }
        
     }
public ResultSet viewUser(String e){
        try{        
viewUser.setString(1, e);
ResultSet r=viewUser.executeQuery();
if(r.next()){
    return r;
}else{
    return null;
}
        }catch(Exception ex){
            ex.printStackTrace();
            return null;
        }
        }
     public ResultSet checkLogin(String email,String pass)
    {
       try{        
checkLogin.setString(1, email);
checkLogin.setString(2, pass);
ResultSet r=checkLogin.executeQuery();
while(r.next()){
    return r;
}

        }catch(Exception ex){
            ex.printStackTrace();
            
        }    
        return null;
    }
     public String donate(String name, String email,String phone, String add1, String add2,String landm,String city,String state,String pin,String item, int amount, String comments ) throws SQLException{
        
        donate.setString(1,name);
        donate.setString(2,email);
        donate.setString(3,phone);
        donate.setString(4,add1);
        //insertUser.setDate(5,dob);
        donate.setString(5,add2);
        donate.setString(6,landm);
        donate.setString(7,city);
        donate.setString(8,state);
        donate.setString(9,pin);
        donate.setString(10,item);
        donate.setString(11,String.valueOf(amount));
        donate.setString(12,comments);
       int x=donate.executeUpdate();
       if(x==1){
           return("done");
       }else{
           return("Unable to Add");
       }
          
     }
     public ResultSet viewAllDonations(String e){
        try{        
           
viewAllDonations.setString(1, e);
ResultSet r=viewAllDonations.executeQuery();
while(r.next()){
    return r;
}
return r;
        }catch(Exception ex){
            ex.printStackTrace();
            return null;
        }
        }
     public ResultSet viewMyDonations(String e){
        try{        
//viewMyDonations.setString(10, e);
viewMyDonations.setString(1, e);
ResultSet r=viewMyDonations.executeQuery();
if(r.next()){
    return r;
}else{
    return null;
}
        }catch(Exception ex){
            ex.printStackTrace();
            return null;
        }
        }
     public String raise(String name, String email,String phone, String add1, String add2,String landm,String city,String state,String pin,String item, int amount,java.sql.Date last_date,String comments ) throws SQLException{
        
        raise.setString(1,name);
        raise.setString(2,email);
        raise.setString(3,phone);
        raise.setString(4,add1);
        //insertUser.setDate(5,dob);
        raise.setString(5,add2);
        raise.setString(6,landm);
        raise.setString(7,city);
        raise.setString(8,state);
        raise.setString(9,pin);
        raise.setString(10,item);
        raise.setString(11,String.valueOf(amount));
        raise.setDate(12,last_date);
        raise.setString(13,comments);
       int x=raise.executeUpdate();
       if(x==1){
           return("done");
       }else{
           return("Unable to Add");
       }
          
     }
      public ResultSet viewAllRequests(){
        try{     
     
                ResultSet r=viewAllRequests.executeQuery();
                while(r.next()){
                    return r;
                }
                return r;
            }catch(Exception ex){
                   ex.printStackTrace();
                   return null;
                        }
                        }
}
     