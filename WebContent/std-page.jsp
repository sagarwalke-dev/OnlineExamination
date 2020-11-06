
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title></title>
	<link rel="stylesheet" type="text/css" href="style-backend.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
	<div class="top-area">
		<center><h2 style="color: #545998">Student Panel</h2></center> <a href="controller.jsp?page=logout" class="button" style="float: right;border:100px; background:#2E2D2A; border-radius:5px; border-color:yellow; color:#FEFEFE; padding: 10px;">Logout &nbsp;<i class="fa fa-sign-out"></i></a>
	</div>
    
    <%
            if(session.getAttribute("userStatus")!=null){
           if(session.getAttribute("userStatus").equals("1")){
            %>
            	
            <div class="menu">
            <a href="std-page.jsp?pgprt=0" class="button">profile</a>
            <a class="button" href="std-page.jsp?pgprt=1">exams</a>
            <a class="button" href="std-page.jsp?pgprt=2">results</a>
            <a href="controller.jsp?page=logout" class="button" style="float: right;background:crimson;color:white">Logout</a>
            </div>
            <% 
            //pgpart = pagepart, exams=1,results=2 and profile is default
            if(request.getParameter("pgprt").equals("1")){
                
            %>
            
            <jsp:include page="exam.jsp"/>
            
            <%
                
            }else if(request.getParameter("pgprt").equals("2")){
            
                %>
            
                <jsp:include page="results.jsp"/>
                
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
            
