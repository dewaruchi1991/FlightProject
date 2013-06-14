/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.flight.servlet;

import com.autowired.model.Search;
import com.autowired.util.HtmlUnitService;
import com.gargoylesoftware.htmlunit.BrowserVersion;
import com.gargoylesoftware.htmlunit.Page;
import com.gargoylesoftware.htmlunit.RefreshHandler;
import com.gargoylesoftware.htmlunit.WebClient;
import com.gargoylesoftware.htmlunit.html.DomElement;
import com.gargoylesoftware.htmlunit.html.HtmlAnchor;
import com.gargoylesoftware.htmlunit.html.HtmlForm;
import com.gargoylesoftware.htmlunit.html.HtmlPage;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URL;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ACER
 */
@WebServlet(name = "Reserve", urlPatterns = {"/Reserve", "/Search"})
public class Reserve extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String url = request.getServletPath().toString();

        if (url.equals("/Search")) {
            try {
                boolean isReturn = Boolean.parseBoolean(request.getParameter("isReturn"));
                String from = request.getParameter("from");
                String to = request.getParameter("to");
                String departDate = request.getParameter("departDate");
                String departMonth = request.getParameter("departMonth");
                String departYear = request.getParameter("departYear");
                String departMonthYear = departMonth + "-" + departYear;
                String returnDate = request.getParameter("returnDate");
                String returnMonth = request.getParameter("returnMonth");
                String returnYear = request.getParameter("returnYear");
                String returnMonthYear = returnMonth + "-" + returnYear;
                int adult = Integer.parseInt(request.getParameter("adult"));
                int child = Integer.parseInt(request.getParameter("child"));
                int infant = Integer.parseInt(request.getParameter("infant"));


                System.out.println("Nilai = " + isReturn);
                System.out.println("adult = " + adult);

                Search search = new Search();
                search.setReturn(isReturn);
                search.setFrom(from);
                search.setTo(to);
                search.setDepartDate1(departDate);
                search.setDepartDate2(departMonthYear);
                search.setReturnDate1(returnDate);
                search.setReturnDate2(returnMonthYear);

                search.setAdult(adult);
                search.setChild(child);
                search.setInfant(infant);
                DomElement divResult = null;



                WebClient webClient = new WebClient(BrowserVersion.FIREFOX_10);
                webClient.setThrowExceptionOnScriptError(false);
                webClient.setJavaScriptEnabled(false);
                webClient.setRefreshHandler(new RefreshHandler() {
                    @Override
                    public void handleRefresh(Page page, URL url, int arg) throws IOException {
                        System.out.println("handleRefresh");
                    }
                });

                HtmlPage loginPage = webClient.getPage("https://agent.sriwijayaair.co.id/b2b/secure/home.jsp");
                HtmlForm forms = loginPage.getForms().get(0);

                HtmlUnitService htmlUnitService = new HtmlUnitService();
                HtmlPage pageResult = htmlUnitService.login(forms, "nca-user", "user321");
                boolean isSuccess = htmlUnitService.checkIsLoginSuccess(pageResult);
                if (isSuccess) {
                    HtmlForm formSearch = pageResult.getFormByName("form1");
                    HtmlPage pageResultSearch = htmlUnitService.searchFlight(formSearch, search);

                    divResult = pageResultSearch.getElementById("mainWrapper");
                    System.out.println(divResult==null);
                    System.out.println(divResult.asXml());

                    HtmlAnchor btnLogout = pageResult.getAnchorByHref("./logout.jsp");
                    String hrefAttribute = btnLogout.getHrefAttribute();
                    System.out.println(hrefAttribute);
                    System.out.println(btnLogout.asXml());
                    btnLogout.click();
                }


                webClient.closeAllWindows();

                request.setAttribute("result", (divResult!=null)?divResult.asXml():"Server Sedang Sibuk Cobalah Beberapa Saat Lagi");

            } catch (Exception ex) {
                ex.printStackTrace();
            }

            RequestDispatcher rd = request.getRequestDispatcher("/display.jsp");
            rd.forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
