package view.jb.am;

import view.jb.am.LoginDataBean;
import view.jb.hash.BCrypt;
import view.jb.hash.SHA256;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class lpb {

    private Connection conn = null;
    private PreparedStatement pstmt = null;
    private ResultSet rs = null;

    public lpb() {
        try{
            conn = getConn();
        }catch (Exception e) {
            e.printStackTrace();
        }
    }

    private Connection getConn() throws Exception {
        Context initCtx = new InitialContext();
        Context envCtx = (Context) initCtx.lookup("java:comp/env");
        DataSource ds = (DataSource) envCtx.lookup("jdbc/test");
        return ds.getConnection();
    }

    public void insertDB(LoginDataBean member) {

        SHA256 sha256 = SHA256.getInsatnce();
        String sql = "";

        try {
            String hashPwd2 = BCrypt.hashpw(sha256.getSha256(member.getPwd().getBytes()), BCrypt.gensalt());

            if (dpCheck(member.getId())) {
                sql = "INSERT INTO MEMBER2 VALUES(?,?,?,?,?,?)";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1,member.getId());
                pstmt.setString(2,member.getPwd());
                pstmt.setString(3,member.getName());
                pstmt.setTimestamp(4,member.getReg_date());
                pstmt.setString(5,member.getAddress());
                pstmt.setString(6,member.getTel());
                pstmt.executeUpdate();
            }
        }catch (Exception e1) {e1.printStackTrace();}
        finally {
            if (pstmt != null) {
                try { pstmt.close(); }catch(SQLException sqlException) {sqlException.printStackTrace();}
            }
        }
    }

    public boolean userC(String id, String pwd) {
        boolean check = false;
        SHA256 sha256 = SHA256.getInsatnce();
        String sql = "";

        try {
            sql = "SELECT PWD FROM MEMBER2 WHERE ID = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            String sha = sha256.getSha256(pwd.getBytes());

            if (rs.next()) {
                String dbPwd = rs.getString("PWD");
                if (BCrypt.checkpw(sha, dbPwd)) {
                    check = true;
                } else {
                    check = false;
                }
            }
        }catch (Exception e) {e.printStackTrace();}finally {
            if (pstmt != null) {
                try { pstmt.close(); }catch(SQLException sqlException) {sqlException.printStackTrace();}
            }
            if (rs != null) {
                try { rs.close(); }catch(SQLException sqlException) {sqlException.printStackTrace();}
            }
        }
        return check;
    }

    private boolean dpCheck(String id) {

        boolean check = false;
        String sql = "";
        try {
            sql = "SELECT ID FROM MEMBER2 WHERE ID = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1,id);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                check = false;
            } else {
                check = true;
            }

        }catch (Exception e) {e.printStackTrace();}finally {
            if (pstmt != null) {
                try { pstmt.close(); }catch(SQLException sqlException) {sqlException.printStackTrace();}
            }
            if (rs != null) {
                try { rs.close(); }catch(SQLException sqlException) {sqlException.printStackTrace();}
            }
        }
        return check;
    }

    public LoginDataBean getDB(String id, String pwd) {
        LoginDataBean member = null;
        SHA256 sha256 = SHA256.getInsatnce();

        try {

            String sha = sha256.getSha256(pwd.getBytes());
            pstmt = conn.prepareStatement("SELECT PWD FROM MEMBER2 WHERE ID = ?");
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                String dbPwd = rs.getString("PWD");
                if (BCrypt.checkpw(sha, dbPwd)) {
                    member = new LoginDataBean();
                    member.setId(rs.getString("ID"));
                    member.setPwd(rs.getString("PWD"));
                    member.setName(rs.getString("NAME"));
                    member.setReg_date(rs.getTimestamp("REG_DATE"));
                    member.setAddress(rs.getString("ADDRESS"));
                    member.setTel(rs.getString("TEL"));
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException sqlException) {
                    sqlException.printStackTrace();
                }
            }
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException sqlException) {
                    sqlException.printStackTrace();
                }
            }
        }
        return member;
    }
}
