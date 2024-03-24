//
//  NetworkManager.swift
//  Disney
//
//  Created by Jorge Palomino on 23/03/2024.
//

import Foundation
import UIKit

final class NetworkManager {
    static let shared = NetworkManager()
    private let cache = NSCache<NSString, UIImage>()
    
    static let baseURL = "https://api.disneyapi.dev/"
    
    private let characterURL = baseURL + "character"
    
    private init() {}

    
    enum NetworkError:Error {
        case invalidUrl
        case invalidResponse
    }
    
    func getCharacters(page: Int = 1) async throws -> CharacterResponse  {
        guard let url = URL(string: characterURL + "?page=\(page)") else {
            throw NetworkError.invalidUrl
        }
        
        let (data, _) =  try await URLSession.shared.data(from: url)
     
        print("Request made: \(url.absoluteString)")
        do {
            let decoder = JSONDecoder()
            let decodedResponse = try decoder.decode(CharacterResponse.self, from: data)
            return decodedResponse
        } catch {
            throw NetworkError.invalidResponse
        }
    }
    
    func downloadImage(fromURLString: String, completed: @escaping (UIImage?) -> Void) {
        
        let cacheKey = NSString(string:fromURLString)
        
        if let image = cache.object(forKey: cacheKey){
            completed(image)
            return
        }
        
        guard let url = URL(string: fromURLString) else {
            completed(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
           
            guard let data, let image = UIImage(data: data) else {
                completed(nil)
                return
            }
            
            self.cache.setObject(image, forKey: cacheKey)
            
            completed(image)
        }
        
        task.resume()
    }
}
