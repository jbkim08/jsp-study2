<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<html>

<body>

<c:set var="data" value="jstlcode" />

Length of the string <b>${data}</b>: ${fn:length(data)}

<br/><br/>

Uppercase version of the string <b>${data}</b>: ${fn:toUpperCase(data)}

<br/><br/>

Does the string <b>${data}</b> start with <b>jstl</b>?: ${fn:startsWith(data, "jstl")}

<br/><br/>

Does the string <b>${data}</b> contains with <b>cod</b>?: ${fn:contains(data, "cod")}

</body>

</html>











