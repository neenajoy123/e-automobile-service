<%-- 
    Document   : ChangePassword
    Created on : Feb 22, 2018, 1:50:42 PM
    Author     : ckc
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean id="obj" class="mydb.dbconnection"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Company:Change Password</title>
    </head>
    <body>
       
        <%
            String current="";
            String newpwd="";
            String retype="";
            if(request.getParameter("btnsubmit")!=null)
            {
                current=request.getParameter("txtcpwd");
                newpwd=request.getParameter("txtnpwd");
                retype=request.getParameter("txtrpwd");
                if(newpwd.equals(retype))
                {
                   String sel="select l.login_id from tbl_login l inner join tbl_company c on l.login_id=c.login_id where l.login_password='"+current+"' and c.comp_id='"+session.getAttribute("company")+"'";
                   ResultSet rs=obj.selectData(sel);
                   if(rs.next())
                   {
                       String logid=rs.getString("l.login_id");
                       String update="update tbl_login set login_password='"+newpwd+"' where login_id="+logid;
                       
                       boolean b=obj.ExecuteCommand(update);
                       if(b==true)
                       {
                            %>
                    <script>
                        alert("Password Changed");
                    </script>
                    <%
                       }
                   }
                   else
                   {
                        %>
                    <script>
                        alert("Current Password Missmatch");
                    </script>
                    <%
                   }
                }
                else
                {
                    %>
                    <script>
                        alert("New Password Missmatch");
                    </script>
                    <%
                }
            }
        
        %>
        
        <form>
            <center><h1>Change Password</h1></center>
            <br>
            <table align="center" border="1">
                <tr>
                    <th>Current Password</th>
                    <td><input type="password" name="txtcpwd" required=""></td>
                </tr>
                <tr>
                    <th>New Password</th>
                    <td><input type="password" name="txtnpwd" required=""></td>
                </tr>
                <tr>
                    <th>Retype Password</th>
                    <td><input type="password" name="txtrpwd" required=""></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="btnsubmit" value="Change">
                        <input type="reset" name="btnreset" value="Cancel">
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>
