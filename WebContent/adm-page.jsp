
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="pDAO" class="myPackage.DatabaseClass" scope="page"/>
<!DOCTYPE html>
<html>
<head>
	<title></title>
	<link rel="stylesheet" type="text/css" href="style-backend.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
	<div class="top-area">
		<center><h2 style="color:#3b5998">Admin Panel</h2></center> <a href="controller.jsp?page=logout" class="button" style="float: right;border:100px; background:#2E2D2A; border-radius:5px; border-color:yellow; color:#FEFEFE; padding: 10px;"><i class="fa fa-sign-out">Logout</i></a>
	</div>

        <%
            if(session.getAttribute("userStatus")!=null){
            if(session.getAttribute("userStatus").equals("1")){
            
            %>
            
            
            
            
            
            <% 
            //pgpart = pagepart, accounts=1,courses=2,questions=3 and profile is default
            if(request.getParameter("pgprt").equals("1")){
                
            %>
            
                <jsp:include page="accounts.jsp"/>
            
            <%
                
            }else if(request.getParameter("pgprt").equals("2")){
            
                %>
            
                <jsp:include page="courses.jsp"/>
                
                <%
                
            }else if(request.getParameter("pgprt").equals("3")){
                %>
            
                <jsp:include page="questions.jsp"/>
            <%
            }else if(request.getParameter("pgprt").equals("4")){// if( 4 == 4 )
                %>
            
                <jsp:include page="showall.jsp"/>
            <%
            }else{
                %>
            
                <jsp:include page="profile.jsp"/>
            
            <%
            }
            %>
            
            <%
            }else response.sendRedirect("login.jsp");
            }else response.sendRedirect("login.jsp");
                %>
              
                

</body>
</html>