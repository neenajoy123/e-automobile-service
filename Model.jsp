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
            
            String Modelid="";
            String Modelname="";
            String Modelno="";
            String Modelprize="";
            String Companyid="";
            
            
            if(request.getParameter("editid")!=null)
        {
            String sel="select * from tbl_district where model_id='"+request.getParameter("editid")+"'";
            ResultSet rs=obj.selectData(sel);
            if(rs.next())
            {
                Modelid=rs.getString("model_id");
                Modelname=rs.getString("model_name");
               
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
              Modelno=request.getParameter("txt_nname");
              Companyid=request.getParameter("company"); 
              if(request.getParameter("hid")!=null)
              {
                  String up="update tbl_model set model_name='"+Modelname+"' where model_id='"+request.getParameter("hid")+"'";
                  boolean b=obj.ExecuteCommand(up);
                  if(b)
                  {
                      response.sendRedirect("Model.jsp");
                  }
                  else
                  {
                      out.println(up);
                  }
              }
              else
              {
              
              String insQry="insert into tbl_model(model_name,model_prize,model_number,comp_id)values('"+Modelname+"','"+Modelprize+"','"+Companyid+"')";
              boolean b1=obj.ExecuteCommand(insQry);
              if(b1)
              {
                  response.sendRedirect("Model.jsp");
                  
              }else
              {
                  out.print(insQry);
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
                        <input type="text" name="txt_name" required  >
                    </td>
                </tr>
                
                
                <tr>
                    <td>
                        Model Prize:
                    </td>
                    <td>
                        <input type="text" name="txt_pname" required  >
                    </td>
                </tr>
                
                <tr>
                    <td>
                        Model Number:
                    </td>
                    <td>
                        <input type="text" name="txt_nname" required  >
                    </td>
                </tr>
                
                <tr> <th> Under which Company:</th>
                            <td> <select name="company">
                                    <option value="s">---select---</option>
                                    <%
                                        String s="select * from tbl_company";
                                        ResultSet rs=obj.selectData(s);
                                        while(rs.next())
                                        {
                                            %>
                                            <option value="<%=rs.getString("comp_id")%>"><%=rs.getString("comp_name")%></option>
                                            <%
                                        }
                                        %>
                           
                              </select></td>
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
                <td>Model Name</td>
                <td>Model Prize</td>
                <td>company Name</td>
                
                
            </tr>
            <%
                int i = 1;
                String selQry = "select * from tbl_model m,tbl_company c where m.comp_id=c.comp_id";
                ResultSet rs1 = obj.selectData(selQry);
                while (rs1.next()) 
                {
                    String ModelId = rs1.getString("model_id");
            %>  
            <tr>
                <td><%=i%></td>
                <td><%=rs1.getString("model_name")%></td>
                <td><%=rs1.getString("model_prize")%></td>
                <td><%=rs1.getString("comp_name")%></td>
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

  
