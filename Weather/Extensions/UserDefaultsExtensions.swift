//
//  UserDefaultsExtensions.swift
//  Weather
//
//  Created by Aybars Acar on 18/12/2021.
//

import Foundation


extension UserDefaults {
  
  /// reads the value from unit
  /// if it doesn't exist returns a .kelvin
  var unit: TemperatureUnit {
    guard let value = self.value(forKey: "unit") as? String else {
      return .kelvin
    }
    
    return TemperatureUnit(rawValue: value) ?? .kelvin
  }
  
}
