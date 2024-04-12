//
//  ContentView.swift
//  Appetizers
//
//  Created by Telles Ivan on 4/1/24.
//

import SwiftUI

struct AppetizerTabView: View {
    var body: some View {
       TabView {
          AppetizerListView()
             .tabItem {
                Image(systemName: "house")
            	Text("Home")
             }
          AccountView()
             .tabItem {
                Image(systemName: "person")
                Text("Account")
             }
          OrderView()
             .tabItem {
                Image(systemName: "takeoutbag.and.cup.and.straw")
                Text("Order")
             }
       }
    }
}

#Preview {
    AppetizerTabView()
}
