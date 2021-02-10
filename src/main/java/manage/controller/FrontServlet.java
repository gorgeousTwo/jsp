package manage.controller;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.ResourceBundle;


@WebServlet(name = "FrontServlet", value = "/FrontServlet")
public class FrontServlet extends HttpServlet {

    private static final long serialVersionUID = 1l;

    private Map frontMap = new HashMap();

    @Override
    public void init(ServletConfig config) throws ServletException {
        loadProperties("manage/properties/Front");
    }

    private void loadProperties(String path) {
        //Save path
        ResourceBundle rb = ResourceBundle.getBundle(path);

        Enumeration<String> actionEnum = rb.getKeys();

        while (actionEnum.hasMoreElements()) {
            String command = actionEnum.nextElement();
            String className = rb.getString(command);
            try {
                Class commandClass = Class.forName(className);
                Object commandInstance = commandClass.newInstance();
                frontMap.put(command, commandInstance);
            } catch (ClassNotFoundException e) {
                continue;
            } catch (InstantiationException e) {
                e.printStackTrace();
            } catch (IllegalAccessException e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        requestPro(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        requestPro(request, response);
    }

    private void requestPro (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String view = null;
        CommandAction com = null; //Super interface CommandAction

        try {
            String command = request.getRequestURI();

            if (command.indexOf(request.getContextPath()) == 0) {
                command = command.substring(request.getContextPath().length());
            }

            com = (CommandAction) frontMap.get(command);

            if (com == null || com.equals("")) {
                System.out.println("Not found : " + command);
                return;
            }

            view = com.requestPro(request,response);

            if (view == null || view.equals("")) {
                return;
            }
        } catch (Throwable e) {
            throw new ServletException(e);
        }

        if (view == null || view.equals("")) {
            return;
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher(view);
        dispatcher.forward(request,response);
    }
}
