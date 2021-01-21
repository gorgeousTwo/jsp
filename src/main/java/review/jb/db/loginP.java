package review.jb.db;
import review.jb.db.ldb;
import view.jb.hash.BCrypt;
import view.jb.hash.SHA256;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class loginP {

    private Connection conn = null;
    private PreparedStatement statement = null;
    private ResultSet resultSet = null;
    private String sql = "";

    public loginP() {
        try {
            conn = getConnection();
        }catch (Exception e) {
            e.printStackTrace();
        }
    }

    private Connection getConnection() throws Exception {
        Context initCtx = new InitialContext();
        Context envCtx = (Context) initCtx.lookup("java:comp/env");
        DataSource dataSource = (DataSource) envCtx.lookup("jdbc/test");
        return dataSource.getConnection();
    }

    public void insert(ldb member) {
        if (!dbCheck(member.getId())) {return;}
        SHA256 sha256 = SHA256.getInsatnce();

        try {
            String hashing1 = sha256.getSha256(member.getPwd().getBytes());
            String hashing2 = BCrypt.hashpw(hashing1, BCrypt.gensalt());

            sql = "INSERT INTO MEMBER2 VALUES(?,?,?,?,?)";
            statement = conn.prepareStatement(sql);
            statement.setString(1, member.getId());
            statement.setString(2, member.getPwd());
            statement.setString(3, member.getName());
            statement.setString(4, member.getAddress());
            statement.setString(5, member.getTel());
            statement.executeUpdate();
        }catch (Exception e) {
            e.printStackTrace();
        }finally {
            if (statement != null) {try{statement.close();}catch (SQLException e){e.printStackTrace();}}
        }
    }

    private boolean dbCheck(String id) {
        sql = "SELECT ID FROM MEMBER2 WHERE ID =?";
        try {
            statement = conn.prepareStatement(sql);
            statement.setString(1,id);
            resultSet = statement.executeQuery();

            if (!resultSet.next()) {
                return true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            if (resultSet != null) {try{resultSet.close();}catch (SQLException se){se.printStackTrace();}}
            if (statement != null) {try{statement.close();}catch (SQLException se){se.printStackTrace();}}
        }
        return false;
    }

}
