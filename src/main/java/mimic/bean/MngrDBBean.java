package mimic.bean;

import hashing.BCrypt;
import hashing.SHA256;

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
 * First, mimic. [now]
 * After, Edit Sources.
 */

public class MngrDBBean {
    private static MngrDBBean instance = new MngrDBBean();

    public static MngrDBBean getInstance() {
        return instance;
    }

    private MngrDBBean() {}

    private Connection conn = null;
    private ResultSet rs = null;
    private PreparedStatement pstmt = null;

    private Connection getConnection() throws Exception {
        Context initCtx = new InitialContext();
        Context envCtx = (Context) initCtx.lookup("java:comp/env");
        DataSource ds = (DataSource) envCtx.lookup("jdbc/test");
        return ds.getConnection();
    }

    public int userCheck(String id, String pwd) {
        int x = -1;
        SHA256 sha = SHA256.getInsatnce();
        try {
            conn = getConnection();
            String orgPwd = pwd;
            String shaPwd = sha.getSha256(orgPwd.getBytes());

            pstmt = conn.prepareStatement("SELECT managerPwd FROM pManager WHERE managerId = ?");
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                String dbPwd = rs.getString("managerPwd");
                if (BCrypt.checkpw(shaPwd,dbPwd)) {
                    x = 1;
                } else {
                    x = 0;
                }
            } else {
                x = -1;
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }finally {
            if (rs != null) { try { rs.close(); } catch (SQLException ex) {} }
            if (pstmt != null) { try { pstmt.close(); } catch (SQLException ex) {} }
            if (conn != null) { try { conn.close(); } catch (SQLException ex) {} }
        }
        return x;
    }

    public void insertBook(MngrDataBean book) throws Exception {
        try {
            conn = getConnection();
            String sql = "INSERT INTO pBook(book_kind, book_title, book_price, book_count, author, publishing_com," +
                    "publishing_date, book_image, book_content, discount_rate, reg_date) values(?,?,?,?,?,?,?,?,?,?,?)";

            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1,book.getBook_kind());
            pstmt.setString(2,book.getBook_title());
            pstmt.setInt(3,book.getBook_price());
            pstmt.setShort(4,book.getBook_count());
            pstmt.setString(5,book.getAuthor());
            pstmt.setString(6,book.getPublishing_com());
            pstmt.setString(7,book.getPublishing_date());
            pstmt.setString(8,book.getBook_image());
            pstmt.setString(9,book.getBook_content());
            pstmt.setByte(10,book.getDiscount_rate());
            pstmt.setTimestamp(11,book.getReg_date());

            pstmt.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            if (pstmt != null) { try { pstmt.close(); } catch (SQLException ex) {} }
            if (conn != null) { try { conn.close(); } catch (SQLException ex) {} }
        }
    }

    public int registeredBookConfirm(String kind, String bookName, String author) {
        int x = -1;

        try {
            conn = getConnection();

            String sql = "SELECT book_name form pBook where book_kind =? and book_name = ? and author = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, kind);
            pstmt.setString(2, bookName);
            pstmt.setString(3, author);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                x = 1;
            } else {
                x = -1;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) { try { rs.close(); } catch (SQLException ex) {} }
            if (pstmt != null) { try { pstmt.close(); } catch (SQLException ex) {} }
            if (conn != null) { try { conn.close(); } catch (SQLException ex) {} }
        }

        return x;
    }

    public int getBookCount() throws Exception {
        conn = null;
        pstmt = null;
        rs = null;
        int x = 0;

        try {
            conn = getConnection();

            pstmt = conn.prepareStatement("SELECT COUNT(*) FROM pBook");
            rs = pstmt.executeQuery();

            if (rs.next()) {
                x = rs.getInt(1);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) { try { rs.close(); } catch (SQLException ex) {} }
            if (pstmt != null) { try { pstmt.close(); } catch (SQLException ex) {} }
            if (conn != null) { try { conn.close(); } catch (SQLException ex) {} }
        }
        return x;
    }

    public int getBookCount(String book_Kind) throws Exception {
        conn = null;
        pstmt = null;
        rs = null;

        int x = 0;
        int kind = Integer.parseInt(book_Kind);

        try {
            conn = getConnection();
            String query = "SELECT COUNT(*) FROM pBook WHERE book_kind = " + kind;
            pstmt = conn.prepareStatement(query);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                x = rs.getInt(1);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) { try { rs.close(); } catch (SQLException ex) {} }
            if (pstmt != null) { try { pstmt.close(); } catch (SQLException ex) {} }
            if (conn != null) { try { conn.close(); } catch (SQLException ex) {} }
        }
        return x;
    }

    public String getBookTitle(int book_id) {
        conn = null;
        pstmt = null;
        rs = null;
        String x = "";

        try {
            conn = getConnection();

            pstmt = conn.prepareStatement("SELECT book_title FROM pBook WHERE book_id =" + book_id);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                x = rs.getString(1);
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) { try { rs.close(); } catch (SQLException ex) {} }
            if (pstmt != null) { try { pstmt.close(); } catch (SQLException ex) {} }
            if (conn != null) { try { conn.close(); } catch (SQLException ex) {} }
        }
        return x;
    }

    public List<MngrDataBean> getBooks(String book_Kind) throws Exception {
        conn = null;
        pstmt = null;
        rs = null;
        List<MngrDataBean> bookList = null;

        try {
            conn = getConnection();
            String sql1 = "SELECT * FROM pBook";
            String sql2 = "SELECT * FROM pBook WHERE book_kind ? ORDER BY reg_date DESC";

            if (book_Kind.equals("all") || book_Kind.equals("")) {
                pstmt = conn.prepareStatement(sql1);
            } else {
                pstmt = conn.prepareStatement(sql2);
                pstmt.setString(1, book_Kind);
            }

            rs = pstmt.executeQuery();
            if (rs.next()) {
                bookList = new ArrayList<MngrDataBean>();
                do {
                    MngrDataBean book = new MngrDataBean();

                    book.setBook_id(rs.getInt("book_id"));
                    book.setBook_kind(rs.getString("book_kind"));
                    book.setBook_title(rs.getString("book_title"));
                    book.setBook_price(rs.getInt("book_price"));
                    book.setBook_count(rs.getShort("book_count"));
                    book.setAuthor(rs.getString("author"));
                    book.setPublishing_com(rs.getString("publishing_com"));
                    book.setPublishing_date(rs.getString("publishing_date"));
                    book.setBook_image(rs.getString("book_image"));
                    book.setDiscount_rate(rs.getByte("discount_rate"));
                    book.setReg_date(rs.getTimestamp("reg_date"));

                    bookList.add(book);
                } while(rs.next());
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) { try { rs.close(); } catch (SQLException ex) {} }
            if (pstmt != null) { try { pstmt.close(); } catch (SQLException ex) {} }
            if (conn != null) { try { conn.close(); } catch (SQLException ex) {} }
        }
        return bookList;
    }

    public MngrDataBean[] getBooks(String book_kind, int count) throws Exception {
        conn = null;
        pstmt = null;
        rs = null;
        MngrDataBean bookList[] = null;
        int i = 0;

        try {
            conn = getConnection();
            String sql = "SELECT * FROM pBook WHERE book_kind = ? ORDER BY reg_date DESC LIMIT ?,?";

            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, book_kind);
            pstmt.setInt(2,0);
            pstmt.setInt(3, count);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                bookList = new MngrDataBean[count];
                do {
                    MngrDataBean book = new MngrDataBean();

                    book.setBook_id(rs.getInt("book_id"));
                    book.setBook_kind(rs.getString("book_kind"));
                    book.setBook_title(rs.getString("book_title"));
                    book.setBook_price(rs.getInt("book_price"));
                    book.setBook_count(rs.getShort("book_count"));
                    book.setAuthor(rs.getString("author"));
                    book.setPublishing_com(rs.getString("publishing_com"));
                    book.setPublishing_date(rs.getString("publishing_date"));
                    book.setBook_image(rs.getString("book_image"));
                    book.setDiscount_rate(rs.getByte("discount_rate"));
                    book.setReg_date(rs.getTimestamp("reg_date"));

                    bookList[i] = book;
                    i++;
                }while (rs.next());
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) { try { rs.close(); } catch (SQLException ex) {} }
            if (pstmt != null) { try { pstmt.close(); } catch (SQLException ex) {} }
            if (conn != null) { try { conn.close(); } catch (SQLException ex) {} }
        }
        return bookList;
    }

    public MngrDataBean getBooks(int bookId) throws Exception {
        conn = null;
        pstmt = null;
        rs = null;
        MngrDataBean book = null;

        try {
            conn = getConnection();
            pstmt = conn.prepareStatement("SELECT * FROM pBook WHERE book_id = ?");
            pstmt.setInt(1, bookId);

            rs = pstmt.executeQuery();
            if (rs.next()) {
                book = new MngrDataBean();

                book.setBook_id(rs.getInt("book_id"));
                book.setBook_kind(rs.getString("book_kind"));
                book.setBook_title(rs.getString("book_title"));
                book.setBook_price(rs.getInt("book_price"));
                book.setBook_count(rs.getShort("book_count"));
                book.setAuthor(rs.getString("author"));
                book.setPublishing_com(rs.getString("publishing_com"));
                book.setPublishing_date(rs.getString("publishing_date"));
                book.setBook_image(rs.getString("book_image"));
                book.setDiscount_rate(rs.getByte("discount_rate"));
                book.setReg_date(rs.getTimestamp("reg_date"));
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) { try { rs.close(); } catch (SQLException ex) {} }
            if (pstmt != null) { try { pstmt.close(); } catch (SQLException ex) {} }
            if (conn != null) { try { conn.close(); } catch (SQLException ex) {} }
        }
        return book;
    }

    public void updateBook(MngrDataBean book, int bookId) throws Exception {
        conn = null;
        pstmt = null;
        String sql;

        try {
            conn = getConnection();

            sql = "UPDATE pBook SET book_kind = ?, book_title = ?, book_price = ?, book_count = ?, author = ?," +
                    "publishing_com = ?, publishing_date = ?, book_image = ?, book_content = ?, discount_rate = ?," +
                    "where book_id = ?";

            pstmt = conn.prepareStatement(sql);

            pstmt.setString(1,book.getBook_kind());
            pstmt.setString(2,book.getBook_title());
            pstmt.setInt(3,book.getBook_price());
            pstmt.setShort(4,book.getBook_count());
            pstmt.setString(5,book.getAuthor());
            pstmt.setString(6,book.getPublishing_com());
            pstmt.setString(7,book.getPublishing_date());
            pstmt.setString(8,book.getBook_image());
            pstmt.setString(9,book.getBook_content());
            pstmt.setByte(10,book.getDiscount_rate());
            pstmt.setInt(11,bookId);

            pstmt.executeUpdate();

        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            if (pstmt != null) { try { pstmt.close(); } catch (SQLException ex) {} }
            if (conn != null) { try { conn.close(); } catch (SQLException ex) {} }
        }
    }

    public void deleteBook(int bookId) throws Exception {
        conn = null;
        pstmt = null;

        try {
            conn = getConnection();

            pstmt = conn.prepareStatement("DELETE FROM pBook WHERE book_id = ?");
            pstmt.setInt(1,bookId);
            pstmt.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            if (pstmt != null) { try { pstmt.close(); } catch (SQLException ex) {} }
            if (conn != null) { try { conn.close(); } catch (SQLException ex) {} }
        }
    }
}