/**
 * 
 */
package com.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cdyne.ws.weatherws.Weather;
import com.cdyne.ws.weatherws.WeatherReturn;
import com.cdyne.ws.weatherws.WeatherSoap;
import com.data.WeatherDetails;

/**
 * @author Vineeth
 *
 */
@Controller
@RequestMapping("/getWeather")
public class WeatherInfoController {
	
	@RequestMapping(method = RequestMethod.POST)
	public @ResponseBody WeatherDetails getWeather(HttpServletRequest request, HttpServletResponse response){
		System.out.println("reached controller");
		WeatherDetails weatherDetails = new WeatherDetails();
		String zipCode = request.getParameter("zipCode");
		System.out.println("Zip Code "+zipCode);
		Weather weatherService = new Weather();
		WeatherSoap weatherSoap =  weatherService.getWeatherSoap();
		WeatherReturn weatherReturn  = weatherSoap.getCityWeatherByZIP(zipCode);
		
		weatherDetails.setCity(weatherReturn.getCity());
		weatherDetails.setZipCode(zipCode);
		weatherDetails.setTemperature(weatherReturn.getTemperature());
		
		System.out.println("City"+weatherDetails.getCity());
		return weatherDetails;
	}
	
	@RequestMapping(method = RequestMethod.GET)
	public @ResponseBody WeatherDetails getWeatherNew(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String zipCode = request.getParameter("zipCode");
		System.out.println("Zip Code "+zipCode);
		WeatherDetails weatherDetails = new WeatherDetails();
		Weather weatherService = new Weather();
		WeatherSoap weatherSoap =  weatherService.getWeatherSoap();
		WeatherReturn weatherReturn  = weatherSoap.getCityWeatherByZIP(zipCode);
		if(null == weatherReturn.getCity() || "".equals(weatherReturn.getCity())){
			throw new Exception();
		}
		
		weatherDetails.setCity(weatherReturn.getCity());
		weatherDetails.setZipCode(zipCode);
		weatherDetails.setTemperature(weatherReturn.getTemperature());
		weatherDetails.setDecsription(weatherReturn.getDescription());
		weatherDetails.setPressure(weatherReturn.getPressure());
		weatherDetails.setRelativeHumidity(weatherReturn.getRelativeHumidity());
		weatherDetails.setVisibility(weatherReturn.getVisibility());
		weatherDetails.setWind(weatherReturn.getWind());
		weatherDetails.setWindChill(weatherReturn.getWindChill());
		
		return weatherDetails;
	}
}
