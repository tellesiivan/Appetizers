//
//  AppetizerDetailView.swift
//  Appetizers
//
//  Created by Telles Ivan on 4/8/24.
//

import SwiftUI

struct AppetizerDetailView: View {
   let appetizer: Appetizer
   @Binding var isShowingDetails: Bool
   
    var body: some View {
       VStack{
          AppetizerRemoteImage(urlString: appetizer.imageURL)
             .aspectRatio(contentMode: .fit)
             .frame(width: 320, height: 225)
          VStack{
             VStack(spacing:20) {
                VStack(spacing:8){
                   Text(appetizer.name)
                      .font(.body)
                      .fontWeight(.semibold)
                   
                   Text(appetizer.description)
                      .font(.caption)
                      .multilineTextAlignment(.center)
                }
                HStack(spacing:40) {
                   NutritionInfo(title: "Calories", value: appetizer.calories)
                   NutritionInfo(title: "Carbs", value: appetizer.carbs)
                   NutritionInfo(title: "Protein", value: appetizer.protein)
                }
             }
             Spacer()
             Button{
                print("Tabbbed")
             } label: {
                APButton(title: "$\(appetizer.price, specifier: "%.2f") - Add to Order")
             }
          }
          .padding()
       }
       .frame(width: 320, height: 525)
       .background(Color(.systemBackground))
       .cornerRadius(16)
       .shadow(radius: 40)
       .overlay(alignment: .topTrailing, content: {
          Button{
             isShowingDetails = false
          } label: {
             XDismissButton()
          }
            .padding()
       })
    }
}

#Preview {
   AppetizerDetailView(appetizer: Mockdata.sampleAppetizer, isShowingDetails: .constant(true))
}

struct NutritionInfo: View {
   let title: String
   let value: Int
   
   var body: some View {
      VStack(spacing:2){
         Text(title)
            .font(.caption)
            .fontWeight(.medium)
         Text(String(value))
            .font(.headline)
      }
   }
}
