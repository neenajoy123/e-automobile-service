<%-- 
    Document   : newjsp
    Created on : 17 Apr, 2018, 11:22:16 AM
    Author     : user
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        if(request.getParameter("btnsubmit")!=null)
        {
            String date1=request.getParameter("date1");
            String date2=request.getParameter("date2");
            
           DateTime dateTime1 = new DateTime(date1);
DateTime dateTime2 = new DateTime(date2);

List<Date> allDates = new ArrayList();

while( dateTime1.before(dateTime2) ){
   allDates.add( dateTime1.toDate() );
   dateTime1 = dateTime1.plusDays(1);
        }
       
        
    
        
        %>
        
        
        <input type="date" name="date1">
        <input type="date" name="date2">
        <input type="submit" name="btnsubmit">
    </body>
</html>
