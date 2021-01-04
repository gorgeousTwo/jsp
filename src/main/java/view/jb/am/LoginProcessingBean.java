package view.jb.am;

import oracle.jdbc.proxy.annotation.Pre;
import sun.security.provider.SHA;
import view.jb.hash.BCrypt;
import view.jb.hash.SHA256;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
        Connection conn = null;
        PreparedStatement pstmt = null;

        SHA256 sha = SHA256.getInsatnce();
        try {
            conn = getConnection();

            String shaPwd = sha.getSha256(member.getPwd().getBytes());
            String bcPwd = BCrypt.hashpw(shaPwd, BCrypt.gensalt());
            //hashing pwd

            pstmt = conn.prepareStatement("INSERT INTO MEMBER2 VALUES(?,?,?,?,?,?)");
            pstmt.setString(1, member.getId());
            pstmt.setString(2, bcPwd);
            pstmt.setString(3, member.getName());
            pstmt.setTimestamp(4, member.getReg_date());
            pstmt.setString(5, member.getAddress());
            pstmt.setString(6, member.getTel());
            pstmt.executeUpdate();

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

            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException sqlException) {
                    sqlException.printStackTrace();
                }
            }
        }
    }

    //login, user information update/delete
    public int userCheck(String id, String pwd) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int x = -1;

        SHA256 sha = SHA256.getInsatnce();
        try {
            conn = getConnection();

            String shaPwd = sha.getSha256(pwd.getBytes());
            pstmt = conn.prepareStatement("SELECT PWD FROM MEMBER2 WHERE ID = ?");
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                String dbPwd = rs.getString("PWD");
                if (BCrypt.checkpw(shaPwd,dbPwd)) {
                    x = 1;
                } else {
                    x = 0;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                }catch (SQLException se) {
                    se.printStackTrace();
                }
            }
            if (pstmt != null) {
                try {
                    pstmt.close();
                }catch (SQLException se) {
                    se.printStackTrace();
                }

            }
            if (conn != null) {
                try {
                    conn.close();
                }catch (SQLException se) {
                    se.printStackTrace();
                }
            }
        }

        return x;
    }

    //check confirm
    public int confirmId(String id) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int x = -1;

        try {
            conn = getConnection();
            pstmt = conn.prepareStatement("SELECT ID FROM MEMBER2 WHERE ID =?");
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                x = 1;
            } else {
                x = -1;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                }catch (SQLException se) {
                    se.printStackTrace();
                }
            }
            if (pstmt != null) {
                try {
                    pstmt.close();
                }catch (SQLException se) {
                    se.printStackTrace();
                }

            }
            if (conn != null) {
                try {
                    conn.close();
                }catch (SQLException se) {
                    se.printStackTrace();
                }
            }
        }
        return x;
    }

    //get MEMBER2 table
    public LoginDataBean getMember(String id, String pwd) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        LoginDataBean member = null;

        SHA256 sha256 = SHA256.getInsatnce();
        try {
            conn = getConnection();
            String shaPwd = sha256.getSha256(pwd.getBytes());

            pstmt = conn.prepareStatement("SELECT * FROM MEMBER2 WHERE ID = ?");
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                String dbPwd = rs.getString("PWD");
                if (BCrypt.checkpw(shaPwd,dbPwd)) {
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
            if (rs != null) {
                try {
                    rs.close();
                }catch (SQLException se) {
                    se.printStackTrace();
                }
            }
            if (pstmt != null) {
                try {
                    pstmt.close();
                }catch (SQLException se) {
                    se.printStackTrace();
                }

            }
            if (conn != null) {
                try {
                    conn.close();
                }catch (SQLException se) {
                    se.printStackTrace();
                }
            }
        }
        return member;
    }

    //update sql
    public int updateMember(LoginDataBean member) {
        int x = -1;
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        SHA256 sha256 = SHA256.getInsatnce();
        try {
            conn = getConnection();
            String shaPwd = sha256.getSha256(member.getPwd().getBytes());
            pstmt = conn.prepareStatement("SELECT PWD FROM MEMBER2 WHERE ID = ?");
            pstmt.setString(1, member.getId());
            rs = pstmt.executeQuery();

            if (rs.next()) {
                String dbPwd = rs.getString("PWD");
                if (BCrypt.checkpw(shaPwd,dbPwd)) {
                    pstmt = conn.prepareStatement("UPDATE MEMBER2 SET NAME =?, ADDRESS = ?, TEL =? WHERE ID = ?");
                    pstmt.setString(1, member.getName());
                    pstmt.setString(2, member.getAddress());
                    pstmt.setString(3,member.getAddress());
                    pstmt.setString(4, member.getId());
                    pstmt.executeUpdate();
                    x = 1;
                } else {
                    x = 0;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                }catch (SQLException se) {
                    se.printStackTrace();
                }
            }
            if (pstmt != null) {
                try {
                    pstmt.close();
                }catch (SQLException se) {
                    se.printStackTrace();
                }

            }
            if (conn != null) {
                try {
                    conn.close();
                }catch (SQLException se) {
                    se.printStackTrace();
                }
            }
        }
        return x;
    }


    //delete sql
    public int deleteMember(String id, String pwd) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int x = -1;

        SHA256 sha256 = SHA256.getInsatnce();
        try {
            conn = getConnection();

            String shaPwd = sha256.getSha256(pwd.getBytes());
            pstmt = conn.prepareStatement("SELECT PWD FROM MEMBER2 WHERE ID = ?");
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                String dbPwd = rs.getString("PWD");
                if (BCrypt.checkpw(shaPwd,dbPwd)) {
                    pstmt = conn.prepareStatement("DELETE FROM MEMBER2 WHERE ID = ?");
                    pstmt.setString(1, id);
                    pstmt.executeUpdate();
                    x = 1;
                } else {
                    x = 0;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                }catch (SQLException se) {
                    se.printStackTrace();
                }
            }
            if (pstmt != null) {
                try {
                    pstmt.close();
                }catch (SQLException se) {
                    se.printStackTrace();
                }

            }
            if (conn != null) {
                try {
                    conn.close();
                }catch (SQLException se) {
                    se.printStackTrace();
                }
            }
        }
        return x;
    }
}
