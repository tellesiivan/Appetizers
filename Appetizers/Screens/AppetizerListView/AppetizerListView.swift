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
       ZStack {
          if #available(iOS 16.0, *) {
             NavigationStack {
                List(viewModel.appetizers) { appetizer in
                   AppetizerListCellView(appetizer: appetizer)
                      .onTapGesture {
                         viewModel.selectedAppetizer = appetizer
                         viewModel.isShowingDetails = true
                      }
                      .navigationTitle("🛰️ Appetizers")
                      .disabled(viewModel.isShowingDetails)
                }
             }
             .blur(radius:  viewModel.isShowingDetails ? 20 : 0)
             .onAppear {
                viewModel.getAppetizers()
             }
             .alert(item: $viewModel.alertItem) { alertItem in
                Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismmisButton)
             }
          } else {
             // Fallback on earlier versions
             NavigationView {
                List(viewModel.appetizers) { appetizer in
                   AppetizerListCellView(appetizer: appetizer)
                      .onTapGesture {
                         viewModel.selectedAppetizer = appetizer
                         viewModel.isShowingDetails = true
                      }
                      .navigationTitle("🛰️ Appetizers")
                      .disabled(viewModel.isShowingDetails)
                }
             }
             .blur(radius:  viewModel.isShowingDetails ? 20 : 0)
             .onAppear {
                viewModel.getAppetizers()
             }
             .alert(item: $viewModel.alertItem) { alertItem in
                Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismmisButton)
             }
          }
          
          if viewModel.isShowingDetails && (viewModel.selectedAppetizer != nil) {
             AppetizerDetailView(appetizer:  viewModel.selectedAppetizer!, isShowingDetails: $viewModel.isShowingDetails)
          }
       }
    }
   
}


