//
//  FoodCategory.swift
//  DummyRestaurantSwiftUI
//
//  Created by Huan Lin on 12/20/21.
//

enum FoodCategory: String {
  case japanese = "japanese"
  case italian = "italian"
  case vegetarian = "vegetarian"
  case misc = "misc"
}

extension FoodCategory: CustomStringConvertible {
  var description: String {
    rawValue.uppercased()
  }
}
