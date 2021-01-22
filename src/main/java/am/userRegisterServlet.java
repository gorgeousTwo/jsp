package am;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "userRegisterServlet", value = "/userRegisterServlet")
public class userRegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1l;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        String userId = request.getParameter("userId");
        String userPwd1 = request.getParameter("userPwd1");
        String userPwd2 = request.getParameter("userPwd2");
        String userName = request.getParameter("userName");
        String userAge = request.getParameter("userAge");
        String userGender = request.getParameter("userGender");
        String userEmail = request.getParameter("userEmail");

        if (userId == null || userId.equals("") || userPwd1 == null || userPwd1.equals("") ||
                userPwd2 == null || userPwd2.equals("") || userName == null || userName.equals("") ||
                userAge == null || userAge.equals("") || userGender == null || userGender.equals("") ||
                userEmail == null || userEmail.equals("")) {
            request.getSession().setAttribute("messageType","Error Message");
            request.getSession().setAttribute("messageContent","NULL");
            return;
        }

        if (userPwd1.equals(userPwd2)) {
            request.getSession().setAttribute("messageType","Error Message");
            request.getSession().setAttribute("messageContent","PWD Check");
        }

        userDTO dto = new userDTO();
        dto.setUserId(userId);
        dto.setUserPwd(userPwd1);
        dto.setUserName(userName);
        dto.setUserAge(userAge);
        dto.setUserGender(userGender);
        dto.setUserEmail(userEmail);
        userDAO dao = new userDAO();
        int check = dao.register(dto);

        if (check == 1) {
            request.getSession().setAttribute("messageType","Success");
            request.getSession().setAttribute("messageContent","Register Success");
            return;
        } else {
            request.getSession().setAttribute("messageType","Error Message");
            request.getSession().setAttribute("messageContent","Register Failed.");
            return;
        }

    }
}
