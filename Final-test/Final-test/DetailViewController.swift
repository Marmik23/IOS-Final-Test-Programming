//
//  DetailViewController.swift
//  Final-test
//
//  Created by Marmik Nalinkumar Patel on 2025-04-11.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var drinkImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var instructionsLabel: UILabel!
   
    var drinkId: String?
   
    override func viewDidLoad() {
        super.viewDidLoad()
        loadDrinkDetails()
    }
   
    func loadDrinkDetails() {
        guard let id = drinkId else { return }
       
        NetworkingManager.shared.fetchDrinkDetails(id: id) { [weak self] detail in
            guard let detail = detail else { return }
            self?.nameLabel.text = detail.strDrink
            self?.categoryLabel.text = "Category: \(detail.strCategory)"
            self?.typeLabel.text = "Type: \(detail.strAlcoholic)"
            self?.instructionsLabel.text = detail.strInstructions
            self?.loadImage(from: detail.strDrinkThumb)
        }
    }
   
    func loadImage(from urlString: String) {
        guard let url = URL(string: urlString) else { return }
       
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url) {
                DispatchQueue.main.async {
                    self.drinkImage.image = UIImage(data: data)
                }
            }
        }
    }
}
