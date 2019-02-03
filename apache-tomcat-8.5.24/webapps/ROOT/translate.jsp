<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%
String from = request.getParameter("from");
String to = request.getParameter("to");
String data = request.getParameter("data");

Process process = null;
BufferedReader in = null;
BufferedReader err = null;

if(from == null || to == null || data == null){
	out.println(from);
	out.println(to);
	out.println(data);
	out.println("nop");
	return;
}


String s;
try {
	process = Runtime.getRuntime().exec(new String[]{"python3","parse.py",from,to,data});

	in =  new BufferedReader (new InputStreamReader(process.getInputStream()));
	while (( s = in.readLine ())!= null) {
		out.println(s+"<br>");
	}
	err = new BufferedReader(new InputStreamReader(process.getErrorStream()));
	while (err.ready()) {
		out.println(err.readLine()+"<br>");
	}
} catch (Exception e) {
	out.println("Error : "+e);
} finally {
	if (in != null) try { in.close(); }  catch (Exception sube) {}
	if (err != null) try { err.close(); }  catch (Exception sube) {}
}

%>
