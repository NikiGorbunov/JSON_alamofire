//
//  NetworkManager.swift
//  JSON_alamofire
//
//  Created by Никита Горбунов on 17.03.2022.
//

import Foundation
import Alamofire

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchDataWithAlamofire(_ url: String, completion: @escaping (Result<[Cocktail], NetworkError>) -> Void) {
        AF.request(Link.cocktailApi.rawValue)
            .validate()
            .responseJSON { dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    let drinkies = Cocktail.getCocktails(from: value)
                    DispatchQueue.main.async {
                        completion(.success(drinkies))
                    }
                case .failure:
                    completion(.failure(.decodingError))
                }
            }
    }
}
