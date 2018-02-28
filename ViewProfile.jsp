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
               String Compid="";
               String Compname="";
               String Address="";
               String Contact="";
               String Email="";
               String Startdate="";
               String Logo="";
               
               String sell="select * from tbl_company where comp_id='"+session.getAttribute("company")+"'";
               ResultSet rs1=obj.selectData(sell);
               if(rs1.next())
               {
                   Compname=rs1.getString("comp_name");
                   Address=rs1.getString("comp_address");
                   Contact=rs1.getString("comp_con_no");
                   Email=rs1.getString("comp_email");
                   Startdate=rs1.getString("comp_start_date");
                   Logo=rs1.getString("comp_logo");
               }
               
               
            %>
    <form>
        <h1><center>View Profile</center></h1>
        <table align="center" border="1">
            <tr>
                <th>
                    Company Name
                </th>
                <td><%=Compname%></td>
            
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
                       Logo
                   </th>
                  <td><img src="Logo/<%=Logo%>" height="100" width="100"></td> 
            </tr>
            <tr>
                <td align="center" colspan="2">
                    <a href="EditProfile.jsp">Edit profile</a>
                </td>
                <tr>
                <td align="center" colspan="2">
                    <a href="ChangePassword.jsp">Change Password</a>
                </td>
            
            </tr>
            
                   
                   
                    </table>
    </form>
        
    </body>
</html>
