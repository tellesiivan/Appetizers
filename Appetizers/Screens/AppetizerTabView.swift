//
//  ContentView.swift
//  Appetizers
//
//  Created by Telles Ivan on 4/1/24.
//

import SwiftUI

struct AppetizerTabView: View {
   @EnvironmentObject var order: Order

    var body: some View {
       TabView {
          AppetizerListView()
             .tabItem {Label("Home", systemImage: "house")}
          AccountView()
             .tabItem { Label("Account", systemImage: "person") }
          OrderView()
             .tabItem {Label("Order", systemImage:  "takeoutbag.and.cup.and.straw")}
             .badge(order.orderItems.count)
       }
    }
}

#Preview {
    AppetizerTabView()
}
