<%@ page import="java.util.*" %>

<html>

<body>

<!-- Step 1: Create HTML form -->
<form action="todo-demo.jsp">
	Add new item: <input type="text" name="theItem" autofocus/>
	
	<input type="submit" value="Submit" />
</form>
<!-- 입력받은 Item을 테스트 출력 -->
<%--<%= request.getParameter("theItem") %>--%>

<!-- Step 2: Add new item to "To Do" list -->
<%
	// get the TO DO items from the session
	List<String> items = (List<String>) session.getAttribute("myToDoList");

	// if the TO DO items doesn't exist, then create a new one
	if (items == null) {
		items = new ArrayList<String>();
		session.setAttribute("myToDoList", items);
	}
	
	// see if there is form data to add
	
	String theItem = request.getParameter("theItem");
	
	boolean isItemNotEmpty = theItem != null && theItem.trim().length() > 0;
	boolean isItemNotDuplicate = theItem != null && !items.contains(theItem.trim());
	
	if (isItemNotEmpty && isItemNotDuplicate) {
		items.add(theItem.trim());
		//response.sendRedirect("todo-demo.jsp"); // UPDATE: NEW
	}
%>

<!-- Step 3: Display all "To Do" item from session -->
<hr>
<b>To List Items:</b> <br/>

<ol>
<%
	for (String temp : items) {
		out.println("<li>" + temp + "</li>");
	}
%>
</ol>

</body>

</html>








