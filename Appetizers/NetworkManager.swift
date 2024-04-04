//
//  NetworkManager.swift
//  Appetizers
//
//  Created by Telles Ivan on 4/3/24.
//

import Foundation
import UIKit

final class NetworkManager {
   static let shared = NetworkManager()
   private let cache = NSCache<NSString, UIImage>()
   
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
   
   func downloadImage(fromUrlString urlString: String, completed: @escaping (UIImage?) -> Void) {
      // set our cache key -> urlString
      let cacheKey = NSString(string: urlString)
      
      // if we have the image in the cache, get it by the cachekey and return
      // it without having to make a request for it
      if let image = cache.object(forKey: cacheKey) {
         completed(image)
         return;
      }
      
      // make sure we have a valid url string
      guard let url = URL(string: urlString) else {
         completed(nil)
         return
      }
      
      let task = URLSession.shared.dataTask(with: URLRequest(url: url)) {data, response, error in
         guard let data = data, let image = UIImage(data: data) else {
            completed(nil)
            return
         }
         // save it to the cache
         self.cache.setObject(image, forKey: cacheKey)
         completed(image)
      }
      task.resume()
   }
}
