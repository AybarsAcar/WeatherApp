//
//  WeatherCell.swift
//  Weather
//
//  Created by Aybars Acar on 18/12/2021.
//

import SwiftUI


struct WeatherCell: View {
  
  @EnvironmentObject var store: Store

  let weather: WeatherViewModel
  
  var body: some View {
    
    HStack {

      VStack(alignment: .leading, spacing: 15) {

        Text(weather.city)
          .fontWeight(.bold)

        HStack {
          Image(systemName: "sunrise")
          Text("\(weather.sunrise)")
        }

        HStack {
          Image(systemName: "sunset")
          Text("\(weather.sunset)")
        }
      }

      Spacer()
      
      URLImage(url: Constants.Urls.weatherUrlAsStringByIcon(icon: weather.icon))
        .frame(width: 50, height: 50, alignment: .center)

      Text("\(weather.getTemperatureByUnit(store.selectedUnit)) \(String(store.selectedUnit.stringValue.prefix(1)))")

    }
    .padding()
    .background(Color(#colorLiteral(red: 0.9133135676, green: 0.9335765243, blue: 0.98070997, alpha: 1)))
    .clipShape(RoundedRectangle(cornerRadius: 10, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/))
  }
}
