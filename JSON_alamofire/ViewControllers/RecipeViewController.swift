//
//  RecipeViewController.swift
//  JSON_alamofire
//
//  Created by Никита Горбунов on 17.03.2022.
//

import UIKit

class RecipeViewController: UIViewController {
    
    @IBOutlet weak var drinkLabel: UILabel!
    @IBOutlet weak var alcoholLabel: UILabel!
    @IBOutlet weak var glassLabel: UILabel!
    
    @IBOutlet weak var recipeTextView: UITextView!
    @IBOutlet weak var imageView: UIImageView!
    
    
    
    var cocktail: Cocktail!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUserInterface()
    }
    
    func updateUserInterface() {
        drinkLabel.text = cocktail?.strDrink
        alcoholLabel.text = "Yes"
        if cocktail?.strAlcoholic != "Alcoholic" {
            alcoholLabel.text = "No"
        }
        glassLabel.text = cocktail?.strGlass
        recipeTextView.text = cocktail?.strInstructions
        
        DispatchQueue.global().async {
            guard let imageData = ImageManager.shared.fetchImage(from: self.cocktail.strDrinkThumb) else { return }
            DispatchQueue.main.async {
                self.imageView.image = UIImage(data: imageData)
            }
        }


    }
}


