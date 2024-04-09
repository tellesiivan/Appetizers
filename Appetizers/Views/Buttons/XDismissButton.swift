//
//  XDismissButton.swift
//  Appetizers
//
//  Created by Telles Ivan on 4/9/24.
//

import SwiftUI

struct XDismissButton: View {
    var body: some View {
       ZStack{
          Circle()
             .frame(width: 40, height: 40)
             .foregroundStyle(Color.white)
             .shadow(radius: 40)
             .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
          Image(systemName: "xmark")
             .imageScale(.small)
             .frame(width: 44, height: 44)
             .foregroundStyle(Color.black)
       }
    }
}

#Preview {
    XDismissButton()
}
