<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>Infinite Translate Service</title>
<style>

.cf:before,
.cf:after {
    content: " "; /* 1 */
    display: table; /* 2 */
}
 
.cf:after {
    clear: both;
}

	.test {
    resize:none;
    line-height:30px;
    width:100%;
    overflow-y:hidden;
    width:450px;
    height:40px;
    border:1px solid #ccc;
}
  
  	.jumbotron	{
     text-shadow: black 0.1em 0.1em 0.1em;
     color: white;
     width: 940px;
     height: 260px;
     font-size:30px;
}
     .left { float: left }
     .right { float: rght }

.loader {
	position:absolute;
	left:50%;
	top:50%;
	z-index:1;
	width:90px;
	height:90px;
	margin:-75px 0 0 -75px;
	border:16px solid #f3f3f3;
	border-radius:50%;
	border-top:16px solid #FF0000;
	width:90px;
	height:90px;
	-webkit-animation:spin 2s linear infinite;
	animation:spin 2s linear infinite;
}
@-webkit-keyframes spin {
	0% {
		-webkit-transform:rotate(0deg);
	}
	100% {
		-webkit-transform:rotate(360deg);
	}
}
@keyframes spin {
	0% {
		transform:rotate(0deg);
	}
	100% {
		transform: rotate(360deg);
	}
}
</style>
</head>
<body>
    <header>
    <%
		String userID = null;
/*
		if( session.getAttribute("userID")!= null) {
			userID = (String) session.getAttribute("userID");
		} else {
			response.sendRedirect("./login.jsp");
		}
*/
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
    </header>
    
    <section class="cf">
    <div class="col-md-12" style="background-color: #FE2E2E; color:#ffffff">
            <h1 class="text-center" style="font-size:70px">글자수 제한없는 번역서비스!</h1>
            <p class="text-center" style="font-size:20px">Translate the text you entered without limitation on the number of characters.</p>
            <p class="text-center"><a id="transButton" class="btn btn-success btn-lg" href="#" role="button">번역하기</a></p>       
    </div>
    </section>
    
    <section class="cf" id='transbar'>

    <div class="container col-md-12" >
	 <div class="col-md-6" style="text-align:center">
	 <table style="margin:0 auto; width: 100%;">
	 	<tr>
	 		<td>
	 	<ul id="from"class="nav">
               		<li class="dropdown">
               			<a id="fromSelect" href="#" class="dropdown-toggle"
               				data-toggle="dropdown" role="button" aria-haspopup="true"
               				aria-expanded="false" data="">언어선택<span class="caret"></span></a>
               			<ul class="dropdown-menu" style="min-width:100%; text-align:center">
               				<li><a name="ko">한국어</a></li>
               				<li><a name="en">영어</a></li>
               				<li><a name="ja">일본어</a></li>
               				<!--<li><a name="zh-CN">중국어(간체)</a></li>-->
               				<!--<li><a name="zh-TW">중국어(번체)</a></li>-->
               				<li><a name="es">스페인어</a></li>
               				<li><a name="vi">베트남어</a></li>
               				<li><a name="th">태국어</a></li>
               				<li><a name="id">인도네시아어</a></li>
               			</ul>
               		</li>
        </ul>
        	</td>
        </tr>
        <tr>
        <td>
      	<textarea id="inputText" class="test" style="width: 100%;" onkeyup="this.style.height='26px'; this.style.height = this.scrollHeight + 'px'; transbarSize()" placeholder="Text를 입력해주세요." ></textarea>
      	</td>
      	</tr>
     </table>
     </div>
	  	
	  	
	 <div class="col-md-6" style="text-align:center">
	 <table style="margin:0 auto; width: 100%;">
	 	<tr>
	 		<td>
	 		<ul id="to" class="nav">
               		<li class="dropdown">
               			<a id="toSelect" href="#" class="dropdown-toggle"
               				data-toggle="dropdown" role="button" aria-haspopup="true"
               				aria-expanded="false" data="">언어 선택<span class="caret"></span></a>
               			<ul class="dropdown-menu" style="min-width:100%; text-align:center">
               				<li><a name="ko">한국어</a></li>
               				<li><a name="en">영어</a></li>
               				<li><a name="ja">일본어</a></li>
               				<li><a name="zh-CN">중국어(간체)</a></li>
               				<li><a name="zh-TW">중국어(번체)</a></li>
               				<li><a name="es">스페인어</a></li>
               				<li><a name="vi">베트남어</a></li>
               				<li><a name="th">태국어</a></li>
               				<li><a name="id">인도네시아어</a></li>
               				
               			</ul>
               		</li>
            </ul>
            </td>
         </tr>
         <tr>
         	<td>
			<pre id="result" style="width:100%; white-space: pre-wrap;">


			</pre>
			<div class="loader" style="display:none">
                        </div>


	 	</td>
	 	</tr>
	</table>		
	</div>
</div>

    </section>
    
    
      <footer style="background-color: #FE2E2E; color:#ffffff">
         <div class="container">
            <div class="row"> <!--row의 총공간은 12로 2씨 나눠서 6개공간 쓴다 -->
               <div class="col-sm-2" style="text-align: center;"><h5>Copyrigth &copy; 2017</h5><h5>이수지 > 배수지</h5></div>
               <div class="col-sm-4"><h4>서비스 소개</h4><p>글자수에 제한없이 번역이 가능하며 입력하는 만큼 입력창의 길이가 늘어납니다!</p></div>
               <div class="col-sm-2"><h4 style="text-align: center;">다른번역 서비스</h4>
                  <div class="list-group">
                     <a href="https://translate.google.co.kr/?hl=ko" class="list-group-item">구글번역</a>
                     <a href="https://papago.naver.com/" class="list-group-item">파파고</a>
                  </div>
               </div>
               <div class="col-sm-2"><h4 style="text-align: center;">SNS</h4>
                  <div class="list-group">
                     <a href="https://www.facebook.com" class="list-group-item">페이스북</a>
                     <a href="https://www.youtube.com"  class="list-group-item">유튜브</a>
                  </div>
               </div>
               <div class="col-sm-2"><h4 style="text-align: center;"><span class="glyphicon glyphicon-ok"></span>&nbsp;Free Translate	</h4></div>
            </div>
         </div>
      </footer><HR>
      
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<script>


	var from="en";
	var to="ko";

	$('#from li > a').on('click', function() {
		
		$('#fromSelect').attr("data", $(this).attr("name"));
		$('#fromSelect').html($(this).text());
		from = $(this).attr("name");
	    
	});
	
	$('#to li > a').on('click', function() { 

		$('#toSelect').attr("data", $(this).attr("name"))
		$('#toSelect').html($(this).text());
	    	to = $(this).attr("name");
	});

	function transbarSize() {
	    var inputText = $("#inputText").css("height").substring(0,$("#inputText").css("height").indexOf("px")) * 1;
	    var result = $("#result").css("height").substring(0,$("#result").css("height").indexOf("px")) * 1;
	    var div = $("#transbar");
        }

	$("#transButton").click(function(){  
	    
      	    var str = $("#inputText").val();

		str = str.replace(/(?:\\)/g, '\\\\');
                str = str.replace(/(?:\t)/g, '\\t');
                str = str.replace(/(?:\v)/g, '\\v');
                str = str.replace(/(?:\")/g, "\\\\\\\"");
//                str = str.replace(/(?:\')/g, '\\\\\\\\\'');
                str = str.replace(/(?:\r\n|\r|\n)/g, '\\n');

	    var data = encodeURI(str);
	    var url = "./translate.jsp";  
	    var params = "from=" + from + "&to=" + to + "&data=" + data;
	  
	    $.ajax({      
	        type:"POST",  
	        url:url,      
	        data:params,    
		beforeSend:function(){
			var loader = $("div.loader"); 
	                loader.css("display","block"); 
		},
	        success:function(args){  
		    console.log(args); 
	            $("#result").html(args);      
	        },   
	        complete:function(){
			var loader = $("div.loader"); 
                        loader.css("display","none");
		},  
	        error:function(e){  
	            alert(e.responseText);  
	        }  
	    });  
	      
	});  


	</script>
</body>
</html>

