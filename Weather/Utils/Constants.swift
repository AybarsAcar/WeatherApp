//
//  Constants.swift
//  Weather
//
//  Created by Aybars Acar on 18/12/2021.
//

import Foundation


struct Constants {
  struct Urls {
    static func weatherByCity(city: String) -> URL? {
      return URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city.escaped)&appid=ef0fd9866ca027e0dca474cee84c53be")
    }
    
    static func weatherUrlAsStringByIcon(icon: String) -> String {
      return "https://openweathermap.org/img/w/\(icon).png"
    }
  }
}
