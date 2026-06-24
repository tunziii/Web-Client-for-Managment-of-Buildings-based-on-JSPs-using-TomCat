<%@ page import="manager.*" %>

<%
    String task = request.getParameter("task");
    session.setAttribute("task", task);
%>

<% if (task.equals("createBuilding")) { %>

    <form action="ChooseAction.jsp" method="post">
        Building name:
        <input type="text" name="buildingName" style="position:absolute; left:15px; top:50px;">
        <input type="hidden" name="task" value="<%= task %>">
        <input type="submit" style="position:absolute; left:200px; top:50px;">
    </form>


<% } %>

<% if(task.equals("changeBuilding")){ %>

    <form action="ChooseAction.jsp" method="post">
        Change Building:
        <input type="text" name="buildingName" style="position:absolute; left:15px; top:50px;">
        <input type="hidden" name="task" value="<%= task %>">
        <input type="submit" style="position:absolute; left:200px; top:50px;">
    </form>

<%} %>

<% if(task.equals("searchRoom")){ %>

<form action="ChooseAction.jsp" method="post">
    Search Room by Name:
    <input type="text" name="roomName" style="position:absolute; left:15px; top:50px;">
    <input type="hidden" name="task" value="<%= task %>">
    <input type="submit" style="position:absolute; left:200px; top:50px;">
</form>

<%} %>

<% if(task.equals("addRoom")){ %>

<form action="ChooseAction.jsp" method="post">
    Add Room to the Current Building (example: A100, EG, 10):
    <input type="text" name="roomName" style="position:absolute; left:15px; top:50px;">
    <input type="hidden" name="task" value="<%= task %>">
    <input type="submit" style="position:absolute; left:200px; top:50px;">
</form>

<%} %>

<% if(task.equals("showRooms")){ %>

<form action="ChooseAction.jsp" method="post">

    <input type="hidden" name="task" value="<%= task %>">
    <input type="submit">
</form>

<%} %>

<% if(task.equals("changeSize")){ %>

<form action="ChooseAction.jsp" method="post">
    Change Room Size (example: Name, Size):
    <input type="text" name="roomName" style="position:absolute; left:15px; top:50px;">
    <input type="hidden" name="task" value="<%= task %>">
    <input type="submit" style="position:absolute; left:200px; top:50px;">
</form>

<%} %>