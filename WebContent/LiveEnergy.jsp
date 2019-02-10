<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@page import="java.util.*” %> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="index.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>

<script src="https://www.gstatic.com/firebasejs/5.8.1/firebase-app.js"></script>
<script
	src="https://www.gstatic.com/firebasejs/5.8.1/firebase-database.js"></script>

<meta charset="UTF-8">
<title>Live Energy</title>

<script>
/* class Node{	
	 constructor(String name, Double demand, Double latitude, Double longitude){
	 this.name = name; 
	 this.demand = demand; 
	 this.Latitude = latitude; 
	 this.Longitude = longitude; 
	 }	
	 }; */	
	var FirstData;
	var staticUrl = 'https://ucd-pi-iis.ou.ad3.ucdavis.edu/piwebapi/elements/E0bgZy4oKQ9kiBiZJTW7eugwvgV_Y00J5BGt6DwVwsURwwVVRJTC1BRlxDRUZTXFVDREFWSVNcQlVJTERJTkdT/elements';
	var config = {
		apiKey : "AIzaSyAG9VVQFZqTRSUBgBoGEin77YEK7ZqP7wA",
		authDomain : "liveenergy-1549749803719.firebaseapp.com",
		databaseURL : "https://liveenergy-1549749803719.firebaseio.com",
		projectId : "liveenergy-1549749803719",
		storageBucket : "liveenergy-1549749803719.appspot.com",
		messagingSenderId : "600273913261"
	};
	firebase.initializeApp(config);
	var database = firebase.database();

	async function doThing(i) {
		var name;
		var demand;
		var latitude;
		var longitude; 

		const data = await $.getJSON(staticUrl);
		
		var Url2 = data.Items[i].Links.Attributes;
		const data2 = await $.getJSON(Url2);
		
		var Url3 = data2.Items[10].Links.Value;
		const data3 = await $.getJSON(Url3);
		
		var Url4 = data2.Items[7].Links.Value;
		const data4 = await $.getJSON(Url4);
		
		var Url5 = data2.Items[6].Links.Value;
		const data5 = await $.getJSON(Url5);
		name = data.Items[i].Name; 
		demand = data3.Value;
		latitude = data5.Value;
		longitude = data4.Value;
		console.log(name);
		console.log("demand" + demand);
		console.log("longitude" + longitude);
		console.log("latitude" + latitude);
		
		
		$.getJSON(staticUrl, function(data) {
			//console.log("-----------------");
			FirstData = data;
			var name =  data.Items[i].Name;
			//sfirebase.database().ref().update(newData);
			//console.log(data.Items[i].Name); //Name of the building
			var Url2 = data.Items[i].Links.Attributes;
			$.getJSON(Url2, function(data2) {
				var Url3 = data2.Items[10].Links.Value;
				$.getJSON(Url3, function(data3) {
					demand = data3.Value;
					//console.log("demand" + data3.Value); // total demand of a building
				});
				var Url4 = data2.Items[7].Links.Value;
				$.getJSON(Url4, function(data4) {
					longitude = data4.Value;
					//console.log("long" + data4.Value); // longitude of the Building
				});
				var Url5 = data2.Items[6].Links.Value;
				$.getJSON(Url5, function(data5) {
					latitude = data5.Value;
					//console.log("lat" + data5.Value); // lattitude of the Building
				});
			});
		});
//print here
	};
	
	async function doAllThings() {
		await doThing(1);
		await doThing(54);
		await doThing(57);
		await doThing(92);
		await doThing(95);
		await doThing(15);
		await doThing(126);
		await doThing(62);
		await doThing(70);
		await doThing(147);
	}
	
	doAllThings();
	
	//adding 10 main buildings at UC davis
	/* doThing(1);
	doThing(54);
	doThing(57);
	doThing(92);
	doThing(95);
	doThing(15);
	doThing(126);
	doThing(62);
	doThing(70);
	doThing(147); */
</script>

</head>
<body>
	<img id="logo" src="logo.jpg"></img>

</body>
</html>