//
//  EmptyState.swift
//  Appetizers
//
//  Created by Telles Ivan on 4/11/24.
//

import SwiftUI

struct EmptyState: View {
    var message = "Something went wrong!"
    var imageName = "empty-order"
   
    var body: some View {
       ZStack {
          Color(.secondarySystemBackground)
             .ignoresSafeArea(.all)
          VStack(spacing: 28) {
             Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 150)
             Text(message)
                .font(.title3)
                .fontWeight(.medium)
                .multilineTextAlignment(.center)}
          		.foregroundStyle(.secondary)
       }
    }
}

#Preview {
    EmptyState()
}
