package view.jb.section02;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import view.jb.sha.KISA_SHA256;

public class UpdateDBBean {

    private static UpdateDBBean instance = new UpdateDBBean();

    public static UpdateDBBean getInstance() {
        return instance;
    }

        private UpdateDBBean () {}

            private Connection getConnection() throws Exception {
                Context initCtx = new InitialContext();
                Context envCtx = (Context) initCtx.lookup("java:comp/env");
                DataSource ds = (DataSource) envCtx.lookup("jdbc/test");
                return ds.getConnection();
            }

            //member table info

            public List<UpdateDataBean> getMembers() throws Exception {
                Connection conn = null;
                PreparedStatement pstmt = null;
                ResultSet rs = null;
                List<UpdateDataBean> memberList = null;
                int x = 0;
                try {
                    conn = getConnection();

                    pstmt = conn.prepareStatement("SELECT COUNT(*) FROM MEMBER");
                    rs=pstmt.executeQuery();

                    if (rs.next()) x = rs.getInt(1);

                    pstmt=conn.prepareStatement(
                            "SELECT ID, PWD FROM MEMBER"
                    );
                    rs=pstmt.executeQuery();

                    if (rs.next()) {
                        memberList = new ArrayList<UpdateDataBean>(x);
                        do {
                            UpdateDataBean member = new UpdateDataBean();
                            member.setEnterId(rs.getString("ID"));
                            member.setEnterPwd(rs.getString("PWD"));
                            memberList.add(member);
                        } while (rs.next());
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }finally {
                    if (rs != null) {
                        try {
                            rs.close();
                        } catch (SQLException ex) { }
                    }

                    if (pstmt != null) {
                        try {
                            pstmt.close();
                        } catch (SQLException ex) { }
                    }


                    if (conn != null) {
                        try {
                            conn.close();
                        } catch (SQLException ex) { }
                    }

                }
                return memberList;
            }

            public void updateMember() {
                Connection conn = null;
                PreparedStatement pstmt = null;
                ResultSet rs = null;

            }
}
