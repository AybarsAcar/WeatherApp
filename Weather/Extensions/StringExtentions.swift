//
//  StringExtentions.swift
//  Weather
//
//  Created by Aybars Acar on 18/12/2021.
//

import Foundation


extension String {
  
  var escaped: String {
    return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? self
  }
  
}
