//
//  AccountView.swift
//  Appetizers
//
//  Created by Telles Ivan on 4/1/24.
//

import SwiftUI

struct AccountView: View {
   @StateObject var viewModel = AccountViewModel()

    var body: some View {
       NavigationStack {
          Form {
             Section(header:  Text("Account view")) {
                TextField("First Name", text: $viewModel.firstName)
                TextField("Last Name", text: $viewModel.lastName)
                TextField("Email Address", text: $viewModel.emailAddress)
                   .keyboardType(.emailAddress)
                   .textInputAutocapitalization(.none)
                   .autocorrectionDisabled()
                DatePicker("Birthday", selection: $viewModel.birthdate, displayedComponents: .date)
                Button {
                   viewModel.saveChanges()
                } label: {
                   Text("Save Changes")
                }
             }
             Section(header:  Text("Requests")) {
                Toggle("Extra Napkins", isOn: $viewModel.extraNapkins)
                Toggle("Frequent Refills", isOn: $viewModel.frequentRefills)
             }
             .toggleStyle(SwitchToggleStyle(tint:.brandPrimary))

          }
          .navigationTitle("Account")
       }
       .alert(item: $viewModel.alertItem) {alertItem in
          Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismmisButton)
       }
    }
}

#Preview {
    AccountView()
}
