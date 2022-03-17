//
//  DrinkTableViewController.swift
//  JSON_alamofire
//
//  Created by Никита Горбунов on 17.03.2022.
//

import UIKit

class DrinkTableViewController: UITableViewController {
    
    private var drink: [Cocktail] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        fetchData(from: Link.cocktailApi.rawValue)
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        drink.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        let recipe = drink[indexPath.row]
        cell.configure(with: recipe)

        return cell
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
    
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
