<%-- 
    Document   : ViewPrifile
    Created on : Feb 22, 2018, 10:11:53 AM
    Author     : ckc
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean id="obj" class="mydb.dbconnection"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Profile</title>
    </head>
    <body>
       <%
               String Branchid="";
               String Branchname="";
               String Address="";
               String Contact="";
               String Placeid="";
               String Email="";
               String Startdate="";
               String Runby="";
               
               String sell="select * from tbl_branch b inner join tbl_place p on b.place_id=p.place_id where branch_id='"+session.getAttribute("Branch")+"'";
               ResultSet rs1=obj.selectData(sell);
               if(rs1.next())
               {
                   Branchname=rs1.getString("branch_name");
                   Address=rs1.getString("branch_address");
                   Contact=rs1.getString("branch_contact");
                   Placeid=rs1.getString("place_name");
                   Email=rs1.getString("branch_email");
                   Startdate=rs1.getString("branch_startdate");
                   Runby=rs1.getString("branch_runby");
               }
               
               
            %>
    <form>
        <h1><center>View Profile</center></h1>
        <table align="center" border="1">
            <tr>
                <th>
                    Branch Name
                </th>
                <td><%=Branchname%></td>
            
            </tr>
            <tr>
                <th>
                Address
                </th>
                <td><%=Address%></td>
            </tr>
            <tr><th>
                Contact
                </th>
                <td><%=Contact%></td>
            </tr>
            <tr>
            <tr>
                <th>
                    Place
                </th>
                <td><%=Placeid%></td>
            </tr>
            
            
                <th>
                    Email
                </th>
                <td><%=Email%></td>
            </tr>
                
            <tr>
            <th>
                Start Date
                </th>
                <td><%=Startdate%></td>
            </tr>
            <tr>
               
                   <th>
                       Run By
                   </th>
                   <td><%=Runby%></td>
            </tr>
            <tr>
                <td align="center" colspan="2">
                    <a href="BeditProfile.jsp">Edit profile</a>
                </td>
                <tr>
                <td align="center" colspan="2">
                    <a href="BchangePassword.jsp">Change Password</a>
                </td>
            
            </tr>
            
                   
                   
                    </table>
    </form>
        
    </body>
</html>
