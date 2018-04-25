<%-- 
    Document   : ViewGameApplication
    Created on : 25 Apr, 2018, 7:50:39 AM
    Author     : user
--%>
<%@page import="mydb.mailconnection"%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean id="obj" class="mydb.dbconnection"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Game Application</title>
    </head>
    <body>
        <form>
            <%
                if(request.getParameter("aid")!=null)
                {
                    String mail[]={request.getParameter("aid")};
                   boolean b= mailconnection.sendMail(mail, "Applicateion for Game", "Your Application for game participation is Accepted ");
                    if(b)
                    {
                        response.sendRedirect("ViewGameApplication.jsp");
                    }
                }
                if(request.getParameter("rid")!=null)
                {
                     String mail[]={request.getParameter("rid")};
                   boolean b= mailconnection.sendMail(mail, "Applicateion for Game", "Your Application for game participation is Rejected ");
                    if(b)
                    {
                        response.sendRedirect("ViewGameApplication.jsp");
                    }
                }
            %>
            <table align="border" border="1">
                <tr>
                    <th>Customer Name</th>
                    <th>Contact</th>
                    <th>Email</th>
                </tr>
                <%
                    String sel="select gameapp_id,cust_name,cust_contact,cust_email from tbl_gameapp where game_id="+session.getAttribute("game");
                    ResultSet rs=obj.selectData(sel);
                    while(rs.next())
                    {
                        %>
                        <tr>
                            <td><%=rs.getString("cust_name")%></td>
                            <td><%=rs.getString("cust_contact")%></td>
                            <td><%=rs.getString("cust_email")%></td>
                            <td><a href="ViewGameApplication.jsp?aid=<%=rs.getString("cust_email")%>">Accept</a></td>
                            <td><a href="ViewGameApplication.jsp?rid=<%=rs.getString("cust_email")%>">Reject</a></td>
                        </tr>
                        <%
                    }
                %>
            </table>
        </form>
    </body>
</html>
