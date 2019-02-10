<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
  
    <link rel="stylesheet" type="text/css" href="graph.css" />
    <!--Load the AJAX API-->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Cabin|Roboto:400,700|Roboto+Condensed:400,700" rel="stylesheet">
    <script type="text/javascript">


      // Load the Visualization API and the corechart package.
      google.charts.load('current', {'packages':['corechart']});

      // Set a callback to run when the Google Visualization API is loaded.
      google.charts.setOnLoadCallback(drawChart);

      // Callback that creates and populates a data table,
      // instantiates the pie chart, passes in the data and
      // draws it.
      function drawChart() {

        // Create the data table.
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Topping');
        data.addColumn('number', 'Slices');
        data.addRows([
          ['Activities and Recreation Center',  2516.83],
          ['Art Building Annex',  72.66],
          ['Genome & Biomedical Sciences Facility', 8455.33],
          ['Giedt Hall ', 51.96],
          ['Hart Hall', 591.62],
          ['Housing Administration',  47.85],
          ['Mrak Hall',  225.08],
          ['Olson Hall', 417.01],
          ['Shields Library', 4788.26],
          ['Tercero Dining Commons', 2448.75]
        ]);
        
       
        // Set chart options
        var options = {'title':'Energy Consumption in UC Davis',
                       'width':1000,
                       'height':1000,
                       'is3D':true,
                       'legend': {textStyle: {color: '#FFFFFF'}},
                       'backgroundColor': '#000000'
                       };

        // Instantiate and draw our chart, passing in some options.
        var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
        chart.draw(data, options);
      }
    </script>
  </head>

  <body>
    <!--Div that will hold the pie chart-->
    <div id="chart_div"></div>
  </body>
</html>