//
//  NetworkManager.swift
//  Appetizers
//
//  Created by Telles Ivan on 4/3/24.
//

import Foundation

final class NetworkManager {
   static let shared = NetworkManager()
   
   static let baseUrl = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
   private let appetizerUrl = baseUrl + "appetizers"
   
   private init() {}
   
   
   func getAppetizers(completed: @escaping (Result<[Appetizer], APError>) -> Void) {
      
      guard let url = URL(string: appetizerUrl) else {
         completed(.failure(.invalidUrl))
         return
      }
      
      let task = URLSession.shared.dataTask(with: URLRequest(url: url)) {data, response, error in
         if error != nil {
            completed(.failure(.unabledToComplete))
            return
         }
         guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            completed(.failure(.invalidResponse))
            return
         }
         guard let apData = data else {
            completed(.failure(.invalidData))
            return
         }
        
         do {
            let decoder = JSONDecoder()
            let decodedResponse = try decoder.decode(AppetizerResponse.self, from: apData)
            completed(.success(decodedResponse.request))
         } catch {
            completed(.failure(.invalidData))
         }
      }
      task.resume()
   }
}
