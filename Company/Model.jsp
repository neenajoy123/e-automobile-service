<%-- 
    Document   : Model
    Created on : Feb 14, 2018, 12:35:34 PM
    Author     : ckc
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean id="obj" class="mydb.dbconnection"></jsp:useBean>
    
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Model</title>
    </head>
    <body>
        <%
            
            String CompanyId="";
            String Modelname="";
            String Modelno="",m="";
            String Modelprize="",no="";
            String id="",p="";
            
              
            if(request.getParameter("editid")!=null)
            {
           
            id=request.getParameter("editid");
              
            String sel="select * from tbl_model where model_id='"+id+"'";
            ResultSet rs=obj.selectData(sel);
            if(rs.next())
            {    
                p=rs.getString("model_prize");
                m=rs.getString("model_name");
               Modelno=rs.getString("model_number");
               CompanyId=rs.getString("comp_id");
            }
         }
            if(request.getParameter("did")!=null)
            {
                String del="delete from tbl_model where model_id='"+request.getParameter("did")+"'";
                obj.ExecuteCommand(del);
            }
            if(request.getParameter("btnsub")!=null)
                
            {
                Modelname=request.getParameter("txt_name");
              Modelprize=request.getParameter("txt_pname");
              no=request.getParameter("txt_nname");
              CompanyId=request.getParameter("company"); 
              String hh=request.getParameter("hid");  
             
              if(!hh.equals(""))            
              {
                  String up="update tbl_model set model_name='"+Modelname+"',model_prize='"+Modelprize+"',model_number='"+no+"' where model_id='"+request.getParameter("hid")+"'";
                  boolean b=obj.ExecuteCommand(up);
                 if(b==true)
                 { 
                     %>
                     <script>
                         alert("Model Updated");
                     </script>
                     <%
                 }
                 
                    
                       else
                  {
                      out.println(up);
                  }
              }
              else
             {
              
              String insQry="insert into tbl_model(model_name,model_prize,model_number,comp_id)values('"+ Modelname +"','"+ Modelprize +"','"+ no +"','"+session.getAttribute("company")+"')";
              boolean b1=obj.ExecuteCommand(insQry);
              if(b1==true)
              {
                %>
                     <script>
                         alert("Model Added");
                     </script>
                     <%
                  
              }else
              {
                  out.println(insQry);
              }
            }
         }
           
            %>
        
       
            <center><h1>Model</h1></center>  
        <form>
            <table border="1" align="center">
                
                
                <tr>
                    <td>
                        Model name:
                    </td>
                    <td>
                        <input type="text" value="<%=m%>" name="txt_name" required="">
                       <input type="hidden" name="hid" value="<%=id%>">
                    </td>
                </tr>
                
                
                <tr>
                    <td>
                        Model Prize:
                    </td>
                    <td>
                        <input type="text" value="<%=p%>" name="txt_pname" required="">
                        
                    </td>
                </tr>
                
                <tr>
                    <td>
                        Model Number:
                    </td>
                    <td>
                        <input type="text" value="<%=Modelno%>" name="txt_nname" required="">
                        
                    </td>
                </tr>
                
              
                
                <tr>
                <td colspan="2" align="center">
                 
                <input type="submit" name="btnsub" value="SUBMIT">
                <input type="reset" name="delid" value="Cancel">
                </td>
                </tr>
            </table>
                                        <br>
                                        <br>
            
        </form>
             <table align="center" border="1">
            <tr>
                <td>sl.no</td>
                <td>Company Name</td>
                <td>Model Name</td>
                <td>Model Prize</td>
                <td>Model Number</td>
                
                
            </tr>
            <%
                int i = 1;
                String selQry = "select * from tbl_model m inner join tbl_company c on m.comp_id=c.comp_id where c.comp_id='"+session.getAttribute("company")+"'";
                ResultSet rs1 = obj.selectData(selQry);
                while (rs1.next()) 
                {
                    String ModelId = rs1.getString("model_id");
            %>  
            <tr>
                <td><%=i%></td>
                <td><%=rs1.getString("comp_name")%></td>
                <td><%=rs1.getString("model_name")%></td>
                <td><%=rs1.getString("model_prize")%></td>
                <td><%=rs1.getString("model_number")%></td>
                
                <td><a href="Model.jsp?did=<%=ModelId%>">Delete</a></td>
                <td><a href="Model.jsp?editid=<%=ModelId%>">Edit</a></td>
               
                
            </tr>
            <%
                    i++;
                }
            %>
        </table>
                            
              
                            
                            
             
                     </body> 
</html>

  
