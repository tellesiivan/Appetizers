//
//  Appetizer.swift
//  Appetizers
//
//  Created by Telles Ivan on 4/1/24.
//

import Foundation

struct Appetizer: Decodable, Identifiable {
   let id: Int
   let name: String
   let description: String
   let price: Double
   let imageURL: String
   let calories: Int
   let protein: Int
   let carbs: Int
}

struct AppetizerResponse: Decodable {
   let request: [Appetizer]
}

struct Mockdata {
   static let sampleAppetizer = Appetizer(id: 011, name: "New York Ribs", 
                                          description: "Amazing ribs that are sold through out the United States",
                                          price: 39.99,
                                          imageURL: "https://cdn.fs.teachablecdn.com/iBkHum1RQ6kVVWyzNy0r",
                                          calories: 420, protein: 65, carbs: 120)
   
   static let appetizers = [sampleAppetizer, sampleAppetizer, sampleAppetizer, sampleAppetizer]
}
