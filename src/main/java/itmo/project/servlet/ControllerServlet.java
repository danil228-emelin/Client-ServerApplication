package itmo.project.servlet;

import itmo.project.bean.EntriesBean;
import itmo.project.exception.TimeFormatException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;

import java.io.IOException;
@WebServlet("")
@Slf4j
public class ControllerServlet extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        System.out.println("ControllerServlet get method starts");
        var x = request.getHeader("x");
        var y = request.getHeader("y");
        var r = request.getHeader("r");
        var requestTime = request.getHeader("currentTime");
        if (x == null && y == null && r == null && requestTime == null) {
            var dispatcher = request.getRequestDispatcher("/index.jsp");
            System.out.println("Headers are null,ControllerServlet forwarded response to /index.jsp");
            dispatcher.forward(request, response);
            return;
        }

        if (requestTime == null) {
            throw new TimeFormatException("REQUEST TIME IS NULL");
            }
        var dispatcher = request.getRequestDispatcher("/checkServlet");
        System.out.println("Headers aren't null,ControllerServlet forwarded response to /checkServlet");
        dispatcher.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        doGet(request, response);
    }
    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        EntriesBean entries = (EntriesBean) request.getSession().getAttribute("entries");
        if (entries != null) {
            entries.getEntryList().clear();
            System.out.println("Clear bean");
        }
    }
}
