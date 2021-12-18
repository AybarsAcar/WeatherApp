//
//  Weather.swift
//  Weather
//
//  Created by Aybars Acar on 18/12/2021.
//

import Foundation


struct WeatherResponse: Decodable {
  
  let name: String
  var weather: Weather
  let icon: [WeatherIcon]
  let sys: Sys
  
  
  // created to we can extract values from nested objects in the JSON response
  private enum CodingKeys: String, CodingKey {
    case name
    case weather = "main"
    case icon = "weather" // icon is represented by weather in the JSON Response
    case sys = "sys"
  }
  
  enum WeatherKeys: String, CodingKey {
    case temperature = "temp"
  }
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    
    name = try container.decode(String.self, forKey: .name)
    
    // search for the icon
    icon = try container.decode([WeatherIcon].self, forKey: .icon)
    
    sys = try container.decode(Sys.self, forKey: .sys)
    
    let weatherContainter = try container.nestedContainer(keyedBy: WeatherKeys.self, forKey: .weather)
    
    let temperature = try weatherContainter.decode(Double.self, forKey: .temperature)
    
    // reassign the weatehr
    weather = Weather(city: name, temperature: temperature, icon: icon.first!.icon, sunrise: sys.sunrise, sunset: sys.sunset)
  }
}


struct Weather: Decodable {
  let city: String
  let temperature: Double
  let icon: String
  let sunrise: Date
  let sunset: Date
}


struct WeatherIcon: Decodable {
  let main: String
  let description: String
  let icon: String
}

struct Sys: Decodable {
  let sunrise: Date
  let sunset: Date
  
  
  private enum CodingKeys: String, CodingKey {
    case sunrise = "sunrise"
    case sunset = "sunset"
  }
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    
    let sunriseTimeInterval = try container.decode(Int32.self, forKey: .sunrise)
    let sunsetTimeInterval = try container.decode(Int32.self, forKey: .sunset)
    
    sunset = Date(timeIntervalSince1970: TimeInterval(sunsetTimeInterval))
    sunrise = Date(timeIntervalSince1970: TimeInterval(sunriseTimeInterval))
  }
}
