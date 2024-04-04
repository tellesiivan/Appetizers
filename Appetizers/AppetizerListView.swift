//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Telles Ivan on 4/1/24.
//

import SwiftUI

struct AppetizerListView: View {
   @StateObject var viewModel = AppetizerListViewModel()
   
    var body: some View {
       NavigationStack {
          List(viewModel.appetizers) { appetizer in
             AppetizerListCellView(appetizer: appetizer)
          .navigationTitle("🛰️ Appetizers")
         }
       }
       .onAppear {
          viewModel.getAppetizers()
       }
       .alert(item: $viewModel.alertItem) { alertItem in
          Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismmisButton)
       }
    }
   
}


