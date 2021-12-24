//
//  DetailScreen.swift
//  DummyRestaurantSwiftUI
//
//  Created by Huan Lin on 1/11/22.
//

import SwiftUI
import MapKit

struct DetailScreen: View {
  let restaurant: Restaurant
  
  var body: some View {
    VStack {
      Map(
        coordinateRegion: .constant(
          MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: restaurant.location.latitude, longitude: restaurant.location.longitude),
            span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))),
        interactionModes: [])
      .frame(width: 300, height: 300)
      
      HStack {
        Link("Launch website", destination: URL(string: restaurant.website)!)
        Spacer()
        Link("Launch map", destination: URL(string: "maps://?saddr=&daddr=\(restaurant.location.latitude),\(restaurant.location.longitude)")!)
      }
      
      List(restaurant.dishes) { dish in
        DishRow(dish: dish)
      }
    }
    .navigationTitle(restaurant.name)
  }
}

struct DishRow: View {
  let dish: Dish
  var body: some View {
    HStack {
      VStack(alignment: .leading) {
        Text(dish.name)
        Text(dish.allergens.description)
      }
      
      Spacer()
      
      Image(dish.fileName)
        .resizable()
        .frame(width: 32, height: 32)
      
    }
  }
}
