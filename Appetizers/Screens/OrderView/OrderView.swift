//
//  OrderView.swift
//  Appetizers
//
//  Created by Telles Ivan on 4/1/24.
//

import SwiftUI

struct OrderView: View {
   @EnvironmentObject var order: Order
   
    var body: some View {
       if #available(iOS 16.0, *) {
          NavigationStack {
             ZStack {
                VStack {
                   List {
                      ForEach($order.orderItems) { $appetizer in
                         AppetizerListCellView(appetizer: appetizer)
                      }
                      .onDelete(perform: order.deleteItem)
                   }
                   Button {
                      print("Order")
                   } label: {
                      APButton(title:"Place Order")
                   }
                }
                if order.orderItems.isEmpty {
                   EmptyState(message: "No items in your order, \n Please add an appetizer.")
                }
                
             }
             .onAppear {
                print("order \(order.orderItems.count)")
             }
             .navigationTitle("Orders")
          }
       } else {
          NavigationView {
             ZStack {
                VStack {
                   List {
                      ForEach($order.orderItems) { $appetizer in
                         AppetizerListCellView(appetizer: appetizer)
                      }
                      .onDelete(perform: order.deleteItem)
                   }
                   Button {
                      print("Order")
                   } label: {
                      APButton(title:"Place Order")
                   }
                }
                if order.orderItems.isEmpty {
                   EmptyState(message: "No items in your order, \n Please add an appetizer.")
                }
                
             }
             .onAppear {
                print("order \(order.orderItems.count)")
             }
             .navigationTitle("Orders")
          }
       }
    }
   
}

#Preview {
    OrderView()
}
