<%-- 
    Document   : UpdateStudentStep2
    Created on : Nov 14, 2021, 11:25:12 PM
    Author     : naratcha.s
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="StudentEX8DB.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Mode</title>
    </head>
    <body>
        <h1>Update Mode</h1>
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
        Please input update information  
        <br/>
        <%
            int id = Integer.parseInt(request.getParameter("id"));
            Student stu = StudentTable.findStudentById(id);
            ArrayList<Integer> ids = new ArrayList<Integer>();
            ArrayList<Integer> tmp;
            if (stu != null) {
                synchronized(getServletContext()) {
                //synchronized(session) {
                    //getServletContext().setAttribute("id", ids);
                    tmp = (ArrayList<Integer>) getServletContext().getAttribute("id");
                    if (tmp == null) {
                        ids.add(id);
                        getServletContext().setAttribute("id", ids);
                        tmp = (ArrayList<Integer>) getServletContext().getAttribute("id");
                        out.print("This ID can be update.");
                        out.println("<form name=\"main\" action=\"UpdateStudentServlet\" method=\"POST\">" 
                                    + "Name : <input type=\"text\" name=\"name\" value=\"\" size=\"20\" />" 
                                    + "<br/>"
                                    + "GPA : <input type=\"text\" name=\"gpa\" value=\"\" /> "
                                    + "<br/>"
                                    + "<input type=\"submit\" value=\"Submit\" />");
                    }
                    else {
                        if (tmp.indexOf(id) == -1){
                            out.print("This ID can be update.");
                            out.println("<form name=\"main\" action=\"UpdateStudentServlet\" method=\"POST\">" 
                                    + "Name : <input type=\"text\" name=\"name\" value=\"\" size=\"20\" />" 
                                    + "<br/>"
                                    + "GPA : <input type=\"text\" name=\"gpa\" value=\"\" /> "
                                    + "<br/>"
                                    + "<input type=\"submit\" value=\"Submit\" />");
                        }
                        else {
                            out.print("Some User has been update this ID, Please try again.");
                        }
                    }
                    //session.setAttribute("foo", Integer.parseInt(fooStr));
                    
                }
            }
            else {
                out.println("Information not found.");
            }
        %>
        <%--<form name="main" action="UpdateStudentServlet" method="POST">            
            Name : <input type="text" name="name" value="" size="20" /> 
            <br/>
            GPA : <input type="text" name="gpa" value="" /> 
            <br/>
            <input type="submit" value="Submit" />
        </form>--%>
        <br/>
        <form action="index.html">
            <input type="submit" value="Back to Main Menu" />
        </form>
    </body>
</html>
