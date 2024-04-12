//
//  AppetizerListCellView.swift
//  Appetizers
//
//  Created by Telles Ivan on 4/3/24.
//

import SwiftUI

struct AppetizerListCellView: View {
   var appetizer: Appetizer

    var body: some View {
       HStack(spacing: 12) {
          AppetizerRemoteImage(urlString: appetizer.imageURL)
             .aspectRatio(contentMode: .fit)
             .frame(width: 110, height: 80)
             .cornerRadius(9)
          VStack(alignment: .leading) {
             Text(appetizer.name)
                .font(.subheadline)
                .fontWeight(.medium)
             Text("$\(appetizer.price, specifier: "%.2f")")
                .fontWeight(.semibold)
                .font(.footnote)
                .foregroundStyle(Color.secondary)
          }
       }
   
    }
}

#Preview {
   AppetizerListCellView(appetizer: Mockdata.sampleAppetizer)
}
