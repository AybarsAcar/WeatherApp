//
//  ViewExtensions.swift
//  Weather
//
//  Created by Aybars Acar on 18/12/2021.
//

import Foundation
import SwiftUI


extension View {
  
  func embedInNavigationView() -> some View {
    return NavigationView { self }
  }
  
}
