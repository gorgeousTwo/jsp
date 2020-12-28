package view.jb.section02;

import view.jb.hash.BCrypt;
import view.jb.hash.SHA256;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class loginDB {

    private static loginDB instance = new loginDB();

    public static loginDB getInstance() {
        return instance;
    }

    private loginDB () {}

    private Connection getConnection () throws Exception {
        Context initCtx = new InitialContext();
        Context envCtx = (Context) initCtx.lookup("java:comp/env");
        DataSource ds = (DataSource) envCtx.lookup("jdbc/test");
        return ds.getConnection();
    }

    public int userCheck(String id, String passwd) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int x = -1;

        SHA256 sha = SHA256.getInsatnce();
        try {
            conn = getConnection();


            String shaPass = sha.getSha256(passwd.getBytes());
            pstmt = conn.prepareStatement("SELECT PWD FROM MEMBER WHERE ID = ?");
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                String dbPwd = rs.getString("PWD");
                if (BCrypt.checkpw(shaPass, dbPwd)) {
                    x = 1;
                } else {
                    x = 0;
                }
            } else {
                x = -1;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException sqlException) {};
            }

            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException sqlException) {};

            }

            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException sqlException) {};

            }
        }
        return x;
    }
}
