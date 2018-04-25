<%-- 
    Document   : EditProfile
    Created on : Feb 22, 2018, 1:50:23 PM
    Author     : ckc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean id="obj" class="mydb.dbconnection"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Branch:Edit Profile</title>
    </head>
    <body>
        <%
    
        
        String Branchname="";
        String Address="";
        String Conno="";
        String Place="";
        String Email="";
        String Runby="";
        String Uname="";
        
        String logid="";
        String sel="select * from tbl_branch b inner join tbl_login l on b.login_id=l.login_id inner join tbl_place p on b.place_id=p.place_id  where branch_id='"+session.getAttribute("Branch")+"'";
        ResultSet rs1=obj.selectData(sel);
        if(rs1.next())
        {
            
            Branchname=rs1.getString("branch_name");
            Address=rs1.getString("branch_address");
            Conno=rs1.getString("branch_contact");
            Place=rs1.getString("Place_name");
            Email=rs1.getString("branch_email");
            Runby=rs1.getString("branch_runby");
            Uname=rs1.getString("login_username");
            
            logid=rs1.getString("login_id");
        }
        
        
         if(request.getParameter("btn_submit")!=null)
            
        {
          
            Branchname =request.getParameter("txtname");
            Address =request.getParameter("txtaddress");
            Conno =request.getParameter("txtcon");
            Place=request.getParameter("txtplace");
            Email =request.getParameter("txtemail");
            Runby=request.getParameter("txtrun");
            Uname=request.getParameter("txtuname");
            
            logid=request.getParameter("hid");
            String update="update tbl_login set login_username='"+Uname+"' where login_id="+logid;
            boolean bb=obj.ExecuteCommand(update);
            if(bb==true)
            {
        String up="update tbl_branch set branch_name='"+Branchname+"',branch_address='"+Address+"',branch_contact='"+Conno+"',place_id='"+Place+",branch_email='"+Email+"' where branch_id='"+session.getAttribute("Branch")+"'";
                boolean b=obj.ExecuteCommand(up);
                if(b)
                {
                    response.sendRedirect("BeditProfile.jsp");
                }
                else
                {
                    out.println(up);
                    
                }
                
            }
        }
       
           
        
       
        
        %>
                 
           <center><h1>Edit Profile</h1></center>
    <form>
        <table align="center" border="1">
            <tr>
                <th>
                    Branch Name
                </th>
                <td>
                    <input type="text" name="txtname" value="<%=Branchname%>" required="">
                </td>
                            
                            
            </tr>
               <tr>
                   <th> 
                       Address
                   </th>
                   <td>
                       <textarea name="txtaddress" required=""><%=Address%></textarea> 
                   </td>
            </tr>
            <tr>
                <th>
                    Contact No
                </th>
                <td>
                    <input type="text" name="txtcon" value="<%=Conno%>" required="">
                </td>
                
            </tr>
            <tr>
                <th>
                    Place
                </th>
                <td>
                    <input type="text"  name="txtplace" value="<%=Place%>" required="">
                    
                </td>
            </tr>
            <tr>
                 <th>
                    Email
                </th>
                <td>
                    <input type="text" name="txtemail" value="<%=Email%>" required="">
                    <input type="hidden" name="hid" value="<%=logid%>">
                </td>
                
            </tr>
            <tr>
                <th>
                    Run By
                </th>
                <td>
                    <input type="text" name="txtrun" value="<%=Runby%>" required="">
                </td>
            </tr>
            <tr>
                 <th>
                    UserName
                </th>
                <td>
                    <input type="text" name="txtuname" value="<%=Uname%>" required="">
                </td>
                
            </tr>
            
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" name="btn_submit" value="SUBMIT">
                    <input type="reset" name="btn_reset" value="CANCEL">
                </td>
            </tr>
                   </table>
    </form>
    </body>
</html>
