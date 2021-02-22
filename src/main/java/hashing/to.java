package hashing;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.nio.charset.StandardCharsets;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class to {
    private static to instance = new to();

    public static to getInstance() {
        return instance;
    }
    to() {

    }

    Connection conn = null;

    private Connection getConnection() throws Exception {
        Context initCtx = new InitialContext();
        Context envCtx = (Context) initCtx.lookup("java:comp/env");
        DataSource ds = (DataSource) envCtx.lookup("jdbc/test");
        return ds.getConnection();
    }

    public void toHash() {
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        SHA256 sha256 = SHA256.getInsatnce();
        try {
            conn = getConnection();

            pstmt = conn.prepareStatement("SELECT managerPwd FROM pManager");
            rs = pstmt.executeQuery();

            if (rs.next()) {
                String first = sha256.getSha256(rs.getString("managerPwd").getBytes(StandardCharsets.UTF_8));
                String db = BCrypt.hashpw(first,BCrypt.gensalt());

                pstmt = conn.prepareStatement("UPDATE pManager SET managerPwd=?");
                pstmt.setString(1,db);
                pstmt.executeUpdate();
            }

        }catch (Exception ex) {
            ex.printStackTrace();
        }
    }

}
