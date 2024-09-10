<html>
    <head>
        <style>
            .myButton{
                font-size:32px;
            }
            .myTextBox{
                font-size:32px;
            }
        </style>
    </head>
    <body>
        <%
        String str=request.getParameter("msg");
        if(str!=null)
        out.println("<font sie=32 color=red>"+str+"</font>");
        %>

        <form name="f1" action="validation.jsp">
            <table align="center" width="60%">
                <tr>
                    <td>username:<input type="text" class="myTextBox" name="username" id="username">
                    </td>
                </tr>
                <tr><td>password:<input type=text class="myTextBox" name=password id=password></td></tr>
                <tr><td><input type=submit value=login class=myButton>
                <input type="reset" value="reset" class="myButton">
                </td></tr>
            </table>
            </form>
    </body>