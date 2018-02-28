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
        <title>Accepted Company</title>
    </head>
    <body>
         <form>
            
                   <table class="table table-hover" align="center" border="2">
                       <tr><td>Sl no</td><td>Name</td><td>Address</td><td>Contact Number</td><td>Place</td><td>Email</td><td>Start Date</td><td>Run By</td>
                       </tr>
                   
                     <% int i=1;
    String str="select * from tbl_branch  b inner join tbl_place p on b.place_id=p.place_id where branch_status=1";
    ResultSet rs=obj.selectData(str);
    while(rs.next())
    {
     %>
     <tr>
         <td><%=i%></td>
         <td><%=rs.getString("branch_name")%></td>
         <td><%=rs.getString("branch_address")%></td>    
         <td><%=rs.getString("branch_contact")%></td>
         <td><%=rs.getString("place_name")%></td>
         <td><%=rs.getString("branch_email")%></td>
         <td><%=rs.getString("branch_startdate")%></td>
         <td><%=rs.getString("branch_runby")%></td>
         
          
         
         
         </tr>
             
   
    <%
    i++;
    }
    %>
  

                   
                   
                   </table>
            
            
            
            
            
        </form>
    </body>
</html>
