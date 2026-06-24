<% String title = "text";%>
<%@ page import="manager.*" %>

<%
    if(session.getAttribute("msg") == null){session.setAttribute("msg", "Current Building: ");}
    String BuildingName = (String) session.getAttribute("msg");

    if(session.getAttribute("msg2") == null){session.setAttribute("msg2", "");}
    String RoomName = (String) session.getAttribute("msg2");
%>

<html><body>

<h1><%= BuildingName %></h1>

<h2>Choose an action:</h2>

<form action="Input.jsp" method="post">

    <input type="radio" name="task" value="createBuilding"> Create Building<br>
    <input type="radio" name="task" value="changeBuilding"> Change Building<br>
    <input type="radio" name="task" value="searchRoom"> Search Room<br>
    <input type="radio" name="task" value="addRoom"> Add Room To Current Building<br>
    <input type="radio" name="task" value="showRooms"> Show All Rooms<br>
    <input type="radio" name="task" value="changeSize"> Change Room Size<br>

    <input type="submit">

</form>

<h3><%= RoomName %></h3>>


</body></html>