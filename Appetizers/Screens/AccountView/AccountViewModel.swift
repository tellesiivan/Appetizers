//
//  AccountViewModel.swift
//  Appetizers
//
//  Created by Telles Ivan on 4/9/24.
//

import SwiftUI
import Foundation

final class AccountViewModel: ObservableObject {
   // set it to typeof Data
   @AppStorage("user") private var userData: Data?
   
   @Published var user = User()
   @Published var alertItem: AlertItem?
   
   
   func saveChanges() {
      guard isFormValid else { return }
      do {
         let encodedUserData = try JSONEncoder().encode(user)
         userData = encodedUserData
         alertItem = AlertContext.userSaveSuccess
      } catch {
         alertItem = AlertContext.userSaveError
      }
      
   }
   
   func retrieveUserInfo() {
      guard let userData = self.userData else {return}
      do {
         // decode our preexisting user data info from @AppStorage
         self.user = try JSONDecoder().decode(User.self, from: userData)
      } catch {
         alertItem = AlertContext.userSaveError
      }
   }
   
   private var isFormValid: Bool {
      guard !user.firstName.isEmpty && !user.lastName.isEmpty && !user.emailAddress.isEmpty else {
         alertItem = AlertContext.invalidForm
         return false
      }
      guard user.emailAddress.isValidEmail else {
         alertItem = AlertContext.invalidEmail
         return false
      }
      return true
   }
   
}
