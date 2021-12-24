//
//  SearchBar.swift
//  DummyRestaurantSwiftUI
//
//  Created by Huan Lin on 1/11/22.
//

import SwiftUI

struct SearchBar: View {
  
  var searchText: Binding<String>
  var isVegieOn: Binding<Bool>
  
  var body: some View {
    HStack {
      TextField("Enter dish name", text: searchText)
      Toggle("I'm vegetarian", isOn: isVegieOn)
    }
  }
}
