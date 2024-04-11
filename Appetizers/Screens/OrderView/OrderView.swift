//
//  OrderView.swift
//  Appetizers
//
//  Created by Telles Ivan on 4/1/24.
//

import SwiftUI

struct OrderView: View {
   @State private var orderItems = Mockdata.orderItems
   
    var body: some View {
       NavigationStack {
          ZStack {
             VStack {
                List {
                   ForEach(orderItems) {appetizer in
                      AppetizerListCellView(appetizer: appetizer)
                   }
                   .onDelete(perform: deleteItems)
                }
                Button {
                   print("Order")
                } label: {
                   APButton(title:"Place Order")
                }
             }
             if !orderItems.isEmpty {
                EmptyState(message: "No items in your order, \n Please add an appetizer.")
             }
             
          }
          .navigationTitle("Orders")
       }
    }
   
   func deleteItems(at offset: IndexSet) {
      orderItems.remove(atOffsets: offset)
   }
}

#Preview {
    OrderView()
}
