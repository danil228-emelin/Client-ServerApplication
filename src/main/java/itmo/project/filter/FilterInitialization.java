package itmo.project.filter;

import itmo.project.bean.EntriesBean;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import lombok.extern.slf4j.Slf4j;

import java.io.IOException;

@WebFilter("/")
@Slf4j
public class FilterInitialization implements Filter {

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        System.out.println("FilterInitialization starts");

        EntriesBean entries = (EntriesBean) ((HttpServletRequest)servletRequest).getSession().getAttribute("entries");
        if (entries == null) {
            entries = new EntriesBean();
            ((HttpServletRequest)servletRequest).getSession().setAttribute("entries", entries);
            System.out.println("Initialize EntriesBean");
    }
        System.out.println("FilterInitialization finish");

filterChain.doFilter(servletRequest,servletResponse);
    }
}
