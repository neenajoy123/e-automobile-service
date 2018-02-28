<%-- 
    Document   : BranchRegistration
    Created on : Feb 15, 2018, 10:27:42 AM
    Author     : ckc
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean id="obj" class="mydb.dbconnection"></jsp:useBean>
    
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Branch Registration</title>
    </head>
    <body>
        <%
            String Branchname="";
            String Address="";
            String Contact="";
            String Email="";
            String Startdate=""; 
            String Runby="";
            String PlaceId="";
            String LoginId="";
            String username=""; 
            String pass="";
           
            if(request.getParameter("btnsubmit")!=null);
            {
                       
                        
                        Branchname=request.getParameter("txtname");
                        Address=request.getParameter("txtname1");
                        Contact=request.getParameter("txtname2");
                        PlaceId=request.getParameter("place");
                        Email=request.getParameter("txtname3");
                        Startdate=request.getParameter("txtname4");
                        Runby=request.getParameter("txtname5");
                        username=request.getParameter("txtname6");
                        pass=request.getParameter("txtname7");
                       
                        
                        String ins="insert into tbl_login(login_username,login_password,login_type)values('"+username+"','"+pass+"','branch')";
                        boolean b1=obj.ExecuteCommand(ins);
                        
                          String selqury ="Select max(login_id)as login from tbl_login";
                            ResultSet rss1 = obj.selectData(selqury);
                            if (rss1.next()) 
                            {
                                LoginId = rss1.getString("login");
                            }
                            String insQry="insert into tbl_branch(branch_name,branch_address,branch_contact,place_id,branch_email,branch_startdate,branch_runby,login_id)values('"+Branchname+"','"+Address+"','"+Contact+"','"+PlaceId+"','"+ Email+"','"+Startdate+"','"+Runby+"','" + LoginId + "')";
                           
                         //   boolean b2 = obj.ExecuteCommand(insQry);
                        if (obj.ExecuteCommand(insQry)) 
                        {
                            
                               out.println(insQry);
                            %>
                            <script  type="text/javascript">
                                alert("success");
                            </script>
                            <%
                        }
                     
                           
                        
                                
                            
                      
        else
                            
                            {
                                   out.println("Failed  : "+insQry);  
                                    
                                    }
                }
                         
          %>
        
    
       <center><h1>Branch Registration</h1></center>  
    <form>
       
        <table align="center" border="1">
          <tr>
              <th>
                  Branch Name
              </th>
              <td>
                  <input type="text"  name="txtname">
              </td>
              </tr>
              
              <tr>
              <th>
                  Address
              </th>
              <td>
                  <textarea   name="txtname1" required=""></textarea>
              </td>
              </tr>
              
              <tr>
              <th>
                  Contact No
              </th>
              <td>
                  <input type="text"  name="txtname2">
              </td>
              </tr>
              <tr>
              <th>
                  Place
              </th>
              <td><select name="place">
                      <option value="s">---select---</option>
                      <%
                                        String s="select * from tbl_place";
                                        ResultSet rs=obj.selectData(s);
                                        while(rs.next())
                                        {
                                        
                                            %>
            
                      <option value="<%=rs.getString("place_id")%>"><%=rs.getString("place_name")%></option>
                      <%
                      }
                      %>
                  </select>
                  
              </td>
              </tr>
              
              <tr>
              <th>
                  Email
              </th>
              <td>
                  <input type="text"  name="txtname3">
              </td>
              </tr>
              
              <tr>
              <th>
                  Start Date
              </th>
              <td>
                  <input type="text"  name="txtname4">
              </td>
              </tr>
              
              <tr>
              <th>
                  Run By
              </th>
              <td>
                  <input type="text"  name="txtname5">
              </td>
              </tr>
              
               
              
               <tr>
              <th>
                  Username
              </th>
              <td>
                  <input type="text"  name="txtname6">
              </td>
              </tr>
              
               <tr>
              <th>
                  Password
              </th>
              <td>
                  <input type="text"  name="txtname7">
              </td>
              </tr>
              
          <tr>
              <td colspan="2" align="center">
                  <input type="submit" name="btnsubmit" value="submit">
                  
              </td>
    </tr>
        </table>
        
                
    </form>
    </body>
</html>
