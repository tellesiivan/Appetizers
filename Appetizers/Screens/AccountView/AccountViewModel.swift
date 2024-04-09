//
//  AccountViewModel.swift
//  Appetizers
//
//  Created by Telles Ivan on 4/9/24.
//

import SwiftUI
import Foundation

final class AccountViewModel: ObservableObject {
   @Published var firstName = ""
   @Published var lastName = ""
   @Published var emailAddress = ""
   @Published var birthdate = Date()
   @Published var extraNapkins = false
   @Published var frequentRefills = false
   
   @Published var alertItem: AlertItem?
   
   var isFormValid: Bool {
      guard !firstName.isEmpty && !lastName.isEmpty && !emailAddress.isEmpty else {
         alertItem = AlertContext.invalidForm
         return false
      }
      guard emailAddress.isValidEmail else {
         alertItem = AlertContext.invalidEmail
         return false
      }
      return true
   }
   
   func saveChanges() {
      guard isFormValid else { return }
      print("Changes have been saved")
   }
}
