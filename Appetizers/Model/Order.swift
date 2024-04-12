//
//  Order.swift
//  Appetizers
//
//  Created by Telles Ivan on 4/12/24.
//

import SwiftUI
import Foundation

final class Order: ObservableObject {
   @Published var orderItems: [Appetizer] = []
   
   func addItem(_ appetizer: Appetizer) {
      orderItems.append(appetizer)
   }
   
   func deleteItem(at offset: IndexSet) {
      orderItems.remove(atOffsets: offset)
   }
}
