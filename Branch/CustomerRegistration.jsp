<%-- 
    Document   : customerRegistration
    Created on : Feb 15, 2018, 10:55:53 AM
    Author     : ckc
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean id="obj" class="mydb.dbconnection"></jsp:useBean>
    
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script src="jquery.js" type="text/javascript"></script>
                 <script>
            function getPlace(v)
            {
                         // alert(v);
             $.ajax({url: "AjaxPlace.jsp?id="+v, success: function(result){
        $("#pl").html(result);
    }});
            }
            </script>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer Registration</title>
    </head>
    <body>
      
      <form action="CustomerPhotoUpload.jsp" method="post" enctype="multipart/form-data" > 
       
        <table align="center"  border="1">
          <tr>
              <td>
                  Customer Name
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
                        District Name
                    </td>
                  
                     <td>
                         <select name="district" onchange="getPlace(this.value)">
                             <option value="">
                                --select--
                            </option>
                            
                             <%
                            String str1="select * from tbl_district";
                            ResultSet rs1=obj.selectData(str1);
                            while (rs1.next())
                            {
                           %>
                           <option value="<%=rs1.getString("dis_id")%>">
                               <%=rs1.getString("dis_name")%>
                           </option>
                            <%
                            }
                            %>
                            
                        </select><br> 
                    </td>
                
                </tr>
                    
                 <tr>
                    <td>
                        Place Name
                    </td>
                   
                    <td>
                       <select name="place" id="pl" required="">
                           <option value="">
                                --select--
                            </option>
                            
                                                 
                        </select>
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
                  Adhar Number
              </td>
              <td>
                  <input type="text"  name="txtadhar">
              </td>
              </tr>
              
              
            
              
              <tr>
              <td>
                  Photo
              </td>
              <td>
                  <input type="file"  name="txtphoto">
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
    
