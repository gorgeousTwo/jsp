package review;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "review", value = "/review")
public class review extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html charset=utf-8");

        String reName = request.getParameter("reName");
        String rePwd = request.getParameter("rePwd");
        String reTel = request.getParameter("reTel");

        reDTO reDTO = new reDTO();
        reDTO.setReName(reName);
        reDTO.setRePwd(rePwd);
        reDTO.setReTel(reTel);

        reDAO reDAO = new reDAO();
        reDAO.insertDAO(reDTO);
    }
}
