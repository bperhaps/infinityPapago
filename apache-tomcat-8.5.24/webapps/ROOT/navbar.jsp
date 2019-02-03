<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/bootstrap.css">
<title>Insert title here</title>
<style>
</style>
</head>

<body>
	<%
		String userID = null;
		if( session.getAttribute("userID")!= null) {
			userID = (String) session.getAttribute("userID");
		}
	%>
   <nav class="navbar navbar-success" >
            <div class="navbar-header">
               <button type="button" class="navbar-toggle collapsed" 
               		data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" 
               		aria-expanded="false">
                  <span class="icon-bar"></span>
                  <span class="icon-bar"></span>
                  <span class="icon-bar"></span>
               </button>
                   
               
               <a class="navbar-brand" href="main.jsp"><span><img src="image/bird.png" width="50" height="50" alt="">&nbsp&nbsp&nbsp</span>Free Translate</a>
            </div>
            <div class="collapsed navbar-collapse" id="bs-example-navbar-collapse-1">
              
               
               <%
               		if(userID == null) {		
               %>
               		<ul class="nav navbar-nav navbar-right">
               		<li class="dropdown">
               			<a href="#" class="dropdown-toggle"
               				data-toggle="dropdown" role="button" aria-haspopup="true"
               				aria-expanded="false">Menu<span class="caret"></span></a>
               			<ul class="dropdown-menu">
               				<li class="active"><a href="login.jsp">로그인</a></li>
               				<li><a href="join.jsp">회원가입</a></li>
               			</ul>		
               		</li>
               	</ul>
               <%
               		} else {
               %>
               	<ul class="nav navbar-nav navbar-right">
               		<li class="dropdown">
               			<a href="#" class="dropdown-toggle"
               				data-toggle="dropdown" role="button" aria-haspopup="true"
               				aria-expanded="false">회원관리<span class="caret"></span></a>
               			<ul class="dropdown-menu">
               				<li class="active"><a href="logoutAction.jsp">로그아웃</a></li>
               			</ul>		
               		</li>
               	</ul>
               <%
               	}
               %>
           </div>
        <HR>
      </nav>


<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>
   
</body>
</html>