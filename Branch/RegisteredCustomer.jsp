<%-- 
    Document   : NewCompany
    Created on : Feb 21, 2018, 1:39:02 PM
    Author     : ckc
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean id="obj" class="mydb.dbconnection"></jsp:useBean>
    
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New Company</title>
         <!--<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>-->
<!--    <script type="text/javascript">
        $("#btnPrint").live("click", function () {
            var divContents = $("#dvContainer").html();
            var printWindow = window.open('', '', 'height=400,width=800');
            printWindow.document.write('<html><head><title>DIV Contents</title>');
            printWindow.document.write('</head><body >');
            printWindow.document.write(divContents);
            printWindow.document.write('</body></html>');
            printWindow.document.close();
            printWindow.print();
        });
    </script>-->
    </head>
    <body>
    

        <form>
            <div id="dvContainer">
                   <table class="table table-hover" align="center" border="2">
                       <tr><td>Sl.No</td>
                           <td>Name</td>
                           <td>Contact</td>
                           <td>Email</td>
                           <td>AdharNo</td>
                          
                           <td>District</td>
                           <td>Place</td>
                           
                       </tr>
                   
                     <% int i=1;
    String str="select cus_id,cus_name,cus_address,cus_con_no,cus_email,cus_adharno,cus_photo,dis_name,place_name from tbl_customer c inner join tbl_district d on c.dis_id=d.dis_id inner join tbl_place p on c.place_id=p.place_id where c.branch_id="+session.getAttribute("Branch");
    ResultSet rs=obj.selectData(str);
    while(rs.next())
    {
     %>
     <tr>
         <td><%=i%></td>
         <td><%=rs.getString("cus_name")%></td>
         <td><%=rs.getString("cus_con_no")%></td>    
         <td><%=rs.getString("cus_email")%></td>
         <td><%=rs.getString("cus_adharno")%></td>
         <td><%=rs.getString("dis_name")%></td>
          <td><%=rs.getString("place_name")%></td>
         <td><img src="../Customer/Photo/<%=rs.getString("cus_photo")%>" height="100" width="100"></td>
          
         
         
             
   
    <%
    i++;
    }
    %>
  

                   
                   
                   </table>
            </div>
            
<!--             <input type="button" value="Print Div Contents" id="btnPrint" />-->
            
            
        </form>
    </body>
</html>
               
               
              