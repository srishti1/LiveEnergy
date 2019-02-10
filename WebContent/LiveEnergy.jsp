<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@page import="java.util.*” %> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="index.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>

<meta charset="UTF-8">
<title>Live Energy</title>

<script> 
	var FirstData;
    var staticUrl = 'https://ucd-pi-iis.ou.ad3.ucdavis.edu/piwebapi/elements/E0bgZy4oKQ9kiBiZJTW7eugwvgV_Y00J5BGt6DwVwsURwwVVRJTC1BRlxDRUZTXFVDREFWSVNcQlVJTERJTkdT/elements';
    $.getJSON(staticUrl, function(data) {
      console.log("This is an example of a static JSON file being served by a web server.")
	  FirstData = data;
	  //console.log(data.Items[0]);
      console.log(data.Items[0].Name); //Name of the building
	  var Url2 = data.Items[0].Links.Attributes;
		    $.getJSON(Url2, function(data2) {
		     //console.log(data2.Items[10].Links.Value);
			 var Url3 = data2.Items[10].Links.Value;
				$.getJSON(Url3, function(data3) {
			     console.log("demand"+data3.Value); // total demand of a building
			    });
			 var Url4 = data2.Items[7].Links.Value;
				$.getJSON(Url4, function(data4) {
				  console.log("long"+data4.Value); // longitude of the Building
				  });
			 var Url5 = data2.Items[6].Links.Value;
				$.getJSON(Url5, function(data5) {
				  console.log("lat"+data5.Value); // lattitude of the Building
				  });
			
		    });
	
    });
//console.log(data.Items[0])
    
</script>

</head>
<body>
<img id="logo" src="logo.jpg"></img>

</body>
</html>