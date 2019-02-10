
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@page import="java.util.*” %> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="https://fonts.googleapis.com/css?family=Cabin|Roboto:400,700|Roboto+Condensed:400,700" rel="stylesheet">
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

		const data = await
		$.getJSON(staticUrl);

		var Url2 = data.Items[i].Links.Attributes;
		const data2 = await
		$.getJSON(Url2);

		var Url3 = data2.Items[10].Links.Value;
		const data3 = await
		$.getJSON(Url3);

		var Url4 = data2.Items[7].Links.Value;
		const data4 = await
		$.getJSON(Url4);

		var Url5 = data2.Items[6].Links.Value;
		const data5 = await
		$.getJSON(Url5);
		name = data.Items[i].Name;
		demand = data3.Value;
		latitude = data5.Value;
		longitude = data4.Value;
		/* console.log(name);
		console.log("demand" + demand);
		console.log("longitude" + longitude);
		console.log("latitude" + latitude); */
		//dont do firebase anywhere else
		var newData = {};
		newData['/Data/' + name + '/'] = {
			Demand : demand,
			Latitude : latitude,
			Longitude : longitude
		};
		firebase.database().ref().update(newData);

		$.getJSON(staticUrl, function(data) {
			//console.log("-----------------");
			FirstData = data;
			var name = data.Items[i].Name;
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
</script>

</head>
<body>
	<img id="logo" src="logo.jpg"></img>
	<a href="graph.jsp">Graph</a>
	<hr>
	
	<script>
	
		var name;
		var snapshot;
	
		var query = firebase.database().ref('/Data/');
		query.once("value", function(snapshot) {
			 snapshot.forEach(function(childSnapshot) {
			 name = childSnapshot.key;
			 console.log(name);
			  var childData = childSnapshot.val();
			  console.log(childData.Demand);
			  console.log(childData.Latitude);
			  console.log(childData.Longitude);
				
			  var div = document.createElement("div");
			      div.setAttribute('class', 'item');
			      div.innerHTML = '<p>' + 'The average data consumption for ' + name + ' is ' + 
			      parseFloat(childData.Demand / 30).toFixed(2) + ' kBtu/h.' + '</p>';
			      document.getElementById("container").appendChild(div);
			      
			 
			 });
			});
				
		
		function initMap() {
			var map = new google.maps.Map(document.getElementById('map'), {
				center : new google.maps.LatLng(38.538231, -121.761711),
				mapTypeId : google.maps.MapTypeId.ROADMAP,
				zoom : 15
			});

			var locations = [
					new google.maps.LatLng(38.5428969596, -121.759644393),
					new google.maps.LatLng(38.5383918377, -121.748655997),
					new google.maps.LatLng(38.53511875493, -121.765185135),
					new google.maps.LatLng(38.53771717489, -121.7554633827),
					new google.maps.LatLng(38.54062956314, -121.750849521),
					new google.maps.LatLng(38.54313686366, -121.756112585),
					new google.maps.LatLng(38.53704388725, -121.749164192),
					new google.maps.LatLng(38.54001014296, -121.747623121),
					new google.maps.LatLng(38.53973872421, -121.749107278),
					new google.maps.LatLng(38.5362059209, -121.757507882),

			// and additional coordinates, just add a new item
			];

			locations.forEach(function(location) {
				var marker = new google.maps.Marker({
					position : location,
					map : map
				});
			});
		};
		
	
	      
	</script>
	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAXQN_H5e8DA4xxj3JwpMBoNiqdDg5I3HI&callback=initMap">
		
	</script>
	<div id="map"></div>
	<div id="container"></div>
</body>
</html>