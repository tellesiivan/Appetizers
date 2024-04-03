//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by Telles Ivan on 4/3/24.
//

import Foundation

final class AppetizerListViewModel: ObservableObject {
   @Published var appetizers: [Appetizer] = [];

   func getAppetizers() {
      NetworkManager.shared.getAppetizers { result in
         DispatchQueue.main.async {
            switch result {
               case .success(let appetizers):
                  self.appetizers = appetizers;
               case .failure(let error):
                  print(error.localizedDescription)
            }
         }
      }
   }
   
}