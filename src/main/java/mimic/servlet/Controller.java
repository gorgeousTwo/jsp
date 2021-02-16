package mimic.servlet;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.ResourceBundle;

/**
 * Servlet implementation class Controller
 */

@WebServlet(
        urlPatterns = {
                "/Controller",
                "*.do"
        },
        initParams = {
                @WebInitParam(name = "propertyConfig", value = "mimic.proper.properties")
        }
)
public class Controller extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private Map<String, Object> commandMap = new HashMap<String, Object>();

    /**
     * @see HttpServlet#HttpServlet()
     */

    public Controller() {
        super();
    }

    /**
     * @see Servlet#init(ServletConfig);
     */
    public void init(ServletConfig config) throws ServletException {
        loadPro("mimic/proper/mapping");
    }

    /**
     *
     * 1.rs get "mimic/proper/mapping". (mapping.properties)
     * 2.action is store key of mapping.properties. example : /mg/managerMain.do
     * 3.String className will store pair Value. example : bookshop.command.ManagerMainAction
     * 4.Class commandClass = Class.forName(bookshop.command.ManagerMainAction);
     * 5.Object commandInstance : get newInstance();
     *
     * As a result, commandMap.put(/mg/managerMain.do, pair value(class)'s instance);
     *
     * @param path is init() param. loadPro : Can't access/use other method and etc.
     */

    private void loadPro(String path) {
        ResourceBundle rs = ResourceBundle.getBundle(path);
        Enumeration<String> action = rs.getKeys();

        while (action.hasMoreElements()) {
            String command = action.nextElement();
            String className = rs.getString(command);

            try {
                Class commandClass = Class.forName(className);
                Object commandInstance = commandClass.newInstance();
                commandMap.put(command, commandInstance);
            } catch (ClassNotFoundException e) {
                continue;
            } catch (InstantiationException e) {
                e.printStackTrace();
            } catch (IllegalAccessException e) {
                e.printStackTrace();
            }
        }
    }


    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     * Use requestPro() of this class.
     */

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        requestPro(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     * Use requestPro() of this class.
     */

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        requestPro(request, response);
    }

    /**
     *
     * -Command Pattern-
     *
     * 1.CommandAction com will store Class root('package.package.class' like this), from commandMap.
     * 2.As a result, String view is execute other implemented requestPro().
     * 3.request.setAttribute.
     * 4.forward.
     */

    private void requestPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String view = null;
        CommandAction com = null;
        try {
            String command = request.getRequestURI();
            if (command.indexOf(request.getContextPath()) == 0) {
                command = command.substring(request.getContextPath().length());
            }

            com = (CommandAction) commandMap.get(command);
            view = com.requestPro(request, response);
        } catch (Throwable e) {
            e.printStackTrace();
        }

        if (view == null || view.equals("")) {
            return;
        }

        request.setAttribute("cont",view);
        RequestDispatcher dispatcher = request.getRequestDispatcher(view);
        dispatcher.forward(request, response);
    }
}