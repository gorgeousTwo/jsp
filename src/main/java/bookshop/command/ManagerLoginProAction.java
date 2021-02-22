package bookshop.command;

import mimic.bean.MngrDBBean;
import mimic.servlet.CommandAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ManagerLoginProAction implements CommandAction {
    @Override
    public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
        request.setCharacterEncoding("utf-8");
        String id = request.getParameter("id");
        String pwd = request.getParameter("pwd");

        MngrDBBean dbPro = MngrDBBean.getInstance();
        int check = dbPro.userCheck(id,pwd);

        request.setAttribute("check",new Integer(check));
        request.setAttribute("id",id);

        return "/mngr/logon/mLoginPro.jsp";
    }
}
