<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/bootstrap.css">
<title>Insert title here</title>
</head>
<body>
  	
<div class="container col-md-12" >
	 <div class="col-md-6" style="text-align:center">
	 <tbody>
	 	<tr>
	 	<td>
	 	<ul class="nav navbar-nav">
               		<li class="dropdown">
               			<a href="#" class="dropdown-toggle"
               				data-toggle="dropdown" role="button" aria-haspopup="true"
               				aria-expanded="false">언어선택<span class="caret"></span></a>
               			<ul class="dropdown-menu">
               				<li><a href="#">한국어</a></li>
               				<li><a href="#">영어</a></li>
               				<li><a href="#">일본어</a></li>
               			</ul>
               		</li>
        </ul>
        </td>
        </tr>
        <tr>
        <td>
        <textarea class="test" rows="20" cols="200"onkeyup="this.style.height='26px'; this.style.height = this.scrollHeight + 'px';"  
	 	placeholder="Text를 입력해주세요." ></textarea>
	 	</td>
	 	</tr>
	 </tbody>
     </div>
	  	
	  	
	 <div class="col-md-6" style="text-align:center">
	 		<ul class="nav navbar-nav navbar-right">
               		<li class="dropdown">
               			<a href="#" class="dropdown-toggle"
               				data-toggle="dropdown" role="button" aria-haspopup="true"
               				aria-expanded="false">언어 선택<span class="caret"></span></a>
               			<ul class="dropdown-menu">
               				<li><a href="#">영어</a></li>
               				<li><a href="#">한국어</a></li>
               				<li><a href="#">일본어</a></li>
               			</ul>
               		</li>
            </ul>
	 		<textarea class="test" rows="20" cols="200"onkeyup="this.style.height='26px'; this.style.height = this.scrollHeight + 'px';"  
	 		placeholder="번역한 문장이 나오는 Aria. 문장의 길이만큼 Text창도 늘어납니다." ></textarea>
	 		
	</div>
</div>
  	
   <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
   <script src="js/bootstrap.js"></script>
</body>
</html>