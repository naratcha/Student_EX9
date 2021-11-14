<%-- 
    Document   : DeleteStudent
    Created on : Nov 8, 2021, 11:40:20 PM
    Author     : naratcha.s
--%>

<%@page import="java.util.List"%>
<%@page import="StudentEX8DB.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Mode</title>
    </head>
    <body>
        <h1>Delete Mode</h1>
        Student Information
        <br/>
        <%
            List<Student> StudentList = StudentTable.findAllStudent();
            if (StudentList.size() > 0) {
                for (Student stu : StudentList) {
                    out.print(stu.getId() + " ");
                    out.print(stu.getName() + " ");
                    out.print(stu.getGpa() + " ");
                    out.print("<br/>");
                }
            } else {
                out.println("Information not found.");
            }
        %>
        <br/>
        Please enter ID  
        <br/>
        <form name="main" action="DeleteStudentServlet" method="POST">            
            ID : <input type="text" name="id" value="" /> 
            <br/>
            <input type="submit" value="Submit" />
        </form>
        <br/>
        <form action="index.html">
            <input type="submit" value="Back to Main Menu" />
        </form>
    </body>
</html>
