//
//  WeatherListScreen.swift
//  Weather
//
//  Created by Aybars Acar on 18/12/2021.
//

import SwiftUI


enum Sheet: Identifiable {
  var id: UUID { return UUID() }
  
  case addNewCity, settings
}


struct WeatherListScreen: View {
  
  @EnvironmentObject var store: Store
  
  @State private var activeSheet: Sheet?
  
  var body: some View {
    
    
    List {
      ForEach(store.weatherList, id: \.id) { weather in
        WeatherCell(weather: weather)
      }
    }
    .listStyle(.plain)
    .sheet(
      item: $activeSheet,
      onDismiss: {
        activeSheet = nil
      },
      content: { item in
        switch item {
        case .addNewCity:
          AddCityScreen()
        case .settings:
          SettingsScreen()
        }
      }
    )
    .navigationBarItems(leading: Button(action: {
      activeSheet = .settings
    }) {
      Image(systemName: "gearshape")
    }, trailing: Button(action: {
      activeSheet = .addNewCity
    }, label: {
      Image(systemName: "plus")
    }))
    .navigationTitle("Cities")
    .embedInNavigationView()
  }
}



struct WeatherListScreen_Previews: PreviewProvider {
  static var previews: some View {
    WeatherListScreen()
      .environmentObject(Store())
  }
}


