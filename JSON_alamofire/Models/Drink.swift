//
//  Drink.swift
//  JSON_alamofire
//
//  Created by Никита Горбунов on 17.03.2022.
//

import Foundation

struct Drink: Decodable {
    let drinks: [Cocktail]
}

struct Cocktail: Decodable {
    var strDrink: String?
    let strAlcoholic: String?
    var strGlass: String?
    let strInstructions: String?
    let strDrinkThumb: String?
    
    init(cocktailData: [String: Any]) {
        strDrink = cocktailData["strDrink"] as? String
        strAlcoholic = cocktailData["strAlcoholic"] as? String
        strGlass = cocktailData["strGlass"] as? String
        strInstructions = cocktailData["strInstructions"] as? String
        strDrinkThumb = cocktailData["strDrinkThumb"] as? String
    }
    
    static func getCocktails(from value: Any) -> [Cocktail] {
        guard let value = value as? [String: Any] else { return [] }
        guard let drinks = value["drinks"] as? [[String: Any]] else { return [] }
        return drinks.compactMap { Cocktail(cocktailData: $0) }
    }
}


enum Link: String {
    case cocktailApi = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=margarita"
}
