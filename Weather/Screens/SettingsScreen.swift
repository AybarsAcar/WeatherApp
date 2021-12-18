//
//  SettingsScreen.swift
//  Weather
//
//  Created by Aybars Acar on 18/12/2021.
//

import SwiftUI

struct SettingsScreen: View {
  
  @Environment(\.presentationMode) var mode: Binding<PresentationMode>
  
  @EnvironmentObject var store: Store
  
  @AppStorage("unit") private var selectedUnit: TemperatureUnit = .kelvin

  
  var body: some View {
    
    VStack {
      Picker(selection: $selectedUnit, label: Text("Select temperature unit")) {
        ForEach(TemperatureUnit.allCases, id: \.self) { unit in
          Text("\(unit.stringValue)" as String)
        }
      }
      .pickerStyle(.segmented)
      
      Spacer()
    }
    .padding()
    .navigationTitle("Settings")
    .navigationBarItems(trailing: Button("Done") {
      mode.wrappedValue.dismiss()
      store.selectedUnit = selectedUnit
    })
    .embedInNavigationView()
    
  }
}

struct SettingsScreen_Previews: PreviewProvider {
  static var previews: some View {
    SettingsScreen()
  }
}
