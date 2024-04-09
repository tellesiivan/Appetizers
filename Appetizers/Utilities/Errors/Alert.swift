//
//  Alert.swift
//  Appetizers
//
//  Created by Telles Ivan on 4/4/24.
//

import Foundation
import SwiftUI

struct AlertItem: Identifiable {
   let id = UUID()
   let title: Text
   let message: Text
   let dismmisButton: Alert.Button
}

struct AlertContext {
   // MARK: Network Alerts
   static let invalidUrl = AlertItem(title: Text("Invalid URL"), message: Text("Something went wrong when trying to rendered the required information."), dismmisButton: .default(Text("OK")))
   
   static let invalidData = AlertItem(title: Text("Invalid Data"), message: Text("Something went wrong when trying to rendered the required information."), dismmisButton: .default(Text("OK")))
   
   static let invalidResponse = AlertItem(title: Text("Invalid Response"), message: Text("There was an issue trying to make your request happen, try again later."), dismmisButton: .default(Text("OK")))
   
   static let unableToComplete = AlertItem(title: Text("Invalid URL"), message: Text("Please check your connection and try again later."), dismmisButton: .default(Text("OK")))
   
   // MARK: Account Validation Alerts
   static let invalidForm = AlertItem(title: Text("Invalid Form"), message: Text("Please ensure all fields in the form have been filled out."), dismmisButton: .default(Text("OK")))
   
   static let invalidEmail = AlertItem(title: Text("Invalid Email"), message: Text("Invalid Email Address"), dismmisButton: .default(Text("OK")))
}
