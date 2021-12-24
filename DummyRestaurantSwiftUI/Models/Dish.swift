//
//  Dish.swift
//  DummyRestaurantSwiftUI
//
//  Created by Huan Lin on 12/20/21.
//

struct Dish: Codable {
  let name: String
  let fileName: String
  let category: FoodCategory
  let allergens: [Allergen]
}

extension Dish: Identifiable {
  var id: Int {
    return name.hashValue
  }
}

extension Dish {
  func match(with query: String) -> Bool {
    name.lowercased().contains(query.lowercased())
  }
}
