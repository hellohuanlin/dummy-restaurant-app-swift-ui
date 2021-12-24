//
//  Allergen.swift
//  DummyRestaurantSwiftUI
//
//  Created by Huan Lin on 12/20/21.
//

enum Allergen: String, Codable {
  case peanut = "peanut"
  case egg = "egg"
  case milk = "milk"
  case fish = "fish"
  case shrimp = "shrimp"
}

extension Array where Element == Allergen {
  var description: String {
    "WARNING:" + map { $0.rawValue.uppercased() }.joined(separator: ", ")
  }
}

