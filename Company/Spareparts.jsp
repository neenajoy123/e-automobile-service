<%-- 
    Document   : Spareparts
    Created on : Feb 15, 2018, 10:13:59 AM
    Author     : ckc
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean id="obj" class="mydb.dbconnection"></jsp:useBean>
    
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Spare Parts</title>
    </head>
    <body>
         
        <%
            String Sname="";
            String Sno="";
            String Prize="";
            String modelId="";
            String id="",  sdid="";
          
            
             if(request.getParameter("editid")!=null)
        {
            id=request.getParameter("editid");
            String sel="select * from tbl_model m inner join tbl_spareparts s inner join tbl_company c on m.model_id=s.model_id and c.comp_id=s.comp_id where s.sp_id= '"+request.getParameter("editid")+"' and c.comp_id='"+session.getAttribute("company")+"'";
            ResultSet rs=obj.selectData(sel);
            if(rs.next())
            {
                sdid=rs.getString("sp_id");
                Sname=rs.getString("sp_name");
                Sno=rs.getString("sp_number");
                Prize=rs.getString("sp_prize");
                modelId=rs.getString("model_id");
            }
        }
            if(request.getParameter("did")!=null)
            {
                String del="delete from tbl_spareparts where sp_id='"+request.getParameter("did")+"'";
                obj.ExecuteCommand(del);
            }
            if(request.getParameter("submit")!=null)
                
            {
            
              Sname=request.getParameter("txtsname");
              Sno=request.getParameter("txtsno");
              Prize=request.getParameter("txtsprize");
              modelId=request.getParameter("ddlModel");
              
              if(request.getParameter("hid")!="")
              {
                  String up="update tbl_spareparts set sp_name='"+Sname+"',sp_number='"+Sno+"',sp_prize='"+Prize+"',model_id='"+modelId+"' where sp_id='"+request.getParameter("hid")+"'";
                  boolean b=obj.ExecuteCommand(up);
                  if(b)
                  {
                      response.sendRedirect("Spareparts.jsp");
                  }
                  else
                  {
                      out.println(up);
                  }
              }
              else
              {
              
              String insQry="insert into tbl_spareparts(sp_name,sp_number,sp_prize,model_id,comp_id)values('"+Sname+"','"+Sno+"','"+Prize+"','"+modelId+"','"+session.getAttribute("company")+"')";
              boolean b1=obj.ExecuteCommand(insQry);
            
              if(b1)
              {
                   response.sendRedirect("Spareparts.jsp");
            
                  
              }
              else
              {
                  out.print(insQry);
              }
            }
            }
            %>
        
            
            
     <form>
            
            
            
            
            
    
   
        <table align="center" border="1">
            <tr>
                <th>Model
                <input type="hidden" name="hid" value="<%=id%>"></th>
            
            <td>   
                <select name="ddlModel" required="">
                    <option value="">--Select--</option>
               
                <%
      
                String selQry="select * from tbl_model where comp_id='"+session.getAttribute("company")+"'";
                ResultSet rs=obj.selectData(selQry);
                while(rs.next())
                    
                {
                    
          %>
          <option <% if(modelId.equals(rs.getString("model_id"))) {%>   selected=""<%}%>value="<%=rs.getString("model_id")%>"><%=rs.getString("model_name")%></option>
                  
                <%
              
                }
                
                
                %>
                </select>
            </td>
            </tr>
               
            <tr>
                <th>
                    Spare part Name
                </th>
                <td> <input type="text" value="<%=Sname%>" name="txtsname" required="">
                </td>
                </tr>
                <tr>
                    <th>
                        Spare part Number
                    </th>
                    <td>
                    <input type="text" value="<%=Sno%>" name="txtsno" required="">
                    </td>
                </tr>
                <tr>
                    <th>
                        Spare part Prize
                    </th>
                <td>
                    <input type="text" name="txtsprize" required="" value="<%=Prize%>">
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="submit" value="submit">
                        <input type="reset" name="btnreset" value="Cancel">
                    </td>
                </tr>
                
                
               
    </table>
    
    <br>
    <br>
             <table align="center" border="1">
            <tr>
                <td>sl.no</td>
                <td>Model Name</td>
                <td>Sparepart Name</td>
                <td>Sparepart Number</td>
                <td>Sparepart Prize</td>
                
                
            </tr>
            <%
                int i = 1;
                String selQry1= "select * from tbl_model m inner join tbl_spareparts s inner join tbl_company c on m.model_id=s.model_id and c.comp_id=s.comp_id where c.comp_id='"+session.getAttribute("company")+"'";
                ResultSet rs1 = obj.selectData(selQry1);
                while (rs1.next()) 
                {
                    String spId = rs1.getString("sp_id");
            %>  
            <tr>
                <td><%=i%></td>
                <td><%=rs1.getString("model_name")%></td>
                <td><%=rs1.getString("sp_name")%></td>
                <td><%=rs1.getString("sp_number")%></td>
                <td><%=rs1.getString("sp_prize")%></td>

                
                <td><a href="Spareparts.jsp?did=<%=spId%>">Delete</a></td>
                <td><a href="Spareparts.jsp?editid=<%=spId%>">Edit</a></td>
            </tr>
            <%
                    i++;
                }
            %>
        </table>
                            
        </form>      
    </body>
</html>
