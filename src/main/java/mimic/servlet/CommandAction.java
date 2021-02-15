package mimic.servlet;

/*
This class gate of command process class for project.
and, Manages command processing classes
 */

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface CommandAction {
    public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable;
}
