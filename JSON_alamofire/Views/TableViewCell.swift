//
//  TableViewCell.swift
//  JSON_alamofire
//
//  Created by Никита Горбунов on 17.03.2022.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var drinkLabel: UILabel!
    
    // MARK: - Public methods
    func configure(with cocktail: Cocktail?) {
        drinkLabel.text = cocktail?.strDrink
    }
}
