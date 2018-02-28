<%-- 
    Document   : HomePage
    Created on : Feb 22, 2018, 11:16:30 AM
    Author     : ckc
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean id="obj" class="mydb.dbconnection"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Branch:HomePage</title>
    </head>
    <body>
        <%
            String name="";
            String sel="select branch_name from tbl_branch where branch_id='"+session.getAttribute("branch")+"'";
            ResultSet rs=obj.selectData(sel);
            if(rs.next())
            {
               name=rs.getString("branch_name");
            }
        %>
        
        <form>
            <table align="center">
        <h1 align="center">Welcome <%=name%></h1
        
        <tr><td><a href="ViewProfile.jsp">View Profile</a></td><td></td><td></td><td></td>
        
        
        </table>
        </form>
    </body>
</html>
