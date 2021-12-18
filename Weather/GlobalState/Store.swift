//
//  Store.swift
//  Weather
//
//  Created by Aybars Acar on 18/12/2021.
//

import Foundation


///
/// This will be our global store
///
class Store: ObservableObject {
  
  @Published var weatherList: [WeatherViewModel] = [WeatherViewModel]()
  @Published var selectedUnit: TemperatureUnit = .kelvin
  
  init() {
    selectedUnit = UserDefaults.standard.unit
  }
  
  func addWeather(_ weather: WeatherViewModel) {
    weatherList.append(weather)
  }
}
