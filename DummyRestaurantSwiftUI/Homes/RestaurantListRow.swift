//
//  RestaurantListView.swift
//  DummyRestaurantSwiftUI
//
//  Created by Huan Lin on 1/11/22.
//

import SwiftUI

struct RestaurantListRow: View {
  
  let restaurant: Restaurant
  
  var body: some View {
    HStack {
      Image(restaurant.fileName)
        .resizable()
        .frame(width: 32, height: 32)
      Text(restaurant.name)
      Spacer()
    }
  }
}
