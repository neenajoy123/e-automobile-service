<%-- 
    Document   : UpdateServiceDetails
    Created on : 17 Apr, 2018, 2:53:01 PM
    Author     : user
--%>
<jsp:useBean id="obj" class="mydb.dbconnection"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Service Requests</title>
    </head>
    <body>
        <%
            if(request.getParameter("btnsubmit")!=null)
            {
                String update="update tbl_service set service_charge='"+request.getParameter("txtcharge")+"',service_days='"+request.getParameter("txtdays")+"',service_status=1 where service_id="+session.getAttribute("serviceID");
                boolean b=obj.ExecuteCommand(update);
                if(b)
                {
                    %>
                    <script>
                        alert("Accepted");
                        setTimeout(function(){window.location.href='ViewServiceRequests.jsp'},100);
                    </script>
                    <%
                }
            }
        
        %>
        <br>
        <br>
        <form>
            <table align="center" border="1">
                <tr>
                    <th>Days Required</th>
                    <td>
                        <input type="text" name="txtdays" required="">
                    </td>
                </tr>
                <tr>
                    <th>Expected Service Charge</th>
                    <td>
                        <input type="text" name="txtcharge" required="">
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="btnsubmit" value="Submit">
                        <input type="reset" name="btnreset" value="Cancel">
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>
