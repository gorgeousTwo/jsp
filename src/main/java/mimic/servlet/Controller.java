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
        loadPro("mimic/proper/properties");
    }

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
     */

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        requestPro(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        requestPro(request, response);
    }

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

        request.setAttribute("cont",view);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
        dispatcher.forward(request, response);
    }
}
