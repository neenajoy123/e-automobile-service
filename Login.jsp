<%-- 
    Document   : Login
    Created on : Feb 21, 2018, 3:21:59 PM
    Author     : ckc
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean id="obj" class="mydb.dbconnection"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
    <center><h1>Login</h1></center>
    <%
        String username="";
        String pass="";
        if(request.getParameter("btnsub")!=null)
        {
          username=request.getParameter("txtuser");
          pass=request.getParameter("txtpass");
          
          String sel="Select comp_id from tbl_company c inner join tbl_login l on c.login_id=l.login_id where l.login_username='"+username+"' and l.login_password='"+pass+"' and comp_status=1 and l.login_type='Company'";
          String branch="Select branch_id from tbl_branch b inner join tbl_login l on b.login_id=l.login_id where l.login_username='"+username+"' and l.login_password='"+pass+"' and branch_status=1 and l.login_type='branch'";
          ResultSet rs=obj.selectData(sel);
          ResultSet rsbranch=obj.selectData(branch);
          if (rs.next())
          {
              session.setAttribute("company", rs.getString("comp_id"));
              response.sendRedirect("../Company/HomePage.jsp");
          }
          else if(rsbranch.next())
          {
              session.setAttribute("Branch",rsbranch.getString("branch_id"));
              response.sendRedirect("../Branch/Homepage.jsp");
          }
          
          
          else
          {
              String sel1="select login_id from tbl_login where login_username='"+username+"' and login_password='"+pass+"' and login_type='Admin'";
              out.println(sel1);
              ResultSet rs1=obj.selectData(sel1);
              
              if(rs1.next())
              {
                  response.sendRedirect("../Admin/HomePage.jsp");
              }
              else
              {
                  %>
    <script>
        alert("Incorrect username or password");
    </script>
    <%
              }
          }
          
        }
    %>
    <form>
        <table align="center" border="1">
            <tr>
                <td>
                    User Name
                </td>
                <td>
                    <input type="text" name="txtuser" required="">
                </td>
            </tr>
            <tr>
            <td>
                Password
            </td>
            <td>
                <input type="password" name="txtpass" required="">
                </td>
            </tr>
            
               
            
            <tr>
                <td colspan="2" align="center">
                 
                <input type="submit" name="btnsub" value="Login">
                <input type="reset" name="delid" value="Cancel">
                </td>
                </tr>
           
            
        </table>
    </form>
        
    </body>
</html>
