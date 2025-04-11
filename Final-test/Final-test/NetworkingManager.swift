//
//  NetworkingManager.swift
//  Final-test
//
//  Created by Marmik Nalinkumar Patel on 2025-04-11.
//

import Foundation

class NetworkingManager {
    static let shared = NetworkingManager()
   
    func searchDrinks(ingredient: String, completion: @escaping ([Drink]?) -> Void) {
        guard let url = URL(string: "https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=\(ingredient.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")") else {
            completion(nil)
            return
        }
       
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
           
            do {
                let result = try JSONDecoder().decode(DrinkResponse.self, from: data)
                DispatchQueue.main.async {
                    completion(result.drinks)
                }
            } catch {
                print("Decoding error: \(error)")
                completion(nil)
            }
        }.resume()
    }
   
    func fetchDrinkDetails(id: String, completion: @escaping (DrinkDetail?) -> Void) {
        guard let url = URL(string: "https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=\(id)") else {
            completion(nil)
            return
        }
       
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
           
            do {
                let result = try JSONDecoder().decode(DrinkDetailResponse.self, from: data)
                DispatchQueue.main.async {
                    completion(result.drinks?.first)
                }
            } catch {
                print("Decoding error: \(error)")
                completion(nil)
            }
        }.resume()
    }
}
