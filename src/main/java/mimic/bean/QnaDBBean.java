package mimic.bean;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * getInstance()
 * getConnection()
 *
 * !Overloading!
 * insertArticle(QnaDataBean article)
 * insertArticle(QnaDataBean article, int qna_id)
 *
 * !Overloading!
 * getArticleCount()
 * getArticleCount(int book_id)
 *
 * !Overloading!
 * getArticles(int count)
 * getArticles(int count, int book_id)
 *
 * updateGetArticle(int qna_id)
 * updateArticle(QnaDataBean article)
 * deleteArticle(int qna_id)
 */
public class QnaDBBean {
    private static QnaDBBean instance = new QnaDBBean();
    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;

    public static QnaDBBean getInstance() {
        return instance;
    }

    private void initClass() {
        conn = null;
        pstmt = null;
        rs = null;
    }

    private QnaDBBean() {}

    private Connection getConnection() throws Exception {
        Context initCtx = new InitialContext();
        Context envCtx = (Context) initCtx.lookup("java:comp/env");
        DataSource ds = (DataSource) envCtx.lookup("jdbc/test");
        return ds.getConnection();
    }

    @SuppressWarnings("resource")
    public int insertArticle(QnaDataBean article) {
        initClass();
        int x = 0;
        String sql = "";
        int group_id = 1;

        try {
            conn = getConnection();

            pstmt = conn.prepareStatement("SELECT MAX(qna_id) FROM pQna");
            rs = pstmt.executeQuery();

            if (rs.next()) {
                x = rs.getInt(1);
            }

            if (x > 0) {
                group_id = rs.getInt(1)+1;
            }

            sql = "INSERT INTO pQna(book_id, book_title, qna_writer, qna_content, group_id, qora, reply, reg_date) " +
                    "VALUES(?,?,?,?,?,?,?,?)";

            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1,article.getBook_id());
            pstmt.setString(2,article.getBook_title());
            pstmt.setString(3,article.getQna_writer());
            pstmt.setString(4,article.getQna_content());
            pstmt.setInt(5,article.getGroup_id());
            pstmt.setInt(6,article.getQora());
            pstmt.setInt(7,article.getReply());
            pstmt.setTimestamp(8,article.getReg_date());
            pstmt.executeUpdate();

            x = 1;
        }catch (Exception ex) {
            ex.printStackTrace();
        }finally {
            closeMaster(conn, pstmt, rs);
        }
        return x;
    }

    @SuppressWarnings("resource")
    public int insertArticle(QnaDataBean article, int qna_id) {
        initClass();
        int x = 0;
        String sql = "";

        try {
            conn = getConnection();
            sql = "INSERT INTO pQna(book_id, book_title, qna_writer, qna_content, group_id, qora, reply, reg_date) " +
                    "VALUES(?,?,?,?,?,?,?,?)";

            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1,article.getBook_id());
            pstmt.setString(2,article.getBook_title());
            pstmt.setString(3,article.getQna_writer());
            pstmt.setString(4,article.getQna_content());
            pstmt.setInt(5,article.getGroup_id());
            pstmt.setInt(6,article.getQora());
            pstmt.setInt(7,article.getReply());
            pstmt.setTimestamp(8,article.getReg_date());
            pstmt.executeUpdate();

            sql = "UPDATE pQna SET reply = ? WHERE qna_id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1,1);
            pstmt.setInt(2,qna_id);
            pstmt.executeUpdate();

            x = 1;
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            closeMaster(conn, pstmt, rs);
        }
        return x;
    }

    public int getArticleCount() {
        initClass();
        int x = 0;

        try {
            conn = getConnection();
            pstmt = conn.prepareStatement("SELECT COUNT(*) FROM pQna");
            rs = pstmt.executeQuery();

            if (rs.next()) {
                x = rs.getInt(1);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            closeMaster(conn, pstmt, rs);
        }
        return x;
    }

    public int getArticleCount(int book_id) {
        initClass();
        int x = 0;

        try {
            conn = getConnection();

            pstmt = conn.prepareStatement("SELECT COUNT(*) FROM pQna WHERE book_id =" + book_id);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                x = rs.getInt(1);
            }

        }catch (Exception ex) {
            ex.printStackTrace();
        }finally {
            closeMaster(conn,pstmt,rs);
        }
        return x;
    }

    public List<QnaDataBean> getArticles(int count) {
        initClass();
        List<QnaDataBean> articleList = null;

        try {
            conn = getConnection();

            pstmt = conn.prepareStatement("SELECT * FROM pQna BY group_id DESC, qora ASC");
            rs = pstmt.executeQuery();

            if (rs.next()) {
                articleList = new ArrayList<QnaDataBean>(count);
                do {
                    QnaDataBean article = new QnaDataBean();
                    article.setQna_id(rs.getInt("qna_id"));
                    article.setBook_id(rs.getInt("book_id"));
                    article.setBook_title(rs.getString("book_title"));
                    article.setQna_writer(rs.getString("qna_writer"));
                    article.setQna_content(rs.getString("qna_content"));
                    article.setGroup_id(rs.getInt("group_id"));
                    article.setQora(rs.getByte("qora"));
                    article.setReply(rs.getByte("reply"));
                    article.setReg_date(rs.getTimestamp("reg_date"));

                    articleList.add(article);
                }while (rs.next());
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }finally {
            closeMaster(conn,pstmt,rs);
        }
        return articleList;
    }

    public List<QnaDataBean> getArticles(int count, int book_id) {
        initClass();
        List<QnaDataBean> articleList = null;

        try {
            conn = getConnection();

            pstmt = conn.prepareStatement("SELECT * FROM pQna WHERE book_id =" + book_id + "ORDER BY group_id DESC, qora ASC");
            rs = pstmt.executeQuery();

            if (rs.next()) {
                articleList = new ArrayList<QnaDataBean>(count);
                do {
                    QnaDataBean article = new QnaDataBean();
                    article.setQna_id(rs.getInt("qna_id"));
                    article.setBook_id(rs.getInt("book_id"));
                    article.setBook_title(rs.getString("book_title"));
                    article.setQna_writer(rs.getString("qna_writer"));
                    article.setQna_content(rs.getString("qna_content"));
                    article.setGroup_id(rs.getInt("group_id"));
                    article.setQora(rs.getByte("qora"));
                    article.setReply(rs.getByte("reply"));
                    article.setReg_date(rs.getTimestamp("reg_date"));

                    articleList.add(article);
                }while (rs.next());
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }finally {
            closeMaster(conn,pstmt,rs);
        }
        return articleList;
    }

    public QnaDataBean updateGetArticle(int qna_id) {
        initClass();
        QnaDataBean article = null;

        try {
            conn = getConnection();

            pstmt = conn.prepareStatement("SELECT * FROM pQna WHERE qna_id = ?");
            pstmt.setInt(1,qna_id);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                    article = new QnaDataBean();
                    article.setQna_id(rs.getInt("qna_id"));
                    article.setBook_id(rs.getInt("book_id"));
                    article.setBook_title(rs.getString("book_title"));
                    article.setQna_writer(rs.getString("qna_writer"));
                    article.setQna_content(rs.getString("qna_content"));
                    article.setGroup_id(rs.getInt("group_id"));
                    article.setQora(rs.getByte("qora"));
                    article.setReply(rs.getByte("reply"));
                    article.setReg_date(rs.getTimestamp("reg_date"));
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }finally {
            closeMaster(conn,pstmt,rs);
        }
        return article;
    }

    public int updateArticle(QnaDataBean article) {
        initClass();
        int x = -1;

        try {
            conn = getConnection();

            String sql = "UPDATE pQna SET qna_content = ? WHERE qna_id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1,article.getQna_content());
            pstmt.setInt(2,article.getQna_id());
            pstmt.executeUpdate();

            x = 1;
        } catch (Exception ex) {
            ex.printStackTrace();
        }finally {
            closeMaster(conn,pstmt);
        }
        return x;
    }

    public int deleteArticle(int qna_id) {
        initClass();
        int x = -1;
        try {
            conn = getConnection();

            pstmt = conn.prepareStatement("DELETE FROM pQna WHERE qna_id = ?");
            pstmt.setInt(1,qna_id);
            pstmt.executeUpdate();

            x = 1;
        }catch (Exception ex) {
            ex.printStackTrace();
        }finally {
            closeMaster(conn,pstmt);
        }
        return x;
    }


    /**
     *
     * This method disconnects the parameter.
     * I made it simple because I was annoyed to enter the same thing every time.
     *
     */
    public void closeMaster(Connection conn, PreparedStatement pstmt, ResultSet rs) {
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException exception) { }
        }

        if (pstmt != null) {
            try {
                pstmt.close();
            } catch (SQLException exception) { }
        }

        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException exception) { }
        }
    }

    public void closeMaster(Connection conn, PreparedStatement pstmt) {
        if (pstmt != null) {
            try {
                pstmt.close();
            } catch (SQLException exception) { }
        }

        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException exception) { }
        }
    }
}
