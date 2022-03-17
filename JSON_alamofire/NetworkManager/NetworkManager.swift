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
    
    func fetchDataWithAlamofire(_ url: String, completion: @escaping (Result<Drink, NetworkError>) -> Void) {
        AF.request(Link.cocktailApi.rawValue)
            .validate()
            .responseJSON { dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    let drinkies = Drink.init(drinks: Cocktail.getCocktails(from: value))
                    DispatchQueue.main.async {
                        completion(.success(drinkies))
                    }
                case .failure:
                    completion(.failure(.decodingError))
                }
            }
    }
}

class ImageManager {
    static var shared = ImageManager()

    private init() {}

    func fetchImage(from url: String?) -> Data? {
        guard let stringURL = url else { return nil }
        guard let imageURL = URL(string: stringURL) else { return nil }
        return try? Data(contentsOf: imageURL)
    }
}
