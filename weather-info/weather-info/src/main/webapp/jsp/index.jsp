<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath() %>/styles/admin.css" rel="stylesheet" type="text/css">
<title>Insert title here</title>
</head>
<body>
	<div id="container">
		<div><jsp:include page="/jsp/include/header.jsp" /><hr>
		</div>
		<div id="content"><jsp:include page="weatherBody.jsp" /></div>
		<div><jsp:include page="/jsp/include/footer.jsp" /></div>
	</div>
</body>
</html>