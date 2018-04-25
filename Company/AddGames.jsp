<%-- 
    Document   : AddGames
    Created on : 24 Apr, 2018, 3:15:40 PM
    Author     : user
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean id="obj" class="mydb.dbconnection"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Games</title>
    </head>
    <body>
        <form>
            <%
                if(request.getParameter("btnsubmit")!=null)
                {
                String ins="insert into tbl_game(game_name,game_date,game_start,game_end,comp_id,game_price,game_desc,place_id) values('"+request.getParameter("txtgame")+"','"+request.getParameter("txtdate")+"','"+request.getParameter("timestart")+"','"+request.getParameter("timeend")+"','"+session.getAttribute("company")+"','"+request.getParameter("txtprice")+"','"+request.getParameter("txtdesc")+"','"+request.getParameter("ddlplace")+"')";
                boolean b=obj.ExecuteCommand(ins);
                if(b)
                {
                    response.sendRedirect("AddGames.jsp");
                }
                }
                if(request.getParameter("id")!=null)
                {
                    String del="delete from tbl_game where game_id="+request.getParameter("id");
                    boolean b=obj.ExecuteCommand(del);
                    if(b)
                    {
                       response.sendRedirect("AddGames.jsp");
                    }
                }
                if(request.getParameter("rid")!=null)
                {
                    session.setAttribute("game", request.getParameter("rid"));
                    response.sendRedirect("ViewGameApplication.jsp");
                   
                }
            %>
            <br>
            <table align="center" border="1">
                <tr>
                    <th>Game Name</th>
                    <td><input type="text" name="txtgame" required=""></td>
                </tr>
                <tr>
                    <th>Description</th>
                    <td><textarea name="txtdesc" required=""></textarea></td>
                </tr>
                <tr>
                    <th>Place</th>
                            <td><select name="ddlplace" required="">
                                    <option value="">
                                        --select--
                                    </option>
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
                                   
                        </select></td>
                </tr>
                <tr>
                    <th>Date</th>
                    <td><input type="date" name="txtdate" required=""></td>
                </tr>
                <tr>
                    <th>Start Time</th>
                    <td><input type="time" name="timestart" required=""></td>
                </tr>
                <tr>
                    <th>End Time</th>
                    <td><input type="time" name="timeend" required=""></td>
                </tr>
                <tr>
                    <th>Price</th>
                    <td><input type="text" name="txtprice" required=""></td>
                </tr>
                <tr>
                    
                    <td colspan="2" align="center"><input type="submit" name="btnsubmit" value="Submit">
                        <input type="reset" name="btnreset" value="Cancel"></td>
                </tr>
            </table>
                      <br>
                      <br>
                      
                      <table align="center" border="1">
                          <tr>
                              <th>S.NO</th>
                              <th>Game</th>
                              <th>Description</th>
                              <th>Place</th>
                              <th>Date</th>
                              <th>Start Time</th>
                              <th>End Time</th>
                              <th>Price</th>
                                  
                              
                          </tr>
                          <%
                                        int i=0;
                          String sel1="select game_id,game_name,game_date,game_start,game_end,game_price,game_desc,place_name from tbl_game g inner join tbl_place p on g.place_id=p.place_id where g.comp_id="+session.getAttribute("company");
                          ResultSet rs1=obj.selectData(sel1);
                          while(rs1.next())
                          {
                              i++;
                              %>
                              <tr>
                                  <td><%=i%></td>
                                  <td><%=rs1.getString("game_name")%></td>
                                  <td><%=rs1.getString("game_desc")%></td>
                                  <td><%=rs1.getString("place_name")%></td>
                                  <td><%=rs1.getString("game_date")%></td>
                                  <td><%=rs1.getString("game_start")%></td>
                                  <td><%=rs1.getString("game_end")%></td>
                                  <td><%=rs1.getString("game_price")%></td>
                                  <td><a href="AddGames.jsp?rid=<%=rs1.getString("game_id")%>">View Requests</a></td>
                                  <td><a href="AddGames.jsp?id=<%=rs1.getString("game_id")%>">Delete</a></td>
                              </tr>
                              <%
                          }
                          %>
                          
                      </table>
        </form>
    </body>
</html>
