//
//  Allergen.swift
//  DummyRestaurantSwiftUI
//
//  Created by Huan Lin on 12/20/21.
//

enum Allergen: String {
  case peanut = "peanut"
  case egg = "egg"
  case milk = "milk"
  case fish = "fish"
  case shrimp = "shrimp"
}

extension Allergen: CustomStringConvertible {
  var description: String {
    "WARNING: \(rawValue.uppercased())"
  }
}

