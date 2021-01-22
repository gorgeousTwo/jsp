package am;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class userDAO {
    private Connection conn = null;

    public userDAO() {
        try {
            conn = getConnection();
        }catch (Exception user) {user.printStackTrace();}finally {
            if (conn == null) {
                System.out.println("getConnection is Failed.");
            }
        }
    }

    private Connection getConnection() throws Exception {
        Context initCtx = new InitialContext();
        Context envCtx = (Context) initCtx.lookup("java:comp/env");
        DataSource ds = (DataSource) envCtx.lookup("jdbc/test");
        return ds.getConnection();
    }

    public int isDuplicated(String userId) {
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try{
            pstmt = conn.prepareStatement("SELECT userId FROM FORUSER WHERE ID = ?");
            pstmt.setString(1, userId);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                return 0; //duplicated
            } else {
                return 1; //!duplicated
            }

        }catch (Exception e) {e.printStackTrace();}finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
            }catch (SQLException sqlException){sqlException.printStackTrace();}
        }
        return -1; //db error
    }

    public int register(userDTO info) {
        PreparedStatement pstmt = null;
        try{
            pstmt = conn.prepareStatement("INSERT INTO FORUSER VALUES(?,?,?,?,?,?)");
            pstmt.setString(1,info.getUserId());
            pstmt.setString(2,info.getUserPwd());
            pstmt.setString(3,info.getUserName());
            pstmt.setString(4,info.getUserAge());
            pstmt.setString(5,info.getUserGender());
            pstmt.setString(6,info.getUserEmail());
            return pstmt.executeUpdate(); //success : return 1
        }catch (Exception e) {e.printStackTrace();}finally {
            try {
                if (pstmt != null) pstmt.close();
            }catch (SQLException sqlException){sqlException.printStackTrace();}
        }
        return -1; //db error
    }

}
