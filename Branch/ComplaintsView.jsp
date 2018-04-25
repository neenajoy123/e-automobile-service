<%-- 
    Document   : ComplaintsView
    Created on : Feb 15, 2018, 11:05:27 AM
    Author     : ckc
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean id="obj" class="mydb.dbconnection"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Complaint View</title>
    </head>
    <body>
        <%
        if(request.getParameter("id")!=null)
        {
            String update="update tbl_complaint set complaint_status=1 where complaint_id="+request.getParameter("id");
            boolean b=obj.ExecuteCommand(update);
            if(b)
            {
                response.sendRedirect("ComplaintsView.jsp");
            }
            
        }
          if(request.getParameter("did")!=null)
        {
            String update="delete from tbl_complaint  where complaint_id="+request.getParameter("did");
            boolean b=obj.ExecuteCommand(update);
            if(b)
            {
                response.sendRedirect("ComplaintsView.jsp");
            }
            
        }%>
        <form>
            <br>
            <table border="1" align="center">
                <tr>
                    <th>Complaint Subject</th>
                    <th>Description</th>
                    <th>Date</th>
                    <th>Customer</th>
                    <th>Contact</th>
                    <th>Status</th>
                </tr>
                <%
                String sel="select complaint_name,complaint_des,complaint_id,complaint_date,cus_name,cus_con_no,complaint_status from tbl_complaint c inner join tbl_customer cu on c.cus_id=cu.cus_id where c.branch_id="+session.getAttribute("Branch");
                ResultSet rs=obj.selectData(sel);
                
                while(rs.next())
                {
                    %>
                    <tr>
                        <td><%=rs.getString("complaint_name")%></td>
                        <td><%=rs.getString("complaint_des")%></td>
                        <td><%=rs.getString("complaint_date")%></td>
                        <td><%=rs.getString("cus_name")%></td>
                        <td><%=rs.getString("cus_con_no")%></td>
                        <%
                        if(rs.getString("complaint_status").equals("0"))
                        {
                        %>
                        <td>New</td>
                        <td><a href="ComplaintsView.jsp?id=<%=rs.getString("complaint_id")%>">Mark as Read</a></td>
                        <%
                        }
                        else if(rs.getString("complaint_status").equals("1"))
                        {
                             %>
                        <td>Already Viewed</td>
                        <td><a href="ComplaintsView.jsp?did=<%=rs.getString("complaint_id")%>">Delete</a></td>
                        <%
                        }
%>
                    </tr>
                    <%
                }
                %>
            </table>
        </form>
    </body>
</html>
