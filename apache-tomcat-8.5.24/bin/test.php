<meta charset=utf-8></meta>
<?
	$data = $_POST['data'];
	echo $data;
	if(isset($data)){
	 system("python parse.py \"".$data."\"");
	}
?>


<form method=POST action=# id=dd>
	<textarea id=data name=data></textarea>
	<input type=button name="sub" onclick=check()>
</form>

<script>
	function check(){
		var str = document.getElementById("data").value;
		str = str.replace(/(?:\\)/g, '\\\\');
		str = str.replace(/(?:\t)/g, '\\t');
		str = str.replace(/(?:\v)/g, '\\v');
		str = str.replace(/(?:\")/g, "\\\\\\\"");
		str = str.replace(/(?:\')/g, '\\\\\\\'');
		str = str.replace(/(?:\r\n|\r|\n)/g, '\\n');
		
		document.getElementById("data").value = str;
		document.getElementById("dd").submit();
	}	
</script>
