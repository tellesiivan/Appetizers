//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by Telles Ivan on 4/3/24.
//

import Foundation

final class AppetizerListViewModel: ObservableObject {
   @Published var appetizers: [Appetizer] = [];
   @Published var alertItem: AlertItem?

   func getAppetizers() {
      NetworkManager.shared.getAppetizers {[self] result in
         DispatchQueue.main.async {
            switch result {
               case .success(let appetizers):
                  self.appetizers = appetizers;
               case .failure(let error):
                  switch error {
                     case .invalidData:
                        self.alertItem = AlertContext.invalidData
                     case .invalidUrl:
                        self.alertItem = AlertContext.invalidUrl
                     case .invalidResponse:
                        self.alertItem = AlertContext.invalidResponse
                     case .unabledToComplete:
                        self.alertItem = AlertContext.invalidData
                  }
                  print(error.localizedDescription)
            }
         }
      }
   }
   
   
}
