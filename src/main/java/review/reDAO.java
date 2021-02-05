package review;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;

public class reDAO {
    private Connection conn = null;

    public reDAO() {
        try {
            conn = getConn();
        }catch (Exception exception) {
            exception.printStackTrace();
        }
    }

    private Connection getConn() throws Exception {
        Context initCtx = new InitialContext();
        Context envCtx= (Context)initCtx.lookup("java:comp/env");
        DataSource dataSource = (DataSource) envCtx.lookup("jdbc/test");
        return dataSource.getConnection();
    }

    public int insertDAO(reDTO reDTO) {
        PreparedStatement pstmt = null;
        try {
            pstmt = conn.prepareStatement("INSERT INTO REVIEWF VALUES(?,?,?)");
            pstmt.setString(1,reDTO.getReName());
            pstmt.setString(2,reDTO.getRePwd());
            pstmt.setString(3,reDTO.getReTel());
            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }
}
