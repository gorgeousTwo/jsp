package view.jb.ap;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class userDAO {

    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;

    public userDAO () {
        conn = null;
        try {
            conn = getConnection();
        }catch (Exception e) {
            e.printStackTrace();
        }
    }

    private Connection getConnection() throws Exception {
        conn = null;
        Context initCtx = new InitialContext();
        Context envCtx = (Context) initCtx.lookup("java:comp/env");
        DataSource ds = (DataSource) envCtx.lookup("jdbc/test");
        return ds.getConnection();
    }

    public ArrayList<user> search(String userName) {
        conn = null;
        pstmt = null;
        rs = null;
        String sql = "SELECT * FROM MEMBER3 WHERE NAME LIKE = ?";
        ArrayList userList = new ArrayList<user>();

        try{
//            conn = getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, userName);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                user user = new user();
                user.setAge(rs.getString(1));
                user.setName(rs.getString(2));
                user.setGender(rs.getString(3));
                user.setEmail(rs.getString(4));
                userList.add(user);
            }
        }catch (Exception e) {
            e.printStackTrace();
        }finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException sqlException) {sqlException.printStackTrace();}
            }

            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException sqlException) {sqlException.printStackTrace();}
            }


//            if (conn != null) {
//                try {
//                    conn.close();
//                } catch (SQLException sqlException) {sqlException.printStackTrace();}
//            }
        }
        return userList;
    }
}
