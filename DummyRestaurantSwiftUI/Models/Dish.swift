//
//  Dish.swift
//  DummyRestaurantSwiftUI
//
//  Created by Huan Lin on 12/20/21.
//

struct Dish {
  let name: String
  let fileName: String
  let category: FoodCategory
  let allergens: [Allergen]
}

extension Dish {
  func match(with query: String) -> Bool {
    name.lowercased().contains(query.lowercased())
  }
}
