//
//  ViewController.swift
//  Final-test
//
//  Created by Marmik Nalinkumar Patel on 2025-04-11.
//

import UIKit

class SearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak var tableView: UITableView!

    var drinks: [Drink] = []
    let searchController = UISearchController()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.searchController = searchController
        searchController.searchBar.delegate = self
        
        tableView.delegate = self
        tableView.dataSource = self
    }
   
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard !searchText.isEmpty else { return }
        NetworkingManager.shared.searchDrinks(ingredient: searchText) { [weak self] drinks in
            self?.drinks = drinks ?? []
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return drinks.count
    }
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DrinkCell", for: indexPath) as! DrinkCell
        let drink = drinks[indexPath.row]
        cell.configure(with: drink)
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail",
           let destVC = segue.destination as? DetailViewController,
           let indexPath = tableView.indexPathForSelectedRow {
            let drink = drinks[indexPath.row]
            destVC.drinkId = drink.idDrink
        }
    }
}
