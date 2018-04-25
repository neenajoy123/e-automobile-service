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
            String update="update tbl_branchcomplaint set bcomp_status=1 where bcomp_id="+request.getParameter("id");
            boolean b=obj.ExecuteCommand(update);
            if(b)
            {
                response.sendRedirect("ComplaintsView.jsp");
            }
            
        }
          if(request.getParameter("did")!=null)
        {
            String update="delete from tbl_branchcomplaint  where bcomp_id="+request.getParameter("did");
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
                    <th>Branch</th>
                    <th>Contact</th>
                    <th>Status</th>
                </tr>
                <%
                String sel="select bcomp_name,bcomp_desc,bcomp_id,bcomp_date,branch_name,branch_contact,bcomp_status from tbl_branchcomplaint c inner join tbl_branch cu on c.branch_id=cu.branch_id where c.comp_id="+session.getAttribute("Company");
                ResultSet rs=obj.selectData(sel);
                
                while(rs.next())
                {
                    %>
                    <tr>
                        <td><%=rs.getString("bcomp_name")%></td>
                        <td><%=rs.getString("bcomp_desc")%></td>
                        <td><%=rs.getString("bcomp_date")%></td>
                        <td><%=rs.getString("branch_name")%></td>
                        <td><%=rs.getString("branch_contact")%></td>
                        
                        <%
                        if(rs.getString("complaint_status").equals("0"))
                        {
                        %>
                        <td>New</td>
                        <td><a href="ComplaintsView.jsp?id=<%=rs.getString("bcomp_id")%>">Mark as Read</a></td>
                        <%
                        }
                        else if(rs.getString("complaint_status").equals("1"))
                        {
                             %>
                        <td>Already Viewed</td>
                        <td><a href="ComplaintsView.jsp?did=<%=rs.getString("bcomp_id")%>">Delete</a></td>
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
