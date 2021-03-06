//
//  DateExtensions.swift
//  Weather
//
//  Created by Aybars Acar on 18/12/2021.
//

import Foundation


extension Date {
  
  func formatAsString() -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "hh:mm a"
    
    return formatter.string(from: self)
  }
  
}
