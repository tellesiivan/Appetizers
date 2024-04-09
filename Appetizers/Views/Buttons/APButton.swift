//
//  APButton.swift
//  Appetizers
//
//  Created by Telles Ivan on 4/9/24.
//

import SwiftUI

struct APButton: View {
   let title: LocalizedStringKey
   
    var body: some View {
       Text(title)
          .font(.title3)
          .frame(width: 300, height: 50)
          .background(Color.brandPrimary)
          .foregroundStyle(Color.white)
          .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

#Preview {
   APButton(title: "Hello")
}
