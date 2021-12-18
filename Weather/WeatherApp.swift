//
//  WeatherApp.swift
//  Weather
//
//  Created by Aybars Acar on 18/12/2021.
//

import SwiftUI

@main
struct WeatherApp: App {
  var body: some Scene {
    WindowGroup {
      WeatherListScreen()
        .environmentObject(Store()) // add store as an environment object to the application
    }
  }
}
