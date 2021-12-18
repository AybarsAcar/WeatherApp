//
//  AddWeatherViewModel.swift
//  Weather
//
//  Created by Aybars Acar on 18/12/2021.
//

import Foundation
import SwiftUI


///
/// this view model is responsible for adding a location
/// so that city is added to our list of weatehrs
///
class AddWeatherViewModel: ObservableObject {
  
  var city: String = ""
  
  private var _api = Webservice()
  
  func save(completion: @escaping (WeatherViewModel) -> Void) {
    _api.getWeatherByCity(city) { result in
      
      switch result {
      case .success(let weather):
        DispatchQueue.main.async {
          completion(WeatherViewModel(weather: weather))
        }
        
      case .failure(let error):
        print(error)
      }
      
    }
  }
}


///
/// Weather Object that is passed down to our view layer
///
struct WeatherViewModel {
  let weather: Weather
  let id: UUID = UUID()
  
  func getTemperatureByUnit(_ unit: TemperatureUnit) -> Double {
    switch unit {
    case .kelvin:
      return weather.temperature
      
    case .celsius:
      return weather.temperature - 273.15
      
    case .fahrenheit:
      return 1.8 * (weather.temperature - 273) + 32
    }
  }
  
  var temperature: Double {
    return weather.temperature
  }
  
  var city: String {
    return weather.city
  }
  
  var icon: String {
    return weather.icon
  }
  
  var sunrise: Date {
    return weather.sunrise
  }
  
  var sunset: Date {
    return weather.sunset
  }
}
