<%@ page import="manager.*" %>

<%
    String task = request.getParameter("task");
    session.setAttribute("task", task);
%>

<% if (task.equals("createBuilding")) { %>

    <form action="ChooseAction.jsp" method="post">
        Building name:
        <input type="text" name="buildingName">
        <input type="hidden" name="task" value="<%= task %>">
        <input type="submit">
    </form>


<% } %>

<% if(task.equals("changeBuilding")){ %>

    <form action="ChooseAction.jsp" method="post">
        Change Building:
        <input type="text" name="buildingName">
        <input type="hidden" name="task" value="<%= task %>">
        <input type="submit">
    </form>

<%} %>

<% if(task.equals("searchRoom")){ %>

<form action="ChooseAction.jsp" method="post">
    Search Room:
    <input type="text" name="roomName">
    <input type="hidden" name="task" value="<%= task %>">
    <input type="submit">
</form>

<%} %>

<% if(task.equals("addRoom")){ %>

<form action="ChooseAction.jsp" method="post">
    Add Room:
    <input type="text" name="roomName">
    <input type="hidden" name="task" value="<%= task %>">
    <input type="submit">
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
    Change Room Size:
    <input type="text" name="roomName">
    <input type="hidden" name="task" value="<%= task %>">
    <input type="submit">
</form>

<%} %>