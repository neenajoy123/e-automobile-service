<%-- 
    Document   : AddBranchModel
    Created on : Mar 1, 2018, 10:06:53 AM
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
            function getSpareparts(v)
            {
                          alert(v);
             $.ajax({url: "AjaxBranchSpareparts.jsp?id="+v, success: function(result){
        $("#mo").html(result);
    }});
            }
            </script>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Spareparts</title>
    </head>
    <body>
       <%
         String branchsp="";
         String branchId="";
         String spId="";
         
         if(request.getParameter("btnsubmit")!=null);
         {
            
                     spId=request.getParameter("spareparts");
                   
         
         
         
          
                            String insQry="insert into tbl_branchspareparts(sp_id,branch_id)values('"+spId+"','"+session.getAttribute("Branch")+"')";
                           
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
        
    
         
        
       
    <center><h1>Add Spare Parts</h1></center>
    <form>
        <table align="center" border="1">
           <tr>
                     <td>
                        Company Name
                    </td>
                  
                     <td>
                         <select name="company" onchange="getSpareparts(this.value)">
                             <option value="">
                                --select--
                            </option>
                            
                             <%
                            String str1="select * from tbl_company";
                            ResultSet rs1=obj.selectData(str1);
                            while (rs1.next())
                            {
                           %>
                           <option value="<%=rs1.getString("comp_id")%>">
                               <%=rs1.getString("comp_name")%>
                           </option>
                            <%
                            }
                            %>
                            
                        </select><br> 
                    </td>
                
                </tr>
                    
                 <tr>
                    <td>
                        Spare Parts Name
                    </td>
                   
                    <td>
                       <select name="spareparts" id="mo" required="">
                           <option value="">
                                --select--
                            </option>
                       </select>
                       </tr>

            <tr>
                <td colspan="2" align="center">
                   <input type="submit" name="btnsubmit" value="ADD">
                </td>
            </tr>
        </table>
    </form>
    </body>
       
</html>
