<%-- 
    Document   : Companyregistration
    Created on : Feb 8, 2018, 2:57:30 PM
    Author     : ckc
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean id="obj" class="mydb.dbconnection"></jsp:useBean>
    
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><h1>Company Registration</h1></title>
    </head>
    <body>
        
         
         <%
//               String LoginId="";
//               String username=""; 
//               String pass="";
//               String Compid="";
//               String Compname="";
//               String Address="";
//               String Contact="";
//               String Email="";
//               String Startdate="";
//               String Logo="";
//               String Branchid="";
//               String placeid="";
//               
//                if (request.getParameter("btnsubmit") != null) 
//                {
//                        username=request.getParameter("txtname6");
//                        pass=request.getParameter("txtname7");
//                        
//                        Compname=request.getParameter("txtname");
//                        Address=request.getParameter("txtname1");
//                        Contact=request.getParameter("txtname2");
//                        placeid=request.getParameter("place");
//                        Email=request.getParameter("txtname3");
//                        Startdate=request.getParameter("txtname4");
//                        Logo=request.getParameter("txtname5");
//                        Branchid=request.getParameter("branch");
//                        
//                        String ins = "insert into tbl_login(username,password,login_type)values('" + username + "','" + pass + "','client')";
//                        boolean b3 = obj.ExecuteCommand(ins);
//                       
//                            String selqury = "Select max(login_id)as login from tbl_login";
//                            ResultSet rss1 = obj.selectData(selqury);
//                            if (rss1.next()) 
//                            {
//                                LoginId = rss1.getString("login");
//                            }
//
//                        
//                    
//
//                        String insQry = "insert into tbl_company(comp_name,comp_address,place_id,comp_con_no,comp_email,comp_start_date,comp_logo,branch_id,login_id)values('" + Compname + "','" + Address + "','"+placeid+"','" + Contact + "','" + Email + "','" + Startdate + "','" + Logo + "','"+Branchid+"'," + LoginId + "')";
//
//                        out.println(insQry);
//                        boolean b1 = obj.ExecuteCommand(insQry);
//                        if (b1) 
//                        {
//                            %>
<!--//                            <script  type="text/javascript">-->
<!--//                                alert("success");
//                            </script>-->
//                            <%
//                        }
//                           
//                                
//                            
//                      
//        else
//                            
//                            {
//                                    
//                                    out.println(insQry);
//                                    }
//                }
    %>

        
       
      <center><h1>Company Registration</h1></center>  
      <form action="CompanyPhotoUpload.jsp" method="post" enctype="multipart/form-data" > 
       
        <table align="center"  border="1">
          <tr>
              <td>
                  Company Name
              </td>
              <td>
                  <input type="text"  name="txtname">
              </td>
              </tr>
              
              <tr>
              <td>
                  Address
              </td>
              <td>
                  <input type="text"  name="txtaddress">
              </td>
              </tr>
              
              <tr>
              <td>
                  Contact No
              </td>
              <td>
                  <input type="text"  name="txtcontact">
              </td>
              </tr>
              
              <tr>
              <td>
                  Email
              </td>
              <td>
                  <input type="text"  name="txtemail">
              </td>
              </tr>
              
              <tr>
              <td>
                  Start Date
              </td>
              <td>
                  <input type="text"  name="txtdate">
              </td>
              </tr>
              
              <tr>
              <td>
                  Company Logo
              </td>
              <td>
                  <input type="file"  name="txtlogo">
              </td>
              </tr>
              
              
                           
               <tr>
              <td>
                  Username
              </td>
              <td>
                  <input type="text"  name="txtusername">
              </td>
              </tr>
              
               <tr>
              <td>
                  Password
              </td>
              <td>
                  <input type="text"  name="txtpass">
              </td>
              </tr>
              
          <tr>
              <td colspan="2" align="center">
                  <input type="submit" name="btnsubmit" value="submit">
                  <input type="reset" name="btnreset" value="Cancel">
              </td>
    </tr>
        </table>
        
                
    </form>
    </body>
</html>

               
                
        
                    
                    
               
  