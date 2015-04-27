<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="<%=request.getContextPath() %>/scripts/jquery-1.11.2.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath() %>/styles/admin.css" rel="stylesheet" type="text/css">
<title>Weather Info</title>
<script type="text/javascript">
$( document ).ready(function() {
	$("#zipCode").focus();
    $('#result').hide();
 
});

$(document).keypress(function(e) {
    if(e.which == 13) {
    	 e.preventDefault(); 
    	validateAndSubmit();
    }
});
function validateAndSubmit(){
	var zipCodeValue = $("#zipCode").val();
	if(zipCodeValue  == null || zipCodeValue == ""){
		alert("Enter a valid zipCode");
	} else{
		$.ajax({
			type: "get",
			url: "getWeather",
			cache: false,
			data: 'zipCode=' + zipCodeValue,
			success: function(response){
				
				var zipCodeResult = response.zipCode;
				$('#zipCodeIdVal').html(zipCodeResult);
				
				var cityResult = response.city;
				$('#cityIdVal').html(cityResult);
				
				var temperatureResult = "<b>"+response.temperature+"</b>";
				$('#temperatureIdVal').html(temperatureResult);
				
				var descriptionResult ="<b>"+ response.decsription+"</b>";
				$('#descrptionIdVal').html(descriptionResult);
				
				var pressureResult = response.pressure;
				$('#pressureIdVal').html(pressureResult);
				
				var relativeHumidityResult = response.relativeHumidity;
				$('#relativeHumidityIdVal').html(relativeHumidityResult);
				
				var visibilityResult = response.visibility;
				$('#visibilityIdVal').html(visibilityResult);
				
				var windResult = response.wind;
				$('#windIdVal').html(windResult);
				
				var windChillResult = response.windChill;
				$('#windChillIdVal').html(windChillResult);
				
				
				$('#result').show();
				 $('#errorResult').hide();
				 
			},
			error: function(){
			 var errorMessage = 'Not Supported/ Error occurred';
			 $('#result').hide();
			 $('#errorResult').show();
			 $('#errorResult').html(errorMessage);
			}
		});
	}
}
</script>
</head>

<body>
<form action="getWeather" method="get">
	<table>
	<tr>
	
		<tr>
			<td>Please Enter a Zip Code</td>
			<td> <input type="text" value="" id="zipCode" /></td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>&nbsp;&nbsp;</td>
			<td><input type="button" value="Submit" onclick="validateAndSubmit()" /></td>
		</tr>
		<tr>
			<td>&nbsp;&nbsp;</td>
			<td>&nbsp;&nbsp;</td>
	</table>
	
	<div id="errorResult">
	</div>
	<div id="result">
		<table>
			<tr>
				<td id="zipCodeId">Zip Code</td>
				<td id="zipCodeIdVal"></td>
			</tr>
			<tr>
				<td id="cityId">City</td>
				<td id="cityIdVal"></td>
			</tr>
			<tr>
				<td id="temperatureId"><b>Temperature</b></td>
				<td id="temperatureIdVal"></td>
			</tr>
			<tr>
				<td id="descrptionId"><b>Description</b></td>
				<td id="descrptionIdVal"></td>
			</tr>
			<tr>
				<td id="pressureId">Pressure</td>
				<td id="pressureIdVal"></td>
			</tr>
			<tr>
				<td id="relativeHumidityId">Relative Humidity</td>
				<td id="relativeHumidityIdVal"></td>
			</tr>
			<tr>
				<td id="visibilityId">Visibility</td>
				<td id="visibilityIdVal"></td>
			</tr>
			<tr>
				<td id="windId">Wind</td>
				<td id="windIdVal"></td>
			</tr>
			<tr>
				<td id="windChillId">Wind Chill</td>
				<td id="windChillIdVal"></td>
			</tr>
		
		</table>
		
	</div>
	</form>
	
</body>
</html>