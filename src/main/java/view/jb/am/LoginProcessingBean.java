package view.jb.am;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.Connection;

public class LoginProcessingBean {

    //LoginProcessingBean's Global object.
    private static LoginProcessingBean instance = new LoginProcessingBean();

    public static LoginProcessingBean getInstance() {return instance;}

    private LoginProcessingBean() {}

    //getConnection(Connection pool)
    private Connection getConnection() throws Exception {
        Connection conn = null;
        Context initCtx = new InitialContext();
        Context envCtx = (Context) initCtx.lookup("java:comp/env");
        DataSource ds = (DataSource) envCtx.lookup("jdbc/test");
        return ds.getConnection();
    }

    //register
    public void insertMember(LoginDataBean member) {

    }

    //login, user information update/delete
    public int userCheck(String id, String pwd) {
        return 0;
    }

    //check confirm
    public int confirmId(String id) {
        return 0;
    }

    //get MEMBER2 table
    public LoginDataBean getMember(String id, String pwd) {
        return new LoginDataBean();
    }

    //update sql
    public int updateMember(LoginDataBean member) {
        return 0;
    }


    //delete sql
    public int deleteMember(String id, String pwd) {
        return 0;
    }

}
