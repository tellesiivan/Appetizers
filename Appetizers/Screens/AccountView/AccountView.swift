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
                TextField("First Name", text: $viewModel.user.firstName)
                TextField("Last Name", text: $viewModel.user.lastName)
                TextField("Email Address", text: $viewModel.user.emailAddress)
                   .keyboardType(.emailAddress)
                   .textInputAutocapitalization(.none)
                   .autocorrectionDisabled()
                DatePicker("Birthday", selection: $viewModel.user.birthdate, displayedComponents: .date)
                Button {
                   viewModel.saveChanges()
                } label: {
                   Text("Save Changes")
                }
             }
             Section(header:  Text("Requests")) {
                Toggle("Extra Napkins", isOn: $viewModel.user.extraNapkins)
                Toggle("Frequent Refills", isOn: $viewModel.user.frequentRefills)
             }
             .toggleStyle(SwitchToggleStyle(tint:.brandPrimary))

          }
          .navigationTitle("Account")
       }
       .onAppear() {
          viewModel.retrieveUserInfo()
       }
       .alert(item: $viewModel.alertItem) {alertItem in
          Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismmisButton)
       }
    }
}

#Preview {
    AccountView()
}
