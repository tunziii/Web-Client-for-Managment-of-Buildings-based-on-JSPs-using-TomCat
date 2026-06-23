<%@ page import="manager.*" %>
<%
    String task = request.getParameter("task");

    if(task.equals("createBuilding")){
        String BuildingName = request.getParameter("buildingName");
        Building a = Manager.createBuilding(BuildingName);

        String currBuilding = "Current Building: " + BuildingName;
        session.setAttribute("msg", currBuilding);
        response.sendRedirect("StartingPage.jsp");
        return;
    }

    else if(task.equals("changeBuilding")){
        String BuildingName = request.getParameter("buildingName");

        for(int i = 0; i<Manager.buildings.length; i++){
            if(Manager.buildings[i] != null && Manager.buildings[i].getName().equals(BuildingName)){
                String currBuilding = "Current Building: " + BuildingName;

                session.setAttribute("msg", currBuilding);
                response.sendRedirect("StartingPage.jsp");
                return;
            }
        }

        session.setAttribute("msg", "Building Not Found");
        response.sendRedirect("StartingPage.jsp");
        return;
    }

    else if(task.equals("searchRoom")){
        String Room = request.getParameter("roomName");
        String currBuilding = session.getAttribute("msg").toString();
        String currentBuilding = currBuilding.replace("Current Building: ", "");
        String result = "";

        for(int i = 0; i<Manager.buildings.length; i++){
            if(Manager.buildings[i] != null && currentBuilding.equals(Manager.buildings[i].getName())){

                Room g = Manager.buildings[i].searchRoom(Room);
                result = "Room found: " + g.getName() + " " + g.getFloor() + " " + g.getSize();
                session.setAttribute("msg2", result);
                response.sendRedirect("StartingPage.jsp");
                return;

            }
        }

        session.setAttribute("msg2", "Room Not Found");
        response.sendRedirect("StartingPage.jsp");
        return;

    }

    else if(task.equals("addRoom")){
        String roomName = request.getParameter("roomName");
        String currBuilding = session.getAttribute("msg").toString();
        String currentBuilding = currBuilding.replace("Current Building: ", "");


        String spl[] = roomName.split(", ");
        System.out.println(currentBuilding);

        for(int i = 0; i<Manager.buildings.length; i++){
            if(Manager.buildings[i] != null && currentBuilding.equals(Manager.buildings[i].getName())){

                Room a = new Room(spl[0], spl[1], Integer.parseInt(spl[2]));
                System.out.println(a.getName() + a.getFloor() + a.getSize());
                Manager.buildings[i].addRoom(a);

                session.setAttribute("msg2", "Room added");
                response.sendRedirect("StartingPage.jsp");
                return;
            }
        }

        session.setAttribute("msg2", "Room not added");
        response.sendRedirect("StartingPage.jsp");
        return;
    }

    else if(task.equals("showRooms")){
        String currBuilding = session.getAttribute("msg").toString();
        String currentBuilding = currBuilding.replace("Current Building: ", "");
        String result = " ";

        for(int i = 0; i<Manager.buildings.length; i++){
            if(Manager.buildings[i] != null && currentBuilding.equals(Manager.buildings[i].getName())){
                Room [] roomList = Manager.buildings[i].getRooms();
                for(int g = 0; g<roomList.length; g++){
                    if(roomList[g] != null){
                        System.out.println("in loop showRooms");
                        String name = roomList[i].getName();
                        String floor = roomList[i].getFloor();
                        String size = String.valueOf(roomList[i].getSize());
                        result += name +", "+ floor +", "+ size + "; ";
                    }
                }
            }

        }
        System.out.println(result);
        session.setAttribute("msg2", result);
        response.sendRedirect("StartingPage.jsp");
        return;
    }

    else if(task.equals("changeSize")){
        String roomName = request.getParameter("roomName");
        String currBuilding = session.getAttribute("msg").toString();
        String currentBuilding = currBuilding.replace("Current Building: ", "");
        String result = "";

        String spl[] = roomName.split(", ");

        for(int i = 0; i<Manager.buildings.length; i++){
            if(Manager.buildings[i] != null && currentBuilding.equals(Manager.buildings[i].getName())){
                Room [] roomList = Manager.buildings[i].getRooms();
                for(int g = 0; g<roomList.length; g++){
                    if(roomList[g] != null && roomList[g].getName().equals(spl[0])){

                        roomList[g].setSize(Integer.parseInt(spl[1]));
                        result = "Room size of " + roomList[i].getName() + ": " + String.valueOf(roomList[g].getSize());
                        session.setAttribute("msg2", result);
                        response.sendRedirect("StartingPage.jsp");
                        return;
                    }
                }
            }
        }
        session.setAttribute("msg2", "Building is empty");
        response.sendRedirect("StartingPage.jsp");
        return;

    }
%>