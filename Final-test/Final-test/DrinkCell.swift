//
//  DrinkCell.swift
//  Final-test
//
//  Created by Marmik Nalinkumar Patel on 2025-04-11.
//

import UIKit

class DrinkCell: UITableViewCell {
    @IBOutlet weak var drinkImageView: UIImageView!
    @IBOutlet weak var drinkNameLabel: UILabel!
   
    func configure(with drink: Drink) {
        print("Drink name: \(drink.strDrink)")
        drinkNameLabel.text = drink.strDrink
       
        if let url = URL(string: drink.strDrinkThumb) {
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: url) {
                    DispatchQueue.main.async {
                        self.drinkImageView.image = UIImage(data: data)
                    }
                }
            }
        }
    }
}
