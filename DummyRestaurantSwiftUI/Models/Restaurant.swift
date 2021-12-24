//
//  Restaurant.swift
//  DummyRestaurantSwiftUI
//
//  Created by Huan Lin on 12/20/21.
//

struct Restaurant: Codable {
  let name: String
  let fileName: String
  let website: String
  let location: Location
  let dishes: [Dish]
}

extension Restaurant: Identifiable {
  var id: Int {
    return name.hashValue
  }
}
