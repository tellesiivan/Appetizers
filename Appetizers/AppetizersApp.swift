//
//  AppetizersApp.swift
//  Appetizers
//
//  Created by Telles Ivan on 4/1/24.
//

import SwiftUI

@main
struct AppetizersApp: App {
   var order = Order()
   
    var body: some Scene {
        WindowGroup {
            AppetizerTabView()
              .environmentObject(order)
        }
    }
}
