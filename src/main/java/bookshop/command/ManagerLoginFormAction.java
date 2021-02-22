package bookshop.command;

import mimic.servlet.CommandAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ManagerLoginFormAction implements CommandAction {

    @Override
    public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
        return "/mngr/login/mLoginForm.jsp";
    }
}
