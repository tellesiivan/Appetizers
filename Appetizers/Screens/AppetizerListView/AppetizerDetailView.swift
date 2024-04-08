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
                   VStack(spacing:2){
                      Text("Calories")
                         .font(.caption)
                         .fontWeight(.medium)
                      Text(String(appetizer.calories))
                         .font(.headline)
                   }
                   VStack(spacing:2){
                      Text("Carbs")
                         .font(.caption)
                         .fontWeight(.medium)
                      Text(String(appetizer.carbs))
                         .font(.headline)
                   }
                   VStack(spacing:2){
                      Text("Protein")
                         .font(.caption)
                         .fontWeight(.medium)
                      Text(String(appetizer.protein))
                         .font(.headline)
                   }
                }
             }
             Spacer()
             Button{
                print("Tabbbed")
             } label: {
                Text("$\(appetizer.price, specifier: "%.2f") - Add to Order")
                   .font(.title3)
                   .frame(width: 300, height: 50)
                   .background(Color.brandPrimary)
                   .foregroundStyle(Color.white)
                   .clipShape(RoundedRectangle(cornerRadius: 12))
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
             .padding()
       })
    }
}

#Preview {
   AppetizerDetailView(appetizer: Mockdata.sampleAppetizer, isShowingDetails: .constant(true))
}
