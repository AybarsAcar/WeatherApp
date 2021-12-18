//
//  WebService.swift
//  Weather
//
//  Created by Aybars Acar on 18/12/2021.
//

import Foundation


enum NetworkError: Error {
case badURL, noData
}


class Webservice {
  
  func getWeatherByCity(_ city: String, completion: @escaping ((Result<Weather, NetworkError>) -> Void)) {
    
    
    guard let weatherURL = Constants.Urls.weatherByCity(city: city) else {
      return completion(.failure(.badURL))
    }
    
    URLSession.shared.dataTask(with: weatherURL) { data, _, error in
      
      guard let data = data, error == nil else {
        return completion(.failure(.noData))
      }
      
      let weatherResponse = try? JSONDecoder().decode(WeatherResponse.self, from: data)
      
      if let weatherResponse = weatherResponse {
        
        completion(.success(weatherResponse.weather))
      }
      
    }.resume()
    
  }
  
}
