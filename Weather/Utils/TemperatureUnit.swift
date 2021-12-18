//
//  TemperatureUnit.swift
//  Weather
//
//  Created by Aybars Acar on 18/12/2021.
//

import Foundation


enum TemperatureUnit: String, CaseIterable, Identifiable {
  
  var id: String {
    return rawValue
  }
  
  case celsius
  case fahrenheit
  case kelvin
}


extension TemperatureUnit {
  
  var stringValue: String {
    switch self {
    case .celsius:
      return "Celsius"
    case .fahrenheit:
      return "Fahrenheit"
    case .kelvin:
      return "Kelvin"
    }
  }
}
