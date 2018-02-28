<%-- 
    Document   : AcceptedCompany
    Created on : Feb 21, 2018, 2:24:17 PM
    Author     : ckc
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean id="obj" class="mydb.dbconnection"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <form>
            
                   <table class="table table-hover" align="center" border="2">
                       <tr><td>Sl no</td><td>Name</td><td>Address</td><td>Contact Number</td><td>Email</td><td>Start Date</td><td>Logo</td>
                       </tr>
                   
                     <% int i=1;
    String str="select * from tbl_company where comp_status=1";
    ResultSet rs=obj.selectData(str);
    while(rs.next())
    {
     %>
     <tr>
         <td><%=i%></td>
         <td><%=rs.getString("comp_name")%></td>
         <td><%=rs.getString("comp_address")%></td>    
         <td><%=rs.getString("comp_con_no")%></td>
         <td><%=rs.getString("comp_email")%></td>
         <td><%=rs.getString("comp_start_date")%></td>
         <td><img src="../Company/Logo/<%=rs.getString("comp_logo")%>" height="100" width="100"></td>
          
         
         
         </tr>
             
   
    <%
    i++;
    }
    %>
  

                   
                   
                   </table>
            
            
            
            
            
        </form>
    </body>
</html>
