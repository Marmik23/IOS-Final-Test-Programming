//
//  Drink.swift
//  Final-test
//
//  Created by Marmik Nalinkumar Patel on 2025-04-11.
//

import Foundation

class DrinkResponse: Codable {
    var drinks: [Drink]?
}

class DrinkDetailResponse: Codable {
    var drinks: [DrinkDetail]?
}

class Drink: Codable {
    var idDrink: String
    var strDrink: String
    var strDrinkThumb: String
   
    init(idDrink: String, strDrink: String, strDrinkThumb: String) {
        self.idDrink = idDrink
        self.strDrink = strDrink
        self.strDrinkThumb = strDrinkThumb
    }
   
    enum CodingKeys: String, CodingKey {
        case idDrink
        case strDrink
        case strDrinkThumb
    }
   
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.idDrink = try container.decode(String.self, forKey: .idDrink)
        self.strDrink = try container.decode(String.self, forKey: .strDrink)
        self.strDrinkThumb = try container.decode(String.self, forKey: .strDrinkThumb)
    }
}

class DrinkDetail: Codable {
    var idDrink: String
    var strDrink: String
    var strCategory: String
    var strAlcoholic: String
    var strInstructions: String
    var strDrinkThumb: String

    init(idDrink: String, strDrink: String, strCategory: String,
         strAlcoholic: String, strInstructions: String, strDrinkThumb: String) {
        self.idDrink = idDrink
        self.strDrink = strDrink
        self.strCategory = strCategory
        self.strAlcoholic = strAlcoholic
        self.strInstructions = strInstructions
        self.strDrinkThumb = strDrinkThumb
    }
   
    enum CodingKeys: String, CodingKey {
        case idDrink
        case strDrink
        case strCategory
        case strAlcoholic
        case strInstructions
        case strDrinkThumb
    }
   
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.idDrink = try container.decode(String.self, forKey: .idDrink)
        self.strDrink = try container.decode(String.self, forKey: .strDrink)
        self.strCategory = try container.decode(String.self, forKey: .strCategory)
        self.strAlcoholic = try container.decode(String.self, forKey: .strAlcoholic)
        self.strInstructions = try container.decode(String.self, forKey: .strInstructions)
        self.strDrinkThumb = try container.decode(String.self, forKey: .strDrinkThumb)
    }
}
