1<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String id = request.getParameter("uname");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "oasis";
String userid = "ashwini";
String password = "Ashwini@123";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
String user_id=request.getParameter("username");
String user_pwd=request.getParameter("password");
int flag=0;
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from users where username='"+user_id+"' and password='"+user_pwd+"'";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
    flag=1;
}
if(flag==1)
response.sendRedirect("secure.jsp");
else
response.sendRedirect("login.jsp?msg='Invalid Credentials!<br>please try again'");
connection.close();
} catch (Exception e) {
out.println(e.getMessage());
}
%>
