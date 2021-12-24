//
//  HomeScreen.swift
//  DummyRestaurantSwiftUI
//
//  Created by Huan Lin on 12/20/21.
//

import SwiftUI

struct HomeScreen: View {
  
  @State var restaurants: [Restaurant] = []
  @State var dishQuery: String = ""
  @State var isVegOn = false
  @State var doneLoading = false
    
  private let restaurantDataSource: RestaurantDataSource
  
  init(restaurantDataSource: RestaurantDataSource) {
    self.restaurantDataSource = restaurantDataSource
  }
  
  var filteredList: [Restaurant] {
    let vegFiltered = isVegOn
    ? restaurants.filter { restaurant in
      return restaurant.dishes.contains { dish in
        dish.category == .vegetarian
      }
    }
    : restaurants
    
    guard !dishQuery.isEmpty else { return vegFiltered }
    
    return vegFiltered.filter { restaurant in
      restaurant.dishes.contains { dish in
        dish.match(with: dishQuery)
      }
    }
  }
  
  @State private var showDetailView = false
  
  var mainBody: some View {
    NavigationView {
      VStack {
        if doneLoading {
          
          List(filteredList) { restaurant in
            NavigationLink {
              DetailScreen(restaurant: restaurant)
            } label: {
              RestaurantListRow(restaurant: restaurant)
            }
          }
          .toolbar {
            ToolbarItem(placement: .principal) {
              SearchBar(searchText: $dishQuery, isVegieOn: $isVegOn)
            }
          }
        } else {
          ProgressView()
        }
      }
    }

  }
  
  var body: some View {
    mainBody
      .onAppear {
        _ = restaurantDataSource.fetchRestaurantData()
          .sink(receiveCompletion: { _ in }, receiveValue: { restaurants in
            self.doneLoading = true
            self.restaurants = restaurants
          })
      }
  }
}

struct HomeScreen_Previews: PreviewProvider {
  static var previews: some View {
    HomeScreen(restaurantDataSource: RestaurantDataSource())
  }
}
