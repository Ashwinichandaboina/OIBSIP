<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

    List<String[]> todoList = (List<String[]>) session.getAttribute("todoList");
    if (todoList == null) {
        todoList = new ArrayList<>();
        session.setAttribute("todoList", todoList);
    }

    
    
    String title = request.getParameter("title");
    String description = request.getParameter("description");
    if (title != null && description != null && !title.isEmpty() && !description.isEmpty()) {
        todoList.add(new String[]{title, description, "pending"}); 
    }

    
    String deleteIndex = request.getParameter("deleteIndex");
    if (deleteIndex != null) {
        int index = Integer.parseInt(deleteIndex);
        todoList.remove(index);
    }

    
    String completeIndex = request.getParameter("completeIndex");
    if (completeIndex != null) {
        int index = Integer.parseInt(completeIndex);
        todoList.get(index)[2] = "complete"; 
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>To-Do List</title>
    <link rel="stylesheet" href="to-do.css">
</head>
<body>
    <div class="container">
        <h1>To-Do List</h1>

        
        <form method="post">
            <label for="title">Title</label>
            <input type="text" id="title" name="title" required>

            <label for="description">Description</label>
            <textarea id="description" name="description" required></textarea>

            <button type="submit">Add Task</button>
        </form>

        
        <h2>Pending Tasks</h2>
        <table>
            <thead>
                <tr>
                    <th>Title</th>
                    <th>Description</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <% for (int i = 0; i < todoList.size(); i++) {
                    String[] task = todoList.get(i);
                    if (task.length == 3 && "pending".equals(task[2])) { %>
                        <tr>
                            <td><%= task[0] %></td>
                            <td><%= task[1] %></td>
                            <td>
                                
                                <form method="post" style="display:inline;">
                                    <input type="hidden" name="completeIndex" value="<%= i %>">
                                    <button type="submit" class="complete-button">Complete</button>
                                </form>
                            
                                <form method="post" style="display:inline;">
                                    <input type="hidden" name="deleteIndex" value="<%= i %>">
                                    <button type="submit" class="delete-button">Delete</button>
                                </form>
                            </td>
                        </tr>
                    <% }
                } %>
            </tbody>
            
        </table>

        
        <h2>Completed Tasks</h2>
        <table>
            <thead>
                <tr>
                    <th>Title</th>
                    <th>Description</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <% for (int i = 0; i < todoList.size(); i++) {
                    String[] task = todoList.get(i);
                    if (task.length == 3 && "complete".equals(task[2])) { %>
                        <tr>
                            <td><%= task[0] %></td>
                            <td><%= task[1] %></td>
                            <td>
                                <!-- Form to delete task -->
                                <form method="post" style="display:inline;">
                                    <input type="hidden" name="deleteIndex" value="<%= i %>">
                                    <button type="submit" class="delete-button">Delete</button>
                                </form>
                            </td>
                        </tr>
                    <% }
                } %>
            </tbody>
            
        </table>
    </div>
</body>
</html>
