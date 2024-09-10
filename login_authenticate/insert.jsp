<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String user_id=request.getParameter("username");
String user_name=request.getParameter("password");
try
{
         Class.forName("com.mysql.jdbc.Driver");
           Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/oasis", "ashwini", "Ashwini@123");
           Statement st=conn.createStatement();
           int i=st.executeUpdate("insert into users(username,password)values('"+user_id+"','"+user_name+"')");
           if(i>0){
            out.println("Registration successful. <a href='login.jsp'>Login here</a>");
                } else {
                    out.println("Registration failed.");
                }

        }
        catch(Exception e)
        {
        System.out.print(e);
        e.printStackTrace();
        }
 %>