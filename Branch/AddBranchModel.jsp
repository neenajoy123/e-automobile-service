<%-- 
    Document   : AddBranchModel
    Created on : Mar 1, 2018, 10:06:53 AM
    Author     : ckc
--%>
<%@include file="Header.jsp" %>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean id="obj" class="mydb.dbconnection"></jsp:useBean>
    
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   
    <head>
        <script src="jquery.js" type="text/javascript"></script>
         
        <script>
            function getModel(v)
            {
                          alert(v);
             $.ajax({url: "AjaxBranchModel.jsp?id="+v, success: function(result){
        $("#mo").html(result);
    }});
            }
            </script>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Model</title>
    </head>
    <body background="1967-ford-mustang-convertible-9.jpg">
       <%
         String branchmodid="";
         String modelId="";
         String branchId="";
         
         if(request.getParameter("btnsubmit")!=null);
         {
            
                     modelId=request.getParameter("model");
                   
         
         
         
          
                            String insQry="insert into tbl_branchmodel(model_id,branch_id)values('"+modelId+"','"+session.getAttribute("Branch")+"')";
                           
                         //   boolean b2 = obj.ExecuteCommand(insQry);
                        if (obj.ExecuteCommand(insQry)) 
                        {
                            
                              
                            %>
                            <script  type="text/javascript">
                                alert("success");
                            </script>
                            <%
                        }
                     
                           
                        
                 
                            
                      
        else
                            
                            {
//                                   out.println("Failed  : "+insQry);  
                                    
                                    }
                }
                         
          %>
        
    
         
        
       
    <center><h1>Add Model</h1></center>
    <form>
        <br>
        <br>
        <br>
        <table align="center" border="1" style="color: black;width: 40%;height: 40%">
           <tr>
                     <td>
                        Company Name
                    </td>
                  
                     <td>
                         <select name="company" onchange="getModel(this.value)">
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
                        Model Name
                    </td>
                   
                    <td>
                       <select name="model" id="mo" required="">
                           <option value="">
                                --select--
                            </option>
                       </select>
                    <td>
                       </tr>
                       <tr>
                    <td>
                       Service Type
                    </td>
                   
                    <td>
                       <select name="service" id="service" required="">
                           <option value="">
                                --select--
                            </option>
                       </select>
                    <td>
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
