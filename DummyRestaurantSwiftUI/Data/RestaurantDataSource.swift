//
//  RestaurantDataSource.swift
//  DummyRestaurantSwiftUI
//
//  Created by Huan Lin on 12/20/21.
//

import Combine
import Foundation

final class RestaurantDataSource {
  
  private let queue = DispatchQueue(label: "com.foo.restaurant_data_source")

  func fetchRestaurantData() -> Future<[Restaurant], RestaurantDataError> {
    
    return Future { promise in
      let decoder = JSONDecoder()
      decoder.keyDecodingStrategy = .convertFromSnakeCase
      
      guard
        let url = Bundle.main.url(forResource: "restaurants", withExtension: "json"),
        let data = try? Data(contentsOf: url),
        let json = try? decoder.decode(RestaurantData.self, from: data)
      else {
        promise(.failure(RestaurantDataError.restaurantDataError))
        return
      }
      
      promise(.success(json.restaurants))
    }
  }
}

enum RestaurantDataError: Error {
  case restaurantDataError
}

fileprivate struct RestaurantData: Codable {
  let restaurants: [Restaurant]
}

