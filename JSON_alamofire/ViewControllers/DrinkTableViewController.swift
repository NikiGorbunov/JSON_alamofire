//
//  DrinkTableViewController.swift
//  JSON_alamofire
//
//  Created by Никита Горбунов on 17.03.2022.
//

import UIKit

class DrinkTableViewController: UITableViewController {
    
    private var drink: Drink?

    override func viewDidLoad() {
        super.viewDidLoad()

        fetchData(from: Link.cocktailApi.rawValue)
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        drink?.drinks.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let recipe = drink?.drinks[indexPath.row]
        var content = cell.defaultContentConfiguration()
        
        content.text = recipe?.strDrink
        
        cell.contentConfiguration = content

        return cell
    }
    
// MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableView.indexPathForSelectedRow {
            let cocktails = drink?.drinks[indexPath.row]
            let recipeVC = segue.destination as! RecipeViewController
            recipeVC.cocktail = cocktails
        }
    }
    
// MARK: - Networking
    
    func fetchData(from url: String) {
        NetworkManager.shared.fetchDataWithAlamofire(url) { result in
            switch result {
            case .success(let cocktails):
                self.drink = cocktails
                self.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
}
