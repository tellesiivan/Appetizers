//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Telles Ivan on 4/1/24.
//

import SwiftUI

struct AppetizerListView: View {
   @StateObject var viewModel = AppetizerListViewModel()
   @State private var isShowingDetails = false
   @State private var selectedAppetizer: Appetizer?
   
    var body: some View {
       ZStack {
          NavigationStack {
             List(viewModel.appetizers) { appetizer in
                AppetizerListCellView(appetizer: appetizer)
                   .onTapGesture {
                      selectedAppetizer = appetizer
                      isShowingDetails = true
                   }
                   .navigationTitle("🛰️ Appetizers")
                   .disabled(isShowingDetails)
             }
          }
          .blur(radius: isShowingDetails ? 20 : 0)
          .onAppear {
             viewModel.getAppetizers()
          }
          .alert(item: $viewModel.alertItem) { alertItem in
             Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismmisButton)
          }
          
          if isShowingDetails && (selectedAppetizer != nil) {
             AppetizerDetailView(appetizer: selectedAppetizer!, isShowingDetails: $isShowingDetails)
          }
       }
    }
   
}


